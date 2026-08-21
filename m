Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591A04BC02C
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322359; cv=none; b=dUH06DNuaH9u1Z/n4jGmXWSMpELZLibTYLxKBuhyCSrVdZScNwr96jfuBbDNYuuuP8Y94Dbh16UvQPJrRhK7QnPa213uKjapGbqk95c5COV552cTDA0dMg0a5NVtzI29ahhKHGQOOdeAoV3UUU3lMVOGq0OPZnG3VNK/MbyONEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322359; c=relaxed/simple;
	bh=WLlwHc7QdE0NSK7tOXOFqh4x2N5Mk9D8AaFvpUagJHs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f7uWpPT5QZTiisCakRHSDxF0YZO2KKOUiTExX+lw+2amjkbgUH/ONAK0Uj/rOaTkaVHk3FGOhBMy/zI1aIPPmt+ghj0q/C53LxG83kfVK3grVYM4Q/z1Ed7v7nfoQfPTOeJlla4FPfHSdbBKoHllcZ54MhmbLLeSrOxLEV9c3Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=om6K7hDT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="om6K7hDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4091F000E9;
	Fri, 21 Aug 2026 14:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787322357;
	bh=WvFNDJiwYFDo8sQo9vlvZhuGz420RrLM73P0NJ4FTMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=om6K7hDTTCw7WZLFKiyF/5kYjPSBxSuay0AqMcnTmGkqSLdMcQZA9fR6j18b11dsK
	 TRYJ73f1Wp7+TlyxHO6+x+eQ7B8SoyagTHgejE3GXFUZK85yeAHZzBSLKYtXGh1ByX
	 oUq5zYVPNn3Hx0wQpSLXgJwaVp8Oq2I+QqS7r82wnBWGV6MbvDhDn8POowVts9gpoQ
	 3c95iYcb2dpMoWPmECQsfSMaMQ0tf0wsHyAYJyl/e93i1A+usPugHazZIGy3nAYLP6
	 CcH1naug7PzA1rGbWGKDHdhPrBtC5fEz3jDiG/c/1CFNCXE461Rh1j8JuRm/DHOCK3
	 sq7+S5u9QG3hQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next v2 1/2] dt-bindings: net: pse-pd: Add
 bindings for LTC4266 PSE Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Swenson" <kyle.swenson@est.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260820142429.2285172-2-kyle.swenson@est.tech>
References: <20260820142429.2285172-1-kyle.swenson@est.tech>
 <20260820142429.2285172-2-kyle.swenson@est.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 14:25:56 +0000
Message-Id: <20260821142557.5F4091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The child node definition `^pse-pi@[0-3]$` is missing `unevaluatedP=
roperties: false`.
--

--- Patch [1]: [RFC PATCH net-next v2 1/2] dt-bindings: net: pse-pd: Add bi=
ndings for LTC4266 PSE Controller ---
commit 1f8974966417493a9b12a4f2599002b08898882c
Author: Kyle Swenson <kyle.swenson@est.tech>

dt-bindings: net: pse-pd: Add bindings for LTC4266 PSE Controller
   =20
Add the LTC4266 Power Sourcing Equipment controller device tree bindings
documentation.

> diff --git a/Documentation/devicetree/bindings/net/pse-pd/lltc,ltc4266.ya=
ml b/Documentation/devicetree/bindings/net/pse-pd/lltc,ltc4266.yaml
> new file mode 100644
> index 0000000000000..b3da8fea0b07a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pse-pd/lltc,ltc4266.yaml
[ ... ]
> +  pse-pis:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^pse-pi@[0-3]$':
> +        type: object
> +        properties:
> +          pairsets:

[Severity: Low]
Is it possible to add unevaluatedProperties: false to this object?

The Device Tree schema meta-schema strictly requires that any node defined =
as
type: object must specify either additionalProperties: false or
unevaluatedProperties: false.=20

Omitting this on the ^pse-pi@[0-3]$ node causes the schema to silently allow
any undocumented or misspelled property inside the pse-pi@X nodes, which
defeats the purpose of dt-schema validation. Since this node relies on
properties defined in the referenced pse-controller.yaml, using
unevaluatedProperties: false seems to be needed here.

> +            description: The LTC4266 delivers power to a PI over a single
> +              pairset, driven by one of the controller's four channels. =
There
> +              is no 4-pair mode spreading a PI over two channels, so exa=
ctly
> +              one channel phandle is expected.
> +            maxItems: 1
> +          pairset-names:
> +            maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820142429.2285=
172-1-kyle.swenson@est.tech?part=3D1
