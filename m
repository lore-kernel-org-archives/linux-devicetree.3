Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9113033260B
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784977453; cv=pass; b=OmQirG3fe2yQ2zzii40YShwpxiCojjR5BElMfjaYCcWcQH5iY3fWLmKQDD+CIiGsUsysI51d8ydORo1mCayzqHwlp2C31oogLBK6aTfdQu5JntqXMoy5hYOcMUWZCwt7S54LeYHgzlnKEnf8jrMMVVAgCIogfOJfCRSd1kdK5Ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784977453; c=relaxed/simple;
	bh=wcjDIyZ1mnJ8cH/GZH1fTS6gxU6s/wkKmDJziA1q9FY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSLuK3RpVq8WlBl4VI1300hxWYUPLsgm7mkI1uBk5gDjHynL0rXtP3snKhSLdD1l+1zt0rsOb9408FJDJMfTsQowuNBHDLVnR/QPs0TtZRip/jzqadcI02NWfaNS/XrY+vOAQH+Svgj54zbKsQnIjng4fe40s8w9QT5tClG7V8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e23aUKXp; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e23aUKXp"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66771ded50aso1320907d50.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 04:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784977451; cv=none;
        d=google.com; s=arc-20260327;
        b=MZxeQUAi9U/ncI9dwvsmJQa3QZSjjnfpQVyskFdBANhsNTKUc6X2UeD4JVNUvzJuF8
         AuH6pNYUdlq4k0FQpqeMrq8QH2QWszimBm9HXTjklfi0TZZ17ElesjYvJcR/moQLLiSW
         SfYybzulwCoyUEJKQCc9GYhnkHb8byU8jevt1RLb8AGZnsnb1kVxRBAjZnL4rN1Xj/pN
         FNyzutcIzUAQz2mtQQd2mGLCPQD+G47WBnLXV16neHha6R4VVVQhQz4L9ZZZu23rAqYA
         Pvwx5sEEUcHskQC3CRmt7GZBvfdo1ein59SrGsZ7K6m4fHPw1OLpGonAOZ9TWAxQ3BqA
         1f1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=srA1KnFMtAkfLylpBOd38/AYtNBjKS4SQUhSrptcxzE=;
        fh=jFHGhfRl533SMTN29U6NOTsNvh9SE2G1SS+CXLKXIXg=;
        b=hf0qYqpPQvZWFtaZ9HlFjsWBTgqsVub3eNKOs6YKExDFquxZUdp2H07Ggssb1SgDlX
         UHmWt9bPqInR4DusH4Ik83Sn5smy9UhefXTq9t2a6lVSvMcSAa935YQ3wrUZbVUSwHQv
         jmes5zmPsPHTjegq5tnNqKZ41lmxkr7drkMBqW+bUEREHu3nFa8qGKykEBun/i5xVWu5
         yfsVjJtFUIkTg3F6IDsPcWuBniTnJAoXjeIzqXF3r9XfyWbWrJnNI5/T0ZDIa5P8860b
         LTG7xvGTscIdCUkiV2V3ZjG8iGCfByouWQvoV9DQZnbsLmn9eTGTt0niy+h37r19vLSG
         6E2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784977451; x=1785582251; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srA1KnFMtAkfLylpBOd38/AYtNBjKS4SQUhSrptcxzE=;
        b=e23aUKXpV68pzkUO1/ZhR0USB5/YXS5oOnMiTW0bBVUVraWHCMEnIU8V0VE7Q+S8X4
         zl/iobVWaQw7vZZGC0U0k2UEcQRlYU92asZNd4FiXA10d22Vg2nfQTJm4QHg9FzA8knl
         ccSOBrn6O+6R7Fl/N+BdtMd3TCMhVJxYRMn9l+mxj/Veja0CSLu6v7Ssh4lmqnY08T8x
         2HjdXyXUK7zK0TRs3UxXk4eakzGNKWQqhNGOyU12CrlOxTEfU90dyjEyEh5Ej1KTOEiR
         1oj9/6TJboHzwD3p28kwXK8AgniQ42GWMsqrjV8yGQjFkEOZbcIoVE0pg7SrATegAZln
         6FCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784977451; x=1785582251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=srA1KnFMtAkfLylpBOd38/AYtNBjKS4SQUhSrptcxzE=;
        b=iGMhBvs6ISd5FC7Xkj/J9RSVOZxAzimnz0K9Zl59p+vaapEBGYAl4K80MCM6OeSncW
         ofd8112IGUrM8Yt9OGi6ancVBWD51syEkU9sQ7GWttbteP6qXQzVSa7kMoidiUt5XrbT
         9DOQVOWJnXKE0s5y1AEFRKrZ/QUanbVKiz5jTgqRFkEKzQtEIqAIpdbeWrbhQXCGGE8m
         YjrRGhKMK7lDHAP3Zez8fHk8QCm8IhYLRl8fyrhxEICWjLec35g68yiTBjS393Mqr+Ks
         CEc+a8uumtNZhGJJqXxPvfVN5L0iKTyZt52GuLxB3n1pQafDRBjbpe4+8U6wFWEkN/ww
         gkTg==
X-Forwarded-Encrypted: i=1; AHgh+RqPlQqsq1N1fG6JoLR5TXmxFXnNDNX7uz2DaAY5gAyQv42L9iTpXZbni/0n1lcrVrCh+jE9sj4loBHs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ABw9A7/p56b40d1V6zi9ZfZR+rMIyCuuIT2NBhlSsVr/k+2p
	KbpYJyPdegscHZNTCEIYpu9KR0z8uwukMLDxX5BOCkxraMYVMCjAlha0AoN7yn2Rj1FSh4cboVs
	0yV7naa35SqagW8RzmtIfzHpmwRB4AMc=
X-Gm-Gg: AR+sD13sA7ROnXZpsyXpNyYUH2vCbwFOC9j1tgPUCcZU8oWVxGOaA3EqdKo3qWrqfZj
	Goe7LlW4+int8fBqGFWzM/zSiEqVOcWT4TQPCYQXWdDR8kYjt2SnzBAJGo0FNtp6XoYWldefFg2
	a9NZWMpxviIsS/0ByylK5DAxiOiw9xGsjUuse0KeCpPtP+8IvgPgE9KBgmL0LU4TluSnTx7yrS5
	+BMZ7proYL3Btt3tREagUEfukj7Yj/xZAuhgvswo6HU2rbLrGQ4Tr7G3ahKWg==
X-Received: by 2002:a05:690e:408b:b0:668:9ea4:7752 with SMTP id
 956f58d0204a3-668c7cc6459mr701858d50.109.1784977451490; Sat, 25 Jul 2026
 04:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722123243.341346-1-challauday369@gmail.com>
 <20260722124415.63DD11F000E9@smtp.kernel.org> <20260722232109.GA2760962-robh@kernel.org>
In-Reply-To: <20260722232109.GA2760962-robh@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Sat, 25 Jul 2026 16:33:58 +0530
X-Gm-Features: AUfX_mxoYq1Nw4WTzKfbaV0jD0Ve86ial1pv1PtAGx0_6Mj1lk7duKXcz1N3sSY
Message-ID: <CAAj-GB=AP0m71Mm-+arX6kYEo8w8Eyah_aZp9c0e=4KQuc2r_w@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

> > > diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> > > new file mode 100644
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> > > @@ -0,0 +1,107 @@
> > [ ... ]
> > > +properties:
> > > +  compatible:
> > > +    const: microchip,pic32mzda-pinctrl
> > > +
> > > +  reg:
> > > +    maxItems: 1
> >
> > [Severity: Low]
> > Even though the changelog mentions removing #address-cells and #size-cells
> > from the schema, aren't these properties still present in the
> > pinctrl@1f801400 node in arch/mips/boot/dts/pic32/pic32mzda.dtsi?
> >
> > Will their removal from the schema cause dtbs_check warnings for the
> > existing in-tree device tree?
>
> Yes, but warning is correct.

This means #address-cells and #size-cells should be removed from
pic32mzda.dtsi too, which will be a separate patch. Does my understanding is
correct Rob?

>
> >
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +$defs:
> > > +  pin-node:
> > > +    type: object
> > > +    $ref: /schemas/pinctrl/pinmux-node.yaml#
> > > +
> > > +    properties:
> > > +      pins:
> > > +        description: List of pins to which the configuration applies.
> > > +        items:
> > > +          type: string
> > > +        minItems: 1
> > > +
> > > +      function: true
> > > +
> > > +      bias-pull-up: true
> > > +      bias-pull-down: true
> > > +      input-enable: true
> > > +      output-low: true
> > > +      output-high: true
> >
> > [Severity: Medium]
> > Does this bypass type and constraint checking for the generic pin
> > configuration properties?
> >
> > By assigning these generic properties to true without also including a
> > $ref: /schemas/pinctrl/pincfg-node.yaml#, it looks like the schema
> > validator might silently accept any value or type for them, missing
> > mutually exclusive constraints like having both output-low and
> > output-high present.
>
> This should be addressed.

Taken care.

>
> >
> > > +
> > > +      microchip,digital:
> > > +        description: Enable digital I/O.
> > > +        type: boolean
> > > +
> > [ ... ]
> > > +    required:
> > > +      - pins
> > > +
> > > +    unevaluatedProperties: false
> > > +
> > > +additionalProperties:
> > > +  oneOf:
> > > +    - additionalProperties:
> > > +        $ref: '#/$defs/pin-node'
> > > +    - $ref: '#/$defs/pin-node'
> >
> > [Severity: High]
> > Will this oneOf construct silently accept undefined scalar properties?
> >
> > Because the first branch lacks a type: object constraint, a typoed
> > scalar property might trivially pass the first branch and satisfy the
> > oneOf.
>
> The $ref has a 'type: object' so we should be fine.
>
> >
> > Also, for valid child container nodes referenced via a phandle, the
> > devicetree compiler automatically injects a phandle property. Since
> > that injected phandle is not an object, won't it fail the $ref type
> > check here and cause spurious dtbs_check errors for perfectly valid
> > hardware configurations?
>
> I think the $defs should get fixed up with 'phandle', etc. added. You
> can check the generated processed-schemas.yaml.

Yes, it is automatically handled by dt-schema.

Regards,
Udaya Kiran Challa
