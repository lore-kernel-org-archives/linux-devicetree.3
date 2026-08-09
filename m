Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1723A16AA
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786267516; cv=none; b=QZE1b6kGTarS2T/hAbK4FaVpk+YIFCYwMDLbzsa4/K57Ru6t0U8ZBvR5kyBpEp+OZwSl8jAGHVvwc1i1lSWkLM8P40io5AjXYlYMdYwsk0YGddIbKCDq3sZWZkxeQODtHqY/w74v7hxHRBP0fqn3jcJhlSEK97qQDxckucP7Da8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786267516; c=relaxed/simple;
	bh=/6yFaJ+l02UxyQsKKM9PKNAds9utzV87zlilbo9YFpk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EUOHJzix2mTl5xvfRCq2LmlcG3oCKwLzO6UX2HJEVQTJSHTSAabNPPGiPWM+JPgEI3VGZZX3HKfAcwa2GExFc1AZWVoYy2Fwk86dE4p0FDcqP/Itw/UkNNEE/W6gIhkcqFs2HHYrPRpelMzxhIdSLXiuCtV4ZMhQFczP7hQr/us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xlnwh7Dy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xlnwh7Dy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0282A1F000E9;
	Sun,  9 Aug 2026 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786267514;
	bh=DHATDPUT9RRIulTdwVp2cwZRCkv6aDzPagosiIn4z5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xlnwh7DyWbQ2oxg17hXVGl9Z6mShT+m+ruqo2ygVefy3jAG9Suv3U912faEBWUXTF
	 Y8eZKcAQukhW9+wQSaJPZRsXKCP8Q3nisHtkbDKz0piFrHPFrGQa84AuOOsDMkd/Ek
	 /BO1Wxyv1iKHc9f45Ntf8FphfBlSXR2LSsnTnJWSYqwo7u5hpRNLTLHgY0DKC9LlTi
	 COCYS+6lgKofKo4yz2YMqWrQF7dLY3CvUfW+V1PKU7mK4g77NqSYsVQIXLQb9sQazF
	 P/PREIMT/cKlZZEDzqfC5AJNDk3BjIU5MQArDWi5uGiQ+RnslXaVE0ni8AwtuSiX+c
	 DNpN1+9Foku2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260809-rzg2-sr-boards-v5-3-19c662358e36@solid-run.com>
References: <20260809-rzg2-sr-boards-v5-0-19c662358e36@solid-run.com>
 <20260809-rzg2-sr-boards-v5-3-19c662358e36@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 09:25:13 +0000
Message-Id: <20260809092514.0282A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Duplicate and conflicting pin configurations for SD0_DATA4..7.
- [Medium] Incorrect regulator voltage definition for 1.2V regulator (confi=
gured as 1.8V).
--

--- Patch [3]: [PATCH v5 3/5] arm64: dts: renesas: add support for solidrun=
 rzg2l som and hb-iiot evb ---
commit a06fa05f228a45d469963a631b35258ab838f598
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb

This commit adds device tree support for the SolidRun RZ/G2L SoM on the
Hummingboard IIoT. The SoM features dual Ethernet, eMMC, DDR, and WiFi/BT.
Overlays are included for eMMC, microSD, and RS485 features that depend on
configurable mux states.

Link: https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-g2l-som/
Link: https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/h=
ummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.d=
tsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
> new file mode 100644
> index 0000000000000..ca5a647d43dcc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
> @@ -0,0 +1,560 @@

[ ... ]

> +	v_1_2: regulator-1-2 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "1v2";
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-min-microvolt =3D <1800000>;
> +	};

[Severity: Medium]
Are the regulator limits set to the intended values here?

The regulator is named v_1_2 in the node name and "1v2" in the regulator-na=
me
property, but the regulator-max-microvolt and regulator-min-microvolt fields
are configured for 1.8V (1800000).

Could this misconfiguration cause issues on boot when downstream drivers
like the USB hub driver query this regulator?

> +
> +	v_3_3: regulator-3-3 {

[ ... ]

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi b/arch/arm64/b=
oot/dts/renesas/rzg2l-sr-som.dtsi
> new file mode 100644
> index 0000000000000..f08d2fbaa5211
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi
> @@ -0,0 +1,461 @@

[ ... ]

> +	sdhi0_4bit_pins: sdhi0-4bit {
> +		sd0_ctrl_dat03 {
> +			pins =3D "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
> +			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
> +			       "SD0_CLK", "SD0_CMD";
> +			power-source =3D <3300>;
> +		};

[Severity: High]
Should SD0_DATA4 through SD0_DATA7 be included in the pins list for=20
sd0_ctrl_dat03?

When sdhi0_4bit_pins is applied during probe, sd0_ctrl_dat03 configures
these pins with power-source =3D <3300>. The sd0_dat47 subnode directly bel=
ow
configures them again with bias-disable and input-enable.

Could the short window between applying these two nodes cause default pull-=
ups
on the 3.3V domain to backdrive the 1.8V eMMC pins?

> +
> +		/*
> +		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
> +		 * with all pins sharing a single voltage domain.
> +		 *
> +		 * Configure as input without pull to avoid overvoltage,
> +		 * and accidental use e.g. as gpio (default pin-function).
> +		 */
> +		sd0_dat47 {
> +			bias-disable;
> +			input-enable;
> +			pins =3D "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
> +			power-source =3D <3300>;
> +		};
> +	};
> +
> +	sdhi0_4bit_uhs_pins: sdhi0-4bit-uhs {
> +		sd0_ctrl_dat03 {
> +			pins =3D "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
> +			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
> +			       "SD0_CLK", "SD0_CMD";
> +			power-source =3D <1800>;
> +		};

[Severity: High]
Does this pin list also incorrectly duplicate SD0_DATA4 through SD0_DATA7?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-rzg2-sr-bo=
ards-v5-0-19c662358e36@solid-run.com?part=3D3
