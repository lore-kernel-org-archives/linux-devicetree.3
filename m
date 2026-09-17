Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2174BE437
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642867; cv=none; b=HScPI+/bNfcFHYMRpi0kDL1aYm+zoJMW9lcJqgTsbTowWhAnZurbvGpZTKQSKsz3dSDl4QsoOLCObvVR0ji+WUJNHNcas/LnC9IaAQg2EMHGKiO6xB4i1Y7eFMK4ur1iysZv62U3KA4DT3dXLTFWVyCKPMNpoPUoFKwm2pX3Ny8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642867; c=relaxed/simple;
	bh=WIQdzmrovqnICXFlcgwBQTpxotHwpqiO6qN5FrCt5qo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QK5+ig1g63mBKRJEIVpdrQomwYqQDuAlHuOZIxAaLZX7K6Tx8deNUSlCmRGdgksL/fqB44UVZBToqE9RN9R0yN1rn3O/PoTcwRMzW3NLE7T1Cl6Usoc3FSsJZNjRu6MPmDoHey0hMcy/wzgKA/iVMNqKaSxv7OFCdMTqgW+i0M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwufuXat; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwufuXat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190D61F00893;
	Thu, 17 Sep 2026 11:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789642855;
	bh=C0mEoG8ujq3c0SSgXNt5AbiZ+zoK0bpWmBinZuGxnC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nwufuXatdQdpV1pwNFglSpA8TNmLAMYzbHSpjdFJr60fK2bGpBwI08yJzfaPt1eEh
	 Oecsj8s/YYZ/Lj0tI48/yQ2wRlWTFXlhganFVdbYaZdJgIBNjDExKYLBtWMkJFsOdE
	 WHy8BZQUPyVoFLw7IOFrd3BcuDItNcEAIE6bOXaWur5z5R2YxuonCaW1xfOl/XrqSO
	 ArBYaMF647msDZ+fcRG099O5N+3v83vdykg7awPEPagsgukfMPma5RS1NBdKl7rUpY
	 pffQ240ICMUqKbNfxqepMeSZnLtnXY3mwI3nsWKQD+DJdH3mUJXWu6kvWdu3zfyVkl
	 625zP3QUBc9yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 1/3] dt-bindings: net: Document Motorcomm
 YT8824 PHY package
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916105504.3262767-2-kyle.switch@motor-comm.com>
References: <20260916105504.3262767-1-kyle.switch@motor-comm.com>
 <20260916105504.3262767-2-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 11:00:54 +0000
Message-Id: <20260917110055.190D61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: net: motorcomm,yt8824: missing phy-mode property defin=
ition
- [Low] dt-bindings: net: motorcomm,yt8824: unit address vs reg mismatch in=
 example
--

commit 27c278ec90007d3b5c93bdcce12996609edd6cb2
Author: Kyle Switch <kyle.switch@motor-comm.com>

dt-bindings: net: Document Motorcomm YT8824 PHY package

Motorcomm YT8824 Ethernet PHY is a PHY package of 4 PHYs.

> diff --git a/Documentation/devicetree/bindings/net/motorcomm,yt8824.yaml =
b/Documentation/devicetree/bindings/net/motorcomm,yt8824.yaml
> new file mode 100644
> index 0000000000000..93e9f765404a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/motorcomm,yt8824.yaml
> @@ -0,0 +1,59 @@
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - motorcomm,yt8824-package
> +
> +required:
> +  - compatible
> +  - phy-mode

[Severity: Low]
Will this fail `make dt_binding_check`?

It looks like phy-mode is mandated as required here, but there is no
accompanying definition for it in the properties block. Because
`unevaluatedProperties: false` is set below, using this undeclared property
in the example will trigger a schema evaluation error.

> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mdio {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        ethernet-phy-package@0 {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +            compatible =3D "motorcomm,yt8824-package";
> +            reg =3D <9>;

[Severity: Low]
Is this unit address intentional?

The example's node uses a unit address of @0, but the reg property is set to
9, which conflicts directly and will cause the Device Tree compiler to emit
a `unit_address_vs_reg` warning.

> +
> +            phy-mode =3D "internal";
> +
> +            ethernet-phy@4 {
> +                reg =3D <4>;
> +            };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916105504.3262=
767-1-kyle.switch@motor-comm.com?part=3D1
