Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52299368D5A
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 05:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909040; cv=none; b=crm0rABvYmPXBd56qCF3r9NShI+DDVKZBfii1CHdk5BDznaIwZ74UtN8gdxZW2HU0hFMuBEbXXwhQ/2Q6agoaWQIQefF6ZVr+VMl+7LFneYeApiENRVaA7iGSWOL+WPYpBTwh1CwST0HPbByD9+1V0ULnNF5CmhpI1YYek2NXJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909040; c=relaxed/simple;
	bh=7HtF3jAtPiA4SwIfarMgTI3wIb9ZXnhoRKnQA8wOH+s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VwwZM6sdBIuBmmMX2xFFyX0GnXRAZTyp4N8os9KYu9sgJVNX8WqAMTnxKUg/iMdacVeHqSsRR/1QIQitVRw4EJYRginOeKVlhqO8kmUM/5dlVEQNx1r0rtp/ILgJryhs7IZUZdIMLe6COMLjDd0XtxTvSiVYbb7ODHUxrFerCZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNcQtqn0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNcQtqn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DBF1F000E9;
	Wed,  5 Aug 2026 05:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785909039;
	bh=M0eKJIbi1CHqx6pU6Xhexohf01aafz/7XVAfYzI5qvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RNcQtqn0tUzH3leOArdRkVc518+HYpHeRuXkshB665H+QVoRlcpSifdta/NJQ+XFq
	 Tq4k2RKElBxzscVvKXXBn152xBbix8gsBK1NeZBuhO+7wJ4K9a9GWs+bRn5bcm0wFS
	 0SJ46aKK6UvuTiHiZRP13Dxti7I2dFDsUdDseivZOhKxuOEsR1qv3Ow51sXDK30xbx
	 t9lsNTRiOQUqjq8j1JhaTonHcyngKrdV948o+Rgow+Ae5fRKzQfXRiTpZvAOE0Rm6+
	 88YUYAncgPLblh5Y+3iVCjuuVinIEoNEoa75X/oklTRwseOS+4N8rpJLplmVrUOFNQ
	 ACS33JZl67C+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-ti-ads112c04-driver-v3-1-49f436829e01@gmail.com>
References: <20260805-ti-ads112c04-driver-v3-0-49f436829e01@gmail.com>
 <20260805-ti-ads112c04-driver-v3-1-49f436829e01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 05:50:37 +0000
Message-Id: <20260805055038.E9DBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Custom devicetree properties lack required vendor prefixes, missing=
 explicit type definitions, and misuse array validation syntax for scalar v=
alues.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: iio: adc: ti,ads112c04: Add bind=
ing for ADS112C04 ---
commit 3134bea94c0e8c33141972ee2792aabe8a1104e9
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

dt-bindings: iio: adc: ti,ads112c04: Add binding for ADS112C04

Add device tree binding documentation for Texas Instruments ADS112C04
I2C Analog-to-Digital Converters. The binding uses child nodes to
dynamically define the connected single-ended or differential channels.

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml =
b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> new file mode 100644
> index 0000000000000..ff079bb5b3dd9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml

[ ... ]

> +patternProperties:
> +  "^channel@[0-9a-b]$":
> +    $ref: adc.yaml
> +    unevaluatedProperties: false
> +    properties:

[ ... ]

> +      excitation-channels:
> +        maxItems: 2
> +        items:
> +          maximum: 3
> +
> +      excitation-current-nanoamp:
> +        maxItems: 2
> +        items:
> +          enum: [10000, 50000, 100000, 250000, 500000, 1000000, 1500000]
> +
> +      burn-out-current-nanoamp:
> +        items:
> +          - enum: [10000]
> +
> +      reference-sources:
> +        items:
> +          - enum: [internal-2.048v, external, avdd]
> +            default: internal-2.048v

[Severity: Low]
Should these custom device-specific properties (excitation-channels,
excitation-current-nanoamp, burn-out-current-nanoamp, and reference-sources)
have a "ti," vendor prefix to avoid polluting the global namespace?

Also, burn-out-current-nanoamp and reference-sources appear to incorrectly =
use
YAML array tuple validation syntax instead of simple scalar schemas. Does
reference-sources also need an explicit type definition to prevent
dt_binding_check failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ti-ads112c=
04-driver-v3-0-49f436829e01@gmail.com?part=3D1
