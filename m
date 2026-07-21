Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427DA495509
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630033; cv=none; b=r37p9SGgxrZJhv5OH0B909L/AVKCwka4o4Z5Gpd0i5vuUe/DHHE15eAijMBczvd8YeoBHIoC92gn1GRIwuyGRsBfvLkM5+6N+5fpDyCJPamDOpTv5dFwYbaWDwGyJ5B53rNjSU9pjRQ00/bZuoxxuOXdO5iDScCm7McPIPFZnZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630033; c=relaxed/simple;
	bh=U46aHMYrDmJDe3lzmB4mjNZP28u4V/mqV+bo4ImVhh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TpotU9qm3L1Et8vUYWfWiDsOuyhyMazyePK7GmYslH7UdExVfNRgp+ONqvwBhA9U6BEjvpA5RvmvGIb2RDPIMpQtJglSQ6oxSqBX+R95RsoZz25ESLXfMmEa/79oNqvUtqOhppIrpT762GNC3Ur+hkL4YRRd6CHkcHNJGLB5ljw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZ4iG1VN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZ4iG1VN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D791F00A3A;
	Tue, 21 Jul 2026 10:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784630025;
	bh=lPv+aJe82RBqP4/Lvz8/0HKTU/oQjcKJHTeDgYI+Edo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SZ4iG1VN3Q1Y8WqI89OHSUU13/weUzQpRE1EyDk7s4XNecCxlsTuMQNsUk8CIWMCI
	 fTUkgLUkg1Ya0WeKeaD82DtmOMsm4udy8PeStsdXQgbiLj4okj9dcFs+000TpEE41o
	 65r6W6YPqO4hUSvpCnEql9JpfWyKgyTA+F5+kPYkumw1XhEbHhOqlT6GW2VS69SxXe
	 WL3I2fBK5EXDrHIArE9djrs5p8GO7HyUEBb0WhEulWhUUVWjYYSQh1DUUchUMPSg7+
	 io+2hxweMoXQupKsfS5MMofU6HXHT0tlxVFfS8DK8zYLyMtVdbc9s2Ecy7B0Z7YyKh
	 mUq9wJ8JZcp7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/10] ARM: tegra: tf701t: Tune MMC devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260721101059.451699-7-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:33:44 +0000
Message-Id: <20260721103345.34D791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Moving the MicroSD card power control to `power-gpios` and a share=
d regulator breaks MMC power cycling, preventing UHS-I (1.8V) error recover=
y.
--

--- Patch [6]: [PATCH v2 06/10] ARM: tegra: tf701t: Tune MMC devices ---
commit 08fae6eaa1d66420a7beb84b307b949d0eb99b35
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: tf701t: Tune MMC devices

This commit adds SDR104 mode to WiFi SDIO and uSD device nodes, removes
mmc-ddr-1_8v, and improves power sequences. The uSD card configuration is
adjusted to mimic the downstream kernel setup.

> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index 83f8dd84d28a2..3de5c84d5f009 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts

[ ... ]

> @@ -2396,14 +2394,18 @@ wifi@1 {
>  	/* MicroSD card */
>  	mmc@78000400 {
>  		status =3D "okay";
> -
>  		bus-width =3D <4>;
> +
>  		cd-gpios =3D <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
> +		power-gpios =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
> +
> +		sd-uhs-ddr50;
> +		sd-uhs-sdr104;
> =20
>  		nvidia,default-tap =3D <0x3>;
>  		nvidia,default-trim =3D <0x3>;
> =20
> -		vmmc-supply =3D <&vdd_2v9_usd>;
> +		vmmc-supply =3D <&vcore_emmc>;

[Severity: High]
Does replacing the dynamic regulator with a static power-gpios property and=
 a
shared upstream regulator prevent the MMC subsystem from cycling VDD?

During an MMC power cycle (e.g., error recovery or system reset), the MMC c=
ore
attempts to cycle vmmc-supply. However, vmmc-supply is now the shared
vcore_emmc, which remains on because the non-removable eMMC holds a referen=
ce.

Meanwhile, the actual load switch for the MicroSD slot (TEGRA_GPIO(K, 1)) is
permanently held high during probe and never toggled:

drivers/mmc/host/sdhci-tegra.c:sdhci_tegra_probe() {
    ...
    tegra_host->power_gpio =3D devm_gpiod_get_optional(&pdev->dev, "power",
                                                     GPIOD_OUT_HIGH);
    ...
}

If UHS-I 1.8V mode negotiation fails, or if a soft reboot occurs while the
card is in 1.8V mode, the card will remain stuck expecting 1.8V signalling.
The host will revert to 3.3V (or 2.9V) and fail to initialize the card until
a hard cold boot.

>  		vqmmc-supply =3D <&vddio_usd>;
>  	};

[ ... ]

> @@ -2608,17 +2611,6 @@ hdmi_5v0_sys: regulator-hdmi {
>  		vin-supply =3D <&vdd_smps10_out2>;
>  	};
> =20
> -	vdd_2v9_usd: regulator-vdd-usd {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "vdd_sd_slot";
> -		regulator-min-microvolt =3D <2900000>;
> -		regulator-max-microvolt =3D <2900000>;
> -		regulator-boot-on;
> -		gpio =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -		vin-supply =3D <&vcore_emmc>;
> -	};
> -

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721101059.4516=
99-1-clamor95@gmail.com?part=3D6
