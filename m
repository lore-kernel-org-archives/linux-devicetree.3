Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F784582CB
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112825; cv=none; b=tkrs/iNDxn4+rFo5DLhrfZjzQHwMk0LAtdaTKPxOeIC7AeL7MuQVG10yf2E5QFYfRArd+GKIf4i4DhkoioG4/eeT66gP1RlQJSzf5F+OuQ5jEqcGEpi/tR+aBszofrErJltLYTMFP8f27w2N/sP1C/0ZcZPNFax58nyk6KcUdis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112825; c=relaxed/simple;
	bh=0pbVGJR+g1rTYOb4GNtw3TMdQWTX62sGySXJqhDTsXc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pKh7qg5An/IWlUKiWFumKJwaLpYBqT6KDfEyGVtbW/Xs2eEmTz5IkUg9NlSownMu8xyCnxqyfRaK8eOdPP02hBaQnLBSjHrJD+uQReyl/2le12mHD+e+Ow5tfhXlSQf4X5ksYN3dMljvTA0Q/67b5XRkkil6SsyRunU8I0GBO90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jbaxo9nG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jbaxo9nG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235ED1F00893;
	Fri, 11 Sep 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789112824;
	bh=iJaYRVpNQggPMAdfZwHLz3+csL4ulyujetDMhUylWkU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jbaxo9nGZDTcTNxdQhON39kEF3IBgQW5EoGdozIM0KLASuAmBvLt0txuTjTS2jzx7
	 XFCWTBCk4cFG3v5p5oqmLR8zEIAyDV0eRFFuE/k1qzf0NFZTRIQKmDdQ2yboKxY7EI
	 ezYIRsWv0JZ9q2UEAlbuVCWKtJt1slMF+geMMnC7g30KmsNwAMKD05cO0lXBbanVc2
	 MkOSrYisQkyj9qyWyIoIIUztwSMnuIZ0Qg5/gvEVzZ63odByBQslk+2LIoAzcszmL2
	 ZoKJCXHlCT8zYjyZJ8DB40FscYzojh/K/EauH5BSwTN8CPylrTRg59ucwNtQwqa3Od
	 z1b7C1SC3gdEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 2/2] dt-bindings: net: Document Motorcomm YT8824 PHY
 package
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260910074624.2426899-3-kyle.switch@motor-comm.com>
References: <20260910074624.2426899-1-kyle.switch@motor-comm.com>
 <20260910074624.2426899-3-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 07:47:03 +0000
Message-Id: <20260911074704.235ED1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Misuse of a standard hardware PHY ID string as the compatible st=
ring for an Ethernet PHY package container node.
- [Low] Mismatch between the node name unit-address and its 'reg' property =
in the example.
- [Low] The YAML binding completely omits the 'required' block, failing to =
enforce mandatory properties.
--

commit 086492b3eff200332b4ab4eddc5f5f7362981d4f
Author: Kyle Switch <kyle.switch@motor-comm.com>

dt-bindings: net: Document Motorcomm YT8824 PHY package

Motorcomm YT8824 Ethernet PHY is a PHY package of 4 PHY-s. This commit
documents the required property to make the PHY package correctly configure
and work.

> diff --git a/Documentation/devicetree/bindings/net/motorcomm,yt8824.yaml =
b/Documentation/devicetree/bindings/net/motorcomm,yt8824.yaml
> new file mode 100644
> index 0000000000000..9907a4a7e63e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/motorcomm,yt8824.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - ethernet-phy-id4f51.e8b8

[Severity: Medium]
Does this misuse a standard hardware PHY ID string as the compatible string
for an Ethernet PHY package container node?

dt-schema selects bindings based on the compatible property. Because
ethernet-phy-id4f51.e8b8 is an ID format strictly reserved for individual
hardware PHY child nodes (as defined by the pattern in ethernet-phy.yaml),
using it for the parent package container causes dt-schema to incorrectly
apply this package schema to individual child PHY nodes when running make
dt_binding_check on device trees containing these PHYs.

> +
> +  motorcomm,interface-mode:
> +    description: |
> +      PHY package interface mode.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - internal
> +      - usxgmii
> +    default: internal
> +
> +unevaluatedProperties: false
> +

[Severity: Low]
Does this YAML binding completely omit the required block, failing to enfor=
ce
mandatory properties?

Standard Device Tree schema design mandates that mandatory properties,
specifically compatible, be explicitly listed in a required block. Without
it, the schema validation will not enforce the presence of the compatible
property on matching nodes, leading to incomplete validation.

> +examples:
> +  - |
> +    mdio {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        ethernet-phy-package@0 {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +            compatible =3D "ethernet-phy-id4f51.e8b8";
> +            reg =3D <9>;

[Severity: Low]
Is there a mismatch between the node name unit-address and its reg property
in this example?

The example block defines the node as ethernet-phy-package@0 but specifies
reg =3D <9>. The Device Tree specification requires that the unit address in
the node name (the part after @) must exactly match the first address
specified in the reg property. This will cause a unit_address_vs_reg or
simple_bus_reg warning during compilation and validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910074624.2426=
899-1-kyle.switch@motor-comm.com?part=3D2
