Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088524;
	b=Awm/7i1pFON4xcdXLSFSxXfZRhfgljPCcO6+KywprFu3HugJhtERe/nKZ4gzKZZ81aQL
	 k7XdFJsybalzgiGQkG+TLdkfGiiNRSRcmKl9LnFbSPC8k3If3jkejfC62tUnajHomFu50
	 Ztz8I9ldM334/cK9/w02jRR2ZzMCYjv9W/leI9rshRnl+CxpUbiOrF9vWJEIV66pcLOBq
	 t7iGXf9eGt4PnqzNM0Ifza3/TG3eMpImumqci3LsDlSn0pAptPtWAqlti5mi6L0NoWk+Q
	 2KcovA5c1q1NeE3ysl7F/ZuwHbP1IGE+Gsb1qBxfKs/eF064slelAAzJUvZkh3c+bhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088524;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5E9FlQvhb19UGOTc8IkKlhI/XqkFM8okAj+SjwNf/vk=;
	b=4zDUvAHEYclqKFHH9J7ulDuU3C04EEFQFRiKxBoWaN116uMm/iAA60KrOJtmEnNOTdpF
	 95z7ObmrtwVNbIXNdvaWrjXhodM71r0A3f3qgrZikq9uSWejVd0rK5fH4TjOrGPreLz8b
	 Zc9fmgI2tmZOqXhdHUL7If4Eb/IEIGj0172O5ecfrQZq1+oCo3IN6VWk+jaNXzZL7WnSJ
	 A3iFE2A1FEuulDxb/THcA46kxggKSPNZhh9FtYH1Zrwqx1PHVlWqwzSXwjZNmR2DiwPPU
	 WJew6/TJlEgFq5RRi6FVIFOeKRW4csvWZglMUwccvSbU9X7HZKsrPvTlNoigp6EfoiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j/9VGfdB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441D2606A324
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j/9VGfdB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F61D1F01829;
	Tue, 27 Oct 2026 08:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793088523;
	bh=5E9FlQvhb19UGOTc8IkKlhI/XqkFM8okAj+SjwNf/vk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j/9VGfdBGn2Y6qOlFVlzqsAqtqyF896UmtcQGLQvREs9F8IyFVqgsjxhcD8gps42H
	 QS7uYJ8qwUG8IIWwSNXfY4AsxXGz4AvimZGOeTwUKbpNhAC73GOwMHM+8B+hnutAqk
	 iiRTAHXc5OT+IUOj8q238AE4tz60Az3IluQmfC7g+yoFAw4fQySZWyTohrGk1DNZnB
	 NSYILsbGyDOe7C5i/BsyEFwtbPTRIrlXSTVWErPLYpXIq+FbQh61JVM+OnyKQKlrcA
	 Psd7UvedQlbnw7oxdz6O25QkdC1E72Vr1nQV9pjWgZPWGOwScRPQ2aOwKEBjTWxjez
	 d3jQEr2WxK+mw==
Message-ID: <sashiko-outbox-186266@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amir Hanip" <killdeath104@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027075116.41673-3-killdeath104@gmail.com>
References: <20261027075116.41673-1-killdeath104@gmail.com>
 <20261027075116.41673-3-killdeath104@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 08:08:43 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: sm6115-xiaomi-citrus: wifi node bypasses wcn3950=
-pmu
- [Low] arm64: dts: qcom: sm6115-xiaomi-citrus: reserved-memory unit-addres=
s mismatch
- [Low] arm64: dts: qcom: sm6115-xiaomi-citrus: missing regulator-allow-set=
-load on pm6125_l22
--

commit 7e5e34e4180038cdeff80b6bdbee89dac2d1329f
Author: Amir Hanip <killdeath104@gmail.com>

arm64: dts: qcom: Add Xiaomi Poco M3

This commit adds the initial device tree for the Xiaomi Poco M3 (citrus),
a smartphone based on the Qualcomm Snapdragon 662 (SM6115) SoC.

> diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts b/arch/arm=
64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
> new file mode 100644
> index 0000000000000..00c56e0f4f91a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
> @@ -0,0 +1,516 @@

[ ... ]

> +	wcn3950-pmu {
> +		compatible =3D "qcom,wcn3950-pmu";
> +
> +		pinctrl-0 =3D <&sw_ctrl_default>;
> +		pinctrl-names =3D "default";
> +
> +		vddio-supply =3D <&pm6125_l9>;
> +		vddxo-supply =3D <&pm6125_l16>;
> +		vddrf-supply =3D <&pm6125_l17>;
> +		vddch0-supply =3D <&pm6125_l23>;
> +
> +		swctrl-gpios =3D <&tlmm 87 GPIO_ACTIVE_HIGH>;
> +
> +		regulators {
> +			vreg_pmu_io: ldo0 { regulator-name =3D "vreg_pmu_io"; };
> +			vreg_pmu_xo: ldo1 { regulator-name =3D "vreg_pmu_xo"; };
> +			vreg_pmu_rf: ldo2 { regulator-name =3D "vreg_pmu_rf"; };
> +			vreg_pmu_ch0: ldo3 { regulator-name =3D "vreg_pmu_ch0"; };
> +			vreg_pmu_ch1: ldo4 { regulator-name =3D "vreg_pmu_ch1"; };
> +		};
> +	};
> +};

[ ... ]

> +&pil_gpu_mem {
> +	reg =3D <0x0 0x55A15000 0x0 0x2000>;
> +};
> +
> +&pil_ipa_fw_mem {
> +	reg =3D <0x0 0x55A00000 0x0 0x10000>;
> +};
> +
> +&pil_ipa_gsi_mem {
> +	reg =3D <0x0 0x55A10000 0x0 0x5000>;
> +};

[Severity: Low]
In arch/arm64/boot/dts/qcom/sm6115.dtsi, these reserved-memory nodes are
defined as:

arch/arm64/boot/dts/qcom/sm6115.dtsi:
    pil_ipa_fw_mem: memory@56100000 {
        reg =3D <0x0 0x56100000 0x0 0x10000>;
        no-map;
    };

    pil_ipa_gsi_mem: memory@56110000 {
        reg =3D <0x0 0x56110000 0x0 0x5000>;
        no-map;
    };

    pil_gpu_mem: memory@56115000 {
        reg =3D <0x0 0x56115000 0x0 0x2000>;
        no-map;
    };

Because overriding reg by label reference does not rename the nodes, does
this leave the unit-addresses (@56115000, @56100000, and @56110000) out of
sync with their new base addresses and trigger dtc / dtbs_check warnings?

Should these nodes be removed with /delete-node/ and recreated under
&reserved_memory with matching @55a00000, @55a10000, and @55a15000
unit-addresses and lowercase hex literals?

[ ... ]

> +		pm6125_l22: l22 {
> +			regulator-min-microvolt =3D <2952000>;
> +			regulator-max-microvolt =3D <3304000>;
> +		};

[Severity: Low]
Since pm6125_l22 is used as vmmc-supply for &sdhc_2, should this node also
include regulator-allow-set-load?

When sdhci_msm powers the SD card bus on or off via
sdhci_msm_handle_pwr_irq() -> sdhci_msm_set_vmmc() ->
msm_config_vmmc_regulator(), it calls regulator_set_load(mmc->supply.vmmc,
load). Without regulator-allow-set-load in the device tree node,
of_get_regulation_constraints() does not set REGULATOR_CHANGE_DRMS, causing
drms_uA_update() in drivers/regulator/core.c to skip calling
rpm_reg_set_load():

drivers/regulator/core.c:drms_uA_update() {
    ...
    if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_DRMS)) {
        rdev_dbg(rdev, "DRMS operation not allowed\n");
        return 0;
    }
    ...
}

[ ... ]

> +&wifi {
> +	vdd-0.8-cx-mx-supply =3D <&pm6125_l4>;
> +	vdd-1.8-xo-supply =3D <&pm6125_l16>;
> +	vdd-1.3-rfa-supply =3D <&pm6125_l17>;
> +	vdd-3.3-ch0-supply =3D <&pm6125_l23>;
> +	vdd-3.3-ch1-supply =3D <&pm6125_l24>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Should &wifi reference the wcn3950-pmu LDO regulators (&vreg_pmu_xo,
&vreg_pmu_rf, &vreg_pmu_ch0) instead of pointing directly to the PM6125
regulators?

In drivers/power/sequencing/pwrseq-qcom-wcn.c, pwrseq_qcom_wcn3990_match()
matches the WiFi device to wcn3950-pmu by checking whether
vdd-1.8-xo-supply resolves to a child regulator of the PMU node:

drivers/power/sequencing/pwrseq-qcom-wcn.c:pwrseq_qcom_wcn3990_match() {
    ...
    /* WiFi device match */
    return pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vdd-1.8-xo-supply"=
);
}

Because vdd-1.8-xo-supply is set to <&pm6125_l16> instead of
<&vreg_pmu_xo>, pwrseq_qcom_wcn3990_match() returns PWRSEQ_NO_MATCH and
devm_pwrseq_get(&pdev->dev, "wlan") in ath10k_snoc_probe() returns
-EPROBE_DEFER:

drivers/net/wireless/ath/ath10k/snoc.c:ath10k_snoc_probe() {
    ar_snoc->pwrseq =3D devm_pwrseq_get(&pdev->dev, "wlan");
    if (IS_ERR(ar_snoc->pwrseq)) {
        ret =3D PTR_ERR(ar_snoc->pwrseq);
        ar_snoc->pwrseq =3D NULL;
        if (ret !=3D -EPROBE_DEFER)
            goto err_free_irq;

        ar_snoc->num_vregs =3D ARRAY_SIZE(ath10k_regulators);
    }
    ...
}

As a result, ath10k_snoc_probe() falls back to direct regulator management
with ar_snoc->pwrseq =3D NULL, bypassing wcn3950-pmu power sequencing. Since
pm6125_l9 (the WCN3950 vddio-supply) is only referenced by wcn3950-pmu and
is not part of ath10k_regulators, won't pm6125_l9 remain unpowered or get
turned off whenever Bluetooth is disabled?

Also, wcn3950-pmu defines vreg_pmu_ch1: ldo4 without a corresponding
vddch1-supply, while &wifi connects vdd-3.3-ch1-supply directly to
&pm6125_l24. Should vreg_pmu_ch1 either be wired via wcn3950-pmu or
dropped if unused?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027075116.4167=
3-1-killdeath104@gmail.com?part=3D2
