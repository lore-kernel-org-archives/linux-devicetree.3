Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7086348C7B
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 17:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739475; cv=none; b=ngC8R8TnpeOMPTs/C59BRbpL83KbiPCA0Byepp4BBjaAar/Pmv00T8BWPRayNV41XdKph6mp/6ag8dYySXzH8ZZIhWd+Dg+PN2uX2arJmOynQ+RyLwspP/K7zf79uxMj88J3hQPX/xjtzh4Ko15k1hEh/rkwTc5VeQ8qUQvsay8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739475; c=relaxed/simple;
	bh=pyZ2xprVTR3qcz8HvpOB6MdoH1L+n4dxvIpCKI2a1bo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ijR1qlXsxJ2d5XKpDIaJqxn10lQ39y9z9er0GPL1IdHiudaZQk/bSiSr06eJnwEUQ+aldHbDHFOM8rqqSxYeVwaH5O/L2vEXWAp+iZMDqA9zVC1QWE+r7qOC7Po4HW26JbdHi7pp/XlNaJoSoBNhBBD4tK41GcakK0QAswTiRkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtALx2tm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtALx2tm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641081F0089B;
	Sun, 11 Oct 2026 17:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791739474;
	bh=6m9I9B6GkA5gYCKffsOlJbQ3HJdfav2jM4qozg78pUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dtALx2tmXquxyWmF48c6eCrAlU9lh933+8pGJQu+PLPctxqhzHhySYMJWng9oaq1M
	 7Q6WdJ7ahOlPwOJHlpQeBfK51cgVVDMAQFWhR8wpWx2K5dli4rvV3HcxPcJ6lCS0hS
	 BYc0zD+0qn6x6suNBJ+G08vXhhxNafYg96DjMa96fNDoMW8iKxX/FDvHB6zCouQe6e
	 SmcWvrXSaFRk77dAjlMMyKxXivrq+wg/UVRy/WvDxEVWFxUr5jKC60bJ5HOvKsmJN0
	 E5bvu81ViBPUE3Mnx7mY4NmK0dobwzLDLtOTCt3ynFIO8A6q3zsj89Sx0hyB3Ykfbh
	 qnZE0+09tRVWw==
Message-ID: <sashiko-outbox-167345@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261011-odroidc2-dts-v1-1-f9f0e779af88@gmail.com>
References: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
 <20261011-odroidc2-dts-v1-1-f9f0e779af88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 17:24:33 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: of_get_mac_address_nvmem() fails due to 16-byte cell
--

commit 33c286acfab990fb62603385b64de76b3bd20dfe
Author: Fil Dunsky <filipp.dunsky@gmail.com>

arm64: dts: meson-gxbb-odroidc2: read the Ethernet MAC address from eFuse

This commit updates the meson-gxbb-odroidc2 device tree to read the Ethernet
MAC address from the eFuse nvmem cell instead of relying on the bootloader.
It links the ethmac node to the existing eth_mac nvmem cell using standard
properties.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/a=
rm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 5943bc810678e..639b97ad515c0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -230,6 +230,9 @@ &ethmac {
>  	phy-handle =3D <&eth_phy0>;
>  	phy-mode =3D "rgmii";
> =20
> +	nvmem-cells =3D <&eth_mac>;
> +	nvmem-cell-names =3D "mac-address";

[Severity: Medium]
Will this actually read the MAC address successfully? The network core stri=
ct
checks nvmem cells for MAC addresses to ensure they are exactly 6 bytes.

Looking at the eth_mac node defined in meson-gx.dtsi:

		eth_mac: eth-mac@34 {
			reg =3D <0x34 0x10>;
		};

This cell has a length of 16 bytes (0x10).

When the stmmac driver probes, it eventually calls of_get_mac_address_nvmem=
()
in net/core/of_net.c, which enforces this check:

	if (len !=3D ETH_ALEN || !is_valid_ether_addr(mac)) {
		kfree(mac);
		return -EINVAL;
	}

Because 16 does not equal ETH_ALEN, this unconditionally returns -EINVAL. It
seems the driver will fall back to a bootloader-programmed or random MAC
address instead, which might be why it appeared to work during testing.

Could we adjust the device tree to point to a 6-byte cell instead?

> +
>  	amlogic,tx-delay-ns =3D <2>;
> =20
>  	mdio {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-odroidc2-d=
ts-v1-0-f9f0e779af88@gmail.com?part=3D1
