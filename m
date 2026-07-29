Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902B53A5E98
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305623; cv=none; b=FxQ9O3lBdas4gi6GG2vZABxGk5UsmIRd9OPSLfbDJhxymOXbYiqkrRKKk2Pl0Uo2YFy/0lCFUjAiF9OnO7xWJGlxFj724/Q0DSsFQlzjE9YERh8CgN59SPrL3aiX9N7KmWnlIPbhBiEOiangRnHyskoWDSB1VdwO+/UMndDQRU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305623; c=relaxed/simple;
	bh=t2zgVj8jNVIBXocvVvCyIqjVEq/DinepWfKBT+7TT68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S83LFF/VrY5VTdfzSxoIEO+Ad6jzdLHaBBRezb2q+4il+6NNutBAF73spsJQwccHiMWbsrYctESY8sPEbaAFS8yPgPIbDqr3V39UR5Ey+mEeLOoKpStzycuZ8snzJmuwGVzK5wLNJiPvRiyCxrmQZrahoTY6VOMnV7SznujT8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfUrey1e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfUrey1e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8011F000E9;
	Wed, 29 Jul 2026 06:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785305622;
	bh=eJf9Eh0HPKT2QuZXG7opibhu9wCLFCDwHqRTGMd6DsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BfUrey1eYKPYyiZ63q8Fyf22zPAuzNcXiMBole4EiFd0ko48ppKzAgOaKJo6SeucT
	 mSb4gv6c643JW3XurmOXXcJ/2SQpImIRhp4E6zODAE6OuFSriNgIH54em0FlBAn7XY
	 pCOs3HWpTDu9Msbztmb8eNqw2x0VaM1mvIrIlr5SBjXjI79UyCyL4Rvu4d5Nuft0VU
	 /OqQF/vAyF4/Ivraf8Mo+x52yOuMcVNE/rULOjqFVgYLOzydmoqPkiqbfPiqIcM6pl
	 S2xAcbHCBLxAalJJnFuCpXdEjTOdpoWJg/WdE2aV09DQA1fDRm3mfLDYf6y/OoJKk/
	 EghPv2+0eoYSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Parade PS5169 redriver
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729-ps5169-bup-v2-1-203b0a49881a@proton.me>
References: <20260729-ps5169-bup-v2-0-203b0a49881a@proton.me>
 <20260729-ps5169-bup-v2-1-203b0a49881a@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 06:13:41 +0000
Message-Id: <20260729061341.CC8011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Using 'parade,ps5169' as a fallback compatible string for 'parade,=
ps5170' violates backward compatibility principles due to hardware topology=
 differences.
- [Medium] Missing `mode-switch` property definition in the top-level `prop=
erties` block causes valid `parade,ps5170` device trees to be rejected.
- [Low] The `parade,aux-rx-data-reverse` property is erroneously allowed fo=
r the `ps5169` variant which lacks an AUX switch.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: usb: Add Parade PS5169 redriver =
bindings ---
commit b10ecfdc9ec0281d0cf16967c19be130e3289a23
Author: Esteban Urrutia <esteuwu@proton.me>

dt-bindings: usb: Add Parade PS5169 redriver bindings

This commit adds bindings for the Parade PS5169 and PS5170 USB Type-C
linear redrivers. The PS5170 features an embedded AUX switch, which the
PS5169 lacks.

> diff --git a/Documentation/devicetree/bindings/usb/parade,ps5169.yaml b/D=
ocumentation/devicetree/bindings/usb/parade,ps5169.yaml
> new file mode 100644
> index 0000000000000..86ea2351ee1e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/parade,ps5169.yaml
> @@ -0,0 +1,191 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/parade,ps5169.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Parade PS5169 USB Type-C linear redriver
> +
> +maintainers:
> +  - Esteban Urrutia <esteuwu@proton.me>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: parade,ps5170
> +          - const: parade,ps5169

[Severity: High]
Does this incorrectly define parade,ps5169 as a fallback for parade,ps5170?

Since the PS5170 features an embedded AUX switch for SBU lines, an older OS
binding to the fallback ps5169 driver would fail to configure the internal
AUX switch. This would leave the SBU lines disconnected and break
DisplayPort Alternate Mode.

> +      - const: parade,ps5169
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: 1.8V power supply
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  orientation-switch: true
> +  retimer-switch: true

[Severity: Medium]
Should mode-switch: true be included here?

Since the PS5170 supports altmode muxing with its embedded AUX switch,
valid device trees for the ps5170 may define the mode-switch property.
Because additionalProperties is set to false later in this schema,
dt_binding_check will reject any node specifying mode-switch.

[ ... ]
> +allOf:
> +  - $ref: usb-switch.yaml#
> +  - $ref: usb-switch-ports.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: parade,ps5170
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@2:
> +              $ref: /schemas/graph.yaml#/properties/port
> +              description:
> +                Sideband Use (SBU) AUX lines endpoint to the Type-C conn=
ector for the purpose of
> +                handling altmode muxing and orientation switching.
> +    else:
> +      properties:
> +        ports:
> +          properties:
> +            port@2: false

[Severity: Low]
Can we also disable parade,aux-rx-data-reverse in this else block?

This else block applies to the ps5169 variant, which lacks an AUX switch.
Currently, invalid device trees for ps5169 can specify the AUX-specific
parade,aux-rx-data-reverse property and silently pass schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-ps5169-bup=
-v2-0-203b0a49881a@proton.me?part=3D1
