Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F943B14A7
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744105; cv=none; b=Dm4TJ7LhgoD4WFLHM5shQ2XVDmo+I1PF+wm2B1kRl82+u4KfnNyIGJbsGiPx4P0mzDvJVgy1GTQDle2+98MqY6D1BPDoip1VOehDjawuU8FRLw+Xewkhi8KiHmsIEpCsn1VwZwcyViFYBwpITABtX5QQ/o62G1dB8yxQRO7JlSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744105; c=relaxed/simple;
	bh=UFOAhtkXj+Njp50viA3sghYbMFaFxtcYisj2WSpIzjo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ap9kVskOCN43JEIuHRtlAA+yCY4Iry/dVd/69yOTiI38sBjbfXBXkusdWuXiAfp1jVRaXvr59mh+bQBMVhPKjJ1XbCRrYh0SikQHyhKpg+lPH3fGPd3TfQRNGZOnMhkeGp8kLkGbNHRxRJmQuOJEm4KxpB2piZSCjXWKGqehczU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnSIfIYH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnSIfIYH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397D51F000E9;
	Wed, 26 Aug 2026 11:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787744103;
	bh=BuvayPehLXKeaSiBKsST30khfkKAzIoE6sQI38z2shw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gnSIfIYHl0i0xYkHbcQnKg5vt4z9ysQtP7zUoV9COqIPtPRka4yapPEqkxivDgt0a
	 c/VPStNCCAkscVgr2nzyybAdHJeIrTh+Co+6D0TZZuid4tgxr845ncnyLIkYt5Wqcq
	 0utO4ylwb42ATXQz7PrpCGcpKe0EHGnS7ZFxICya23tFayZElLx6qdPEL6uZl2LAER
	 Ha+asUDYfmntQc6f+sIj4f/MzThIhnLykIxl7Bc4fHvMGhu3dUKttTtPZBv1rzo9Hd
	 K2Km2HsGIHUe+ADcx3X1297qWnMnYjjuJZjvfwpEAuau3+9XLaBzqsMRNFp3glWsXV
	 yBqzJ3BNuR1uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for
 SD Card via overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826112456.482982-3-monish.chunara@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 11:35:02 +0000
Message-Id: <20260826113503.397D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Contradictory `no-1-8-v` property cripples SD card performance a=
nd renders 1.8V configurations unreachable dead code.
--

commit 4879ab8dba79e898a8b5716011659f84e4632a0e
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay

This commit modifies the base monaco-evk device tree to make it storage
agnostic by removing eMMC-specific configuration. It introduces a new device
tree overlay to explicitly enable the SD Host Controller Interface for SD
cards.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm6=
4/boot/dts/qcom/monaco-evk-sd-card.dtso
> new file mode 100644
> index 0000000000000..bc4ea12587a2e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> @@ -0,0 +1,72 @@
[ ... ]
> +        vreg_sdc: regulator-sdc {
> +		compatible =3D "regulator-gpio";
> +
> +		regulator-name =3D "vreg_sdc";
> +		regulator-type =3D "voltage";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <2950000>;
> +
> +		gpios =3D <&expander1 7 GPIO_ACTIVE_HIGH>;
> +		states =3D <1800000 1>, <2950000 0>;

[Severity: Medium]
Is this 1.8V regulator state reachable? Later in this overlay, the sdhc_1
node specifies the no-1-8-v property. Since that prevents the MMC core
from switching to 1.8V I/O, it seems this state might act as dead code.

> +
> +		startup-delay-us =3D <100>;
> +        };
> +};
> +
> +&sdhc_1 {
> +	vmmc-supply =3D <&vmmc_sdc>;
> +	vqmmc-supply =3D <&vreg_sdc>;
> +
> +	pinctrl-0 =3D <&sdc1_state_on>, <&sd_cd>;
> +	pinctrl-1 =3D <&sdc1_state_off>, <&sd_cd>;
> +	pinctrl-names =3D "default", "sleep";
> +
> +	cap-sd-highspeed;
> +	no-1-8-v;

[Severity: Medium]
Does this restriction unintentionally cripple the SD card performance?
This property forces the MMC core to disable UHS modes, capping the SD card
at 50MHz High Speed mode. If the hardware supports UHS-I modes, should this
property be omitted so the 1.8V states and higher frequency OPPs can be
utilized?

> +
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&tlmm 11 GPIO_ACTIVE_LOW>;
> +	no-mmc;
> +	no-sdio;
> +
> +	status =3D "okay";
> +};
> +
> +&sdhc1_opp_table {
> +	opp-100000000 {
> +		opp-hz =3D /bits/ 64 <100000000>;
> +		required-opps =3D <&rpmhpd_opp_low_svs>;
> +	};
> +
> +	opp-202000000 {
> +		opp-hz =3D /bits/ 64 <202000000>;
> +		required-opps =3D <&rpmhpd_opp_svs_l1>;
> +	};

[Severity: Medium]
Can these higher frequency OPPs ever be requested? Since the sdhc_1 node
includes the no-1-8-v property, the MMC core is restricted to non-UHS speed=
s.
This appears to make the 100MHz and 202MHz OPP configurations unreachable.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826112456.4829=
82-1-monish.chunara@oss.qualcomm.com?part=3D2
