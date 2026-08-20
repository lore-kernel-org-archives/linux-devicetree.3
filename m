Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BFC3A3E79
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 19:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787253087; cv=none; b=XxaaOlOKl6KC2D/22LSe8Ka0LNueRaYwoOZ4SrZLwuGIQrJhq0UcWRBs2tAePr/dPL2xp7mC/mRGj7AAknnBbC9XziGxzLHpTDrrjUtSPiMdBgQBa9LlEA27QQ7/2MgGRpFFsz/tFPr9r3jVV2yjiGy6L/6rJu60wMnCWkVEKKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787253087; c=relaxed/simple;
	bh=p7Z9eIS7vzod78FSQz28UCr6OcSc8GICLeSGw7/4o/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X+QpbB5hJiXRUJRYoypppCx2pnv2lgt4/Z08cLDYPeV6UTzGKYp/sJWnIFQEFYlW2V636Q9jEKasRp/d54bcKF04eeuQwa4MiirKbrigjcgjDNQ1wkvVhwN7fMcH79xeJt4d2nkIyhCRmCTjwbhGKfO1FkUgZ8+0xJkvtbyaEXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGsQoisW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGsQoisW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6B11F00A3A;
	Thu, 20 Aug 2026 19:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787253080;
	bh=fuMMhgwNxXMoBw52ALpY26MndhwvmxeA0MHa/7KRdOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gGsQoisWPqMHyUmVXObvfJAZCJGIRUyaJBDaeHVSTyH0ABK+GcWjBiFnxV5VIBKfy
	 20z2cNyF7NV1hvXvHLtfgs2+ifKbBZ+EThGW12suPjwfkCsQdvwKSIyTe1bO7hSgod
	 7ONvdlTNnHxrkFlj9uHlKzJu76cIalE8144EZ8J+/pnZ3yzCzBnQ2/UgD+BZ3OcB7z
	 PWc39EXPc1TEvjT28iAwzX/XPvfiF1tyE4VohO8jFgKtpfDvOqy+7cdEyxyyF0LYbH
	 ZBJL7rk3qRgmbMmbcWbU3lgReX61Z9F0NW3ynlWeHxWjr1Lt0iHa/NkTjaIyHZ6Fzb
	 C1UK3vfWJLFHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/8] arm64: dts: agilex5: add SD/eMMC host controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820185721.22823-3-tanmay.kathpalia@altera.com>
References: <20260820185721.22823-1-tanmay.kathpalia@altera.com>
 <20260820185721.22823-3-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 19:11:19 +0000
Message-Id: <20260820191119.BD6B11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Warm reboot failure due to UHS-I (SDR104) enabled with a fixed, al=
ways-on VMMC regulator.
--

--- Patch [2]: [PATCH v5 2/8] arm64: dts: agilex5: add SD/eMMC host control=
ler ---
commit e282634760a9fadb886896083cbc7186c285bb38
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

arm64: dts: agilex5: add SD/eMMC host controller

This commit adds the SD/eMMC host controller node to the Agilex5 HPS
device tree. It configures the controller for SD card operation on the
SOCDK OOBE board, utilizing a fixed 3.3V supply and a switchable I/O
voltage regulator to support UHS-I SDR104 signaling.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/a=
rm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> index 57d3c5807c65c..93222b199038d 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
[ ... ]
> +	vmmc_reg: regulator-fixed-3p3v {
> +		compatible =3D "regulator-fixed";
> +		regulator-always-on;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-name =3D "vcc-sd";
> +	};
>  };
> =20
> -&gpio0 {
> +&emmc {
> +	bus-width =3D <4>;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency =3D <200000000>;
> +	no-mmc;
> +	sd-uhs-sdr104;

[Severity: High]
Will this combination of a fixed, always-on VMMC regulator and UHS-I SDR104
enabled cause warm reboot failures?

If the kernel negotiates UHS-I, it switches the SD card's signaling voltage
to 1.8V. During a warm reboot, the kernel shuts down the SD controller,
but because vmmc_reg is marked regulator-always-on, physical power to the
SD card is never cut.

When the CPU resets, the BootROM or SPL will attempt to boot from the SD
card using the default 3.3V signaling. Since the SD card never lost power,
it is still expecting 1.8V signaling, which typically causes the boot
process to hang.

Since SD cards lack a dedicated hardware reset pin, would it be better to
remove the sd-uhs-* properties unless the host can physically toggle the
VMMC power?

> +	vmmc-supply =3D <&vmmc_reg>;
> +	vqmmc-supply =3D <&vqmmc_io_reg>;
> +
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820185721.2282=
3-1-tanmay.kathpalia@altera.com?part=3D2
