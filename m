Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660C33290D5
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159753; cv=none; b=bVHs/lFHNOPYds/8fOqYM7JeuE8KFnFWYkcemY6vQqaMjSc2orCi8jFvrBvzGzp8otFrKDIndWmmGv1oH6HQSmIcHVD3GGW47WRqpufyXZo+/KiKxelueCN2qkB6Ki7F4tCpOUyJ8XOydpaZF3tnP8kHXg0PtK+ZaTNwT+Wq9sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159753; c=relaxed/simple;
	bh=cUsZU6cxHVkW5sQ2dfeJQ7nOpTq2keyKKa8B0dFTl3g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cgDy2qZLJSBGxVIuo+A0FGCoqBvEQOsGxzcbjB9xQe50DmL9UGHySnj4fWrCO8ZOvqJrIe4x0fSMA4RBlvfaAo5htwAU3c5xZ7Ke7Y/cIASnQ6vrby7QPgtgKT+QgAZs9evNJ8/F0/5dSihRUpnObhriupiZKV7T+Mgc76L2R6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhjsQh9/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhjsQh9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC2EC2BCB7;
	Tue, 19 May 2026 03:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779159753;
	bh=cUsZU6cxHVkW5sQ2dfeJQ7nOpTq2keyKKa8B0dFTl3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bhjsQh9/Ds9wnVkllxkhGFGSb+F13Fi8jmPatjW5Z4f3quzW+n81jbC/cuDumw2Ym
	 EmxnQEiT+FpSLgZ0qier6mlZh429sjaCsdFzJsdRODFexEf0MMTpArgcFoFOrqAoRa
	 sdIVeFMd0gdO5znGIAyFUcYoWOeJ7rNl/TkFk+76K7G2gTjGLpl0FIV7KxcC98Svxt
	 tG1W15VELLZoVfG7TnTlCkWfAhWhZVMffM8paZ9B7nWzpmbF+1u9XbDg8yskKpPWIz
	 IrS65ou8L1lVipl4pXjdS8ZNkCmvczyNxMwygku+gf4aOZ9RLnqY3MY/CrsdHMueuE
	 gKJr9acyEkT6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/3] media: mediatek: jpeg: add compatible for MT8189
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jianhua Lin" <jianhua.lin@mediatek.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519021726.19137-4-jianhua.lin@mediatek.com>
References: <20260519021726.19137-4-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 03:02:32 +0000
Message-Id: <20260519030232.BBC2EC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Missing cancellation of `job_timeout_work` in `mtk_jpeg_remove=
()` leads to a Use-After-Free.
- [High] Variant structures use globally shared static arrays for clock def=
initions, which are illegally mutated during device probe by `devm_clk_bulk=
_get()`.
--

commit 8f115ea6a1de2f80507b4b60d5ec40d3fdf1eb31
Author: Jianhua Lin <jianhua.lin@mediatek.com>

media: mediatek: jpeg: add compatible for MT8189 SoC

The commit adds support for the MT8189 SoC's JPEG encoder and decoder by
introducing new compatible strings. It also adds the associated driver data
structures configuring the hardware for a 34-bit IOVA space and single
clock setup.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec4830811..14f2991a40535 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1868,6 +1868,10 @@ static struct clk_bulk_data mt8173_jpeg_dec_clocks=
[] =3D {
>  	{ .id =3D "jpgdec" },
>  };
> =20
> +static struct clk_bulk_data mtk_jpeg_dec_clocks[] =3D {
> +	{ .id =3D "jpgdec" },
> +};
> +
>  static const struct mtk_jpeg_variant mt8173_jpeg_drvdata =3D {
>  	.clks =3D mt8173_jpeg_dec_clocks,

[ ... ]

> @@ -1899,6 +1903,38 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvd=
ata =3D {
>  	.multi_core =3D false,
>  };
> =20
> +static const struct mtk_jpeg_variant mtk8189_jpegenc_drvdata =3D {
> +	.clks =3D mtk_jpeg_clocks,

Does this code pass a shared static array to devm_clk_bulk_get()?

During device probe, the global mtk_jpeg_clocks array is passed directly:

mtk_jpeg_probe()
    devm_clk_bulk_get(jpeg->dev, jpeg->variant->num_clks, jpeg->variant->cl=
ks)

The devm_clk_bulk_get() API modifies the array in-place by writing the
acquired struct clk pointers into it.

If multiple device instances probe, or if unbind/rebind cycles occur, could
the clock pointers be clobbered by subsequent probes? This might lead to
hardware lockups since clocks wouldn't be enabled or disabled properly, or
use-after-free conditions when devres frees the clocks but dangling pointers
remain in the global array.

Should the driver dynamically allocate a per-device clk_bulk_data array
during probe instead?

> +	.num_clks =3D ARRAY_SIZE(mtk_jpeg_clocks),
> +	.formats =3D mtk_jpeg_enc_formats,
> +	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_enc_qops,
> +	.irq_handler =3D mtk_jpeg_enc_irq,
> +	.hw_reset =3D mtk_jpeg_enc_reset,
> +	.m2m_ops =3D &mtk_jpeg_enc_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-enc",
> +	.ioctl_ops =3D &mtk_jpeg_enc_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_YUYV,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.support_34bit =3D true,
> +};
> +

This isn't a bug in this patch, but looking at the single-core implementati=
on
that this variant uses, mtk_jpeg_single_core_init() sets up the workqueue:

mtk_jpeg_single_core_init()
    INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);

However, mtk_jpeg_remove() doesn't cancel this work:

mtk_jpeg_remove()
    pm_runtime_disable(&pdev->dev);
    video_unregister_device(jpeg->vdev);
    v4l2_m2m_release(jpeg->m2m_dev);
    v4l2_device_unregister(&jpeg->v4l2_dev);

If the driver is unbound while a job is active, mtk_jpeg_remove() will
complete and the devm subsystem will free the jpeg structure. If the timeout
work fires afterwards and executes mtk_jpeg_job_timeout_work(), will this
result in a use-after-free when it dereferences the freed jpeg pointer?

> +static const struct mtk_jpeg_variant mtk8189_jpegdec_drvdata =3D {
> +	.clks =3D mtk_jpeg_dec_clocks,

Does this structure also pass a shared static array to devm_clk_bulk_get(),
similar to mtk8189_jpegenc_drvdata above?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519021726.1913=
7-1-jianhua.lin@mediatek.com?part=3D3
