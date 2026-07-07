Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4DD227BB9
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783464357; cv=none; b=aPfnlXXbM+TjhnnxC9F48c6VZwSM6d9NwnhnXEtWhQckk7TYqJVbWwdAWTnCR0XaGkv7ytqeawyiBePy6TtyEcAMxDAXgPxeM5ngrmZU7Ob/vvxt/ncu03mSr17okBz9UEfuafFatwsuerlK1SU7AVvaAqlwOzQugJ4/gYGxb2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783464357; c=relaxed/simple;
	bh=f19mOxMy36nIIWh2H7IZPlNmXM3TR8IwZZmcdEIWe+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M3zVqrmZRKGjZvfqb7EQK+ZsmvJNzJOVYc6FZRPIHpmdvUHkB1+Z/ZH+hF4WBqSK8vRvF59jApoxgaRfaoVQDUNXnsZxNXzgugUG/6R0UzELs7VMSfLmrF1m+ZAu0+p4FUrLuf91s9d7Scy51ZaeK4iqqVPbtVNFAvIpzGZIn2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEVCJAoe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEVCJAoe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961C21F000E9;
	Tue,  7 Jul 2026 22:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783464355;
	bh=FEzJkIj+K3Zwef9mrB76aIKVufXOkXeJ5yLJSWZSWQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PEVCJAoeD+/WblMZIdXwXTYi111/Rauj5hcvWU5Y004GZT1Tk4DkM9Z6W842gRJMi
	 9nWhp24xwFGroNGk56xDeBtG9lPPNwRb+FbkEqnYkA8BQJEy64/51gJWVhXDVmYxLN
	 5AT1eRB6lbekXKvJBKgCNNaQhilufbuFTiC+1EaYSPsonIjh5C4DDwSaA3eaPKhgCj
	 HBCVSxtm0Vx8lXK1Bocs+S82fQJf0RILarcOhlHyYx8kwO39Ciy4sNvAfL1MGziRfJ
	 q9umqnu0etrVrd6YdE+lihlxwbkyZdpKEUVQLcfukXpA67sN8biYw5N603nmm/RiVL
	 YUXhKWhk8iLqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-iris-ar50lt-v6-4-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
 <20260708-iris-ar50lt-v6-4-374f0a46c23b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 22:45:55 +0000
Message-Id: <20260707224555.961C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing locking in several V4L2 ioctl handlers leads to data races=
 on shared instance state like `inst->crop` and `inst->fmt_dst`.
--

--- Patch [4]: [PATCH v6 04/18] media: iris: Filter UBWC raw formats based =
on hardware capabilities ---
commit aa7fe2abc39f47e09e6b8087a439350fc380a98c
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Filter UBWC raw formats based on hardware capabilities

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media=
/platform/qcom/iris/iris_vdec.c
> index 4c8bc7aac1359..9fee5f28097d9 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
[ ... ]
> @@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 p=
ixfmt, u32 type)
>  		size =3D inst->core->iris_platform_data->inst_iris_fmts_size;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		fmt =3D iris_vdec_formats_cap;
> -		size =3D ARRAY_SIZE(iris_vdec_formats_cap);
> +		if (ubwc->ubwc_enc_version) {
> +			fmt =3D iris_vdec_formats_cap;
> +			size =3D ARRAY_SIZE(iris_vdec_formats_cap);
> +		} else {
> +			fmt =3D iris_vdec_formats_noubwc_cap;
> +			size =3D ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
> +		}
>  		break;
>  	default:
>  		return false;

[Severity: High]
This is a pre-existing issue, but since check_format() accesses shared
instance state like inst->fw_caps, is it safe to call it without inst->lock?

For example, when called from iris_enum_framesizes() in iris_vidc.c:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_enum_framesizes() {
	...
	if (inst->domain =3D=3D DECODER)
		ret =3D iris_vdec_validate_format(inst, fsize->pixel_format);
	...
}

This path doesn't acquire inst->lock before calling into check_format().

Similarly, several other V4L2 ioctl handlers appear to be missing
inst->lock, allowing concurrent ioctls to race. For instance:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_s_selection() {
	...
	else if (inst->domain =3D=3D ENCODER)
		return iris_venc_s_selection(inst, s);
	...
}

drivers/media/platform/qcom/iris/iris_vidc.c:iris_s_parm() {
	...
	if (inst->domain =3D=3D ENCODER)
		return iris_venc_s_param(inst, a);
	...
}

Without the lock, concurrent userspace calls can race to modify shared state
like inst->crop, inst->fmt_dst->fmt.pix_mp.width, frame_rate, and
operating_rate, potentially causing data corruption or torn internal state.

Since video_device->lock is NULL, the driver is relying on manual
serialization. Should these ioctls acquire inst->lock to protect against
unprivileged userspace races?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-iris-ar50l=
t-v6-0-374f0a46c23b@oss.qualcomm.com?part=3D4
