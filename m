Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793688342;
	b=KDpobCtf35wFh1ZrE0Qh46TECrMI2W6pVfOBI1sbDSMiSfyxw13HNrMFz/nrFcBdOecr
	 dLGjWF3thYEdeuZCAlcTu+sjCsViFvBLieSqOMTyYqM5Zc++3FqAHqbp5y8ltyqdRl628
	 tVfsrfP2nXZc74TxfGfchASwmo02pMxH+NgMvRKZjOqfcsruhE39gXFJppc3Lf19ZZ0kR
	 Qq3JGsnbPN44Sh7iFL42opYLeXC0ke/WTtu3sYbtrT2qATr7hNWhofimCZFcJ4zrY0qdu
	 yUlqpr39kl7UutdzJRmGGrcRmBIZC36JBtCA53/SC34iT6LayxJxqzKC7XoU9s5r2KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688342;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eMuncFlOkfDAJOBFT4QXDQGFaegN/xHZ9ygGp1Yzaf8=;
	b=Jrb7ojEh+poNNZXqMmWqTgeDmoA/m+7zdEt0kpsgH7utRGIMD5RYeZ3CuwJkIUUf9z/4
	 6I8YmJJAqGpu9vyHwclCIyT7dy4juFuijFITlfyHEQS5y5bG4YsKhuEh+dTjbEqTF54CE
	 nVHcDYJ+vLbhX/ghk+6tVxz0FFSr3kQ5AcoBHOGNQtfY87zDt0rulcOjs6ppu3j0wnSFf
	 Ol4NNY564Lm10V20EuB9svr8y+y1pveG8wCDHTzeWq9SFP9Ryureek28hB1w2+GmY3YLs
	 oq0wdda71pqRuL20D3IcpyJQPvyZ3FhM/Yf0mlYtmL0laJtwAd5+xbfm/I2D2J4oROQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZHvJcuKY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF204606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 06:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZHvJcuKY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB751F000C1;
	Tue,  3 Nov 2026 06:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793688341;
	bh=eMuncFlOkfDAJOBFT4QXDQGFaegN/xHZ9ygGp1Yzaf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZHvJcuKYFGDHahDD+O75U4/+nFFSYNul4ENK46y0JrvEsWgUOXntaYJItX+ndt+DP
	 YnPE69wa4b+uqiFHbiapA3F4jPrYOTwPMmiNjtAJIdXYYd4RFMJAAtBc8Wf7ImT257
	 dFwcOdfR4GUsxVoR0lWlrG67+rXaJjfMgs6rxtGRSh8Kuc8PuN/BRYkfecWS1RdAsR
	 uU1b9720NJPTSsA+zpFbdckbxDWKD13QxvTcaBRiJ+o7XgbxBvoy4bcS/q+jJvNlxQ
	 Ey8yUv4uKbiUWsGKYQYBdDsZUyGWMtLy2bKEuQwO5sZc/qiC992pEqRyF7nKO9gH77
	 lb/S9BZeNusbw==
Message-ID: <sashiko-outbox-194667@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable SD UHS-I modes on ROCK Pi
 4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Velkov" <iav@iav.lv>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-rockpi4-sd-uhs-v1-1-fa394d2046e1@iav.lv>
References: <20261103-rockpi4-sd-uhs-v1-1-fa394d2046e1@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:45:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: rockchip: sdmmc 1.8V switch races with rockchip_iodo=
main_probe()
- [Medium] arm64: dts: rockchip: vcc_sdio 3.0V suspend voltage with 1.8V UH=
S-I mode
--

commit b8883fc4178b08c2e5a74537faa16281101fdba5
Author: Igor Velkov <iav@iav.lv>

arm64: dts: rockchip: Enable SD UHS-I modes on ROCK Pi 4

This commit lowers the minimum voltage of the vcc_sdio regulator to 1.8 V a=
nd
enables UHS-I modes (SDR12 through SDR104) with vqmmc-supply on the sdmmc
controller for ROCK Pi 4 boards.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
> index 52de4a79e2f41..3de1d14529c1a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
> @@ -356,7 +356,7 @@ vcc_sdio: LDO_REG4 {
>  				regulator-name =3D "vcc_sdio";
>  				regulator-always-on;
>  				regulator-boot-on;
> -				regulator-min-microvolt =3D <3000000>;
> +				regulator-min-microvolt =3D <1800000>;
>  				regulator-max-microvolt =3D <3000000>;
>  				regulator-state-mem {
>  					regulator-on-in-suspend;

[Severity: Medium]
Just below this in vcc_sdio, regulator-state-mem still configures a 3.0 V
suspend voltage:

arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi:
    vcc_sdio: LDO_REG4 {
        ...
        regulator-state-mem {
            regulator-on-in-suspend;
            regulator-suspend-microvolt =3D <3000000>;
        };
    };

At regulator registration, set_machine_constraints() ->
suspend_set_initial_state() -> __suspend_set_state() ->
rk808_set_suspend_voltage() programs RK808_LDO4_SLP_VSEL_REG to 3.0 V.

When a UHS-I card is initialized, mmc_sd_init_card() ->
mmc_set_uhs_voltage() -> dw_mci_switch_voltage() ->
mmc_regulator_set_vqmmc() switches vcc_sdio to 1.8 V, and
rockchip_iodomain_notify() -> rockchip_iodomain_write() configures the
RK3399 GRF_IO_VSEL SDMMC0_VDD bit for 1.8 V mode.

During system suspend to RAM (mem), _mmc_sd_suspend() -> mmc_power_off() ->
dw_mci_set_ios() -> mmc_regulator_disable_vqmmc() only drops the enable
reference on the regulator-always-on vcc_sdio regulator without restoring
its voltage to 3.0 V, and the non-switchable SD card supply stays powered
with both the card and GRF_IO_VSEL in 1.8 V mode. When PMIC_SLEEP is
asserted, the RK808 switches LDO_REG4 to RK808_LDO4_SLP_VSEL_REG (3.0 V) in
hardware without notifying rockchip-iodomain:

drivers/soc/rockchip/io-domain.c:rockchip_iodomain_notify()
    /*
     * According to Rockchip it's important to keep the SoC IO domain
     * higher than (or equal to) the external voltage.  That means we need
     * to change it before external voltage changes happen in the case
     * of an increase.

Does leaving regulator-suspend-microvolt at 3.0 V drive 3.0 V onto the
1.8 V-configured SDMMC0_VDD I/O domain and SD bus during mem suspend?

> @@ -696,6 +696,11 @@ &sdmmc {
>  	max-frequency =3D <150000000>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cd &sdmmc_cmd &sdmmc_bus4>;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	vqmmc-supply =3D <&vcc_sdio>;

[Severity: Medium]
In arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi, io_domains is a
sibling consumer of vcc_sdio rather than a supplier to sdmmc:

    &io_domains {
        ...
        sdmmc-supply =3D <&vcc_sdio>;
        status =3D "okay";
    };

Because drivers/pci/ and drivers/soc/ are linked before drivers/i2c/ in
drivers/Makefile while drivers/mmc/ is linked after drivers/i2c/, when
CONFIG_PCIE_ROCKCHIP_HOST=3Dy both rockchip_pcie_probe() and
rockchip_iodomain_probe() defer on their RK808 regulators before i2c0 probes
and are queued on deferred_probe_pending_list with pcie0 ahead of
io_domains.

Once i2c0 registers the RK808 regulators, dw_mci_rockchip_pltfm_driver
(which uses PROBE_PREFER_ASYNCHRONOUS) finds vcc_sdio ready, probes
immediately without waiting for io_domains, and schedules mmc_rescan().
Meanwhile, deferred_probe_work_func() runs rockchip_pcie_probe() ->
rockchip_pcie_host_init_port() synchronously before
rockchip_iodomain_probe():

drivers/pci/controller/pcie-rockchip-host.c:rockchip_pcie_host_init_port()
    msleep(PCIE_T_PVPERL_MS);
    gpiod_set_value_cansleep(rockchip->perst_gpio, 1);

    msleep(PCIE_RESET_CONFIG_WAIT_MS);

    /* 500ms timeout value should be enough for Gen1/2 training */
    err =3D readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_BASIC_STATU=
S1,
                             status, PCIE_LINK_UP(status), 20,
                             500 * USEC_PER_MSEC);

When the PCIe slot is empty, this blocks the deferred probe workqueue for
roughly 700 ms before rockchip_iodomain_probe() can call
regulator_register_notifier() on vcc_sdio. During that window,
mmc_rescan() -> mmc_sd_init_card() -> mmc_set_uhs_voltage() ->
dw_mci_switch_voltage() -> mmc_regulator_set_vqmmc() switches vcc_sdio to
1.8 V and runs dw_mci_rk3288_execute_tuning() while GRF_IO_VSEL is still at
its 3.3 V default.

Can this cause SDR104 tuning to fail at boot unless rockchip_iodomain_probe=
()
is guaranteed to register its vcc_sdio notifier before sdmmc switches volta=
ge?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-rockpi4-sd=
-uhs-v1-1-fa394d2046e1@iav.lv?part=3D1
