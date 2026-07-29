Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAEA3859C2
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785355689; cv=none; b=QV9gCKztxNH+j2ZU6J5FExxiDsRycU88BYW5gvZsPBxDnT4F/3FcALQX4CRwsLUQvLXCNNRSanAp8YAppdDKZpCHgYD09hPZ/O1u2nxl8qD8/y76rOsx0hNsvJDj+9k9ShLUchliQLV0nxVXjjtwAkgyjh/vP4fgf6PQ9PqQ9DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785355689; c=relaxed/simple;
	bh=mu+k0cScOfg9KpSjqvXC63I0QuyF76rYwLYMB52b+6g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M8Q7BrwI0gJPuqMzktDRkntydTD51reokinwVUSJUsYsAeyc5gUMLeyRrMm9gZ7BRNqEJb/2iHGjjfXdeKGm5TMoX9bzE8QAi6af7HdWEy6ddZwLGLZ6HRTgKESUkbwiSozGBXGFd/GripE4+tqHLsaOOT8Nx/2TeadWP5EE7SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYnMe/fF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYnMe/fF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B3D1F000E9;
	Wed, 29 Jul 2026 20:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785355687;
	bh=qwyemSvoSeGIGQ1GLeT+hInpUA8d7Gf2Fp37ytmqueE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bYnMe/fFW2TRSk4mReseMvO6A+MvH3ifVTxKT4/eFpurYm+/LoYQqddY5TK10/fIA
	 eQPRhUM187OmfeRqYO3St1Kq128oOolWCTJbJt1JahD1kvfsCHyBzF2G4ibtxgkQT7
	 dN8zJmkEQLStmgl7QjG3Mjfb5+/G02hVieH2GMwQ+2TPGNTSfu+NIbARHLRb4Ryenx
	 LYJWdgHqBYw/h/Ah/9kWbh9eyOBis5rtAvWK4WNi2UibBFeqkuH2FQhHapSkhYCMy7
	 j0IQdJaSB9atD3xo1vkNQseaFDu8lsk9jZcLKs61xgzIJFHJV9oZl1JhIWprR+5D9H
	 XOKinG5JyCVOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] arm64: dts: ti: k3-am62: Set MMC clock pins as
 OUTPUT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729195958.671147-4-jm@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
 <20260729195958.671147-4-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 20:08:07 +0000
Message-Id: <20260729200807.98B3D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the commit fails=
 to apply the necessary AM62x SoC hardware constraint to several third-part=
y device trees. While it correctly updates the TI SK and Beagle boards' MMC=
 clock pins to `PIN_OUTPUT` to disable the receiver per the TRM (SPRUIV7), =
boards like the Toradex Verdin, PHYTEC phyCORE, TQ, and Variscite AM62x SOM=
s still incorrectly define MMC0/1/2 clock pins as `PIN_INPUT` or `PIN_INPUT=
_PULLDOWN`. As this is an underlying SoC requirement, all boards integratin=
g the AM62x SoC must implement the correct pad configuration.
--

--- Patch [3]: [PATCH 3/8] arm64: dts: ti: k3-am62: Set MMC clock pins as O=
UTPUT ---
commit 7601627985b20fa80186e314fd493c2b9a330fe1
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT

This commit updates the MMC clock pin configuration on various AM62x boards=
 to
use PIN_OUTPUT. This matches the TRM requirement to disable the receiver for
these pins.

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

[Severity: High]
This isn't a bug introduced by this patch, but while this updates the TI SK=
 and
Beagle boards to use PIN_OUTPUT for MMC clock pins, it looks like several
third-party AM62x boards still define these pins as PIN_INPUT or
PIN_INPUT_PULLDOWN.

For example:

arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi:pinctrl_sdhci0()
    AM62X_IOPAD(0x218, PIN_INPUT,        0) /* (AB1) MMC0_CLK  */

arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi:main_mmc0_pins_default()
    AM62X_IOPAD(0x218, PIN_INPUT_PULLDOWN, 0) /* (AB1) MMC0_CLK */

arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi:main_mmc1_pins_default()
    AM62X_IOPAD(0x234, PIN_INPUT_PULLDOWN, 0) /* (B22) MMC1_CLK */

arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:main_mmc0_pins_default()
    AM62AX_IOPAD(0x218, PIN_INPUT_PULLDOWN, 0) /* (AB7) MMC0_CLK */

arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi:main_mmc0_pins()
    AM62X_IOPAD(0x218, PIN_INPUT, 0)

Since this is an underlying AM62x SoC hardware requirement from the TRM, sh=
ould
these other device trees also be updated to prevent potential signal integr=
ity
issues and intermittent SD/eMMC I/O failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729195958.6711=
47-1-jm@ti.com?part=3D3
