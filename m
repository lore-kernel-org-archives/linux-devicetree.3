Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116765275AF
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868743; cv=none; b=jxucTje7rtGV7EGa5MF3DD2K24ri1jeYhlwyZpGpYhqxwXCMcNyaP0U4mYfIYHGuUUiAqqUQx31QgaIMi8oE2s+qAb2tVdL7HOsFfd/HuH70TEtWg8xKpWbqfQu/fc+tJ7uQO5gayfkA9CBmmsWiisr5svFnIsVZBQoWqvlAQAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868743; c=relaxed/simple;
	bh=jtZmuGgAHouaXkH+PZFqhcG+frXPyg383XKvadquJt8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RDAZehfJK+6Vj5E65vWs67kwFxsBGr7AHJmOBLHr145N5ZXwZtgCAMmI/G3FmIrNuScYYni8mAALOSY/0Mhlrls1UU664aLW1AR/qcIzgK3KbTM+xjfNqrnz/8/tkl93dTxpoVA5j9PYxuHXRvaVc9xawWCtXzDNgJua50Zow28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbC16ydo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbC16ydo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAC61F000FF;
	Thu,  1 Oct 2026 15:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790868741;
	bh=ceMNEii/4nqCUPxCyCNYr/rG8pn/ESdVEA0qtcv7oLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CbC16ydoa3h/u3j+qf6EGM2pl0l2c3XZjYHUuQzghbiBh+0kQO4T19wN+ou1dvEjm
	 cxomT2fu14S2t8pfQDyuV7lzKKw2a0t1woB+ORi7VVeZkf1WBoUUXhbvpnciBhusIT
	 vrl0DFsq9r2ehLDn7ZfZVtsgSvw5Sdj5414sfanYOZsGS40SyDGEVMtYjXm0RoVvsU
	 oQurybeGgevFDDRa0QN/5rio5KxDXjsZ0XhopvhHyo5ICi9jx5qThMs7PUIyb5/vTO
	 WnGkORxWSe8RdD88SHfl906Lmdxf4L6JXbPYe3IZtqrr7cy4W4yH3BF3CteOvy6Mo2
	 5r/q4oAMggPnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] media: iris: add iris4 specific H265 line buffer
 calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261001-kaanapali-iris-v4-3-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
 <20261001-kaanapali-iris-v4-3-642f9ac5e699@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 15:32:20 +0000
Message-Id: <20261001153221.4FAC61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: iris: quadratic scaling of dpb_obp due to double multipli=
cation
--

commit 8ebbe0addefc2c9da9b09f0ae52a879bbb0ec3f3
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: add iris4 specific H265 line buffer calculation

This commit introduces a new H265 decoder line buffer size calculation
formula for iris4 (VPU4). It resolves firmware failures seen with specific
test vectors by providing a larger buffer size for certain configurations.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers=
/media/platform/qcom/iris/iris_vpu_buffer.c
> index faebb54728660..a99b8030e3dd0 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
[ ... ]
> @@ -1814,6 +1814,63 @@ static u32 hfi_vpu4x_buffer_line_vp9d(u32 frame_wi=
dth, u32 frame_height, u32 _yu
[ ... ]
> +static u32 hfi_vpu4x_buffer_line_h265d(u32 frame_width, u32 frame_height=
, bool is_opb,
> +				       u32 num_vpp_pipes)
> +{
[ ... ]
> +	if (is_opb)
> +		dpb_obp =3D size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
> +
[ ... ]
> +	return ((ALIGN(dpb_obp, DMA_ALIGNMENT) + ALIGN(se_left_lb, DMA_ALIGNMEN=
T) +
> +		ALIGN(vsp_left_lb, DMA_ALIGNMENT)) * num_vpp_pipes) +

[Severity: Medium]
Does this code multiply dpb_obp by num_vpp_pipes twice?

Earlier in this function, dpb_obp is calculated with a multiplication by
num_vpp_pipes. Then it is included in the return statement here, where the
sum containing dpb_obp is multiplied by num_vpp_pipes again.=20

This results in quadratic scaling for the dpb_obp portion of the buffer
size. Is this double multiplication intentional, or should one of the
multipliers be removed to prevent over-allocating the line buffer?

> +		ALIGN(fe_left_lb, DMA_ALIGNMENT) + ALIGN(top_lb, DMA_ALIGNMENT) +
> +		ALIGN(qp_size, DMA_ALIGNMENT);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-kaanapali-=
iris-v4-0-642f9ac5e699@oss.qualcomm.com?part=3D3
