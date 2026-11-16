Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794669;
	b=iYRLSXlphsb/kxCxRB9yj2vmzq0/jexmGg3LIfFmG7krJCpYblfhenC3nY8CCqLJtYZe
	 xn+NvNzPR04dzm1hDtGzpONb8jgJOtLrWX3zc0f6/vZETdxrVMSRbhjmPDmaUbvMgyRqM
	 VIPB2tcrLgi3p/m3dmnRKep4aFuEEXAX0FQHKvABc3ObjWyZgBZBzwmVXrzc0kwuj7fVO
	 GzBiaNg//uK720W9+UyaM/2qlAun1k0rnsHHbxnlsECkpAVIEkgLUynwIfByf09qw4nx2
	 xXKqD23asLDgx9vi2TOtMsM3rD9/0qrWDx0ytczvbQFTX6hHdKGYget8BpoSPBcbC0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794669;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N7ZWs3CgKW5BbP1cOsVsIE1/r4C9JHPX56wBYCwWr0Y=;
	b=1FOvZb3xARGRpEfA8w+m6JH9G3oUvpm1UYsyV6beLEQqvcJ6qVldFyI/Gs8lXAtqA8sG
	 vgnmaw5c/VbY0D2KUIZuD5LWixg/mwyHovU3IxKQ/6ZsovA9Mmkn33QCHjVPUPM/Gcz6I
	 z1yUTFrZa+gpKR2AGxPS9bboI7oY0gu2LQ/obB7GH3aPnF3b0bt8z4Y6x+Yt9rDViUIdS
	 3+VcyTcidjN3+lRMOfnmNdUU/ptS6GvZ9Eq/VsGaMPXnUUQIbqe4Oh73b6jZIILq92htg
	 UYkuPsof1NHxQ7uSqJloJunIcQZxzGSR2ZHLaFmyTAD8SxEI9Ea0n0GVFc6rHm1yMJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKTrOw5R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BC8606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKTrOw5R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AED1F000C4;
	Mon, 16 Nov 2026 02:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794668;
	bh=N7ZWs3CgKW5BbP1cOsVsIE1/r4C9JHPX56wBYCwWr0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FKTrOw5RiT0MbtKmKyGxgaq2cMf6owJv7iRXxTqHku/WKxcEvUG+dt3Fp3gAjIhBJ
	 cZH34usAumlefQAmJlHFJt20OLLQ4nvjNgdBsMP5PU01+uk6Die9mdrNgpEaVJqw5n
	 GwgLbDvMpSOTtW7ya2ow3vSEhi6JfGygHU37wCvpql64PUfLrDgIXQyi7j++9PUezk
	 zesiPR3XX8lA1cCDrMKc8ns8Zxyku4YWZaW9fcG1m3UOeTKsNCihxgBjWQYy0iDG5v
	 31JRkWq5mHflJ7VtNcPZ4gOLb9tpTvYU1U48bPrVrnK5kw+if/3e4NIXlt4y/IJ2X3
	 DgGGc00oh2uGA==
Message-ID: <sashiko-outbox-216062@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 12/13] media: mediatek: jpeg: add jpeg compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261116013402.1273016-13-kyrie.wu@mediatek.com>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-13-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 02:04:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] media: mediatek: jpeg: bad 34-bit stall address in
  mtk_jpeg_set_enc_dst()
--

commit 2178cb0abdb84f47ce9c6cd9ebe6e4f64b01196b
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: add jpeg compatible

This commit adds MT8196 device tree compatible strings and driver variant
data for the MediaTek multi-core JPEG encoder and decoder.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 1a289e4487930..b38feef2dcbd4 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1963,6 +1963,20 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drv=
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
> +};

[Severity: High]
Does enabling support_34bit with mtk_jpegenc_worker() program a corrupted
upper stall address into JPEG_ENC_STALL_ADDR0_EXT?

mtk_jpegenc_worker() calls mtk_jpeg_set_enc_dst(), which adds the buffer
byte size directly to the 2-bit upper address extension instead of
extracting the upper bits of dma_addr + size:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:mtk_jpeg_set_enc_dst=
() {
    ...
	if (support_34bit) {
		addr_ext =3D FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
		writel(addr_ext, base + JPEG_ENC_DEST_ADDR0_EXT);
		writel(addr_ext + size, base + JPEG_ENC_STALL_ADDR0_EXT);
	}
}

Because size is page-aligned, any carry across a 4 GiB boundary in
dma_addr + size is lost from bits [1:0] while upper bits of size are
written into the register, corrupting the 34-bit destination end boundary
used to stall DMA writes when the encoded bitstream overflows the buffer.
Should JPEG_ENC_STALL_ADDR0_EXT be programmed with
FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr + size))?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116013402.1273=
016-1-kyrie.wu@mediatek.com?part=3D12
