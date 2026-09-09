Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA87550DB2
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965326; cv=none; b=KtAz/bT+zjUfHY14UeZlwAXUWkQalyzhqh0THi9FlitXrelDiYJoxAt3XXxIWNQW9skCRNQUPxHlG+uaDbJrhQuMvBzuZkgFmBgHm7jeitZc79aJ5VgPLfQl1ykvpWriZZU3+i7t+bsoWG8BcuObscPGpPDFPqe2OCZb5SGgoPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965326; c=relaxed/simple;
	bh=H6XpTZEhuwiqgBuVrKWFXxy5i7C5zJO+iIV8jIHBl9Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nLxRAtnVuckoWSAoPqqz0R01YppmzTVPbfpPnGSVRPvSe5m+j0J1CskeJ0kHXCaYLQzy68hsJgDUdIMv4V4NdIkFqo3VgXR2jDyXIKpI28LqhYLR9TZ3dQvNrgDp/EUGl/WXcPmIJYWpA7tW1xevdJ4Sf43h6abp9biCFa2JzI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frJEUHcH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frJEUHcH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C961F00A3A;
	Wed,  9 Sep 2026 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788965324;
	bh=Vmv9s/Q4SVPB7gS/tiQxQEVI6J9qHTOvPl4rWtDCKmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=frJEUHcHQQ4/Ab0Lz4ccOc7HaLH20RdwOCkG79SFaR5iJGbTGLJTrgOvYa6pxcykN
	 A0jmx3fVuVOazslBysJtSqXKXnfnnheNdTrjLqlBOlA7D49Ey3iQYQc3KXsGWvYbAm
	 UeyA47bX8zU2qtPeYueklp4AaUTVUG21j2X2LMKjpy50ruz12LuhZWGuQa17WAYu/k
	 EuerxWpRdtXa1MvLRwn72rG5vnkQbBnTzrJIdyoN7yqxJRhLVJEeqxa2vEA8nDZ9pJ
	 4hBk+AdeKgerhfnTMxe7L2unVL2kr+Bg2/yBWBa1AIO50OomQNvgg1fV1K6saXtj4l
	 jTEAcPwEyoq0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/10] dt-bindings: iio: dac: add support for
 MCP48FEB02 SPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909-mcp47feb02_refactor-v5-9-8b67bcab93d1@microchip.com>
References: <20260909-mcp47feb02_refactor-v5-0-8b67bcab93d1@microchip.com>
 <20260909-mcp47feb02_refactor-v5-9-8b67bcab93d1@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:48:44 +0000
Message-Id: <20260909144844.78C961F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing definitions for `spi-cpha` and `spi-cpol` in the top-lev=
el `properties` block causes schema validation to reject valid device trees.
--

commit a76968b0d8e0b0cd896879ce5f6827e2fd5d9f18
Author: Ariana Lazar <ariana.lazar@microchip.com>

dt-bindings: iio: dac: add support for MCP48FEB02 SPI

This commit adds support for the SPI MCP48FxBy1/2/4/8 part numbers, introdu=
ces
the spi-max-frequency property, adds SPI-specific schema validation conditi=
ons,
and provides a devicetree example for SPI usage.

> diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb=
02.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.ya=
ml
> index d131f136bd151..a86d094f0d4b5 100644
> --- a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml

[ ... ]

>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: "^microchip,mcp48f[ev]b[0-2][1248]$"
> +    then:
> +      $ref: /schemas/spi/spi-peripheral-props.yaml#
> +      dependencies:
> +        spi-cpha: [ spi-cpol ]
> +        spi-cpol: [ spi-cpha ]

[Severity: Medium]
Will device trees configuring the SPI clock phase and polarity for this dev=
ice
incorrectly fail dt-schema validation?=20

This dependencies block within the allOf conditional intends to allow and=20
enforce co-occurrence of the properties, but spi-cpha and spi-cpol are=20
missing from the top-level properties block.

> +    else:
> +      properties:
> +        spi-max-frequency: false
> +        spi-cpha: false
> +        spi-cpol: false

[ ... ]

> @@ -272,7 +372,7 @@ allOf:
>        properties:
>          microchip,vref1-buffered: false
> =20
> -additionalProperties: false
> +unevaluatedProperties: false

[Severity: Medium]
Because unevaluatedProperties is strictly false here, and spi-cpha and
spi-cpol are omitted from the top-level properties block, won't any valid
device tree using these properties trigger a validation error during
dtbs_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-mcp47feb02=
_refactor-v5-0-8b67bcab93d1@microchip.com?part=3D9
