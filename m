Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968B6354AEB
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526041; cv=none; b=AN29L8yWctvDBmaYeZMUHKn2F2jtP/caS6dZfhswlxQjonOTXHgHrMC1dDcz/UBdDBmhbIsQg6q1Y/TrBzsqEAoY586vp0CF5MYrycgmfsFhqFluC6wAx9g7yEfObAYlw0i6L0t7KLvT716u/OFlLQW8ztpLbyIqS3wlpgR+p8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526041; c=relaxed/simple;
	bh=zOIIUv/I8WqfnJ9BVjsquDKY8TVdHHsAXl13FT4v7rA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=svqonVNygV4LW/ycG9dQGJn5Cgz4lIhHk+s4lRtJ1NgXs1fSJS/Uy/g6P+YOhXDK4uEOw4Nvv9VXlgsYWE8UnTP9LEKavz6NrFe97A3zTvkejREoD7dD8Zs/41S46TudxvwfGUdV93+l/7CR7CBwG0CdBew2JpWA63LxBz48wWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWRiVyx3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWRiVyx3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F12D1F00A3D;
	Mon, 15 Jun 2026 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781526040;
	bh=pBHnazMo49l9BA9fPXQ4Cap2I4Wl7QqAaI34swF5Q3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bWRiVyx3fL8tUJIeHs7Nn/XLEfUoPepSeQIwWMBViodqvzEetCW4T7++BBCZO/BMV
	 jsiGHy7fDeHDncsWyBfVRYcASHR5OzPrqVAIAQrqUQ9oqS7+x2x61m43hamt3wTKvE
	 iIJ7rz+Isbc4ItQYwi43+AV6FHc6TIxCsgGBARfIYkeRrxrN0q+Smg8NISIK1VQqVw
	 6z1W3cIltxv06SM3qlGQ8e5vHiG0kxIaVHEKB53JGZhFDBmHwg4VpUnGZRoDxkCV/b
	 QiEdeOYkA/5j7oaj+OIvaSsMltaY/7/mxDiU9WXI27Owr56v8CAK7S24HrMD/9Z9DU
	 sIJVVMNNcm4Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] arm64: dts: sophgo: add initial Milk-V Duo S
 board support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Milas" <josh.milas@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615120324.1527881-2-josh.milas@gmail.com>
References: <20260615120324.1527881-2-josh.milas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 12:20:39 +0000
Message-Id: <20260615122040.0F12D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `no-1-8-v` property in the `&emmc` node artificially restric=
ts eMMC performance, contradicting the 1.8V pinctrl pad configuration.
--

commit 16f792133b8071df278eace7bc1ca7b6e4b52d31
Author: Joshua Milas <josh.milas@gmail.com>

arm64: dts: sophgo: add initial Milk-V Duo S board support
   =20
Adds initial arm64 support for the Milk-V Duo S board making it possible
to boot Linux to the command line.
   =20
Link: https://milkv.io/duo-s [1]

> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm=
64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..f56bfddeacc40
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

[ ... ]

> +	emmc_cfg: emmc-cfg {
> +		emmc-rstn-pins {
> +			pinmux =3D <PINMUX(PIN_EMMC_RSTN, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp =3D <10800>;
> +			power-source =3D <1800>;
> +		};
> +
> +		emmc-clk-pins {
> +			pinmux =3D <PINMUX(PIN_EMMC_CLK, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp =3D <10800>;
> +			power-source =3D <1800>;
> +		};

[ ... ]

> +&emmc {
> +	bus-width =3D <4>;
> +	no-1-8-v;

[Severity: Medium]
The emmc node specifies no-1-8-v, but the emmc_cfg pinctrl configures the
eMMC pins for 1.8V logic using power-source =3D <1800>. Is the board
physically wired to operate the eMMC at 1.8V?

If the hardware supports 1.8V, is it possible that setting no-1-8-v
artificially restricts the eMMC from utilizing high-speed capabilities
like HS200 and HS400?

> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	pinctrl-0 =3D <&emmc_cfg>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615120324.1527=
881-1-josh.milas@gmail.com?part=3D1
