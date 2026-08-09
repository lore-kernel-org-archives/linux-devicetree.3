Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D269925A321
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786294567; cv=none; b=qd3pTADb/YB8ktUNkVXC6c6hx5f6om1WIJQEJsWRxzniB2LPWqw4aDLOaPEsJR1jZcIMtym8U1Gtmzwug84Cn7kLTh8eKPkjOgO7Icckn/L8aMPADC02qNizUvFZ+QRsrilj9IloWDjDD6S8qkT1Jhj0hoIQn5PIQWJ2FznJdJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786294567; c=relaxed/simple;
	bh=ahrnEAXitHe3wFvJ6UgBiMtWd1455AejPa+PedCMfFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RA3tphbwhjE/JjQJ6+BVLwt+IZ31NN24HKZ0J5QiZjY8dWf9LL27sIzWtwHBQCUBRvQYX80VyA7RgDGGfjrNNqZIbGG+12HJPTkCLDiZvmJCdLJy78Bs2iu/DDLcGu8HgiiP7WglSq1F/Oo5XZOVQr9YUlcFgxQvPsaGuZJO11s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k76r07zJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k76r07zJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000971F000E9;
	Sun,  9 Aug 2026 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786294566;
	bh=tBBiAaRAuqEyKizky1K+hit9m/fp27sqBXBsfs8rjUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k76r07zJpY2jcHsVkTStJ/YhbuMAKMAoQ+c9ISciAxigQdYOkEAtTzc0pt9t0StIB
	 gDWm9rr5kgDtwEUeB3A4Nq2DHUtP57DI6IY3GFKw6i679QfrDFUUxPgYTQCVTAWUY4
	 zMYD8Syp3FaO3CmlluPDW2VTercWKkThwJeBNVO6Rb0+pf3DhCJwGiitLiDnqwpwap
	 uMDoCGWLXsBFx7391FBbUHYFHI+Jv4ugnf5qf5BDM7fn8gQrdJSmVq7Brp3Zo1TwCc
	 DkW1CuiuwNd22Mzrq2C1f4169A+9kGLqFOVEGMXQCh9koE/vzIh6U6/dFRBUqDf/BO
	 sZikx1m6hOoCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi 8 family
 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260809-dipper-v1-1-eb4d501e85df@ixit.cz>
References: <20260809-dipper-v1-0-eb4d501e85df@ixit.cz>
 <20260809-dipper-v1-1-eb4d501e85df@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 16:56:05 +0000
Message-Id: <20260809165606.000971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The compatible string `xiaomi,dipper` is added to two mutually e=
xclusive schema blocks with conflicting constraints, allowing incomplete co=
mpatible lists to silently pass validation.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi 8 family c=
ompatibles ---
commit 303d802416f225c92da471f33c7f3f2a3dcb2b9c
Author: David Heidelberg <david@ixit.cz>
dt-bindings: arm: qcom: Add Xiaomi Mi 8 family compatibles

This commit adds device tree binding compatibles for the Xiaomi Mi 8 smartp=
hone
family, codenamed dipper, and documents variants such as ursa and equuleus.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index ff8a35df7862d..6309f8ab02fba 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -950,6 +950,15 @@ properties:
>            - const: google,bonito
>            - const: qcom,sdm670
> =20
> +      - description: Xiaomi Mi 8 family
> +        items:
> +          - enum:
> +              - xiaomi,dipper
> +              - xiaomi,equuleus
> +              - xiaomi,ursa
> +          - const: xiaomi,dipper-common
> +          - const: qcom,sdm845
> +

[ ... ]

> @@ -976,6 +985,7 @@ properties:
>                - sony,akatsuki-row
>                - sony,apollo-row
>                - thundercomm,db845c
> +              - xiaomi,dipper
>                - xiaomi,polaris
>            - const: qcom,sdm845

[Severity: Medium]
Was xiaomi,dipper mistakenly added to this 2-element block as well?

Since xiaomi,dipper is already defined in the 3-element Xiaomi Mi 8 family
block above, adding it here introduces a regression in schema validation.
A device tree using an incomplete compatible array like=20
["xiaomi,dipper", "qcom,sdm845"] will pass schema validation by matching th=
is
block, completely bypassing the requirement for the "xiaomi,dipper-common"
fallback string.

Would removing it from this generic list ensure the intermediate fallback is
properly enforced for the dipper board?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-dipper-v1-=
0-eb4d501e85df@ixit.cz?part=3D1
