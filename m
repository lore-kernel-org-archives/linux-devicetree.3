Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB5238C36
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 23:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785970978; cv=none; b=sIXqhz1xRHCjqqnmv6dQK/RWHtZBSa8iMRIhEwyRpsvzbhtEApi5fZbKgYuFywDVBzNNHZDudGue/wEZcP8CPvaGKaZ6cJ7EOfMVeTA3L08/eH58F2EQSztm9idXHS/EJ4Y3tMh1bxY/qOoer6GasEYXN7efRZ7C7uC05ajLhYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785970978; c=relaxed/simple;
	bh=8YrQhZrbUex0bTLdSI4xF+7c9P2EWm44vYMXtXHNxd0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JXWMcOP1TiV05wrW9cNhGqlVFoY52taqDXjlZgMICF0LL9yyTjHS0kZvac4sqMPFbJlB8RkJoA0aZuYj/ZiSHdFkKYbfZtmq6oPbNj4dFTZlmQp+Yz/Ezzxw8Nmg5Zp7/XGKczHE+tboghccyBv6m9muJ8JJMTJ7iULsXDAzOiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GC+16zec; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GC+16zec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AA61F000E9;
	Wed,  5 Aug 2026 23:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785970976;
	bh=GW6PinTeV86Lo9qumCbnlmHZHc11X2eQHIxVjAS93vU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GC+16zecaZSdiLe4f6dcFvPWojbY7LVw+Zxg3RZUSzfMOkPb+GRkV5d6iPcbWuEu6
	 qONE7jbIth8j/NS9DfCB+orfKaKOpkKEfnb4d7z4CuRqN39V+yv0kpM1p9JCVlgZI8
	 Nt4DnEnKkPQpOoBTWi57Kcbp5dAwEZzSE5Ot4x2xs293HevvZaIZPOqX3VoF7Nr0QJ
	 SFyr8keoAYiSwer3o2+SqW7Xb9+VVo3VEvXQX74lhnQFXGk87J8d8He0FUroXbCElN
	 jYFNkjvpx4pDAQUavVyAe6JU0f0qE3BICyzyLj6GgaRTd0SjLOyirubjxoxcc0oQlM
	 CVq+gBEquJwDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: ti: k3-am62: Set MMC clock pins as
 OUTPUT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805225438.464184-4-jm@ti.com>
References: <20260805225438.464184-1-jm@ti.com>
 <20260805225438.464184-4-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 23:02:55 +0000
Message-Id: <20260805230256.41AA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The patch incompletely applies a required hardware fix for AM62x=
 SoCs. While it updates MMC clock pins to PIN_OUTPUT to comply with the AM6=
2x TRM (RXACTIVE =3D 0) on TI evaluation boards and Beagle boards, it misse=
s several third-party AM62x device trees (e.g., Toradex Verdin, PHYTEC phyC=
ORE/phyBOARD, and TQ-Systems). This leaves these boards in violation of the=
 SoC hardware specification, which requires the receiver to be disabled.
--

--- Patch [3]: [PATCH v3 3/4] arm64: dts: ti: k3-am62: Set MMC clock pins a=
s OUTPUT ---
commit 139fe185686919a76207d40e04e2f122da9dca42
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT

This commit updates the device trees for TI evaluation and Beagle boards
to configure MMC clock pins as OUTPUT-only. This complies with the AM62x
TRM requirement to keep the receiver disabled (RXACTIVE =3D 0).

> diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/d=
ts/ti/k3-am62-lp-sk.dts
> index dfd65c00f5b95..7fd508f4eddf1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> @@ -86,7 +86,7 @@ main_mmc0_pins_default: main-mmc0-default-pins {
>  		bootph-all;
>  		pinctrl-single,pins =3D <
>  			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (V3) MMC0_CMD */
> -			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (Y1) MMC0_CLK */
> +			AM62X_IOPAD(0x218, PIN_OUTPUT, 0) /* (Y1) MMC0_CLK */

[Severity: Medium]
This is a pre-existing issue, but this patch seems to miss several third-pa=
rty
AM62x boards that also leave the MMC clock pins incorrectly configured as
PIN_INPUT.

Should these device trees also be updated to comply with the hardware
specification and prevent potential signal integrity issues?

For example, the Toradex Verdin leaves MMC0_CLK configured with PIN_INPUT:

arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi:pinctrl_sdhci0() {
    ...
    AM62X_IOPAD(0x218, PIN_INPUT,        0) /* (AB1) MMC0_CLK  */
    ...
}

The PHYTEC phyCORE and phyBOARD-Lyra boards use PIN_INPUT_PULLDOWN:

arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi:main_mmc0_pins_default() {
    ...
    AM62X_IOPAD(0x218, PIN_INPUT_PULLDOWN, 0) /* (AB1) MMC0_CLK */
    ...
}

arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi:main_mmc1_pins_default()=
 {
    ...
    AM62X_IOPAD(0x234, PIN_INPUT_PULLDOWN, 0) /* (B22) MMC1_CLK */
    ...
}

The TQ-Systems boards also leave them configured with PIN_INPUT:

arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi:main_mmc0_pins() {
    ...
    AM62X_IOPAD(0x218, PIN_INPUT, 0)
    ...
}

arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts:main_mmc1_pins() {
    ...
    AM62X_IOPAD(0x234, PIN_INPUT, 0)
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805225438.4641=
84-1-jm@ti.com?part=3D3
