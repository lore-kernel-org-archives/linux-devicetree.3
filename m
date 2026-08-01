Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D398F2EAB6F
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 07:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785570677; cv=none; b=R7vTxz9/4NcAVei0aP238cMszyl5AqJlHJ61/bdVOPRiFvM+7UnNRbeeyZ+ThLhmrev2yUGt8GOp+Qk2prUqSJA36jvLkeu6O+ShUYY5lnslWojakzGiesEiN6II5Y8+p3Ub/3iIM+QFaqoFQcdtFJdXRuusyxTULr7bjXZazPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785570677; c=relaxed/simple;
	bh=nQW03wDBxwl2O8UeAEFnUAAAB7/HXBeSrT0IHpwLfoA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TUpLC//t+XbXm04/0lmx+9Wcs11KeXBqZmlMtV1xW5gDLQ3EwgMTcmLn57xOgcIk5g/GQeojrboOgTgaDllsQghFSZgeoqI8qn0dHX4IYq5sNKQLADGeKi4njB9g9Rxv0cctswpUOJwW4N7dUQBq1oi6kUihxm6OmR/bFh1dPrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxrISrmV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxrISrmV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA6C1F00AC4;
	Sat,  1 Aug 2026 07:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785570675;
	bh=H8c79OU77ctvTVRnuZ6cNSTbqymi6Jzf7ZBcTi5H3o4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fxrISrmVThmUhquyQZCGMJSZKsRcrEJClEm/Lx6vd59aXiQonwLzWQ6WM8Ow+voLD
	 +jj4rXMOBsNr0c5NEVkrWxXcCDqqRfWcX6e+qrHu3pVP3lybSGoP56iZ4p4lxS/f7v
	 WwAppLsJjEznEIGkYGd2oZeNhdGJl6bpOoBQ9Zg6OxtW9FPh0XQLimU7pN8jt3Lz7s
	 WiedCA6qOdug0nyD5dfA4HU1cjjktVLDQ3eONzhsxCtnko7eiOkSfQheg71BRct1yp
	 PegEGUPxFmmt8PTtOybPbemRklTgB4OEsJTZrtRX5RjG57EoOqfpRdvWprQDunBUHI
	 ddrX2IOJsR4WA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] media: iris: Fix power-off ordering to disable
 power domain after clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260801-iris-fixes-dma-pseq-fint-v1-3-aba0cb22f6ab@oss.qualcomm.com>
References: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
 <20260801-iris-fixes-dma-pseq-fint-v1-3-aba0cb22f6ab@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 07:51:14 +0000
Message-Id: <20260801075115.0CA6C1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Use-After-Free of `iris_core` when user-space holds V4L2 devic=
e open during driver unbind.
- [High] Incomplete fix for power-off hardware hangs in nested VPU3x functi=
ons.
- [High] Use-After-Free due to missing cancellation of `sys_error_handler` =
delayed work.
- [High] AB-BA deadlock between `disable_irq()` and `core->lock`.
- [High] Hardware hang due to premature OPP rate drop nullifying the patch'=
s clock ordering fix.
- [High] Hardware resets are triggered on unclocked and unpowered domains.
--

--- Patch [3]: [PATCH 3/4] media: iris: Fix power-off ordering to disable p=
ower domain after clocks ---
commit 21b9f8f2d0a12300785d96896a5ff556ccf1532a
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Fix power-off ordering to disable power domain after clocks

This patch reorders the power-off sequence in iris_vpu_power_off_hw() to
ensure that clocks are disabled before removing the power domain. This avoi=
ds
hardware hangs that occur when disabling clock controllers without power.

Cc: stable@vger.kernel.org

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers=
/media/platform/qcom/iris/iris_vpu_common.c
> index e4847c1077097..3cd493b06d84c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -223,10 +223,10 @@ int iris_vpu_power_off_controller(struct iris_core =
*core)
>  void iris_vpu_power_off_hw(struct iris_core *core)
>  {
>  	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAI=
N], false);
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_PO=
WER_DOMAIN]);
>  	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_PO=
WER_DOMAIN]);
>  }
> =20
>  void iris_vpu_power_off(struct iris_core *core)
>  {
>  	iris_opp_set_rate(core->dev, 0);

[Severity: High]
This isn't a bug introduced by this patch, but does calling
iris_opp_set_rate() drop the OPP performance state and voltage before
power_off_hw() disables the active hardware clocks?

If high-frequency clocks run with insufficient voltage before being disable=
d,
could this negate the structural fix and cause the same hardware hang during
suspension or teardown?

>  	core->iris_platform_data->vpu_ops->power_off_hw(core);
>  	core->iris_platform_data->vpu_ops->power_off_controller(core);
>  	iris_unset_icc_bw(core);
> =20
>  	if (!iris_vpu_watchdog(core, core->intr_status))
>  		disable_irq(core->irq);

[Severity: High]
This is a pre-existing issue, but does disable_irq() synchronize and wait f=
or
the threaded IRQ handler to complete while holding core->lock?

If iris_core_deinit() holds core->lock and calls iris_vpu_power_off():

iris_core_deinit()
    mutex_lock(&core->lock);
    iris_vpu_power_off(core);
        disable_irq(core->irq);

And concurrently, a hardware interrupt fires and wakes the threaded handler:

iris_hfi_isr_handler()
    mutex_lock(&core->lock);

Will this cause a deadlock between the interrupt handler and
iris_core_deinit()?

>  }

While reviewing this, I noticed similar pre-existing issues in other areas =
of
the driver:

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a similar pattern =
in
iris_vpu3x.c where the power domain is disabled before clocks:

iris_vpu33_power_off_controller() {
...
disable_power:
	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POW=
ER_DOMAIN]);
	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
...
}

Does this leave the same reverse-ordering problem where IRIS_CTRL_POWER_DOM=
AIN
is disabled before IRIS_AXI_CLK is unprepared?

Similarly, in iris_vpu35_power_off_hw():

iris_vpu35_power_off_hw() {
...
	iris_vpu33_power_off_hardware(core);

	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
...
}

Does disabling the clocks after iris_vpu33_power_off_hardware() has already
removed the hardware power domain result in the same hardware hang?

[Severity: High]
This is a pre-existing issue, but in iris_vpu_common.c, does triggering
reset_control_bulk_reset() after the clocks and power domain have already b=
een
disabled violate hardware constraints and risk a bus lockup?

iris_vpu35_vpu4x_power_off_controller() {
...
disable_power:
	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
...
	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POW=
ER_DOMAIN]);

	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
...
}

[Severity: Critical]
This isn't a bug introduced by this patch, but in iris_probe.c, if user-spa=
ce
holds a file descriptor open on the video node during driver unbind, will
devres free the core structure while the video_device stays alive?

iris_remove() {
...
	iris_core_deinit(core);
	video_unregister_device(core->vdev_dec);
	video_unregister_device(core->vdev_enc);
	v4l2_device_unregister(&core->v4l2_dev);
	mutex_destroy(&core->lock);
...
}

If the file descriptor is subsequently closed, iris_remove_session() is
invoked:

iris_remove_session() {
...
	struct iris_core *core =3D inst->core;
	struct iris_inst *iter, *temp;

	mutex_lock(&core->lock);
...
}

Will this result in a use-after-free when attempting to acquire core->lock?

[Severity: High]
This is a pre-existing issue, but in iris_remove(), is there a missing call
to cancel_delayed_work_sync(&core->sys_error_handler)?

If devres frees core, and the delayed work subsequently runs
iris_sys_error_handler(), could this also trigger a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-iris-fixes=
-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com?part=3D3
