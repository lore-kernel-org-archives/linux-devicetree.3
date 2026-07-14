Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356A4480960
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040237; cv=none; b=pRMpBGfPcGODRCtS2bZYPu/x2w3FohYHWKgCtDNiigm1Br5wDztUUWVnBxoStswSHqopOmuR0j9MChfy5zIAnV8Ezu/e/DApxhWICXXjtNqir61eePlzVYtJ4dM3fxNDO/hCFVf8Qlhe5s90JfFgkQNKNJlzVoquB/Ui2Hmt2+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040237; c=relaxed/simple;
	bh=/fXYdhYqwznUjrYcbZc1UNzXTvmsHyRQj5DZn50QQRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WDchbeYU4euSJJ9dyhlQ9ojt1BOIpUAEztEwotFlyi02xjWrBwajN7WHV0TboKwuUPXMM5KP9AlNHPd6+s3YpZ2McrDhASJCaLzpKKf0b4NsE72SpTChlvYQTBl7i/QwTZLATj0dZpYwZV1Wl3rXZoACaTPWZeQXppQCFVdSKG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmsJf5gf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmsJf5gf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C64D1F00A3A;
	Tue, 14 Jul 2026 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784040225;
	bh=TYydcPSVJHY+OaLPmflFi/oCDoCvtQK4MezmNva1R6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MmsJf5gfwOcVF11m0pIoRQzDVQF6Ioef4IegC3Zroo9n4WkHDItc09HWyP8JAPyc6
	 VlL1/8q8KoYUBNLra3zRygvsIywMAXVZeIR+1wWDfPHAPvtGSIC5qfs6F65ILC7BZm
	 gGToNBXrv7qMhpmyKYybulioLDicEr0cOrgArjol9eo6c0SPibYbfNbzHJIvT+Mof8
	 NnFBryf4x+U0WWjkmevW4mubAxoSVd7fOjf82rl/7swWiEa9kevgKjPvOVznieWezs
	 E779KqZjsKLy9MZAGmWjWokb3UxKbbmHYb8nUvqCCdodx0umNsF8afqFLRslEmQmut
	 7snpC4gG8FeTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 2/9] dt-bindings: net: lan9645x: add
 LAN9645X switch bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713-dsa_lan9645x_switch_driver_base-v10-2-a4886a08fb15@microchip.com>
References: <20260713-dsa_lan9645x_switch_driver_base-v10-0-a4886a08fb15@microchip.com>
 <20260713-dsa_lan9645x_switch_driver_base-v10-2-a4886a08fb15@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 14:43:45 +0000
Message-Id: <20260714144345.6C64D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] DT binding schema strictly prohibits `mdio` bus nodes, breaking =
the ability to define integrated PHYs.
--

--- Patch [2]: [PATCH net-next v10 2/9] dt-bindings: net: lan9645x: add LAN=
9645X switch bindings ---
commit d0ca8cd625881ac3b8529fd977bdb0c8a0c3b129
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

dt-bindings: net: lan9645x: add LAN9645X switch bindings

Add bindings for LAN9645X switch. We use a fallback compatible for the
smallest SKU microchip,lan96455s-switch.

> diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455=
s-switch.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan9645=
5s-switch.yaml
> new file mode 100644
> index 0000000000000..043fb48922b41
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switc=
h.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - ethernet-ports
> +
> +unevaluatedProperties: false

[Severity: Medium]
Will this schema reject valid hardware descriptions that include an mdio ch=
ild
node for the integrated PHYs?

Since the schema sets unevaluatedProperties: false without defining or
referencing an mdio property, any mdio node defined in a device tree will
be rejected as an illegal property.

> +
> +examples:
> +  - |
> +    ethernet-switch@4000 {
> +        compatible =3D "microchip,lan96459f-switch", "microchip,lan96455=
s-switch";
> +        reg =3D <0x4000 0x244>;
> +
> +        ethernet-ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            ethernet-port@0 {
> +                reg =3D <0>;
> +                phy-mode =3D "gmii";
> +                phy-handle =3D <&cuphy0>;

[Severity: Medium]
Does the schema allow defining the integrated PHY nodes referenced here?

The example demonstrates the necessity of phy-handle pointers to integrated
PHY nodes (such as &cuphy0), yet the schema's constraints make it
structurally impossible to validly define the MDIO bus for those PHYs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-dsa_lan964=
5x_switch_driver_base-v10-0-a4886a08fb15@microchip.com?part=3D2
