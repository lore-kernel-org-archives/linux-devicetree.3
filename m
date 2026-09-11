Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD4C44CAC1
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115769; cv=none; b=MI0BI8dgHJtv6UyjhdFFEEk0KkNGoSyrHnkuK+ooTp69stk/z7igZ4BQZekul4PzviHkUqo50NRU/7CjfElLZmx63PF86vEmgNZG2LTknOkCFzZ6m4XB+11weo3fF69zbu+a4+PviCYJSocJX7DHg0R+i7LGIBPlVGCN+oJv5pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115769; c=relaxed/simple;
	bh=8golxYO/aO0dtVPL/6aXFu07J3JhMF69AESUsYeRFVI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JNjW9FUj+aWZDp+sVsMRPcsSCYG6C8vw0g2T1fYw4zS7Mflf0nBy90AuLx+FzfQxCDs2G4DmA0MFgf+A5rBVnsrzOxCz/QYxmXwPxIOq9xtsZJHxiBT1uRpPYdsu/Es3w3s06xrNHERuuxvTWBajg1H3D1c8j261t/BISVOqhG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qn6WMYzl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qn6WMYzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60081F00893;
	Fri, 11 Sep 2026 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789115767;
	bh=9vzu5NIdDs1lUvES211yaWd9jL0sBjeRj3CSRO4Wl4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qn6WMYzlFGMizSBfq3Gj1lWfmz4RnE46N18hM8zjDLz9eIDJSMWqwrhrpJcXJLbGI
	 8EEc/1WxNKqfwESfowZHJO0qd6ptzb0eI9LSL0jYToEvt9lAGqGHFnaMV2OXoGTes1
	 xddr0VHkHJu9Py0HXMobjBRdZcgMp//+BUehdFy03/I0pAgpF5JW4YEhi1t0H4m2pa
	 5OjgP/vYVRPezoUb5mUMsCwAubUwb3pSGWbHaFeON70niONDJJaPK6nc4SCnKZkGUo
	 qTinL2uI/mHMayhhaIAyQKpKBxoRVKAFrU3r+slUIMCWitCdAwQ8EZs+DBAVaTTY8s
	 VGFJ+BrtGgqbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] soundwire: qcom: program MM_SYNC for multi-master
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <c6372f2e597585241e077405c234adf1fa445b68.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
 <c6372f2e597585241e077405c234adf1fa445b68.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 08:36:06 +0000
Message-Id: <20260911083606.B60081F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [High] Missing state restoration for the dependent multi-master controlle=
r on runtime resume.
- [High] Undefined behavior due to negative bitwise shift in the BIT() macr=
o for controller_id.
- [High] Unconditional write to V3-specific SoundWire configuration registe=
rs on all hardware versions.
- [High] Lack of synchronization around cross-device pointer access leads t=
o Use-After-Free during concurrent unbind.
- [High] Probe order race leads to permanent probe failure due to strict dr=
iver pointer check.

Pre-existing issues:
- [High] Threaded IRQ handler is not explicitly canceled before freeing the=
 SoundWire bus, leading to Use-After-Free.
- [High] Missing PM runtime disable in the driver removal path leaves backg=
round tasks active, causing Use-After-Free.
- [High] The main threaded IRQ handler accesses hardware registers without =
ensuring the power domain is runtime active.
--

commit 5ac190feb87d94b0d9cbff783e9a732e35943dc4
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

soundwire: qcom: program MM_SYNC for multi-master

This commit configures the SWRM_V3_MM_SYNC_CONFIG register to allow primary
and dependent frame generators to lock to a single SWR_CLK. It programs the
sync config at initialization and re-applies it on resume, as the register
state is lost during clock stop.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a5f39868161af..3b9b1a53b0825 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
[ ... ]
> @@ -892,6 +904,37 @@ static bool swrm_wait_for_frame_gen_enabled(struct q=
com_swrm_ctrl *ctrl)
>  	return false;
>  }
> =20
> +static void qcom_swrm_program_mm_sync(struct qcom_swrm_ctrl *ctrl)
> +{
> +	struct qcom_swrm_ctrl *peer =3D ctrl->peer_ctrl;
> +	u32 conn_mask;
> +
> +	if (!peer)
> +		return;
> +
> +	conn_mask =3D BIT(peer->bus.controller_id - 1) &
> +		    SWRM_V3_MM_SYNC_CONNECTED_MASTER_MASK;

[Severity: High]
Does this code invoke undefined behavior with a negative shift?

If the hardware version is <=3D 1.3.0, or if SWRM_COMP_MASTER_ID evaluates
to 0, controller_id becomes -1 or 0. This causes
BIT(peer->bus.controller_id - 1) to compute BIT(-2) or BIT(-1).

> +
> +	if (ctrl->is_primary) {
> +		ctrl->reg_write(ctrl, SWRM_V3_MM_SYNC_CONFIG, conn_mask);
> +		ctrl->reg_write(ctrl, SWRM_V3_COMP_FEATURE_CFG,
> +				SWRM_V3_COMP_FEATURE_CFG_BASE |
> +				SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN |
> +				SWRM_V3_COMP_FEATURE_CFG_CLK_PIN_AVAIL |
> +				SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE);

[Severity: High]
Could this unconditionally write to V3-specific SoundWire configuration
registers on all hardware versions?

Writing to V3-specific configuration registers (0x108 and 0x10) on older
hardware versions (e.g., V1.3 or V1.5) may corrupt unrelated registers
mapped at those offsets or trigger bus faults.=20

Can we verify that ctrl->version indicates a V3 (or compatible) hardware
revision before writing these registers?

> +		return;
> +	}
> +
> +	ctrl->reg_write(ctrl, SWRM_V3_MM_SYNC_CONFIG,
> +			SWRM_V3_MM_SYNC_IS_DEPENDENT_MASTER |
> +			SWRM_V3_MM_SYNC_MASK_CONTROL_BITS | conn_mask);
> +
> +	ctrl->reg_write(ctrl, SWRM_V3_COMP_FEATURE_CFG,
> +			SWRM_V3_COMP_FEATURE_CFG_BASE |
> +			SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN |
> +			SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE);
> +}
> +
[ ... ]
> @@ -1909,6 +1954,8 @@ static int __maybe_unused swrm_runtime_resume(struc=
t device *dev)
>  	} else {
>  		reset_control_reset(ctrl->audio_cgcr);
> =20
> +		qcom_swrm_program_mm_sync(ctrl);

[Severity: High]
Does this code miss state restoration for the dependent multi-master
controller on runtime resume?

When the primary device undergoes a runtime PM suspend and resume, this
restores the primary controller's MM_SYNC configuration. However, the
required setup for the dependent controller (ctrl->peer_ctrl) is
missing.

Because the dependent master returns early in qcom_swrm_probe() without
calling pm_runtime_enable(dev), the PM core never calls its own resume
callback:

drivers/soundwire/qcom.c:qcom_swrm_probe() {
    ...
    if (of_property_match_string(dev->of_node, "qcom,multi-master-mode",
                                 "dependent") >=3D 0) {
        ctrl->is_dependent =3D true;
        ...
        return 0;
    }
    ...
}

Will this cause multi-master synchronization to fail after the first
suspend/resume cycle, breaking the shared bus?


[Severity: High]
Is there a lack of synchronization around cross-device pointer access
that leads to a use-after-free during concurrent unbind?

drivers/soundwire/qcom.c:qcom_swrm_multi_master_setup() {
    ...
    peer =3D platform_get_drvdata(pdev);
    if (!peer || !peer->is_dependent) {
    ...
}

The dependent controller's devm-allocated driver data is retrieved and
dereferenced locklessly, leaving a race window for it to be freed
before device link creation.

If the dependent device unbinds concurrently (e.g., via sysfs), the ctrl
memory is freed by devres, leaving peer as a dangling pointer before the
device link can be created.


[Severity: High]
Does a probe order race lead to permanent probe failure due to this
strict driver pointer check?

drivers/soundwire/qcom.c:qcom_swrm_multi_master_setup() {
    ...
    if (pdev->dev.driver !=3D ctrl->dev->driver) {
        ret =3D -EINVAL;
        goto out;
    }
    ...
}

Because devices probe asynchronously, the dependent controller may not
be bound to its driver yet (making its driver pointer NULL). This
evaluates to true and triggers an -EINVAL return instead of correctly
returning -EPROBE_DEFER, breaking the standard kernel probe deferral
mechanism.


[Severity: High]
This isn't a bug introduced by this patch, but is the threaded IRQ
handler not explicitly canceled before freeing the SoundWire bus?

drivers/soundwire/qcom.c:qcom_swrm_remove() {
    ...
    sdw_bus_master_delete(&ctrl->bus);
    clk_disable_unprepare(ctrl->hclk);
    ...
}

The threaded IRQ handler (requested via devm_request_threaded_irq) is
not explicitly disabled before sdw_bus_master_delete(&ctrl->bus) and
clk_disable_unprepare() in the driver removal path.

If an interrupt fires concurrently or is pending, qcom_swrm_irq_handler()
will execute on a deleted bus and disabled clock, leading to a
use-after-free and potential list corruption inside the SoundWire core,
or bus faults accessing disabled clocks.


[Severity: High]
This is a pre-existing issue, but does missing PM runtime disable in
the driver removal path leave background tasks active, causing a
use-after-free?

drivers/soundwire/qcom.c:qcom_swrm_remove() {
    struct qcom_swrm_ctrl *ctrl =3D dev_get_drvdata(&pdev->dev);
    ...
}

The qcom_swrm_probe() function manually enables PM runtime and
auto-suspend via pm_runtime_enable(dev), but qcom_swrm_remove() never
calls pm_runtime_disable(dev).

After remove() completes, devres frees the ctrl memory. An active
auto-suspend timer can fire subsequently, calling
swrm_runtime_suspend(), which dereferences the freed ctrl structure.


[Severity: High]
This isn't a bug introduced by this patch, but does the main threaded
IRQ handler access hardware registers without ensuring the power domain
is runtime active?

drivers/soundwire/qcom.c:qcom_swrm_irq_handler() {
    ...
    ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
                   &intr_sts);
    ...
}

qcom_swrm_irq_handler() executes asynchronously and reads hardware
registers like SWRM_REG_INTERRUPT_STATUS.

If PM runtime suspends the device power domain before the handler
thread executes, reading registers on a powered-off domain will fault,
as it fails to use pm_runtime_get_sync() or pm_runtime_get_if_active()
to guarantee the power domain is on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789114385.gi=
t.srinivas.kandagatla@oss.qualcomm.com?part=3D3
