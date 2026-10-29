Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793310630;
	b=RU2jxgACZimj1kqKwZe9A/6lXJVbXfJKc0g92lABgN+L72Y+GgQFDyswy2ATnN2doA+b
	 IxUskI3vAGktYjBVXY6acJBEWJ0CJ5ykZEgGOc+flzaMIDbMya367isx3TDKeaBcrXtIm
	 cwm1085pxJXYBqtN6TCKBQli+FHo1AwpNyhzg1zfQ5kkhbPKir+oVH12Zzhny8RBEFpOv
	 FNEE9+g+LANxWbQR7+9GufzJTlzT1f0YiNKUR+pwcK4huXoji9pH5tC8wIGBARbEfWy61
	 kMoFraWqkVruN3+b9zHGNw/L/DOGFlX+oq+iHMcQu1uecQmbVgwBThS2IJblxeFjncg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793310630;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uDk4Z8lFqYD30ZIxyxuqF5DHZBdgzdmy455ICB6vjZs=;
	b=fqRbwXA4w7WXxi6JBwGtIRXBzTQM0t2GiDXz3SLIf5S+34cPuKSL8W8Y0aMsXuUessZ4
	 bWBppxTfjZO3s/mddlJfbiPZfgtKsNmN6ShzdQRr/B9xsjyWJp26qCuX8Il4MCTvjOoor
	 03T/QDb60IoSF++KR2CT0hYe3coKFFCLzz8mIZ0/2eUVJgJB8OW4fDtSoblAKt/MAYY+H
	 oBwS2mYzZ3o4rT1V963BMARnlsJ+5NPycXEhUBSVGFOrXoJUid9AQMfBEHA+AUChBJTBn
	 FgDWZq48CoyupyDpGEmFKAJDD/740Ij6WcTFEqlX7l17WQWLgscxbpc8JJqGhOZQS/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kfC61l0T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D49606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kfC61l0T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6141F01816;
	Thu, 29 Oct 2026 21:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793310630;
	bh=uDk4Z8lFqYD30ZIxyxuqF5DHZBdgzdmy455ICB6vjZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kfC61l0Tidh4XftuKmkUM/IbPpit8/mUKSNx0ojwtVGRSBL2OXjk2/HyXwJjwr4nv
	 ykvYYptj52O55nrfwwHDqycY464r/2BTMJ7Q3bZpUpAkj7i4houc+qC9x1Nflz4tyO
	 s4Yd2BI7br258BnbKSUCgRZLTMnet0UJBe/nK587Yk0uQ3qwHa7Anqd/S3yCpqRExB
	 DcLxU2Wd9/rjuF7M/mkKHMrBAJVGp3P2QvrNJrbH1v0qNFVvv+MyKYikpXFPa56XHi
	 rnSWMBcLvE07QnUz2l4uw5N30ykFeMo+Gjszs6J55Mj7yMpr0ixpJaZiV9P/2Sbwki
	 RbM/A56gzfJEw==
Message-ID: <sashiko-outbox-190019@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: agilex5: define the i2c0 pins for
 pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029213201.718625-2-dinguyen@kernel.org>
References: <20261029213201.718625-1-dinguyen@kernel.org>
 <20261029213201.718625-2-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 21:50:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: agilex5: missing scl-gpios and sda-gpios on i2c0 pre=
vents recovery
--

commit 4fe1ecb21c260e09211a4f5ec837b9b80b38c36d
Author: Dinh Nguyen <dinguyen@kernel.org>

arm64: dts: agilex5: define the i2c0 pins for pinctrl

This commit adds pinctrl definitions for i2c0 default and gpio states on the
Agilex5 SoCDK NAND daughter card to support I2C bus recovery.

> diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts b/=
arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts
> index 81443096cf991..346a4ee22f95b 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts
> +++ b/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts
> @@ -39,6 +39,22 @@ memory@80000000 {
>  	};
>  };
> =20
> +&pinctrl0 {
> +	i2c0_pmx_func: i2c0-pmx-func-pins {
> +		pinctrl-single,pins =3D <
> +			0x10   0x4   /* I2C0_SDA (IOA4) PIN4SEL) */
> +			0x14   0x4   /* I2C0_SCL (IOA5) PIN5SEL */
> +		>;
> +	};
> +
> +	i2c0_pmx_func_gpio: i2c0-pmx-func-gpio-pins {
> +		pinctrl-single,pins =3D <
> +			0x10   0x8   /* I2C0_SDA (IOA4) PIN4SEL) */
> +			0x14   0x8   /* I2C0_SCL (IOA5) PIN5SEL */
> +		>;
> +	};
> +};
> +
>  &gmac0 {
>  	status =3D "okay";
>  	phy-mode =3D "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O har=
dware */
> @@ -66,6 +82,10 @@ &gpio1 {
> =20
>  &i2c0 {
>  	status =3D "okay";
> +
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&i2c0_pmx_func>;
> +	pinctrl-1 =3D <&i2c0_pmx_func_gpio>;
>  };

[Severity: Medium]
Does i2c0 also need scl-gpios and sda-gpios properties for I2C recovery to
work?

When probing i2c0, i2c_dw_probe_master() calls i2c_dw_init_recovery_info() =
in
drivers/i2c/busses/i2c-designware-master.c:

	gpio =3D devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
	if (IS_ERR_OR_NULL(gpio))
		return PTR_ERR_OR_ZERO(gpio);

	rinfo->scl_gpiod =3D gpio;

Without scl-gpios in the i2c0 node, devm_gpiod_get_optional() returns NULL =
and
i2c_dw_init_recovery_info() returns early before calling devm_pinctrl_get()=
 or
populating adap->bus_recovery_info.

Consequently, i2c_init_recovery() in drivers/i2c/i2c-core-base.c sees
adap->bus_recovery_info as NULL and skips i2c_gpio_init_recovery(), leaving
the gpio pinctrl state unused and bus recovery disabled.

In arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts, the pinctrl stat=
es
are paired with the GPIO descriptors:

	pinctrl-names =3D "default", "gpio";
	pinctrl-0 =3D <&i2c1_pmx_func>;
	pinctrl-1 =3D <&i2c1_pmx_func_gpio>;

	scl-gpios =3D <&portb 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
	sda-gpios =3D <&portb 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

Should i2c0 here also specify scl-gpios and sda-gpios (for example on &port=
a 5
and &porta 4 for IOA5 and IOA4)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029213201.7186=
25-1-dinguyen@kernel.org?part=3D2
