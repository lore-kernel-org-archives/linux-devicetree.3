Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3162A305676
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782381262; cv=none; b=X8XhWwH82kd+tpVTA9AsptXvpIcr+cmHE3nOI7auglkaPZe15tHclk9c615uOoJII8uvxj8sFnpMnEsESbrxYHUM8YspP+UoJnht4kb+LmDonBKx91HZ0zP3djkEzdczJ5a7I3Yx9Gt1ZDX+3ZnSfmo1K3OFTYxKmAwDVzd01Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782381262; c=relaxed/simple;
	bh=78ciB6jQmJUH/2Ju1dGkYe1bxuNDm79aXlwglFZzcMY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NrnGmwF9GQidMo8DbR2utXon1lv7yjtRvdmCayuo+CzEDvm0XBlDUm3a9tQOHQdFIGKY7kStN0AgMgTUAO4ZItPgtGhQDg7gIwHIqppNchy1EBQHNnPMbPhf5IPDPtz1aE+8hDRbNfSwtSsO78+UBk/KZkXq2Va9SIM4OcyJ8Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgYbUlMD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgYbUlMD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F11B1F000E9;
	Thu, 25 Jun 2026 09:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782381260;
	bh=ZUGqB22cr4y+HR/4KOjZgOtSAA25G6nGzIxdjR8Z7Wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HgYbUlMDUHQN3PSNCZJ5CjSfe5yBTshPpILRTlcRlvyls9jK/+L+1+8DCIlCRs7sB
	 SUTms+lN7DluUO3FL503B6P1hHXpXDaJj9imqIX5udzhrsMEOaIzzU4hpmEZctQ9M/
	 Ayfw9wrovEuvkXN+tu9wIQ8A0NrLYvBa9xQ/Wrg47Ywq1sZOsX+WLxhmC2jXAJ6fC6
	 WMOl/jV961tmsGA9QeJeZEWY8Ny2s12/bY7kwlG5RlB1RxCn7n8KUQzSvoZN1gjNOb
	 KnZy1UDC/UYVeMis9iYRIU8th7nDpdYJNyLEh22qRIl+qxPkDFNJiOxqRVfqvKBAyA
	 xZmgxoWYkSOcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260625094449.708386-2-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-2-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 09:54:18 +0000
Message-Id: <20260625095419.7F11B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The Nuvoton MA35D1 conditional schema block logically conflicts wi=
th top-level constraints, causing validation of valid Nuvoton device trees =
to unconditionally fail.
- [Medium] The Nuvoton MA35D1 conditional block fails to restrict the `port=
s` property to a single output port, contradicting the hardware description.
--

commit 6779aa6e54db7988d8c51ba66d2a7972829a44e6
Author: Joey Lu <a0987203069@gmail.com>

dt-bindings: display: verisilicon,dc: generalize for single-output variants

This commit adds the Nuvoton MA35D1 DCUltraLite to the verisilicon,dc
binding. It introduces conditional blocks to express per-variant
constraints for clocks and resets rather than hard-coding the DC8200
topology at the top level.

> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yam=
l b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> index 9dc35ab973f20..1e751f3c7ce83 100644
> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml

[ ... ]

> +allOf:

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nuvoton,ma35d1-dcu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: pix0

[Severity: High]
Does this conditional schema conflict with the top-level constraints?

Any device tree node containing the compatible string for the Nuvoton
variant is evaluated against both the top-level schema and this conditional
block concurrently.

The top-level definitions strictly enforce a 5-item array and specific
constant values for clock-names (such as the second item being axi). This
block attempts to override those with a maximum of 2 items and restricts the
second item to pix0.

Since a length cannot be both exactly 5 and a maximum of 2, and an element
cannot be both axi and pix0, this creates an unsatisfiable constraint.

Will this cause validation of valid Nuvoton device trees to unconditionally
fail?

> +
> +        resets:
> +          minItems: 1
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: core
> +
> +      required:
> +        - resets
> +        - reset-names

[Severity: Medium]
Does this block need to explicitly restrict the ports property to a single
output port?

The commit message states that the Nuvoton MA35D1 DCUltraLite has a single
output port. However, because this conditional block does not explicitly
disallow the second port, it inherits the top-level allowances.

Will malformed device trees incorrectly specifying two output ports for the
Nuvoton variant silently pass schema validation, bypassing the hardware
topology checks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625094449.7083=
86-1-a0987203069@gmail.com?part=3D1
