class TablesController < ApplicationController
  def index
    @q = Table.ransack params[:q]
    @tables = @q.result.page(params[:page]).per(Settings.paginate.table_perpage) if @q.result
  end
end
