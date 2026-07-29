Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B415245D5F5
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326347; cv=none; b=FIOxTc85blc4ilyLlJ5qsIfLlDHx9qwHimVnWIJrBzDJmkE8S+bsDba4XL2PLHwh+j4R7tB3x853eS3Ld6yOJef0/fA8geHf9ajueiA1Y0o7Ue8qDwxT5V9GSMkh681zxHssmSBJKNxEIy+LaKcHj/lFL4FeADmw2Cis+OJSVkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326347; c=relaxed/simple;
	bh=5Fyxb20o4sLedYC9ZHE/+/VMyUeXrMeIc7UgGt2n6Rg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c5SH61XAhpbhBevKSm1B4UaACFTAI0GM7dtcgstKCR2LX/VAmnYB19AXLFNmJS3kCjhMocE0LxWUFQTo3J0eAdHB/snsxJU60slRXnWV95VXDylg/K0MY6Cbasf1DYbXl/Hsr6gCCVaDcrROgzP3+J8NYewododjT3evbsWK9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXHJj932; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXHJj932"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D93D1F000E9;
	Wed, 29 Jul 2026 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785326346;
	bh=K2CgLS/+spJKMUpO/gEQ5A95XiQKoylqnDx1qFFVkFE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BXHJj932r2CwwtHtw38BnylLcrtx87Nve7ZB1oWd/b8kl+SbqeD7BmF66yMC2PNjn
	 dp/5BftDDJbNhHsrD91xM0t4lQIIFs2x7J5thUFDbFEqqkcYijQoZUBBpJgInp+y1b
	 DYVUCFyA/4FBgiErmHYEhVBMTbmLlRrX4hoHi+V4NHTLBZgVp+zM0qqayFjlJdHy8X
	 DGG9x5OBwYpz+tlJ1L5YrdeRqZnvfUOBeayUXtmICD2zzsFs8ry8yqy46X4nNlCG6D
	 ahbvevcHO3LfeHwaEYAkEMfdw1XdJom4UGTf8Am7XzWcXA88fD3c2067FcxGZl4a5T
	 Ls7hzQTOO94AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260729115022.222340-2-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
 <20260729115022.222340-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 11:59:05 +0000
Message-Id: <20260729115906.0D93D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `regulators` object node is missing the `additionalProperties: =
false` constraint.
--

--- Patch [1]: [PATCH v5 1/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl=
: Document RZ/G3L support ---
commit 222a9a4d47d2afbc7efadd9794f65d8f61be1bb8
Author: Biju Das <biju.das.jz@bp.renesas.com>
dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support

This commit documents the Renesas RZ/G3L (r9a08g046) USB PHY controller=20
bindings. It introduces a regulators sub-node to handle per-port vbus0 and=
=20
vbus1 entries, which replaces the single regulator-vbus property used by=20
other compatible SoCs.

> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy=
-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-c=
trl.yaml
> index c83469a1b379a..9e0c450976573 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.y=
aml
[ ... ]
> @@ -50,6 +51,28 @@ properties:
>      $ref: /schemas/regulator/regulator.yaml#
>      unevaluatedProperties: false
> =20
> +  regulators:
> +    type: object
> +    description:
> +      list of vbus regulators provided by this controller.
> +
> +    properties:

[Severity: Low]
Should this regulators object node include an additionalProperties: false
constraint?

Without it, any arbitrary or misspelled properties added inside the regulat=
ors
sub-node might silently pass schema validation.

> +      vbus0:
> +        type: object
> +        description: Port 1 USB VBUS regulator
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      vbus1:
> +        type: object
> +        description: Port 2 USB VBUS regulator
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729115022.2223=
40-1-biju.das.jz@bp.renesas.com?part=3D1
