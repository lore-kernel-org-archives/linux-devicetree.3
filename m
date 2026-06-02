Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4881D20C00C
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408806; cv=none; b=Wv6R32H2IcXfdxbzr2KSR5/Hx9h16hdpOzhew4kq/i4SjeZaeUkhuS5Qfzc3SKYeZw3ST2n9Ke71HAaRnaV+LNSOqb+Z2umwOeKmUwZxGluKXcBseYFOYpl4MQnsK9JIcneSuKLjD4aG0AMhiCkFd/eimoyejw4z/rjGrWkHpKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408806; c=relaxed/simple;
	bh=CF9zqps47yhPY/cjbRY+mJ20hcCpypUmgqSU/e+ZgvM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uZ9gEiINajrSPzA+IGF923yX/deoyC+1jSKqg2VrfRhc8OAQzKxj07mI5zDGqGK/aWu3lWe71Eo4qtBbGw9gg17L9ebIZK8dnbPbphUqPriShqGMPLQRUF09MD8Ciu3N8suH31eQLoAj01iTXHSnOwMeKiQUag1Ktg31oJ5AgcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSDRf6QZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSDRf6QZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4D01F00893;
	Tue,  2 Jun 2026 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780408804;
	bh=S1W3NmHGqt/O5ZZLarZbn3e81GnYO5tZLmUEFiUH0YQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSDRf6QZsrjUAikCGxMrA58gn75rmw1wDHeBLqw+2SCwjO64m6vd7dzvSvsM6/B70
	 v4ZDnFhxUxd3aAtr/bPlb5tK86pyyP24jcZxF5Mzy5xvYYX5fZ27QkFZYs4YMm45bn
	 4m6P0+KnQTFZgzjca3pi8lnJYBr0Uliq7V/wDOuBJStg8oKBPUcq7vWTOEcgQk4L/h
	 BNK9635rkT6HKVrxsSlkcM93+J/2Xx6V0urVD89OgnIopq4BVGEL8NJtE1vfSkGZNL
	 iPR4S8P7Xy/75OPJxIfITDWxeUx3Ga1MbgVkOwbV4T0ZZvcLQoMbu80OTc1mJKQrZh
	 iZGvG/QJp44vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/9] ARM: dts: aspeed: anacapa: Enable MCTP and FRU
 for NIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang via B4 Relay" <devnull+u8813345.gmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-8-7c93c5df8d9b@gmail.com>
References: <20260602-anacapa-devlop-phase-devicetree-v3-8-7c93c5df8d9b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 14:00:04 +0000
Message-Id: <20260602140004.9B4D01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incomplete implementation: missing MCTP and FRU enablement for t=
he Right Frontend NIC.
- [Medium] Undocumented removal of the `i2c-mux-idle-disconnect` property.
--

commit e274c5d6bfd9557e3fa26fe21930d08b6e1b3ec0
Author: Andy Chung <Andy.Chung@amd.com>

ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC

Add the mctp-controller property to enable frontend NIC management
via PLDM over MCTP. Also add EEPROM device for NIC FRU and reorder
the I2C virtual bus index accroding to the system silkscreen index.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dt=
s b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> index 29df10697613a..5b6ce3c556fe2 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts

[ ... ]

>  // R Bridge Board
>  &i2c10 {
>  	status =3D "okay";
> +	multi-master;
> +	mctp@10 {
> +		compatible =3D "mctp-i2c-controller";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +	};
> =20
>  	i2c-mux@71 {
>  		compatible =3D "nxp,pca9548";
>  		reg =3D <0x71>;
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> -		i2c-mux-idle-disconnect;

[Severity: Medium]
The commit message doesn't mention removing the i2c-mux-idle-disconnect
property.

While this is likely needed to allow asynchronous multi-master MCTP traffic
from endpoints, could the commit message document this topology change so
future maintainers don't inadvertently revert it?

> =20
>  		i2c10mux0ch0: i2c@0 {
>  			reg =3D <0>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
>  		};

[Severity: Medium]
The commit message mentions enabling MCTP and FRU for frontend NICs, and the
symmetrically equivalent left frontend NIC (i2c11mux0ch0) was updated, but
this right frontend NIC node was left unmodified.

Did we miss adding the mctp-controller property and FRU eeprom for this
channel?

[ ... ]

>  // L Bridge Board
>  &i2c11 {
>  	status =3D "okay";
> +	multi-master;
> +	mctp@10 {
> +		compatible =3D "mctp-i2c-controller";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +	};
> =20
>  	i2c-mux@71 {
>  		compatible =3D "nxp,pca9548";
>  		reg =3D <0x71>;
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> -		i2c-mux-idle-disconnect;

[Severity: Medium]
Similarly here on the left bridge board, could we mention the removal of
the i2c-mux-idle-disconnect property in the commit message?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-anacapa-de=
vlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com?part=3D8
