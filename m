Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E95E422521
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697935; cv=none; b=njAzpFqtZWLElj02kOoC8ubjnKBVt6FQnXhfkvqwSBs88zGDJrettZNxpVnsMRoAoapVNw6q/DeiazvOoxRlb9FeqLtNeXwp1qT3QXMpvW/cmbpRpYSWn5PpdMx200/GhLpNc7ySCNQzHg2ZgIB0eSeG8icJ6AAmT+PGET9MaHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697935; c=relaxed/simple;
	bh=BzsKp7KQfLTorEghlB/bfjZLCmtQz2mwbJ0jwnLe48g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UNF3E5zNB5iai7zuDx1RumweLODEAYUpZallIf1c+2sfdimuW4kxK4Vq9jCAzhbiLfOniUAP9KRunr/ZMFruQdlPkRFISXVApaWXEU2hcdTfTlZPtnHAjxakvpJrzMTIY8Je+jRpfAfFNShg3VWoG5l+/WjFrdcGKUCp9qL785Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQzs765S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQzs765S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4642D1F000E9;
	Fri, 14 Aug 2026 08:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786697934;
	bh=QfaCfEdmxAZ+kluTIULjZca4omOGL18uhFjMUpw6Vns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MQzs765SUk0s+gLhJqCaK7r7Z5/zypr5FHrDDWfsYcBDpvj5WXWkp7SNRzM2JD0qM
	 GyybEzyX0+xf8kl0IFi0fjc7itphxVWrYw3btE+q9Xvlcg5JyWMYPcca5P2Ij1rmi8
	 EsdeE89pe8Gp/svuUHz5kCPrNCoJ+26CFMDcrRm2qNub7f4d0JK2K/zxWx1ggpaerk
	 AE8GubspxsFKUC0jEyIxwuBYBnUfT6ix6zBSsPSSEannfHlvTp8zEz0PY8Ky/FJlUj
	 YIT0CZ4q2H1amDhmrHxzWKkXO9xPrBmdpcFd7ZM1O+QhICzGwXII+3MZDchgvMAOlK
	 CNy+2rcvg6xbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 2/3] dt-bindings: net: wiznet,w5100: add
 link status interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260813-wiznet-link-gpio-v5-2-ac8046f24413@marmottus.net>
References: <20260813-wiznet-link-gpio-v5-0-ac8046f24413@marmottus.net>
 <20260813-wiznet-link-gpio-v5-2-ac8046f24413@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 08:58:49 +0000
Message-Id: <20260814085850.4642D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing the `interrupts` property from the top-level `propertie=
s` block without explicitly specifying `maxItems` in the conditional branch=
es removes the upper bound on the array length, allowing invalid configurat=
ions to pass validation.
--

--- Patch [2]: [PATCH net-next v5 2/3] dt-bindings: net: wiznet,w5100: add =
link status interrupt ---
commit 27905addd6c59c9b61baecb1400ea1f5c8b0242f
Author: Arthur Crepin Leblond <arthur@marmottus.net>

dt-bindings: net: wiznet,w5100: add link status interrupt

Add an optional link status interrupt which can be connected to the
LINKLED pin on the device to detect link status changes.

> diff --git a/Documentation/devicetree/bindings/net/wiznet,w5100.yaml b/Do=
cumentation/devicetree/bindings/net/wiznet,w5100.yaml
> index 217f301db182b..81f4382eb96c5 100644
> --- a/Documentation/devicetree/bindings/net/wiznet,w5100.yaml
> +++ b/Documentation/devicetree/bindings/net/wiznet,w5100.yaml
> @@ -15,6 +15,33 @@ description: |
>  allOf:
>    - $ref: /schemas/net/ethernet-controller.yaml#
>    - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - wiznet,w5500
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          items:
> +            - description: Main interrupt (INT pin on the device).
> +            - description:
> +                Optional interrupt for link status changes (LINKLED pin =
on
> +                w5500).

[Severity: Medium]
Does this leave the array length unbounded for the wiznet,w5500 conditional
block?

Because the items keyword in standard JSON Schema only applies constraints =
to
the specified indices without capping the array size, it appears maxItems: 2
is missing here.=20

This could allow device tree configurations with 3 or more extraneous
interrupts elements to silently pass schema validation.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - wiznet,w5100
> +              - wiznet,w5200
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Main interrupt (INT pin on the device).

[Severity: Medium]
Does this branch for wiznet,w5100 and wiznet,w5200 also require an explicit
maxItems: 1 constraint?

Without an explicit cap, invalid device tree configurations specifying 2 or
more interrupts for these devices could similarly go undetected.

>  properties:
>    compatible:
> @@ -23,10 +50,6 @@ properties:
>        - wiznet,w5200
>        - wiznet,w5500
> =20
> -  interrupts:
> -    items:
> -      - description: Main interrupt (INT pin on the device).
> -

[Severity: Medium]
Does removing the interrupts property from this top-level properties block
prevent dt-schema from automatically inferring and injecting a maxItems
constraint?

Leaving maxItems unspecified in the allOf conditional branches while removi=
ng
it from the top-level block removes the upper bound on the array length,
allowing invalid hardware descriptions to go undetected during dtbs_check.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-wiznet-lin=
k-gpio-v5-0-ac8046f24413@marmottus.net?part=3D2
