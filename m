Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C63BE17D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712853; cv=none; b=CxOXF//HqzERJbgKZgs80JkJs1RZnUCbkbQO+NZ7eOFgsf/FHsyN1nmiU8/uwwZFADao7KpbE+BSnB0zu2SKW62E3uCos11rLHl1LYk2qLOop6lhHysizLYmD8V1wJeis29w9gFXUmybDVkLH7Nncl3mzU9CZCHgsVu+kK8M8Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712853; c=relaxed/simple;
	bh=rQMjOONrr0nKcArCkVwTIaXzeSKMyFR1Or61vydw9y8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lowvqFhkZoaKVo/6MygsjLeskBypzf9eId3dOZfDF10o2ciwLTs3/9ENLjHvKOqe73idiUJC0gTLbQEPPWsX8A+RqIii7XvOZyADKYhWhFR+9qc/A4INEJCKC6Hqlh7rLTuzVdyL48NK3LgnH4OiWg2uET933r/7TFEunMVaDzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ipj5Sse4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ipj5Sse4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976181F000E9;
	Wed, 22 Jul 2026 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784712851;
	bh=z5cTWZDEsoZaeT3Clq+JNr7OCnaB8YwWfgNBTcKpkRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ipj5Sse4+ormS3WBOEjx0SajjiPayPvuJ91rWX7oX1ttf9x64Nse7DbTipS2RLhSQ
	 +CSx7Lk6+SMRzm2GkcFiilLdHk5D0eIAsGuWo7cKKrvfT1/a3nTfrWYjyrMhuyjRnC
	 +ovxYOHM3sRK/wygFwlKKixrbpjtQiGYC1iNG3YMBKRO8yWnzovaZ+nTMXbuyOlyIn
	 pEyu8EHbkMlexd9blLnGvXp9d+4XtETW0V2O8zlXt3girAk5kGEdJj8Q7FklFoFPVp
	 wuBZIHZ1NG+bg2vzQ7f46FIB7FIhVYoQ5X2Aove9cPOOs1OIItJ2QVQoZq9PyjU7zL
	 OAqES8zYI+eag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 2/2] dt-bindings: memory-controllers: mtk-smi:
 Add support for mt8189
Reply-To: sashiko-reviews@lists.linux.dev
To: "Congcong Yao" <congcong.yao@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-8189-smi-support-v1-2-b528a4fd878c@mediatek.com>
References: <20260722-8189-smi-support-v1-0-b528a4fd878c@mediatek.com>
 <20260722-8189-smi-support-v1-2-b528a4fd878c@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 09:34:11 +0000
Message-Id: <20260722093411.976181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Mismatch between device tree binding and driver regarding the nu=
mber of required clocks for `mediatek,mt8189-smi-sub-common`.
- [Low] The new compatible string `mediatek,mt8189-smi-common` is omitted f=
rom the device tree binding conditional blocks, bypassing clock validation.
--

--- Patch [2]: [PATCH RESEND 2/2] dt-bindings: memory-controllers: mtk-smi:=
 Add support for mt8189 ---
commit cc036d50e071efdc0f20a8e8886395bb02c7e74e
Author: Congcong Yao <congcong.yao@mediatek.com>

dt-bindings: memory-controllers: mtk-smi: Add support for mt8189

This commit adds device tree binding descriptions for the SMI larb, common,
and sub-common hardware components on MediaTek mt8189.

> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediate=
k,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/me=
diatek,smi-common.yaml
> index 0762e0ff66ef0..4e1deeff92b14 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-c=
ommon.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-c=
ommon.yaml
[ ... ]
> @@ -40,6 +55,8 @@ properties:
>            - mediatek,mt8186-smi-common
>            - mediatek,mt8188-smi-common-vdo
>            - mediatek,mt8188-smi-common-vpp
> +          - mediatek,mt8189-smi-common

[Severity: Low]
Should mediatek,mt8189-smi-common be added to the conditional block for
gen2 hardware that lacks GALS support?

Looking at the rest of the binding, there is an allOf conditional block that
enforces a strict 2-clock constraint for compatible strings without GALS:

  - if:  # for gen2 HW that don't have gals
      properties:
        compatible:
          enum:
            - mediatek,mt2712-smi-common
            - mediatek,mt6795-smi-common
            - mediatek,mt8167-smi-common
            - mediatek,mt8173-smi-common

    then:
      properties:
        clocks:
          minItems: 2
          maxItems: 2

Since the driver platform data for mt8189-smi-common lacks GALS support,
omitting it from this conditional block bypasses the strict clock validatio=
n.

> +          - mediatek,mt8189-smi-sub-common
>            - mediatek,mt8192-smi-common
[ ... ]
> @@ -108,6 +125,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - mediatek,mt8189-smi-sub-common

[Severity: Medium]
Is there a mismatch between this binding and the driver platform data
regarding the number of required clocks?

This schema requires 3 clocks (apb, smi, gals0) for the
mediatek,mt8189-smi-sub-common hardware in this block:

  - if:  # only for sub common
      properties:
        compatible:
          contains:
            enum:
              - mediatek,mt8189-smi-sub-common
              - mediatek,mt8195-smi-sub-common
    then:
      required:
        - mediatek,smi
      properties:
        clocks:
          minItems: 3
          maxItems: 3

However, the corresponding driver platform data in drivers/memory/mtk-smi.c
omits the has_gals flag:

static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8189 =3D {
	.type     =3D MTK_SMI_GEN2_SUB_COMM,
};

Because has_gals is false, the driver will only configure and enable 2 cloc=
ks.
Does the hardware actually require gals0 to be configured, or is the schema
overly restrictive by enforcing 3 clocks?

>                - mediatek,mt8195-smi-sub-common
>      then:
>        required:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-8189-smi-s=
upport-v1-0-b528a4fd878c@mediatek.com?part=3D2
