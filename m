Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C02433E72
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783004294; cv=pass; b=urzReWBW/6viU84NNaNp7/bzRPjMH8n6xKSYNJhvzf4JaI1d527ACDhxNOyHPtS2CtvxT3PX4TXz9Ui9wsbon6n5I2ccCnFR4JtpaQt2U8pWpOkOoo/Z8HtGd6sV55sMpyOg+/0399K5pPMsrhwSFCOs445tUqxrcFR9B8jp1oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783004294; c=relaxed/simple;
	bh=14iIHIXuN4BEUTqiDd4CGi/IiORqRTcti8JQlEfOoGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNCtSGpFei2qBxZ6traZLaNYlPpgtbQ7A7femka+Rd6b2u7So5RIC0LaPi8s4nLzfVwbucWMu9yQxMMe5oz0tRRUGsVCeRk5jz33SDqwy5skSYklX538cP2F6UhX/4XHwJQMrpJvKfyaQ1thh7uoNzOcU0TDPVh6rZ+kcCYRB/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UociRQqo; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UociRQqo"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so3796280a12.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783004291; cv=none;
        d=google.com; s=arc-20260327;
        b=GXMZIVyoK3WY416L5ie5gs6kbIxIUebcPz0wxgTn0toDFtMZucvPShrvkwIhINGuKp
         m8quAdjU/Qw6AF0dREQ+2uG5g2wbARj8QExh/Tyw2Ut2ZY/QCfQwJiNF8AaxuyxA20IY
         l8lxRi9guIP3h+ckYODmO6L5qlGVGP/2A4Jx2jvqj7gFb2vNfFfwPjZaconpafU8P6qH
         OhqCKvF1izsOhFOOeHyDQfi1Q97jDsLPFsmua43YY4b4EzBYF/+kT+nn6KRQCEQ6CRMB
         2lsN9GDgOAVplUJo5wG9PT0MAu4tqsi/2E/jivBN3yJUDlmAWzRg8QDs3iKAeIb9GKMu
         k3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5rWUuW36bw2Cjg4ZK5Axjo/whs6KUO2dBV3JzHn1K0w=;
        fh=rJc2BKdnjtij3Y7LX2xw6B61pg0OO1C4QctrtfG7seo=;
        b=mGrdxvijdylOxzCt6NU8UCVBQZ4lWncBSTXM2EF56BQuSFiF0Np3wqnjXSHD5AK+Fr
         hd6Jp1EuQ8Z4uk3gxhw0wic/HuCp6Y0+cDCDQ/x/4Nzi1RMJEfBrqMJd1a1xBfGxily4
         YTAM2I/OnxPXl4QekRvsnkMq+Fxxj8ZuSaMPS3dbKk2rqtYwrthAarcBf9Bz4QumyVtQ
         E32kW0RdCbaQusaIbmzkBII/jmi62ySBsmwh6b4An+9uByIB1N4s3r4PJDmK6bYY9phx
         Az8jCn84uA5eiiOjb7ubAT8CB3FaP7CbwWMGcuEyhsYS0TPjPWdhmcZaMhuph8u2Olpl
         Ojtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783004291; x=1783609091; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5rWUuW36bw2Cjg4ZK5Axjo/whs6KUO2dBV3JzHn1K0w=;
        b=UociRQqoDEDNn8X1sFKLJbf2o/LaP6yPdR2TzUbmum1d9GCevsJuybe+hXHzhbVLSx
         /yTn3uFLcZYd+kQbXY/5lVt95CyBQ87X/lSF5Lou6czfgBqFPjJkcyYIOZ6gZJF1A7EJ
         s3AC+jZKR9O4y1xQR3W6uADfmu3TMAtSz/FKaJ43kBablPatjeR8Ei5pzDkmFlt0Z4Ot
         9A0JrLP20ulhUpvj7jWRPELK1n7AyezUWkflDY335otiago/xkQalTPkoawZ98wy6IiQ
         lZG4XPTJSwPaK2UYVyxUrKFiu3pELY8X9diyPZb5urpxv5yKhPDKy+cejwcDhHT21Hs+
         /8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783004291; x=1783609091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rWUuW36bw2Cjg4ZK5Axjo/whs6KUO2dBV3JzHn1K0w=;
        b=AKXeupbk8/EV+OzoEGlUdpXN4SUB4LdqxmgecH7LXhGmK5i8NyhJCUA+XYXOJaG01C
         1d2w6DhNuCSsV0LFxirPrE5Ji6zH/hCqzeMTNvkr6+s0wED0kdHJNMtT/BNWvQ/gH7Au
         L4aFzKS2ZEokUMjXfLhSj1uVaekOOBLf9DtTb6vxUDnoQdHT09xWj1MjGzYc+xViF9gW
         MtbeFFXtSAvbytye721nRlrE1MPZB+XdeOW1GNJmug8f5A6sYRpv4qPkSuvnDqZCqH+m
         kZ4SHziUxyvsUEmda2ZP0RYFriPIpiT9Z2uYdGs/PGlMnGT3G9aTDgsQ+3/YgVkRPqvJ
         n1lw==
X-Forwarded-Encrypted: i=1; AHgh+RqLSrNUyK/96Ubl1puovDAkzNfuHF4DXAEZ7ioTwrbcf0mSpdNIdvayKDf21ychMHMRhVHB+IfpefFi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+0cbYMZu61AOE0BlJL0fnDQq5KgHpSI3kTYsZetkgcOKbRcU9
	SPIDPUcGzJDQ4DCxMmHmHsB7oTOrO6SDx98ut9WWvSIxHltE5XsXDM0H4ZJ9MMdjsVv4r2mgOUf
	RpqA7vvS01ypDWnLVhNSoeRVi0T1ZH+8=
X-Gm-Gg: AfdE7cmafILNstr1Z7htwYaCw3nVihv7QOjoUWU9PxBaXjO8dRk85d8yFnq20/vq2O3
	PAwjzhgiUMPy6Nt+O6R8mv2j8Z40QRm34sGDVrd60DXd7mlR2qgd8qvo85/vG9WqgNTR/EQ38Qm
	PgeqEx8XMO+XudHRWsZ8DA/MOjpRKJt0Cvp6GA/pGO4AhuM/wBOmtZEeDSrNCn8itKhaG4qHDKQ
	rmZ3Elb7C0+xm4e+mPU+5wq1wLZekfmHkxTDRBrDUzh6Yw1B/ugAD5bVMYq09/FL8FFkJ+xDg9I
	ulMDqQTNRInJlS8ttxtfR6mNTwpcXbOhEyyTsNu+v8m4F25YxCFa30WTpJiJAWY=
X-Received: by 2002:a05:6402:42d0:b0:697:e93d:6da6 with SMTP id
 4fb4d7f45d1cf-698a2c5e5d8mr2750339a12.1.1783004291308; Thu, 02 Jul 2026
 07:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630132857.3007019-1-egbostina@gmail.com> <20260630132857.3007019-3-egbostina@gmail.com>
 <20260702-comical-accelerated-labrador-a06ad7@quoll>
In-Reply-To: <20260702-comical-accelerated-labrador-a06ad7@quoll>
From: Eddie <egbostina@gmail.com>
Date: Thu, 2 Jul 2026 17:57:59 +0300
X-Gm-Features: AVVi8CdcFykAeMgW-GeVE8gd5BASK1DpQvsz_SsJrsA3ixt9h0rRYc8i3-D-3Ng
Message-ID: <CAEFOc63tOQ-uUoL-2kefU-X=SwLqhVG5rE64E8cm1eSeHnTFsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: omap: Convert IVA to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, goledhruva@gmail.com, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 2, 2026 at 10:27 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Jun 30, 2026 at 01:28:56PM +0000, Eduard Bostina wrote:
> > Convert the Texas Instruments IVA bindings to DT schema.
> >
> > During the conversion, several updates were made to reflect actual hardware
> > usage and resolve dtbs_check warnings:
> >  - Added a dsp sub node that references the new ti,omap3-c64.yaml
> > schema to support OMAP3 configurations where the DSP is defined as a
> > child of the IVA node.
> >  - Updated the compatible property to allow ti,ivahd as a standalone
> > string.
>
> Heh? Old binding already said that, so you did not implement such
> change. Instead you invented ti,iva without a reason...

I copied ti,iva from the old example and failed to check if it's
actually used anymore.
I will drop it in v2.

> >  - ti,hwmods has been made optional.
>
> Why?

I will add the justification to the commit message in v2: the TI hwmod
framework is legacy and is being phased out, so new device tree nodes
should not be required to include it.

> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: ti,ivahd
> > +          - const: ti,iva
>
> From where did you get such list (ti,iva fallback)? ti,iva is completely
> undocumented and completely unused (not existing), so why it did come up
> with it?

As mentioned above, this was a mistake carried over from the old .txt
example. I will remove it.

> > +      - enum:
> > +          - ti,iva1
> > +          - ti,iva2.1
> > +          - ti,iva2.2
> > +          - ti,ivahd
>
> This is wrong. ti,ivahd cannot be both: compatible and not compatible
> with ti,iva

Will clean this up by removing the items list and just using a single
enum containing the valid strings in v2.

> > +
> > +  ti,hwmods:
> > +    description: Name of the hwmod associated to the iva
> > +    $ref: /schemas/types.yaml#/definitions/string
>
> And here it is a string. Confusing.

I will change the DSP ti,hwmods to string too.

> > +    const: iva
> > +
> > +  dsp:
> > +    type: object
> > +    $ref: /schemas/arm/omap/ti,omap3-c64.yaml#
>
> Missing unevaluatedProperties: false.
>
> Actually the other binding could be squashed/folded into this place...
> but split is fine as well.

I will add unevaluatedProperties: false in v2.
I will keep them split for now, but I will also move this IVA binding
to bindings/soc/ti/ in v2 so that both live in the appropriate
directory.
Thanks for the review.

Best regards,
Eduard
