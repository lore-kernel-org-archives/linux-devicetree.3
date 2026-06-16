Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551B32264CA
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569311; cv=none; b=QHL5OFpm+gFHGvGLJGQmotvKoIkKsLjefTWZuDKbgZLl5r7JqlssLzJfr44+WiwizxuZLY8jDcK4Hd2kbvyslIxMPnfjhV0aY4WBY8w0HRPS9hcxG8b/t3C9in2hglATvcSpt+ehJd9ZsqTEMXpwWHY8MxPwVJn0zujgAIbIOWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569311; c=relaxed/simple;
	bh=wJJn/tqSbOgeV8aBsQ8735rSmdd7km9FFoLRVdbbeF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZTVu6hzxCmm1VYwfaibqGB32OFDal3WrOMzPqS53odouVcJpQtZO9LmpiNRygMnvu58jx1r+bOBTwlnU3DdRAO4ElPoh51RrQvS8QAuPK1ZFYXfOGY2lbKatZP0Gpdl8S9lNKCpFudC1VoVdzNhMB2QJOBEfVmpcQ3nbRTkJPTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bijQOsd3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bijQOsd3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7CB1F000E9;
	Tue, 16 Jun 2026 00:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781569309;
	bh=38512AoP7ecvAv5NBtf1sBwYdHPw6hI7B1/kUQvu1EE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bijQOsd3wFP2w/oso4gbY0GUpiye2+TeO862pWiCNvZARlZScboWhnUNWel2mBMDS
	 KRFsB+WBcR61TKU2ByTlm9rze0aavKpfUhHRrdly/MQJP1bUXK6U+drwVBhFWpiCnV
	 xxHAbdeBBd1M5EZf1Uaj9dINpaOZMUdxWRZYCQiKLVRoORYZvQ1iZvt3sEO9LnI7Yc
	 GBpwlrdLXFY9qjQs8JXO3qjQjpH4famEveAV+LBtQyYX1pgcP+Cn7jHLxfSHkd6Wgw
	 X+4tYArMo7Wlr/tjOKFlfWssAPwdjqYPDYCMx7C//3IwCZBRYVhKlo8L+FqEixtPxm
	 SIlshb2FaNWZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 13/16] media: iris: Introduce buffer size
 calculations for AR50LT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 00:21:48 +0000
Message-Id: <20260616002148.EE7CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The AR50LT decoder line buffer size calculations accept an `is_opb=
` parameter but completely ignore it, failing to allocate memory for the VP=
SS line buffer when OPB (split mode) is enabled.
- [High] The AR50LT BIN buffer size calculations for H.264 and HEVC ignore =
`num_vpp_pipes`, preventing proper buffer partitioning and alignment across=
 hardware pipelines.
- [High] The VP9 AR50LT line buffer calculation omits critical component si=
zes for DMA metadata and QP maps.
- [High] Missing SEI user data allocation in the H.264 AR50LT persist buffe=
r calculation.
--

commit 41b73900b6c3face3194c0a45272d5dc37396dab
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Introduce buffer size calculations for AR50LT
   =20
Introduces AR50LT  buffer size calculation for both encoder and
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
> +		size_bin_hdr =3D size_yuv * H264_CABAC_HDR_RATIO_SM_TOT;
> +		size_bin_res =3D size_yuv * H264_CABAC_RES_RATIO_SM_TOT;
> +	} else {
> +		size_bin_hdr =3D (size_yuv * 3) / 5;
> +		size_bin_res =3D (size_yuv * 3) / 2;
> +	}
> +	size_bin_hdr =3D ALIGN(size_bin_hdr, DMA_ALIGNMENT);
> +	size_bin_res =3D ALIGN(size_bin_res, DMA_ALIGNMENT);
> +
> +	return size_bin_hdr + size_bin_res;
> +}

[Severity: High]
Will this cause incorrect buffer sizing when multiple VPP pipelines are act=
ive?
The num_vpp_pipes argument is accepted but doesn't seem to be used to
partition and align the buffer components like it is in the generic
size_h264d_hw_bin_buffer() calculation.

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
> +		size_bin_hdr =3D size_yuv * H265_CABAC_HDR_RATIO_SM_TOT;
> +		size_bin_res =3D size_yuv * H265_CABAC_RES_RATIO_SM_TOT;
> +	} else {
> +		size_bin_hdr =3D (size_yuv * 41) / 50;
> +		size_bin_res =3D (size_yuv * 59) / 50;
> +	}
> +	size_bin_hdr =3D ALIGN(size_bin_hdr, DMA_ALIGNMENT);
> +	size_bin_res =3D ALIGN(size_bin_res, DMA_ALIGNMENT);
> +
> +	return size_bin_hdr + size_bin_res;
> +}

[Severity: High]
Similar to the H.264 function above, does this missing num_vpp_pipes
partitioning logic lead to internal misalignment for secondary pipes?

[ ... ]

> @@ -230,6 +341,11 @@ static u32 hfi_buffer_persist_h264d(void)
>  		    DMA_ALIGNMENT);
>  }
> =20
> +static u32 hfi_buffer_persist_h264d_ar50lt(void)
> +{
> +	return ALIGN((SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264), DMA_ALIGNMENT);
> +}

[Severity: High]
Does this calculation inadvertently omit the SEI user data allocation?

The original hfi_buffer_persist_h264d() and the new AR50LT HEVC function bo=
th
include NUM_HW_PIC_BUF * SIZE_SEI_USERDATA, so leaving it out here might
cause the hardware to write out of bounds during SEI metadata extraction.

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
Is the is_opb parameter intentionally ignored here?

Without conditionally adding size_vpss_lb() when is_opb is true, could the
returned line buffer size be significantly undersized during split mode
operations, potentially leading to memory corruption?

[ ... ]

> @@ -492,6 +706,19 @@ u32 hfi_iris3_vp9d_lb_size(u32 frame_width, u32 fram=
e_height, u32 num_vpp_pipes)
>  		ALIGN(size_vp9d_qp(frame_width, frame_height), DMA_ALIGNMENT);
>  }
> =20
> +static inline
> +u32 hfi_ar50lt_vp9d_lb_size(u32 frame_width, u32 frame_height, u32 num_v=
pp_pipes)
> +{
> +	return ALIGN(size_vpxd_lb_fe_left_ctrl(frame_width, frame_height), DMA_=
ALIGNMENT) *
> +		num_vpp_pipes +
> +		ALIGN(size_vpxd_lb_se_left_ctrl_ar50lt(frame_width, frame_height), DMA=
_ALIGNMENT) *
> +		num_vpp_pipes +
> +		ALIGN(size_vp9d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNME=
NT) +
> +		ALIGN(size_vp9d_lb_pe_top_data(frame_width, frame_height), DMA_ALIGNME=
NT) +
> +		ALIGN(size_vp9d_lb_fe_top_data(frame_width, frame_height), DMA_ALIGNME=
NT);
> +}

[Severity: High]
Are we missing the DMA metadata, top control, and QP map allocations here?

The generic hfi_iris3_vp9d_lb_size() explicitly adds
size_vpxd_lb_fe_top_ctrl(), size_vpxd_lb_recon_dma_metadata_wr(), and
size_vp9d_qp(). Omitting these could result in an undersized buffer.

> +
>  static inline
>  u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_buf=
count_min, bool is_opb,
>  			 u32 num_vpp_pipes)
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
Does this function also need to check is_opb and add the VPSS line buffer
size, similarly to hfi_buffer_line_vp9d()?

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
As with the HEVC and VP9 functions above, the is_opb argument is entirely
ignored. Could this lead to out-of-bounds DMA writes when split mode is
enabled?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-iris-ar50l=
t-v5-0-583b42770b6a@oss.qualcomm.com?part=3D13
