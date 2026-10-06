Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4239425B0BD
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318229; cv=none; b=gTHfqYOX/6LHEHen5qiYJRyx4eDqnE1Uvo4G8KyxFlogLqKAHUckaas6gKt3fvnPusxVn14HMcWg/tZ10ZY7bU7MCeuhhjbVho+Ri3eJv6tY9j8JVpSJOfU3p5OpbVHRLFcf6IkUTXQqsvRPhLDF5WNGfhNiXFqsPrd7aJC091w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318229; c=relaxed/simple;
	bh=OuhouRFSgXc9SKBp4mNmbvAF+Y7o5Am4Ej72IPMGqQg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QJlvYLYM6XjHe0i9mgqi/GbAROsmodJ1dSCAZ1Q4fpPRTVVuC+MqU4tEagAc/i9YSR7TidADqfCo51xbpB8huunrJqi2aZVCrqkwZhInSlglrWdFMdHI2Nfp5A8SpVPPWErgOZUfjLuj6g0sUmhspGd3rdKcNc6FKKzXGOyQv8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJkjsLXZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJkjsLXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB411F0089B;
	Tue,  6 Oct 2026 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791318227;
	bh=yCwRyM2IY/tuaZrbV29cfApQA9vGIzHUoOiITmq2f2k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJkjsLXZdCzTNXp08sP9pzN/hllpwg08U8xVbjuMPxPe+7QkiwRIh1jeM4Ut7YkGU
	 OL9ODDgK8l7O79NZKzbwhH7Qud2r70+oCoWa8o6pRLoOmt2KMiKc8du2F7BrA6OJ59
	 VVft2gENQrpSxz8P4+aoAjQqEhrcEDQiJT05Qxz/2FTqY1kT2fH2VvtSdBII781uGB
	 zL/bBKNHkgozozTkxzPUZIbcKLTrAEbN5saelJJo5aAae7o4sWxElT8BSppwjurL0J
	 nabXaEvc3hIMF7uRnDMp/q2WcwJskfsMKd/ZfyePjZofVf04K7pMyJEe67fH2MVgru
	 xxWV1LDVkC81g==
Message-ID: <sashiko-outbox-162426@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: realtek,rtl82xx:
 document RTL8224 packages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oskari Lemmela" <oskari@lemmela.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005201540.913977-2-oskari@lemmela.net>
References: <20261005201540.913977-1-oskari@lemmela.net>
 <20261005201540.913977-2-oskari@lemmela.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 20:23:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: net: generic compatible in example fails schema valida=
tion
--

commit 6e9280e0153fb3196c44f745f9db18bcf7971400
Author: Oskari Lemmela <oskari@lemmela.net>

dt-bindings: net: realtek,rtl82xx: document RTL8224 packages

This commit updates the realtek,rtl82xx bindings to document RTL8224 PHY
packages and adds an example demonstrating multiple child PHY nodes within =
an
ethernet-phy-package.

> diff --git a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml b=
/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
> index 07b39ef1fc624..ca52c3ae19f7a 100644
> --- a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
> +++ b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
[ ... ]
> @@ -90,9 +100,45 @@ examples:
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
> =20
[ ... ]
> +        ethernet-phy-package@1 {
> +            reg =3D <1>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            ethernet-phy@1 {
> +                compatible =3D "ethernet-phy-ieee802.3-c45";

[Severity: Low]
Does this generic compatible string cause a schema validation warning during
make dt_binding_check?=20

Because this generic string is not listed in the schema's compatible enum,
the implicit select logic generated for this schema fails to match the
example node. The dt-schema tool strictly requires examples to match their
enclosing schema, so this mismatch will trigger a validation error.

> +                reg =3D <1>;
> +                enet-phy-pair-order =3D <0>;
> +            };
> +
> +            ethernet-phy@2 {
> +                compatible =3D "ethernet-phy-ieee802.3-c45";
> +                reg =3D <2>;
> +                enet-phy-pair-order =3D <0>;
> +            };
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005201540.9139=
77-1-oskari@lemmela.net?part=3D1
