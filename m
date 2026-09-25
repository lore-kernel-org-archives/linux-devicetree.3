Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754B4D954E
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351762; cv=none; b=Ef9t7zvlas62CSim2J6SCsxpfzQlXKpoDyPICtRXZOd4ahDvquKQOX+mzicl51H0oKa4NU1GzmbaXPE2Ze6R8w5Hp/YSQSmNTOX7MYgNf+Ut7bP3FIhFXISWCC0RfQNoOvrGlLW17eFIgWJWEumpijZqJ2LOD6lMhyp2x6/njLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351762; c=relaxed/simple;
	bh=4g86JqysM7vGx9qXSkjlVy9ktHXEo0nInKnsd//oO1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JJYKnzxspiNB2DrAMqHvNcimcSIuKyOGrsuVjKqx4SVKKsgNzX7l27018Gde9JKGtv5IZ6OuEsFwxuOZr6krX5OFuVRTPB2k14eiLtNxLbnLOVxzS+3juSDJFg77vBwLxD63o7+RxW1/VA24w7FukrBKOkNiauia9osJ5nEdE9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+GplAxt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+GplAxt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA941F00898;
	Fri, 25 Sep 2026 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790351759;
	bh=fS0Parb1ZN5AYlv6WoqfZA1DUaU4lKrSF1XPesJkfWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+GplAxt55AV5KSIERCpjYang6XeYu01p34hxZ6JzPlqzpHRuGDK8XV2v7R920+Gn
	 SpfR/2inPqgHSTvBmHg64Qgni/JXkar9r+d1Mzx4/fsgbbhhO03kAD8eW8BfZqtd4h
	 7XIVpFtLFjm+NGIeM3gtilMHjdFTktkN6QfnOKrgJLySMAXJOAfEq2T7g5cq7AeN0l
	 SfE4FRDfuP6ddLnCPJnAtQGDhFesqSTIRAs+rH9dre3FmaWbHebY1ZbQmed9QL8mlf
	 U63tzM+oufAYi9y7iSEbBJ4s9WgM04kPllIdf66xss0ssLQHLpaj3713qdsrKJEWcw
	 JNxLFzr5UzKOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6765 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yassine Oudjana" <y.oudjana@protonmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260925-mt6735-pinctrl-v9-v9-4-bfb19d8bb87c@protonmail.com>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
 <20260925-mt6735-pinctrl-v9-v9-4-bfb19d8bb87c@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 15:55:59 +0000
Message-Id: <20260925155559.9AA941F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pinctrl: mediatek: DT binding allows drive-strength 16 which dri=
ver rejects
--

commit c86bb87060bc7c504b8fa22832cdfbbac4934ccd
Author: Yassine Oudjana <y.oudjana@protonmail.com>

dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controll=
er

The MT6765 pin controller has had a driver for a while, but DT bindings were
never documented for it.

> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml
> index 4df6971030416..94117008ebf9f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.y=
aml

[ ... ]

> @@ -61,6 +62,41 @@ required:
> =20
>  allOf:
>    - $ref: pinctrl.yaml#
> +  - if:
> +      properties:

[ ... ]

> +      patternProperties:
> +        '-pins$':
> +          patternProperties:
> +            '^pins':
> +              properties:
> +                drive-strength:
> +                  enum: [1, 2, 4, 16]

[Severity: Medium]
Does this binding allow a drive-strength that exceeds the hardware capacity?

The MT6765 driver is configured to pass the device tree drive-strength
value strictly as a raw register value:

drivers/pinctrl/mediatek/pinctrl-mt6765.c:mt6765_data {
    ...
    .drive_set =3D mtk_pinconf_drive_set_raw,
    ...
}

The core driver then safely rejects values exceeding the 3-bit register mask
(which limits values to at most 7):

drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:mtk_hw_set_value() {
    ...
    if (value < 0 || value > pf.mask)
        return -EINVAL;
    ...
}

Since 16 is greater than the hardware register mask, would device trees
using this value pass schema validation but fail to configure pins during
driver probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-mt6735-pin=
ctrl-v9-v9-0-bfb19d8bb87c@protonmail.com?part=3D4
