Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05893F8249;
	Mon, 15 Jun 2026 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541201; cv=none; b=F3GF/q1zSW5dG6mFP5Jrk3tSbV1tHHVNdGJGbXFuaSmfjA0grBHA+7HXyG+bnyHRJWTOCHrJAqKMonEqfaI3lnoQAegoEfbSN1MJGUoIi2KsfxyH/kTCNWfzAtEgIcze+jZsETz5iCn75m6nVErMjNZzkVFuobHWrGykD8t6QVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541201; c=relaxed/simple;
	bh=ccGmfwml23I+ORS78xfpc0cvVnlVLK59h2MPIGfvu9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxNuVg2hP6H8VyDGBH3cdI5KE8dkpFiXFlhbwvZ9gVzkTdDvtwcQ80mmmvUdhwfxHVV7GTJRNiT/mOCpoM8zAV7csFSe6P7RPzDgfZlKFnLQmV4LR4fUis7sfPWCABjz5SZdQd+dFnu4YhPkE+v0B7qRXPx/rE1KUsIgaBwvWLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4IdB7Gw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4IdB7Gw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D48D1F000E9;
	Mon, 15 Jun 2026 16:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541200;
	bh=zJIFH+z3ePXVIhCbQ6cLhY99/8LWqA4y5xDovhFGitQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i4IdB7GwEM1pwu358sY1dXs8Ga+S3AcSX4ze9gPFX9M8Ze7m8lkY2zMdSCNpF/loR
	 7AJijGWddcr3QYhOfFu0wA4AvfMUvOo2beVxBRq/igc2fQJwYFBx9AML4IPifiICaw
	 3hFgz7+pW0pwEiGEkJuN/g0PEnh3E4Dp1DgVPxf1XE3tfOO3QC3CWo8xMSuIfo6GWY
	 7CUsh6RORS9rXXXnWHg9Doj10ktKAzGDU/PWLab9khmEB+AT3Q9WVOzJ3c6/m/x5Um
	 0nbh4zJgqEtphFffQUaH+WvzN/9zYzskCzGx5gv/Y5Ehm3vyKasfY04I8MHPJW775c
	 qht0cbOKaykHQ==
Date: Mon, 15 Jun 2026 17:33:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH 3/7] riscv: dts: eswin: eic7700: add pinctrl support
Message-ID: <20260615-that-scarf-e048ef152676@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-4-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m98Q16CethEZPbmp"
Content-Disposition: inline
In-Reply-To: <20260615122016.1110206-4-pinkesh.vaghela@einfochips.com>


--m98Q16CethEZPbmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 05:50:12PM +0530, Pinkesh Vaghela wrote:
> From: Yulin Lu <luyulin@eswincomputing.com>
>=20
> Add pinctrl node and related pin configuration for EIC7700 SoC
>=20
> Co-developed-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  .../dts/eswin/eic7700-hifive-premier-p550.dts | 109 +++
>  .../riscv/boot/dts/eswin/eic7700-pinctrl.dtsi | 888 ++++++++++++++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        |   5 +
>  3 files changed, 1002 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
>=20
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/=
arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index 1fb92f0e7c55..e7bb96e14958 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
> =20
>  #include "eic7700.dtsi"
> +#include "eic7700-pinctrl.dtsi"
> =20
>  / {
>  	compatible =3D "sifive,hifive-premier-p550", "eswin,eic7700";
> @@ -18,6 +19,15 @@ aliases {
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	vcc_1v8: vcc1v8 {

Same here.

> +		 compatible =3D "regulator-fixed";
> +		 regulator-name =3D "vcc1v8";
> +		 regulator-always-on;
> +		 regulator-boot-on;
> +		 regulator-min-microvolt =3D <1800000>;
> +		 regulator-max-microvolt =3D <1800000>;
> +	 };
>  };
> =20
>  &xtal {
> @@ -25,6 +35,105 @@ &xtal {
>  	clock-output-names =3D "xtal24m";
>  };
> =20
> +&gpio0_pins {
> +	bias-disable;
> +	input-enable;
> +};
> +
> +&gpio5_pins {
> +	bias-disable;
> +	input-enable;
> +};
> +
> +&gpio11_pins {
> +	bias-disable;
> +	input-enable;
> +};
> +
> +&gpio14_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio15_pins {
> +	bias-disable;
> +	input-enable;
> +};
> +
> +&gpio28_pins {
> +	bias-disable;
> +	input-enable;
> +};
> +
> +&gpio43_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio71_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio74_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio76_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio77_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio79_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio80_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio82_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio84_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio85_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio94_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio106_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio111_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&pinctrl {
> +	vrgmii-supply =3D <&vcc_1v8>;
> +};
> +
>  &uart0 {
>  	status =3D "okay";
>  };
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi b/arch/riscv/=
boot/dts/eswin/eic7700-pinctrl.dtsi
> new file mode 100644
> index 000000000000..7293df146aa7
> --- /dev/null
> +++ b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> @@ -0,0 +1,888 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 Beijing ESWIN Computing Technology Co., Ltd.
> + *
> + * ESWIN's EIC7700 SoC pin-mux and pin-config options are listed as
> + * device tree nodes in this file.
> + *
> + * Authors: Yulin Lu <luyulin@eswincomputing.com>
> + */
> +

I don't really understand the groups here. I think you should make more
effort to put more pins in each group.

> +		gpio1_pins: gpio1-pins {
> +			pins =3D "jtag0_tck";
> +			function =3D "gpio";
> +		};
> +
> +		gpio2_pins: gpio2-pins {
> +			pins =3D "jtag0_tms";
> +			function =3D "gpio";
> +		};
> +
> +		gpio3_pins: gpio3-pins {
> +			pins =3D "jtag0_tdi";
> +			function =3D "gpio";
> +		};
> +
> +		gpio4_pins: gpio4-pins {
> +			pins =3D "jtag0_tdo";
> +			function =3D "gpio";
> +		};

Like these 4 for example, why not group these?

--m98Q16CethEZPbmp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajApSwAKCRB4tDGHoIJi
0gYlAQCOopve2GjolzYBrJ+n08TnqsxJov57i7B1HrHbin85UwEAyGbch042sT6h
oJEQs2BcHXszPbqbAd5xOw39rxca2Qk=
=8MqN
-----END PGP SIGNATURE-----

--m98Q16CethEZPbmp--
