Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24543ECBC7
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767583; cv=none; b=JtU/g7Jo4Dsm8Fu20seMTtDLs5uneRVN9OpdOL3JIYU9QrCaKEL6hdOWVY5AKChk0L4ZWJr3ekMPiRCil6DRHXbjCNiifWYyKNVGlhjETjSEN+vJVSE4+K4CDmTZI96k1nCAYqnmLWAegvY/W2SASA8DpTfBHTiWPshPzV7jegA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767583; c=relaxed/simple;
	bh=xkB0KaMOSJIZTcwN6Wml97FBHkFYKfjXKHa0qVd215I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uo4RczUQZSOWvLmFrRm09YoMv+LllH57vGnkQs041AKE/PlWatdjcEXRMHqlelgoy+Ht9rEFx7ckLazRzEbgUNe3pxz4tEf9UQ4ezQ+0DFVR3NrqvuhJzEGkS76Btdri9Xe9nXMMDJMQXXfL5ibEHWydNWyBsJ3yyvFq7iv3esk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9N4nXse; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9N4nXse"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACD91F00893;
	Wed, 30 Sep 2026 11:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790767581;
	bh=D4HS1gdR0EQsp7azotM2RpPUhph0m0k2cDvdDSITvmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n9N4nXseTRLKEzQeGzUVSDXS9E9HAmUIfpFmkhl1ZIPtIimKyP60V7zinv1DY87W9
	 F3jDkortbN1HWDmDSCFRRbDrH1NNjlQZaKG7WRJmojagdmyJ752TqFMyPzvm5ToObD
	 VG1Eg6+F6fPSs97SMYdDUwbUQCCb8zC8TJNJZzPb+GfsHF3E0STlZiaodX9oT7CfPQ
	 YEorofX8nCUmnacT/dL7VN0t4GAhF2Ta0/qQz4CEfb8F93ojZAjJpQTmxjoeXdcGrl
	 anXgL2y5NjrFEcEjSm+V0Rny9NfnUR/qksA+Jhd9EmmORi2hImaGtXiEOdCdPUcIBG
	 6cug+XHFxJ+sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930-shikra-dt-changes-v5-3-8eaf658a0e38@oss.qualcomm.com>
References: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
 <20260930-shikra-dt-changes-v5-3-8eaf658a0e38@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 11:26:20 +0000
Message-Id: <20260930112621.1ACD91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/panel: ilitek-ili7807s: unused wled-supply leaves display dark
--

commit 826d42f8e3c3f2865af6f33ebaf53a4c3f08d32f
Author: Arpit Saini <arpit.saini@oss.qualcomm.com>

arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQM EVK boa=
rd
and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5 to 1.232V wi=
th
regulator-allow-set-load for DSI PHY PLL stability.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqm-evk.dts
> index 6ad90df3b4156..c426691644573 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
[ ... ]
> @@ -23,6 +23,86 @@ aliases {
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
[ ... ]
> +	vreg_wled: regulator-wled {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vreg_wled";
> +		gpio =3D <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
[ ... ]
> +	panel@0 {
> +		compatible =3D "dlc,dlc0697", "ilitek,ili7807s";
> +		reg =3D <0>;
> +
> +		reset-gpios =3D <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +		vddi-supply =3D <&pm4125_l15>;
> +		avdd-supply =3D <&vreg_disp_p>;
> +		avee-supply =3D <&vreg_disp_n>;
> +		wled-supply =3D <&vreg_wled>;

[Severity: High]
Will the display backlight remain unpowered here?

Looking at the driver for this panel in
drivers/gpu/drm/panel/panel-ilitek-ili7807s.c:ili7807s_supplies:

static const struct regulator_bulk_data ili7807s_supplies[] =3D {
	{ .supply =3D "vddi" },
	{ .supply =3D "avdd" },
	{ .supply =3D "avee" },
};

The driver only requests the vddi, avdd, and avee supplies during device
initialization. It does not parse or request the wled-supply assigned to it.

Because vreg_wled is not configured as regulator-always-on and no active
driver requests it, the regulator framework will never drive GPIO 91 high to
enable the WLED power supply.

While the driver registers a DCS backlight that sends MIPI DCS commands to =
set
brightness, the actual backlight LED circuitry requires power from vreg_wle=
d.

Without the driver enabling this regulator, will the display backlight
remain unpowered on boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-shikra-dt-=
changes-v5-0-8eaf658a0e38@oss.qualcomm.com?part=3D3
