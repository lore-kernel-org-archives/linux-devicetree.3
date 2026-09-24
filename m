Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4144A1E1F
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264320; cv=none; b=GiaiCZBAfADbqlRA50AMVeWdvCHIebry3BTcxNm+u+g3WEvueUkDDlOZu87oZqNFRAoj5MOV3AVQD4o540/8DMIp8UiR890IaV9x4dJnopxob42SVJXezzRNLoVFVGMIM6Fw78tBtY5IK3U9OFjo/SAV9jmbmVdmA/noGc6iMp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264320; c=relaxed/simple;
	bh=JLv8xORRFn3wBml36klMSL6auRXxsMoAHAh7CmRy37c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZM/WOvij1OSqLHOdGHJsjdpTZf6WNNChe5JGTdD0nPvphgAHBhQ+0JsSiseaohbv0Bdeygt5ypOUUbeZPwi1GPZI08L4Mknpst43/8bgBICrpDFDvmzM24G/HHAWGqtmempHA5ygh/KXbNFpH2MCwPO4pRPSA2X/tL6+43MGWmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwuG9Uzy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwuG9Uzy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED921F000FF;
	Thu, 24 Sep 2026 15:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790264318;
	bh=xmJwduI2RTPgeO+JKa6kdLpbaxU9Sdh4XBV69SkQjDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iwuG9UzySBZNdDLoJNCEiqUoRej74qr8+hC/NtK2dk2lCAojbty9ksTGxYiH3wasH
	 g0AqWZzj2V3qjoORQsL9OxV7Uyl8Zjcp9phabvxx/90qJeZfimuFMdYy9T1GBMf1Os
	 TNtfseVPd4YLsJyNK9Nh3suhushxM/Be6zkSlRixEBDlAmjyTE4MmdvFCtZRB8bJZJ
	 8xAOtYI5NDzpai4BWgmm63gbgEagIOpu/63tszzICFuYSG2Lt6YvWocQ9fC103SC/p
	 eMnsdTmm7/B+/lvB2KlXsweDvyL4rk7hABypVil9nAb0GZn8OOOiLGP/UaHkel2EHv
	 kKGUbz5Q/ZytQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] arm: dts: sunplus: add PWM, watchdog and MMC
 nodes to SP7021 DTSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gaylard" <ag@ffroot.co.za>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924152844.81705-4-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
 <20260924152844.81705-4-ag@ffroot.co.za>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 15:38:37 +0000
Message-Id: <20260924153838.5ED921F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt: silent removal of pinmux configurations
--

commit 4012754092cc91a0278f9cbf36a5d355b0fbbf57
Author: Andrew Gaylard <ag@ffroot.co.za>

arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI

Add device nodes for the peripherals that have upstream drivers,
including PWM, watchdog, and eMMC controllers. Move the memory node
from the DTS into the DTSI since the RAM is integrated.

> diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi b/arch/arm/boo=
t/dts/sunplus/sunplus-sp7021.dtsi
> index ae9bbe0320b8d..9963501b6a41e 100644
> --- a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
> +++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi

[ ... ]

> @@ -84,50 +89,10 @@ pctl: pinctrl@100 {
>  			clocks =3D <&clkc CLK_GPIO>;
>  			resets =3D <&rstc RST_GPIO>;
> =20
> -			emac_pins: pinmux-emac-pins {
> -				sunplus,pins =3D <
> -					SPPCTL_IOPAD(49,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_CLK_OUT,0)

[Severity: Medium]
Is it intentional to silently drop the pinmux configurations for emac_pins,
emmc_pins, and sdcard_pins here?

There does not appear to be an explanation for this removal in the commit
message. While a follow-up patch ("arm: dts: sunplus: add Tibbo LTPP3G2
board") re-introduces the emmc_pins configuration in the board-specific
file, the emac_pins and sdcard_pins configurations are permanently deleted
without explanation.=20

Could the commit message be updated to mention these SoC-level DT
configuration removals?

> -					SPPCTL_IOPAD(44,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_MAC_SMI_MDC,0)
> -					SPPCTL_IOPAD(43,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_MAC_SMI_MDIO,0)
> -					SPPCTL_IOPAD(52,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXEN,0)
> -					SPPCTL_IOPAD(50,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXD0,0)
> -					SPPCTL_IOPAD(51,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXD1,0)
> -					SPPCTL_IOPAD(46,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_CRSDV,0)
> -					SPPCTL_IOPAD(47,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXD0,0)
> -					SPPCTL_IOPAD(48,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXD1,0)
> -					SPPCTL_IOPAD(45,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXER,0)
> -					SPPCTL_IOPAD(59,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXEN,0)
> -					SPPCTL_IOPAD(57,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXD0,0)
> -					SPPCTL_IOPAD(58,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXD1,0)
> -					SPPCTL_IOPAD(54,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_CRSDV,0)
> -					SPPCTL_IOPAD(55,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXD0,0)
> -					SPPCTL_IOPAD(56,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXD1,0)
> -					SPPCTL_IOPAD(53,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXER,0)
> -				>;
> -				sunplus,zerofunc =3D <
> -					MUXF_L2SW_LED_FLASH0
> -					MUXF_L2SW_LED_FLASH1
> -					MUXF_L2SW_LED_ON0
> -					MUXF_L2SW_LED_ON1
> -					MUXF_DAISY_MODE
> -				>;
> -			};
> -
> -			emmc_pins: pinmux-emmc-pins {
> -				function =3D "CARD0_EMMC";
> -				groups =3D "CARD0_EMMC";
> -			};
> -
>  			leds_pins: pinmux-leds-pins {
>  				sunplus,pins =3D < SPPCTL_IOPAD(0,SPPCTL_PCTL_G_GPIO,0,SPPCTL_PCTL_L=
_OUT) >;
>  			};
> =20
> -			sdcard_pins: pinmux-sdcard-pins {
> -				function =3D "SD_CARD";
> -				groups =3D "SD_CARD";
> -				sunplus,pins =3D < SPPCTL_IOPAD(91, SPPCTL_PCTL_G_GPIO, 0, 0) >;
> -			};
> -

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924152844.8170=
5-1-ag@ffroot.co.za?part=3D3
