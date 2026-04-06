Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CAE37104F
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775480408; cv=pass; b=Hj2ulpgaaGBz7ibm4yE4qyq0YYK/Cl5UqOXVJvTSHcjPbW7WY8YYJ7K6GMtoTmL21CUcl7tjdsqBdmmmdbmBasG0oiWiICqopbvbiDvCV03FVsD5JpHFjW4WKPLS0lZd3Vl+RO3q1a7JNG5nnryal0fBBxYF5lg/dzM1OTsx9do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775480408; c=relaxed/simple;
	bh=71WGBGMayEvABBF0fn5IqveJ4CNkW/N5vMCCLU3oCbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxBalkMo8TNcLjOAVri3KNKyxhDnJg/D60W6oHTO4VhIgfq3TtUJqCKTzTSTb4Ue8t9zvY1Gx7lIYrdaIs0RvyV3u/g283GuEO2mRQO156ZI830JaL1LR0+Hkb9msLoFAfBDMSWs5z1eoIpD5gxb87Tzl9b9ZD5NmJt0vBJg7ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX3W1vq+; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX3W1vq+"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso2929995b3a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 06:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775480407; cv=none;
        d=google.com; s=arc-20240605;
        b=SokY5vF+DtmVQGQqJg241LJpoBp6jJjtY+jIJWgPBPlRTQjHw7Vw5DPfAqIpNtSvNk
         4bXTuYhEqxp3elCMwgQy5UrTIEPG3hBzRbTPc84hsG9R/cjSN+9xfB6lgcgJP7SmVCzC
         7jglG13z5F9LZ+ir9+qd6M1RUd6Z30DRe2JrHVtguzhGqwm5B7rBDEKmJUOVtK56JiHy
         dYT4X5PhdipqeTHVH0HWr/p1TIp7mDNocHDpwQT0CitQGchbajY/4NIYw5s/z0i2/Zbq
         GqACbkCWFqo5mEHQ6/eutnfdMk4WhyYEIcCS2G6bQluxypfLMhKZzjEgAcjKMQ2iIjFY
         rWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RgxYtygl1sS+JwTdfDRJk+SRB6rzeXJ0kjY/bbGJFGA=;
        fh=VD3krnHvn2m5nRkVmnBtCM7Ed2y32d5Xshiiw+6Un1A=;
        b=gNYD6nzcFMoveXTK6jz5IlKIzaLq9mvL6YveDJjjycBAoT1WJ/4xdzo3o3Lik0ZiYu
         bpawuYQ8a+kmXN5Wt1WVwjGquIrpZ6fQpp3yP98Fh69HZaazqzl+Me04KtMiW7r0LzUu
         5ASXvWruMiSvbnaErHM/Ykfn0pTktVcI/Fb42yul34YmTKLZiLMkLYH5xfDtkTKkLWuo
         OELuNYKb8/QOAD5w/tXvZ4xGxOCaEz8JMwCULOPyJthQa5VNdzzAUS4jhm3POTj7FzGi
         q+t4gs+yYscexFMmGhhoNgT6p/IMJL6MN+QjyxjrCZUSefmXeTpzXtJGmUngAH4x3aRv
         W7sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775480407; x=1776085207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgxYtygl1sS+JwTdfDRJk+SRB6rzeXJ0kjY/bbGJFGA=;
        b=VX3W1vq+C8i+aS5yB1tc3R5Aso+r/eXIzRVwGkOCo/mSGZ2FnPGx57EsIWXSiUUfFw
         WYmbxcchz3jCFemFzFcN7nR1lDUWmb4Tw6410wAnwUAk2aJ3BSToBlpb0HLKoa9Vr/qc
         uPDvfkPZS+0cdWk30UVgybCO4htmjGSBILG2NgVegvo6OWT9nBa9tga7aotl7K4kzt8G
         mPwGZ33FSHRIppXM1/CL75fFMKEVCrxTS4vdB8qLnJHmFhRHXHuEvJoJQql3+xYZ85oJ
         SPsUSM2DfQh9xSM0tsHNMl2nNPYC71TEGe0lIkO4YFBrptYwf4NzntGwoJe/olQbUMFJ
         PWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775480407; x=1776085207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RgxYtygl1sS+JwTdfDRJk+SRB6rzeXJ0kjY/bbGJFGA=;
        b=nZJJq/Nj7H7jTSNx4+qeasjmLW8CCaqocGd+75S2ox9z6RdSK+hCKDC1QFtL4JvSFq
         U9nD1Ko6S4vFBTNdXwmtQe0sIL0m7ZTDEtOYjyhm1MVCG5fxSH7gvFTHz5xX8VC4I7Ez
         fgWEOnf/9pJYS5g7b8jqDAa2Ts5O2wmhPtB95mvB17yAUGzm27PB0sEZIcaEYYPWTCmJ
         nmnfnPC4PtYk6wkS95N3LxAmKImXMhbl63IqLRLbKgOVXUYBa84MreysERK0mASmXSLO
         z+aYL9QRvprG1jNy1OL93ID2Dqb/qFduCDQL6ql6cV7FC5t5sCP3IuDTp9+3KNwhIuHy
         ORUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVIvEusFi65pAJn4erl9U900okEojgV73r/8Lk+FccJWxNFJXWVqZuRcSup/XNUmRmsFY7Zrit1HSW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8FPEdGJ5hB9FTLpS6JlHqKVrX5eOaBBwOcIZBtVcBS0V//npt
	j4ghvvZURbhlw8d1makvNY2GlwRS7h+u/FMZdqD6YbiEDubKMr01NNiEJgkJQcqYH5aMJeT1nVh
	CeyE0A1FHUdJIWtNg8Czrtfr8WDY5JAk=
X-Gm-Gg: AeBDietkZCbDxKsSENa6jJX/q8eVxaGZrOnkIHS1sstyZn6Nnbpnuo1H3QVRjg0+JgW
	2koCuUGznypxpDb4eoSWDMuPbp528oZ9/BDkjHSeYymuMoWee3CS1BTbQc3Qv+OFQ+EEQ0a2j83
	bhpMInE432/oxsH27y+T5GmPI939TFEQGtT+B239bHKr0dG0TX4klhKDz7du0wMsC0l57CZNo8z
	K1vMLF435oFU7NNENiTtAqZykdDsbjZAxwiLDIIHM/yKaJHy+BRke8ved7DOe3Vs+FWib5j1Raz
	na3X8HdTLJSt8TCVSxzAJR2U4OWlkwOZf4MNzg==
X-Received: by 2002:a05:6a00:18a3:b0:81f:31c3:2e34 with SMTP id
 d2e1a72fcca58-82d0da90bc1mr12334891b3a.25.1775480406401; Mon, 06 Apr 2026
 06:00:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-2-phucduc.bui@gmail.com> <20260405-ultramarine-orangutan-of-wholeness-bbcc6b@quoll>
In-Reply-To: <20260405-ultramarine-orangutan-of-wholeness-bbcc6b@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Apr 2026 19:59:54 +0700
X-Gm-Features: AQROBzCHyrvZcOJgbKx4MTiVA2A71CHfHy4r9SQf2vs20ty6n_Z1SVNKWQPD9p8
Message-ID: <CAABR9nFsde-Hxk5cOosv0MeSisck9Aq6cWnNe2PFc-RJq87XUQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: renesas,fsi: Add support for
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark, Krzysztof,

Thank you for your reviews. I will fix these in v2:

- Subject Line: Change to ASoC: dt-bindings: renesas,fsi: add support
for multiple clocks to match subsystem style.
- Commit Message: Reformat to 72-75 characters per line and remove
manual line breaks after every sentence.
- YAML Bindings: Properly constrain clocks and clock-names by
following the writing-schema and existing
Renesas sound examples.

I will submit the v2 series shortly.

Best regards,
Phuc

On Sun, Apr 5, 2026 at 2:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Fri, Apr 03, 2026 at 06:26:53PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > The FSI on r8a7740 requires the SPU clock to be enabled
> > before accessing its registers.
> > Without this clock, register access may lead to a system
> > hang.
> > Add support for the "spu" clock so it can be managed by
> > the driver.
> > The binding is also extended to allow additional clocks,
> > as FSIB may require more clock inputs, while FSIA
> > typically uses fewer.
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/su=
bmitting-patches.rst#L597
>
> And not after every sentece, BTW.
>
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> >  .../devicetree/bindings/sound/renesas,fsi.yaml       | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b=
/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > index df91991699a7..225cd8d369bb 100644
> > --- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > +++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > @@ -38,7 +38,11 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 8
>
> Needs valid descriptions.
>
> > +
> > +  clock-names:
> > +    description: List of necessary clock names.
>
> Instead constrain it. See also writing-bindings, writing-schema or
> example-schema documents.
>
> Best regards,
> Krzysztof
>
