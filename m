Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED67367295
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942345; cv=none; b=QOrEllYYCHFj8FYwyyrX5qIUkIEttn9DLz2PCuwIsns3zzw+NSQqNoggnPHoJRLvvVMsaepOBhoH6RJqctxPdeXofedqYVcUDnJ6Ae51pSqyi8lVY++sl+dvVqpd/jk0hyWkfxT12cnl1qNYm2+2RCjIsDTtqnfgh/HAJ6qKx30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942345; c=relaxed/simple;
	bh=PozAsDVYNX0qVEfnvUXBw31pqBuyPfSY2hnGbfTeSWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oGp0ALTHwD2xKtBoOxP6k9GGfOKjYJcmw22w1vtKxRrVONDdG1GKTwIiJByBCCziDvnZ5PPHvG1oifYPR6ZHyCi1yMA3CkGgSr0AyeWuc0+oyCGUpPXY552untsUHjsAjaAf49H/zwg42oDJ1OioIc5F9wNniRU1yB4iBjsxc3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGIz76Zo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGIz76Zo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5B31F008A4;
	Mon,  8 Jun 2026 18:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780942343;
	bh=JbG/1njiIe85DoTIuEgzAfsylhxt+0EqyYqOUouPwcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JGIz76ZoxNGInm9rV+AzxJVje7HaCOLCjfMN5zwtQYA0tYcLTdXMKb6iKdw4tcbiB
	 ghE3Z/TnLYYV1a0KCw52TZ/TkKCVH7a/tb5OhOqH6iCHNXZyqz2vWHMN6ajmkvuuF2
	 RaHG5iDbEOSmR3DJsvaB2QrCkjAvEw96fO21VbQxhJZMznah2xsbp2ZrGlcdkkb8ZY
	 vvthi9purvb0bcdGU9MfGyBLQhQYc/g2eV9tb9OwMcSD/GswS9V7PdVFyeFEgqiZEy
	 mnalXmdQOyaDaToT8hkXBvzGNJPxd0hFaP+NbreTjQ2dWsoGDbXf3jp5wxIIEx7tCe
	 PXRr3ipdLjzNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] soundwire: qcom: add EE-aware register layout
 and cpu selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 18:12:22 +0000
Message-Id: <20260608181223.3F5B31F008A4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Data race on `ctrl->intr_mask` between threaded interrupt handler =
and PM runtime callbacks.
- [High] Missing NULL pointer validation for `data` from `of_device_get_mat=
ch_data()`, leading to a NULL pointer dereference crash.
--

commit 2b9927d4b6910f9c0442ddebd7fb189132946df1
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

soundwire: qcom: add EE-aware register layout and cpu selection

This commit adds support for selecting the SoundWire execution environment
from the device tree and adjusts register windows based on the EE value.
For v2.0+ hardware, the IRQ, FIFO, and status register layout is offset by
the EE window stride.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 3d8f5a81eff19..f4b8ff77bc2f8 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c

[ ... ]

> @@ -1545,7 +1578,22 @@ static int qcom_swrm_probe(struct platform_device =
*pdev)
>  		return -ENOMEM;
> =20
>  	data =3D of_device_get_match_data(dev);
> +	ctrl->ee =3D SWRM_EE_CPU;
> +	ret =3D of_property_read_u32(dev->of_node, "qcom,swr-master-ee-val", &c=
trl->ee);
> +	if (ret)
> +		ret =3D of_property_read_u32(dev->of_node, "qcom,ee", &ctrl->ee);
> +	if (ret)
> +		ctrl->ee =3D SWRM_EE_CPU;
> +	if (ctrl->ee > SWRM_MAX_EE) {
> +		dev_warn(dev, "invalid SoundWire EE %u, using EE%u\n",
> +			 ctrl->ee, SWRM_EE_CPU);
> +		ctrl->ee =3D SWRM_EE_CPU;
> +	}
>  	ctrl->max_reg =3D data->max_reg;

[Severity: High]
This isn't a bug introduced by this patch, but could this dereference of
data->max_reg cause a NULL pointer crash?

If the device is bound to the driver manually via sysfs (e.g., by writing to
driver_override), the platform bus falls back to matching by name rather th=
an
the device tree.

In this case, dev->of_node is missing, and of_device_get_match_data() retur=
ns
NULL.

Does this data pointer need to be validated before being dereferenced?

> +	/*
> +	 * Defer EE register window selection until HW version is known.
> +	 * For v2.0+ the IRQ/FIFO window is EE-banked.
> +	 */
>  	ctrl->reg_layout =3D data->reg_layout;

[ ... ]

> @@ -1733,16 +1782,19 @@ static int __maybe_unused swrm_runtime_resume(str=
uct device *dev)
>  		reset_control_reset(ctrl->audio_cgcr);
> =20
>  		if (ctrl->version =3D=3D SWRM_VERSION_1_7_0) {
> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>  			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
> -					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
> +					SWRM_MCP_BUS_CLK_START << ctrl->ee);
>  		} else if (ctrl->version >=3D SWRM_VERSION_2_0_0) {
> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> -			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
> +			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
> +					((int)ctrl->ee - SWRM_EE_CPU) *
> +					SWRM_V2_REG_EE_STRIDE,
>  					SWRM_V2_0_CLK_CTRL_CLK_START);
>  		} else {
>  			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>  		}
> +
>  		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>  			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
> =20

[Severity: High]
This is a pre-existing issue, but could there be a data race on ctrl->intr_=
mask
between the threaded interrupt handler and PM runtime callbacks?

Just below this code in swrm_runtime_resume(), ctrl->intr_mask is modified
locklessly:

    ctrl->intr_mask |=3D SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;

At the same time, the threaded IRQ handler performs its own lockless
read-modify-write on ctrl->intr_mask:

drivers/soundwire/qcom.c:qcom_swrm_irq_handler() {
    ...
    ctrl->intr_mask &=3D ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
    ...
}

Both execute in process context without synchronization, and the PM runtime
worker can be scheduled via wake_irq independently.

If these run concurrently on different CPUs, could this result in a
read-modify-write race where an update is lost?

If an update is lost, could an interrupt be unintentionally left unmasked,
potentially causing a persistent IRQ storm?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608175345.3118=
060-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D2
