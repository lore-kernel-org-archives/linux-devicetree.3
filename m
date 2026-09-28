Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF33932FC
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576775; cv=none; b=lst1r1tb3bV5DIO3zrMIAoNWv7smJbpOV0bpwjMfYel/vhowGJDX0/ePhZl0U56xg9kKSXu6GkPsD/NsEhpWOV2/jnYPPAQJcbZnDfsZH+lbVqwiEwE8mKhy4fMayNovKYSjVp5Wta3PjUpBvPKi6w/Ns5cz++J2VNevwRAnA0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576775; c=relaxed/simple;
	bh=anytGWEuTmx106JmuAHJK91MWXtioGoWInI7klyG45Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=itBP42DvtJfTemB3Kwoddvt5VOR1bgM9j7JwnfZBEjb66BTtL9hYpJlzTSsluiLdSeMigue3iZ6DNZj7IpoWrfLMd3rSDSrHrc8pOJcPyQAqMAMoxKSLuzQ8q2WxQ/DG8fJUKZmNPN1BxipPMPaQyoVK43fUbP4Y+EWaRVBDk8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCM5cHlG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCM5cHlG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB651F000FF;
	Mon, 28 Sep 2026 06:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790576773;
	bh=BoBkJyF6LTDruaVSlfFye+aJa68JbUExA1dKSDggWmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oCM5cHlGu3yJoz9TDQAfP2Pd+JoDcpBs97Ee4M97A/0aulecG9y6aP6xs2rD5oDaT
	 ZOdIH4liG5nl7Cwmc40gpk6Ael6f+dWnN7kiEdCStR0IrSUu8t3c4LX1jvVh/w04jd
	 iky0nph/vgiRqqQUD68T6noqwERv+xfVr2yQ3YLRCxe30xJJsF6A8xRkAr1gUIAekX
	 nJcIl54JkKTJ7r2nU0aYccX+JYhLFAGM2HZL7chTM+pejw2WuFK4oShqwg34iNbYsY
	 /I7Ow3Pg99fNBI+qqDFt+Y8B59i/PkbBc/jLUK+Xk1faq+eq9ZjgMu9r5SlScFCHPr
	 Kcxq/bO37UsvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v26 05/10] dt-bindings: arm: Document reboot mode magic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-5-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-5-b24e2348e8e1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 06:26:13 +0000
Message-Id: <20260928062613.7BB651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: ineffective unevaluatedProperties allows undocumented =
properties
- [Low] dt-bindings: missing maxItems constraint on mode-* arrays
--

commit b385b6956b70c623850aefcc8ceb50fda4b87cc0
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

dt-bindings: arm: Document reboot mode magic

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentat=
ion/devicetree/bindings/arm/psci.yaml
> index 0d04389c81faa..82ae25e7a3386 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
[ ... ]
> @@ -98,6 +98,39 @@ properties:
>        [1] Kernel documentation - ARM idle states bindings
>          Documentation/devicetree/bindings/cpu/idle-states.yaml
> =20
> +  reboot-mode:
> +    type: object
> +    $ref: /schemas/power/reset/reboot-mode.yaml#
> +    unevaluatedProperties: false

[Severity: Low]
Does unevaluatedProperties here effectively restrict undocumented propertie=
s?

The referenced schema /schemas/power/reset/reboot-mode.yaml# has an open
additionalProperties: true. Under JSON Schema evaluation rules, this causes
all properties to be annotated as successfully evaluated.

Consequently, unevaluatedProperties: false in the referencing schema becomes
a no-op, allowing any arbitrary property to pass validation silently.

> +    properties:
> +      # "mode-normal" is just SYSTEM_RESET
> +      mode-normal: false
> +    patternProperties:
> +      "^mode-.*$":
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 2

[Severity: Low]
Should this also include a maxItems constraint?

Providing a list of schemas to items constrains the initial array elements
but does not intrinsically limit the array's maximum length.

Without maxItems: 3, a device tree defining 4 or more cells for a reboot
mode will silently pass schema validation, violating the binding's up to
three 32-bit cells requirement.

> +        items:
> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
> +            minimum: 0x80000000
> +          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-=
cell form)
> +          - description: arg3 (cookie_lo in 3-cell form)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-arm-psci-s=
ystem_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com?part=3D5
