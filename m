Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ACB388866
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781259750; cv=none; b=sZpJdAKFbSv8DRFCWrPaGc29zJVrWsmUsQqHm0RC+umSW4XtGP7rNkgK7iRLQzEe6HWDh50SopvudO4qeGvcPdvZ9KYu1yf0Vpbm1BW+Smk05ud337ITvK49Xy7XBwpmRvuA2qPVn5J04AsN3gLA6m7MWN6R0uay02R/hynSfnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781259750; c=relaxed/simple;
	bh=WtoEE9IzvQMmwU84AyrwGODQgUIgrfbGqDCy5CAcc2E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WyQrQLh4Yo2JkkCdYAmYSrxUwJ93umnvQEIUJm7kc23b4UNen6qzFl/ZtSyHE3t1B9lES4iZW/fYp4IMOuw7WEhC6zbRuL4CQL6fsrAJ/9d02E5cruAvTdBJDLJ+Y/B/RxNSDoSAD9fVcawntoknm41o/ArhTYxqfJmxYG4lVnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEqx97mB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEqx97mB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115BF1F000E9;
	Fri, 12 Jun 2026 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781259748;
	bh=szU0X4wD0KKRGoPOPIOfUoQHapylvajrPKCXbHkiRok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CEqx97mBMw5aUSRtbfkm4XD42nSAOBB5p0KpBMzVJwGfdzMN3xlkWhGvKIvOM7Qxl
	 vkvxhEHUip5o/CsIqfjfdCcnbCouq/zMH48+XWcnNpXoTtGKve8TL3Qdu3kAyxnIFC
	 9eYbceAkrLvoY4U15nfYT446KBzbZ+1SFCcmfAeuXMVpecs/h5fvJyuVa9byz+uoRg
	 9dbGP0s7nB2z4Zh6yIbfvcnwYBISC7bMzzo6hbk1e4sl7uYh66KBVNi3M8ih5YEymY
	 3740rIuXqlu9Ip27PHuKnK/kamPm74j7NWr9Crl7ZGK4/MfVRdFmnvSS0uB2NHkn/r
	 gfEiyW5qfnvwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/16] media: iris: Introduce buffer size
 calculations for AR50LT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612-iris-ar50lt-v4-13-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-13-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 10:22:27 +0000
Message-Id: <20260612102228.115BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The AR50LT line buffer calculations ignore the `is_opb` parameter =
and fail to allocate the required VPSS line buffer size when split mode is =
enabled.
- [High] AR50LT H264 and HEVC bin buffer size calculations lack a minimum l=
ower-bound threshold.
--

commit 3d321c841d8d8ce0ec81cd70b48ab049db102de4
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Introduce buffer size calculations for AR50LT
   =20
Introduces AR50LT buffer size calculation for both encoder and
decoder. Reuse the buffer size calculation which are common, while
adding the AR50LT specific ones separately.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers=
/media/platform/qcom/iris/iris_vpu_buffer.c
> index 4a39b8fef52b0..ca03d65705136 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -50,6 +50,32 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 f=
rame_height, u32 num_vpp_p
>  	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes=
);
>  }
> =20
> +static u32 size_h264d_hw_bin_buffer_ar50lt(u32 frame_width, u32 frame_he=
ight, u32 num_vpp_pipes)
> +{
> +	u32 size_yuv, size_bin_hdr, size_bin_res;
> +
> +	size_yuv =3D ((frame_width * frame_height * 3) >> 1);
> +	if (size_yuv <=3D 1920 * 1088 * 3 / 2) {

[Severity: High]
Does this calculation lack a minimum safe threshold for size_yuv?

The generic implementations clamp the base pixel area against
BIN_BUFFER_THRESHOLD, and the AR50LT VP9 implementation correctly applies a
lower bound. If a stream with a very small resolution is provided, could
this allocate a dangerously small bin buffer and lead to hardware memory
corruption?

[ ... ]

> @@ -111,6 +152,32 @@ static u32 hfi_buffer_bin_h265d(u32 frame_width, u32=
 frame_height, u32 num_vpp_p
>  	return size_h265d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes=
);
>  }
> =20
> +static u32 size_h265d_hw_bin_buffer_ar50lt(u32 frame_width, u32 frame_he=
ight, u32 num_vpp_pipes)
> +{
> +	u32 size_yuv, size_bin_hdr, size_bin_res;
> +
> +	size_yuv =3D ((frame_width * frame_height * 3) >> 1);
> +	if (size_yuv <=3D ((BIN_BUFFER_THRESHOLD * 3) >> 1)) {

[Severity: High]
Similar to the H.264 case above, does this calculation also need a
lower-bound threshold applied to prevent hardware issues with extremely
small stream resolutions?

[ ... ]

> @@ -404,6 +584,29 @@ u32 hfi_buffer_line_h265d(u32 frame_width, u32 frame=
_height, bool is_opb, u32 nu
>  	return ALIGN((_size + vpss_lb_size), DMA_ALIGNMENT);
>  }
> =20
> +static inline
> +u32 hfi_buffer_line_h265d_ar50lt(u32 frame_width, u32 frame_height, bool=
 is_opb, u32 num_vpp_pipes)
> +{
> +	u32 size;
> +
> +	size =3D ALIGN(size_h265d_lb_fe_top_data_ar50lt(frame_width, frame_heig=
ht), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNM=
ENT) +
> +		ALIGN(size_h265d_lb_fe_left_ctrl(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_h265d_lb_se_left_ctrl_ar50lt(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_h265d_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNM=
ENT) +
> +		ALIGN(size_h265d_lb_pe_top_data_ar50lt(frame_width, frame_height), DMA=
_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT)=
 +
> +		ALIGN(size_h265d_lb_vsp_left(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * 4 +
> +		ALIGN(size_h265d_qp(frame_width, frame_height), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}

[Severity: High]
Does this function completely ignore the is_opb parameter?

In the generic hfi_buffer_line_h265d(), is_opb is used to add the VPSS line
buffer size via size_vpss_lb(). Could missing this buffer size lead to
out-of-bounds DMA memory writes when split mode is enabled and hardware
expects the additional allocation?

[ ... ]

> @@ -507,6 +734,13 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_=
height, u32 _yuv_bufcount_mi
>  	return _lb_size + vpss_lb_size + 4096;
>  }
> =20
> +static inline
> +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _=
yuv_bufcount_min,
> +				bool is_opb, u32 num_vpp_pipes)
> +{
> +	return hfi_ar50lt_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes=
);
> +}

[Severity: High]
Similar to the HEVC case, the is_opb parameter is accepted here but unused.
Should size_vpss_lb() be factored in for VP9 line buffers as well when
split mode is active?

[ ... ]

> @@ -529,6 +763,25 @@ static u32 hfi_buffer_line_h264d(u32 frame_width, u3=
2 frame_height,
>  	return ALIGN((size + vpss_lb_size), DMA_ALIGNMENT);
>  }
> =20
> +static u32 hfi_buffer_line_h264d_ar50lt(u32 frame_width, u32 frame_heigh=
t,
> +					bool is_opb, u32 num_vpp_pipes)
> +{
> +	u32 size;
> +
> +	size =3D ALIGN(size_h264d_lb_fe_top_data_ar50lt(frame_width), DMA_ALIGN=
MENT) +
> +		ALIGN(size_h264d_lb_fe_top_ctrl_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_fe_left_ctrl(frame_height), DMA_ALIGNMENT) * num_v=
pp_pipes +
> +		ALIGN(size_h264d_lb_se_top_ctrl_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_se_left_ctrl_ar50lt(frame_height), DMA_ALIGNMENT) *
> +		num_vpp_pipes +
> +		ALIGN(size_h264d_lb_pe_top_data_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_vsp_top(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_recon_dma_metadata_wr(frame_height), DMA_ALIGNMENT=
) * 2 +
> +		ALIGN(size_h264d_qp(frame_width, frame_height), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}

[Severity: High]
Once again, is_opb is ignored in this AR50LT H.264 line buffer calculation.
Does the hardware still expect the VPSS line buffer allocation when split
mode is enabled here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-iris-ar50l=
t-v4-0-0abfb74d5b3c@oss.qualcomm.com?part=3D13
