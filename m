Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D9B2BF3E2
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779949159; cv=none; b=Hv5JHL5XDSC7OQOtDgrxnK9N+cFZqRU8d1XOIp+Rvy0KXW0abx0prz59LH1pF1X6jKU9Q/zDg9VaGuMSy5NE3w2xUlQf6k3u1AgrI06RRJgpnXSWBf0xNp409h4wEibxOkN9Ux64Vd9P4627KzWBwqksmSpaJ3VUKaU1ngx6IM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779949159; c=relaxed/simple;
	bh=ziHGdhcQNGQhVyE6HFkUeajeyK4UvNGf7mLYRWXwX5c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gZTFSUcY22Om4UU7MC3azWKWIhD3nrNHOSNMqfJe5z5SvhkLcdxHs7nXZLOEx+k1sHPDc40asu8toy9MGRR22cXIZ2cM/cYvU8T3AW47TvzW+wXnOB4VwZ+m5hzrG6PScYGV4+DcLL0sPL/OQ/lgF/1krk3Sbf0+SxS3Ijyg0lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNeoGSUJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNeoGSUJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300F91F000E9;
	Thu, 28 May 2026 06:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779949158;
	bh=/myJ0qWWLF15xeFSj+V7f76RbFKVErrkKyPoe0DpMDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MNeoGSUJJFO3dTilU5U+zROpkJN/aLnoqukgt5v7LPV3M7dmjwPw/zDj/rrZ1HUc5
	 ONqqHi3Aez+9EAjKcAk+KNw7V9cMCmpCLUSV+ghxSf6AJx/zwWOao26/Ob9Rmq8FjL
	 3y8c2gpXNXVyfFhjzYTqop4mpmXIulWtzMBXeQ1LndCECLAzC4m9pJzVopdUzfcPKI
	 n4XoHV2+m6+75mMe9eqQgEivjQb41Tik5h3KKSmq9xaYf0XF0CcOUawnsOo224wJQB
	 isDD4eCqI5h6jNXu3PKrTXMhoGXF6rYDFwgnSm1jysSe88mYecXmFuA+gkl07Gyje1
	 og2gIKR0c/NcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6
 IO board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528-bpi-cm6-v2-3-d0eb3f236cea@pigmoral.tech>
References: <20260528-bpi-cm6-v2-3-d0eb3f236cea@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 06:19:17 +0000
Message-Id: <20260528061918.300F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `&sdhci0` node references `&mmc1_cfg` and `&mmc1_uhs_cfg` via `=
pinctrl-0` and `pinctrl-1`, but these nodes are not defined anywhere in the=
 included DTSI files or the patch itself.
--

commit c74b8c1d21d14e7c0a04fc8690e5deac751ac08a
Author: Junhui Liu <junhui.liu@pigmoral.tech>

riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board

This commit adds initial support for the Banana Pi BPI-CM6 IO board, which
combines the BPI-CM6 compute module with an IO carrier board. It introduces
the necessary device tree nodes to enable peripherals like UART, eMMC, SD
card, I2C, PCIe, USB, and dual Ethernet interfaces.

Link: https://docs.banana-pi.org/en/BPI-CM6/BananaPi_BPI-CM6

> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts b/arch/r=
iscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
> new file mode 100644
> index 0000000000000..137b7ef3fc7b4
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts

[ ... ]

> +&sdhci0 {
> +	pinctrl-names =3D "default", "uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;

[Severity: Low]
Will this cause a device tree compilation failure?=20

It appears that mmc1_cfg and mmc1_uhs_cfg are not defined in the included
dtsi files or in this patch. Could this result in an unresolved phandle
error when building the device tree?

> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-bpi-cm6-v2=
-0-d0eb3f236cea@pigmoral.tech?part=3D3
