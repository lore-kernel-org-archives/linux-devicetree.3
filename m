Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDCC44AB99
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936583; cv=none; b=ltdBiF3Lb713Y4BIDcG7bUkjfkr2RPsYx+BeVeeu1A2lkfv3vzvzV7jSXbgbN1AnkMElchOto5CHY1HHagt01oWGhtDTfzvNKaQiyOkUNMiP7+trybFeXOITuHpEd/hhU7ZEslV4xIaKaiPhLmwdNbqCo3iuTq6NMn+D3eJh9NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936583; c=relaxed/simple;
	bh=SxP4fLP0KIVhaqnKK7kqSkrPad1GjTUogMIUrTohT+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nLzDYpGLvcQS3kOdItRNoe60A73NYkAUABZJ5/U65M9of5ROdx6uFQRQuiE/jruu97AmZ3A35eQBIkCz1jkrWv2wUY3MolHoalvEA2jgzRg6a3+awdB3Tc5k8A1XYdjjDv6R4q3Q3WoES8pILLLcfYBJIvSUNY7XTC14bOgHSD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1PrYv00; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1PrYv00"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8F51F000E9;
	Wed,  5 Aug 2026 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785936582;
	bh=Bwmv8LcJ0Iy16rLLeyXP3WLi8Qm6aVjZsyK4fkdbWgY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i1PrYv00TKwkoFHgOA1MbAwjZdm71Lu6gDaSYrtTIapfCwZ1R9TKHASjSPllY4l7n
	 KFDpdiW6o6N2udas3CH55DH8jYw6nmEUQpAbpP7yhMCYrFvgeE4iJszKBcYvptXdFc
	 L/NIgyx5wGSTCbcCo82+cwbcyjkbbrG9WjM9PCFr0N0/Cg7o9Myc3g0mBN71qfo+3V
	 nVKpGHdN3gBJ5AT99Fu5u5Eh5B2EV0MEBBSH76FM9p9Fp6L4ezHn3yxcidsN5k3ySf
	 m3j2kaHEhZDU6NYFpZeQik/l2Qzv3yrPoC7le3nu0o8anlV47SpKUtoQ9J7cS1WQHH
	 ppt/fNjR2N8gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/12] ARM: dts: aspeed: anacapa: Enable MCTP and FRU
 for NIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-8-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-8-5d67e0efa6c5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:29:40 +0000
Message-Id: <20260805132941.8B8F51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing Frontend NIC (FE NIC) MCTP and FRU initialization for th=
e Right Bridge Board (`i2c10mux0ch0`).
--

--- Patch [8]: [PATCH v4 08/12] ARM: dts: aspeed: anacapa: Enable MCTP and =
FRU for NIC ---
commit dd43e6fac4e737bcb1c934de5c94c3846795897a
Author: Andy Chung <Andy.Chung@amd.com>

ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC

Add the mctp-controller property to enable frontend NIC management
via PLDM over MCTP. Also add EEPROM device for NIC FRU and reorder
the I2C virtual bus index according to the system silkscreen index.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dt=
s b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
> index ff393ad7cdb79..703284721224f 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
[ ... ]
> @@ -55,6 +74,106 @@ eeprom@51 {
>  	};
>  };
> =20
> +// R Bridge Board
> +&i2c10 {
> +	multi-master;
> +	mctp@10 {
> +		compatible =3D "mctp-i2c-controller";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +	};
> +
> +	i2c-mux@71 {
> +		/delete-property/ i2c-mux-idle-disconnect;
> +

[Severity: Medium]
Is the Frontend NIC (FE NIC) configuration missing here for the Right Bridge
Board?

The &i2c10 override configures channels 1-4 for the Backend NICs but omits
channel 0 (i2c10mux0ch0). The Left Bridge Board (&i2c11) includes a Frontend
NIC on channel 0, and an alias for i2c10mux0ch0 was added in this patch.

Does i2c10mux0ch0 need to be populated with mctp-controller and the FRU
EEPROM here?

> +		i2c10mux0ch1: i2c@1 {
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-anacapa-de=
vlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com?part=3D8
