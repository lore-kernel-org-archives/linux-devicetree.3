Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679362;
	b=GankBEFAd906/e+ILD/50QGS+KtMRMe2ajFe6y8R4J2h5U00kJuMuiaHbHGP0/bTTwD+
	 NiueuQl9xpdwO87qNoq3xVsYKVRUgR4v2Hl0Bd3qbcpAa8UuV15fvlAr256y4xAna365D
	 0C9Nzpb1Fgb9XdTqmNk2KB2yQsN/8o9VKJPY5v+fErMH9SuEvyG32x/fDjpMDQQ1GxkQR
	 +QqzqM/aFfDmXxPB8NLsznw+wq/JV0s0Xejvh69eIU1wISFJZWBFa0+wnCzf/D/9ZE7hN
	 xEskn55xATVXSLy56zIsh0vX1mYGSHp1NVOpag7XTSGkbNXO5IJ4ObK9/IUTFInvlBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679362;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vt6zHN81+wJA4wNs0N1dJmyVCvReUnCbzCcL3Dtp4Eg=;
	b=Mxx5+pdqs4P3Xg4CvPPPRxUerOM8US8dqETqGjZ6V2CwWkyrBXxkcKEte8AalHt28ceX
	 JTm0fIWmCY4Z1hNH1vfBLDt2Hz0fzs958q0a3BI7IifIa8y7ES+LuMbyPv0BtPL8RhGy7
	 kxsojQLb3TKRQnDmxo6gWMe/Q4b16p8SWyS3wTm5ztrozXNi8BMFsS2l6HdN+pbSDykuZ
	 MKXq6EYvcQZZIHwAakQd6Wi+F7Vzt68lVAI5+UGzwHMEXTxi8xCrJRzWzwZYYyEhVDfs2
	 TUafUZ5Rh3YZiJACUVBKpNl0cGYVKxptdAGkns/YWllkuM1+Hzlxs04mowAOIRP6nNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gaVo087K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33501606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gaVo087K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595B51F000C0;
	Thu, 26 Nov 2026 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795679361;
	bh=vt6zHN81+wJA4wNs0N1dJmyVCvReUnCbzCcL3Dtp4Eg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gaVo087KY4fqW9fCUFAZPmI84bhbWXVC5b8hM9o/ZkNa4ClQQ7CfAsRfl567WD5lv
	 co+EvcTwbHKJg9JR40Y2Mtn4VRRHvWve9tZo3+DY52erFQ03yk3qB1Rb0Y0g/0fWu9
	 sJm4q8cdxgOLBKtHVxVT1VfSdhddYFQO7/gS7O0mIOf1YwX8vi5Dvj8mIsJ5otpJnS
	 qKLaygvmODf6M27dDoeEDwSlWNVh/eAYhdxViRZ13csFC4aO200I9O94bFwY7LN6Ra
	 E1dGfRnS1V4xAADFoZu1uyLV4kpvsSf9Otv+Y/gSvVu43mGww21IBriINKRvN6B8uU
	 67P1mqARyJSZw==
Message-ID: <sashiko-outbox-234969@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Add PM6450
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-netrani-pm6450-v1-v3-1-2343209bbf4c@krgm.moe>
References: <20261126-netrani-pm6450-v1-v3-0-2343209bbf4c@krgm.moe>
 <20261126-netrani-pm6450-v1-v3-1-2343209bbf4c@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:49:18 +0000
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
- [Medium] dt-bindings: regulator: qcom,rpmh: incomplete PM6450
  regulators and supplies
--

commit 2a397126512b98f933a759bc14548bc385a59660
Author: SignKirigami <prcups@krgm.moe>

dt-bindings: regulator: qcom,rpmh: Add PM6450

This commit adds the qcom,pm6450-rpmh-regulators compatible, lists eight
RPMh LDO resources in the description, and adds five parent supply
properties for the PM6450 PMIC.

> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regula=
tor.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.=
yaml
> index 9115885e7985b..c91f01d785174 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -37,6 +37,7 @@ description: |
>        For PM6150, smps1 - smps5, ldo1 - ldo19
>        For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
>        For PM6350, smps1 - smps5, ldo1 - ldo22
> +      For PM6450, ldo5, ldo7, ldo13, ldo16, ldo19, ldo23 - ldo25
>        For PM660, smps1 - smps6, ldo1 - ldo3, ldo5 - ldo19
>        For PM660L, smps1 - smps3, smps5, ldo1 - ldo8, bob
>        For PM7325, smps1 - smps8, ldo1 - ldo19
> @@ -72,6 +73,7 @@ properties:
>        - qcom,pm6150-rpmh-regulators
>        - qcom,pm6150l-rpmh-regulators
>        - qcom,pm6350-rpmh-regulators
> +      - qcom,pm6450-rpmh-regulators
>        - qcom,pm660-rpmh-regulators
>        - qcom,pm660l-rpmh-regulators
>        - qcom,pm7325-rpmh-regulators
> @@ -203,6 +205,19 @@ allOf:
>          "^vdd-l([14]|1[1367])-supply$": true
>          "^vdd-s[1-6]-supply$": true
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,pm6450-rpmh-regulators
> +    then:
> +      properties:
> +        vdd-l5-l7-l9-l11-supply: true
> +        vdd-l13-supply: true
> +        vdd-l16-supply: true
> +        vdd-l19-l23-supply: true
> +        vdd-l24-l25-l26-l27-l28-supply: true
> +
>    - if:
>        properties:
>          compatible:

[Severity: Medium]
Should the qcom,pm6450-rpmh-regulators entry describe all RPMh regulators
and package input supplies of the PM6450 PMIC rather than only the subset
used on Motorola Portov?

Even the grouped supply names added here (vdd-l5-l7-l9-l11-supply and
vdd-l24-l25-l26-l27-l28-supply) reference ldo9, ldo11, and ldo26 - ldo28,
which are omitted from the description list above alongside the remaining
PM6450 LDO and SMPS rails and their input supplies.  Because this schema
sets unevaluatedProperties: false, omitting the rest of the PM6450
vdd-l*-supply and vdd-s*-supply properties will cause dtbs_check failures
for any board DT that wires other PM6450 supplies.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-netrani-pm=
6450-v1-v3-0-2343209bbf4c@krgm.moe?part=3D1
