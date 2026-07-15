Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7F332615
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124127; cv=none; b=WoinkZ5pV4eKyJ8ojkQggd4OPqZRlz2BoubHbmuXrlOWFnxfSVBq0MzYPVUHmdokodNV+WoXvcYink40FEPWW20a4TktuwkFoXOj+oa2ZdTBHHHFM86h39rYyAlAiZFNiCmoGRwYi+lbDpaRiznasiePveM8uuw4RKWJN4OE9MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124127; c=relaxed/simple;
	bh=zQCMSibRQ6SeYjM4f64vvgafoAD4SXnUIv+gUlTNtfE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KZ8ZRyF4Mw7WLCbqi1GT3JQ9jzTZSzvPrwBPqu8KcAOolLxYQsxYSXR0WWg28TiBisMJgIvAkAcw0DcifOlckyp/aC0vF34JTdgwLkMFMZnYk6clXXKy52/T2yhDA3pwKPc3aK6lENwxXVZFPdkc9F4jhW9cXMSVcu1xN8K/GBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Caj7Z9HX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Caj7Z9HX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0281F000E9;
	Wed, 15 Jul 2026 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784124126;
	bh=I314GUo6iztUvnJ+OirCSE/HO9oSbn8paseyG4ncbLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Caj7Z9HX64F3YY7Ae8Tn3NwPIKCgAYsWHDJDzbAcUJhSHrIC+XBimDvlMFPX7SGPf
	 m40njOZFrN/pWj5I9kxJm9G9ra8laF1P6QXgy396skzzttyJ/Wx6pIy6nwafVIT3cR
	 NuWOyfSP6IqG1IVF4dWK9A9nYX8NPlkCTtpabSTZlVooVeysY+Rf2qj5jHKwxxsGxU
	 VJ82uxUnGFuhe7XK+FKt4+17lTo/+HEbFXbEX6bIW8LlCWkaJtOUjRNDNNj0rNnO2a
	 oUXmy+Q71MGWiqM9Jk4Z+M4p28DvkXI0TiEkY3vP3L9kfkCZkV+5a/Dw7LFhOG2xd5
	 15yLE552b5cEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Add MediaTek MT6858 power
 domain controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolai Burov" <nikolai.burov@jolla.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-mt6858-pmdomain-v2-1-6293e87fc093@jolla.com>
References: <20260715-mt6858-pmdomain-v2-0-6293e87fc093@jolla.com>
 <20260715-mt6858-pmdomain-v2-1-6293e87fc093@jolla.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:02:05 +0000
Message-Id: <20260715140205.AA0281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The conditional block for `mediatek,mt6858-power-controller` doe=
s not enforce the required number of `access-controllers` phandles with exp=
licit `minItems` and `maxItems`.
- [Medium] Increasing the global `maxItems` for `access-controllers` from 3=
 to 6 relaxes validation rules for older hardware generations that do not h=
ave their own conditional overrides.
--

--- Patch [1]: [PATCH v2 1/3] dt-bindings: power: Add MediaTek MT6858 power=
 domain controller ---
commit eeb672419310866e8b79518dc171a08dbb0367dd
Author: Nikolai Burov <nikolai.burov@jolla.com>

dt-bindings: power: Add MediaTek MT6858 power domain controller

This patch introduces the compatible string and documents the bindings for
the power domain controller on the MediaTek MT6858 SoC.

> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-contr=
oller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-control=
ler.yaml
> index 070c6e5666dc0..d03e4a9251635 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.y=
aml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.y=
aml

[ ... ]

> @@ -56,7 +57,7 @@ properties:
>        faults while enabling or disabling a power domain.
>        For example, this may hold phandles to INFRACFG and SMI.
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 6

[Severity: Medium]
Does increasing this global limit unintentionally relax validation for
older hardware generations?

Because older platforms like mt6735 or mt6795 lack an explicit conditional
override, wouldn't they now erroneously pass validation even if they define
up to 6 access controllers? Is there a way to introduce a restrictive
conditional block for those older generations to retain their 3-item limit?

[ ... ]

>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt6858-power-controller
> +    then:
> +      properties:
> +        access-controllers:

[Severity: Medium]
Does this conditional block also need explicit minItems and maxItems
constraints set to 6?

In JSON Schema, providing a list of schemas under the items property only
validates the elements that are actually present. Because the global
minItems is 1, wouldn't an incomplete device tree node providing only 1 to 5
phandles silently pass validation here?

> +          items:
> +            - description: handle to INFRACFG register block
> +            - description: handle to IMG_SUB0 register block
> +            - description: handle to CAM_SUB1 register block
> +            - description: handle to CAM_SUB0 register block
> +            - description: handle to IPE_SUB0 register block
> +            - description: handle to VLPCFG register block
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-mt6858-pmd=
omain-v2-0-6293e87fc093@jolla.com?part=3D1
