Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0C40BCDF;
	Mon, 15 Jun 2026 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541332; cv=none; b=AgBU/pI2mt4ZqHhl6cJQhgOcbb2h/86HQw5yDPz9KyrzMcdSLLAMVDuXEL1Bm12RhRddKKBD9phf6BKxcIr+wGpZlvlX25maivDpy2mx0sI5VR9j/Edyk5A255aExpDv747Fb/TjXkTAv/vQxO2EBxHUm1uVbzE5piZezGEb6MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541332; c=relaxed/simple;
	bh=fKmxknIhMzbx+mpLbYpDuqYib1lZmzKg7pmtjB5Omjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZmgm8g/wmx08a0LnjPGhzxjIJFoKZamUasWcNy4Fopa/VgU09H70rnJ6UEoaREPCwpjHkSB2dL5zNrm91MMBN2bu45tWY7o+I+/qY+RnLNhMxjafsAMN+18jhkBSYQvoN+Ix3xZACnRXS0o7PEFFsE7gjGgx4u9/Uj06NQCdB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZpKoayI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZpKoayI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632031F000E9;
	Mon, 15 Jun 2026 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541331;
	bh=5znJKXLT2HaHGGTVLs4b+dODpenXWRmBFByF6rqYa/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NZpKoayIaRFcklMPGhvfhL/+ecK1bfO8I1VOUwtq0vvSBZ/xqBBVXY892HVp9d/se
	 IiFcb4olRef+vz1QHcdLfvVI2GxJME7xlZNRDjPj0p07beYY8FlrJiSBl4tmWvLxs5
	 cgXdOJ/qNsv67TPvAsNNLNLojvEx2bnErG4nzO+lTQEWvJyujKEzX1SWOWW0msQgN5
	 3DOv7e9fL8QJ+0pwBeZXkACWT6P3brFWI6aaLT+dayjq7r5eOZ+DkFfv6t45dhyaRt
	 6VWUuCRL27GDFBJkGgdLA/X4O28zYWEMjYWZI/Nsll3+QvIFq/VdeKB4p8mUdiNMiV
	 mO58vV4PGk9Mg==
Date: Mon, 15 Jun 2026 17:35:26 +0100
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
Subject: Re: [PATCH 6/7] riscv: dts: eswin: add I2C controller support
Message-ID: <20260615-lumpiness-profusely-155422288c31@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-7-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TWqu2/KO2WnbtTyO"
Content-Disposition: inline
In-Reply-To: <20260615122016.1110206-7-pinkesh.vaghela@einfochips.com>


--TWqu2/KO2WnbtTyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 05:50:15PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
>=20
> Add I2C nodes for EIC7700 SoC.
> Also add nodes for corresponding slave devices in dts file and
> enable them for HiFive Premier P550 board
>=20
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  .../dts/eswin/eic7700-hifive-premier-p550.dts |  52 ++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 156 ++++++++++++++++++
>  2 files changed, 208 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/=
arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index e7bb96e14958..0f0c98474c62 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -130,6 +130,58 @@ &gpio111_pins {
>  	input-disable;
>  };
> =20
> +&aon_i2c0 {
> +	status =3D "okay";
> +
> +	eeprom@50 {
> +		compatible =3D "atmel,24c02";
> +		reg =3D <0x50>;
> +	};
> +};
> +
> +&aon_i2c1 {
> +	status =3D "okay";
> +
> +	pac1934@10 {

Generic node name here please. adc I think.

> +		compatible =3D "microchip,pac1934";
> +		reg =3D <0x10>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		channel@1 {
> +			reg =3D <0x1>;
> +			shunt-resistor-micro-ohms =3D <1000>;
> +			label =3D "VDD_SOM";
> +		};
> +
> +		channel@2 {
> +			reg =3D <0x2>;
> +			shunt-resistor-micro-ohms =3D <1000>;
> +			label =3D "VDD_SOC";
> +		};
> +
> +		channel@3 {
> +			reg =3D <0x3>;
> +			shunt-resistor-micro-ohms =3D <1000>;
> +			label =3D "VDD_CPU";
> +		};
> +
> +		channel@4 {
> +			reg =3D <0x4>;
> +			shunt-resistor-micro-ohms =3D <1000>;
> +			label =3D "VDD_LPDDR";
> +		};
> +	};
> +
> +	ina226@44 {

And here. power-sensor.

> +		compatible =3D "ti,ina226";
> +		reg =3D <0x44>;
> +		#io-channel-cells =3D <1>;
> +		label =3D "sys_power";
> +		shunt-resistor =3D <1000>;
> +	};
> +};
> +
>  &pinctrl {
>  	vrgmii-supply =3D <&vcc_1v8>;
>  };
> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index f8caf39616b2..28706431b2c0 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -315,6 +315,162 @@ uart4: serial@50940000 {
>  			status =3D "disabled";
>  		};
> =20
> +		i2c0: i2c@50950000 {
> +			compatible =3D "snps,designware-i2c";

Missing a soc-specific compatible here for all i2c controllers.


Cheers,
Conor.

--TWqu2/KO2WnbtTyO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajApzgAKCRB4tDGHoIJi
0ksLAP9MCm8DtOl/v4d+aaZWsWZ+XHfD7sZbR9Qo1ZuClxlm/wD/ZX6U2CqQb1ii
RDdHwM5vMOOKNcN/xi9jYh5691NKdQ8=
=pfvH
-----END PGP SIGNATURE-----

--TWqu2/KO2WnbtTyO--
