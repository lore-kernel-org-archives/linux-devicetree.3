Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B874A99D6
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637708; cv=none; b=lpN6o/NKVi25dMeFiig7ES0zHoQWDgT9qlNPBzZVt42bV2WHYKEYxdwSSvNPV/JQWaE0CcK5zQzHJyIhHsLjreycBmcoyWp2KTspFVXmq8Hm1iAckcO/DyxxnHwS9A2JHucrH3NcFZwFk5tcxOSUxCSjnJcmwJB41t+CLrWgtWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637708; c=relaxed/simple;
	bh=C1JTqcf58AUMKACGgFkxcCWsRQHzXcPo4ZiiGlkszjw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YQe9/cvTK6uyVTHywbXbjNjWvrUeHzUaggHhKo2/k3TEOMaPMBgoQREPKVLx95DiqGkJvdCqk3FHN0coJYsbytzkxe1occ/yq7N6umt1V4J0MDTTtVaX8ztiMn6Vt4mLdKUyMLD81RNbNTvyBSqUYzgp70L3fUX16IQLQXB0K8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEmeZZsP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEmeZZsP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C191F000FF;
	Sat, 10 Oct 2026 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637702;
	bh=XWu9qbRzPMbMmrhWQxQlPjqZYZqLKNSmQF8o3uA48cc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GEmeZZsPVDmnJtgOKvpxNMjI7g9rypIeOBO588B3/buRPLX5UT/k/JyWHoRu0FJz9
	 Hz/l9Y460hpp8DdGxCQWRL+wXHghJ2fzdCH5BgT6JQhGKhtLii9ubI+gzogE8dOoE0
	 JJg9ZHM79YH6RnWazlNm7ZN4XznD7nSGjR2DQyZukTovNEEsUWqY5pTTF+Sp2FYh1b
	 NZppsikqEC562/gMJ7usryPn9vHX5GkSLMNs45xSHINAnxQ0PVcXlyzqYbADmM88qK
	 sjeJ4TIsCLXVSMJ30xYae+37GqeoBN7X1Ql9xbai2nvc2dpt+2rMPkoilTILiHTz3w
	 N5ZC8k+VUa4LQ==
Message-ID: <sashiko-outbox-166564@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/24] dt-bindings: clock: Add ZTE ZX279128S CRM clocks
 and resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261010130024.177503-7-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-7-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:08:21 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing minItems constraints for clocks in conditio=
nal blocks
- [Medium] dt-bindings: clock: forbids #reset-cells for LSP CRPM hardware
--

commit 3165423c65a32ccd48a20652df13ea5343f45889
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

dt-bindings: clock: Add ZTE ZX279128S CRM clocks and resets

Describe the top CRM and the two low-speed peripheral clock domains,
including the confirmed USB reset bits. Uncertain clock-source rates are
called out in the cover letter.

> diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-crm.ya=
ml b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml
> new file mode 100644
> index 0000000000000..2964c0fd6b040
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: zte,zx279128s-topcrm
> +    then:
[ ... ]
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: zte,zx279128s-lsp0crpm
> +    then:
> +      properties:
> +        '#reset-cells': false

[Severity: Medium]
The description earlier in the schema states that the LSP modules are "clock
and reset/power modules (CRPM)" and that the top CRM is a reset controller
"too". This indicates the LSP CRPMs are hardware reset providers.

Does explicitly forbidding the '#reset-cells' property for the LSP0 CRPM
hardware in this allOf block encode a current driver limitation (or lack of
documentation for the reset bits) into the hardware schema? This forbids
device trees from modeling the hardware's reset capabilities, causing a
mismatch between the text description and the schema constraints.

> +        clocks:
> +          items:
> +            - description: register (APB) clock of the group
> +            - description: 25 MHz work clock
> +            - description: 32.768 kHz work clock
> +            - description: 100 MHz work clock

[Severity: Medium]
Because minItems: 1 is defined at the top level of the schema, does this
items array implicitly restrict the minimum length in JSON schema?

According to JSON Schema rules, defining an items array limits the valid ty=
pes
and values for those indices, but does not require all of them to be present
unless minItems is set. A device tree node specifying fewer clocks than
required (e.g., 1 instead of 4 for LSP0) will pass validation.=20

Could this lack of a minItems: 4 constraint in the zte,zx279128s-lsp0crpm
allOf condition allow incomplete device tree nodes to silently pass schema
validation, leading to potential runtime driver failures when expected cloc=
ks
are missing?

> +        clock-names:
> +          items:
> +            - const: pclk
> +            - const: wclk25m
> +            - const: wclk32k
> +            - const: wclk100m
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: zte,zx279128s-lsp1crpm
> +    then:
> +      properties:
> +        '#reset-cells': false

[Severity: Medium]
Does explicitly forbidding the '#reset-cells' property for the LSP1 CRPM al=
so
contradict its described hardware role as a reset module?

> +        clocks:
> +          items:
> +            - description: register (APB) clock of the group
> +            - description: AXI clock of the group
> +            - description: 25 MHz work clock
> +            - description: 49.152 MHz work clock
> +            - description: 100 MHz work clock

[Severity: Medium]
Does this zte,zx279128s-lsp1crpm condition also need a minItems: 5 constrai=
nt
for clocks? Without it, an array of length 1-4 could pass validation since =
the
top-level minItems is 1, potentially causing runtime failures if nodes are
incomplete.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D6
