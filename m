Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA80393DEB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 03:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783568296; cv=none; b=WUwSSzz9wzeT+3BjcRKIPqf6pHo5FIEiZHfFg1Hq8WunlGPQ1a26dpHpITPh/gWY4O7/opuSFu5ixbOKUZ5iYErhxjDLB0xb4+UXxSgidkFdLSqjwt0KMdOxjxe9+0SglsZgv0aWPQn+K/PRZlA3e4Wk9I0mPgjlciSAgnMz9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783568296; c=relaxed/simple;
	bh=J14uVdB0j2HP1xMlzSjBRqeGvH/NWwEzJph9k1h/Zj4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ofywtr8FXWMlhjFQ6UCmV/vWg7rG8xp5qlReto7iU00rwEEF7rUN9LGsKA9Jvqgq4i9z6ZEeYiTQScsQj/oHxwiLq8kNGLnu7SkbObHZRGiHT76sw+PsOt0UxTZVI/b5nlzdIXsfFrQ+IClk4SS7hhjY+ebnypf/SiZdxF5dfFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKb48i+U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKb48i+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0921F000E9;
	Thu,  9 Jul 2026 03:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783568294;
	bh=QPXK0pn04boFEdn3gFUcHPlFnQ1wTZD6e7259anxea0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nKb48i+UIxcC56KJyrNr9RQprWkWWFVjOJ4b1vS1d31KXaWajYjsy+fgtQ0iBHnp9
	 Sp5lFSYViBzJ7am6tCh8j3CzU41TuGYu1oG9tb3OnLR5qP+/8bAq51SBmV9llYJY7W
	 okvombZrz1cnKXnlii2kd/dNkFt4ouBg01eNlEmD0k1CxyFMMhZs8dsKw5SpK6+ryw
	 XGXblvSXzrFjfimriUr4Tv4+fB6LuTKdVcmU1gqlPOxhFU3fl7GFMBtXKC5L9Id6gs
	 eIgeS6uSVlBtUc8FaO7d3BjSt2xdElKnQ6CPb6/LqrCq7UtXDqQ8Qq50hfrtGm7tdB
	 GuWq77rb1j2yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] media: mediatek: jpeg: add compatible for MT8189
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jianhua Lin" <jianhua.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709032657.25730-4-jianhua.lin@mediatek.com>
References: <20260709032657.25730-1-jianhua.lin@mediatek.com>
 <20260709032657.25730-4-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 03:38:13 +0000
Message-Id: <20260709033814.3E0921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect computation of the 34-bit extension for the encoder stal=
l address corrupts hardware registers.
- [High] The asynchronous `job_timeout_work` is not canceled on driver remo=
val, leading to a Use-After-Free.
--

--- Patch [3]: [PATCH v9 3/3] media: mediatek: jpeg: add compatible for MT8=
189 SoC ---
commit 29466227a18e4e4c49341e3e3e858dbacaf50d59
Author: Jianhua Lin <jianhua.lin@mediatek.com>

media: mediatek: jpeg: add compatible for MT8189 SoC

This commit adds support for the MT8189 SoC's JPEG encoder and decoder by
providing new compatible strings ("mediatek,mt8189-jpgenc" and
"mediatek,mt8189-jpgdec") and their associated driver data. It includes
enabling 34-bit IOVA address space support for this SoC.

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
       ^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This isn't a bug introduced by this patch, but enabling 34-bit support expo=
ses
a pre-existing mathematical error in the hardware register configuration.

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:mtk_jpeg_set_enc_=
dst(),
the 34-bit extension for the encoder stall address is incorrectly calculate=
d by
adding the size directly to the extracted upper 32 bits:

    if (support_34bit) {
        addr_ext =3D FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr)=
);
        writel(addr_ext, base + JPEG_ENC_DEST_ADDR0_EXT);
        writel(addr_ext + size, base + JPEG_ENC_STALL_ADDR0_EXT);
    }

Does adding the size to addr_ext result in a corrupted garbage value being
written to the JPEG_ENC_STALL_ADDR0_EXT register, since it adds the buffer
byte size to the 2-bit extension mask rather than extracting the upper 2 bi=
ts
of the combined dma_addr + size?

Can this cause the hardware to fault when the physical address crosses the =
4GB
boundary?

> +};
> +
> +static const struct mtk_jpeg_variant mtk8189_jpegdec_drvdata =3D {
[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed a potential use-after-free
during driver teardown that affects all variants.

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpeg_single_cor=
e_init(),
a delayed work is initialized for job timeouts:

    INIT_DELAYED_WORK(&jpeg->job_timeout_work,
                      mtk_jpeg_job_timeout_work);

However, in mtk_jpeg_remove(), this delayed work is never explicitly cancel=
ed:

static void mtk_jpeg_remove(struct platform_device *pdev)
{
    struct mtk_jpeg_dev *jpeg =3D platform_get_drvdata(pdev);

    pm_runtime_disable(&pdev->dev);
    video_unregister_device(jpeg->vdev);
    v4l2_m2m_release(jpeg->m2m_dev);
    v4l2_device_unregister(&jpeg->v4l2_dev);
}

If a job timeout is pending when the device is unbound via sysfs or module
removal, could the timer subsequently fire and execute
mtk_jpeg_job_timeout_work()?

Would this dereference the already freed jpeg->m2m_dev and jpeg structures,
leading to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709032657.2573=
0-1-jianhua.lin@mediatek.com?part=3D3
