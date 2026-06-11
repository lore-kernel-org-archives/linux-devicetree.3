Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB9B74C14
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781141571; cv=none; b=gVxSCot/BnKfKuCfRWXi9GdzlwoxX24BIOKG2WV0LXuIZYEc+ujOOkjeUhKX5I+YSAct8rlgX6oc0izTJGCfPSVUvS9JnuSuKX1zmvIyYPwL/gtow5tdMeF2CCSm2F/fR4IpZ7GSJ1PO29lfEuR42YGHAT5y0AJikvd/ZuIYDMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781141571; c=relaxed/simple;
	bh=9mqFnlG4udH7DBH0KYPUsrpniTDmndPyTptePTNj/Pc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kePCxqw6ec2+ADc4ofAxXyZlnVOcBIO4vWxn0jqP3c1fRSGtkYCOkXJxeJRXr5KJ5eRege0UIhzaNCWgRUrbsYP9a56gAJCzKnCm4iX/UKCj8d8LC8KZAH+k0+6xxIXCZKu4XAZ7BcgpR0vtEZqn/cNLvjYqTvLg0Egen8dGT7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2yZfnZf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2yZfnZf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985401F00898;
	Thu, 11 Jun 2026 01:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781141570;
	bh=YzlprndF96Kukz2/OsyT/S7Hq60D8o+6xlzZe2VMGNA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O2yZfnZfwKiKa6RQ5ZWAlD5m1kw+MW0YNz3s5GxZN9g+dbvQIbc4lblfsNhdC0zNr
	 B0IUehwXD5Z1uXuEDMBRy0QSM35MEGslNabb1VonONsVdUVBy1BIwj7jfohTATgPQR
	 cRVOLisDs/C9Yvxn1WANzijzD3d31mjTdVb8iw8zpUUAT681y3muyEUkv5HvxhC+ra
	 6DhTiTK79nuMp5TroOHd7OPaqCUndCDTYtafz3RP4dKzXZFMKuleOEUJHAe3UhWkhj
	 10Z3c6cew/iI4ZnPWb2F5dOUfsbPgKYNaAGvB5pAe1eMUOCpKnidC2fwLpue2ZSKng
	 Hm0x0zUOQbFig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
Reply-To: sashiko-reviews@lists.linux.dev
To: lizhi2@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260610013223.972-1-lizhi2@eswincomputing.com>
References: <20260610013223.972-1-lizhi2@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 01:32:50 +0000
Message-Id: <20260611013250.985401F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Device Tree compiler warning: unit address without `reg` property.
- [Low] Device Tree schema validation warnings: non-standard node names.
--

commit 61fe87b2af33a89c6531d0d7ec8f49899a52057e
Author: Zhi Li <lizhi2@eswincomputing.com>

riscv: dts: eswin: eic7700-hifive-premier-p550: enable Ethernet controller
   =20
Enable the on-board Gigabit Ethernet controller on the
HiFive Premier P550 development board.

> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/=
arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index 131ed1fc6b2ed..edd91b04e2515 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -13,11 +13,251 @@ / {

[ ... ]

>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	vcc_1v8: vcc1v8 {
                 ^^^^^^
[Severity: Low]
Should this node be named using the generic regulator-* pattern, such as
regulator-1v8? The current name might trigger dtbs_check validation warnings
for the fixed-regulator schema.

> +		 compatible =3D "regulator-fixed";
> +		 regulator-name =3D "vcc1v8";
> +		 regulator-always-on;

[ ... ]

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index c3ed93008bca1..c77bc8b1b7bc0 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi

[ ... ]

> @@ -202,6 +205,11 @@ pmu {
>  				<0x00000000 0x0000000f 0xfffffffc 0x000000ff 0x00000078>;
>  	};
> =20
> +	xtal24m: oscillator {
                 ^^^^^^^^^^
[Severity: Low]
Would it be better to use the generic clock-* pattern for this node name,
such as clock-24m? Using oscillator might trigger dtbs_check warnings
against the fixed-clock binding schema.

> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +	};
> +
>  	soc {
>  		compatible =3D "simple-bus";
>  		ranges;
> @@ -245,6 +253,85 @@ plic: interrupt-controller@c000000 {
>  			#interrupt-cells =3D <1>;
>  		};
> =20
> +		hsp_power_domain: bus@50400000 {
                                  ^^^^^^^^^^^^
[Severity: Low]
Does this node need a reg property? It has a unit address (@50400000), which
usually requires a matching reg property. Without it, the devicetree compil=
er
might generate a unit_address_vs_reg warning.

> +			compatible =3D "simple-pm-bus";
> +			ranges;
> +			clocks =3D <&clk 171>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610012727.848-=
1-lizhi2@eswincomputing.com?part=3D6
