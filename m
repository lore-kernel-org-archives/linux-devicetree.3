Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B154E06F1
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352657; cv=none; b=CJjYnYmBd/OPx5BO6G0Qa1GsLri1iOlaDZP3s0ZXXibmLjTzieBPDWnQ7YHBNtmtJ3Choq5qGPpLM2JhPsbI7W3RpuoVwFjdLYcM+emMvQ60ZEQ+GtWPYcdnEi8BELYd60w6Un8WlB/jeBfmi1cuPRww9w8thYFfEayNdANAAR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352657; c=relaxed/simple;
	bh=wvx7OtaEdMFHpSjNKPiot8U4iVC+m2fINnth+ZglDJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FdEk9ZZ0nxsH2lBSoNmVyh4tdf8g7Pdlu+EcX8N5Ok3Q2DX1v+SEw3T0+AEkkWJOa9qyKB373y9rVxa0sLwTjLWIHYdmJFqn9pVD7ByTvqz8547opHTFvLRobhdCmT3SCUifA4hAYFsCbeux2HThiJrqPntYoH12B1t26LxtQ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiaP8Ug0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiaP8Ug0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511721F000FF;
	Fri, 25 Sep 2026 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790352651;
	bh=zJ2ombWrl2CkFHULoe/AUESLyPVt/o7MFPzqErz8IX4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GiaP8Ug0leOx/70HEedhiKprUwIOGH9nlD49fxvdxCCFF/B/RMdZ6SUg1nC/8WGOg
	 jI8NslVPemdeVPiXIyPSnS8UkCCUHmKrzmPMLmZMQS+PNsmrKOF2/3B4eCUxGz6lh8
	 eqedbPJ4gvuY6JuJdgO3YP2sir/Ze6LpI4CdiNQoTaXEDmGMdACWF03C7kCoByomw5
	 Ag/Rv7rBgdODIJF6HUbCn0ITLuOzcFre271dpEBIffAf1VghzPqtZhJeJRFUBRt+q7
	 Nm9GoPPLfrO7f7HCi5EkkhIyNZiYhgyTVNKEvpE5sEhLC/UEdFnmSZlLT07okRXCgU
	 MPWAUyMyzgzoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: power: Convert mediatek,mt2701-scpsys to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260925155927.1707560-1-robh@kernel.org>
References: <20260925155927.1707560-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 16:10:50 +0000
Message-Id: <20260925161051.511721F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing if-then conditionals for clock constraints =
per compatible
--

commit 58363c1987ec9c749cc55c9a540860ff57ed2f23
Author: Rob Herring (Arm) <robh@kernel.org>

    dt-bindings: power: Convert mediatek,mt2701-scpsys to DT schema
   =20
    Convert the mediatek,mt2701-scpsys binding to DT schema. The mt6735 and
    mt6765 don't exist anywhere. The mt8183 is covered by
    mediatek,mt8195-scpsys.yaml schema. With those dropped, the clock-names
    are trimmed to drop mm-*, isp-*, cam-*, and venc_lt. The venc_lt and
    mfg_2d supplies are dropped as well.

> diff --git a/Documentation/devicetree/bindings/power/mediatek,mt2701-scps=
ys.yaml b/Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.ya=
ml
> new file mode 100644
> index 0000000000000..d991b8a008eba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml

[ ... ]

> +  clocks:
> +    minItems: 1
> +    maxItems: 20
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 6
> +    items:
> +      enum:
> +        - mm
> +        - mfg
> +        - ethif
> +        - venc
> +        - jpgdec
> +        - audio
> +        - vdec
> +        - hif_sel

[Severity: Medium]
Does this generic definition omit the hardware-specific constraints from the
original text binding?

The original text binding required specific clock combinations based on the=
 SoC
(for example, MT2712 explicitly required "mm", "mfg", "venc", "jpgdec",
"audio", and "vdec").

This new schema generically allows any device tree to provide 1 to 6 clocks
from the enum in any order, which would allow invalid configurations missing
required clocks to silently pass `dt_binding_check` validation.

Should there be `allOf` and `if-then` conditional blocks to enforce the cor=
rect
clocks and clock-names constraints per compatible string?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925155927.1707=
560-1-robh@kernel.org?part=3D1
