Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5812D6E5A
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957940; cv=none; b=C7I85G3LbMUlcBuMlMzZjbTvKyiTMiTNglGyZVVnVO4HNA0JeHXPUjLj2UglEMH+TbSuFAHUetOcJTFNT6XGqCIoHN7GJdVyRXtZX674Bjfa+FCk8BUdmeI8lnVWSRjU6qQTlN+KvcbjHSZuZl/C9naLKn6jNqbNMYN+Ylz1pZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957940; c=relaxed/simple;
	bh=/infj/F2c9+lE7yYRPyqvBiIrVUlN9OJSYaIHcqEG7c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rnFv8DLl+4Iool8t8Wcvnjl0qPP2QOCttR77hG3dgbMQkbt/nCz3ITiIxHa1cD0h2SuClgkWsxmVB+JHocGDHSB5SUvpL8xV34gP5Q2ehMskqcGPSqZ5dsUDPvZWYgKjobQymtKQNfLYh/lBQOXSeiak8291KakcRHZ7bG+7las=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WrMFakLE; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WrMFakLE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B3A7C2BB14;
	Mon, 13 Jul 2026 15:52:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69AC660345;
	Mon, 13 Jul 2026 15:52:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DAB411BD3A60;
	Mon, 13 Jul 2026 17:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783957934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/mzSGq9WB4JpPQTf+rxJ/+1nTO0Xt5r9vAwz0C5mYVs=;
	b=WrMFakLEQGvweKpB/1wijSoKfPKO6fb2ts618/Ic1vTGyRSG2/XTHwN5890uJdMp3/tZKq
	KPufN1TjkFbyA6uyljG9Iie2jolCaoF01XdahfY/uq9DBKu4n9C/OdSl2eePBFhkk0DlmW
	Vb4HYChz3yYjIREs6U5MXxoaxVApDwV0dleBKuUca4edzcVT5BOn8SbEaYEFlh0IWpX9wn
	6Jy5yPHeW5LxF57r9cOuFqtGf7TCwBC3xzwpFKfVWM00yG09sAIJDJVySTS9uNvce5R0ss
	TYsrla/ShbZc/2vzvpvNr55SBjnHHTW52ejUA3DSfZzMJAZvi1coWLnvSJZ2aQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: marvell: kirkwood: Correct indentation
In-Reply-To: <20260706180333.648401-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706180333.648401-5-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:52:12 +0200
Message-ID: <874ii27uqb.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-ch=
eck-style).
>
> Changes in v2:
> 1. One more fix in arch/arm/boot/dts/marvell/kirkwood-b3.dts
> ---
>  arch/arm/boot/dts/marvell/kirkwood-b3.dts                     | 4 ++--
>  .../arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts | 2 +-
>  arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi            | 2 +-
>  arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts          | 2 +-
>  arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts          | 2 +-
>  arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi                 | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-b3.dts b/arch/arm/boot/dt=
s/marvell/kirkwood-b3.dts
> index 681343c1357a..9d5cc1689864 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-b3.dts
> +++ b/arch/arm/boot/dts/marvell/kirkwood-b3.dts
> @@ -94,10 +94,10 @@ i2c@11000 {
>=20=20
>  		serial@12000 {
>  			/* Internal on test pins, 3.3v TTL
> -		 	 * UART0_RX =3D Testpoint 65
> +			 * UART0_RX =3D Testpoint 65
>  			 * UART0_TX =3D Testpoint 66
>  			 * See the Excito Wiki for more details.
> -		 	 */
> +			 */
>  			status =3D "okay";
>  		};
>=20=20
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.d=
ts b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
> index cb564c3bcdc4..a9adb777c7a0 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
> +++ b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
> @@ -239,7 +239,7 @@ ethernet0-port@0 {
>  };
>=20=20
>  &pciec {
> -        status =3D "okay";
> +	status =3D "okay";
>  };
>=20=20
>  &pcie0 {
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi b/arch/ar=
m/boot/dts/marvell/kirkwood-ns2-common.dtsi
> index d6b615cf6390..121d84609f20 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi
> +++ b/arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi
> @@ -83,7 +83,7 @@ &mdio {
>  	status =3D "okay";
>=20=20
>  	ethphy0: ethernet-phy@X {
> -                /* overwrite reg property in board file */
> +		/* overwrite reg property in board file */
>  	};
>  };
>=20=20
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts b/arch/=
arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
> index 20c6290d2037..82ccc6feaf3c 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
> +++ b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
> @@ -109,7 +109,7 @@ led-yellow {
>  			label =3D "obsa6:yellow:stat";
>  			gpios =3D <&gpio1 11 GPIO_ACTIVE_LOW>;
>  		};
> -        };
> +	};
>=20=20
>  	gpio_keys {
>  		compatible =3D "gpio-keys";
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts b/arch/=
arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
> index 2bc4b68bd723..ff08b01434bf 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
> +++ b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
> @@ -130,7 +130,7 @@ led-yellow {
>  			label =3D "obsa7:yellow:stat";
>  			gpios =3D <&gpio1 11 GPIO_ACTIVE_LOW>;
>  		};
> -        };
> +	};
>=20=20
>  	gpio_keys {
>  		compatible =3D "gpio-keys";
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi b/arch/arm/boo=
t/dts/marvell/kirkwood-ts419.dtsi
> index f136059607b7..6c15e9257de3 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi
> +++ b/arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi
> @@ -57,7 +57,7 @@ &mdio {
>=20=20
>  	ethphy1: ethernet-phy@1 {
>  		device_type =3D "ethernet-phy";
> -                /* overwrite reg property in board file */
> +		/* overwrite reg property in board file */
>  	};
>  };
>=20=20
> --=20
> 2.53.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
