Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE836430CDC
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212812; cv=none; b=mCDrUzcrTPHlJ2fxTwvKVlLal7R0mRM14vWQw90dcNjxrI9K/F0e/offSFlc/XlPwMpdl3g9b+CFkKUs6FS0OVtSA5HIciKF9y82y3UQcelrLypsADtZ+ltr8YfMBYvkWWw/sdZ2S14JHqNOliQn5RoLmwBz7xQmEIX75F/+ip0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212812; c=relaxed/simple;
	bh=JUEpNH+5Uu7eSAPH+KVXVvB2Xbxhu8HMCHV9R2Ll30I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cl+NXwaKMO7E/vZP2/7XzlR9J32yz3a9YNw8e04R76vNvz1eLGiCu3lWpAOoDuFVs/1q3mGr5eMAFJCY36zAR4RlgFdbm55EJF1rB7w9QQ5iCvAFQBh2OEetPzgi1q/UKU1ATMSW/BmTiOSPt74ZL3I+uWvXfy9y/UWShL2O+5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzE7SPNJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzE7SPNJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC4F1F000E9;
	Thu, 16 Jul 2026 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784212810;
	bh=5Jkqjn3+GRqyMVfokjze3soSiWWNoHE3c+lZ/okXyDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AzE7SPNJWqAyYhA53AkQQThDNd1QdvXe3Vk++/CzfIH9tfciQli1jpI1TMj4lHSWg
	 sgG4ahse3lzTG31HToWG11IXE9/VQYQZgi4h+v/XcBQgEoPu0VTacnZvTvdUKiDLmU
	 4o3JFmwAORSwiF5T6FIzYbX5JlPv5Q0RWLSqr0LE6gDwZtRpHEm3Hi6RD8Jw94hcVI
	 I74o1pUDyZLk5ERcuX7urezN9DRuDIQL++ogRSVxD5bS7dY63HMX6D8omlQW6DkzRu
	 EiVWoTaGAF7aLfOvsiyFwsKirKkKKPg/x7+MxAN59bILkzFql71PjKcyCDkl2m1ZoS
	 bRad7FIk70hWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for
 SD Card via overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260716142445.2767955-3-monish.chunara@oss.qualcomm.com>
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
 <20260716142445.2767955-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 14:40:09 +0000
Message-Id: <20260716144010.1DC4F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Removal of eMMC configuration from base DT without a replacement o=
verlay breaks eMMC users.
- [High] Dummy `vmmc_sdc` regulator fails to control physical hardware powe=
r.
- [Medium] The `no-1-8-v` property contradicts the 1.8V hardware regulator =
and renders added high-speed OPPs unreachable.
- [Low] Board-level overlay improperly overrides SoC-level OPP voltage corn=
ers.
- [Low] Adding a new 202MHz OPP without deleting the existing 200MHz OPP cr=
eates redundant entries.
--

--- Patch [2]: [PATCH V4 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI fo=
r SD Card via overlay ---
commit 999af06615677bf3f3fbc5349952dd6ad0631932
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay

The monaco EVK board supports either eMMC or SD-card, but only one can
be active at a time. Make the base monaco-evk.dtsi storage-agnostic by
removing eMMC-specific configuration from it. Introduce an SD card overlay
that enables the SD Host Controller Interface (SDHCI) for SD-based storage.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
[ ... ]
> +monaco-evk-sd-card-dtbs :=3D monaco-evk.dtb monaco-evk-sd-card.dtbo
> +dtb-$(CONFIG_ARCH_QCOM) +=3D monaco-evk-sd-card.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8216-samsung-fortuna3g.dtb

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dt=
s/qcom/monaco-evk.dts
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
[ ... ]
> -&sdhc_1 {
> -	vmmc-supply =3D <&vreg_l8a>;
> -	vqmmc-supply =3D <&vreg_s2s>;
> -
> -	no-sd;
> -	no-sdio;
> -	non-removable;
> -
> -	status =3D "okay";
> -};

[Severity: High]
The commit message mentions moving media selection to overlays, but only the
SD card overlay is provided. Does this break default eMMC functionality for
users of the base board?

Removing the eMMC configuration from the base device tree without providing=
 a
replacement eMMC overlay leaves eMMC users with no alternative, preventing
the board from booting or functioning correctly if it depends on eMMC.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm6=
4/boot/dts/qcom/monaco-evk-sd-card.dtso
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> @@ -0,0 +1,72 @@
[ ... ]
> +/ {
> +        vmmc_sdc: regulator-mmc-sdc {
> +                compatible =3D "regulator-fixed";
> +
> +                regulator-name =3D "vmmc_sdc";
> +                regulator-min-microvolt =3D <2950000>;
> +                regulator-max-microvolt =3D <2950000>;
> +        };

[Severity: High]
Will this dummy vmmc_sdc regulator fail to control the physical hardware po=
wer
since it lacks a gpio or vin-supply property?

Without physical power control, the SD card might fail to power up or
experience intermittent power loss if the physical shared rail drops during
runtime PM.

> +
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
Could the no-1-8-v property be incorrect here?

It contradicts the 1.8V hardware regulator (vreg_sdc) configured above and
prevents the MMC core from ever utilizing the high-speed UHS-I OPPs defined
in this overlay.

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

[Severity: Low]
Does this improperly override the SoC-level OPP voltage corners from a
board-level overlay?

Operating Performance Points and their required voltage corners are typical=
ly
fundamental properties of the SoC silicon, so modifying them here might be
semantically incorrect and cause instability.

> +
> +	opp-202000000 {
> +		opp-hz =3D /bits/ 64 <202000000>;
> +		required-opps =3D <&rpmhpd_opp_svs_l1>;
> +	};
> +};

[Severity: Low]
When adding the 202MHz OPP, does the existing 200MHz OPP need to be explici=
tly
removed with a /delete-node/ directive?

Leaving it intact could create redundant, overlapping entries for the same
voltage corner when the overlay is parsed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716142445.2767=
955-1-monish.chunara@oss.qualcomm.com?part=3D2
