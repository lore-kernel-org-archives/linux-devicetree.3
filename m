Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957736B93A
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306797; cv=pass; b=FvA1ZwTbWj6hLT9Xk6kqirqLhWTWemj2L4A9ogX40Cu7nkxp7cnW4dfT2t+1fklopWt7UGDtmAyOQU2dPJcAkKHE/c/fRpzogzkZipP086lATbYJI1kDG9Ff/XN7Dm0X1zUXnYI6wZAjm1rtdftBDniRg0FmPyMcFClm3lxtnuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306797; c=relaxed/simple;
	bh=FE+Rqt0uhB4qDs5yGVaRx5AyhjdAezqykHn1GhUbKpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6CvON3lyfPTp8pyUJr3nXP6zK/vBk5D9m74dnuvrjVS1driu4sxkBF++snyUuffP3DjyUJ9TyBMulo8+SH06LS5ECPhJnWhcNy6zx0VPVda1o31w2Im1JB71Gc8DPS1INnsuy64a+sVEk/7wJMhQYdTr+oJ1tTVbzEjkGMLY+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXOF5ZLo; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXOF5ZLo"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69a33fb0031so107605a12.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 23:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785306794; cv=none;
        d=google.com; s=arc-20260327;
        b=rVmRcVGak4+moUac7kZUkZfh9wJhaxVyNNR6aE0oveyLfhpNPwkBr7T7z9XPLPRUgc
         txffTee4TD52rPtnDlBU9exNMn8YDqNTVgUFfS2Q3UBqwjO+XCV37hIJLOnR+kac5Xvm
         vEwCd7mC1bpe476KG259PaoBc1faaPDgGZXTC4P3oZ3N9nA7OAZF/6qNC52DW4A5iY2c
         v9/gazHPbVVA/66xYbe8zz/28bD2q8H+XYiC0utHjKbEFI34E3HGIEi4uCOBZSP+2MhN
         fa/ZaebP/H96GKeWyhaq+I67BHDz01vHuzEuGdb9SFxd6EQgzYNEvS/iMjcFW1J2tCbK
         u4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f7umgqrJ5A+hLeSWjc/JOqRr2+bzzz5vf03f1UagNtk=;
        fh=XhigNk5yJ2Rg7iM5ZmuJm/0KnQU5n9ZdClkxMt4IMHQ=;
        b=NMDcq9F5B+UkCfb+pXo9dJJHtLfMre83s3M8w81DB45KIhrQ4yrELLpSfiblrI2b+h
         NSoD3+Ivt/rDvumoud9bf9vOx2+9PZiUV/AhhAVQUJIU3dZawH/cJC9LPlO6AR/OSWb3
         M4zaB9POQoPKheh/2rm+LX6hbyZJVMkFlVsDbndgJGBglcPOgaDd29r71OVfsiLTMzlR
         GjFu1FIHW1E2E6S4fbHfBhln9gThO3xoTOEpqQ7enHrLqydMYfMACIzObLSio+9+m6mW
         bC0TVn7XlQXTxxAlvILUw7yts6TiBrplU4ut6fUk+exbLYwhRm94wkf4TnAbNX1wrB0O
         X9vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785306794; x=1785911594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7umgqrJ5A+hLeSWjc/JOqRr2+bzzz5vf03f1UagNtk=;
        b=iXOF5ZLoBXgtioe2HJOzcdFI1OCLDybJ6DYankTwdz2z2BJnZ/wY01Yl1Demp338IF
         Gv2aX9q7XBN6S7wKsjH1vWEaaLrzCZrJ5uDw5RLDTi4ZKK7JA3eWLtxf56J0Cg+13kPH
         Ph0CUwWd3SAIyE0vDPAsLbOKIB3Oh372yo2MxM4hwHAHqsVI9ms/z8KecyiJ/nVa9uGo
         FAbtJjiOrMR6av84SoIIYRfteFfbqGyiFDonlBjCFhIG9vR1DZLkimcMiHJMpuff7SaD
         AxCfFpjlmvnfl9yFeQL7668BGrWbIcNHut3XZpWQiFgi9bxd8CAMvHqKzrksB6km2IHR
         yINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785306794; x=1785911594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7umgqrJ5A+hLeSWjc/JOqRr2+bzzz5vf03f1UagNtk=;
        b=jNwUFXIKkmFSsH2Ul3JiHlJFYO56FjGNtdqdFr4YD6Bt+77PggHnMaKdtqmTjzanOv
         0ezyHJWYs/vZkmMD5pljHhsSrc5I5UiAPq+5Q4Ro3bU9uO28C0241OPGm0uYhWeHC+zP
         jioP5J0F+1kBU80j0HRKNKbs7rlC8z2OsPr5yY5r0Nn4/ObQ1dpSXY/QTSnIXP2OiHAU
         weLn4Y4MIFYR9fB5fZEH2gHB7K5sfDZL/ExytTxJ1R0J7kWCMVa94bZ3u/e32wUBwy2K
         VTNxy57qq/F8isN0sOmbsdj5RF+yKJNv5nGv+VqnlbKenOXOidA8MtZHuHUrNFFvdmnt
         KQig==
X-Forwarded-Encrypted: i=1; AHgh+RoFRPQlmzQ8sf/ytDb6GnC9na0/K9i4ODovFS3hmgfIEmoPK9Zwnn6Le+Qcyof7/0wkUiOV90mIfeZL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyupq9IP550tMrTmqdcklQlpqYFULHgczPs75tn35MzX5MyMJfP
	ySufsrRiuik8Rae9JI9sWIvb9Uz5I43mY/O48zBLiv9oiFOewv4anwXpXgjYVICM8u0yYTcPJP+
	ZPOiaWs1mR9SwcNZjqoU+GbFVFqxK5N0=
X-Gm-Gg: AR+sD11UWz6gMawZh+x63+ur/Vk1rpsFRThvheZ42xRXtjAJ6j6L0DqYg8vhCEOFO+Y
	nh8X3E7aQ60zg1OiNOV88eaIWMQbwAGw+iNAPN/8sgtU1y4l6mJTbmqjEdgjknofoo9KO+m2Vfg
	jlRkZLCo8ZH5rvHpJyD0hXEF9HL7bknC8LhtfHwLT4oVDmL4MZJVTBMdTjlUD9nLnTweT7QoDt9
	ZkAdfqPNKUa23yaxc6HHa86j2jGZCGwCxz3oRcF4l8Ee4YXUhyKw4iAUiWlgcSE7a/auohnr9Ma
	acJCD5dth7Ti3pCYEtEEnvPav/AySFEqoCNTKmP0BXBUNQe6J9WUzaFUzWlxWKC7KQ==
X-Received: by 2002:a17:906:4784:b0:c12:732a:fe52 with SMTP id
 a640c23a62f3a-c1f952db03amr6825366b.4.1785306793627; Tue, 28 Jul 2026
 23:33:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-ti-pbias-omap-v2-1-e26fbd476e6e@gmail.com> <20260728-vegan-carrot-hyena-1275f1@quoll>
In-Reply-To: <20260728-vegan-carrot-hyena-1275f1@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 29 Jul 2026 12:03:01 +0530
X-Gm-Features: AUfX_mxySSDK_98EC3jsPQF3NYxZJ1mo1NWZ1S0_hVRYpBnufeqn4xRyexV9T_Q
Message-ID: <CAOWyW_6pUdbxE8PCHeAtLanfw7hvu6ON=qwz7Dt+uu1T_UpVZw@mail.gmail.com>
Subject: Re: [PATCH v2] regulator: dt-bindigs: ti,pbias-omap: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 3:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 22, 2026 at 09:55:07PM +0530, Bhargav Joshi wrote:
> > Convert Texas Instruments PBIAS internal regulator from text to DT
> > schema. No Functional changes are introduced.
>
> Subject - typo, dt-bindings.
>
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > ---
> > Changes in v2:
> > - remove top level $ref: regulator.yaml#
> > - update schema to support OMAP3 SoCs to have both MMC and
> >   SIM PBIAS regulators
> > - Link to v1: https://lore.kernel.org/r/20260717-ti-pbias-omap-v1-1-527=
848131801@gmail.com
> > ---
> >  .../bindings/regulator/pbias-regulator.txt         |  32 -----
> >  .../bindings/regulator/ti,pbias-omap.yaml          | 157 +++++++++++++=
++++++++
> >  2 files changed, 157 insertions(+), 32 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/pbias-regulato=
r.txt b/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
> > deleted file mode 100644
> > index acbcb452a69a..000000000000
> > --- a/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -PBIAS internal regulator for SD card dual voltage i/o pads on OMAP SoC=
s.
> > -
> > -Required properties:
> > -- compatible:
> > -  - should be "ti,pbias-dra7" for DRA7
> > -  - should be "ti,pbias-omap2" for OMAP2
> > -  - should be "ti,pbias-omap3" for OMAP3
> > -  - should be "ti,pbias-omap4" for OMAP4
> > -  - should be "ti,pbias-omap5" for OMAP5
> > -  - "ti,pbias-omap" is deprecated
> > -- reg: pbias register offset from syscon base and size of pbias regist=
er.
> > -- syscon : phandle of the system control module
> > -- regulator-name : should be
> > -                     pbias_mmc_omap2430 for OMAP2430, OMAP3 SoCs
> > -                     pbias_sim_omap3 for OMAP3 SoCs
> > -                     pbias_mmc_omap4 for OMAP4 SoCs
> > -                     pbias_mmc_omap5 for OMAP5 and DRA7 SoC
> > -
> > -Optional properties:
> > -- Any optional property defined in bindings/regulator/regulator.txt
> > -
> > -Example:
> > -
> > -             pbias_regulator: pbias_regulator {
> > -                     compatible =3D "ti,pbias-omap";
> > -                     reg =3D <0 0x4>;
> > -                     syscon =3D <&omap5_padconf_global>;
> > -                     pbias_mmc_reg: pbias_mmc_omap5 {
> > -                             regulator-name =3D "pbias_mmc_omap5";
> > -                             regulator-min-microvolt =3D <1800000>;
> > -                             regulator-max-microvolt =3D <3000000>;
> > -                     };
> > diff --git a/Documentation/devicetree/bindings/regulator/ti,pbias-omap.=
yaml b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml
> > new file mode 100644
> > index 000000000000..ea904946e352
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml
> > @@ -0,0 +1,157 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/ti,pbias-omap.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments PBIAS internal regulator.
>
> Drop final stop. Titles don't have them.
>
> > +
> > +maintainers:
> > +  - Tony Lindgren <tony@atomide.com>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - ti,pbias-dra7
> > +          - ti,pbias-omap2
> > +          - ti,pbias-omap3
> > +          - ti,pbias-omap4
> > +          - ti,pbias-omap5
> > +      - const: ti,pbias-omap
>
> Odd, old binding did not list such order and it said ti,pbias-omap is
> deprecated.

no in-tree DT has used bare "ti,pbias-omap" since series that added the
per-SoC compatibles every dtsi already uses the two-string form. So I
kept it this way. I Will add that to the commit message for v3.
>
> Nothing in commit msg explains changes done to the binding. I guess
> there is a reason to do that, but needs to be explicit. Especially that
> you are changing the ABI - disallowing ti,pbias-omap alone.
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  syscon:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle of the system control module
> > +
> > +  pbias_mmc_omap2430:
>
> Names were also not in the old binding and this is not explained WHY you
> are doing that way.

These exact node names are matched by the driver so need to be added in
binding, I will document this in the commit message.

>
> > +    type: object
> > +    $ref: regulator.yaml#
> > +
> > +    properties:
> > +      regulator-name:
> > +        const: pbias_mmc_omap2430
>
> So the regulator-name is required or node name? Looking at the code I
> see only node name requirement, but feel free to elaborate in commit msg
> why this name must be fixed as well.
>
Yes, only node names are matched , there is no restriction on
regulator name even
though current in tree DT uses these exact regulator-name, I'll fix this in=
 v3
> > +
> > +    required:
> > +      - regulator-name
> > +
> > +    unevaluatedProperties: false
>
> Place this one after $ref.
>
sure
> > +
> > +  pbias_sim_omap3:
> > +    type: object
> > +    $ref: regulator.yaml#
> > +
> > +    properties:
> > +      regulator-name:
> > +        const: pbias_sim_omap3
> > +
> > +    required:
> > +      - regulator-name
> > +
> > +    unevaluatedProperties: false
>
> Ditto
>
> > +
> > +  pbias_mmc_omap4:
> > +    type: object
> > +    $ref: regulator.yaml#
> > +
> > +    properties:
> > +      regulator-name:
> > +        const: pbias_mmc_omap4
> > +
> > +    required:
> > +      - regulator-name
> > +
> > +    unevaluatedProperties: false
>
> Ditto
>
> > +
> > +  pbias_mmc_omap5:
> > +    type: object
> > +    $ref: regulator.yaml#
> > +
> > +    properties:
> > +      regulator-name:
> > +        const: pbias_mmc_omap5
> > +
> > +    required:
> > +      - regulator-name
> > +
> > +    unevaluatedProperties: false
>
> Ditto
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - syscon
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: ti,pbias-omap2
> > +    then:
> > +      required:
> > +        - pbias_mmc_omap2430
> > +      properties:
> > +        pbias_sim_omap3: false
> > +        pbias_mmc_omap4: false
> > +        pbias_mmc_omap5: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: ti,pbias-omap3
> > +    then:
> > +      anyOf:
> > +        - required:
> > +            - pbias_mmc_omap2430
> > +        - required:
> > +            - pbias_sim_omap3
> > +      properties:
> > +        pbias_mmc_omap4: false
> > +        pbias_mmc_omap5: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: ti,pbias-omap4
> > +    then:
> > +      required:
> > +        - pbias_mmc_omap4
> > +      properties:
> > +        pbias_mmc_omap2430: false
> > +        pbias_sim_omap3: false
> > +        pbias_mmc_omap5: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - ti,pbias-omap5
> > +              - ti,pbias-dra7
> > +    then:
> > +      required:
> > +        - pbias_mmc_omap5
> > +      properties:
> > +        pbias_mmc_omap2430: false
> > +        pbias_sim_omap3: false
> > +        pbias_mmc_omap4: false
> > +
> > +unevaluatedProperties: false
>
> additionalProperties instead.
yes will fix this as well.
>
> > +
> > +examples:
> > +  - |
> > +    pbias_regulator: pbias_regulator@0 {
>
> Drop unused label.
>
sure

Best regards,
Bhargav
