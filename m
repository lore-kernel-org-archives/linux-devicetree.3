Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A70478870
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036951; cv=none; b=fN0FFzuEM+M7m7XSx+scAWiyGWwLJEXE+t7YcvKf8Grkxc+thauBYJpZ9AHI5lDuMzlcnzyPbWtu+GT9kuc1hO8Bme+Ns5I/KcKy/pUYkdrlItPuZihy8aMSwCpvueYA4qpoRLUvVbAiG162dZdtpLI+GILpzzh+W9/4Y8hkHtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036951; c=relaxed/simple;
	bh=cBh4dx4waSl7/OdDdeK4Jv1v3P0QeiygWQstqwW1nv8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RS696JB6VbwoqO+E3FGCAxjp4CDwrqMHTqolJ+CH8G/0D+rbFdmAeSNIe5ukgGiiU1tiz/jGZrt6LrSAnpkqvoqTICCUXUxk0qSMm+rTj3glguiuvMVAeJFdsjD8OGqt7g3JzGagfs4dSCC1BMo0u2xymETc0kzrUBrTH8wO/20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHtTK98D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHtTK98D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8081F000E9;
	Tue, 14 Jul 2026 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784036949;
	bh=TxQXoKfQpRTQbSHuToaB2w55Wnc1lSJplHiJdzLvPDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RHtTK98DF+OlWFthCQdl2eqy6gMas4XWI7jhZAtcOttH4ferFgGYTQ0EHFfG1kDT6
	 M7GIstDh5BHlj57oo2tWh0FkarcRrKKhy+76yLH5QrKR3HbUMXqA4mVF9AildnmENx
	 rK28zRVfeNNWdLFAdRjWeXvvEEDrANHAT/z4AdnwVpHv4kZ7gibfNtBs+PewAWKcXv
	 ofZHssD8SY9yepyaVVRCuRTTC2RcvO6d1QD/lUuFu0zICwxWNhM1MSdL4jmoOWkKFC
	 6x+jKUV4rTuTeyNBrXHW7Ngs1SP/TeMZTh2K4FzhCYjrHJxgoF0i0sZkx+8ghrDOXd
	 VXX1Mqs60VXNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: Add MediaTek MT6858 power
 domain controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolai Burov" <nikolai.burov@jolla.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260714-mt6858-pmdomain-v1-1-4f09bbb822e0@jolla.com>
References: <20260714-mt6858-pmdomain-v1-0-4f09bbb822e0@jolla.com>
 <20260714-mt6858-pmdomain-v1-1-4f09bbb822e0@jolla.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 13:49:08 +0000
Message-Id: <20260714134909.4F8081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The conditional block for 'mediatek,mt6858-power-controller' def=
ines 6 items for 'access-controllers' but omits 'minItems: 6', allowing dev=
ice trees with incomplete configurations to silently pass validation.
- [Medium] Increasing the global `maxItems` for `access-controllers` from 3=
 to 6 relaxes validation constraints for older compatible strings.
--

--- Patch [1]: [PATCH 1/3] dt-bindings: power: Add MediaTek MT6858 power do=
main controller ---
commit 45a85a0c0fa43cfb779c99ce538116e8c4ab742f
Author: Nikolai Burov <nikolai.burov@jolla.com>

dt-bindings: power: Add MediaTek MT6858 power domain controller

Add a new compatible and document bindings for the power domain
controller of the MT6858 SoC.

> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-contr=
oller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-control=
ler.yaml
> index 07f046277f8a6..eecb95323bfbe 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.y=
aml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.y=
aml

[ ... ]

> @@ -55,7 +56,7 @@ properties:
>        faults while enabling or disabling a power domain.
>        For example, this may hold phandles to INFRACFG and SMI.
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 6

[Severity: Medium]
Does increasing the global maxItems to 6 inadvertently relax the validation
constraints for older compatible strings (such as MT6735 or MT6795) that we=
re
previously capped at 3? Should the tighter bounds be explicitly maintained =
for
those older platforms using an if-then block?

> =20
>  patternProperties:
>    "^power-domain@[0-9a-f]+$":

[ ... ]

> @@ -155,6 +157,23 @@ required:
>    - compatible
> =20
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
> +          items:
> +            - description: handle to INFRACFG register block
> +            - description: handle to IMG_SUB0 register block
> +            - description: handle to CAM_SUB1 register block
> +            - description: handle to CAM_SUB0 register block
> +            - description: handle to IPE_SUB0 register block
> +            - description: handle to VLPCFG register block

[Severity: Medium]
Should there be a minItems: 6 constraint added to this block to enforce the
presence of all 6 items? Without it, would an incomplete MT6858 device tree
that provides fewer than 6 controllers silently pass validation?

> +
>    - if:
>        properties:
>          compatible:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-mt6858-pmd=
omain-v1-0-4f09bbb822e0@jolla.com?part=3D1
