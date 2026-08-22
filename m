Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9351F3E16AE
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787415461; cv=none; b=Ds7Zac0qgJT2hMm0nRZmIRqMPupCZlOBMSDPC7JQP+L4WMfoBMn/M/8g24v7Nvr1l/vTkZQFTaUdNzeu/XPBFOo8x4OMNdJkDi/h2DL2S1kebpjAleNtBPghMTzSbbqjw5Vpo0iLc4tpgoJdVBGKZx4gImvo9gfru78Q/yxQdH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787415461; c=relaxed/simple;
	bh=S5tJbMRFV46p8ViIjtHmsXQOI0NhLv1d/45xDom/e5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JMlnsKUj5CzGw5SxuGR+qjczsQGCBuO6JDsTViIEBzgkCHNZlubN0gDNYeZp7sd36AmJWPRE4XY3xcK4lq5CRAq2txkDZgUJ81r4CVVSalyT9GpKAL3Pb4iNaHeimQwBDQjHtXuQLV06jMOWC917SeeWnEgvtpSP4gpHVJbM/hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsDh7V8Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsDh7V8Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06381F00ACA;
	Sat, 22 Aug 2026 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787415459;
	bh=OXmhhMqcAV8GyLtxTKqHpp9wtSkRjVKzL/pbLlM/o6s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LsDh7V8ZrZY3937VcRFsNLO1XSSkxpr4HRSif7Q8Q9zRyO3TkzSYJHqLrbeDtjUwE
	 oX82hFheOSCOQOkNpKJhXvPnzIfX0bcrC+XxRutPW1vpP4JezYfMaZNJ4CbAxK1p+f
	 AiMYiqd116ObutmVDXrV95vqgFNUd/oLdBire75UQOEFPJT2E6s9K4A6qUb3uzypBy
	 ZXSBDZn/dkWtXSy7T1DNMomam5T/BE33YgTU0ieIR/Fw5I8x7MRWMkC6xVa1xw/0Hu
	 /555r4Buu3OxVSWKiz+sJKlCKAXTBRV7Uv8DbFnW1L7d6W9uL9m3DNMuZ3AJ7dB6ey
	 UFJ7937oTUSmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260822-ti-pinctrl-palmas-v2-1-501c9c670e4f@gmail.com>
References: <20260822-ti-pinctrl-palmas-v2-1-501c9c670e4f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 16:17:38 +0000
Message-Id: <20260822161738.C06381F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Top-level `additionalProperties: false` incorrectly rejects prop=
erties from `$ref`.
- [Low] The dt-schema example fails to compile with dtc due to a missing no=
de label referenced by a phandle.
--

--- Patch [1]: [PATCH v2] dt-bindings: pinctrl: ti,pinctrl-palmas: Convert =
to DT schema ---
commit c7d2f1369b4c397f6cd83791ed0ce6eb90fe3adf
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to DT schema

Convert TI Palmas pin control text binding to DT schema. The legacy
binding allowed any subnode name. Restrict them to standard prefixes to
prevent the validator from accidentally evaluating standard integer
properties (like phandle) as child nodes.

Link: https://lore.kernel.org/r/20260822-ti-pinctrl-palmas-v1-1-a4d49e7f2da=
b@gmail.com

> diff --git a/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.=
yaml b/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml
> new file mode 100644
> index 0000000000000..c07e3a782ef07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml

[ ... ]

> +required:
> +  - compatible
> +
> +additionalProperties: false

[Severity: Medium]
Since this binding includes allOf: - $ref: pinctrl.yaml#, won't
additionalProperties: false incorrectly reject standard pinctrl properties?

Should this be unevaluatedProperties: false instead so that the schema
properly accounts for the inherited $ref properties?

> +
> +examples:
> +  - |
> +    pmic {
> +        pinctrl {
> +            compatible =3D "ti,tps65913-pinctrl";
> +            ti,palmas-enable-dvfs1;
> +            pinctrl-names =3D "default";
> +            pinctrl-0 =3D <&palmas_pins_state>;
> +
> +            pinmux {

[Severity: Low]
The phandle <&palmas_pins_state> is referenced here, but the corresponding
label palmas_pins_state: appears to have been omitted from the pinmux node
during the text-to-yaml conversion.

Will this cause the dt-schema example to fail compilation with dtc due to
the unresolvable phandle?

> +                gpio0 {
> +                    pins =3D "gpio0";
> +                    function =3D "id";
> +                    bias-pull-up;
> +                };

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822-ti-pinctrl=
-palmas-v2-1-501c9c670e4f@gmail.com?part=3D1
