Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A2D36E49B
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929755; cv=none; b=QNGYbWwiP2mtv2OAGcBXRw4KE3n8SmeAAErWTwCUsChcnX2TSd5BCee6yIp84lG4dGht5h6NfFY95ZrU3CFjU+j9xZ56ykigepnANHFH67cTJ4roavMyiijV/FQYPAqYvHwt69+N0HcSY6XT3dvqXj7HaJjFn2HZd1tOp2QWd3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929755; c=relaxed/simple;
	bh=x5uBV/vJ+x34n9hWg7WJS8tY+2cZbHuT14Qi5sczOcI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uiG46tckB/RhryGf84Rb0n6exragiK/frYEoFpjkP5sYLYMW151wROakSxKkiBnn9Rn1HC6TYk6JSl5DBS5pwtIhrFfSnVu/uq84hfL7bQttEUtKJE9xfAOSYqdj+WKClXVGzqEkC0y5ODnt++QrMwngdyxShhPOfanX3Qgbgu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUBz6jss; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUBz6jss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43F11F000E9;
	Fri, 28 Aug 2026 15:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787929753;
	bh=tczmfbB9kc41nLjCZMeQfz6zhgq4l5jWdLJyoiPsQP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PUBz6jssuTzXuvztEfv/nRo68mVkhYaQ8GbZJGiyeRZRAoUdfD07HY689f8Oi9LB/
	 oPSmXeTejzqzm8k6JttsEQR+ftCXkC7FI18Su7YYFp6jMZpYno8lbQFAcHosX/cyWO
	 /zy7e9xt6UB5zUgm/TFogM3uaJ6dwJhtS8HAMctlam2eOevJo/2S/9VpTJLfv5q6jG
	 8Fv5hueeRPds264N+pQN/x1FhwfKEFFP0mWha2fALCE/YboGNjZGBOC7vTG7lxCF61
	 L+1i+OpczDvwvjHa69Bwwoc1aYpuPqpLFncHK4NRbowOheFn9QpsPUoiehBOuP3I8l
	 AmNrh0BTQVZ+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: generic-ohci: Document ST
 STM32MP1 SoC compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260828150202.173109-1-marex@nabladev.com>
References: <20260828150202.173109-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:09:13 +0000
Message-Id: <20260828150913.A43F11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete binding family update: missing STM32MP1 EHCI compatib=
les.
--

commit b94b8c4a5c06e677f1c40f017de92bb5e2ec3002
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: usb: generic-ohci: Document ST STM32MP1 SoC compatibles

This commit documents the SoC-specific compatibles for the ST STM32MP13xx
and STM32MP15xx series in the generic-ohci binding. This allows the SoC
DTSI to use these more accurate compatibles instead of just the generic
fallback.

> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ohci.yaml
> index d42f448fa2044..1b54f0d91061f 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> @@ -49,6 +49,8 @@ properties:
>                - ingenic,jz4740-ohci
>                - rockchip,rk3588-ohci
>                - snps,hsdk-v1.0-ohci
> +              - st,stm32mp13-ohci
> +              - st,stm32mp15-ohci

[Severity: Medium]
Since st,stm32mp13-ohci and st,stm32mp15-ohci are being added here, should
the companion EHCI compatibles (st,stm32mp13-ehci and st,stm32mp15-ehci)
also be added to the compatible block in
Documentation/devicetree/bindings/usb/generic-ehci.yaml?

The device tree bindings subsystem guidelines state that when a binding
has multiple YAML files for different device types in the same family,
related files need matching updates. Updating generic-ehci.yaml would
ensure the EHCI companion controller is documented alongside its OHCI
counterpart, keeping the entire USB host subsystem on STM32MP1 fully
documented and future-proofed.

>            - const: generic-ohci
>        - enum:
>            - generic-ohci

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828150202.1731=
09-1-marex@nabladev.com?part=3D1
