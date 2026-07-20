Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755593AFB1C
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 06:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784530206; cv=none; b=Kunor4PSJpXIpaohz3bhgPO02thTZcwSM7IXqAOINGpuTLlm5Aw8zFNqwJNwjefHq4OthtQ1DZeHY7/PbfY/HDsbV4VTiF0m7E+eELZb+dEBwU8UIYRhNz/97WvrbUpHi3fGXhs5Hq1+haKlq7AZAUp1S14pHKuovgatJ8L7UXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784530206; c=relaxed/simple;
	bh=gq0u5Y4K/wYXPBMolq4DF58EikiSduhZTzXkJbITZoQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bOhLBb6YYsqFnZ2WVk1rtdK/Mmurt7Kbo8vhqqN56onAw4+4DedeuF1mj/oYhPn3684qNcbaddA9F8IKq4aCKjvPfx/uxKXPvJAWOeowVsWLfZ+CpcBQCDThueaePmKwsMyyLPbc35tR6m0U/4Er1gIbnTfJSulKBUB6TkdBaIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c62ZuPXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c62ZuPXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9B21F000E9;
	Mon, 20 Jul 2026 06:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784530205;
	bh=H9I8ezqyRSc+celpFW8bJJo9h8mtWeuXr0AU6HhyyT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c62ZuPXXF1isBCm2gyvvbC0LfYXguKL1/qcGVyEejvbxETLfegvV0fLT+CwyAkO8A
	 HpLR1K9udRiXvZdDRhO2V6kHwGDqsl7tPkEYkCuCWHvRf89C55/UE3UOwBjnlNHxxo
	 vErlXD7zN1VcWl6bXMaJQTUcJ2+FJDensI9k0kBaQnkdkVHqQ8v3wAt3kvSi9VgUa4
	 NBvQ6aSUDewT5yKVY9NN7Wp7Qty49rjj/kdsehE/EKK0xxb+3Ok6+2GKSNz8wnb/Oi
	 nu2m4jciI9rbOYoLwFnRL/3saAgyj8Ym2Fhlo5D+sQYoK1pCW31SqXfG6ePu4TFwAg
	 xuWNbaM65A4iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/3] media: mediatek: jpeg: add compatible for
 MT8189 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jianhua Lin" <jianhua.lin@mediatek.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720062829.7343-4-jianhua.lin@mediatek.com>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
 <20260720062829.7343-4-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 06:50:04 +0000
Message-Id: <20260720065004.CB9B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] Missing DMA Mask Configuration for 34-bit IOVA support.

Pre-existing issues:
- [High] Use-After-Free when unbound while a V4L2 file descriptor is held o=
pen.
- [High] Use-After-Free due to uncanceled job timeout delayed work during u=
nbind.
- [High] NULL Pointer Dereference due to interrupt request before memory-to=
-memory context initialization.
- [High] DMA Address Calculation Bug for 34-bit stall address extension.
--

--- Patch [3]: [PATCH v10 3/3] media: mediatek: jpeg: add compatible for MT=
8189 SoC ---
commit 3c5efcbd1b6f6e5dab41b7f01500bcc550eb3c09
Author: Jianhua Lin <jianhua.lin@mediatek.com>

media: mediatek: jpeg: add compatible for MT8189 SoC

This commit adds new compatible strings and specific driver data to support
the JPEG encoder and decoder on the MT8189 SoC, which uses a 34-bit IOVA
address space.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec4830811..14f2991a40535 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

[ ... ]

> @@ -1899,6 +1903,38 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvd=
ata =3D {
>  	.multi_core =3D false,
>  };
> =20
> +static const struct mtk_jpeg_variant mtk8189_jpegenc_drvdata =3D {
> +	.clks =3D mtk_jpeg_clocks,
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

[Severity: Medium]
Will the 34-bit addressing hardware capability be silently disabled by the
kernel's DMA API?

The driver sets .support_34bit =3D true for the new MT8189 variants, intend=
ing
to allow the hardware to address up to 16GB.

However, the driver never calls dma_set_mask_and_coherent() or dma_set_mask=
()
in the probe sequence. Without this call, the kernel's DMA APIs assume the
default 32-bit mask (4GB) for platform devices.

Does the driver need to configure the DMA mask during initialization when
support_34bit is enabled?

[Severity: High]
This is a pre-existing issue, but does enabling .support_34bit =3D true here
activate a buggy DMA address calculation path in mtk_jpeg_set_enc_dst()?

Looking at drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c, the 34-b=
it
extension logic correctly calculates the base 2-bit extension:

    addr_ext =3D FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));

But for the stall address, it erroneously writes addr_ext + size:

    writel(addr_ext + size, base + JPEG_ENC_STALL_ADDR0_EXT);

Since size is the byte size of the buffer (e.g., 0x20000), wouldn't this wr=
ite
an improperly large value into a register meant for the upper 2 bits of the
address, rather than calculating upper_32_bits(dma_addr + size) & 3?

Could this lead to memory corruption or IOMMU faults by incorrectly setting
the upper address bits for the hardware DMA?

> +};
> +
> +static const struct mtk_jpeg_variant mtk8189_jpegdec_drvdata =3D {
> +	.clks =3D mtk_jpeg_dec_clocks,
> +	.num_clks =3D ARRAY_SIZE(mtk_jpeg_dec_clocks),
> +	.formats =3D mtk_jpeg_dec_formats,
> +	.num_formats =3D MTK_JPEG_DEC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_dec_qops,
> +	.irq_handler =3D mtk_jpeg_dec_irq,
> +	.hw_reset =3D mtk_jpeg_dec_reset,
> +	.m2m_ops =3D &mtk_jpeg_dec_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-dec",
> +	.ioctl_ops =3D &mtk_jpeg_dec_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_YUV420M,
> +	.support_34bit =3D true,
> +};

[ ... ]

> @@ -1938,6 +1974,14 @@ static const struct of_device_id mtk_jpeg_match[] =
=3D {
>  		.compatible =3D "mediatek,mtk-jpgenc",
>  		.data =3D &mtk_jpeg_drvdata,
>  	},
> +	{
> +		.compatible =3D "mediatek,mt8189-jpgenc",
> +		.data =3D &mtk8189_jpegenc_drvdata,
> +	},

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-free
if the device is unbound while a userspace application holds the V4L2
character device file descriptor open?

The struct mtk_jpeg_dev pointer is allocated via devm_kzalloc() and its
lifetime is tied to the platform device. In mtk_jpeg_remove(), the driver
unregisters the V4L2 device and explicitly releases m2m_dev:

mtk_jpeg_remove() {
    ...
    v4l2_m2m_release(jpeg->m2m_dev);
    v4l2_device_unregister(&jpeg->v4l2_dev);
}

The core structure is freed immediately by devres when remove() returns.

When the application later closes the file, mtk_jpeg_release() is called and
accesses the devres-freed jpeg structure:

mtk_jpeg_release() {
    struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
    ...
    mutex_lock(&jpeg->lock);
    ...
}

Should the driver wait for file operations to complete or manage the lifeti=
me
of the jpeg structure differently?

[Severity: High]
This isn't a bug introduced by this patch, but does unbinding the device wh=
ile
a hardware job is in flight cause a use-after-free via the job timeout dela=
yed
work?

mtk_jpeg_single_core_init() initializes a delayed work jpeg->job_timeout_wo=
rk.
When hardware processing starts, this work is scheduled.

However, mtk_jpeg_remove() fails to call cancel_delayed_work_sync() for
jpeg->job_timeout_work.

If the device is unbound before the timeout expires, the struct mtk_jpeg_dev
will be freed by devres. When the timer eventually expires,
mtk_jpeg_job_timeout_work() will dereference the freed jpeg pointer.

Should mtk_jpeg_remove() cancel this work before returning?

[Severity: High]
This isn't a bug introduced by this patch, but is there a risk of a NULL
pointer dereference if a hardware interrupt fires immediately after the IRQ
is requested?

In mtk_jpeg_single_core_init(), the driver calls devm_request_irq() to
register and enable the IRQ handler.

However, jpeg->m2m_dev is not initialized until mtk_jpeg_probe() calls
v4l2_m2m_init() later in the execution flow.

If the bootloader leaves the hardware in an active or errored state, the
interrupt could fire instantly. mtk_jpeg_enc_irq() or mtk_jpeg_dec_irq() wi=
ll
invoke mtk_jpeg_enc_done(), which attempts to fetch the current context:

    ctx =3D v4l2_m2m_get_curr_priv(jpeg->m2m_dev);

Since jpeg->m2m_dev is still NULL at this point, will this dereference a NU=
LL
pointer?

> +	{
> +		.compatible =3D "mediatek,mt8189-jpgdec",
> +		.data =3D &mtk8189_jpegdec_drvdata,
> +	},
>  	{
>  		.compatible =3D "mediatek,mt8195-jpgenc",
>  		.data =3D &mtk8195_jpegenc_drvdata,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720062829.7343=
-1-jianhua.lin@mediatek.com?part=3D3
