Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056F9372058
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 05:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788760514; cv=none; b=fUpd3pRW5mxAj0259fSO1gFVtUOsKsnsZ7pgemxrSWJsdhwm10HgVxwaT27DITlaJev+bZYixUHeO5OaI/eod5YgxI2Fdltn8MBx2Jpemg42F0Mxm2OTDgZmVuMPtwRzHR8RIevBJgDgOc2t4BGOKhqo/dkI6wcSJma2+CFYtzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788760514; c=relaxed/simple;
	bh=G5LOsLzU8NwZodD8f69eI7AYqWWm3Lko0Mvs5n201BQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZgGVwSYXdvw5KDvvXy7W/4J9N7asrRWZO/lcOeLV2kM5LzYM/IKDDNRmCnL8oMmRr8impSigoSNIntuq7bbcxY/kNbAG0+qUcNOYuIY5fkyrOiWJblgaamkDf03f8h1Y031GjlRG6dZ9AAfDLp+4PK7O2+D6wuy0cF5T21OckKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzEixJz8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzEixJz8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443A81F00A3A;
	Mon,  7 Sep 2026 05:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788760512;
	bh=VoD+zTSjj+5lgsAaj7x7riGjPxMWGRVdGYln20YUs5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gzEixJz8mZdzZdN+YA5G+WSa56aGyLDYMkqz3oY3cNjEiH8d3bau++LDfXg0MMIJb
	 xAp8YSFZjvMTwdzRCZaBNuFq1++zYA8jTBwUMYGYxNlkyoE+OkVa+ru91I3N+YgPRk
	 MEsBhaBMfP362Z4g9Hk5GGg4jE9BpLjMClqj1KrumEiuXlHErP5FFq1ivKpB43ZIxT
	 mrea27Apg4WrIdtbp5yPsU0StLxkRzvD+ivpvqLVxovicXbeWWodcUhSn9TijrsPEc
	 4pzM7TJsiojTtUIlBmRhUzG5f4e9/9z8+s4XZmwf8SSIl6aMkhBFoWpZ1uybzzaqq6
	 a5Z2fq1VdUzWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 required vcc-supply property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shashank Maurya" <shashank.maurya@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 05:55:11 +0000
Message-Id: <20260907055512.443A81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Making `vcc-supply` a strictly required property breaks existi=
ng in-tree device trees and ABI compatibility.
--

commit 1cfb28295a002af7450cc6c89daa817a9abfb4b0
Author: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
dt-bindings: regulator: rpi-panel-v2: Add required vcc-supply property

This commit introduces a vcc-supply property to the Raspberry Pi 7"
touchscreen panel V2 regulator binding. It specifies the regulator supplying
power to the panel controller and marks it as a required property.

> diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inc=
h-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/r=
egulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> index 37b9ed371b67d..a6195e53be16b 100644
> --- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touch=
screen-panel-regulator-v2.yaml
> +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touch=
screen-panel-regulator-v2.yaml
[ ... ]
> @@ -43,6 +46,7 @@ required:
>    - gpio-controller
>    - "#gpio-cells"
>    - "#pwm-cells"
> +  - vcc-supply

[Severity: Critical]
Does making this property strictly required introduce regressions for
existing in-tree device trees?

Looking at the current tree,
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi
uses this binding but does not define vcc-supply:

arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi:
	mcu: gpio@45 {
		compatible =3D "raspberrypi,touchscreen-panel-regulator-v2";
		reg =3D <0x45>;
		gpio-controller;
        ...
	};

Since vcc-supply is now unconditionally required, wouldn't builds
incorporating this device tree now fail dtbs_check validation?=20

Could this be made optional to preserve ABI compatibility, or should the
existing device tree nodes be updated in the same patch series to prevent
breakages?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-rpi_reg-v2=
-0-0c59aa60d31f@oss.qualcomm.com?part=3D1
