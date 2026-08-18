Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D39647DD55
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071374; cv=none; b=UtFXEGOFN1THCegtMx3CAedMNkFG/Vt4EmgLv/xzKhA0nNEa2iR15IknLdZbxJcJpFXVJ5YIRKPMfhjldepdugf9NUUATca8PA08dkP/XMLedXSClRq4zh9dsjuNgeSMy3NOjkrlXqut6L961YXJ8REEl0VKjn5Gq15q4T3WAdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071374; c=relaxed/simple;
	bh=vdHXjon9Sh6Y1CDovfPe7eqt4JkunVYfJEkHNJKJAss=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nvolbFjxXLH1A3bMcoSaWe2N1HlZUSXe0IE3MART2/tU34jTd+SBu8oCGc0fX+SbxOzrJUCHJHRhF+wW3TUE3RQSkC/sJfwMr1FrxlN1y9eXpFPZfXUrMAvkaP89TyMc4KQ+mu/vl6P4p5E2hJYy9cN/80aIFgWupgYcVWjACsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rdq/I0/C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rdq/I0/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCF31F000E9;
	Tue, 18 Aug 2026 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787071369;
	bh=igN8MvIpI44umRS/0dWbNPJSPuviwFn5LnynMybEqtI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rdq/I0/CYa0NYt1L8JTyPU0KtwhYG0xk4VjTWWmBPehVmXqVG6CIy6B4KUqXLLeM0
	 nxR4udXrues2QI7mngBaaNDYbEWSisFHD1vIzZIoNHg1Di37vPsIWXSypIICK3p1Ga
	 n7G9v1gYxq0WaxvHTzrNG1sAxAkMdkxCiICgifwQ1TXLrorLtzdykmjnQmnz8A3Wqu
	 Y6qKTtpovr80fWI2be0m7CgReyIOesEIpb5RfYf7h4Zh9WuWxpZCCRL3SIJSpb68Id
	 /9/Eh9PWEHmyfn+TsSn/tOY6x9slIOD9Zlxo8GYUQZqzFxyIZCM0CDVMh9plK1PAaZ
	 PtX2j8yIEGsZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: bus: ti,omap-ocp2scp: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-ti-ocp2scp-v1-1-9d2885011cda@gmail.com>
References: <20260818-ti-ocp2scp-v1-1-9d2885011cda@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 16:42:49 +0000
Message-Id: <20260818164249.ADCF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Binding Schema Violation: `additionalProperties: type: object` is a=
n anti-pattern for allowing generic child nodes.
--

--- Patch [1]: [PATCH] dt-bindings: bus: ti,omap-ocp2scp: Convert to DT sch=
ema ---
commit 1199d265b1ac5f3fa059bb1936e3713c5ea7ac99
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: bus: ti,omap-ocp2scp: Convert to DT schema

This commit converts the ti,omap-ocp2scp bridge device tree bindings to
dt-schema. It updates required properties, marks ti,hwmods as deprecated,
and sets additionalProperties to type: object to represent various child
phy devices.

> diff --git a/Documentation/devicetree/bindings/bus/ti,omap-ocp2scp.yaml b=
/Documentation/devicetree/bindings/bus/ti,omap-ocp2scp.yaml
> new file mode 100644
> index 0000000000000..a8852185144dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/ti,omap-ocp2scp.yaml
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,am437x-ocp2scp
> +    then:
> +      properties:
> +        reg: false
> +    else:
> +      required:
> +        - reg
> +
> +additionalProperties:
> +  type: object

[Severity: Low]
Is it intentional to use type: object for additionalProperties instead of
patternProperties?

Relying on additionalProperties: type: object requires non-injected propert=
ies
to evaluate as objects rather than scalar or array values, which violates
json-schema semantics for standard properties.

Should this instead use patternProperties to explicitly match generic child
node names (e.g., "^[a-zA-Z0-9,\-_.]+(@[0-9a-fA-F]+)?$": type: object)
combined with additionalProperties: false?

> +
> +examples:
> +  - |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-ti-ocp2scp=
-v1-1-9d2885011cda@gmail.com?part=3D1
