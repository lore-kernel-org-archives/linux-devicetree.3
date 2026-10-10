Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FED3451CE
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620489; cv=none; b=WOx4cDyRDX1KgIrybeIz/IL81MdzsT8m5N4eT4T1hOwOk6FXnChmiuf4FBPRPfgZJYEcvUThteptKW5/iSmymJ6BzUPdz1pFi4+TRnSv1MhoZ6IydZFM1rkwY6pqXgv+LjaS0nO6CjR8/s8laHY9/oJnR0bWm4Dd27+/fDu+ssM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620489; c=relaxed/simple;
	bh=OH4aMVZXNXlHU79EfHmGqrRK66QK0Ka+iBk4ilPODQs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qVVmGzgEXFM9EeUK5xn2jmRd+Dw46fDQPGCbvQFKbicD3861DGfp33ocu/IzERo2E71uWUiH09ju41W0JFrsZslS5nExPer/rHGVsT218997DHZVortXMro1UpctIPKi4ZUXdpcheCUgdqLkCilPeyyaSIidp37Ampu8V83cC/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmdVWK6N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmdVWK6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CBB1F000FF;
	Sat, 10 Oct 2026 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791620488;
	bh=y/NMxZXibt+bhi4V5qgBh89d405Cxaq1s4nBQS+KBmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CmdVWK6NzPh9vgmGkEpv3Dv8pHCvJjHyj/CLOjMuSXhc8fs0vHoi2Cq+Kqz38ItbT
	 JeormOT7A58VfJqzLx0j8HjjGVvVtfFy72EIx/USHFLY152iD3U4s5j4I2rNMY25GE
	 AQd1SqDbuxnQSS3lESRalDJsE8up8QKGSkHvTa3MA/Q4O0zBpVAA6s9VJQT32rHNlQ
	 9ftky7Gaj63brkdkKwtqm/DxuQf8kyjiB/D++VEnHaoOeXatgC2ypIrwxXvVbOGMTE
	 Q39XJkKaQvZ5tEEHJJsur1+yk0s18hUaehHVFKEuHPg2MMTKsaY69G5gzrqxnHkGH0
	 xGqcnyY0KLQhA==
Message-ID: <sashiko-outbox-166336@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 11/13] media: mediatek: jpeg: add jpeg compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <34f85b6c0aef3cacad9644c81ef78a7e83575935.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <34f85b6c0aef3cacad9644c81ef78a7e83575935.1791614327.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:21:26 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: mediatek: jpeg: incorrect STALL address extension calculati=
on in 34-bit mode
--

commit ab319417645f402435984f080997cd803d5661ce
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: add jpeg compatible
   =20
Add jpeg dec and enc compatible for mt8196

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 0907960db1436..8e96501a4f9fa 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1919,6 +1919,20 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drv=
data =3D {
>  	.jpeg_worker =3D mtk_jpegenc_worker,
>  };
> =20
> +static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata =3D {
> +	.formats =3D mtk_jpeg_enc_formats,
> +	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_enc_qops,
> +	.m2m_ops =3D &mtk_jpeg_multicore_enc_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-enc",
> +	.ioctl_ops =3D &mtk_jpeg_enc_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_YUYV,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.multi_core =3D true,
> +	.jpeg_worker =3D mtk_jpegenc_worker,
> +	.support_34bit =3D true,

[Severity: High]
This problem wasn't introduced by this patch, but setting support_34bit to =
true
makes a broken 34-bit code path reachable for the first time.

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:mtk_jpeg_set_enc_=
dst(),
the STALL address extension is calculated by adding the buffer size directl=
y to
the 2-bit extension address:

	if (support_34bit) {
		addr_ext =3D FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
		writel(addr_ext, base + JPEG_ENC_DEST_ADDR0_EXT);
		writel(addr_ext + size, base + JPEG_ENC_STALL_ADDR0_EXT);
	}

Since size is in bytes, won't adding it to the 2-bit addr_ext write a massi=
vely
out-of-bounds value to the hardware extension register, rather than correct=
ly
extracting the upper 32 bits of dma_addr + size?

Could this corrupt the DMA engine's STALL boundary setup and risk memory
corruption or IOMMU faults?

> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791614327.gi=
t.kyrie.wu@mediatek.com?part=3D11
