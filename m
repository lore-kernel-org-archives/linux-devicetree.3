Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206410;
	b=p+d1ZlbXQcTN+h4ptlY6q0Awh1xoK02S+n3HSvT2dhdSi95Cf4HV/Gtb2kQqDaD9RU3n
	 Ummmre4lmBKCMvftpQ6OJ33f+C8N3pOKYgTi0IlJTByF9+jU6y+AP2kg91SZkjTKBlEOk
	 8wrsz+RVTN9DxKmwosXDyDr8ApJs0RAM/Oj4ws5Ao6GYpGtXMEaHuduIQKBTvub5ccVN0
	 lxLMcgo3Rov8Dxx3CE9ocXd8X0Ifcb+dvO5gHLE1PLfDys9RVMGUfShIxSxY56MnUI6fw
	 um5W1kb2zxcsuDS9NWtzoJeC7H7X1rponPYjMdXf+fyAAMuQJG4nZXbfJF0WewfxtsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206410;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PyWG9gWTnIWKeOC5Y8bYlJKqmr9QsbUvVSCXSmNYAsU=;
	b=KURDRnl/SIRfFqeZulolzJaaXefTTTUAYZ9lMzbFbOlkfib7s62p1euuJncBUdMrzBHj
	 ZbiYGa3RmuNCI+Am2l9y0PQzmHxF1TPBjaa4ptFfGVEbEJttgIr9P6fECF0HIlIq053w9
	 yhfIjnkLYrZvCfm+ZYhp2VX3rpfFVcy6D7ZWojMJjrA8tSaheDrHQVWs+ZVfdZyU/aubD
	 1iIbNjjFUNtOdzRnsl/I46fDQo/FUDNVYPajIBMT3jDrtH5mL+IQlvphpvv74UdpuUaIA
	 mnvXJ76loMDpGO5B2rqAEj9kYYU9V4tJg+KWpLarkI6SrFA+J2A1q0SADdWNNT7nWig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAp7kURo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598C4606A6DF
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 20:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAp7kURo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3AD91F000CA;
	Fri, 20 Nov 2026 20:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795206409;
	bh=PyWG9gWTnIWKeOC5Y8bYlJKqmr9QsbUvVSCXSmNYAsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GAp7kURoYq3ZirtHIEKEnWAyaNFRx37BQbajVwIv/xBl4B6J/KLpZdC/UjMBiP/Bb
	 SIyAkwEIFVaRpQdBKYJj3ipC7SV+tAIlxrJc6gk7mHH/LuQlu8WgBuoQb9fEKQQyV/
	 bp5JxZ10UQhWSFHEo+DlMJWxMKubTcRUdRnbwP9mXT4xwrbxYxnIEmW02un1nu2GTJ
	 R+9GXMsmNyTY0io+iAZLifqPE+BMqtFyh9mbcFaqrAcqao6L8PLXs/OcXUqxWMrZe0
	 1glCMCT63VuT3qKSIk6Nl1xScCRBoFCOZK3FGJ9KyNZ2sIDvcQCEpQcg4ZIQZ7Hj2o
	 yeCOeCzQg90XQ==
Message-ID: <sashiko-outbox-226066@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: add ASUS Vivobook S16 S3607QA
 (X1P42100)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120201127.90969-3-ingo.kubbilun@gmail.com>
References: <20261120201127.90969-1-ingo.kubbilun@gmail.com>
 <20261120201127.90969-3-ingo.kubbilun@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 20:26:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] arm64: dts: qcom: vivobook-s16: missing regulator-always-on
  on vreg_l15b_1p8
- [Low] arm64: dts: qcom: SoC CPU thermal zones overridden via path refs
  in board DTS
- [Low] arm64: dts: qcom: unsorted pinctrl state nodes in vivobook-s16
  tlmm
--

commit cd103c40e0e47c852a865a1b61babe596be2c220
Author: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>

arm64: dts: qcom: add ASUS Vivobook S16 S3607QA (X1P42100)

This commit adds the device tree for the ASUS Vivobook S16 S3607QA laptop
based on the Qualcomm Snapdragon X X1-26-100 (X1P42100) SoC.

> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts b/ar=
ch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts
> new file mode 100644
> index 0000000000000..dba56bd114a00
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts

[ ... ]

> +&apps_rsc {
> +	regulators-0 {
> +		compatible =3D "qcom,pm8550-rpmh-regulators";
> +		qcom,pmic-id =3D "b";

[ ... ]

> +		vreg_l12b_1p2: ldo12 {
> +			regulator-name =3D "vreg_l12b_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1200000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +		};

[ ... ]

> +		vreg_l15b_1p8: ldo15 {
> +			regulator-name =3D "vreg_l15b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};

[Severity: Medium]
Should vreg_l15b_1p8 have regulator-always-on like vreg_l12b_1p2 and the
matching L15B rail on other X1 laptops (such as x1-asus-zenbook-a14.dtsi
and x1-crd.dtsi)?

Because wcn6855-pmu uses vreg_wcn_1p9 for vddio-supply, the audio codecs
(wcd938x, left_spkr, and right_spkr) are the only consumers of
vreg_l15b_1p8 described in DT.  If the audio codec drivers defer probe
after enabling their supplies or are unbound, the regulator framework will
drop the use count to zero and disable the 1.8V L15B rail powering shared
on-board components not modeled in DT.

[ ... ]

> +&tlmm {
> +	gpio-reserved-ranges =3D <34 2>, /* Unused */
> +			       <44 4>, /* SPI (TPM) */
> +			       <65 1>, /* EC reset */
> +			       <238 1>; /* UFS Reset */
> +
> +	edp_reg_en: edp-reg-en-state {
> +		pins =3D "gpio70";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		bias-disable;
> +	};
> +
> +	us_euro_hs_sel: us-euro-hs-sel-state {
> +		pins =3D "gpio68";
> +		function =3D "gpio";
> +		bias-pull-down;
> +		drive-strength =3D <2>;
> +	};
> +
> +	wcd_default: wcd-reset-n-active-state {
> +		pins =3D "gpio191";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	eusb3_reset_n: eusb3-reset-n-state {

[Severity: Low]
This isn't a bug, but us-euro-hs-sel-state and wcd-reset-n-active-state
are placed ahead of eusb3-reset-n-state instead of in alphabetical order
by node name inside &tlmm.

[ ... ]

> +/*
> + * CPU thermal throttling. hamoa.dtsi only has 115 C critical trips for =
the
> + * CPU zones, so under sustained load (e.g. make -j8) the SoC ran into t=
he
> + * hardware/EC protection and powered off abruptly. Add a passive trip at
> + * 90 C that lets the thermal core reduce the cluster frequency (scmi-cp=
ufreq
> + * cooling devices), like the GPU zones already do at 95 C.
> + */
> +&{/thermal-zones/cpu0-0-top-thermal} {
> +	polling-delay-passive =3D <250>;
> +
> +	trips {
> +		cpu0_0_top_alert: cpu-alert {
> +			temperature =3D <90000>;
> +			hysteresis =3D <2000>;
> +			type =3D "passive";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map0 {
> +			trip =3D <&cpu0_0_top_alert>;
> +			cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};

[Severity: Low]
Both the TSENS CPU sensors and the SCMI cpufreq cooling devices are
SoC-internal components defined in hamoa.dtsi (where commit 06eadce93697
("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for
CPU") previously removed passive CPU trips in favor of hardware limits
management and board-level skin thermistor cooling maps).

If TSENS-based passive CPU cooling is needed across Purwa/Hamoa machines
without EC or skin thermal control, should these definitions live in a
shared SoC/platform DTSI, or at least reference the &thermal_zones label
from hamoa.dtsi rather than using 20 &{/thermal-zones/...} root-path
overrides in this board DTS?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120201127.9096=
9-1-ingo.kubbilun@gmail.com?part=3D2
