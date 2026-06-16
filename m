Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E71B261B8D
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781570405; cv=none; b=Fk8/2JUChKIplPxrV4R1WGhRvGGOssUCZaia61UA6IhTF6Ujt6TSm9Z2gSE0oMw1H94bw/MEoenx5RL/jhgERLayB5SI41KCqkVrDmizYZ3fu4UYashuX96dRDDinB0Nyax3jNT7GXq8k/37Lqf2oJebaiVET3sAX0e1oOR+Xwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781570405; c=relaxed/simple;
	bh=Uum0Xqu9eUEBZwyJ3d2mHE88QJkHzGm0qmrNJJ+0Bh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mzR2gbiLOUZ0Cm/+GmArZ91/8riCRNyhQKNVNRV6Y+1J2Dc8YuIwoGg2QWZYKj4shDUt9O+SabR1xwCFZuBZkrfprW3MKKqSsBarh2Ui+jNfUV2B/m+w/49BTzUqDgLoWV9vThKkEKR/UfBeqNrfHUbPWn5HClNQD9G1k32wRWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5/+mMn2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5/+mMn2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1187C1F000E9;
	Tue, 16 Jun 2026 00:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781570404;
	bh=/GizO4AJI4Yfrg7Igq/dbL+aygwbPMDdRkC8KtI84NQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B5/+mMn26cXxTUIuLgfm1AIHxY97aZ2qEoda2g3A5/DQoVJp2CtJZ55T2xdQEcakh
	 N0xoZHAvlFv9MYeFjNbhuTPOPPkryrnV6IOeekGxfIlq+ppAWbGYlUDM4KzmXqRegd
	 yM5Lsh6JUmooSbsWvd6OrgY5sMZQEz/Dv51zf5HO4bQvbzgcWRa4yVDbV0HzvSERuD
	 P0ZYH3kbRTlKi1V+fR0AMcKpzT3QFGauHYfk4TA4NZ38pRSw7DOvSYKtUAuzS0mq0O
	 jypjhNodB2mK71U0h6xKcJT5d/T3FVCG6kchJdIFDtlUvYPptCKZr0F28eJB32wMUF
	 9iQyCBKNNZ2Cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/16] media: iris: implement support for the Agatti
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260616-iris-ar50lt-v5-12-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-12-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 00:40:03 +0000
Message-Id: <20260616004004.1187C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Logic Error: Invalid hardware frequency calculation due to missing=
 `mb_cycles_vsp` parameter
- [High] Hardware Configuration: The watchdog interrupt is defined but neve=
r unmasked, breaking watchdog recovery
- [Low] Build Failure: Initialization of non-existent struct members in qcm=
2290_data
--

commit eabd242734902d122adf5442b6b1946c0a61380b
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: implement support for the Agatti platform
   =20
Port support for the AR50Lt video codec core (present for example on the
Agatti platform) to the Iris driver. Unlike more recent cores this
generation doesn't have the PIPE property (as it always has only one
pipe). Also, unlike newer platforms, buffer sizes are requested from the
firmware instead of being calculated by the driver.

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c =
b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> new file mode 100644
> index 0000000000000..393256f39112b
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

[Severity: High]
Does this code need to initialize .mb_cycles_vsp?

It looks like .mb_cycles_vsp is omitted here, so it will default to 0. If
the .calc_freq callback in iris_vpu_ar50lt_ops uses
iris_vpu2_calculate_frequency(), that function calculates vsp_freq by
multiplying the macroblocks-per-second by caps->mb_cycles_vsp. Because
mb_cycles_vsp is 0, the resulting hardware clock frequency might be severely
undercalculated, potentially causing performance degradation or hardware
timeouts.

> +	.max_frame_rate =3D 120,
> +	.max_operating_rate =3D 120,
> +};
> +
> +const struct iris_platform_data qcm2290_data =3D {
> +	.firmware_desc_gen1 =3D &iris_vpu_ar50lt_p1_gen1_s6_desc,

[Severity: Low]
Does struct iris_platform_data have a member named firmware_desc_gen1?

It appears that struct iris_platform_data (defined in
iris_platform_common.h) only contains a generic firmware_desc member. Using
.firmware_desc_gen1 here might result in a compilation error.

> +	.vpu_ops =3D &iris_vpu_ar50lt_ops,
> +	.icc_tbl =3D iris_icc_info_ar50lt,
> +	.icc_tbl_size =3D ARRAY_SIZE(iris_icc_info_ar50lt),

[ ... ]

> +	.tz_cp_config_data_size =3D ARRAY_SIZE(tz_cp_config_ar50lt),
> +	.num_vpp_pipe =3D 1,
> +	.no_rpmh =3D true,
> +	.wd_intr_mask =3D WRAPPER_INTR_STATUS_A2HWD_BMSK,

[Severity: High]
Will the watchdog interrupt actually be unmasked by the hardware?

This defines the platform's watchdog status bit mask as
WRAPPER_INTR_STATUS_A2HWD_BMSK (0x10). However, if
iris_vpu_ar50lt_interrupt_init() in iris_vpu_ar50lt.c overwrites
WRAPPER_INTR_MASK with a hardcoded mask that omits the watchdog bit, the
watchdog interrupt will not be unmasked, preventing the driver from
detecting and recovering from VPU firmware hangs.

> +	.icc_ib_multiplier =3D 2,
> +	.max_session_count =3D 8,
> +	.max_core_mbpf =3D ((1920 * 1088) / 256) * 4,
> +	/* Concurrency: 1080p@30 decode + 1080p@30 encode */
> +	/* Concurrency: 3 * 1080p@30 decode */
> +	.max_core_mbps =3D (((1920 * 1088) / 256) * 90),
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-iris-ar50l=
t-v5-0-583b42770b6a@oss.qualcomm.com?part=3D12
