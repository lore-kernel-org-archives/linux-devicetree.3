Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085AC4B44BE
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867168; cv=none; b=NhoOf3nP1WBdfuYnHUp/u9IEYZ2zr/PPOhywWgSjzOCR/y769WAyZ9GmUo46f9jsT3RfA6Rb96FpchflShmsO0d5BV94bQbS3A3DvW6grZ9+29dNAP8+KqbDeU119+8FDzGHkikhDFlXPrQYZWQa1pyhGChYZnk/8aFWGVxFzTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867168; c=relaxed/simple;
	bh=yKOHg5J0K3uwLyETRU1fiSCckIlLyZ3iU3lOXbc3Ra8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=joJn7DTnrvJs7ShdFEacyn3JW65Fub5D6w8DdgCrUBQFBa95vJKvU5Rk0+yT9lYXRfEdPnDPVQdUgvEvcGYke2rtW2zJbD7WFTQZUVnxoklubGaiZYFKwmaBqI+53cJwGI9k8xWngKFAyluwyj84czKyad2M1PC6fz0fIZl2wHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYrwjGs6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYrwjGs6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F78F1F000FF;
	Thu,  1 Oct 2026 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790867166;
	bh=SwvjejlLjpsnv/ptqh0WI/xAFRiBlqWPTi5XgXYL18M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYrwjGs6bRMyTyguOCwWzwyiuDfQ4JLs/9qG/So933y0lhiIU4FH+PMud7hweKqOl
	 C5+OXMGWXXzxtnB75cL7E2GYLTmxfh8erZfkDyFHXiATwgwf2+w61V9SdkzjhoyZ0x
	 ZABs7gz4M6/he0Mk8SG1O2AdezU58zUrVW39qA1lLPpJXPvjPcO+Fz/EpXdb5jebVL
	 jD196C6pPVncCutc41yUBopc8pL7DIqmMsGuYbo0Dgiz7vpVipgM8H/PAiL5RfbH3y
	 oFJi8IHBmoau8LBuKJ2efeDe+RoN8I56albWczWnP2YpAlokCyKYukVOv6BkoW7yUw
	 4kgYC71avRx/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: add bindings for stm32 mdf
 filter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Moysan" <olivier.moysan@foss.st.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001145702.2628429-2-olivier.moysan@foss.st.com>
References: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
 <20261001145702.2628429-2-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 15:06:05 +0000
Message-Id: <20261001150606.3F78F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: invalid decimal-only regex for sitf and filter unit ad=
dresses
- [Low] dt-bindings: faulty regex in mdf-dai and channel patternProperties
--

commit 0433e9502551ab7438d761bd69f15064435b1ccc
Author: Olivier Moysan <olivier.moysan@foss.st.com>

dt-bindings: iio: adc: add bindings for stm32 mdf filter

Add bindings that describes STM32 MDF settings to support
digital filtering for Pulse Density Modulation (PDM) microphones
and analog sigma delta modulators.

> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.y=
aml b/Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml
> new file mode 100644
> index 0000000000000..f2fbc3e150e8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml
[ ... ]
> +patternProperties:
> +  "^sitf@[0-9]+$":

[Severity: Low]
Is this regex overly restrictive? Device tree unit addresses commonly conta=
in
hexadecimal characters, so an address like sitf@1a0 would fail to match this
pattern.

Since the top-level schema has additionalProperties: false, valid nodes mig=
ht
be rejected. Would "^sitf@[0-9a-f]+$" be more appropriate?

> +    type: object
> +    description: Serial interface child node
[ ... ]
> +  "^filter@[0-9]+$":

[Severity: Low]
Similarly, does this restrict filter unit addresses strictly to decimal dig=
its?

A node with a hexadecimal offset, such as filter@1e4, would not match this
pattern and would fail schema validation.

> +    type: object
> +    description: Digital filter path child node
[ ... ]
> +    patternProperties:
> +      "^channel@([0-7])$":

[Severity: Low]
Does this capture group differ from the allOf constraint key? The allOf sec=
tion
later in the file uses "^channel@[0-7]$".

Mismatches in literal keys can sometimes interfere with schema aggregation
tools that rely on exact string matching to properly merge subschemas.

> +        type: object
> +        $ref: adc.yaml
[ ... ]
> +        then:
> +          patternProperties:
> +            "^mdf-dai+$":

[Severity: Low]
Could this regex pattern be a typo? The '+' quantifier applies to the chara=
cter
'i' rather than matching multiple child nodes or strictly matching the stri=
ng.

If it is meant to match exactly one string, would "^mdf-dai$" be intended?

> +              type: object
> +              description: child node

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001145702.2628=
429-1-olivier.moysan@foss.st.com?part=3D1
