Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B5F33F5B4
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049284; cv=pass; b=dX3JVNLO2rgql6FbdSkb43bNzEkJTYOuvNcN1U3DQO7cnpuuPS0vylErM6873I2mWfI7BYv3LWTMaHG3OWqguEoYRsqmFj4+OJd2f9LQ3tXUj5a/e7b8uERZGUYM+ED4OFWqcUOIAGaAc6KcGw7gPobw2yDxHFNF8L8CPMdwIvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049284; c=relaxed/simple;
	bh=n8g9nbx/cd37EQYdG35MTeP1UwCovHHBH5OKJHp+X0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=peGndp9geQEQUs7jjjHz1L2PVWYW73X692kLEJMu9Y1CLMCjcoWRCOYT6WMLHfac3s6sp0UywO075kEM4+X/x0piqQJut6srq0JIGQrGhpjwwIzeBKJOWRSOigQM/bvT5mjnynL3nz/3m4o3yvBS89+DMs6C7NsaXi6hpwvOjqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QH4EWJZk; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QH4EWJZk"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso130208eec.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780049282; cv=none;
        d=google.com; s=arc-20240605;
        b=h3mr2zTFWrCxDvCFV7BL+4I9QfQL/M3v0BjBKEf8A0WIAtaLd4QX5kz5df9a02MQlD
         hpSsFA70Xsq7wAmcRWuArZI9CVMPDYVZq8x+j0IHky0XF6Ln0mOXGo3HqhRWO8CIJusB
         TLdYW83kApQfbTFj5RWaM1lqwrLs7fyMg5b8jSSTprIBXLQYeZfq6zVMxjxOoR5pFzKO
         4RzBwowlQ+h/h1y5DbJ2eLCU8oaZMQRzboDZ/ypR3q7r4p/3C+HOyJ+zys1ewaayGUN/
         FmT5wm3ERaPC8eSXk8QtzGk6zobTzwFmXcNcKSGwxF3aAZot0CMRjp+vule708d6JaD1
         POTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kFYmm3B1m2K2OFAsTX7e06En+33NHgtZEIHcXjaWAp4=;
        fh=HAPkOKngn4swpCltqVy8CTEl3X7aPqwOtoHyCy17o9I=;
        b=SJKa0EswN2FluGaHW+NkjNtCZLlPYum0UDgkxLVbmFKLG2JEW0nsAHzMwqAD17Dmh0
         pxYDrmPY8yAXRD1vCkaYwV0TFs3sdD0CwD9gO9yy5KjWk0jI60+9r7LS8hHybz1dBXRU
         /Ud0rkEZ8EOHYBsix4aEZGMQbRPad6Q6trYr2kOcoi7Hv8I69RReaeeRG5vg4bSAfQWw
         d0Tt6PwLyhHw6HZa6wVJHtLj6Ufxxt4Wx5poBqwgSwiQvF3szstLjjlC2y+sDZzfpXye
         1MnyMEiRe7P7ZDwc/cshKXMKBIT5X8qrr0/1+vVPWCVAgPPQwueA3NMbzbJx2nUO5znP
         bWDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049282; x=1780654082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFYmm3B1m2K2OFAsTX7e06En+33NHgtZEIHcXjaWAp4=;
        b=QH4EWJZkM2Bz2/Mg0D+E46mMWqXeiRUbecZwePs2Hf0Ke45z0GnQXgMLZrfAbndRM6
         /SLcdaAIjjw+clpICOIglgob62aMWcsLxyAakx+yykiy/WBwkKl+is6jGpCCxiubC6sf
         6rkBt+TeMUfXH6yKv5Szv9/D7Qt8G3qdkJDdI4SxxLSqcmGwHNRvrmS7ehAFuwPSLJAL
         5xz6RDmFcmTzK1U2kiMcPVwKzwN1zQWcxxqQdxUpBXyHuh6Vu60KN8Qe+jXabz2hPjkk
         +WPJ0oyCmIhv75bzm1Sl/LbRS8Z93q8f5yk1Sw8eIYDoavWhu1EiK0nOpKFBUx7RNk4q
         ihcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049282; x=1780654082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFYmm3B1m2K2OFAsTX7e06En+33NHgtZEIHcXjaWAp4=;
        b=HbtuX/rDldg3KsTNd1miQLrGHBEnkqP5POqOMhu6Lict6q/l/ylihgR0iPNmv3vLbW
         m9SMV8gM9B6M1/BZExtavfejFhTbxmu4EoAPh/CqC4TjEcCAhvNCs8VzXk1WnMZ6pha9
         FcH90XYH9e9sAzdDh6VNXIND6L1mBKIn291EBRwMMTk7Vp8TD8YdYdKKWLgIVCLECKX+
         mQ11+Wq3mwdSy8e+JsEDm/AXekXeUjxGSDUulQYvZ0pvx0qN5uMAfhXw+bk823WPwzos
         0aKGXqjzTXQMmS75kgzn2lfqwDOJc8dHtCljXVmHKo+IjodJW69MlaqK8cX46R0pGzbn
         cahg==
X-Forwarded-Encrypted: i=1; AFNElJ/r5pAcBerz92LkfrxTPk0YC5Id/fyqjVA9kOmSSe53YKmxKiZ/XO3T3R3HKER0U5HxwVC8Yf41fhXd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc2JWhOEQm34lpsqVad35vTSdiPa0xoddlo9mLosDmYBW1FNSB
	LAWk04vPITBu3YlfCpPOFO2wUzCJGzM8f08lN3B3zSHuSLji/q/WJqLXcstVjIRtRUROyCO/R4w
	JgfA3DLb4k16DiVMYcHrRY3KdR9FSvWU=
X-Gm-Gg: Acq92OFgFp38S5O83VpDqkd2UjAvY5abPc6A0VURrMXnNNkjg8uhKnL/q+W1TDLWNqC
	nWEICV6UcpM6mRpziTbUWGt7dAEpcoRFaXDCf0Z0qgA3WPPISTc/KqQQdtBVQQafKuv4/ApC6U2
	afd6A7irkEEAutdg77+QJ+5xOgo6+cbbdAITG3cFQu74rO7PrqMdvFNOE4saZDCZm0v7D5a6c7X
	2Wq+enszDUHDgstJIwXDut4fEwdei2ZQYTl1PVEwsyfll7KlIRm2kDE1V7AZHjZnBV6r/oQZNmg
	JxdjVX9/ioAhINj0dG8=
X-Received: by 2002:a05:7301:6093:b0:304:aca:35c5 with SMTP id
 5a478bee46e88-304eb228f12mr937539eec.23.1780049281982; Fri, 29 May 2026
 03:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135123.103745-1-clamor95@gmail.com> <20260528135123.103745-2-clamor95@gmail.com>
 <ahlhinOh3NxB7FY_@aspen.lan>
In-Reply-To: <ahlhinOh3NxB7FY_@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 13:07:50 +0300
X-Gm-Features: AVHnY4Ju4apl_6PVevGT822qLIzQw2MECBwLZ58e2K1CK8Q_oHMtYlAD2TA9TPk
Message-ID: <CAPVz0n3C8D+amSRkF=Koj6Niu6u8uz4LbMoRYEX32_ECm5-tSQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: leds: Document TI LM3533 LED controller
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:5=
1 Daniel Thompson <daniel@riscstar.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, May 28, 2026 at 04:51:18PM +0300, Svyatoslav Ryhel wrote:
> > Document the LM3533 - a complete power source for backlight, keypad and
> > indicator LEDs in smartphone handsets. The high-voltage inductive boost
> > converter provides the power for two series LED strings display backlig=
ht
> > and keypad functions.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../leds/backlight/ti,lm3533-backlight.yaml   |  68 +++++++
> >  .../bindings/leds/ti,lm3533-leds.yaml         |  66 +++++++
> >  .../devicetree/bindings/leds/ti,lm3533.yaml   | 170 ++++++++++++++++++
> >  3 files changed, 304 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti=
,lm3533-backlight.yaml
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-le=
ds.yaml
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3533=
-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm353=
3-backlight.yaml
> > new file mode 100644
> > index 000000000000..866b0fb8ed04
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backli=
ght.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/ti,lm3533-backlight.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI LM3533 high voltage series LED strings
> > +
> > +description:
> > +  This is part of the TI LM3533 MFD device. It represents two high vol=
tage series
> > +  LED strings for display backlight controlled by the TI LM3533.
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/leds/backlight/common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,lm3533-backlight
> > +
> > +  reg:
> > +    description: Control bank selection (0 =3D bank A, 1 =3D bank B).
> > +    maximum: 1
> >    <snip>
> > +  ti,pwm-config-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      Control Bank PWM Configuration Register mask that allows to conf=
igure
> > +      PWM input in Zones 0-4
> > +      BIT(0) - PWM Input is enabled
> > +      BIT(1) - PWM Input is enabled in Zone 0
> > +      BIT(2) - PWM Input is enabled in Zone 1
> > +      BIT(3) - PWM Input is enabled in Zone 2
> > +      BIT(4) - PWM Input is enabled in Zone 3
> > +      BIT(5) - PWM Input is enabled in Zone 4
>
> This is optional and the drive implements a default (zero) that is not
> documented here.
>
> Is zero a sane default from a DT binding point of view?
>

Yes, if property is missing then PWM input is disabled which is
equivalent to setting all bits to 0.

>
> Daniel.
