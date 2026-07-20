Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E50449B08
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578907; cv=none; b=nFviO3ph5qNRUO0GI7wxI8H9+1/eZCJtI8tf6fMviPhWGRqB5m0gGqfglqL14WkVe+untr+fJ65MrEWeNZXpXsVOH9MVh5jBzq/24FlLXrBOfdiUwGtqiJRS0HpdSRFOdrgzuPiJXzH6i65Phxwvom+GvNLrYG4xnKX1SXkGisk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578907; c=relaxed/simple;
	bh=LVmrhbL3r1BnZ5cl8dD4aTdJAQb4DP9acmemfd53GjE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jdph8mnM3qsTNBAau729vwiucPIzX2TcrAg9B+2sMO24hWcb0a1BYgMbc6fxk5p/a3hflIBGU2xxj0N360fAltLo4txF1c0K3HF2hIsNQgH4fKpSLze90dAysgy7bizGYSVZHhOY0dza1PuPw/Du+yl9kTj+t3rCDrQw4GsqI8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvFFXgH8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvFFXgH8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2461F000E9;
	Mon, 20 Jul 2026 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784578904;
	bh=qjRn2KeLR2dAbVvg5Tg77KOLPWdkkGtbauHFWuamIII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kvFFXgH8lc5k71z6r3Be9hmW+W0GCOileJDRu9/WEU+x9dLe1K1CudVjHvd7Foi+W
	 751+BvrrH5i93/OuU8K2QOfA7RH0LDRcX+HR3Y3LbScswA735E8zlM4mgfE4NmauDz
	 IcVuOpubz+RQKtN9IsXUG0zZiWNz2Czp/5v/lc/c9xY/OkJJRd9p5oWjrEJ/XpD0yg
	 IL9Q1cJva63Gau0PdsJBJX1PV6Nl/kw/3UBZsxVHA6o14tF5C5KBtIr0a6BaucegkO
	 D2ddBTScP8pVUQOv94Z099e1tz41kR1IHP4GDdMs6rcYeQYxgNqlqwYH9NNI53A+jG
	 2rYvEJFpizwsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: edac: altera: agilex5: document new
 edac support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720201425.1538771-2-dinguyen@kernel.org>
References: <20260720201425.1538771-1-dinguyen@kernel.org>
 <20260720201425.1538771-2-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 20:21:43 +0000
Message-Id: <20260720202144.4E2461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Removing `maxItems: 2` from the global `interrupts` property to =
allow up to 7 items relaxes constraints for older hardware generations, all=
owing them to improperly specify up to 7 interrupts and bypass schema valid=
ation.
- [Medium] The `interrupt-names` property is introduced for the new `altr,s=
ocfpga-agilex5-ecc-manager` variant, but it is not conditionally enforced a=
s a required property for Agilex5.
--

--- Patch [1]: [PATCH 1/4] dt-bindings: edac: altera: agilex5: document new=
 edac support ---
commit d266055949125966c496511b166440e55892f101
Author: Dinh Nguyen <dinguyen@kernel.org>

dt-bindings: edac: altera: agilex5: document new edac support

This commit adds EDAC support for Agilex5 peripherals, including SDM QSPI,
CRAM SEU, and IO96B. It updates the device tree bindings to include the new
compatible string and expands the interrupts and interrupt-names properties
to accommodate up to 7 interrupts for the new hardware variant.

> diff --git a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-mana=
ger.yaml b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.=
yaml
> index 136e8fccd429a..2ccb0f2163185 100644
> --- a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
> +++ b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml

[ ... ]

> @@ -33,7 +36,25 @@ properties:
> =20
>    interrupts:
>      minItems: 1
> -    maxItems: 2
> +    items:
> +      - description: Global single-bit error
> +      - description: Global double-bit error
> +      - description: IO96B0 DRAM controller error
> +      - description: IO96B1 DRAM controller error
> +      - description: SDM QSPI single-bit error
> +      - description: SDM QSPI double-bit error
> +      - description: SDM single-event

[Severity: Medium]
Does removing the maxItems: 2 constraint here allow older hardware generati=
ons
(like S10 or A10) to mistakenly define up to 7 interrupts and silently pass
schema validation?

Should the binding use an allOf / if-then block to enforce maxItems: 2
specifically for the older compatibles?

> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: global_sbe
> +      - const: global_dbe
> +      - const: io96b0
> +      - const: io96b1
> +      - const: sdm_qspi_sbe
> +      - const: sdm_qspi_dbe
> +      - const: sdm_seu

[Severity: Medium]
Will this allow device trees for Agilex5 to silently pass schema validation
even if they omit the interrupt-names entirely?

Should there be a conditional block enforcing interrupt-names as a required
property specifically for the altr,socfpga-agilex5-ecc-manager variant?

> =20
>    interrupt-controller: true
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720201425.1538=
771-1-dinguyen@kernel.org?part=3D1
