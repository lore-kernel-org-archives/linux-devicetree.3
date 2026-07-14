Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1306D3E1CE8
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013272; cv=pass; b=pu4iAbtgr2qPE8gWzUytp7PYGIJM4NzHs9PtUspnsb8MfuClwdaWnJFYXb2AfeAlODj6pv9vhpavs3c1PbJ4sUGCaOGAeQeTuRz2GVRjfyPfLhhqjDx8Il3RhUi4VaJrFg8umar8/BPsPSBXvdZ557wQspJh8CqorgVe7BdUu5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013272; c=relaxed/simple;
	bh=dn7IW7f8g4oFd9sIoeJ6OCN9TIFKIj/He1K2oNRFlRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pi4ojaKtJvYtb/vlR4M6VOcMJ8l30r/DHHjbzDOoTu01fZjMNYNFKusNV90RPqNWcLwZeWuB6VMCGXxVLf90jVYG0+WZtsFbyV/yYREl+Dh0PTQoBeCdETC9TUnOZzEe5PhUU2lnhqwQxLUT7JbvAbnFSzopD+RSv6eetKbIe9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=cJDKc3He; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="cJDKc3He"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15ec1da77aso456476666b.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784013268; cv=none;
        d=google.com; s=arc-20260327;
        b=lMoA6fcbRjyZFKU1aVwS/FSS2G02dj3Ik4/rMA71cFdSLJUtIkkB0UCOmnjVtb4Qby
         xKwqcJOrC96Gsws9Ncc0XKaVJzWCv27igMrOJ6cT+M25MfQ0mdwWaevtT0j2jznzRLJ6
         0fLnMnVeXRuIW5WRlPG+8PgNplLz8rLPq4es31DKs9lcvd0KLd1KvZM1iMQ71OLAZDSM
         DAQcg42AWfSNK0S6ZWV5NrDZFr2ViuaIJg4/T2vly/Yj+hFbZPjiG78auMijHTm4O5PS
         O+Q1JEsySHosfl6pnTCMEDpI0DEwb/aO4UIBsPbRhxZsi1bh0Vav2E/vaU0QDAItp4sd
         vqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZGRru2gQA+Baamgw+dIgFvngJo1yoHHQsL5cdXvYIZ8=;
        fh=C0R1xryekdThhlKo7mPl4tmEQ24TmaU266mWjufcl1k=;
        b=CMG27hLloDHKeDgwCZEc0ZS6ccFVj5aVO6pJc9oIASvUb4GTD2QkgPVQdA4IphR8mQ
         TsomQuO54Wc9467FTKW1hRqq6OREezcfS7yHIqKSp+e6A6+znQeJUlVi166ksX0LZxvn
         X7NqmkuLVuxIjU7DvyTit/h/eRcIU5VPrg7trSOiQ1ahnomFTBi7GYrsgxHLvwc5CDd0
         0RjSqjRg4/dNKWqatO8xCj2sbR331w28N3U4hQmbZRNJ6KC0WUEItZiprxD9nRIsuBow
         rwOPAl9K9KUUyRM3/jMLF61RUcHAfZP0bR28KZlWuCCEbwTN+SsdUpsnn5LzaEVkznjx
         N4jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784013268; x=1784618068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGRru2gQA+Baamgw+dIgFvngJo1yoHHQsL5cdXvYIZ8=;
        b=cJDKc3HemVX7jhAZisoNdP3xH5opCV90joefkqzW+HHkFe+Jt+cWe+tQLnvgqQCM2/
         FQXZYrJX+2SRqaBtT5bRjXbyDtr+f/VtFCnyz5AYEdS0xK6P+1pzro2XyfVKEQ3RVCXa
         +CKTGk8fTXtmnORuNWtL7+JnF/4+j5jXqsw6bHLxNRYGK7wI0GuHvZu09dKDkHPKSbFP
         ezs7yCfkpcbNNkrKl9tTOK/rwvn/j8NE3Zq3Pa52xRtVOgN24ls2arrTK/Cf3czp2VYl
         qtIUVoLD+r021WytKO20Jrw6RseRp/VMigfTwGdpgaKfW4n0pUFMLI9va+8PksYhEV9h
         Z8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013268; x=1784618068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGRru2gQA+Baamgw+dIgFvngJo1yoHHQsL5cdXvYIZ8=;
        b=PcE37/NI1PJDPAcJ20wPHHm9/JF8exIoXPy/dwMRtDU4yChZhgNZOCtzlkiaSpO4wA
         kP4ELduAZpIkF39z+rZq+6phIbNEO/IQOYnH+egNzNu4SlXL8brfOW1PPXvxBo3wFBjT
         qBdDRx8B2o6QdCeTo+lrlDihD/s6YD7fZTda+MT7bmwMGV2VVcjSN8IUgbA0P+aSSwYX
         KQVZmja6QuCYiVbNtsud/J/IFcGU5cHmmia3xOIMZJDAlIn/B9nWH8yd7ommzg9pcaUD
         gO4ubBw5xzYmxrJG3ze4lgfJ+oFVnAd4MC1pnsezoltjzfiy9NBII+5DiISR8Yo+JpCI
         QNgA==
X-Forwarded-Encrypted: i=1; AHgh+Rrxz8m10DrKvhjT4k4fwmWDoZUwlGDPWLKlYlB+ktEVj680LG9AbDcJOzOcpTTG+MN+mfIfLlOfZv5/@vger.kernel.org
X-Gm-Message-State: AOJu0YxfjkJHzdijktJF0NvMRAmKJLgvWBWWJ4NzYml3gugAycJ/OIJR
	psTJ7jplMTgI/vTP4BOgD2VkkfxFF7CyhhydfxP5yqNH2vH/j96OxV8iz/rJgK+qacK2UURAUJZ
	3nS340QNcaBXbw0kRZqKzatvRK/eq1BzHCROCedTOpw==
X-Gm-Gg: AfdE7ckItE6JQUB6RRL/GysyWNCU9DSNXSnFZ/c6wZKvACfqCRrDKmyWFJB/meO9WOK
	BQR7VhAt3hgTr7QEiEUckj6oBczzjLpzWfWFSmO1XfJ+D+usWj6t6MEnWDrNSVCG/2XYZCXZjaY
	4sJJk9I3yP7x57f+UdnxOisZXmHDHxMlfbrooe3FVxGuKwW8/2FcUJWGZ9dccr6TPocyAp9soTX
	C3KAAM70/coSljdhS8IYpK1AEZX0jKo6mVZ7qhOgdWkClNpy3seEmQMSC0Sznj2Pz0JEgtlmYNj
	SLcTS5ldb1+T/gGXnsrAYRtrqu4R6rkJ/OBZVHlLLPgIvzylimeu4RXWDQt+l6NsbmKz
X-Received: by 2002:a17:907:934b:b0:c15:b368:28ba with SMTP id
 a640c23a62f3a-c166196554emr121126866b.56.1784013268492; Tue, 14 Jul 2026
 00:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <501428d6a6cb1548bf357c25313dbc319724ead2.1783524645.git.gregoire.layet@9elements.com>
 <20260709-shaggy-discreet-dodo-e5ffbb@quoll>
In-Reply-To: <20260709-shaggy-discreet-dodo-e5ffbb@quoll>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 09:14:17 +0200
X-Gm-Features: AUfX_mw1ITD-w1oVJUIDHcxSt_M9AD3AkUSAllXjq-zp-XksDV-7pwC0diYVWEo
Message-ID: <CAFi2wKZqHsEa3B9KMDyVk+1Ef42u4TqWzqf6O4SXtamRnWD8Yw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: serial: 8250: aspeed: add
 aspeed,vuart-over-pci bool prop
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof.

On Thu, 9 Jul 2026 at 10:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > ...
> > @@ -27,6 +27,16 @@ allOf:
> >              enum:
> >                - aspeed,ast2500-vuart
> >                - aspeed,ast2600-vuart
> > +  - if:
> > +      required:
> > +        - aspeed,vuart-over-pci
> > +    then:
> > +      required:
> > +        - syscon
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: aspeed,ast2600-vuart
>
> else:
> ...
> disallow new properties (see example-schema)

Yes it was missing. Acknowledged.

>
> >    - if:
> >        properties:
> >          compatible:
> > @@ -223,6 +233,12 @@ properties:
> >            - const: uartclk
> >            - const: reg
> >
> > +  syscon:
>
> That's explicitly forbidden by writing bindings (and mentioned as the
> antipattern in my older talks about DT).

Missed that.
Should it be named to 'aspeed,scu-syscon' as the aspeed SCU is used
for all the peripherals.
Or should it be named to 'aspeed,pci-syscon' to specify its purpose in
this context.

From what I have gathered, current convention would use the specific
name 'aspeed,pci-syscon'.
Would like some feedback on this!

> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the SCU syscon, used to enable the VUART over the BMC=
 PCI
> > +      device. Only applicable to aspeed,ast2600-vuart.
> > +
> > ...

Thanks

Regards,
Gr=C3=A9goire
