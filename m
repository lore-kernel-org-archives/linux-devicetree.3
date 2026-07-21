Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B250042D763
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628331; cv=none; b=uQ61mpNGc47CzG+MAWHdjsWTg35GLslqScQaX8ubj5/gTJDVwN3VxvitfivdkuFlwBxk8YCMGX9bRz+T/eooQEYDL/JuoWROtrkjTXTBNpa8Ne94F0Udo24ApVF6PzpRK5Y/Fd/JU46/wvJhpAUGFeBQ0MLi+gahZ5jwnbvxNDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628331; c=relaxed/simple;
	bh=fCM2evyNlkHBu4e0iKTX7rL0MrXxYIA2U1vZc3nAXwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s8mD2WCKdr0ny18JhATsmiiNlhWphiTQ1PLnBijHTNbdCfpG+g8UXo8ZWyfoDLnUMwCgEGitKhi8pIWr7yuOuCGOMRAR300YVcwK637Ea4TM4uxTQi0U7U3HDW6G16XWPRMblymWmFi6s91gip+yfuMEjWYmH8N/60pNXh9IsIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3GDEKlC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3GDEKlC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0132E1F00A3D;
	Tue, 21 Jul 2026 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628329;
	bh=gS1cWRKhxMuMOsCV30PoQ8740B4495kDDLBM99Jp1/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n3GDEKlCAOkofVPOTJJgAs22KKfRg2J6Halw/mZFYKPSeB3Y6WF16n0ui1kv5NpGB
	 Hi4yCB06BN+0eNsswmtwDy8eUqmdSyuts2lrljH+A984D/a1FcPWzNRmOiH3LiSpzR
	 1sb5lUQptKV6AJPNVCn008QbN9NIQJ/g+09tWcDM9PtLRp7pBQW1M49yxmV2qMVeUB
	 u/J5Ctqc8yyNozMLBH2uQB+iFvrpfht8lc+AAcqn0OnP8WEkQu5FxwqZBLDSMf289b
	 lziYGm+O8C3vQZfKzsxj92G5EbB2IKxJht3paKGmMY77+5aBVhuV5qnTRrSyY1ndV5
	 oOlUOeSIr/wTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/18] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-5-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-5-8e6d99ab3ad2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:28 +0000
Message-Id: <20260721100529.0132E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `allOf` `if` block in `mediatek,mt8186-clock.yaml` uses `enu=
m` instead of `contains: enum` to match `compatible` strings, forcing `#res=
et-cells` to be erroneously forbidden for MT8188 variants.
--

--- Patch [5]: [PATCH v3 05/18] dt-bindings: clock: mediatek: regroup MT818=
8 dt-bindings into MT8186 ---
commit 98d8c49a88c351f004575c4b25d83403e1fe67e1
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: regroup MT8188 dt-bindings into MT8186

This commit regroups the MT8188 clock and system clock device tree bindings
into the MT8186 ones. The goal is to ease maintainability by having common
files for multiple SoCs that share the same kind of clock controller design.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
[ ... ]
> @@ -42,11 +65,36 @@ properties:
>    '#clock-cells':
>      const: 1
> =20
> +  '#reset-cells':
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
>    - '#clock-cells'
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-camsys-rawa

[Severity: Medium]
Does this enum properly match the compatible property?

Because compatible is treated as an array of strings in device tree schemas,
matching it with a direct enum instead of "contains: enum" evaluates to fal=
se.=20

Will this cause the else branch to activate and incorrectly enforce=20
"#reset-cells: false" on MT8188 variants that actually require it, causing
schema validation failures during dtbs_check?

> +            - mediatek,mt8188-camsys-rawb
> +            - mediatek,mt8188-camsys-yuva
> +            - mediatek,mt8188-camsys-yuvb
> +            - mediatek,mt8188-imgsys-wpe1
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt8189-clo=
cks-system-base-v3-0-8e6d99ab3ad2@collabora.com?part=3D5
