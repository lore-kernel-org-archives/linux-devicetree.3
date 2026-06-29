Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A7024887E
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716588; cv=none; b=IPCndOfF7O15L58aOsiDfuc/YXAq6cUYik+wFw6/qWSS8V2hn2SC3g6m2+npEME1T2q8S4HQfv99IukSptSvzR0pvKVnnZtIMH8nHzF2xT629Mnq3Xv+osKHHRE6dUqZqXBVLS63yLi8/Lm1yllAbadwwgSqAW6sLHxkyRow5Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716588; c=relaxed/simple;
	bh=d4MhnhcXM8YgHOrF7rIa8+ul9A9sCLQbj8nguHjaL2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XbepjWKavHBSIePeniTqK/Zm4n+3or8WYOtsZi1i7hX0IhtE6sZKGRBlr7C6vHEFEv9rFOGjRyq4ROxfJATKHCvSA3A7SfjVeKj8r5NzwES8PWYh18Xeo+da6IYo6xtD/T4sMYUKECK98xJ7YOJGkp/H3ALsMvHm2tfunnbImYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHVamDx+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHVamDx+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29141F000E9;
	Mon, 29 Jun 2026 07:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716587;
	bh=D3wCCe9nlu1wFxw7e/89EX7hoyp/7c3VH1yPgpALtBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lHVamDx+aBgmzL5/vSBBuH3+9QjDiAJWUrWxvltMvub4AsYtEENsEJpW8z0daA5Vz
	 tFC1eJwwMVCNfzMA97BEEB8u2XhXwFR+PyW/eTYIlnOXLPDzoUx5PZWT/xAijoYwfJ
	 4nZqUeOLlGYMK47kPn+rf1kMXfXXfOT8ZSqW8xLEQvcRLxIAdI98gjskw4ArXmp12k
	 4lfJZNhg2/YBxic5/gvbwR1eyG+532RNy8/Csx1eTo36h07kS9yxENZpM7qO05z8vJ
	 X0/YF+Q2fD8bKCOoVQrdHsStC9Ljusw93whmunOsWfGyQ0C5J3Ote6HEa5cSnHr9a/
	 NQHeOjTPHB70g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: Add compatible for
 Maili SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com>
References: <20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:03:06 +0000
Message-Id: <20260629070306.E29141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new compatible string `qcom,maili-smmu-500` was added to the ma=
in list but omitted from the `allOf` conditional block that disallows clock=
s.
--

commit 5d07ecfd0f829393f9b6baedb17d072c42c1deab
Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

dt-bindings: arm-smmu: qcom: Add compatible for Maili SoC
   =20
Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
which is used to translate device-visible virtual addresses to
physical addresses. Add compatible for it.

> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Docu=
mentation/devicetree/bindings/iommu/arm,smmu.yaml
> index a701dec2fa0a4..c48e9de1a2bd5 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -39,6 +39,7 @@ properties:
>                - qcom,glymur-smmu-500
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
> +              - qcom,maili-smmu-500
               ^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
Does the new compatible string also need to be added to the allOf condition=
al
block that disallows clocks?

When qcom,maili-smmu-500 is missing from the conditional block that matches
other similar platforms:

  - if:
      properties:
        compatible:
          items:
            - enum:
                - qcom,eliza-smmu-500
                [ ... ]
                - qcom,kaanapali-smmu-500
            - const: qcom,smmu-500
            - const: arm,mmu-500
    then:
      properties:
        clock-names: false
        clocks: false

Device trees defining qcom,maili-smmu-500 that incorrectly include clocks
might silently pass schema validation during dt_binding_check.

>                - qcom,milos-smmu-500
>                - qcom,nord-smmu-500
>                - qcom,qcm2290-smmu-500

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-maili-smmu=
-v2-1-87448a7678ec@oss.qualcomm.com?part=3D1
