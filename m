Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CED45FFC3
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 16:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343952; cv=none; b=BvFAAgvLxUsHK+Z+S9+VnNg7gP8NJ8uyN6DvKh9g5vzlcXemQgVZ0rXRFwTszEekePm0ygDAE7HdFDphp57Omh/k0ofBk59u/4GUu61L1TC7ppvf02U5b158uTOUMHgD8O6ei5I6ej+AWjsguMl/rzGThQjWqmnQAYeOvPvh3lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343952; c=relaxed/simple;
	bh=LLw0Yu3qhIDw52d2QA8nESaAlrxoEVktEjf1vpn7ge8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YToac3jazwUTBIU3bAjEIeRpvT276cIHddabVEahHpHOgMfEode4Hh020CKLNp6s0Tox6V0tFR7ghLRQlJXgEaYU7V38s9aoQvWfkL2rUC6We+wi125vi+2TqO3uX6TsZj7l/jmfW5xgc3RJ84pJ98GO/eRiWhHfCOnDDJYxBzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NR5Z1HMF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NR5Z1HMF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510E31F000E9;
	Wed, 29 Jul 2026 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785343950;
	bh=WAK1LcaAJ9CaCDiQwUwUq/aE4Yri2oFc4Lvqxzx6UpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NR5Z1HMF7hV+5uNv121mWC1sMQO8855l07x3nArdopDWDQv5AU/pJqVL7T/9lI0mS
	 vh4aByndIJD9NrX0+zCxWJoMxFECX9G9gDV3OGtwiCwe/V32RWIMKcOTxP8RPRJNLj
	 5D9YMswR5WL9YAKentUNHNRX27E0YH5rU69/UVQOfl5QrCC+onxhkCtk44LbBvN7QT
	 N1QxrnxYmeXOBywfFgxdMFiI6VgW5WBbQlIVDM94m4Ihxf8Sy5WiaIG3VelY7wATU5
	 rQOHPTyVkGo9QJ7nE6eiovKn1Ov4RiHYSjH0MJPfqBgY7Z7pdcAaQtI0WQePLWUye+
	 qi/DVNkDIbwxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chien Peter Lin" <peter.lin@sifive.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729163908.249838-3-peter.lin@sifive.com>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-3-peter.lin@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 16:52:29 +0000
Message-Id: <20260729165230.510E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The CPU node schema incorrectly references the system-wide Worlds =
schema, bypassing strict property validation for all CPU nodes.
- [High] The schema incorrectly requires the `riscv,pmwid` property on lega=
cy devicetrees that lack the `riscv,isa-extensions` property.
--

--- Patch [2]: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart prope=
rties ---
commit 8c65780e5330e56c6e5f7b6479ae772aa1d15f0c
Author: Yu-Chien Peter Lin <peter.lin@sifive.com>

dt-bindings: riscv: Add Worlds per-hart properties

This commit adds device tree properties to describe the RISC-V Worlds
architecture. It introduces system-wide and per-hart configuration
properties for World IDs, along with schema validation rules.

> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 5feeb2203050a..5922a0307cfe0 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -26,6 +26,7 @@ description: |
>  allOf:
>    - $ref: /schemas/cpu.yaml#
>    - $ref: extensions.yaml
> +  - $ref: worlds.yaml

[Severity: High]
Does this inclusion break the strict property validation for all CPU nodes?

Because worlds.yaml includes additionalProperties: true, JSON schema
validation will treat all properties as successfully evaluated.=20

This neutralizes the unevaluatedProperties: false restriction in cpus.yaml,
allowing undocumented or typo'd properties to silently pass validation.

[ ... ]

> +  - if:
> +      allOf:
> +        - properties:
> +            riscv,isa-extensions:
> +              not:
> +                contains:
> +                  const: smwid
> +        - properties:
> +            riscv,isa-extensions:
> +              contains:
> +                enum:
> +                  - smlwid
> +                  - smwiddeleg
> +                  - sswid
> +    then:
> +      required:
> +        - riscv,pmwid

[Severity: High]
Will this erroneously require riscv,pmwid on legacy devicetrees that lack
the riscv,isa-extensions property?

In JSON Schema, a properties check automatically succeeds if the specified
property is absent.=20

Without an explicit check requiring riscv,isa-extensions to be present, this
conditional evaluates to true when the property is missing. This breaks
backward compatibility with older valid devicetrees that use the deprecated
riscv,isa property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729163908.2498=
38-1-peter.lin@sifive.com?part=3D2
