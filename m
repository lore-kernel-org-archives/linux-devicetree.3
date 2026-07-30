Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE943A8FE8
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785400587; cv=none; b=N1jME2ncoiJ2zgUcE7mKSquJPcIzMkZf7P7UX4MvMWWMXNZ+Y2AEGYAdmIZ0N98mj1Dx30b7vm939plh6OaLuAIAe0AGQg1b8mCUSs1NMW93YBz8eP3pNgt6rbDK1cZjw0oWvL/ylARCjd3c5QpKCAdR0B/gV9HCOF5i1S5ZuiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785400587; c=relaxed/simple;
	bh=uk2rHcPWwHaq86DKl2I9EVluVmQzDush8QYmKX3PjqU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qf6fL5Nlu1wUjmAa50kl/eaHzzfUMF0rWNWbsZ/TO6EkRel5ru757gCZ3Kkwi4Jvd3nqu9r70xTqio41xa7GlXFejgXyq8C7LNdHHgmTS2dfvlg5OoWMZHL+GjmkUW9RZKonSpeh+b/jDszTYiJa2/g2VQoYMRUdGDVQfS84syM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZNbxhAv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZNbxhAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FABD1F00A3A;
	Thu, 30 Jul 2026 08:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785400586;
	bh=lpA91RcI/Fw8y1UJXgKSaJFVtEFhtC6jq5g/lxK0I18=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fZNbxhAvizxV1jYbrEiHqw/4L8UOTenYwutOiiP1ukONVY4biNgzQTMINdNZUHHjN
	 aOoglmsON5vHN1KeVVqsybGRtypl8OS2rZHmdy7wgNSwF0XWVS3ncPXBJ4wDDmnTY+
	 U8LGb18y5841WhpnROTuZTczdLdwjjoCbv7JMyTge/vyDeWEEwFYJPQGXzFo02ckEU
	 49M1zf+JiDBWhX5oSXwl9HXsN6b2uCJMzehazG/iCFSYVj/Juj06K1dMpJ37PF4NEO
	 2keq1JRBYMb7hxtmapDHI/L0TnbpXk8TCXxL8niZtklBr0S4NFKrROFFMZUJ2Lygv9
	 +XbUDoUnDUsPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert APLL clock to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730083019.29998-1-egbostina@gmail.com>
References: <20260730083019.29998-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 08:36:25 +0000
Message-Id: <20260730083626.1FABD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML conversion fails to conditionally enforce variant-speci=
fic requirements for OMAP2 vs DRA7 hardware variants.
--

--- Patch [1]: [PATCH] dt-bindings: clock: ti: Convert APLL clock to DT sch=
ema ---
commit ae216da14737ed29efd003eb0159b573f9308b0f
Author: Eduard Bostina <egbostina@gmail.com>

dt-bindings: clock: ti: Convert APLL clock to DT schema

This commit converts the Texas Instruments APLL clock bindings from a plain
text file to a DT schema.

> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,apll-clock.yam=
l b/Documentation/devicetree/bindings/clock/ti/ti,apll-clock.yaml
> new file mode 100644
> index 0000000000000..e14a76254ce77
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,apll-clock.yaml
[ ... ]
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +    description: Link phandles of parent clocks (clk-ref and clk-bypass)
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 3
[ ... ]
> +  ti,clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: static clock frequency for the clock (OMAP2 only)
> +
> +  ti,idlest-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: bit-shift for the idlest field (OMAP2 only)
> +
> +  ti,bit-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: bit-shift for enable and autoidle fields (OMAP2 only)
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - reg
> +
> +unevaluatedProperties: false

[Severity: Medium]
Does this YAML conversion fail to enforce the OMAP2-specific required
properties that were described in the original text binding?

The original text binding indicated that ti,clock-frequency, ti,idlest-shif=
t,
and ti,bit-shift were required for the OMAP2 hardware variant. By dropping
these properties from the required list entirely and leaving clocks and reg
with loose bounds, device trees with incomplete OMAP2 configurations will
now silently pass schema validation.

Should this schema include an allOf conditional block matching the
ti,omap2-apll-clock compatible string to properly enforce these properties
and the specific minItems/maxItems constraints for each generation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730083019.2999=
8-1-egbostina@gmail.com?part=3D1
