Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6629443F0BE
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784312145; cv=none; b=bISGo/nAoD5uBlEZQjX7aXS/zk4epJo006NcBNgZOqL7dlnY3j54U7YxT1vBv65/XEXUOw8u/i3w8k9VlbONHub/omzXUNmOALDl1vUERK12ayVAC+tu+okn5cT8GrtxWEo9ROAN4TO0p0XOb1c1FXeAT6n9rcxT/VA/TIC4Ml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784312145; c=relaxed/simple;
	bh=DMFy7NaOzsKPl13YwGt6+vgSBu6PmTCKJ/y072FJPxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rHiAJP+vYFAwRnFxli5bC2iH+LiGdBNi0sWS/Bl8MQuZdFllLh/3AvopDkCQYNCAIiD2ZOrdho3mRwxVzta76vwf/53KFdlDQwxiQNcgbnAaZj1WfPg+B+m01JYNVqOZv04XmLPOqk/vyUrEXIXW2bZBZ6Xf3Eje286tn/3a0Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8mOrUPU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8mOrUPU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FA61F000E9;
	Fri, 17 Jul 2026 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784312144;
	bh=h1HGwnO5y9brLpxpPNsYYotAx4IUpJc3grs0ke7Tx9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V8mOrUPUPkZhYRFEdbmjq/fK2BUPacfjs91bNicQLJWH0/is5W8o/VmBqymIGQOmD
	 O8dvq1wo856vwra/On5X3cTYfNItsApOpR821QAaEw7gVTj+32ZnL7Frt35XaEJivv
	 oRnKUyj5E/bZRNx/eQDS2OPEipF8c/Cx9Sqxr83kREQTdw5L3QDAYCAzd427aluLTj
	 QjX+a7Nu0DrD7VZuNktBpBcICFLmRMuaeXCRvLovmY1iIk9KDy3/EIO7q6I9cSjbFy
	 kxGiUaMFEXHOghh2g0AnGuxT8YEBlFReHsjEombhz34TKzWiUqyJWGgKqkAPub18hC
	 kc5XcM6z1XPWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] regulator: dt-bindigs: ti,pbias-omap: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-ti-pbias-omap-v1-1-527848131801@gmail.com>
References: <20260717-ti-pbias-omap-v1-1-527848131801@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 18:15:43 +0000
Message-Id: <20260717181543.B5FA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Top-level `$ref: regulator.yaml#` incorrectly applies standard r=
egulator constraints to the parent container node.
- [Medium] The schema incorrectly uses `oneOf` to restrict the parent node =
to exactly one regulator subnode, which prevents valid configurations like =
OMAP3 from defining both MMC and SIM regulators.
--

--- Patch [1]: [PATCH] regulator: dt-bindigs: ti,pbias-omap: Convert to DT =
schema ---
commit e24c9bc6e58ceda1b221ec8e8ce86f428408d847
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

regulator: dt-bindigs: ti,pbias-omap: Convert to DT schema

Convert Texas Instruments PBIAS internal regulator from text to DT
schema. No Functional changes are introduced.

> diff --git a/Documentation/devicetree/bindings/regulator/ti,pbias-omap.ya=
ml b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml
> new file mode 100644
> index 0000000000000..61a4dc87c48c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - syscon
> +
> +oneOf:
> +  - required:
> +      - pbias_mmc_omap2430
> +  - required:
> +      - pbias_sim_omap3
> +  - required:
> +      - pbias_mmc_omap4
> +  - required:
> +      - pbias_mmc_omap5

[Severity: Medium]
Will this reject valid configurations that define more than one child
regulator?

The JSON schema oneOf keyword requires exactly one condition to match. Since
OMAP3 SoCs can have both MMC and SIM PBIAS regulators, and the driver
supports them concurrently, having both defined would cause oneOf to fail.
Should this use anyOf instead?

> +
> +allOf:
> +  - $ref: regulator.yaml#

[Severity: Medium]
Does applying the standard regulator schema to the top-level parent node
neutralize validation?

This allows a device tree author to mistakenly place properties like
regulator-min-microvolt directly on the parent node instead of the
subnodes. Such properties would be ignored by the kernel but silently pass
the schema check.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,pbias-omap2
> +    then:
> +      required:
> +        - pbias_mmc_omap2430
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,pbias-omap3
> +    then:
> +      oneOf:
> +        - required:
> +            - pbias_mmc_omap2430
> +        - required:
> +            - pbias_sim_omap3

[Severity: Medium]
Similarly, does this restrict OMAP3 to exactly one regulator subnode?=20

This would prevent valid hardware configurations from using both the MMC and
SIM regulators simultaneously. Should this also use anyOf?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-ti-pbias-o=
map-v1-1-527848131801@gmail.com?part=3D1
