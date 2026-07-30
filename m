Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6B636607D
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426454; cv=none; b=hnj1hG2yjO55pAzvpQ4E591W6+lZuTvImHFeh1T6hBZx/1UUvXPjW9qnI8LQFN8utY7gS2efjWKK7qmTzqE2k9sR9jbwXNAo/rGJ5UxpZ4Xlqb4XfU3lVN4w39nRE4rEQpf7OsjUab5ue8RL1dcEWLHkl18LAxvzBxnNiZLoa+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426454; c=relaxed/simple;
	bh=nJy3YsVtDtbBH8LPh8eUZgImtpcNzU5j+xTBmZCsPdw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z9nWqIFWc/cjRlzN0ppDsCHzys/Clim08oK3kO7xeQnxknm16g0KNmzYiJW0wSY7PnVeDczpxEavrEuBuVy4B/h0o7YzJV8pPLgboeJoXAYZQv6XjpYxd10zBSZtfHkE3qhYcidqCLpuzS14CXqLV0Nq5jvo2guvAGS3KqOt7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8MgqjzU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8MgqjzU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905431F000E9;
	Thu, 30 Jul 2026 15:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785426452;
	bh=80Y6/a5SNgKRv91Sm2MdcI3h4HQI0aYpBjmFMWeEu1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I8MgqjzU6Q0oGytB3So0sLrFTKdIP/MVnRHyXVv0xRY6xDnHjUlaTdVF8vINJ4DE5
	 55GV3eJoLhd40PSR4GPgwbvoiKpfsXYZXJQ6lstOXE2kfkOcTK0uUjH80+Wd4+z2hN
	 UWMbxgEYhD49z8CkkNMRsZbuNo0eb89nfa3imAbjWMSQ+zWXGC4FT/Y1226yD6QJjb
	 f+FqABiGvC0XeX9WaiGe6nQX+Tkvx8/LNiTe3lca1erpQ+QTMnLWWHNb5Z8f/8uZi0
	 kcGH6jf9FFHgkmUT6X/D8DOCp5eB6oVKjYEwnMMKtjQ6nUJq3TprARmfS2JOoB7HY4
	 9zRlRe6AhgzXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 15/18] media: iris: Introduce buffer size
 calculations for AR50LT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260730-iris-ar50lt-v8-15-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-15-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:47:32 +0000
Message-Id: <20260730154732.905431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The AR50LT-specific VP9 line buffer size calculation omits sever=
al essential buffer components, potentially leading to an out-of-bounds DMA=
 write by the VPU hardware.
--

--- Patch [15]: [PATCH v8 15/18] media: iris: Introduce buffer size calcula=
tions for AR50LT ---
commit a7ab33bf859a57941fb00808f15050baad5cf909
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Introduce buffer size calculations for AR50LT

This commit introduces AR50LT buffer size calculations for both the encoder
and decoder. It reuses common buffer size calculations while adding the
AR50LT specific ones separately.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers=
/media/platform/qcom/iris/iris_vpu_buffer.c
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c

[ ... ]

> @@ -492,6 +689,17 @@ u32 hfi_iris3_vp9d_lb_size(u32 frame_width, u32 fram=
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
Are we missing some components in this VP9 line buffer size calculation?

Looking at the non-AR50LT VP9 calculation (hfi_iris3_vp9d_lb_size), there
are several additional components such as size_vpxd_lb_fe_top_ctrl(),
size_vpxd_lb_recon_dma_metadata_wr(), and size_vp9d_qp().

The AR50LT line buffer calculations for H.264 and HEVC also properly include
their respective recon_dma_metadata_wr and qp components.

If the AR50LT hardware expects these regions during a VP9 decode session,
omitting them could potentially lead to an out-of-bounds DMA write by the
VPU hardware. Should these components be included here as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iris-ar50l=
t-v8-0-6597c08cea6f@oss.qualcomm.com?part=3D15
