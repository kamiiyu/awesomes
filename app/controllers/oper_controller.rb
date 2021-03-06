class OperController < ApplicationController
  before_action :mem_login

  def para
    {:opertyp=> params[:opertyp],:typ=> params[:typ],:idcd=> params[:idcd],:mem_id=> current_mem.id}
  end

  def whether
    render json: Oper.where(para).count > 0
  end

  def update
    if (_tmp = _oper = Oper.find_by(para))
      _oper.destroy
    else
      _tmp = Oper.create(para)
    end
    render json: {
      state: Oper.where(para).count > 0,
      count: _tmp.update_target
    }
  end
end
