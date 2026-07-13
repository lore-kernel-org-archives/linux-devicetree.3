Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BF63E6DE0
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937998; cv=none; b=A/1QakIt36iCyKrcCg2/RsOeX9h7coRodqevUU2jJ6McNRhUtW0ZRPPJYUHFpmuhFyuzavwPPmy7wadMjanhoaMPMSt8PVAdRxo8xJ2Sb0G3288pAFsbFZCZGzN8Q7AsgRTOr2+j1JW5sawlQjbL4+uz7ebyHC/WD6U3O4fCPzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937998; c=relaxed/simple;
	bh=aPEuKEc+1r9VFu/zlXuIiIPx2ylxLkYlSii8PBwrcuM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k+6tUC4PVJKn2m4QWtmONbU+rBdgTt9qZuzh0kwVMxRhr+ptFKILnNOYy57UQt7rCFJ7PsKcjjK6n8Q28KuUwvMDzTnmWitdzTUmoxEUC0BCZ2Pp293af9ZKJX6TBg46UlMEFQOWTMh1CuZLPHemE2vG2YIT9MSKFv2Oj+E13QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9iCy6Rw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9iCy6Rw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173271F00A3A;
	Mon, 13 Jul 2026 10:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783937997;
	bh=UrLIYXktIVcRcvWHKwU+XWLuReTnMa5Cl7m9fq4jPXk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n9iCy6RwsSHdLwKFdmshmRzn4/aVfsBtKr/m3CSquQ1biUfe2GD2FEXzcd681LU9O
	 bcA7xmRFGK7eHZh36ANOQXNO830EwfInjJlKRF94Uezsic55wFzEqR+QoLjSHhaShV
	 kPUlVqDQYAHNNOqbcMq4d2izLNrSBRfoHN8h2jZgZV54cSwQTJzzBMHbtrD+kgdCrG
	 EF58dQybgKuh8y+rQNUYaR5RDLGTv3+ZW3vwB/jf0U7a0obU2EXUxHNS53LgN5Ypnt
	 cqVr4DLxioikQcyFnKThjkRtIvPtmLs45Z1mxQAtZlK+RfjNvlrbZZEbHSYrDg35N2
	 Vl5Wh2Xc2u8Cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: mediatek: mt6397: add mt6323
 PMIC EFUSE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713-mt6323-nvmem-v3-1-205c39267a24@protonmail.com>
References: <20260713-mt6323-nvmem-v3-0-205c39267a24@protonmail.com>
 <20260713-mt6323-nvmem-v3-1-205c39267a24@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 10:19:56 +0000
Message-Id: <20260713101957.173271F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `efuse` node schema sets `unevaluatedProperties: false` but =
omits the reference to the standard NVMEM subsystem schema (`/schemas/nvmem=
/nvmem.yaml#`), rejecting valid generic NVMEM properties.
- [Low] The commit message description begins with a lowercase letter, viol=
ating MFD subsystem guidelines.
--

--- Patch [1]: [PATCH v3 1/3] dt-bindings: mfd: mediatek: mt6397: add mt632=
3 PMIC EFUSE ---
commit 26cbf9fd727c6628394df9e87fedf646b54dc080
Author: Roman Vivchar <rva333@protonmail.com>

dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE

The MediaTek mt6323 PMIC includes an EFUSE used for storing calibration
data.

> dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE

[Severity: Low]
This isn't a bug, but the commit description starts with a lowercase letter.
Should the description after the subsystem prefix be capitalized according =
to
MFD subsystem conventions?

> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -159,6 +159,23 @@ properties:

[ ... ]

> +  efuse:
> +    type: object
> +    unevaluatedProperties: false
> +    description:
> +      The efuse is responsible for storing calibration data, such as the=
rmal
> +      sensor calibration.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt6323-efuse
> +
> +      nvmem-layout:
> +        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#

[Severity: Medium]
Since this node uses unevaluatedProperties: false, does it also need a
reference to the standard NVMEM schema ($ref: /schemas/nvmem/nvmem.yaml#)?

Without it, wouldn't standard NVMEM properties like read-only or wp-gpios
cause schema validation failures if they are added?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-mt6323-nvm=
em-v3-0-205c39267a24@protonmail.com?part=3D1
