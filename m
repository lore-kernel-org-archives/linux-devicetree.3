Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A35369D68
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238866; cv=none; b=fWvbXnyvWKYjYDEi8KDu+g4oACevssnMgyZxpYbjA/k4KsEIlPbIIie+ClakhRkoqDyKTOloz4aFheJuQjhjg3cdk5YYORQ5zcG/4gnQxM8rtsKMtwhmtrFfkzHEz8hkud8+S/n9D8GTO+Pf7bhzK6lZs1HdA4xxwoBcOAwuV1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238866; c=relaxed/simple;
	bh=H3gIzFcZSw5MYs9IPlCwIpuRtmnE7IUPericGFrPeCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qHBIVABZlba5tNXz9ImwWd7+JpKelWm+yDZaspq8ZXEVzwARii53Wh4qm9llMJTRxgOqsylEzhENzHHxvtiSuUSoIhqqyrtcgQij95vWdlPejFPt+MudpEwCisDojsRk5YLl091UWNX8Q0WuDtzAo76A9j8SGmOAFZ7SGRq6HjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSUETgz7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSUETgz7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFD21F000E9;
	Sun,  5 Jul 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783238863;
	bh=ZBMMxv6qL0rCS9DL6Fpp03sMDru/wng3nOAy8ixrLKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TSUETgz7I3rqAJ3TaS0ABnqTj9u/0mV3YdqWSdeu+K0vo2LXpLhsXWZCyGKi/zYtg
	 hyjJ1xiwuR3lorPy6oIRj0zZCFwMYgsvciIw+bufpemmoIsT0rjS94shRLo5QBrDAh
	 pImq1e11VACVfmv/6S2ObDEq5miAFo2LEIgEpQT7S8A0Fyj1gDNmLq1wGHBAHXzbyB
	 a9v+o0IR5OWG8x9yVHaXQvCZ29ZPZK5uB3cPfcNQI/2YxwYHD+DElx+Z/TZmZ4bi4e
	 j7tXpckrDIYA3uD7bsYW50ryYXGjYL8j6PC6ag1zgwH+5LMnjchoM72QE6spvvajT4
	 bTv7npKDsuAzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: phy: motorola,cpcap-usb: add
 chrg_det interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260705075809.1793784-3-ivo.g.dimitrov.75@gmail.com>
References: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
 <20260705075809.1793784-3-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 08:07:42 +0000
Message-Id: <20260705080743.1EFD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] DT Schema validation failure due to mismatched interrupt order in e=
xamples.
- [Low] DT Binding ABI Breakage by enforcing a backward-incompatible interr=
upt order.
--

commit 99e058efdaf5b3537435adf0f22c2c642d7b8007
Author: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt

The CPCAP USB PHY driver uses the CPCAP charger detection interrupt
for DCP detection. Update the binding and example DTS to use the
corresponding chrg_det interrupt name.

> diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy=
.yaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> index dd345cbd0a0b4..62121a8d8e76c 100644
> --- a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> @@ -28,6 +28,7 @@ properties:
>        - description: sessvld interrupt
>        - description: sessend interrupt
>        - description: se1 interrupt
> +      - description: charger detection interrupt
>        - description: dm interrupt
>        - description: dp interrupt
> =20
> @@ -41,6 +42,7 @@ properties:
>        - const: sessvld
>        - const: sessend
>        - const: se1
> +      - const: chrg_det
>        - const: dm
>        - const: dp

[Severity: Low]
Does adding this new interrupt in the middle of the items list break backwa=
rd
compatibility for existing device trees?

By inserting it at index 7 (before dm and dp) without configuring minItems,=
 the
schema now implicitly requires all 10 items in this strict order.

Existing device trees that only define 9 interrupts will fail validation be=
cause
their 7th item is dm instead of chrg_det.

[ ... ]

> @@ -91,10 +93,10 @@ examples:
>          interrupts-extended =3D <
>              &cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
>              &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
> -            &cpcap 48 1
> +            &cpcap 48 1 &cpcap 13 0
>          >;
>          interrupt-names =3D "id_ground", "id_float", "se0conn", "vbusvld=
",
> -                          "sessvld", "sessend", "se1", "dm", "dp";
> +                          "sessvld", "sessend", "se1", "dm", "dp", "chrg=
_det";

[Severity: Low]
Will this example pass dt_binding_check validation?

The schema's properties block was updated above to expect chrg_det at index=
 7,
before dm and dp. However, the example appends chrg_det to the end of the l=
ist
at index 9.

YAML lists enforce positional matches, so validation might fail when it com=
pares
the example's dm at index 7 against the newly expected chrg_det.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705075809.1793=
784-1-ivo.g.dimitrov.75@gmail.com?part=3D2
