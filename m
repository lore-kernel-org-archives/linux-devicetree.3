Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314A518DB01
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126529; cv=none; b=sI3VQhdIeqjd9euBtRK48Ve1WrfOCyhfpdvobW/eSdTBEJ4wt8E2VPFGLdhv/Zin//ogdTOStEvA91GW2XQfl1baxa9FMb+IMzdLVfcuKZmILvXWRh1dHwYrwOwb+gnJkYTw81glflme9dlfHghyOSpzY0ioKnmJAZYVsxNKeWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126529; c=relaxed/simple;
	bh=reDNmomOwobXqWkp+7pamGsCZ5ZhAE8b20aOFakvepo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Med+/JT9MwZINNeF0aN49oQ1tKy7TSg6pFNPsrRP3fCEeOYgneCx9naFYNkdxnEsTYwmJhoozDCTylWUAZatPafpevwwFnzKEsxwooy8M2z7GJmqx3uKNJOJp26QSHHqcQojan4XetMomQR2FYhxYXq8PLV7lhiX69+2pOfkYPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnFoP225; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnFoP225"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76D11F000E9;
	Wed, 15 Jul 2026 14:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784126528;
	bh=7JnD5LbqV76+ierSAOFqKe9YAsYNLxnYKghgnGOI/jg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BnFoP225KmvuUfUME3tYkgOQF/LxOQ6DnHjFNQscS9RuMRSw/vaHMsgKedn9hoFyX
	 u7M5ByBRzFMsMCcYewuncfDOP8AjHpnBdTHeLQLaBbt2FhyUbq1hELO8u5R2e4CcYc
	 A7udJ7tlRnnuQf3iqZS8bsHpQe/4wAkX8igC5lvZTF/akMWBRJ0bfnyGRMDhrq/ui8
	 oo2MAmNa0AI3uM+Shqv1OC4A8EqhQsym72jAYVwcTmJKrlw5S5v7AynVlovoBplYlD
	 9S/TTEeivp+tlZNt2+eI0VO4FCF8Al4APVUpu6OvDCxVxyoMTxkSNX5izDZ1XshJrV
	 TELBTWp5DHx6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/14] media: iris: Add support to select core for
 dual core platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260715-glymur-v9-10-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-10-8cf2cbe12a07@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:42:07 +0000
Message-Id: <20260715144207.C76D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Dynamic core reassignment mid-session corrupts hardware state and =
bypasses capacity limits.
- [High] Misattribution of unassigned sessions incorrectly inflates Core 1 =
clock frequencies, leading to hardware underclocking.
--

--- Patch [10]: [PATCH v9 10/14] media: iris: Add support to select core fo=
r dual core platforms ---
commit 9f55933e77ce82b0c6d889a73f17c3f4e9da2a7a
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: media: iris: Add support to select core for dual core platforms

This commit adds support for dual video codec cores, selecting a core based
on MBPF and MBPS load and scaling limits and clock frequencies accordingly.

> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/=
platform/qcom/iris/iris_vb2.c
> index a2ea2d67f60d0..dbb89396e6514 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, un=
signed int count)
>  	if (ret)
>  		goto error;
> =20
> +	ret =3D iris_set_core_id(inst);

[Severity: High]
Does setting the core ID happen too late in the streaming initialization?

Looking at iris_vb2_start_streaming(), iris_scale_power() is called before
iris_check_session_supported() and iris_set_core_id():

    iris_scale_power(inst);
    ret =3D iris_check_session_supported(inst);
    ...
    ret =3D iris_set_core_id(inst);

This means frequency calculations will run while the new session's core_id=
=20
is still unassigned (0), which appears to cause issues in the frequency=20
calculation logic below.

> +	if (ret)
> +		goto error;
> +
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index 7d5007abaded8..97563bf899392 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c

[ ... ]

> @@ -338,6 +338,67 @@ static void iris_vpu36_program_bootup_registers(stru=
ct iris_core *core)
>  	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
>  }
> =20
> +static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
> +{
> +	const struct iris_platform_data *platform_data =3D inst->core->iris_pla=
tform_data;
> +	u32 max_load =3D mbpf ? platform_data->max_core_mbpf : platform_data->m=
ax_core_mbps;
> +	u32 max_session_cnt =3D platform_data->max_session_count;
> +	u32 core0_session_cnt =3D 0, core1_session_cnt =3D 0;
> +	u32 core0_load =3D 0, core1_load =3D 0;
> +	bool select_core0, select_core1;
> +	struct iris_inst *instance;
> +	u32 load, new_load;
> +
> +	inst->core_id =3D 0;
> +
> +	list_for_each_entry(instance, &inst->core->instances, list) {
> +		load =3D mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);
> +
> +		if (instance->core_id =3D=3D IRIS_VCODEC0) {
> +			core0_load +=3D load;
> +			core0_session_cnt++;
> +		} else if (instance->core_id =3D=3D IRIS_VCODEC1) {
> +			core1_load +=3D load;
> +			core1_session_cnt++;
> +		}
> +	}
> +
> +	new_load =3D mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
> +
> +	select_core0 =3D core0_load + new_load <=3D max_load && core0_session_c=
nt < max_session_cnt;
> +	select_core1 =3D core1_load + new_load <=3D max_load && core1_session_c=
nt < max_session_cnt;
> +
> +	if (select_core0 && select_core1)
> +		inst->core_id =3D (core0_load <=3D core1_load) ? IRIS_VCODEC0 : IRIS_V=
CODEC1;
> +	else if (select_core0)
> +		inst->core_id =3D IRIS_VCODEC0;
> +	else if (select_core1)
> +		inst->core_id =3D IRIS_VCODEC1;
> +	else
> +		return -ENOMEM;
> +
> +	return 0;
> +}

[Severity: High]
Does unconditionally zeroing and reassigning core_id corrupt the session=20
state if called mid-session?

If parameters are dynamically updated during streaming (for example, via=20
iris_venc_s_parm()), iris_check_core_mbpf() and iris_check_core_mbps() are=
=20
invoked sequentially. Would the MBPS check overwrite the assignment made by=
=20
the MBPF check, ignoring whether the newly assigned core has sufficient=20
MBPF capacity?

Additionally, since the hardware is only notified of the core ID during=20
stream-on via HFI_PROP_CORE_ID, could dynamically changing inst->core_id=20
here leave the driver calculating power for one core while the firmware=20
continues executing the session on another?

> +
> +static u64 iris_vpu36_get_required_freq(struct iris_inst *inst)
> +{
> +	u64 vcodec0_freq =3D 0, vcodec1_freq =3D 0;
> +	struct iris_core *core =3D inst->core;
> +	struct iris_inst *instance;
> +
> +	list_for_each_entry(instance, &core->instances, list) {
> +		if (!instance->max_input_data_size)
> +			continue;
> +
> +		if (instance->core_id =3D=3D IRIS_VCODEC0)
> +			vcodec0_freq +=3D instance->power.min_freq;
> +		else
> +			vcodec1_freq +=3D instance->power.min_freq;

[Severity: High]
Does this else block unintentionally include unassigned sessions?

As mentioned above, new sessions initially have an unassigned core_id (0)
when iris_scale_power() is called. Since 0 is not equal to IRIS_VCODEC0,=20
won't this falsely add the unassigned session's required frequency to=20
Core 1?

If a heavy session is misattributed to a lightly loaded Core 1 instead of=20
a heavily loaded Core 0, could the resulting maximum frequency be=20
artificially low and cause the hardware to underclock?

> +	}
> +
> +	return max(vcodec0_freq, vcodec1_freq);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-glymur-v9-=
0-8cf2cbe12a07@oss.qualcomm.com?part=3D10
