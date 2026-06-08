Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4A531578E
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 04:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780893022; cv=none; b=IrhEZlnEu6q6eF6obXLSspEt1HuNSlNYUDF6HKxoBEcZEfgujGeW0Y2rgjk+l1dit6+X94lBsjktpVrv2n3dVju4XqdkJfHH0a3qpovBPa3QtNfu/s8h2DKAfqp4jm+nZTqich/CCFOa9jtoJZuiCmcdO0IiAXSMr8yt0z7dteE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780893022; c=relaxed/simple;
	bh=6nmyQAwTxoeWSNhCvACaml4kXdx3xGhxBzbUuZqRqXg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d48gsxhBhs96vhdfTPwzhYEYmrjUvemmgRWnamFKw6OQYPPVDcpPeZkRvbXpHu2nMf8SuoE8NvudM7MFsYMKksr+08Qzbd8gygxfunz77Hwkn2f7ijZbs2gEG+unkldVgRTc4wkmyRzjcYWezf435NsCSwtS0mKLyutI+RIChwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHL5JSSQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHL5JSSQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959111F00893;
	Mon,  8 Jun 2026 04:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780893020;
	bh=ybGUtRLdN6RCEITLLLU0u2LWx9wtNO30RA0XB+nHrqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EHL5JSSQTI5OKi4IGQEBV0mbXJR/C1dmWCOPvXCGsNSzzb5FjiQkEOMxXzKxx/z8Z
	 FW26k5dg8QK5bosXSZxdf15tNYAWpBoMCKUry+dM5rUpugtc/eK8Jl/umho4QvE5+k
	 30XNoht90LEOnzIaHDoWCiIeMYmxKqzp8wjavowzjr85hVsuJkZCwZskjOvzkUCs9Y
	 9zTD7BOntgEVUSAki+UzvYTtHT0hkJd6GrR0HZa6cjQZW6YnjMAlO1LGwTSs+A4DHm
	 c84I+ZgcFnKE3CPSaJ8pUK7FEmOwnclDjMJhZ7RzhS0JvlbRWWZe1pdInnyquQX5/q
	 g1KiNzhlvSfyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: mmc: sdhci-msm: Add ICE phandle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neeraj Soni" <neeraj.soni@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
References: <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 04:30:19 +0000
Message-Id: <20260608043020.959111F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete DT binding constraint: The schema disallows the embed=
ded `ice` register map when the `qcom,ice` phandle is present, but fails to=
 disallow the embedded `ice` clock. This allows device trees to mistakenly =
specify both the `qcom,ice` phandle and the legacy `ice` clock on the SDHCI=
 node, passing schema validation while double-modeling the clock resource.
--

commit 1a4e3c2586694f366860741fba23e497632a71fa
Author: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

dt-bindings: mmc: sdhci-msm: Add ICE phandle

This commit introduces the qcom,ice property to reference the Inline Crypto
Engine hardware block via a phandle. When this property is present, it
updates the allOf conditional blocks to disallow the embedded register
region in the SDHCI node to prevent double-modeling. Older SoCs without
this block remain unaffected.

Link: https://lore.kernel.org/r/20260310113557.348502-2-neeraj.soni@oss.qua=
lcomm.com

> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/=
Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index bd558a11b7929..b3fcc1673c106 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml

[ ... ]

> @@ -198,35 +203,69 @@ allOf:
>              enum:
>                - qcom,sdhci-msm-v4
>      then:
> -      properties:
> -        reg:
> -          minItems: 2
> -          items:
> -            - description: Host controller register map
> -            - description: SD Core register map
> -            - description: CQE register map
> -            - description: Inline Crypto Engine register map
> -        reg-names:
> -          minItems: 2
> -          items:
> -            - const: hc
> -            - const: core
> -            - const: cqhci
> -            - const: ice
> +      if:
> +        required:
> +          - qcom,ice
> +      then:
> +        properties:
> +          reg:
> +            minItems: 2
> +            items:
> +              - description: Host controller register map
> +              - description: SD Core register map
> +              - description: CQE register map
> +          reg-names:
> +            minItems: 2
> +            items:
> +              - const: hc
> +              - const: core
> +              - const: cqhci

[Severity: Medium]
Does this regression allow device trees to mistakenly specify the legacy "i=
ce"
clock on the SDHCI node even when the "qcom,ice" phandle is present?

The commit message states the intent is to avoid double-modeling of the
Inline Crypto Engine block, and the allOf conditional block correctly
restricts the "ice" register map here. However, the schema doesn't seem to
disallow the embedded "ice" clock in clock-names when "qcom,ice" is provide=
d.

Should there be corresponding restrictions for clock-names here to fully
prevent double-modeling the clock resource?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608041650.5415=
02-1-neeraj.soni@oss.qualcomm.com?part=3D1
