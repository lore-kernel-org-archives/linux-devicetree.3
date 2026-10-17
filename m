Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAAB419FDC
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 11:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792236053; cv=none; b=lE/DFmerQDTOF6DnVtuPh14doUoT2e+4tZKKNY+yAJeNBcWrS4u4B2mi3O0TlTbFfuI5J76k1+5O7DkCAXAJHTH/1QOO+3DAf8IeT/cylQF1v51WAzLE/x0if/sOCVtVuO0fOEhbuXcs3+OXk+ZG3E3++UOBGC4GG5GV8TWmvCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792236053; c=relaxed/simple;
	bh=L4CdzbFOFYCVp195C6yGLZi9s3DcvC9PJsm+Mw9p058=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=uvkdIB7uV9C9gVfOk0vD/VmsP4MhL2khohpAHT3V2oR581gXEhiZfRKahXkcqp7bGH3WlL696hBCX4peRgezAjd+n6adM9V2GgXLuxXd+geRPE4Lw1X598TeI6iTDmrMLl7Ki0tscNr9qj1vQFK/2a2gjQTGWS2DZO+KIRwgqRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpgSANDD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpgSANDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FC11F000C4;
	Sat, 17 Oct 2026 11:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792236052;
	bh=nmoYhnuK7kwyRfLmt55IfamCERFkazLdlT0TZlhzY+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JpgSANDD7jCTLTso6TeHx/MPNLd3FNKZ1NwMYOYcF/R0gkrDGPSCvi4gaF22j8Lrv
	 quVA+V2JrAhvwPp9iK6lzHfa/U+Yy1Y/GYvnggq75BecMSv49oG7eKbe/J5Br43GSq
	 biQWQRTzU9UUAvpB7DWegYp+El8rJCHfS5gjqD8PZpHNYuOO7k769Wv5UGukILZnUN
	 WESG4JUP3JFXx2/Ley30k9yORmUdD9D/fK6TIfNr4VqrF/bAYnO7ks6x8xI1ub0/yd
	 Saa7rSvBLeav3rBLxXvG0j8C/6vY3jBPqX91S8ZlT1HruxAwLh7H0QxXeqEmH6Y6cY
	 tWsj0aLvZOqKw==
Message-ID: <sashiko-outbox-175489@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/5] dt-bindings: net: maxlinear: add
 MxL86211C VDDP supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016112033.949026-1-robert.marko@sartura.hr>
References: <20261016112033.949026-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 11:20:51 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: overly restrictive select block breaks validation f=
or other PHYs
--

commit 695546f38e461889fde9ccbc3738543cebc3766c
Author: Robert Marko <robert.marko@sartura.hr>

dt-bindings: net: maxlinear: add MxL86211C VDDP supply

This commit describes the VDDP supply used by the MxL86211C PHY.
It adds a new schema section to validate that the supply requirement is met
when the MxL86211C PHY ID is present.

> diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml =
b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> index 8a3713abd1ca9..a0dfb6192d81b 100644
> --- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> +++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> @@ -10,10 +10,38 @@ maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
>    - Michael Walle <michael@walle.cc>
> =20
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: ethernet-phy-idc133.5400
> +  required:
> +    - compatible

[Severity: Medium]
Does this top-level select block restrict the entire schema to only match t=
his
single PHY ID? By acting as a gatekeeper for the whole schema, it appears t=
his
breaks validation for all other supported GPY2xx PHYs.

For example, the maxlinear,use-broken-interrupts property intended for
GPY215B/C might no longer be validated, and even pre-existing examples in t=
he
schema might fail to match.

> +
>  allOf:
>    - $ref: ethernet-phy.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ethernet-phy-idc133.5400
> +      required:
> +        - compatible
> +
> +    then:
> +      required:
> +        - vddp-supply
> +
> +    else:
> +      properties:
> +        vddp-supply: false

[Severity: Medium]
Since the top-level select block already guarantees that the compatible str=
ing
contains ethernet-phy-idc133.5400, does this else branch become dead code?=
=20

The if condition will always evaluate to true when this file is applied, so
this branch won't be able to enforce the vddp-supply restriction on other
PHYs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016112033.9490=
26-1-robert.marko@sartura.hr?part=3D1
