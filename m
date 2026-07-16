Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E93F88AA
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196797; cv=none; b=tuquQk2d5mFtovMxWwsxxIxxWzKZhDunMmivojmZcbGYsLnY55j9XxrwmdmHfXnR3rUuKe/Jb+kOHbXUJZm+Zbu9GScFTf9REZaLVHJJoFuiu3KOqsWrBF/VylXcArqGAdMqpJ9ET8ZGrA4fevh0Di8nzv5yC61z2e6l8AE2sjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196797; c=relaxed/simple;
	bh=YtEByP47BZ8nitKO5Ae9IQYH1eMTlGToeia5yI2YJtw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X6dJe+iNo19TY5YAENGgIj1gR/pOUQlK0FJA7rl0PtK9gj0S2hilxHpMjNAkm/8I5kxsB7j/Cwo8QO0ou9d4YX5Irhyt0RSjjP88V+8uY+91u6sltXe/EY1aCsXb+3kRaXI5/WAdF9RtipF0Sk4ahpL9LtrzFvKYKI40cGNe1Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6dnVjO7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6dnVjO7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95D21F000E9;
	Thu, 16 Jul 2026 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784196793;
	bh=17Pcrv6biTxw+Nel0NI/YEmf8dwWLdwI5KYvyAxTVl8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A6dnVjO72hqnnzRqlUe4nQyEH4eMhvgqHPvRGqJtdR7/+Cckk8EVwqGtmGMthqMFf
	 XSXXa7VVSZatwmX8CY1ktT7J/10JUVik7jJoqrVEgZr7yfJ+eukxqqMcfxzD1thb57
	 gBmkRucvjWuXOc49riYzwvl7kM8ZDf/1LOlvQ4TPDy4HVHmeRbjPfxoXG7NhRCLmm8
	 xGIyYnUy9yWyR+NoUxB/a0UwOeNwvW895DzmV24WKMGL7v5azPTLY+SbrnU50FieCd
	 8xbquICAwZwolqiqtTYvzC8DFgTcXzq0tLRe+CHtgnlcqIUBL3X87jtVpxXIQRNUDS
	 AsjYgcyJYlX6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable
 GPIOs on CN12
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260716095935.13329-6-wsa+renesas@sang-engineering.com>
References: <20260716095935.13329-4-wsa+renesas@sang-engineering.com>
 <20260716095935.13329-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 10:13:12 +0000
Message-Id: <20260716101312.D95D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `pinctrl-0` and `pinctrl-names` properties are placed on the=
 `&gpio2b` child node, where they are silently ignored and violate the DT s=
chema.
--

--- Patch [2]: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: ena=
ble GPIOs on CN12 ---
commit 273d06c90b129bacc41e41473c190af6105d730d
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs on CN12

This patch adds device tree nodes to enable some GPIOs available on the
CN12 connector independently of switch settings.

> diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/a=
rm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> index 303b5926d8d17..e6c064bc49c8e 100644
> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts

[ ... ]

> @@ -53,6 +53,11 @@ led@1 {
>  	};
>  };
> =20
> +&gpio2b {
> +	pinctrl-0 =3D <&pins_gpio2b>;
> +	pinctrl-names =3D "default";
> +};

[Severity: Medium]
Will these pinctrl settings actually be applied here?

The gpio-dwapb driver parses its child nodes using
device_for_each_child_node_scoped(), but they are not registered as
independent platform devices. Since the Linux driver core only invokes
pinctrl_bind_pins() for devices bound to a driver, won't placing
pinctrl-0 on the &gpio2b child node cause it to be silently ignored and
fail DT schema validation?

Should these properties be placed in the parent &gpio2 node instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716095935.1332=
9-4-wsa+renesas@sang-engineering.com?part=3D2
