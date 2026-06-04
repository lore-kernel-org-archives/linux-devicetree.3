Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F61F9C0
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780557020; cv=none; b=Z+pp7TX+fCqbEIPFwJF2d45M6lNZm/A71/c17C3fyHQV2Sk+BNeniWNVRq2bEvqT5NlyCTaHHoDljGyzI+9mqcOqC7vdYtttRn52nIYvlgI61E2cktxJZN4k4bbB7qyJVkH891uMNEQ7yGrKvwnUzv0ZQVnovVcQCNwIjy0VcCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780557020; c=relaxed/simple;
	bh=PGhuYCPnbLLcb2x7AiYqdIDqFt7utMcUf8vz9KvF9Ik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h0TpkAFubc+NK/KXyUjKmqncMrBVPMtQcTXsAxz7bmu71LJ536eZLSw2oxTjIA+U++VreBpB3EsT0PPtELbjmlzQrHe4HlbPbTk+FvyCcsKVCBVLuLwwrN+Clvm+2A89v7Qdlm31p8xFi70qCcrWoF8xt3kOXlj1WLry+0UtmZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbWAgpNA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbWAgpNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6F51F00898;
	Thu,  4 Jun 2026 07:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780557019;
	bh=vP23zJEK9Hl3llTTtMKVEFUchmBQXd327ZzN9iQN0Aw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WbWAgpNADppomRCyrfr5LEUAAJAKHrUTjTin2xYbQdBMY8pcVI4LJab1hpMHcG2sf
	 qnd+wSSShcWZzwqYnWwWKhV7vxxu1IlNzNetC2p3tYRcl98nAwQ/9KOV+2yIFUovO7
	 66APwZVV5899pfv9KPLFG5xD7TLDvaH+UvSe4GbXmfzJxt9G1lqwRUR0ONbQ8ihxE8
	 4G9/6+XtKtOChAYvYcYMj5+5vS4ajaAqUdZ6oWR3eNzz4aZmBRaF9y9ZqEmZImQsXi
	 isMQUR/KdigYvXTFvtcBtLU/IWEVmGRErVD3CczbpfeMIZmXZk+oJ9Hqv6AIDb4lhI
	 HyuUh1yHiW6qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 06/10] ARM: tegra: tf701t: Tune MMC devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604065556.137614-7-clamor95@gmail.com>
References: <20260604065556.137614-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:10:18 +0000
Message-Id: <20260604071018.BD6F51F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Replacing the dedicated fixed regulator (`vdd_2v9_usd`) with a sta=
tic `power-gpios` property on the MicroSD slot breaks SD card power cycling=
, permanently trapping the card in 1.8V mode after soft reboots.
- [High] Enabling 1.8V SDR104 mode on an I/O regulator explicitly documente=
d as unstable at 1.8V risks data corruption.
- [High] Removing `mmc-ddr-1_8v` from the eMMC node drops support for eMMC =
DDR52 mode, causing a potential performance regression.
- [Low] The `mmc-ddr-1_8v` property is incorrectly applied to the MicroSD c=
ard node, failing to enable SD UHS-I DDR50 mode.
--

commit 78c4925ea5d1e41f4aa23b26404a535575996cfc
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: tf701t: Tune MMC devices
   =20
Set WiFi sdmmc device to SDR104 and improve power sequence. Set uSD sdmmc
device to SDR104 and reconfigure its power supply. Set eMMC sdmmc device
to HS200.

> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index 3e2bc611e2f7a..73276f2aa7fe4 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -1645,9 +1645,9 @@ ldo8 {
> =20
>  					vddio_usd: ldo9 {
>  						regulator-name =3D "vddio_usd";
> -						/* min voltage of 1.8v is not stable */
> -						regulator-min-microvolt =3D <2900000>;
> +						regulator-min-microvolt =3D <1800000>;

[Severity: High]
Is it safe to remove this hardware instability warning and lower the voltage
to 1.8V?

Enabling sd-uhs-sdr104 on the MicroSD node forces 1.8V signaling at high
frequencies. Operating high-speed SD transfers over a voltage rail known to
be unstable might lead to voltage droops, random card disconnects, read/wri=
te
I/O errors, and filesystem corruption.

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
> +		sd-uhs-sdr104;
> +		mmc-ddr-1_8v;

[Severity: Low]
Is this the correct property for a MicroSD card?

The mmc-ddr-1_8v property is specific to eMMC devices. The SD card
initialization logic does not check this capability for enabling DDR modes.

To advertise and enable UHS-I DDR50 support for an SD card, should this be
sd-uhs-ddr50?

> =20
>  		nvidia,default-tap =3D <0x3>;
>  		nvidia,default-trim =3D <0x3>;
> =20
> -		vmmc-supply =3D <&vdd_2v9_usd>;
> +		vmmc-supply =3D <&vcore_emmc>;

[Severity: High]
Will replacing the dedicated fixed regulator (vdd_2v9_usd) with a static
power-gpios property prevent the SD card from being power cycled?

The vcore_emmc regulator cannot be toggled independently since it is held
active by the non-removable eMMC. Looking at sdhci_tegra_probe() in
drivers/mmc/host/sdhci-tegra.c, power-gpios is acquired as GPIOD_OUT_HIGH
and is not toggled dynamically:

    tegra_host->power_gpio =3D devm_gpiod_get_optional(&pdev->dev, "power",=
 GPIOD_OUT_HIGH);

Without the ability to drop VDD to 0V during mmc_power_cycle(), won't the SD
card be trapped in 1.8V mode after warm reboots or error recovery? The SD
specification requires dropping VDD to 0V to reset the card's internal I/O
state from 1.8V back to 3.3V.

>  		vqmmc-supply =3D <&vddio_usd>;
>  	};
> =20
> @@ -2413,7 +2415,7 @@ mmc@78000600 {
>  		bus-width =3D <8>;
> =20
>  		non-removable;
> -		mmc-ddr-1_8v;
> +		mmc-hs200-1_8v;

[Severity: High]
Could removing mmc-ddr-1_8v cause a performance regression by dropping
support for eMMC DDR52 mode?

These modes are not mutually exclusive. For Tegra114, the host driver relies
entirely on the mmc-ddr-1_8v property to set MMC_CAP_1_8V_DDR, as
soc_data_tegra114 in drivers/mmc/host/sdhci-tegra.c does not set
NVQUIRK_ENABLE_DDR50.

If HS200 initialization or tuning fails, wouldn't the eMMC fall back to
legacy High Speed (SDR) mode at half the bandwidth instead of DDR52 without
this property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604065556.1376=
14-1-clamor95@gmail.com?part=3D6
