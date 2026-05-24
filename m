Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C485614B08A
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779622053; cv=none; b=I9oRwkAXM9zWqaB4Q5Toq+dTXxjGR7vcXWykQ+lwd0R+tvCuRlZJBeSW1vqwtfIBn29kkRTngA+PHxNm9aqkNq4M5ioAEoHbvYI+LI8Iu1pLK82V/fsEkzKs3rPpEOYo51hsUGrLh4UnG4uSOMhhF5jQAxWFU4IjxtNTUOlzeYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779622053; c=relaxed/simple;
	bh=R8jz566Ks+MI71U7bnVE6smwcC3DHWZVWzOIYyRD3bI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q7goxBrS1UuGMtAebxjxf1xzcWDjsqXBBP6yePx+vkHD1ZVuG4dURKuU01OwGix2MP/STN6O2zP7yDaoP/QHKtf9dkVNwYEj2arDkXpE3VFdK5Y2AjdmPp7MNWYui5NXgM5h83igRCyvKp3tK1F/Cegp0TB6GV+ehXqhxZV8ztU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzLx7KP3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzLx7KP3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294D71F000E9;
	Sun, 24 May 2026 11:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779622052;
	bh=FkutD7UUMjeUyeT5lXTJ3DU+IWfPyCVw/j26fePbGbg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LzLx7KP3ryuSjsnzQbYjsik7u1cHCzd8hD1SDjtx12ktzw03wBoloqwNERssZVWoH
	 XLuhUozxS8L01X4klVWBaGR8b9C/fWt+nDS6xnLvLIuDNUqrqG+1/lKVSdHdaofERw
	 kusYFbtnY/AXe3Uem9WgcAVCcdUs0g5S2W+/S3VbQR2UlmDcSsrbx+gDqltPh1JU4g
	 ClY/1y1NxbDhRmNuKAw5nMc+6Pl6dVlifeFhie9L6NQglK8cxXcVWDt88jJzbzFwSn
	 rmiyM9DkGvsl0ZhmqoL5eTqw2x81RqgPhjWs3t71oYGBYjwqO2zzRIGilrR89bXOFw
	 zdM3TzMN1kAhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: clock: via,vt8500: Convert to DT Schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260524111813.39810-1-challauday369@gmail.com>
References: <20260524111813.39810-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 11:27:31 +0000
Message-Id: <20260524112732.294D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Broken DT Schema Structure and Selection
- [Low] Incorrect Regex Pattern for Node Names
- [Low] Missing Dependency Logic for Gated Clock Properties
--

commit 009c99928a4e9dc4ede2113118b784ee611924f0
Author: Udaya Kiran Challa <challauday369@gmail.com>

dt-bindings: clock: via,vt8500: Convert to DT Schema

Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
controller binding from the legacy text format to DT schema.

> diff --git a/Documentation/devicetree/bindings/clock/via,vt8500-clock.yam=
l b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
> new file mode 100644
> index 0000000000000..035925969655e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
> @@ -0,0 +1,179 @@
[ ... ]
> +description:
> +  Clock controller bindings for VIA/Wondermedia VT8500 and Wondermedia W=
M8xxx
> +  series SoCs.
> +
> +properties:
> +  clocks:

[Severity: Medium]
Is this schema structured correctly? By wrapping the node definitions inside
a parent clocks object, the root level lacks a compatible property or a
custom select statement. Will dt-validate ever automatically apply this
schema to devicetree nodes in practice?

Also, since the root level has additionalProperties: false (at the bottom
of the file) but lacks definitions for compatible and reg, won't the provid=
ed
example fail dt_binding_check since it includes compatible =3D "via,vt8500-=
pmc"
and reg?

> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +
> +    patternProperties:
> +      "^[a-z0-9]+(@[0-9a-f]+)?$":

[Severity: Low]
Does this regex inadvertently exclude hyphens? Standard devicetree node nam=
es,
such as clock-24000000 found in the example below, contain hyphens. Since
the parent clocks object uses additionalProperties: true, do these nodes
silently fall through and bypass schema validation entirely?

> +        type: object
> +
> +        properties:
[ ... ]
> +          - if:
> +              properties:
> +                compatible:
> +                  const: via,vt8500-device-clock
> +            then:
> +              properties:
> +                reg: false
> +
> +              required:
> +                - clocks
> +
> +              anyOf:
> +                - required:
> +                    - enable-reg
> +                    - enable-bit
> +
> +                - required:
> +                    - divisor-reg

[Severity: Low]
If a clock implements both features, does this anyOf condition allow it
to provide divisor-reg and enable-reg, but illegally omit enable-bit
without failing validation? Should this relationship be enforced using
dependentRequired for enable-reg to require enable-bit?

> +
> +        additionalProperties: false
> +
> +required:
> +  - clocks
> +
> +additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524111813.3981=
0-1-challauday369@gmail.com?part=3D1
