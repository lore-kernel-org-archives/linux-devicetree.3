Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664488;
	b=LpXXhiANXEIWypyGW9eII/sgHVq7zWKPRlBzhXX9rMXN7WQZ1V6q4faqo2JQvT1bpHr0
	 idB6gWfDFSlMgTCmUp0mjuJdolcxVONSQUKtnw2ys9ot1djDQBpgCV8Py/23XziiSlbwr
	 bbgtt4EG0f7TURFJDYOCmy50qwHUGZNaCdhPyJWMpbWSgBJRR/1zOiysE9MGN2NnuXbno
	 N2pvV+IRxWsLYAFcFr35aHrJAZfhilmVznJNRXycyf1jXB6yhn/VtGClbgoys5eiBUW8J
	 GzUU1oPD7NFuUdxYVCP1R7DeXhS0AjsqlFRRUV3dw6aiBgGUSw51QJBEYzBPihnfpCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664488;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aAGCSVKRyJvt2CqiGVRrcfVMXDXMo2Q7Oe2lWMcw6c4=;
	b=In/71s0grhQr8AkOo0edhRfHSENVQze01HIcT0E5+X9DXXHvC5g2Xr7GKSfEYcrEPSqu
	 mbZmqJoME/DEtj10eQTsPJvhzgkMSd/GE/nN6Lcbya3Ch8VUORy8/96e20cKPzxOXdvo1
	 ZLAg+3M9iRlLis0mlNH/Q2Bdv/K9HjL/PWoQEXVKsao9jArM9CSGwJ2pjX2dI3RbgGmt9
	 XLocriqtbpAtf2nzPuikImQ0KQd22re5gMyPllBq35wl0nMBaSJ4uvGbs5rQAXROFHfQ1
	 CA9gAgfxUro9pXQNkBE10QDUN3rGM5/EX/oMFVtRkWYz1j3kVuF4Y0CKR4OMeeLCoFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RVAYXBTh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8356606A32A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RVAYXBTh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FE21F000D2;
	Thu, 26 Nov 2026 03:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795664488;
	bh=aAGCSVKRyJvt2CqiGVRrcfVMXDXMo2Q7Oe2lWMcw6c4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RVAYXBTh60u8Ly2g1doVbL2SUS+y6xLSS0fDkFjvD0G2+PC55CPpu8nD2ukjRKQST
	 I+/uS4tmVcP3wyTuh8UMGDjDxHMjziydQ4Qayz1My55+EX4T0xpl5rF1iCtuNETDpj
	 xZkQwHj1J0RyKVDcC2tmfpGdVeSI39G9vSQgAHB2IQ/CLgOldq1ZVej4735E0xOQah
	 tewt3oaKwqC+DjAW01RkFlos2xcyDsVqyQJenlN77gKIwJTFYP54rj8l29mvL3jjJ1
	 Zd5ByoYvOncWCsjMpiKzNnprFojLS3K/1/pr7h5e0aRSWzgz0VxJFOvTbupZOiAm2K
	 Msi0eD8KBLbTg==
Message-ID: <sashiko-outbox-234700@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: qcom,rpmh: Add PM6450
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-netrani-pm6450-v1-v2-1-2539a2422218@krgm.moe>
References: <20261126-netrani-pm6450-v1-v2-0-2539a2422218@krgm.moe>
 <20261126-netrani-pm6450-v1-v2-1-2539a2422218@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 03:41:27 +0000
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
- [Medium] dt-bindings: regulator: qcom,rpmh: missing PM6450 supply
  properties in allOf
--

commit 034e98206388b0aac6afd8c342a23f595e3b315b
Author: SignKirigami <prcups@krgm.moe>

dt-bindings: regulator: qcom,rpmh: Add PM6450

This commit adds the qcom,pm6450-rpmh-regulators compatible and documents
its supported RPMh LDO resources.

> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regula=
tor.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.=
yaml
> index 9115885e7985b..ba3f50352773c 100644
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

[Severity: Medium]
Should qcom,pm6450-rpmh-regulators have a matching if/then block under
allOf declaring its vdd-*-supply parent supply properties?

Because this schema sets unevaluatedProperties: false and defines allowed
vdd-*-supply properties per compatible under allOf, dtbs_check will reject
any parent input supply properties specified on a
qcom,pm6450-rpmh-regulators node.  In addition, the description lists only
a subset of eight LDOs (ldo5, ldo7, ldo13, ldo16, ldo19, ldo23 - ldo25)
with no SMPS rails rather than the complete set of regulators on the PM6450
PMIC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-netrani-pm=
6450-v1-v2-0-2539a2422218@krgm.moe?part=3D1
