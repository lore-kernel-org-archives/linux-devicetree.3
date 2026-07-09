Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878A4381AF1
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606145; cv=none; b=Oc/0p/alMjx6Rta7c5huIz52q93lCPpK5UaipI38L/oP9rlEB5RBoTZew/UKDWMuR6QTZp8epU1MsI8VohfesQwUt9Eeg1enkyFBjT+I9JkP9sEPQUIibMFhIYoGptfnKyQcgv9PIewZVwZZTQsDL6rtSEJVur/tHoRGhMHpy5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606145; c=relaxed/simple;
	bh=E7Bb1EMDexx/e14yZ+9KT5C1jc3O57m4uf4Rb6/gCJY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pZqA6CfmgM1dgERxelAZFy4yXBlQZqS0TKWKNkl7pvZ/i1S6NrZ/N2iio1Zo1S5hKcMnT4GO5gt6rHYdK6XZmuQYQE9tY30RobYnqYr1UNg5IrQ1lyyXhi536/EbPnH1l/sFr2gbClIz/HB7VSK1ZxX6NvtY1ibVzve0oBTxe4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jnh84kNk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jnh84kNk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11321F000E9;
	Thu,  9 Jul 2026 14:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783606144;
	bh=VU1gdCkVtv8Nm0Vg4fqPwXpQ7CksOFHz5FF0ITDkgGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jnh84kNkGzoM2i896BKqmTSqjA66wXEcPBFy5XRcRBvJMPhr0UU8u1TWLiyiFOd60
	 ISk970lMDGJpYrndzO8uYrG1ZJPPofnMaSomxQ1Ltp2OWrPOfUWDr3NAZfAnZ9XQO5
	 UsIstB4KZ6/NvU/ubVhj6CKycHuxQHavXuiNaQLAdlizT6U+RMW3m7Ci6j5wo0Fezf
	 Np8S6q5Xe+8+C43MLCbvdWYLys3NHmWgYnB6EQ9bvO6O8QH76AP+FoARc1FitCRxL3
	 ZbfRfMt8+KMqr9wbDgFLuOd7g5w1npEhHOXVe2rVOS5h2gbndQDNXGNpXfy4jpxuRq
	 U92kpqvgi97oA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 15/18] media: iris: Introduce buffer size
 calculations for AR50LT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-iris-ar50lt-v7-15-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-15-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:09:03 +0000
Message-Id: <20260709140903.C11321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] AR50LT decoder line buffer calculations fail to allocate require=
d VPSS (Video Processing Subsystem) line buffers when OPB (Output Picture B=
uffer) is enabled.
- [Medium] AR50LT VP9 line buffer size calculation omits key sub-buffer com=
ponents (`fe_top_ctrl`, `recon_dma_metadata_wr`, and `qp`) present in other=
 codecs.
--

--- Patch [15]: [PATCH v7 15/18] media: iris: Introduce buffer size calcula=
tions for AR50LT ---
commit 706f1cfb849daea9c7ee9eb5866f06341b85640c
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Introduce buffer size calculations for AR50LT

Introduces AR50LT buffer size calculation for both encoder and
decoder. Reuse the buffer size calculation which are common, while
adding the AR50LT specific ones separately.

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/m=
edia/platform/qcom/iris/iris_vpu_buffer.c
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c

[ ... ]

> @@ -571,6 +571,25 @@ u32 hfi_buffer_line_h265d(u32 frame_width, u32 frame=
_height, bool is_opb, u32 nu
>  	return ALIGN((_size + vpss_lb_size), DMA_ALIGNMENT);
>  }
> =20
> +static inline
> +u32 hfi_buffer_line_h265d_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 size;
> +
> +	size =3D ALIGN(size_h265d_lb_fe_top_data_ar50lt(frame_width, frame_heig=
ht), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNM=
ENT) +
> +		ALIGN(size_h265d_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGN=
MENT) +
> +		ALIGN(size_h265d_lb_se_left_ctrl_ar50lt(frame_width, frame_height), DM=
A_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNM=
ENT) +
> +		ALIGN(size_h265d_lb_pe_top_data_ar50lt(frame_width, frame_height), DMA=
_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT)=
 +
> +		ALIGN(size_h265d_lb_vsp_left(frame_width, frame_height), DMA_ALIGNMENT=
) +
> +		ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width, frame_height), =
DMA_ALIGNMENT) * 4 +
> +		ALIGN(size_h265d_qp(frame_width, frame_height), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}
> +

[Severity: Medium]
Does this code need to handle the VPSS line buffer allocation when the
Output Picture Buffer (OPB) is enabled?

The baseline functions like hfi_buffer_line_h265d() check for is_opb
and add size_vpss_lb(frame_width, frame_height) to the total allocation.
Could the AR50LT hardware experience an out-of-bounds memory write
during decoding if the VPSS line buffer size is omitted here?

[ ... ]

> @@ -689,6 +689,17 @@ u32 hfi_iris3_vp9d_lb_size(u32 frame_width, u32 fram=
e_height, u32 num_vpp_pipes)
>  		ALIGN(size_vp9d_qp(frame_width, frame_height), DMA_ALIGNMENT);
>  }
> =20
> +static inline
> +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _=
yuv_bufcount_min)
> +{
> +	return ALIGN(size_vpxd_lb_fe_left_ctrl(frame_width, frame_height), DMA_=
ALIGNMENT) +
> +		ALIGN(size_vpxd_lb_se_left_ctrl_ar50lt(frame_width, frame_height), DMA=
_ALIGNMENT) +
> +		ALIGN(size_vp9d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNME=
NT) +
> +		ALIGN(size_vp9d_lb_pe_top_data(frame_width, frame_height), DMA_ALIGNME=
NT) +
> +		ALIGN(size_vp9d_lb_fe_top_data(frame_width, frame_height), DMA_ALIGNME=
NT);
> +}
> +

[Severity: Medium]
Are there some missing sub-buffer sizes in this VP9 line buffer calculation?

Looking at the baseline hfi_iris3_vp9d_lb_size(), as well as the AR50LT
H.264 and H.265 calculations, they seem to include sizes for fe_top_ctrl,
recon_dma_metadata_wr, and qp. If the AR50LT hardware requires these
buffers for VP9, could omitting them cause out-of-bounds memory writes?

[ ... ]

> @@ -1100,6 +1100,23 @@ static u32 iris_vpu_dec_line_size(struct iris_inst=
 *inst)
>  	return 0;
>  }
> =20
> +static u32 iris_vpu_ar50lt_dec_line_size(struct iris_inst *inst)
> +{
> +	struct v4l2_format *f =3D inst->fmt_src;
> +	u32 height =3D f->fmt.pix_mp.height;
> +	u32 width =3D f->fmt.pix_mp.width;
> +	u32 out_min_count =3D inst->buffers[BUF_OUTPUT].min_count;
> +
> +	if (inst->codec =3D=3D V4L2_PIX_FMT_H264)
> +		return hfi_buffer_line_h264d_ar50lt(width, height);
> +	else if (inst->codec =3D=3D V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_line_h265d_ar50lt(width, height);
> +	else if (inst->codec =3D=3D V4L2_PIX_FMT_VP9)
> +		return hfi_buffer_line_vp9d_ar50lt(width, height, out_min_count);
> +
> +	return 0;
> +}
> +

[Severity: Medium]
Should this function check for iris_split_mode_enabled() to determine OPB
state, similar to how iris_vpu_dec_line_size() does?

If the VPSS line buffer size allocation is required for AR50LT when OPB
is enabled, it seems the is_opb flag would need to be passed down to the
buffer calculations here as well to prevent buffer under-allocation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-iris-ar50l=
t-v7-0-76af9dd4d1f6@oss.qualcomm.com?part=3D15
