Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1140A3BB9F3
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623072; cv=none; b=spcRibleZ5vdBQc2r+/Z0duUpEJmswHeAaeH6o4Gk+O0hQeXb0/AaoSc/a/1gzfeut8IubNhuFcOXtf/fc7ObBoxbn0LJGbuJDr3o9RyTjvl9I92gt8fLK/HAJ4vA5c+EMXMADQhn3fif/E6a18yMHV3aCQXzqKXbNySu0quOO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623072; c=relaxed/simple;
	bh=3yVowRLYKXzvIcSEU2gaW4tD5UTDO+pLuaX3M2odkGU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uU81y8zTWu0g063P5O8vqRVeWa8+JjaRsA7U2Gx3IOXEf9Q2xDy036Rg6URKcIo4zfDxmdEN0Eo0DIz9htbDtxnUlTmnA8Q1qYwIP9aIYoLECV+J2byo2PqYrCo/4c38u1oZ5UjHfK8zCZtzIPNWz/mKUEkgPSVGFfoicwBz7Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTEzau9d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTEzau9d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7366E1F000E9;
	Tue, 21 Jul 2026 08:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623070;
	bh=IxANKGyjJPC/bETpIfTpVhNKdRhsp1/W/ZTbcnFVk7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NTEzau9dcPLn2nJe2h0UwILhBEu2G/XtCBDpG9gYQndr0IueJLLyYHE5pwi6s2pQi
	 SWHqR1jHr8jNiOgUgWC+MqTb1hZvCtwnHv/GuswG2Vuqu0fsFI5g0vs1AldAV7t7Bf
	 aQP5X67YG63wYsm2kzPS2vvPVdyIu2ZlBtfwdK5OQ7my7S2cfyzinXldtH0UTDQ8Rk
	 0mCQOwcvap6bX84wyWix71t6ek+wuPylT6xsR2+X+6Hu3tRTrGkBa6MrAZGCCEknrp
	 msq1Qb11gA+cjv7JaiFat3Lpn/KGMnZXuJ8w1eQhql0jvpFL9cTpg7yhB1RoALvBDU
	 M6A2YzzTDijBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add
 Eliza CDSP compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-remoteproc-eliza-cdsp-v2-1-f3345405e4da@oss.qualcomm.com>
References: <20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com>
 <20260721-remoteproc-eliza-cdsp-v2-1-f3345405e4da@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 08:37:49 +0000
Message-Id: <20260721083750.7366E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new conditional block for `qcom,eliza-cdsp-pas` does not enf=
orce the required number of power domains, allowing incomplete DT nodes to =
pass validation.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add =
Eliza CDSP compatible ---
commit fa71a885d3daa5490a402fba5912c99b4478260e
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,milos-pas: Add Eliza CDSP compatible

This commit documents the compatible string for the CDSP Peripheral
Authentication Service on the Eliza SoC. It adds a third memory region (DSM)
and the NSP power domain to the schema.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.=
yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
> index 99d7337e58ec5..97bcfb3bdf115 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
[ ... ]
> @@ -122,6 +144,24 @@ allOf:
>              - const: lcx
>              - const: lmx
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,eliza-cdsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +            - description: MX power domain
> +            - description: NSP power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +            - const: mx
> +            - const: nsp

[Severity: Medium]
Should power-domains and power-domain-names be appended to the required list
for this compatible string?

Without specifying minItems: 3 and adding the required directive for the
power domains, would an incomplete device tree node that omits the NSP power
domain silently pass schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-remoteproc=
-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com?part=3D1
