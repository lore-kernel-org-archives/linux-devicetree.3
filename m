Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1827C13B7A3
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782591899; cv=none; b=KrX6cCeFX+e78So82ChltfatIdrLCJiqvfP4hnpc3ZBgAPnsHlotefPEwNHQXS2pZA7TA+NxIgF3WPjpI/k6bGuPYVWN0qiMc/lWdYF6FEIJfbc2kliV6PiG9umDi+Lk934Pb4pY/NMUQcQOraOsWxQ23UCb3rt8/0v58hfSSBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782591899; c=relaxed/simple;
	bh=qWBJMh73Z/vL1p4WidLLvpxB3qoqDvLV2SgEvm1OVZo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uX3Q5Ldyyva8/PZF32JGnrXQMZ+Ww5i4D4HrY6JNSV/OiE7/Mj1MuIQwvdDm9cdq0LRuXHRm5FXH61sT3Tj8yVdTRMm8BUKIBnj/GkVwglsPOKuOAftJN0ERAPGmazswo4zLnZa/l4YNnrImpKJc/LbQkZkCwHA3FHCwkbxMzgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rx16OOeL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rx16OOeL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3931F000E9;
	Sat, 27 Jun 2026 20:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782591897;
	bh=P9q+B6g+kyhlmTuEt4Ajr4OI50yQJtD590OIEuBGOmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rx16OOeLByqOJFeSy7Xl1umpPufD1k4phMoc/phsDwwC0W+REDlol/4QkoscQdKkT
	 KOZljIr7kIJ1rlg0ItRnA0b7/739mATehpXknkPcO38Ci5P+19LPJH6Z7aoxZodgcD
	 7ZknP9FMOxlQhmJ++btDUP/amJYScgmaGW8Xc17YlFJ/5RTpStgg88kfkSw48BEKUm
	 j+xdrV8h5dLA2ziN9zmnLybeQrr7I1t4f8/9dLIud6fBe+I+y9ZEg1Kyt0jnC6C5yW
	 TZQ8rkeH31EMYKHy1eFUfAQZEjpCjGzZvCPAtMvq8cvX2tATHTNZmmA9mrUJ6nfAuB
	 ROpCdO0/+5BWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/9] arm64: dts: agilex5: add Cadence SD6HC
 controller and SOCDK enablement
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260627201457.12318-4-tanmay.kathpalia@altera.com>
References: <20260627201457.12318-1-tanmay.kathpalia@altera.com>
 <20260627201457.12318-4-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 20:24:56 +0000
Message-Id: <20260627202457.5A3931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The GPIO-controlled I/O regulator (vqmmc-io) initializes to 1.8V i=
nstead of the required 3.3V at boot due to missing `gpios-states` property.
--

commit d6ddf71779dce5e00733c866f08e72b6d91c3a47
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

arm64: dts: agilex5: add Cadence SD6HC controller and SOCDK enablement

This commit adds the Cadence SD6HC controller node to the Agilex5 SoC DTSI
and enables it for the SOCDK board. It configures the controller for SD-only
operation with a fixed 3.3V card power regulator and a GPIO-controlled I/O
voltage regulator.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/a=
rm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> index 262bb3e8e5c72..c56f46721bb06 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts

[ ... ]

> @@ -34,6 +34,24 @@ memory@80000000 {
>  		/* We expect the bootloader to fill in the reg */
>  		reg =3D <0x0 0x80000000 0x0 0x0>;
>  	};
> +
> +	vmmc_reg: regulator-fixed-3p3v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc-sd";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	vqmmc_io_reg: regulator-1p8v {
> +		compatible =3D "regulator-gpio";
> +		regulator-name =3D "vqmmc-io";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		states =3D	<1800000 0x1>,
> +				<3300000 0x0>;
> +		gpios =3D <&portb 3 GPIO_ACTIVE_HIGH>;
> +	};

[Severity: High]
Does this missing gpios-states property cause the regulator to initialize
incorrectly at boot?

In drivers/regulator/gpio-regulator.c, when gpios-states is omitted,
of_get_gpio_regulator_config() defaults the GPIO to GPIOD_OUT_HIGH. Based
on the states array here, a high state (0x1) selects 1.8V instead of the
standard 3.3V required for initial SD card operation.

Could this violate SD card power sequencing by supplying 1.8V to the I/O
lines while VDD is 3.3V, potentially causing enumeration failures or
electrical damage?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627201457.1231=
8-1-tanmay.kathpalia@altera.com?part=3D3
