Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477BE1D5CFE
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 01:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891688; cv=none; b=XB5J+rjS9KU9bBDkL6or68Ea708U52K6fPcR3MozVjTaE8T/2LqVmAN79ZJMzHWiIGdLAGVUEU0VCSLT8KB46004Fvfr5qWQ+P9d1qI0rrdrkzNyV2wvd2Tej99mudJY6cYv+/RNjF2JnayNHzIGwnade7I69Hnt6ahyR3eB5wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891688; c=relaxed/simple;
	bh=rlviHkRw5CgnjufewnJNYO0yRFcYp5WmI8JSw4Rc+y8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nJ2VAToBocFnFx1r+4Vhk7sDwOijQskW8XMVAvF0fPcx1buRgITSySMCcBIAKWZJk9dXh4wy+R9+M3A3R+EMVYLG37Y5iu9TNEs3XTAzs8SGeRRm+6zQLlXcw29Rx/DiZqOboNpNvzIGBXFNSUQyLsDVStwk8q0Xs8iYvUamscA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apNH9VB+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apNH9VB+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4B61F00A3D;
	Wed,  5 Aug 2026 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785891686;
	bh=KThzRaLFx0LnlaDsQ6IhilbY/k0wCsnP/Z3j/4OjA4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=apNH9VB+hY+YA88fqkOPi9JvTenw2ogBMF6hgDOD2GrEAcgG/KVgszTmGmBRcWous
	 qo0ac58gv64fYySHHTdk9KkVvfLfXhE+CXNM21aXpF8FH+meDkFsCBM0B36Mq6l4Et
	 qb4q8uwVvaPZpIXEjb4z78pTz0gJwzaNk0RZgsFhGB3iBTSSs1UCqf9iU6HFQQeAPI
	 uCSHWsJHb1ousEriWHmfZMxLB/EnvT2AWjSzmz8YXLSg8r/HQwSWsC+cjIFmXGbpcm
	 Pvh88p19a4llan+4MsNgH2O77assmK4QVfCr/TNxpXGJxcdGZxOgQV898UlTVBIwp/
	 p3RD9sGT4VgVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-am62a: Set MMC clock pins as
 OUTPUT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805004821.416613-4-jm@ti.com>
References: <20260805004821.416613-1-jm@ti.com>
 <20260805004821.416613-4-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 01:01:25 +0000
Message-Id: <20260805010126.4B4B61F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The commit updates MMC clock pins to OUTPUT to comply with the A=
M62A TRM requirement (RXACTIVE=3D0), but only applies the fix to the SK boa=
rd, missing other AM62A-based boards (such as the PHYTEC boards) which stil=
l incorrectly configure the MMC clock pins as inputs.
--

--- Patch [3]: [PATCH v2 3/4] arm64: dts: ti: k3-am62a: Set MMC clock pins =
as OUTPUT ---
commit a6bfe2ecc4d051fbfd71859f6e530c852974e23c
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: k3-am62a: Set MMC clock pins as OUTPUT

This commit updates the MMC clock pins on the AM62A SK board to be configur=
ed
as OUTPUT-only. This complies with the AM62A TRM requirement to have the
receiver disabled (RXACTIVE =3D 0) for these pins.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dt=
s/ti/k3-am62a7-sk.dts
> index 826fff38cfb77..9b120cd9b0c37 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -324,7 +324,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPM=
C0_CSn3.I2C2_SDA */
>  	main_mmc0_pins_default: main-mmc0-default-pins {
>  		pinctrl-single,pins =3D <
>  			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
> -			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
> +			AM62AX_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */

[Severity: Medium]
This is a pre-existing issue, but while this commit fixes the SK board, oth=
er
AM62A-based boards (such as the PHYTEC boards) still incorrectly configure =
the
MMC clock pins as inputs.

For example, in arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:
main_mmc0_pins_default():

    AM62AX_IOPAD(0x218, PIN_INPUT_PULLDOWN, 0) /* (AB7) MMC0_CLK */

And in arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi:
main_mmc1_pins_default():

    AM62X_IOPAD(0x234, PIN_INPUT_PULLDOWN, 0) /* (B22) MMC1_CLK */

This leaves the receiver enabled (RXACTIVE=3D1) in violation of the AM62A T=
RM.

Should these other boards also be updated to comply with the TRM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805004821.4166=
13-1-jm@ti.com?part=3D3
