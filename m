Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C80D39792F
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351405; cv=pass; b=PaKVSJh0KdPFvG5G1Qye9JE/87EsBGmAFvV7mo9Wzn6P25Nmjo4EJZB0fwOS1z44n3ailI4tKAH+raktXBEVKqZm6VTfHCbno/EZoiQrzkw9dECanMRmY/4uPI+8Ylw/YtrtRSfjG9k5YCkcsUG+CVgsAT/ZGwKleUrcrfG8TZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351405; c=relaxed/simple;
	bh=vsOKCOkyS6rUiXdWk0fb9QExEqjNoSQv6E1PbSa1uqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeWgMLK4F4MdShI7vRLAK9ZyTo5Rf2a2sGwOO/Wc2+OLUABc/iLcF4F6UHGXZwAZN/8b+v0WYhb2HVxDj+TYmODf9c66j+nFA/IJLbVJurWWQw8vutHKl5lKbxYpvEhwamie3CGrx/oNYeEMeI/geooPPHpHtqYhmpCpiy7xSkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcZA2NLs; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcZA2NLs"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso2141893a12.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 01:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786351401; cv=none;
        d=google.com; s=arc-20260327;
        b=jqeVurJCuyKsJYTt7w2EBnIsMq2h75ivvIfHxP5JjL+INNypIxNEHQrkVy5V7/l+2r
         hsnu0D3lit+MnX+N2Qj5Dt+GskBlGAOHqZp5MhiXfLd2ErKeYPHeZIxluGZ0qdHSQvfq
         ZQ/f2SwFp95T64y3TAIieYtX3kJO3u2OPMzLbW1gTNRVCDM9KUl9izEtUpFJuTnd3+iB
         2WEjJfGfKBvA1TszdSsbjpTyog6BRc8bTJxD0MzvBHfrHDa/qvG/qQiLY82N7paLoz1a
         iXbS8Q0G/MrhTtterLeMLUeptB/BCqsMxf8mqWdwXeIkZXo6VlEGPh9KK55D4bvVegXj
         uUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ibzUgXOGiUGkOiEFkYb/0y6YpV4m0bbnGovRuTHx8eY=;
        fh=GxxP3XmwaWISnt1pt+uC7Ts3v3O9OaBGjD1XNS46iwU=;
        b=S/xUYNWqYYz+LMK9t82pGVkynlqZpB/OC+Cu2F5Gfe3jdzZ/VOtymjeBIVWQiTF7LV
         lI1kGrrd7LUnOsDvBvbGHxEiOlh3pLpP767ATHRcLHgUsTTdgFbTIdAKDjUlyqWr4i4m
         +IRUZGSKnNTtV/3o54x9xRUli2Nds9x+fK44FuktD7l8qw28htQ54spEg3z3SO+O6TWr
         54vrz9uBIvmYd7s0vY5shDFTVw53OZ6h4ja2sanc1yUNq10W6F5wyiicEgq6VhUpzpSO
         2QqWdx/dsdiRN+3pBjLnKterMFpC5LdeSutwcxp4MQJNxgkCYnIVevlcRraJ5U7oQg7O
         cgxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786351401; x=1786956201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ibzUgXOGiUGkOiEFkYb/0y6YpV4m0bbnGovRuTHx8eY=;
        b=VcZA2NLsyiTQouAX14A2J65XkRwxoSmQiCLtlwTFSQvrgaTdJ/qylKQLV1y8tSQzJB
         5mehG+oa/T23UNpLGZePUGaMz96VgirE4R1OHKjxKxDqGJtaSeOIrDccCNZQYcO45yhm
         Gz3vVErdhoFXitXE0mx7YMFZ+K9Zuyha4fYnzjGS4c0p48x+chiayHjlNMn3YdHXP2sU
         Ziy14RSA9JhPEoj3EsifZYshIceH/pBJglm709CwyYT0InqhLENt8TroaR7/5lueHJYM
         SK0bhXUkMvOJwHfEv9Tikv5YjUjV+1xNTRKmnmzdD7EZIMFLf4Uo1BcdTF7RSooq8vGw
         4YvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786351401; x=1786956201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibzUgXOGiUGkOiEFkYb/0y6YpV4m0bbnGovRuTHx8eY=;
        b=rpbdIhedy9+TmAn/jf9U3q1ng5CGhcsfFSXt/fRck779ZCWprW/Us2XdxPeItkfCTV
         5A/mNizPOjaAo8kqzijjm8tMb63PaeWn6s5t/LNmTGaa0KWY5NUd0pyfjvpr9H7mGS/L
         QY/sLvSwbaYYbEopCVSw0tcFrY2PQH9hp5QLGz5DK2Xs8s3dVPvP6VBZie/Rxib1VDVZ
         ThYPKrDfl6hUu4+gtJOie0JCZkij3dqOIxCLDVjBsONCFDM0vqX+zcRczn6gJXy1n4y2
         prZWhsWLyt9xp8U5wtVRGrSqFg72v3YrxdGPa45Mxpu9km3Zb0irmaMtoBGW/WIkm8xZ
         TpUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrw+PNG7fU6Z7H8u/2xmzKYzDK36aWqtKukpij5JnG7MiuxlPJjPbFUtfzhLlF+ICFMsOACn2COqNCu@vger.kernel.org
X-Gm-Message-State: AOJu0YyEKPWKIl7aG9/1dtP6FEP9cTGnbvViYls/M9YS78P2PsFEwRCQ
	DUVNEyFKwXB2/xResvHBoqLFXIklO1mNU6RI1nBJIY7WOcludvyqJXYYWpcgNa08eFaks0KS5xK
	DCnFaFOJRTUNZbwIX+5v8AKF9YcQy2TQ=
X-Gm-Gg: AR+sD10DDfEJ5kzJ0ikH8QklRwGcr0XCrFWhi7ol4EZZDy7CPdz3xjE2rKTS0jvlyyK
	j1/F7zWiO0jz4qBNbBlLK6yvGoP53Sq50gjI1L0yGuWjjK9G07wVq2KAIlwYWz3GMk7Pl+ejwpH
	w+wstJ/Sq3RSEJl6FZAx9coJlyNuuycG3GJOUJJMTv8SPxyihxevM+dghiYKE7rg7IZV1gzhGCL
	vohCT540Jft7/9pfdJZq5cTKcQSnqRX4VD4u7v/GJiy/bkYjCgd93OtWhxmGU1w2S+Ejco142SK
	dvXb2blF+zO6p3OfDkSgVFqLCokeeNJES2v62CLzluPv3O+Msr8PgyPbuI8=
X-Received: by 2002:a05:6402:a0cf:b0:6a0:a4f5:f4eb with SMTP id
 4fb4d7f45d1cf-6a355d66d8bmr212253a12.4.1786351401282; Mon, 10 Aug 2026
 01:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604095647.108654-3-biju.das.jz@bp.renesas.com>
 <20260604100619.75EC51F00893@smtp.kernel.org> <aliM3iVA1LY7tW38@monoceros>
In-Reply-To: <aliM3iVA1LY7tW38@monoceros>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 10 Aug 2026 09:43:09 +0100
X-Gm-Features: AUfX_mxbp2F6C1EJALTGqqu13oGNxfjr3ICGyNcoGi9RkqGNZfVYjkhbDxxzl_o
Message-ID: <CADT+UeB-gV8QnuwpTUrHV-GvYPwebYg=RE68PcApZkACO4ENDw@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document
 renesas,poegs property
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, 
	wsa+renesas@sang-engineering.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

I have clarified the use case with Rob on [1], and he acked on [2] .
See the details below

[1] https://lore.kernel.org/all/OS0PR01MB5922756F1836AAABFF62C04786049@OS0P=
R01MB5922.jpnprd01.prod.outlook.com/
[2] https://lore.kernel.org/all/20221215205843.4074504-3-biju.das.jz@bp.ren=
esas.com/

Cheers,
Biju

On Thu, Jul 16, 2026 at 8:50=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Rob,
>
> On Thu, Jun 04, 2026 at 10:06:19AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The `renesas,poegs` property improperly encodes the consumer=
's channel index as a phandle specifier, which is a Devicetree anti-pattern=
 and breaks standard phandle-array parsing semantics.
> > --
> >
> > commit 9d7f9847d3f320fb715022b6159c9c7e869aeedd
> > Author: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
> >
> > RZ/G2L GPT IP supports output pin disable function by dead time
> > error and detecting short-circuits between output pins.
> > Add documentation for the optional property renesas,poegs to
> > link a pair of GPT IOs with POEG.
> >
> > > diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.=
yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
> > > --- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
> > > +++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
> >
> > [ ... ]
> >
> > > @@ -245,6 +245,28 @@ properties:
> > >    resets:
> > >      maxItems: 1
> > >
> > > +  renesas,poegs:
> > > +    minItems: 1
> > > +    maxItems: 8
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    items:
> > > +      items:
> > > +        - description: phandle to POEG instance that serves the outp=
ut disable
> > > +        - enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
> > > +          description: |
> > > +            An index identifying pair of GPT channels.
> >
> > [Severity: Medium]
> > Does this property correctly follow standard Devicetree phandle semanti=
cs?
> >
> > By Devicetree specification, phandle arguments in a phandle-array are
> > defined and interpreted by the target provider node, with their length
> > dictated by a cell-count property on the provider.
> >
> > This definition appears to invert that model by using the specifier to =
encode
> > the consumer's (GPT) own channel index rather than a provider argument.
> >
> > Additionally, standard OS-agnostic DT parsers might fail to resolve thi=
s
> > because the referenced provider binding (renesas,rzg2l-poeg.yaml) enfor=
ces
> > additionalProperties: false and natively lacks a #poeg-cells property t=
o
> > dictate the specifier length.
> >
> > Is it possible to redesign this binding so it doesn't encode the consum=
er's
> > index into the provider's phandle argument, or at least ensure the POEG
> > provider specifies a #poeg-cells property?
>
> You acked the patch. Is that review concern by Sashiko valid?
>
> Best regards
> Uwe
