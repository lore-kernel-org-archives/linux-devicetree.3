Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6093B3ACF1C
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970530; cv=none; b=txASFlxB476OC+wx7iksa6hCl3KKvnjD7WV/FoiDeprA1iY+eAyNGFKOMVMRgTyVtrf3yEU4/Ko+DlYfyxjaHeX5gIwF5gJQaXqys83hQJsPylo4j+hiXGQB9v5TvkN2loJg0NyW85bG902KzHNASvuFyvN0kBYhbQmCJx5lvNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970530; c=relaxed/simple;
	bh=zW+3kZ5G9rrFUOZTjZVQFqbI2U3glrlKTOIdO/5c/AU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DfFBkwooIUQV0bJq2AHZl46sl0O7wLvMbCmeSE7RwfZmClvzByNQpNVi5Hhlze1Dpa0+xsBmyZ+dpMUT+jrduTLXu2ML4DQmkeT9pjBHVXtBFqkylemlSw9ejDB+8lVTE8BwZodQ6VZgF/wMGjzRRZOZLzECsGeh7cBTEPseUj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncILH1y1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncILH1y1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84EF1F00893;
	Wed, 14 Oct 2026 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791970529;
	bh=lgMHXVUxZVDK5e+H0XVuzo2D/DGkq1QFy79nEad7fsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ncILH1y1BHYdWckqnpLZ5fxiQOJg59DmRkQCWkbDut654XHnoO8aDkFW5KMPdGeNm
	 CnD90Aj2q33pmqAyPkw9HhKOwtBs0LCUWiu1RASrEwq27+idqmjMAyVrkPLi/ypC9R
	 RQUEBJ2A0REQp2F3O9TH6TX5zQv6G/Vs8Dqn1ApyDXzXAUtlk1OO/kXqMEGrwPmeXO
	 FaDVHFpaGLK7i6cd/eyEzcacge71WM2jEH51oDipjCO6H4DngRyy+9Gdaw2qlSE0u5
	 9jx3XCMQvF/4YRM9o2RpF+8BG8Zx7uqw9E9QQyTNXbrXtZMZL7egzwUgqOlurz7DKZ
	 I/UCnm+hMzUCQ==
Message-ID: <sashiko-outbox-171081@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:35:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: erroneous 'lpr' clock requirement for TX and VA macros
- [Low] dt-bindings: qcom: lpass-tx: copy-pasted clock prevents block shari=
ng
--

commit 8329a2400381810d27d8768d8793aa64ce4220c0
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: dt-bindings: qcom: Add Hawi LPASS macro codecs

This commit documents the compatibles for the RX, TX, and VA macro codecs in
the Qualcomm Hawi SoC. It details the specific clock constraints for each
macro compared to the SM8550 generation.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.=
yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> index d8682ff2e82c5..2df72450d36f5 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml

[ ... ]

> @@ -142,6 +143,24 @@ allOf:
>              - const: dcodec
>              - const: fsgen
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hawi-lpass-tx-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: mclk
> +            - const: lpr
> +            - const: dcodec
> +            - const: fsgen

[Severity: Low]
Does this erroneously expect the lpr clock instead of the macro clock?

The commit message explicitly states that only the RX macro uses the lpr
clock instead of macro, which suggests the TX macro should still use the
macro clock.

If this is a copy-paste error and is corrected to macro, the clock
constraints here become identical to the SM8550 TX macro. Should this new
compatible be added to the prior generation's if block rather than
duplicating the entire block, as per the dt-bindings guidelines?

> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.=
yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index 683ebf702ba8a..7d56f9c360566 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml

[ ... ]

> @@ -185,6 +186,24 @@ allOf:
>              - const: mclk
>              - const: npl
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hawi-lpass-va-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: mclk
> +            - const: lpr
> +            - const: dcodec
> +            - const: heartbeatpulse

[Severity: Low]
Similar to the TX macro above, does this schema improperly require the
lpr clock?

The commit message indicates that the VA macro simply takes an additional
heartbeatpulse clock, which implies it should retain the macro clock
rather than switching to lpr.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-add_shikra=
_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com?part=3D6
