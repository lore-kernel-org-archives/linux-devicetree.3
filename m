Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A644502F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275976; cv=none; b=pCfD6ozI8dNMcPImoAM2Gt1ccf4j86TZQIqoKkykIJTssy2BZPGipDrx/lowel4ta0zy2t6kzfisAARgUhZ99nKOSJ/V1+bWmr/RHAkkRuaMLhZ/d872+dP2bnYaLX9WxDjseLDiDMYp5stk0ikpCP5zhnwgraCdrK/wTGJltl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275976; c=relaxed/simple;
	bh=4lUUZe4nKVvRQ9PIMtEXXkYFrpQUxLm0TYRlrE77RPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mu4xv9AXKNdcER9TpSF9XGwehspni6bQ+KcBtp6/XboWgaWhyEP/ZYyMvq8fNDsl1nK1oK0QKniZo21DVydRr7r74EmY9a7UssLbXD4nKaqEr9M50HTpQ6QV2S3Bo+HTvQWnXazZnxsi3ycc8p8XnFgzDR1zPCwqBcXNgqO594U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IChMFvYe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IChMFvYe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60491C2BCB0;
	Fri,  8 May 2026 21:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778275975;
	bh=4lUUZe4nKVvRQ9PIMtEXXkYFrpQUxLm0TYRlrE77RPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IChMFvYexcJjQZVXrgwnKbkuGV3CN2HbFT0fglNM9ZUh/PAyu0r78aiVF1M+UQA4u
	 ajBQaythc8R6m/aiQsFkeW1BwUigEiop3l/j36TtHhylAg/cpaT6PNQ3b82xPs20Kt
	 S7wUnTBUd5BvdqqR6Dw3xx9Jz73BpMxZlo0JiU9+tgIBuytp+5bUWPMAsUN2FPfBfY
	 BdrGmcpKeNxxKwHRO5noKAmpbrRx8tjAIOnJPtQb0QX5m/h65IHlXyIi5psDxaZH1g
	 JA3IICPPzdQBeHPda5yAWTjlYREB2bECvBCy01tj3D7/vv5mP0cpW4s46AkkBZJcPl
	 UY487m0zHkDCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] [v5 net-next] dt-bindings: net: add
 st,stlc4560/p54spi binding
Reply-To: sashiko@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260507212451.3333185-2-arnd@kernel.org>
References: <20260507212451.3333185-2-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 21:32:54 +0000
Message-Id: <20260508213255.60491C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Typo in the binding description: 'STLC5460' is used instead of 'STL=
C4560'.
- [Low] The `interrupts-extended` and `powerdown-gpios` specifiers in the e=
xample lack standard secondary cells (flags/triggers).
--

commit b803e7cb976e6f9f5ea1b9d2c76cdffbb8fe0d67
Author: Arnd Bergmann <arnd@arndb.de>

dt-bindings: net: add st,stlc4560/p54spi binding

This commit adds a device tree binding for the SPI version of the Prism54
wireless device. It documents the known names of this device and the
properties sufficient for its use.

Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gmai=
l.com/

> diff --git a/Documentation/devicetree/bindings/net/wireless/st,stlc4560.y=
aml b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
> new file mode 100644
> index 0000000000000..a32265c07350d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/wireless/st,stlc4560.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ST/Intersil/Conexant stlc45xx/p54spi/cx3110x SPI wireless device
> +
> +maintainers:
> +  - Christian Lamparter <chunkeey@gmail.com>
> +
> +description:
> +  The SPI variant of the Intersil Prism54 wireless device was sold
> +  under a variety of names, including Conexant CX3110x and
> +  ST Microelectronics STLC5460.

This isn't a bug, but there's a typo in the description (STLC5460 instead
of STLC4560).

[ ... ]

> +examples:
> +  - |
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        wifi@0 {
> +            compatible =3D "st,stlc4560";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <48000000>;
> +            interrupts-extended =3D <&gpio 23>;
> +            powerdown-gpios =3D <&gpio 1>;

Do these specifiers need standard secondary cells for flags and triggers?

Real-world GPIO controllers typically require #gpio-cells =3D <2> or
#interrupt-cells =3D <2> to specify trigger types and active levels. While
dt_binding_check accepts this since the phandle cell sizes are unknown,
copying this example into a real device tree will result in a compilation
error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507212451.3333=
185-1-arnd@kernel.org?part=3D1
