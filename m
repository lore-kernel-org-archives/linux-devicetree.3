Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579353B27CF
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 12:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857413; cv=none; b=mFwHXjanWbrsjFHvNdduBko/RLsSmXFl+OJ0Lv40D2ORN4C4aqYrJZeN7GoRBu0pMBq7sDFLulKewRvWgmPjAq15pEkmPnNJKQJJNzHdmRe7B43VeRXdw7btIGRtkpxjxpilHLDwLKswnxz7Xqyrylc5fm4K/g/lR2l/pzCzzTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857413; c=relaxed/simple;
	bh=RWbJok8DZ/LlLhmSDtiEGczuRXjlNmKI5/MXEFydqhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nVuMMtkFnY03uJDkbKF26c05O6pJbpoJHqxVqMhUpXIMJOQp6+kS1qnhW4zDo4Q9o5HRMeB4pA7GrenR1hAES7ZC44FNK2iDG5dLzM7sauJGcz0Z2/Tapdd0rtxIv326kY+jrAKzsVL+aeUjGaEmNxUdlg7eyAvk/mL63UcTBus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmamVssK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmamVssK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69DE1F00898;
	Thu,  1 Oct 2026 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790857412;
	bh=5yNviBJx/GY4Xp0NmfCbqGp6BvpVfSUgYvJlqai4SPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UmamVssK4aWsOnBKY2e7WCluiMCV0NKa2+y195MbsJR5U4Bp8iqEX3t1xz99JClxa
	 TS7nZDPFUpeauIzs2mVH0Suf1TAghMlaes+IaJmMjoyU3VlHXo18myFV8m8g2nNoPD
	 my9T1AfAzrekupZQKr5Ky+Txdd7WAbn0KxwrVhYc2iFZSgNP4znZNRQpXxN6ZFhYI5
	 O3P1k7TqIOrWouIniFGPeybuuEavQM0PgK8ZXDtBFkia3Ghje51UXXe9i0uybsvhTy
	 oVvOr4EP/vdHoe8vHP1Cy0H3kR4WS5GahUtl0obuxAlcN+7I4d8C2quQB8elebXKkt
	 1sKCLCmBWXVrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: net: maxlinear: add MxL86211C MDIO I/O
 regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930122305.293686-1-robert.marko@sartura.hr>
References: <20260930122305.293686-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 12:23:31 +0000
Message-Id: <20261001122331.B69DE1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: maxlinear: PHY incorrectly modeled as regulato=
r provider instead of consumer
- [Medium] dt-bindings: net: maxlinear: missing 'vddp-supply' definition br=
eaks dt-schema validation
- [Low] dt-bindings: net: maxlinear: schema property 'mdio-regulator' lacks=
 top-level definition
--

commit 03684e9eca992ab6bfa5c8f894e3de06a76d36a7
Author: Robert Marko <robert.marko@sartura.hr>

dt-bindings: net: maxlinear: add MxL86211C MDIO I/O regulator
   =20
Document the MDIO I/O voltage regulator exposed by the MxL86211C PHY.
The regulator configures the MDIO, MDC, and MDINT pad voltage between 1.8 V
and 3.3 V.

> diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml =
b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> index 8a3713abd1ca9..0645e885f1747 100644
> --- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> +++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> @@ -12,6 +12,29 @@ maintainers:
> =20
>  allOf:
>    - $ref: ethernet-phy.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ethernet-phy-idc133.5400
> +      required:
> +        - compatible
> +
> +    then:
> +      properties:
> +        mdio-regulator:

[Severity: Low]
Is it standard practice to define properties exclusively inside the allOf
conditional branch?

Standard dt-schema convention requires all properties to be explicitly defi=
ned
in the top-level properties block, using conditional blocks only to apply
restrictions or to disallow the property for specific compatibles.

> +          type: object
> +          description: |
> +            Initial data for the MxL86211C MDIO I/O voltage regulator. S=
et
> +            this to 1.8 V or 3.3 V to configure the MDIO, MDC, and MDINT
> +            pad voltage. The board must supply the VDDP pin at the selec=
ted
> +            voltage.
> +          $ref: /schemas/regulator/regulator.yaml#

[Severity: Medium]
Does this misrepresent the physical hardware topology by modeling the PHY
as a regulator provider?

Since the documentation states "The board must supply the VDDP pin", the PHY
is a power consumer. In Device Tree, an external hardware supply must be
modeled as a consumer property (e.g., vddp-supply). Modeling this as an
mdio-regulator provider node referencing regulator.yaml appears to be
an architectural abuse of the framework.

Shouldn't the PHY driver read this supply via regulator_get_voltage() to
configure its registers instead of registering a dummy regulator provider?

[Severity: Medium]
Will valid device trees that accurately model the VDDP hardware supply fail
dt_binding_check validation?

The documentation explicitly mandates that the board must supply the VDDP p=
in,
meaning a correct hardware description requires a vddp-supply property.
However, the schema contains unevaluatedProperties: false but omits the
definition of vddp-supply.

Since neither this schema nor ethernet-phy.yaml implicitly allows vddp-supp=
ly,
won't this cause validation errors for users who correctly model the physic=
al
hardware?

> +          unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930122305.2936=
86-1-robert.marko@sartura.hr?part=3D1
