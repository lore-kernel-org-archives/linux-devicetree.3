Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5713191F91
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556769; cv=none; b=ar8uGMlH0ppa+GGaa7XusCq7MxYTzevqcw2WlzvYQwZ/TE7itRM1dk+gZvkfHkJgGRD6tFqD1Zf0equVL813EUlPoEG2cUbRQ64xA+JkjXymwvnLipxT4qErDKwFFWWUljBLO8XEkMhimIRaNZ+RzVJw8++xHAxzbFKpudq3lWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556769; c=relaxed/simple;
	bh=lVQUBJXklNK7ySzGSGghhJlvod5veWC689DVBnH7aMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xf70DLCJYf2YgKrQ9iNtDe+xHw495hP4gnZkFbEq0sNo9n3BPpv7Of6gxUPue9jSCJSxbU39cVZxebLKPI70UyhJCdVCbVteONKUrW6YQIy/6Ej06RMFjNHmZRn/BoyQPjyy8GJEPFHs7seGspeWQpKXgIbVmu/1rWxOxYyOs2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6Se00M6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6Se00M6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187C5C2BCB0;
	Tue, 12 May 2026 03:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778556769;
	bh=lVQUBJXklNK7ySzGSGghhJlvod5veWC689DVBnH7aMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=r6Se00M6rPIP9Jpw6aQjG9lq5Pwkk1gk8/bU24fk7SzFCt7TGqstqc99n0g/ERnmM
	 IEUONY4938k7DTch++7OqgUyBlBqbts5CBlKT1nNvN35dDzEGNZvbuVqp096SwvsKw
	 27pQwcdrZf1y1chTxaaBfocdnHxjXKtL3MC9QlCL0EXbEuv9IrKiHsGj8YH5eCNcP8
	 bHr2plYZpdiByQTtAsTCGyO5yEL79uhgy+We1Z/0SNiIBdmI9x+nIPoTrirP7KSfOg
	 Tq0Q3PQ7KWNqr4wGyDrsPW8EMGOz+y2HR5dMLkeXb0fAfkqPjMG12T31RPhCGWf18B
	 ancBKa1xVwTcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 7/8] riscv: dts: spacemit: k1-bananapi-f3: add SD
 card support with UHS modes
Reply-To: sashiko@lists.linux.dev
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-7-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-7-ae48c0b2b2cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:32:48 +0000
Message-Id: <20260512033249.187C5C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Enabling UHS-I modes with an `always-on` VMMC regulator prevents p=
roper SD card resets, breaking soft reboots and driver rebinds.
--

commit da601a14dc433b25fd35c0c4098f9e5dcb5faea3
Author: Iker Pedrosa <ikerpedrosam@gmail.com>

riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes

This commit enables the sdhci0 controller on the Banana Pi BPI-F3 with
high-speed UHS modes, wiring up the vmmc and vqmmc supplies.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv=
/boot/dts/spacemit/k1-bananapi-f3.dts
> index e20daa50a152f..8fea6e87acec8 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -221,7 +221,7 @@ buck3_1v8: buck3 {
>  				regulator-always-on;
>  			};
> =20
> -			buck4 {
> +			buck4: buck4 {
>  				regulator-min-microvolt =3D <500000>;
>  				regulator-max-microvolt =3D <3300000>;
>  				regulator-ramp-delay =3D <5000>;

[ ... ]

> @@ -374,3 +374,21 @@ hub_3_0: hub@2 {
>  		reset-gpios =3D <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>  	};
>  };
> +
> +&sdhci0 {
> +	pinctrl-names =3D "default", "uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vmmc-supply =3D <&buck4>;
> +	vqmmc-supply =3D <&aldo1>;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;

Could enabling UHS-I modes here introduce a regression during soft reboots
or driver unbind and rebind cycles if buck4 is an always-on regulator?

When UHS-I is negotiated, the SD card switches to 1.8V signaling. The SD
physical layer specification dictates that resetting an SD card from 1.8V
mode back to the default 3.3V mode requires dropping the main VDD supply
(vmmc) to 0V.

Since buck4 is configured with regulator-always-on, the regulator framework
will not physically disable the supply when mmc_power_off() requests it.
This could leave the SD card stuck in 1.8V mode during a soft reboot,
preventing the host from communicating during the initial 3.3V sequence
and causing initialization to fail.

Should regulator-always-on be removed from buck4 if it isn't shared with
other always-on components, or should UHS modes be omitted if the regulator
must remain on?

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-orangepi-s=
d-card-uhs-v9-0-ae48c0b2b2cf@gmail.com?part=3D7
