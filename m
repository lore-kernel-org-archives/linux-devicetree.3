Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135188;
	b=Rcjbu2d/EDtgigvZcesohbTJs0zZOOOP/77iOTVnCPTMHTJIyB5yX6YV5FENiZr/oYu1
	 d+QZ5HbLLfn305g3/cRJLBSj8EoeOBVaKzY6Z9NhDp0KJNUtrQajBh4y/nE3U9bTVLWsF
	 zQ/3SOPbQ3l84MuBMS1sqcNWLmzLcqJcdrqw6mRUoVkGNDqUm5mC8esnb75RCSh7ao9IU
	 EQwjk1Zs5moX/dyPbJwHgF50O2Be/3TJSSZqaGqANOf9ckZJWJOizbxpRPbEtHqw3tR3R
	 rXxfa1QAive8l8a5kQyhnHoDo7Cpy4bX34RgE7JOJ3cmJgNenH7OwMsDwsCXEmYk3Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135188;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dO+LXF6lK5dUMGy0tQRJsPv4uNq6rOPI0lpbbLxk+PU=;
	b=c3ECw8fVTK3e7biMEzixkXayjLp9iKwGQEfMRqG1emY2IqdaqQmzgnuIGFlkM1OyP9V6
	 OTEUzGRotWGD3TIfsNHS/fR4uvHJecx2q2ANktq228uO6uytIL/dDy3mUiemz5VGakwX+
	 y5hyOi3nL4zeQdNg6ZjjfSn5XxZKhMpKworE+9xKWaauCjFac1qArXJi2uL0KV2OZdcGT
	 uzCP27l0/lu4J7MlaLpRm2O2Gmo7hWVu5kkDeipSht15JjLm4mf9bThzzPrIAKOwv403I
	 YsTa/B9Ad48QfqMeGZU7fnEA65Z2krm7Lk87LRKHlRqqPFeY7px8txkHK3RhmGuHrVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+Gytw0e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB402606A320
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 21:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+Gytw0e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F201F01828;
	Tue, 27 Oct 2026 21:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793135187;
	bh=dO+LXF6lK5dUMGy0tQRJsPv4uNq6rOPI0lpbbLxk+PU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f+Gytw0e5vXxBeJYZEOjy+ER9EpBd4Q1fbsw7nwZYKea1qxmhMM7vaziHdh4lXLeD
	 tOtUb7K9VXv6YJd2X4fAvCSH00hvJaHNx8+llpsS+esvHnVte3WNqmw0hU3NUy3lhr
	 NjnrAL/M64KLmW93AmT9VIOnSeG/LeAIcFEjoMvriZ+m2LBELm4SPxnLHMxErzuSUC
	 R6Uj5WmWWioVhN8X3akQ5hYhmBPzA38Vvri1xkry5C1Vx6ERUvFrVKrDyGL0o1Uufn
	 yp+dYE2eDY7MJC8P+IdBTBxa0a/+5o+jZFfWBFBcTKqTNp7GRNB72BB0Po1WytWLne
	 lWPjoJW9FrL+g==
Message-ID: <sashiko-outbox-187110@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amir Hanip" <killdeath104@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027205146.16384-3-killdeath104@gmail.com>
References: <20261027205146.16384-1-killdeath104@gmail.com>
 <20261027205146.16384-3-killdeath104@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 21:06:26 +0000
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
- [Medium] arm64: dts: qcom: citrus: wifi node bypasses wcn3950-pmu regulat=
ors
- [Low] arm64: dts: qcom: citrus: mismatched unit-addresses on reserved-mem=
ory nodes
--

commit f6a18aab14c146c73ad430a3e102de48b29909dc
Author: Amir Hanip <killdeath104@gmail.com>

arm64: dts: qcom: Add Xiaomi Poco M3

This commit adds the initial device tree for the Xiaomi Poco M3 (codename
citrus) based on the Qualcomm Snapdragon 662 (SM6115) SoC, enabling UFS,
microSD, USB host, WiFi, Bluetooth, and remoteprocs.

> diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts b/arch/arm=
64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
> new file mode 100644
> index 0000000000000..330f626ae7b1f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts

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
> +			vreg_pmu_io: ldo0 {
> +				regulator-name =3D "vreg_pmu_io";
> +			};
> +
> +			vreg_pmu_xo: ldo1 {
> +				regulator-name =3D "vreg_pmu_xo";
> +			};
> +
> +			vreg_pmu_rf: ldo2 {
> +				regulator-name =3D "vreg_pmu_rf";
> +			};
> +
> +			vreg_pmu_ch0: ldo3 {
> +				regulator-name =3D "vreg_pmu_ch0";
> +			};
> +
> +			vreg_pmu_ch1: ldo4 {
> +				regulator-name =3D "vreg_pmu_ch1";
> +			};
> +		};
> +	};
> +};

[ ... ]

> +&pil_adsp_mem {
> +	reg =3D <0x0 0x53800000 0x0 0x2200000>;
> +};
> +
> +&pil_cdsp_mem {
> +	reg =3D <0x0 0x51a00000 0x0 0xa00000>;
> +};
> +
> +&pil_gpu_mem {
> +	reg =3D <0x0 0x55a15000 0x0 0x2000>;
> +};
> +
> +&pil_ipa_fw_mem {
> +	reg =3D <0x0 0x55a00000 0x0 0x10000>;
> +};
> +
> +&pil_ipa_gsi_mem {
> +	reg =3D <0x0 0x55a10000 0x0 0x5000>;
> +};

[Severity: Low]
In arch/arm64/boot/dts/qcom/sm6115.dtsi, pil_ipa_fw_mem, pil_ipa_gsi_mem,
and pil_gpu_mem are declared under /reserved-memory with unit-addresses mat=
ching
their original base addresses:

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

Overriding their reg properties in-place leaves the compiled DTB with
memory@56100000, memory@56110000, and memory@56115000 nodes whose unit-addr=
esses
no longer match their reg base addresses (0x55a00000, 0x55a10000, and
0x55a15000), which causes dtbs_check warnings.

Should these nodes be removed with /delete-node/ and recreated under
/reserved-memory with matching unit-addresses (memory@55a00000, memory@55a1=
0000,
and memory@55a15000)?

[ ... ]

> +&uart3 {
> +	pinctrl-0 =3D <&uart3_default>;
> +	pinctrl-1 =3D <&uart3_sleep>;
> +	pinctrl-names =3D "default", "sleep";
> +
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "qcom,wcn3950-bt";
> +		vddio-supply =3D <&vreg_pmu_io>;
> +		vddxo-supply =3D <&vreg_pmu_xo>;
> +		vddrf-supply =3D <&vreg_pmu_rf>;
> +		vddch0-supply =3D <&vreg_pmu_ch0>;
> +	};
> +};

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

[Severity: Medium]
Should the wifi node reference the wcn3950-pmu regulators (&vreg_pmu_xo,
&vreg_pmu_rf, and &vreg_pmu_ch0) instead of pointing directly to the PM6125
RPM regulators?

When drivers/power/sequencing/pwrseq-qcom-wcn.c binds to wcn3950-pmu,
pwrseq_qcom_wcn3990_match() matches the WiFi device by checking whether
vdd-1.8-xo-supply resolves to a regulator subnode under wcn3950-pmu:

drivers/power/sequencing/pwrseq-qcom-wcn.c:pwrseq_qcom_wcn3990_match() {
	/* BT device */
	ret =3D pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vddio-supply");
	if (ret =3D=3D PWRSEQ_MATCH_OK)
		return ret;

	/* WiFi device match */
	return pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vdd-1.8-xo-supply");
}

Because wifi points vdd-1.8-xo-supply directly to &pm6125_l16 rather than
&vreg_pmu_xo, pwrseq_qcom_wcn3990_match() returns PWRSEQ_NO_MATCH, causing
devm_pwrseq_get(&pdev->dev, "wlan") in ath10k_snoc_probe() to return
-EPROBE_DEFER and fall back to legacy regulator management with
ar_snoc->pwrseq =3D NULL:

drivers/net/wireless/ath/ath10k/snoc.c:ath10k_snoc_probe() {
	ar_snoc->pwrseq =3D devm_pwrseq_get(&pdev->dev, "wlan");
	if (IS_ERR(ar_snoc->pwrseq)) {
		ret =3D PTR_ERR(ar_snoc->pwrseq);
		ar_snoc->pwrseq =3D NULL;
		if (ret !=3D -EPROBE_DEFER)
			goto err_free_irq;

		ar_snoc->num_vregs =3D ARRAY_SIZE(ath10k_regulators);
	} else {
		ar_snoc->num_vregs =3D 1;
	}
}

As a result, ath10k bypasses the wcn3950-pmu power sequencer and never enab=
les
or votes on vddio-supply (&pm6125_l9), which is only referenced by wcn3950-=
pmu
and is not in ath10k_regulators[]. Will this leave vddio unpowered when WiF=
i is
used while Bluetooth is off, or cause pwrseq_disable() to turn off &pm6125_=
l9
when Bluetooth is disabled while WiFi is active?

Also, if ch1 is used on this board, should wcn3950-pmu define vddch1-supply=
 and
wifi reference &vreg_pmu_ch1, or if WCN3950 only uses ch0, should
vdd-3.3-ch1-supply on wifi and vreg_pmu_ch1 on wcn3950-pmu be dropped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027205146.1638=
4-1-killdeath104@gmail.com?part=3D2
