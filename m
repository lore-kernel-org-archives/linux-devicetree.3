Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7D3403EB9
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409071; cv=none; b=qATBXEP6wkoe3B/Ks9n8rF8CtoGsMN80RaEREo+JxiMCzVHW5nVuh6AMzTd5lrbMk8cN1EjF8Ky1i+fNYOyWaIrgkCBq8dakhNVbhgd2gtKXmyPR3pMwM09UAegoGYN3QClkIOGNtXzk1ynu+1vEvpip+3o2chePBec5UTkrZ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409071; c=relaxed/simple;
	bh=Et0MYsLF5el2hWETaePn5JkolcyqJFrf+bUJ5sz/XWc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YBeLFgqT8xeyezMYplQN5a3ShkTe1SZuq6dmWuDyVwjwMa2ePxViazY+D+FVF67TVt1e1pYbc7oDaWZqHktrDslXSjdxJBfUibITMtWTTKHp0z39eMZHMuLZ8RBCJLfsTEO2wPjv0b9i5Z9FWV7XO1MQHK/lI/F99wbDw1ZwRWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXom8PEr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXom8PEr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACFB1F000E9;
	Thu, 30 Jul 2026 10:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785409069;
	bh=CGLTH8mLSMmzXrI3yoJvMERWFLuy10MQLMjg4nlctmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XXom8PErtyXu7adJIbant5z3YlPAkJBpc8mJg2fL6IzAkihCFwvpDZB1R6GWI7DDq
	 T2KfdPIjK1eINbJrKzW+EC8DflHYkVlWk/I7cRJuO0HdiJpqubrSgQc2yGdfJgLkFq
	 iKO3M1RjY2PapcBm6ndh6Ya2oq3BdBy5Zq6u3KwJl69PGtjDcoLq5oca3Q+xXq0Rvj
	 4sNFa9P044dkXIUsVBVC6IdSuN6EpD8IUd4itTO02OOS8b9W5f2wcdS6/TglpzNdUH
	 +Hfn8r6ewPmGoSTPhZLHh6xIoLpZVuKglJu+vT2dyg28kuu9k5kNzvLxsuiIipAXKM
	 RwK+/zcqSPV0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260730-rzg2-sr-boards-v4-3-08bc459578dc@solid-run.com>
References: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
 <20260730-rzg2-sr-boards-v4-3-08bc459578dc@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:57:48 +0000
Message-Id: <20260730105749.5ACFB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Applying the microSD overlay causes a 3.3V overvoltage on the eMMC=
's 1.8V domain pins.
- [Medium] Misplaced `dr_mode` property in USB PHY nodes.
--

--- Patch [3]: [PATCH v4 3/5] arm64: dts: renesas: add support for solidrun=
 rzg2l som and hb-iiot evb ---
commit 7f057d700942e2cb41ff7819702c96b1aa651144
Author: Josua Mayer <josua@solid-run.com>
arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb

Add support for the SolidRun RZ/G2L SoM on Hummingboard IIoT. The SoM
features Ethernet, eMMC, DDR, WiFi/Bluetooth, and SDHI Mux.

Link: https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-g2l-som/
Link: https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/h=
ummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.d=
tsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
[ ... ]
> +&usb2_phy0 {
> +	dr_mode =3D "host";
> +	vbus-supply =3D <&vbus1>;
> +};
> +
> +&usb2_phy1 {
> +	dr_mode =3D "host";
> +};

[Severity: Medium]
Does setting dr_mode directly on the PHY nodes work as intended here?

The phy-rcar-gen3-usb2.c driver calls of_usb_get_dr_mode_by_phy() to extract
this property, which iterates over the PHY's consumers (the controller node=
s).

Because dr_mode is placed on the PHY node instead of the consumer controller
nodes, it appears it will return USB_DR_MODE_UNKNOWN, skipping OTG
initialization. Should this property be moved to the appropriate controller
nodes?

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-microsd.=
dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-microsd.dtso
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-microsd.dtso
[ ... ]
> +&sdhi0 {
> +	bus-width =3D <4>;
> +	full-pwr-cycle;
> +	mux-states =3D <&sdhi0_mux 1>;
> +	pinctrl-0 =3D <&sdhi0_pins>, <&sdhi0_cd_pins>;
> +	pinctrl-1 =3D <&sdhi0_uhs_pins>, <&sdhi0_cd_pins>;

[Severity: High]
Could applying the sdhi0_pins group here cause a 3.3V overvoltage on the
eMMC's 1.8V pins?

The hardware mux sdhi0_mux only switches SD0_DATA0 through SD0_DATA3,
SD0_CMD, and SD0_CLK. This leaves SD0_DATA4 through SD0_DATA7 permanently
connected to the eMMC, which operates on a fixed 1.8V domain.

However, sdhi0_pins configures all 8 pins (including SD0_DATA4 through
SD0_DATA7) with power-source =3D <3300>:

arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi:
    sdhi0_pins: sdhi0 {
        pins =3D "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
               "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
               "SD0_CLK", "SD0_CMD";
        power-source =3D <3300>;
    };

When this microSD overlay is loaded and the controller operates at 3.3V, do=
es
this apply 3.3V to the 1.8V eMMC pins? Should there be a dedicated 4-bit
pinctrl group for microSD mode that excludes DAT4-7?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-rzg2-sr-bo=
ards-v4-0-08bc459578dc@solid-run.com?part=3D3
