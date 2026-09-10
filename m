Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBBE17A305
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 00:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788999656; cv=none; b=dpx+Z1Cdv6r8VHIzuC9Rk88ZKpfl1AlnQM8Oc7RCIDcBeYUiGbXswhLb367u+jb+2qaPg6IUtlDQTtXEmTQYnlVzOGvFWy6U2ojmXBRUhz6EEkxUHl90/9DzePNGDvs7VkUtM2qaXGwriOaXOQD5qy3fGweeSbWQknkFk/eUngs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788999656; c=relaxed/simple;
	bh=8qNqzkPjSlOlt2ZMWZjpnS1ssVsvfncYdhLdYMDFNIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p1zrcd9ZRz8vdPzSEHGffnjFOTy5VDU1mlFa8WTFx2JNMHrJ2DTm7RXGz2eh8sn70U5q8qU8uATU+gCX6aDo806D68QxaLDAt51nBhhKuGBeicN7UsRN3PxQgZGrgKqmEmRnRalzS3AqHyjmSZtmPx4UutUYZOk9/r9+cedWAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOtl/bHX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOtl/bHX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231CA1F000FF;
	Thu, 10 Sep 2026 00:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788999655;
	bh=j/s1Umy8gksN21jKhU7eyUqjYSwMIvP+6qTtZFOfowo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOtl/bHXmxxhnbMoLai6h+6+gMH2tW82HFrEjFhP77NLhuLjd7yGyZZNiekkeZLec
	 gs1XWPzFdxUOiRFYygVBmeVBtZI6AXACkYazd57nCdwIg9pzgt562JBGTVL+JWlHrE
	 QON06ehBjBxEJfK1DIPrx588kWrlRXJUkLfpWIidsLhgN9CtLrgv6h6gALtVEo3imZ
	 QnvVOGgo8XJ5F0gwO1+pBOTj6gB4AB5sYE7mMjGRYfWsiQoTQFsoyTUp4ncJp77jn+
	 y/1YVyclj5h96nGwwGTbQKmaqkc5aeNICgK5JX6zIIJTJxaAoVCJS415wgqXazZXiZ
	 FM7NiiN4oOshg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: BCM5301X: R7000: add nvram node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910001300.117062-1-rosenp@gmail.com>
References: <20260910001300.117062-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 00:20:54 +0000
Message-Id: <20260910002055.231CA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing length validation in `brcm_nvram_parse` allows for out-of-=
bounds heap read/write and potential panics (preexisting).
--

commit fcc6c069f7250c796767f24fbe9f085f9b0e3334
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: BCM5301X: R7000: add nvram node

This commit adds the nvram node to the BCM4709 Netgear R7000 device tree
and configures it for gmac0.

> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/=
arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
> index 24ba8f8f9bf36..0f3a00bc38c14 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
> @@ -25,6 +25,15 @@ memory@0 {
>  		      <0x88000000 0x08000000>;
>  	};
> =20
> +	nvram@1c080000 {
> +		compatible =3D "brcm,nvram";

[Severity: High]
This is a pre-existing issue, but adding this DTS node exposes the device t=
o a
missing length validation in the brcm_nvram driver.

In drivers/nvmem/brcm_nvram.c:brcm_nvram_parse(), if the NVRAM flash is
completely erased or uninitialized (e.g. all 0xFF or 0x00),
brcm_nvram_copy_data() calculates priv->data_len as 0. This causes
devm_kzalloc() to return ZERO_SIZE_PTR.

Will the subsequent memcmp() dereference this invalid pointer and cause a
panic?

    if (memcmp(header->magic, NVRAM_MAGIC, 4)) {

Furthermore, if len is larger than priv->data_len, it is validated against
the mapped region size (priv->nvmem_size) instead of the allocated heap
size:

    if (len > priv->nvmem_size) {

Can this lead to an out-of-bounds heap read and write in
brcm_nvram_add_cells()?

    tmp =3D priv->data[len - 1];
    priv->data[len - 1] =3D '\0';

> +		reg =3D <0x1c080000 0x180000>;
> +
> +		et0macaddr: et0macaddr {
> +			#nvmem-cell-cells =3D <1>;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910001300.1170=
62-1-rosenp@gmail.com?part=3D1
