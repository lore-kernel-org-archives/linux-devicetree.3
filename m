Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876158;
	b=4AJfgJzQzX5FIb0uDq0h8wea5EO+0qZE6K1L7XxdipNFZjogBAsew5ec0x/AIzsmloTW
	 GOLn2gALAU3uGvAl3cxK9iYxmT4vE/re5sVinywcio7IQeA3mMdkTf1pzS51/q3CyHZ2t
	 10uSs30tCw5FsI6zAlKLrQby+VyA7LcWNAWEjD1NhkKsJ8AwJZM3owNXHL3vOVJqDHB6B
	 c9tz5vCFC1stdW48XVrmC/guEoMYIs38OJx/ILE7qMNpyBuc1frVl/tJclWHch94uWxBW
	 sfMDFW20pAgrkRk3KxOR+gFZpkxqx8Uq7hBCFCrDTYCR+UsEBjo6+MhMbash4sVEKXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876158;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=seyGAqCaQkg//AO5058sOq86RzdESczhyCjR4WIaa/4=;
	b=hvrpmb32TkwASmgLcOa+WnjFWMaCFejv9p4HQMC2uhgdUqm+1GmcSgt7frdrkASqo4LC
	 zJwjQE/BpkHzDh5bjr7U+b7fceEVkTAm1Jco96DsePn+2iLKhYIb1E893p28ut+XWtLhQ
	 cNssmTD12nc5AEsarZdtRKzyMflBgwZS8K93Nh+lSXEY8YL0YRG7zx7K4pqpLEeX+jOXZ
	 grDnOa6WhOvsb94ok4jRoKvHlPWVr0iyGisxqkIqzGjYSvaFrAxWtHRUxFup76wOx+s/N
	 zPlSWJ8QAcn+sahZl+OExGcpcBfmqx+5UXJvRtsDwBnYvy9ePxLwUv5n0mtE5n4U7aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0lijSyj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853F606EEA1
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0lijSyj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A5E1F000C1;
	Thu,  5 Nov 2026 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793876157;
	bh=seyGAqCaQkg//AO5058sOq86RzdESczhyCjR4WIaa/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o0lijSyjFNFxJU1rH9cbs2ablB6t5wwO524C5nakOs5hGD5zLX1f9MWrwkpOG0SMX
	 JWn9HPvnK+22D5FPlId9Tt4TETuJgjPDs3v4Kbool+2qpr+WBcyrAAgECT2zFJR+Qk
	 EREfkY4qNDA/MULAsrBw9ST+8eVvUKSwMWJjXnFzH/MSt7YecDflX5rZZiAi1Wlx3t
	 SH5bXfCOsFL/4Yt/WRD75IFp7+7zysDOBTU0A48xwd9Avxr6ymt0YeEVZRcb3irCw6
	 /XIIqY3UoNNzv0zd7Zz0+DqdF0c35nzbrvTUmDbr00Q1YYRq5+DD8StAjV1Esx7EJ9
	 9jaS8BmJROSvg==
Message-ID: <sashiko-outbox-198890@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: enable SD UHS-I on
 Firefly-RK3399
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105102556.1365-1-yaozhonguwl@gmail.com>
References: <20261105102556.1365-1-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 10:55:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] arm64: dts: rockchip: sdmmc UHS-I fails at boot and mismatches IO =
voltage
- [High] arm64: dts: rockchip: vcc_sdio drives 3.0V onto 1.8V SD IO lines a=
nd IO domain
- [High] arm64: dts: rockchip: sdmmc enables UHS-I without vmmc-supply on F=
irefly-RK3399
- [Medium] arm64: dts: rockchip: vcc_sdio 3.0V cap on rk3399-firefly logs K=
ERN_ERR
--

commit 8066f5f531470e89215d716c8eed028fd1c7fe76
Author: Yaozhong Li <yaozhonguwl@gmail.com>

arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399

This commit updates the power supplies for sdio0 and sdmmc on the
Firefly-RK3399 board, switching sdio0 vmmc-supply to vcc3v3_sys and
assigning vcc_sdio as vqmmc-supply on sdmmc with sd-uhs-sdr104 enabled.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64=
/boot/dts/rockchip/rk3399-firefly.dts
> index 0568dfa140b32..fe1f8d75d94d0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts

[ ... ]

> @@ -804,6 +804,8 @@ &sdmmc {
>  	max-frequency =3D <150000000>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
> +	sd-uhs-sdr104;
> +	vqmmc-supply =3D <&vcc_sdio>;

[Severity: High]
When a UHS-I SD card is present at boot, can enabling sd-uhs-sdr104 and
vqmmc-supply =3D <&vcc_sdio> on &sdmmc leave the bus in a 3.0V host versus
1.8V card signaling mismatch when fe320000.mmc probes before &io_domains?

In arch/arm64/boot/dts/rockchip/rk3399-firefly.dts, both &io_domains
(sdmmc-supply =3D <&vcc_sdio>) and &sdmmc (vqmmc-supply =3D <&vcc_sdio>) are
consumers of vcc_sdio without a supplier-consumer device link ordering
&io_domains before &sdmmc. If &sdmmc runs mmc_rescan() before
rockchip_iodomain_probe() registers its notifier via
regulator_register_notifier(), mmc_sd_get_cid() -> mmc_set_uhs_voltage()
sends CMD11 to switch the card to 1.8V signaling and lowers vcc_sdio to
1.8V while GRF_IO_VSEL for SDMMC0_VDD is still configured for 3.3V logic.

When SDR104 tuning in mmc_sd_init_uhs_card() ->
dw_mci_rk3288_execute_tuning() then fails across all phases, &sdmmc has no
vmmc-supply to cut VDD power to the card during mmc_power_off() or
mmc_power_cycle(). In drivers/mmc/core/sd.c:mmc_sd_init_card():

	if (!v18_fixup_failed && !mmc_host_is_spi(host) && mmc_host_can_uhs(host) =
&&
	    mmc_sd_card_using_v18(card) &&
	    host->ios.signal_voltage !=3D MMC_SIGNAL_VOLTAGE_180) {
		if (mmc_host_set_uhs_voltage(host) ||
		    mmc_sd_init_uhs_card(card)) {
			v18_fixup_failed =3D true;
			mmc_power_cycle(host, ocr);
			if (!oldcard)
				mmc_remove_card(card);
			goto retry;
		}
		goto cont;
	}

mmc_power_cycle() -> mmc_power_up() -> mmc_set_initial_signal_voltage()
raises vcc_sdio back to 3.0V without cutting card VDD, and the retry pass
falls through to mmc_sd_switch_hs(), operating at 50 MHz High-Speed with
vcc_sdio and SDMMC0_VDD at 3.0V while the SD card remains latched in 1.8V
signaling mode from CMD11.

[Severity: High]
As reported by Sashiko on v1 [1], when a UHS-I SD card is initialized in
1.8V mode, doesn't system suspend drive 3.0V from vcc_sdio onto the 1.8V
configured SDMMC0_VDD IO domain and 1.8V-latched SD card IO lines?

In arch/arm64/boot/dts/rockchip/rk3399-firefly.dts, vcc_sdio configures its
sleep state to 3.0V:

			vcc_sdio: LDO_REG4 {
				regulator-name =3D "vcc_sdio";
				regulator-always-on;
				regulator-boot-on;
				regulator-min-microvolt =3D <1800000>;
				regulator-max-microvolt =3D <3000000>;
				regulator-state-mem {
					regulator-on-in-suspend;
					regulator-suspend-microvolt =3D <3000000>;
				};
			};

Once mmc_sd_get_cid() -> mmc_set_uhs_voltage() switches the card and
vcc_sdio to 1.8V, rockchip_iodomain_notify() sets the SDMMC0_VDD bit in
GRF_IO_VSEL to 1.8V mode. During PM_SUSPEND_MEM, _mmc_sd_suspend() ->
mmc_power_off() -> dw_mci_set_ios() does not restore vqmmc to 3.0V and
cannot cut card VDD without a vmmc-supply. When PMIC_SLEEP is asserted, the
RK808 PMIC switches LDO_REG4 to 3.0V via RK808_LDO4_SLP_VSEL_REG without
notifying rockchip-iodomain, applying 3.0V to the 1.8V-configured SoC IO
domain and the powered 1.8V-mode SD card.

[Severity: High]
As reported by Sashiko on v1 [2], because &sdmmc has no vmmc-supply in
arch/arm64/boot/dts/rockchip/rk3399-firefly.dts, how can the kernel
power-cycle the SD card VDD rail after switching the card to 1.8V signaling
via CMD11?

In drivers/mmc/host/dw_mmc.c:dw_mci_set_ios():

	case MMC_POWER_OFF:
		/* Turn clock off before power goes down */
		dw_mci_setup_bus(slot, false);

		if (!IS_ERR(mmc->supply.vmmc))
			mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);

		mmc_regulator_disable_vqmmc(mmc);

Without vmmc-supply, MMC_POWER_OFF cannot cut VDD to reset the card from
1.8V back to 3.3V signaling mode. Across a warm reboot after UHS-I
negotiation (_mmc_sd_suspend() -> mmc_power_off()), the card remains stuck
in 1.8V signaling mode when the BootROM or bootloader tries to reinitialize
the slot at 3.0V/3.3V.

[Severity: Medium]
Does setting vqmmc-supply =3D <&vcc_sdio> on &sdmmc without a 3.0V
vmmc-supply cause regulator_check_voltage() to log an error on every 3.3V
signal voltage setup?

In arch/arm64/boot/dts/rockchip/rk3399-firefly.dts, vcc_sdio sets
regulator-max-microvolt =3D <3000000>. Because &sdmmc has no vmmc-supply,
dw_mci_init_host() defaults mmc->ocr_avail to MMC_VDD_32_33 | MMC_VDD_33_34
(3.3V-3.4V).

On every mmc_power_up(), mmc_set_initial_signal_voltage() calls
dw_mci_switch_voltage() -> mmc_regulator_set_vqmmc() with
MMC_SIGNAL_VOLTAGE_330, which invokes regulator_set_voltage_triplet() for
the range 3000000-3600000 uV with a target of 3300000 uV. The first pass in
regulator_set_voltage_triplet() calls regulator_set_voltage(vcc_sdio,
3300000, 3600000), hitting drivers/regulator/core.c:regulator_check_voltage=
():

	if (*max_uV > rdev->constraints->max_uV)
		*max_uV =3D rdev->constraints->max_uV;
	if (*min_uV < rdev->constraints->min_uV)
		*min_uV =3D rdev->constraints->min_uV;

	if (*min_uV > *max_uV) {
		rdev_err(rdev, "unsupportable voltage range: %d-%duV\n",
			 *min_uV, *max_uV);
		return -EINVAL;
	}

This logs an "unsupportable voltage range: 3300000-3000000uV" error before
falling back to 3.0V. Should &sdmmc either provide a 3.0V vmmc-supply or
adjust the vcc_sdio constraints to match?

[1] https://lore.kernel.org/r/20260922055011.14972-1-yaozhonguwl@gmail.com
[2] https://lore.kernel.org/r/20260922055011.14972-1-yaozhonguwl@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105102556.1365=
-1-yaozhonguwl@gmail.com?part=3D1
