Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589098;
	b=mgu3sCBwVYWBalf2ALDoNhJcmpqxaP+Mlz3tnIBRB3YwWbvjJSrBqKj8GDlgW1RNmr4W
	 c0/Wc+yAOsg7I/uNt6LDiGNHLfdEQt8VBfBniDlv6J39TDoginy25y4eenxLrR/5i9HFU
	 uCHF9q6vvwQQe6rwuiTPGf7jY1cnPi4ONMG81dEm6h7VtSOxP2efeDiy3ledkBVSkxC5f
	 ykpCK1Y1YPjXVpwcattXtScUbwh5NLASZbLwk57/cMKl4NMMBsh8cCGDJWjlyZY2B3fph
	 kaHPzt2bdW1pPFDp9bEmf74QzjVNZ+f8+ahkLOoVouEr5WP+JlmAjIwlxH63sgSDviQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589098;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4riGGxfuoYsKC9WGOqbajoDmPC4aJKTL5rf0L8wnBpc=;
	b=W5+Yb+Mpm2Rx1tGXWB/eSfA07TAyDPFgBZkbavjWz8QTm/W5H585lkPb3MDKjrprooM0
	 o/ZLU/AcUbmnm/DjF00cxPeIE2OcnFDBXDN9lWH4d6B6xjA+a+DxT7diYd7j00+m2gjVy
	 Es8DmVTOH3fi6ZAJXxjnw+3jCJjp4s5Xsh3snwRRrbsrCXdmDJ++C5XVxWc52Qr39KxoK
	 pqlWPxO2ATXlFZXMvb2HDAF+3c+E5IZHZZpft9gfGgx1pIxd23inmXdmdlctcjtFVEj8Q
	 TfFgIcFJFfdgUGDSkXYRacj5h51WJJ7Rpnm/WOV2DRjic8LbJL1ACQtmAfuNbRVgjmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Di+e6ZiT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E0606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Di+e6ZiT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC311F000D0;
	Wed, 25 Nov 2026 06:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795589098;
	bh=4riGGxfuoYsKC9WGOqbajoDmPC4aJKTL5rf0L8wnBpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Di+e6ZiT3SA0EEKaLEmgXDpeREo0MjKx3+yZ6sxwHuTX9B+VtcYnq2Gz8oT8L0JX9
	 RbSLtx4gY+pcVc6QHLMGjYsgv/fA/A4Ow5852g/A0E7mIYdJLvoxkAVMFJU5PJQFgK
	 5XnxWCS0yMDuSBbk3oTVD5sidv3MjAXHj5i7XgIf0kkbFOGqgSfJhbsp9Cl/N7imEc
	 P6Pbg/MzLQvqmGmyOMyCBtzfxaziMkrjQbQpdE18it1GZ/A4uIK+SBtCVdr3zTyvDT
	 nFqHVTUMw1rWhk7pM3QNvI0UiWzjIWqgAN8uGwxgv67VbIUa4cAE26h0WmMd00FV+Q
	 MGhz6aMCo2csQ==
Message-ID: <sashiko-outbox-232730@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 14/15] media: mediatek: jpeg: add jpeg compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125061618.2544386-15-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
 <20261125061618.2544386-15-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:44:57 +0000
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
- [Low] media: mediatek: jpeg: Kconfig requires MTK_IOMMU and MTK_SMI on
  MT8196
--

commit 98d3cc1b26efcb2a1ab3f4c6f3c40747fa7aac4f
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: add jpeg compatible

This commit adds MT8196 compatible strings and variant driver data for the
MediaTek JPEG encoder and decoder.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 7e4fd36dde01d..31a0fbc0769b4 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
[ ... ]
> @@ -2013,6 +2041,14 @@ static const struct of_device_id mtk_jpeg_match[] =
=3D {
>  		.compatible =3D "mediatek,mt8195-jpgdec",
>  		.data =3D &mtk8195_jpegdec_drvdata,
>  	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgenc",
> +		.data =3D &mtk8196_jpegenc_drvdata,
> +	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgdec",
> +		.data =3D &mtk8196_jpegdec_drvdata,
> +	},
>  	{},
>  };

[Severity: Low]
Can VIDEO_MEDIATEK_JPEG be enabled on an MT8196 kernel configuration that
uses ARM_SMMU_V3 without enabling MTK_IOMMU or COMPILE_TEST?

drivers/media/platform/mediatek/jpeg/Kconfig:
	depends on MTK_IOMMU_V1 || MTK_IOMMU || COMPILE_TEST
	...
	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=3Dn)

MT8196 uses ARM SMMUv3 rather than MTK_IOMMU, and MTK_SMI has no prompt
when COMPILE_TEST=3Dn and is only selected by MTK_IOMMU and MTK_IOMMU_V1, so
the driver cannot be selected on an MT8196-only build unless those
dependencies are updated.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125061618.2544=
386-1-kyrie.wu@mediatek.com?part=3D14
