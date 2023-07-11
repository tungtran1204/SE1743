<div
    class="tab-pane fade"
    id="home"
    role="tabpanel"
    aria-labelledby="home-tab"
    style="margin-top: 50px"
    >
    <div class="row">
        <div class="col-md-6">
            <label style="color: #36424c"><i class="fa-solid fa-envelope icon"></i>Email</label>
        </div>
        <div class="col-md-6">
            <h5 style="color: #6C757D">${sessionScope.accountCur.accountEmail}</h5>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <label style="color: #36424c"><i class="fa-solid fa-signature icon"></i> Name</label>
        </div>
        <div class="col-md-4">
            <h5 style="color: #6C757D">${sessionScope.accountDetail.accountDetailName}</h5>
        </div>
        
    </div>
    <div class="row">
        <div class="col-md-6">
            <label style="color: #36424c"
                ><i class="fa-solid fa-calendar-days icon"></i> Date Of
                Birth</label
            >
        </div>
        <div class="col-md-4">
            <h5 style="color: #6C757D">${sessionScope.accountDetail.accountDetailDob}</h5>
        </div>

    </div>
    <div class="row">
        <div class="col-md-6">
            <label style="color: #36424c"
                ><i class="fa-solid fa-calendar-days icon"></i> Date Of
                Creation</label
            >
        </div>
        <div class="col-md-6">
            <h5 style="color: #6C757D">${sessionScope.accountDetail.accountDetailDoc}</h5>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <label style="color: #36424c"><i class="fa-solid fa-lock icon"></i> Pass Word</label>
        </div>
        <div class="col-md-6">
            <h5  style="color: #6C757D">
                <a
                    data-toggle="modal"
                    data-target="#changePasswordModal"
                    href="javascript:void(0)"
                    style="color: #5d768d; font-size: 85%"
                    >Change password</a
                >
            </h5>
        </div>
    </div>
</div>