Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C8236C5BF
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631718; cv=none; b=fIaYdc4YMwlEqal6rdvDBXRYyioGmCyqrc60UNqndnVLqapDbUHF/mBRXnuIXrALcQkM9++docYvSCP/DcTAWhOAV/8QDvA+yILCYLo6Cer6qoEAjDWvaCD0gUr6AuliOeDl8cc7BcVuOkYC90Iy0liTjgi9/+ShdTaCsZ7dT3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631718; c=relaxed/simple;
	bh=sRlPGhCGHHTt4ov7hJXszEIQ0whp3tLjXniHjKa2HDY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ByiCRSUmSMC2ifXd66EI4Ym0GJXf5CJBg9CPkbrWSyIvYFCBijyimHKma681TvyJG9mYtba/IlxgKeLpMrFa2KNjQKPAG5IROy44yTFWhDPDblq9EPzd0CtzWFt1Hsb6Z9H8PtLg1YKjqKQ06Up0v+ysSVnHKMdjlthd6tIjbjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATEZFg46; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATEZFg46"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4931F000E9;
	Tue, 21 Jul 2026 11:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784631715;
	bh=vVo+TXP7WBPmc4uXcO18aptbPG1X9XazNyN9D6FBBok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ATEZFg46Qob0s7Imdg22VAKsweOpurpmeycjEdgvALOFLd3JtHZnqLzu7y58srTSY
	 +XwG+SpqK/LShK+g+5blWgtptRWiLV4O9thNBNLgSspgMmgRDx7AEDOSDqcr3lfWLQ
	 aaAtmeHGcgbYsCXiipmqWUEH60ECjYQxEcc6AiHv0QjVDCEGWr9RZFToEFAZqzT+aE
	 pbiA6YBWKTRzZL525PsFKWK9c31xd6x5RNygjIgUIZ4Bb4RivciCX5yiup0J0OIki/
	 T4ujtLrmWzPRGfkeCeklkqvIPtRPswJqS31qP1/9VvOSQnpDmyCG/9vA0GcCnEpkie
	 bYEzDpBO+NhlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Make resets
 optional for MT8196
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
 <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 11:01:54 +0000
Message-Id: <20260721110155.4A4931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Driver-Binding Mismatch: The `lvts_thermal` driver unconditionally=
 requires the `resets` property, which causes probe failure if omitted on M=
T8196.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Make resets o=
ptional for MT8196 ---
commit 8c88985c870e0f500a0c1636d7b632cee772d3c6
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

dt-bindings: thermal: mediatek: Make resets optional for MT8196

This commit updates the device tree binding for mediatek,lvts-thermal to
make the resets property optional for the MT8196 AP and MCU platforms.
This prevents hardware resets that could result in thermal protect
shutdowns or permanent system slowdowns.

> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-ther=
mal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.=
yaml
> index 9752351306703..29f431fcdcd5f 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -94,12 +94,23 @@ allOf:
>          nvmem-cell-names:
>            minItems: 2
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - mediatek,mt8196-lvts-ap
> +                - mediatek,mt8196-lvts-mcu
> +    then:
> +      required:
> +        - resets
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> -  - resets

[Severity: High]
Will omitting the resets property cause a probe regression?

Looking at lvts_probe() in drivers/thermal/mediatek/lvts_thermal.c, the dri=
ver
unconditionally requires the reset control:

	lvts_td->reset =3D devm_reset_control_get_by_index(dev, 0);
	if (IS_ERR(lvts_td->reset))
		return dev_err_probe(dev, PTR_ERR(lvts_td->reset), "Failed to get reset c=
ontrol\n");

If the property is omitted to conform to this new schema on MT8196 boards,
devm_reset_control_get_by_index() returns ERR_PTR(-ENOENT) and the driver
aborts probing.

Should the driver be updated to use devm_reset_control_get_optional_exclusi=
ve()
or similar to match this binding change?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721105230.1019=
06-1-angelogioacchino.delregno@collabora.com?part=3D1
