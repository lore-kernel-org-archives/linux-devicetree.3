Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B6A44AB77
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193755; cv=none; b=VGDXAn+QR5ku051XugPT3W0EA3/sezMjVkZRJFc9W+rmeu5ODdd+TDpUsxTxuMljUOe3UNDaVI+O73iKu2VwdIEkLY0Nu9/sUhGskTDcSS+6T+ZHrBXNh357sc9d6V0fUc/T0EPd3FoMpnc8CdXyu9jUZdoWz5yVLxePqL6lRmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193755; c=relaxed/simple;
	bh=dvILsUBDeZJ8RJTfnTEq/mMiTQuSCFhEAXtYKMx5sYw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VlLuIyDjdECehcYB5u9NMGHvw7TCNfOr/5HvgrfllfOsjDFkuXvPW/c1aunuH6zkDjuAL7Tu0Yq0i4WLIF+vePmUxOYQSGbhWuEueYJ/b1L619IZOyXqwLanVIQz55m1wUdsMyIdNtTH887dzkyrgPi3QMjaxzaMfYEucxTFklc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQIDAuMf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQIDAuMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCD61F000E9;
	Mon, 31 Aug 2026 16:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193754;
	bh=ZpQ0iB1npyJfePsiNowNvDNd0XEumVmYCV8aN95HhEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VQIDAuMfw9SUEYS/ucliVds0qtyxWqboXOjM7bWkil4HUFzx990kNQnYaomSOYnVj
	 IHHlXM70Y9TeCoTX9nH46avoSRzUq825oSYOzYJpzKtpuGnWbfhUUX97WDax9NXE7H
	 BnyLdgloiUKfXQoQzA1/IuFz28Yr3Ji0VcAGviLnwzGval7kp0reiFWeTpyr6bc/dK
	 O9udK2gZLZpxx557LvbJmDUAy7E65hYINuQUdM7eNmsxikaQzW2LPy7hBykvys5QcR
	 wHUsFvtsh3bP2KAixb2LvJBnzXJ2mKL+7SnlLv7arChv0Vc3qbDDXcYBXnp6pMscVD
	 tI5xk45d2w1FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iommu: apple-dart: Support specifying the DMA
 aperture in the DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janne Grunau" <j@jannau.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-iommu-apple-dart-aperture-v2-2-d16ce3770299@jannau.net>
References: <20260831-iommu-apple-dart-aperture-v2-0-d16ce3770299@jannau.net>
 <20260831-iommu-apple-dart-aperture-v2-2-d16ce3770299@jannau.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:29:13 +0000
Message-Id: <20260831162913.ACCD61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing Kconfig restriction for 64-bit architectures causes build w=
arnings and undefined behavior on 32-bit compile tests
--

commit 366b6e1b688b18466f157e2752afc68e1389b902
Author: Janne Grunau <j@jannau.net>

iommu: apple-dart: Support specifying the DMA aperture in the DT

This commit adds support for parsing the "iommus" DT property to specify
the start and end of the DMA aperture. It intends to restrict compile
testing to 64-bit architectures to prevent warnings when calculating
64-bit dma_addr_t values.

> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index b160fb464c5fb..ebf4547d32b41 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
[ ... ]
> @@ -803,20 +814,65 @@ static int apple_dart_of_xlate(struct device *dev,
>  	struct platform_device *iommu_pdev =3D of_find_device_by_node(args->np);
>  	struct apple_dart *dart =3D platform_get_drvdata(iommu_pdev);
>  	struct apple_dart *cfg_dart;
> +	dma_addr_t dma_max =3D DMA_BIT_MASK(dart->ias);
> +	dma_addr_t dma_min =3D 0;
>  	int i, sid;
> =20
>  	put_device(&iommu_pdev->dev);
> =20
> -	if (args->args_count !=3D 1)
> +	if (args->args_count !=3D 1 && args->args_count !=3D 5)
>  		return -EINVAL;
> +
>  	sid =3D args->args[0];
> =20
> +	if (args->args_count =3D=3D 5) {
> +		dma_addr_t length =3D ((dma_addr_t)args->args[3] << 32) | args->args[4=
];

[Severity: Low]
The commit message states "Limit compile testing to 64-bit architectures to
avoid warnings in the calculation of 64-bit dma_addr_t values", but there a=
re
no changes to drivers/iommu/Kconfig in this patch.

When building this driver on a 32-bit architecture with CONFIG_COMPILE_TEST=
=3Dy
and without CONFIG_ARCH_DMA_ADDR_T_64BIT, doesn't shifting a 32-bit dma_add=
r_t
by 32 bits here trigger undefined behavior and compiler warnings like
-Wshift-count-overflow?

> +
> +		if (!length)
> +			return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-iommu-appl=
e-dart-aperture-v2-0-d16ce3770299@jannau.net?part=3D2
