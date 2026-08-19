Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DE147DD44
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152008; cv=none; b=MG18x1aw9vqvlmBTv5J7azZND2zu9P2r1A9OPjCQL9xZuzov6aZ3YbD/huCErFJ1YEl58J+uqq9pWid/ya6Psqp90nJt0dXIpUg3lug7uAE+8nC0b4/BcyzQltEnvOrYOTVuQF+1lTWQDdr+qKsiwhPcXQo+Gz1tAgX1GZXqCWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152008; c=relaxed/simple;
	bh=uhZYR64F5Rm2eo9Iq+ivOHQrJ2K1Gfen7bx3xRIJIEI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J8nlWjGY5yGQBMU63wJLAbFh9nz4B1LUnNMnyZyNwhnjeOuy23SjZUUPbR+slH3HjY27um7uYSXUKgkWVDI187c5cTXZvOGjj3JCWKnQHLL7vq7itmkjHZqA3b+sy/lvAcxLNMSS4YMk7WQH0KeLbYSZBWcibKY5BuRKUVgtsO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fW0ygjC3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fW0ygjC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4181F000E9;
	Wed, 19 Aug 2026 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787152005;
	bh=Wwx85QgXqIMDMhNvXdso9Bjrbo3Z82hebEh42HVZIRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fW0ygjC3WFgRH26Xm9nOM0UbQBeAinxD3sWXEVx4aUqKdPSRcRdPJBhusFsqYUzAZ
	 YEQLNVWlYYgdrA/g3cgqMcDRV8Vgikje5/LcqLytn5ioxRXFA33ZJJWMZeV2IleEFE
	 oCQ9+l//WbCddPrC6cRbwQmB6AGJ5uAjEZZGV5Hn/IaDyPhy31LyEOJJ3QYNa1geFi
	 V374lzdlNszSl30VYa7dYZbX6Rz0Cs8y068pQDu6st6YsIsYCbcK8k76o/a8YXURCA
	 fv3GvMke0r/xlMbM/500Ge0Ah6QaUiuCG0XwW6qej0nlSlwxR7nPCNGyDqj3TWdKeB
	 uE76Snf2trogA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iommu: apple-dart: Support specifying the DMA
 aperture in the DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janne Grunau" <j@jannau.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260819-iommu-apple-dart-aperture-v1-2-252703f381aa@jannau.net>
References: <20260819-iommu-apple-dart-aperture-v1-0-252703f381aa@jannau.net>
 <20260819-iommu-apple-dart-aperture-v1-2-252703f381aa@jannau.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 15:06:44 +0000
Message-Id: <20260819150644.DE4181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Undefined behavior via invalid bit shift when parsing a 1-byte DMA =
window starting at address 0.
--

--- Patch [2]: [PATCH 2/2] iommu: apple-dart: Support specifying the DMA ap=
erture in the DT ---
commit ce65194c53df34be71115a91f5d6328ad1a90109
Author: Janne Grunau <j@jannau.net>

iommu: apple-dart: Support specifying the DMA aperture in the DT

This commit adds support for restricting the DMA aperture via the Device Tr=
ee
using the iommus args. Devices can specify the start and end of the aperture
if the DART device node specifies #iommu-cells =3D <5>.

> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -590,6 +600,7 @@ static int apple_dart_finalize_domain(struct apple_da=
rt_domain *dart_domain,
>  {
>  	struct apple_dart *dart =3D cfg->stream_maps[0].dart;
>  	struct io_pgtable_cfg pgtbl_cfg;
> +	u32 ias =3D min_t(u32, dart->ias, fls64(cfg->dma_max));
>  	int ret =3D 0;
>  	int i, j;

[ ... ]

> @@ -623,10 +634,10 @@ static int apple_dart_finalize_domain(struct apple_=
dart_domain *dart_domain,
>  		goto done;
>  	}
> =20
> +	dart_domain->mask =3D DMA_BIT_MASK(pgtbl_cfg.ias);

[Severity: Low]
Does this code trigger undefined behavior if a 1-byte DMA window starting at
address 0 is provided in the device tree?

If a device tree is configured with length =3D 1 and dma_min =3D 0,
apple_dart_of_xlate() calculates dma_max as 0:

apple_dart_of_xlate()
    dma_max =3D dma_min + length - 1; /* 0 + 1 - 1 =3D 0 */

This means cfg->dma_max will be 0 here, making fls64(cfg->dma_max) 0,
and resulting in ias =3D 0.

If ias is 0, this expands to DMA_BIT_MASK(0), which performs an invalid bit
shift (~0ULL >> 64).

Since size 0 (!length) is explicitly rejected in apple_dart_of_xlate(),
should size 1 also be handled to avoid this edge case?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-iommu-appl=
e-dart-aperture-v1-0-252703f381aa@jannau.net?part=3D2
