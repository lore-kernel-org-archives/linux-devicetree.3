Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B5E3955D4
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 15:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779636194; cv=none; b=eDDdZgQ7B44Wca21DfZNQtFoAz9Kc0A9vdbwxaTgFfuQ8Qi/pcXlIyCNLYtDtL8bP4DlC556MnDnwcZ25vbJCuS3tHq4jyfvCPKaTo2XJ6UbFAwFKH1u43NN+9Pn1fqQ4CoZHbeOV2cxoajDyUK6OJDiiYtNG+T85q1xEjmptM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779636194; c=relaxed/simple;
	bh=5nGYyyDqDBFR1dXA/5DT76VZzCrhZXHkyJXWKVcFooc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lQXHJ0FVsPTGixWxZnV2HzIIk0oS3yKfjC23cl9J/UjrvNFJoMvExanSX4EsRHn+hTzyw9rMwIDAclP45NCsKCFt3+Q5z4zp7Fihlrde7/C+8wffNGtFZS0Xu4YUGavtGevzWYisxipCftZdKfq/mwJJUiqhQwzPTHjySGEVVwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mf602wzZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mf602wzZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C741E1F000E9;
	Sun, 24 May 2026 15:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779636193;
	bh=EyH4MXiIOWzKm859w14kDQucpYwlERVTcs8ywUWkJeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mf602wzZ4wUV06Gpnmghsd8S3zs1izoy0Tr8AVyEZh/pgpflkZBGOz70IWUZkBODJ
	 NJN2GN1+C5F+r5xexQapZ3UlhVGITpoEYMMMAlbMOQyG3s18ufbjXcxr1SHobcSzxc
	 N38i/ddB7bgXT93iWH0/w8I6lT+1NtzDaYCfDOM/AbBjIWqQIbAqGyZ/1ahtsowT03
	 wFPMPyzMCgFK4SgKoWW4UBUdvEz/xuhi9w1pKYxHBdXv7RgljBFBuirJMNLK8wydar
	 1HdpVUqgk7sjGvSy0FN9x21nWR2Sh8oFms0+lUflPx84HFmMUivQgC8as4UPBBcrhy
	 sv192JmSPxsxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: clock: via,vt8500: Convert to DT Schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524151110.21277-1-challauday369@gmail.com>
References: <20260524151110.21277-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 15:23:12 +0000
Message-Id: <20260524152312.C741E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `patternProperties` regex enforces strictly lowercase node nam=
es, inadvertently rejecting standard `fixed-clock` nodes unless they violat=
e DT naming conventions by including uppercase letters to bypass validation.
- [Medium] The patch defines a new schema for `via,vt8500-pmc` but fails to=
 delete the existing legacy text binding for the same compatible string.
- [Low] The `divisor-mask` property lacks a `dependentRequired` constraint =
to enforce that it can only be used when `divisor-reg` is also present.
--

commit f63cd62ab71a54ca61f786bce852286bf98a7852
Author: Udaya Kiran Challa <challauday369@gmail.com>

dt-bindings: clock: via,vt8500: Convert to DT Schema
   =20
Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
controller binding from the legacy text format to DT schema.

> diff --git a/Documentation/devicetree/bindings/clock/via,vt8500-clock.yam=
l b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
> new file mode 100644
> index 0000000000000..51a68df6c2f30
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml

[Severity: Medium]
Should this patch also delete the existing text binding for this compatible
located at Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt?
Leaving the old text binding intact causes duplicate and fragmented
documentation for the exact same compatible string.

[ ... ]
> +    patternProperties:
> +      "^[a-z0-9-]+(@[0-9a-f]+)?$":
> +        type: object
> +
> +        properties:
> +          compatible:
> +            enum:
> +              - via,vt8500-pll-clock
> +              - wm,wm8650-pll-clock
> +              - wm,wm8750-pll-clock
> +              - wm,wm8850-pll-clock
> +              - via,vt8500-device-clock

[Severity: High]
Does this regex unintentionally restrict compliant lowercase node names?

Any standard child node with a compliant lowercase name (like "ref24") will
match this pattern and be strictly restricted to the compatibles above, fai=
ling
if it contains properties like clock-frequency.

It appears the fixed-clock examples in this patch only pass validation beca=
use
their node names include uppercase letters (e.g., "ref24M"), which evades t=
he
regex entirely and falls through to additionalProperties.

[ ... ]
> +          divisor-reg:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description:
> +              Offset of the clock divisor register within the PMC
> +              register space.
> +
> +          divisor-mask:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            default: 0x1f
> +            description:
> +              Bitmask describing the divisor field inside divisor-reg.
> +
> +        dependentRequired:
> +          enable-reg:
> +            - enable-bit
> +
> +          enable-bit:
> +            - enable-reg

[Severity: Low]
Should this section also include a constraint to enforce that divisor-mask
can only be used when divisor-reg is present? The legacy text binding indic=
ates
the mask is semantically tied to the divisor register.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524151110.2127=
7-1-challauday369@gmail.com?part=3D1
