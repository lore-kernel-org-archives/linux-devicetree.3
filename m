Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449819;
	b=3yA/lpTM0UGuNPPf/YxZ/mlNPZG6UazH9BGQxOxm2WF8XkqVkuqvSaMx4f/ZLNEGcCDk
	 mquc30p/dgi1eNxpzkru3S19nfL0SQk8+Xl8UE/iy65BGFh9h6FiTjjlX+53I6Wap5Y7F
	 frepxRMtlYG3T1oI00zEz1P8D8G5XtW0tQsVwZj44+3QupNdSkdIa+cqJzQrdJSkLQrQz
	 Ar2R1M27pW4rmEGuQFFzLekT+bHL6TraxsPfAF9GRVpCOKP2VgEP42bQoe7jtmVg7/KEh
	 1tEhjPDDHAp1iOdgH3b4qCIqA95p55jYBrABOul+j1aUvVeIOZChSUZg9o+2z/LM44g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
	b=sSPjeSxAa8LkYlhpF8o4UOdSOZL9kmRTaXCiMGqfPZwUOrfT6xEJ2anw+B57lOfkznQ4
	 i7R+udvhJinq7+zrfupFXV7a0oj7tab/P0CxfPdywx89WsDab0mWHrbVcP4kUE70oRwE1
	 jT/1kb4lVB0AfMXONBJnVXqceXnb34QvixIjV/BbW9OZKrvNfZIGJhL8tJ0b+alXQvFM0
	 uUdroqZx/4o0xC5albR0BddgMCCDGsd4tvUab8Gf+ZPZSgQsm9PWHZRU87E74fMNXNljz
	 KUAnoyeL+9CQer3oPU3TGO6ElIN7ZqldHg9qUIJX8DzwtAwUgRwzCzDirixJj9SRDcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPxbmlxH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB991606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB991606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPxbmlxH
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so569507366b.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795449817; cv=none;
        d=google.com; s=arc-20260327;
        b=Ofg142miQYPut3zVfPANs8Tth880L//tYiSThJqS6fkrQ2KDMos84Bqy59/SGKcGAt
         nuSEf3reLKWvjrswqDch0mLpfDyurr5VPU9gpQkSSJs/kXkjP20GBjD4fPzP/yHoHeVG
         /RRiJqeIx3EcWCuniCaA49nFdR8n+eWigAozrXFH3P73vB7e38WExvjkK6mnu1/oQFI7
         R8af02my6Jlee2Z3fS5Te/G6cGHjb1AwWEs1kcUa+PJk8/6PB8UhNfGrEkBPdDL57nPc
         VZL2ryBExfZztlCACmJfOzzT1IXwilWVgmLGTrpBFj9rNrBKIORE2sczq9zw7/Mrxogv
         LAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        fh=7Xqt6FgLe0hdm5CZm21p0ZvLDl1fV+P70Ni7GazvfFA=;
        b=B4oDJgoWoTvkivjr7UvuGdNXylyMmYYO5QXtZ+fzJ3odVt1o9t19HXZ9ezqrB8oVV0
         PGAiS9OCcxdTgzPVIG6uAn5Xy6UaFNuTbmmX6C0YsrE/30oZch2+UmH+xpGuw50Y7f+W
         cVKB9vBG/YW4n2Y0KzSXhOtE5kStek9AP9TqgD17DHhXmxJ6W21ddd4Z2xIA0Br2y3r8
         eJSgC9tPhFtbdllEfS/Hl5UaJVYH6OfS0hu5zfTDoZQOafCAmBaXKAQ9VXBRxiajuFAg
         nFdUffSTYIGogZWj+zw9q7NGqvxeMlztiAB2QNJX3ok4h8goHs10RuEkUXEeqq96wDVj
         zUyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449817; x=1796054617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        b=kPxbmlxH36KRhpUs3rX2kF9cu8fs6nKcvV2Ep5Yd1SAPElzfO4U0yee+eyo4yYjKG9
         bVabsqjgWrVObshBsNWmZu0Kc8SGNvonY7/47W6xWPu+XZzUut9DZVDasYOasQeH9Kb/
         cxLOB1EaAVkrHLcauEnwPg9EXJ3MPHywPaLoCpTE0FTTIAii7phK7Avi7MNPjJVN89DP
         s8LFLj0Mqsxb9tOW2pKJn+UDcZJsxmwmdbWgLBk3GXWSXPM0Y4SECfoiTVmHq/AsVfEi
         eK10GDKZe/X/rTJwTT3GnOPtaNslesh71E73eFd/jgj3heXtLGBeR0+t6FPE8tiFDqrG
         Ouyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449817; x=1796054617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        b=Ug3Ao2R9hl5lOZDokva7jPu2jp9RYiSB81tP8kvEhlylgGY9eWraENAgCKHG5rm1ER
         ITfkECj21/cIt7oY3NEJb+tEu52X2Fnp+4YLDBB6soRQS2XdSYBRoBFdOIQoRks5sL4C
         XHyi5kWZHtlqsoMknBoA2zOJfc1RLVP7+eSLEtrYCZB5ftInZ7gs3nu85x2Ag3V54E73
         D95VKmXYZOy+bHkBzdrrnl4zj186dbRlMXP8dLdCDQTgfPRYitU1PY3t9K2tJq71Y8hK
         GwSei4EmOfiiUl1us+MEfgDyJNj1/6MUdQ9ybM++jWVMWWuAYc6dnO060LJEBOq1QxqC
         k9SQ==
X-Forwarded-Encrypted: i=1; AL+hErFTibdHqstfBLvcmNljTQKtjh4tgWMe3HYCe9eyKanVK0XUgSsjEHVbW3gWi8bdWNVsK7hVa+uQO6Zv@vger.kernel.org
X-Gm-Message-State: APuU4Z+SlgHgz6tgjPf4i9pk3TlRzL8jSDTTov49Kr37cgHg7MHoUhWT
	NLUqvRkVFafygfKnnJKjpIO9bCRMcVdN8gwqPH4ORHht2eVUX1/Bm43Hl33mT01UroDdbTbbEqi
	pN465/V9iqlXIbpgZR6f+cgRz3AnxMN4=
X-Gm-Gg: AZFdTZf1GvUO5UkBWH7JxTn7m9grXRr9+YghXCbsv9lZI6GZbFx0L76LUOhMbfimlS+
	8f3en+fUC+4vK+hG5C54ppzbWXDdvhEnSBz4ef2v6dpUByuDMd2fA34Yn7K3CGqJC72vflum+eP
	cXE8I6d12bXi4blnDhrokt1PxVYLuzvFY1RhDIztVKw/czMt7+61V515ryq/5uHKfJiM72WRJPm
	6FrtBs8HaWtsELigQtZ0DLZWEADOjAWPqmsjdGIrMKy7oO4yIYMAxUogFSlALNAdohQn5WJ/sE+
	8UpcgrdXWu2QQFf1uHyjBq98cBTNzRAHlBp8GgAQazg7kHCausTY3/lHsalPghbSZufqBOrh8gm
	xrH0TTZmk/VQI598sNDYFHwxRz1coqp+MNyutgr0=
X-Received: by 2002:a17:906:9555:b0:c50:52b5:e17 with SMTP id
 a640c23a62f3a-c513a5e1d53mr819834666b.13.1795449816568; Mon, 23 Nov 2026
 08:03:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122131900.2951586-3-a.shimko.dev@gmail.com> <179543998153.3135.2533998901272176773@kernel.org>
In-Reply-To: <179543998153.3135.2533998901272176773@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Mon, 23 Nov 2026 19:03:25 +0300
X-Gm-Features: Aa3M54qYkFzn2AliFXf9fRcB52n5j1nfOYqfcsg4MxuHxjWphZmjYJahIu9j42A
Message-ID: <CAOPX745BjECumVGmNOg3HqagFVz=Bcz=x8-shzjyGjHmN8+NSQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:19=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The new `leds` block in
>   Documentation/devicetree/bindings/net/dptel,dap8211r.yaml mostly=E2=80=
=A6
>
> --
>
> dt-bindings: net: dptel,dap8211r: add LED nodes
>
> This commit documents an optional leds node in the DAP8211R PHY binding.
> The PHY has three LED outputs, and each can be given a color, a function
> and a default trigger. The commit also adds an example with two LED nodes=
.
>
> > diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml =
b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> > index 4cd0f9730d954..772329feda059 100644
> > --- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> > +++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
>
> [ ... ]
>
> > @@ -45,10 +46,40 @@ properties:
> >      maximum: 2250
> >      default: 1950
> >
> > +  leds:
> > +    type: object
> > +
> > +    description:
> > +      Optional node describing the three configurable LEDs of the PHY.
> > +      Each LED can be assigned a color, function and default trigger
> > +      (e.g. "netdev" for link/activity indication).
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      '^led@[0-2]$':
> > +        type: object
> > +
> > +        $ref: /schemas/leds/common.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            items:
> > +              maximum: 2
> > +
> > +    additionalProperties: false
> > +
>
> [Severity: Low]
> This isn't a bug, but does most of this block need to be here? The bindin=
g
> already gets a leds definition from allOf: - $ref: ethernet-phy.yaml#:
>
> Documentation/devicetree/bindings/net/ethernet-phy.yaml:
>   leds:
>     type: object
>
>     properties:
>       '#address-cells':
>         const: 1
>
>       '#size-cells':
>         const: 0
>
>     patternProperties:
>       '^led@[a-f0-9]+$':
>         $ref: /schemas/leds/common.yaml#
>         ...
>         required:
>           - reg
>
>         unevaluatedProperties: false
>
>     additionalProperties: false
>
> Most of the new block repeats ethernet-phy.yaml: the type: object keys, t=
he
> cell constraints, the common.yaml $ref and unevaluatedProperties: false.
>
> Only two constraints are new. The '^led@[0-2]$' node name pattern, combin=
ed
> with the local additionalProperties: false, rejects led@3 and above. The
> reg items maximum of 2 limits the LED index.
>
> Could the block be cut down to just the constraints that limit the PHY to
> three LEDs?

ok, i'll fix it.

> The commit message also says:
>
>   Document the optional "leds" node supported by the DAP8211R PHY.
>
> Before this patch, a leds node with LED children already passed validatio=
n
> for this PHY through ethernet-phy.yaml. Would it be clearer for the messa=
ge
> to say that the change limits the LED nodes to indices 0-2?

I'll keep the current wording for now, since
the message describes what the patch does (adds LED nodes and an
example) and the restriction to 0..2 is visible in the diff itself.
If the maintainers prefer a different wording, i'll adjust in a
follow-up.

--
Best regards,
artem
