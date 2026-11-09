Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254678;
	b=C3vu+MFd4XWLCfAKUwo+2MkEQFLcPdiNT9CROiOEpZzCUkqtSVGflKBomKhjCsyN/hsJ
	 4JMeyLlLCZnTm4M1NCgJXoB/HcOY1pajNWh95F9UERnJ7XPYd6SoMyBG+TzzbnJNbXyFO
	 Q3fyBcEF0qxPcitu1cjL5cxsEAv84EwJXNxgizdbw2FxXA7w/cVSXJtVo719H81hhaoJN
	 +TVt1IHioWtd/H62+KBUot9LVxLSUpQmCrCon859Dj47b/quSIAB/XODqU48oeHcZRCiA
	 xeK6nJJ0kGTsihnYh//rTWWRLFeFr7hhDcuXGJoBpbUnxtsLSXl1K+m0kkRC9FUrM8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254678;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+JuvPkaCib5gijBIx2oitBF83c4/Xa7Re1YrtWpZzxE=;
	b=0o1GDF8qb3se0cb5BlpiLGS8gYsTxuGoN2ZfKD8g3iARWs5zy9RJEdz3arI4PZJ8Ojkf
	 QEA87koRTuQbC0LPYmLOQehazd+spaRxOLW14zlmytRXlsiAr7H86FK4JEpwZcuXv+d1C
	 FF+f5EeC3/7Na6jrpawzsSCS8JkRcUoF/nwfIzSj0C/8TLS6ehrcgwSE/spILzaXfrqiY
	 xcjbKHKjECeAP7kzzOUUD9rQn+RMQWIg7Bt1KeE1LszUoxzcQoWNWlnjUio19M1WptASo
	 l03MYgU4HL9JUyMwHc+D3JrQewTWEs32CWil83+INuuUk6M8/301gij4qopCNU9iz1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=efMKZPp+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B57F606A333
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 20:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=efMKZPp+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FA31F008A3;
	Mon,  9 Nov 2026 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254677;
	bh=+JuvPkaCib5gijBIx2oitBF83c4/Xa7Re1YrtWpZzxE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=efMKZPp+6wnaeCDIcFlstGBYB2HabPplEfTgriWTjclLWBPkHv8WzwPrfka4OJFgj
	 vP8abwd/F5b2CrnqYtZR5YQeeTh4BsU9NeDN4AkT4amyk3Irgqa13rGAv+3Wky0L1g
	 XaKsquH7O8ml7gV3P7MrFi1blMdxKBWQ0AdbSkVufh/lA3mlrQ0b0RkPGCfDBGw1eU
	 CeRtlM/4EHMWEUTgLgnyroaP219mVX8//RWinusPoQHVM50Ce5IOHtYJtkPAcxKpma
	 Kt4FwaK5d4SVVPHX2qVQ05s8F1WVkjHFn6hj1RJc2dTUN4GO+UfhhM3dt7wwMnXNha
	 Cvqm0pz0f5T+w==
Message-ID: <sashiko-outbox-205532@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/9] dt-bindings: remoteproc: qcom: adsp: Add SDM670
 ADSP compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107022453.159341-4-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <20261107022453.159341-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:04:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: remoteproc: qcom,adsp: piling on per-compatible
  conditional
--

commit d08998077e2bf791171ccb3e3fc451fa5b6952ed
Author: Richard Acayan <mailingradian@gmail.com>

dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible

This commit adds the qcom,sdm670-adsp-pas compatible and its LCX power
domain constraints to the qcom,adsp.yaml binding schema.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml =
b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index 7e8ecae8e6cb6..6cac1f77993ba 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -25,6 +25,7 @@ properties:
>        - qcom,msm8998-slpi-pas
>        - qcom,sdm660-adsp-pas
>        - qcom,sdm660-cdsp-pas
> +      - qcom,sdm670-adsp-pas
>        - qcom,sdm845-adsp-pas
>        - qcom,sdm845-cdsp-pas
>        - qcom,sdm845-slpi-pas
> @@ -128,6 +129,20 @@ allOf:
>        required:
>          - px-supply
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sdm670-adsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: LCX power domain
> +        power-domain-names:
> +          items:
> +            - const: lcx

[Severity: Low]
Should qcom,sdm670-adsp-pas be split into a separate schema document (or
grouped with a matching PAS binding) instead of adding another
per-compatible if-then block to qcom,adsp.yaml?

qcom,adsp.yaml already carries several variant-specific conditionals under
allOf for different power domain and supply layouts, and newer PAS bindings
with distinct constraints have been split into dedicated schema files to
keep the conditionals manageable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107022453.1593=
41-1-mailingradian@gmail.com?part=3D3
