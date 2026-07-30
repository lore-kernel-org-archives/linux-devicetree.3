Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4599443F0B3
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426886; cv=none; b=rTz44kw2X4h5qARI5SMg2ueXdxIdFhrLdYX9uVYmrm50puf7lYTDZdq5K1dcoOPwBmARnB/yeBV2bNsbLQH8r3OneNkS6xggSaiUQfQBtdLDZDc2x+2yiKXFKcMa1miOSOVveziuys6IiKJLE11hRSiI5xtZ2K0WNWqnKoR/x44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426886; c=relaxed/simple;
	bh=htW9/m0nyom5OVxvYwsNJO0b2gGU5Ir9tuA6trkzqEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XLc4LfBPy526+aMnBqeN9C4yNvZbKwDabTDUXLFfu066AEbt+4MkJwTH206SMmf0SUefKAPpzANswk3D8AaG5RcGqfg8okSPvJ/l0Yv18IjIwAYYTiltSqJ/zZZo8p46burmV6rjQBbKK76QNMMnvHhG/n8KTkwTUjZWF2aJkjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agQCfxq8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agQCfxq8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30F01F00A3D;
	Thu, 30 Jul 2026 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785426885;
	bh=AjYKOFOidGQQj73S4Yh2kFJo6I9p7Ft4rR+nXNlJAY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=agQCfxq8s5n8ngo45zEDRPurwaEOpxWH1x11AIUouqZ6TtJyaVl3uesnDj5Aw0uOp
	 BkZAJbYdgB+pK5Wv6noDQ3zVaOnQ8vjkItXtKPNVtbvuDk5W39yBnBGLcxXjLB35y5
	 PswQvPp93iTzWqiKCiVlKpzU7I9xfUnXOY7/r9savd6xHE/YRQl+uYmje56vrvlVtD
	 o1ZH3q8bUwaEEnmQstu47jiCOcjNRcM8aCeUCZFIdlBk4gADgxhcW7a7JchjABF2Mf
	 ht/8xd6Zpsp+U/H5RKHO1uqJCL+qvAdVLEBxE7AfJZquOZ5xO4NTCrkLhpZP1nFlPC
	 3xA6/om/OhIdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 14/18] media: iris: implement support for the Agatti
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260730-iris-ar50lt-v8-14-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-14-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:54:44 +0000
Message-Id: <20260730155444.C30F01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Mismatch between statically calculated vb2 buffer size and the=
 firmware's requested buffer size causes a potential buffer overflow when t=
he firmware writes to external buffers.
- [High] Querying buffer requirements for AR50Lt overwrites the DPB buffer =
count (fw_min_count) with the display output buffer count.
- [High] The AR50LT platform uses `iris_vpu2_calculate_frequency` but provi=
des capability fields intended for `iris_vpu3x_vpu4x_calculate_frequency`, =
resulting in severely under-calculated clock scaling.
- [Medium] The hierarchical layer bitrates (LAYER0_BITRATE_H264 to LAYER5_B=
ITRATE_H264) in `inst_fw_cap_gen1_ar50lt_enc` use the global `BITRATE_MAX` =
(160Mbps) instead of the AR50LT-specific limit.
--

--- Patch [14]: [PATCH v8 14/18] media: iris: implement support for the Aga=
tti platform ---
commit 50e74e4ea9f26a2d05a3a8800b3cde717ea582a2
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: implement support for the Agatti platform

Port support for the AR50Lt video codec core (present for example on the
Agatti platform) to the Iris driver. Unlike more recent cores this
generation doesn't have the PIPE property (as it always has only one
pipe). Also, unlike newer platforms, buffer sizes are requested from the
firmware instead of being calculated by the driver.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/m=
edia/platform/qcom/iris/iris_hfi_gen1.c
> index ca1545d28b531..020f55092737d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c

[ ... ]

> +	{
> +		.cap_id =3D LAYER0_BITRATE_H264,
> +		.min =3D 1,
> +		.max =3D BITRATE_MAX,
> +		.step_or_mask =3D 1,
> +		.value =3D BITRATE_DEFAULT,
> +		.hfi_id =3D HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set =3D iris_set_bitrate_gen1,
> +	},

[Severity: Medium]
Should these hierarchical layers use BITRATE_MAX_AR50LT instead of
BITRATE_MAX?

The base BITRATE capability uses BITRATE_MAX_AR50LT (100M), but the
hierarchical layers are using BITRATE_MAX (160M), which might allow
userspace to request a configuration that exceeds the platform's hardware
limits.

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 99e82e5510abe..329a9ef2fdc5f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c

[ ... ]

> @@ -970,6 +970,13 @@ static int iris_hfi_gen1_set_bufsize(struct iris_ins=
t *inst, u32 plane)
>  	struct hfi_buffer_size_actual bufsz;
>  	int ret;
> =20
> +	if (inst->core->iris_firmware_data->query_buffer_requirements) {
> +		ret =3D inst->hfi_session_ops->session_get_property(inst,
> +								  HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS);
> +		if (ret)
> +			return ret;
> +	}
> +

[Severity: High]
Could querying buffer requirements here overwrite the DPB buffer count
with the display buffer count?

When this queries HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS,
iris_hfi_gen1_session_buffer_requirements() processes the requirement.
For BUF_OUTPUT (which maps to the display buffer in split mode), it sets:

    if (type =3D=3D BUF_OUTPUT)
        inst->fw_min_count =3D req->count_actual;

Since iris_vpu_dpb_count() relies on inst->fw_min_count for the DPB
count, does this result in allocating the wrong number of DPB buffers?

[Severity: Critical]
Could this lead to a buffer overflow when the firmware writes to
the external buffers?

When the buffer requirements are queried,
iris_hfi_gen1_session_buffer_requirements() overwrites the internal tracker:

    inst->buffers[type].size =3D req->size;

This firmware-requested size is then sent back to the firmware. However,
when physical memory is prepared in iris_vb2_buf_prepare(), it validates the
size against the statically calculated iris_get_buffer_size():

    if (vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_OUTPUT))
        return -EINVAL;

If the firmware requires a larger size than the static calculation, it
might write beyond the statically allocated vb2_buffer bounds.

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c =
b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> new file mode 100644
> index 0000000000000..92f7e25465399
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c

[ ... ]

> +static struct platform_inst_caps platform_inst_cap_ar50lt =3D {
> +	.min_frame_width =3D 128,
> +	.max_frame_width =3D 1920,
> +	.min_frame_height =3D 128,
> +	.max_frame_height =3D 1920,
> +	.max_mbpf =3D (1920 * 1088) / 256,
> +	.mb_cycles_vpp =3D 440,
> +	.mb_cycles_fw =3D 733003,
> +	.mb_cycles_fw_vpp =3D 225975,
> +	.max_frame_rate =3D 120,
> +	.max_operating_rate =3D 120,
> +};

[Severity: High]
Does this platform need mb_cycles_vsp defined to scale the clock properly?

This struct provides mb_cycles_fw and mb_cycles_fw_vpp, which are used by
iris_vpu3x_vpu4x_calculate_frequency(). However, qcm2290_data assigns
iris_vpu_ar50lt_ops, which uses iris_vpu2_calculate_frequency():

    vsp_freq =3D mbs_per_second * caps->mb_cycles_vsp;

Since mb_cycles_vsp is omitted here, it defaults to 0. Will this cause the
calculated vsp_freq to be 0 and severely under-calculate the required clock
frequency?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iris-ar50l=
t-v8-0-6597c08cea6f@oss.qualcomm.com?part=3D14
