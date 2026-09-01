Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A239036A02E
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 19:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289290; cv=none; b=ags2e4PtcUgP4VedUIChF5GN7uZKs//EG2qWm/8PaOPuNt72o+ujRP0Zr038N2IDsM7KplRfNKiTACZd6Ul1y6Kq2MxpjHRuZlU8gStUzq8v1RANIvsCD3UzZfWcKUeTHD/vrTdxhrgzQxJJMEIGhQ+NZd4kMuhk82a7vWU4U2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289290; c=relaxed/simple;
	bh=KJpUpAAjbozq9KYVTQ08Nu94/mZ6gVN6Oyr9wkCUw6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OsNN24/zbRchkNFj+tBEDADmZrXjRkR32eQsRw2czLxr5sSYdHDRGbtUDk4FNSXoURjhuLrTYQFvkP0MFF7/beTeOXuAGP6nR11puBg0ePr16B33gu2tLr2ZCSzNoBumVdfz4fLTp49LdAWBUotv6p7IEvhWDuqdZufts8x4gLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRdjoUCO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRdjoUCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052091F000E9;
	Tue,  1 Sep 2026 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788289289;
	bh=46cuSDIWHeDgObY2ADEMu1NkstxiIC+HbMmN49DYf/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KRdjoUCOAKtT+QaFaxpomeg3/2DZGELCwS1raKcC8jmYCGK/KhFa9YikUc1SeAkVn
	 A7fnXhFPH2y6m43xb9kcD6YtF3VmkudZsSrR7J/S/tlD1sJL8r3wDJCiwFAEIoDlrt
	 kri7B0uy937xXnSXiTqs7oKIrVr5ioQzJ2TZJF99l/O1vrXVldBLHji1jr+YU/jr6q
	 /xXYL9wkFhdf0W6o66nhY48tGnSVbKjhHvVMz1Jff6uFgNVrSUgGy2qvbu6aNqGPvH
	 7YKpJOcY/znOWUK5V4/LPxk608AZ/nk5sW8JcVQ8aoAZaBg39N2N3359LC+pMuxv0S
	 OFcDoeAqFLJLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/9] arm64: dts: agilex5: enable SD card on SOCDK
 OOBE card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901184828.15653-4-tanmay.kathpalia@altera.com>
References: <20260901184828.15653-1-tanmay.kathpalia@altera.com>
 <20260901184828.15653-4-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:01:28 +0000
Message-Id: <20260901190129.052091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Device tree node overrides are not sorted alphabetically by label.
- [Low] Missing `no-sdio` property for SD-only slot.
--

commit eddece91ac39f2531713c8f5e5e5490392d405bb
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

arm64: dts: agilex5: enable SD card on SOCDK OOBE card

This patch configures the device tree to enable the SD card on the SOCDK=20
OOBE board. It adds voltage regulators for the 3.3V and 1.8V supplies=20
and sets up the sdmmc node with the necessary high-speed capabilities.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/a=
rm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> index 57d3c5807c65c..2b753d0e17bb7 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts

[ ... ]

> -&gpio0 {
> +&sdmmc {

[Severity: Low]
Is the placement of the &sdmmc node intended here?=20

The device tree style convention typically expects node overrides to be sor=
ted
alphabetically by label. Placing it here breaks that sorting order, which c=
ould
lead to merge conflicts or maintainability issues later on.

> +	bus-width =3D <4>;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency =3D <200000000>;
> +	no-mmc;

[Severity: Low]
Since the commit message indicates this is an SD-only slot, should we also=
=20
include the no-sdio property here?

By omitting no-sdio, the MMC core might still issue SDIO initialization=20
commands (like cmd5) during card enumeration. Adding no-sdio alongside no-m=
mc
would prevent these unnecessary probing commands and avoid minor delays dur=
ing=20
boot and card insertion.

> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vmmc_reg>;
> +	vqmmc-supply =3D <&vqmmc_io_reg>;
> +
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901184828.1565=
3-1-tanmay.kathpalia@altera.com?part=3D3
