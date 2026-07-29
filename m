Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F71A47ACCE
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325864; cv=none; b=rYrB7sGUwhfsExwq5FLb4kr+0f5xoGuNvhy3RMlbX+W6hA140OtnrODHTIA3/KvuiosmDd1ZB6FfbxPnwsoWydEwTyBfoMiLWHD/f41ccIlec6+NRv40wYAleu9hv3NUbniQIf1XRmll8uPMwzDBph2pAECgPnva3diFBFsA73A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325864; c=relaxed/simple;
	bh=XImFaA5sQ1QC7+iUzQdv+M1/f/2gKTacJnTb3Unj6oY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QYd1fVo6APRdjilLpATEn3j8rq+W1UY/Dux2GMBKSrdylb+mgmM1MGzQmM9Ay/Onuxx2rW6CMLsfmmpQeY54nv36CloncLR2JHwvbIt+E2nO4vYWShsEt5UnQ7du9Bu1HeZu4i+9TjFHdQFSFwJMAGm6V/1uyNzFWeNAc3yuo+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ugp6YoKh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ugp6YoKh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BA41F000E9;
	Wed, 29 Jul 2026 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785325863;
	bh=TnpSwz4Mk3Gwhlz4aeX9MYg4SbkXAN06n69TrNDHPII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ugp6YoKhr4KZSaLBvk//fepbV8kxqxv6RtukXreNqJRQsiXtnTnLCLaqTz7G9xNXX
	 iW+kJg46Kq7OySChnkiIuh89Sym88eopoiqAFKoZAHvphrggNdjz11/FwbY+Ijec5w
	 zWf+kH8LxZVie+kD9NWfhR/srzZMVWPxgnep/KqUwxwDxkLoT27lm5VJSwRupITLIe
	 9XZBN1nJQ2sgCkHNPyT1AD4cGJ6i4dUwLYWm0nT5bfhX6bgRqK6Hg6lXBc9HXPqp7h
	 pAYEGcIv3+7hJGzJJo2kp12E4tY5+YcbGMYgwjnp+vp6zjwk7rKVaUHc1E+sFy+19B
	 em4f45ren3bCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] ARM: dts: aspeed: bletchley: Add second source
 ISL1208 RTC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmo Chou" <chou.cosmo@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729114312.3947300-5-chou.cosmo@gmail.com>
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
 <20260729114312.3947300-5-chou.cosmo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 11:51:02 +0000
Message-Id: <20260729115102.B7BA41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding the ISL1208 as an active alternative RTC introduces a syste=
m-level regression on boards populated with the ISL1208. The unpopulated pr=
imary PCF85263 will register a phantom /dev/rtc0 device due to a missing I2=
C failure check in its driver, causing the ISL1208 to be registered as /dev=
/rtc1 and breaking userspace time synchronization.
--

--- Patch [4]: [PATCH v2 4/4] ARM: dts: aspeed: bletchley: Add second sourc=
e ISL1208 RTC ---
commit 02d65705396424e85939c4fb70bef75dc330e54c
Author: Cosmo Chou <chou.cosmo@gmail.com>

ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC

This commit adds an alternative ISL1208 RTC node at address 0x6f to support
boards populated with the ISL1208 instead of the primary PCF85263.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> index 3da1cf9bbb990..01dbbda3e4b6a 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> @@ -1269,6 +1269,11 @@ eeprom@56 {
>  		compatible =3D "atmel,24c64";
>  		reg =3D <0x56>;
>  	};
> +
> +	rtc@6f {
> +		compatible =3D "isil,isl1208";
> +		reg =3D <0x6f>;
> +	};
[Severity: High]
Will adding this alternative RTC node break userspace time synchronization =
on
boards populated with the ISL1208?

Looking at the primary RTC's driver probe function:

drivers/rtc/rtc-pcf85363.c:pcf85363_probe() {
    ...
	err =3D pcf85363_load_capacitance(pcf85363, client->dev.of_node);
	if (err < 0)
		dev_warn(&client->dev, "failed to set xtal load capacitance: %d",
			 err);

	pcf85363->rtc->ops =3D &rtc_ops;
    ...
}

The PCF85263 driver ignores I2C communication errors during probe. If a boa=
rd
is populated with the ISL1208 instead of the PCF85263, the absent PCF85263
will still successfully probe and register a phantom /dev/rtc0 device.

Does this cause the ISL1208 to be registered as /dev/rtc1, resulting in
userspace services like hwclock or systemd-timesyncd targeting the
non-functional phantom device by default?

Should this alternative topology be handled via a bootloader fixup, or
should the rtc-pcf85363 driver be fixed to fail probe when the hardware
is absent before adding this node?

>  };
> =20
>  &i2c7 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729114312.3947=
300-1-chou.cosmo@gmail.com?part=3D4
