Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32E6197A7D
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280411; cv=none; b=ENrX5kQlA3QvNRNkA7GT1tIJ2Tg1qavNXrm5ZpKUgRSzTGzuyNz7go6rULlvOlHnD4/5N+fmlnmzVUH0GeEDaaPz2Jy0bzEFpAvfuzmokeshnWpiPnEU1PE/Dhyug5k/buYcpVU41vdb+dj4AKhHa83qJvar1sn3sca6B+ItU8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280411; c=relaxed/simple;
	bh=w9k1i67Op+g2WMzfPso7Rk61Kq2xrr4k9HSu/cRmc4Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aHA40MUIbCkmJbASpDjBtiYBYP9MNSfbhr+ZTNUfpzKi5GODf2vkL/69w+ON6L2vnOt3DCjAbJ2YuKo7LReGyI6+vaV5rEc5F11kLNA0coc+faDE24KHO7tqlpX/hbUwE/Q5rwhuU7llbcpV3+Ig2T9R502HJGZySRh4L+EAm6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVouyh3w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVouyh3w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEF81F000E9;
	Sun,  5 Jul 2026 19:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783280410;
	bh=ysxc7S/CtDRLf3Ao4V2rrvZQ409keLcMtHMmSdzndyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kVouyh3wAmJYcR7UjYXChE2xuZzK511YjIhfJBAOIwENwgI4XvpwcHEUw88oel+KF
	 75hON4GkHX4YaADWid5EUpWuGwqEH6AE6l6QqkVAMWANmF5ZukbsEXZmlEuLZVUYWa
	 c+24zbMbxF27z5yjfQtLVXp6EMG0evMyvr1g7FdsWjJs3GOJXSLkTNhcVFHgXczrAT
	 OgSLW38be+pZIP8g/saYEx2zawQlJ/Xo59O/Y6wuOhdrxhu/zHJlBuINV1eNJERVSm
	 6wV49lXXGMV5niktsNhoqxvbI9Ic9Km95GHo7iANqxvWQ3ymwlDXVtfLvYJr2atRce
	 dFzRPaNzTzK3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 1/5] net: dsa: microchip: Add fallback
 Micrel compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260704-ks8995-to-ksz8-v7-1-2af0eaa545a8@kernel.org>
References: <20260704-ks8995-to-ksz8-v7-0-2af0eaa545a8@kernel.org>
 <20260704-ks8995-to-ksz8-v7-1-2af0eaa545a8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 19:40:09 +0000
Message-Id: <20260705194010.6EEF81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] SPI ID matching fails unconditionally because `ksz_spi_ids[]` does=
 not populate `.driver_data`.
--

commit 3f99242404cf6d700265212085488f0c82dd5a7d
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Add fallback Micrel compatibles

This commit adds legacy Micrel device tree bindings to the KSZ SPI driver so
users can use the more capable driver. It also makes the KS8995 driver
mutually exclusive with the KSZ SPI driver to avoid probe races.

> diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
> index 4ab567c5bbafc..e704ab702c189 100644
> --- a/drivers/net/dsa/Kconfig
> +++ b/drivers/net/dsa/Kconfig
> @@ -100,6 +100,7 @@ config NET_DSA_RZN1_A5PSW
>  config NET_DSA_KS8995
>  	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
>  	depends on SPI
> +	depends on !NET_DSA_MICROCHIP_KSZ_SPI

[Severity: High]
This is a pre-existing issue, but does making these drivers mutually exclus=
ive
break legacy SPI board file instantiation for ks8995 users?

SPI ID matching in ksz_spi.c fails unconditionally because ksz_spi_ids[]
omits the .driver_data pointers:

drivers/net/dsa/microchip/ksz_spi.c:ksz_spi_ids[] =3D {
	{ "ksz8463" },
	{ "ksz8765" },
	// ... missing .driver_data pointers ...
};

When the device is probed via SPI ID matching (e.g., legacy platform data or
SPI sysfs) rather than Device Tree, device_get_match_data() falls back to
checking spi_get_device_id(spi)->driver_data, which evaluates to NULL:

drivers/net/dsa/microchip/ksz_spi.c:ksz_spi_probe() {
    ...
	chip =3D device_get_match_data(ddev);
	if (!chip)
		return -EINVAL;
    ...
}

Since the original ks8995 driver correctly handled SPI ID matching, forcing
ks8995 users to use the KSZ SPI driver will cause their devices to fail
probing with -EINVAL.

>  	select NET_DSA_TAG_NONE
>  	help
>  	  This driver supports the Micrel KS8995 family of 10/100 Mbit ethernet

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704-ks8995-to-=
ksz8-v7-0-2af0eaa545a8@kernel.org?part=3D1
