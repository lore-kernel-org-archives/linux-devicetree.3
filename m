Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06503EF0B3;
	Mon, 18 May 2026 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109765; cv=none; b=UWk+mTapW/IyNG2a6n/egJ/oX8+lU2nxkgX55uHabESlkRY/7dl8PI6IjJAJBuHxsEIA3+56/n+x6NVTNuf5fOn6nWRQhDy4PbB5k2o93IXOxH29sJILuPBeD01IiKEKCImQzt1D6KkCdoJisjCWD7hhtWR9Ve3c81pXuHJ0aOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109765; c=relaxed/simple;
	bh=oJiQU14g6OL79pt3vgnRbXseWtHmoBtD0bQjo8ADDlQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hMDRYny3WDrJuDLo47jr+dV0Y/F88SsiOx8KGvs+rP25p8eqNPiBHLeQ1GN3frIkcAY6WkX7HIZoOFD3vGCTVJIi0QyK1qeaxkfB1ZWt3VpEaBkOtr0Q0kefi96gV7jPOBvC4I+VlbImukcriASoXMc7sC6aEk4A2pmdVu9pDAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Em6xs+oe; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Em6xs+oe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779109761;
	bh=wk4N9ie3hEmSMwAYk9HPUXBeGpJpagkJEfLUPb7keEw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Em6xs+oeJOjqD4rk3pYZnRmeO3EJQ9djpAWpdLfGk96Vrx6oeBoV+RjvFKhZyaB+j
	 6xoxiwM4wg2f5ng9FU95wGM2FkU5dl17l101i2kRrjoBrcxD+Rfxt473MazS68tqgL
	 CaWi8oyrTTMzd4ffwY6HlwrjGI7ZGRQbEqmSDhIfwNi3/sHX+CiidyHJ0EBBFkz/MO
	 RZ8o2MoTNpobGxacJfUJsVDTcxnaXymFKvWowjbEY3eAj+H9nmL8F4vAj+e1Psl/3f
	 2rP6qMhYSYjuIpCMtHdGW9Wy2wMAazIRtOt11bv8FSk+E2wcgE+d9t/aI+WxA4G6Gc
	 L1I3w0z0CEnWg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DD3256025D;
	Mon, 18 May 2026 21:09:20 +0800 (AWST)
Message-ID: <a27e89c927016d1cdd87d76474b680f74b519b29.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Andy.Chung@amd.com, Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 22:39:20 +0930
In-Reply-To: <20260327-dts_enable_nic_mctp-v1-1-5b5c05f4442c@amd.com>
References: <20260327-dts_enable_nic_mctp-v1-1-5b5c05f4442c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Andy,

Sorry for the delay.

On Fri, 2026-03-27 at 14:59 +0800, Andy Chung via B4 Relay wrote:
> From: Andy Chung <Andy.Chung@amd.com>
>=20
> Add the mctp-controller property to enable frontend NIC management
> via PLDM over MCTP.
> Also add EEPROM device for NIC FRU.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> ---
> Add the mctp-controller property to enable frontend NIC management
> via PLDM over MCTP.
> Also add EEPROM device for NIC FRU.
> ---
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-anacapa.dts=C2=A0=C2=A0=C2=A0=C2=
=A0 | 67 +++++++++++++++++++++-
> =C2=A01 file changed, 65 insertions(+), 2 deletions(-)

Do you mind coordinating with Colin on this one, as he's rearranging
the Anacapa devicetrees.

Cheers,

Andrew

>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 221af858cb6b..138b081be049 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -584,38 +584,67 @@ eeprom@56 {
> =C2=A0// R Bridge Board
> =C2=A0&i2c10 {
> =C2=A0	status =3D "okay";
> +	multi-master;
> +	mctp@10 {
> +		compatible =3D "mctp-i2c-controller";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +	};
> =C2=A0
> =C2=A0	i2c-mux@71 {
> =C2=A0		compatible =3D "nxp,pca9548";
> =C2=A0		reg =3D <0x71>;
> =C2=A0		#address-cells =3D <1>;
> =C2=A0		#size-cells =3D <0>;
> -		i2c-mux-idle-disconnect;
> =C2=A0
> =C2=A0		i2c10mux0ch0: i2c@0 {
> =C2=A0			reg =3D <0>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> =C2=A0		};
> =C2=A0		i2c10mux0ch1: i2c@1 {
> =C2=A0			reg =3D <1>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c10mux0ch2: i2c@2 {
> =C2=A0			reg =3D <2>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c10mux0ch3: i2c@3 {
> =C2=A0			reg =3D <3>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c10mux0ch4: i2c@4 {
> =C2=A0			reg =3D <4>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c10mux0ch5: i2c@5 {
> =C2=A0			reg =3D <5>;
> @@ -661,38 +690,72 @@ i2c10mux0ch7: i2c@7 {
> =C2=A0// L Bridge Board
> =C2=A0&i2c11 {
> =C2=A0	status =3D "okay";
> +	multi-master;
> +	mctp@10 {
> +		compatible =3D "mctp-i2c-controller";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +	};
> =C2=A0
> =C2=A0	i2c-mux@71 {
> =C2=A0		compatible =3D "nxp,pca9548";
> =C2=A0		reg =3D <0x71>;
> =C2=A0		#address-cells =3D <1>;
> =C2=A0		#size-cells =3D <0>;
> -		i2c-mux-idle-disconnect;
> =C2=A0
> =C2=A0		i2c11mux0ch0: i2c@0 {
> =C2=A0			reg =3D <0>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// FE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c11mux0ch1: i2c@1 {
> =C2=A0			reg =3D <1>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c11mux0ch2: i2c@2 {
> =C2=A0			reg =3D <2>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c11mux0ch3: i2c@3 {
> =C2=A0			reg =3D <3>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c11mux0ch4: i2c@4 {
> =C2=A0			reg =3D <4>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c11mux0ch5: i2c@5 {
> =C2=A0			reg =3D <5>;
>=20
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260327-dts_enable_nic_mctp-e35a5765b176
>=20
> Best regards,
> --=C2=A0=20
> Andy Chung <Andy.Chung@amd.com>
>=20
