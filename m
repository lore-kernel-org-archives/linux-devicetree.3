Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D12238C36
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 16:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783872220; cv=pass; b=F7nY94+RC1IazCda21Ly+0fz74xeqD9uFVRZS+rLn5G76oYdykGZY9LndLz5qSoue0C6TvCj0Weh0QtNrp7m0zMAtlCpiIiQrLbxES3vLOWs883DvEObI2x/tKFi5YzuFvQjULSbyfjji5C3k6vZY+NMKzoYswJn5YC4BH0LNjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783872220; c=relaxed/simple;
	bh=Y5U7o3MoFragefFGlIAbSwXv5uezv4fetCvCEUv1FO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLG9lbRW0IuTrQiVYQLmpMPG9+mRuMjsYdO4/nBLfu/y+Anq/d56bHvk37G0SakGPoiON7oGDtNylm9rzVVyG4SWrDQPBWdphrVNZkM6Q6pG2kQLs+feFGMNqooRL+0C8uKph+9yiDzcKQL15letdo+H65M/U84ewz9MNCR4gCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABFVP7L6; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABFVP7L6"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso1604380a12.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783872219; cv=none;
        d=google.com; s=arc-20260327;
        b=BEyhGFIW9/YvtGVxYRC29EOdG3j106MrESk6czielku3g9NT89HmI3zxMzofRSfXqO
         vZDWHyzyqagqww4Rw3OiKAfd4ksg6rwNNFfhDjc1AgiC313qQdZsfGyXJmx/jPfZEcgt
         04aPjxhSDRjFYl3PHeX8XFmnTVKMyCK4L3BXKFSInb8sQ/ss7hCtb5UtjLo271klR7if
         MOKexSEq4M0fonaC6zKMlg3mg0op66VqWPuUuymfgiIzwJdy8JGzi6JY8EEG0GTecNK+
         g/puVpYdC2mFn/lnZS4DwbfM0HCYfL9zhGhXzPxbB7EOdPP+9JJRU80hf8i6suPA8plb
         KZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFvLh7Vsfcz2Mq3+Nid++P/J5oTQIp76A0wwsGSrijA=;
        fh=YeCiynd3CruDJhNkiCchyRjTE1z48ALhPBDFsM2OGbw=;
        b=S86gmDr1Tu1viMCPFCMYPmI3tZOeA9S62ZjhFOl/UuR2H2raaIYrMdABlVgQAS0EQK
         j5KOe/e1BmamhaOiCe+1PgPPkla16Nncm5+oVl9fG8VyF3GZ/uzLy8Aa+FvSvCf5EGwE
         Q+//LP3EUDiyrzErtGEOGMj2CBp8cRO7jsziMs4gPjogV2uFT0Hf2gnjKYs2AbQgEpNT
         1tCqX1f5gKQnJs00jwnmFmrumN3Pj0ppp0Ww13bFEGffzra+l3NGFJq8BQ6NnAqRnCDo
         oVYh0BhhAu8Xd6Gn5UoReAkXTjpJItTuBsCgFtpdYt1F0t0/DiRvd1HazqPeJXkLycNu
         +eng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783872219; x=1784477019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFvLh7Vsfcz2Mq3+Nid++P/J5oTQIp76A0wwsGSrijA=;
        b=ABFVP7L6ZcZDOqqhS3163siEb0R7G2ESLzjVxUDA4ibW1Tdz5s096oOushjYKYLFle
         zuk++F68z8EKpuXv1r9FW5DRXx0pesYRp8w48CR22Yv4ZqSwJuBdvDqj+ZU7vWcIDq5U
         U05Izhi9L5y8BE6cU7pOnzZRBeuSlDOpgmbtRRaJSoil7G6Kz+UBJey2OCMwy5Hh9C95
         0NnH2jqQjcsB1YXa6Ec5ieLRJtyBfUSt3aCG6Xkb5wi4kcYLJLCP4oxNIVLNMJGilDcN
         1GuiOWEXXLlALNsJLAasmIFxz3uKgg1W9jmQizZN1KKGoO/wfnLxp4yCQT3Rf7mWL3r5
         g39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783872219; x=1784477019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFvLh7Vsfcz2Mq3+Nid++P/J5oTQIp76A0wwsGSrijA=;
        b=Ly/vBIbiAlawH/uZgRUqIutr28E9mixzWzcaou9YIf4RbUjDwNP78QRGj2UF76AQiP
         Mb1P0dHSOTWWVr1d28nbSWO+s2r+vACOH7Z0W/MhYsU8s0hGWk8P9y06w+oXzGmMuOg+
         QyX2OvHGrYr5+ppkGYWTVX06AhX3iGYZT79vIn445Pks08Oqu6fjCAklDSXPEbNEurMj
         r0CYxANRhGWvmX/KxjCDR7rLs84cFU2/KtVwYz9S3CQwoO2+vmn1f8GXn3QGcSiGvoMg
         94uIE5/3w+aV5yj0Xwqco4cPJMuEZ52JZb/bPWcmWvHLfkgzgHWjHanIv5PutfSC6KEt
         StBA==
X-Forwarded-Encrypted: i=1; AHgh+RqOENLX93qTQka7uq8dIYih8XoQuCWVucZXsbg96wx/ZyDe50hIVM0DnH8pcJFlwWdOk75CHUy5OcZU@vger.kernel.org
X-Gm-Message-State: AOJu0YwS2mXt6ZgJ07i/irrN8Nr4i1sa7J5usV8hwYkmRdDqV2SGjvhX
	+S7G7Gp8JgYdSw1OX6YDNGg0lDYzckZa6EkOASZQefezhjsyIaodeVJFSL7U5lHlHWrVO5DHtvM
	nQ9TzOXkLrH+FpVlhZETeZwDoSTSkYz0=
X-Gm-Gg: AfdE7cnZiZwGDD4iYcWthN6XWaFObqYh7V36lW89ntQM9Fwk3iQutiMndsNL3VEEwTc
	4TfaoYjhBji2mouPCKkSuQZD0LMA7t9a36459YiBXrvnwsjyna2ZK0xpPfHAwu1vjiAN9nBFdGc
	0ZCVCpuAEkloClE7cya9s1yqhHn3if8mqNocN9ScK13FIrhY58ilfnanulclMieuKLmN2VdsEED
	14M4ZWQlbyOga61NgqqQeVIXme2lXODZQtyDGZ0Xkv0+Sf85rDTJFHewH54uzXJOD8+VdaiwohR
	HDpV57LxTXB+In17q8KY1rwk33ADen8=
X-Received: by 2002:a05:6300:67c2:b0:3b4:75c0:3ec0 with SMTP id
 adf61e73a8af0-3c1103d29f2mr6042129637.30.1783872218804; Sun, 12 Jul 2026
 09:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <3e700a3fa7872a96257ff25a77670ec05cfd239c.1782909323.git.mazziesaccount@gmail.com>
 <CAD++jLnaOOoLsLxzib4d1XXLxRpWBPrqCdRwqVVEUmKYS4ad6g@mail.gmail.com>
In-Reply-To: <CAD++jLnaOOoLsLxzib4d1XXLxRpWBPrqCdRwqVVEUmKYS4ad6g@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Sun, 12 Jul 2026 19:03:26 +0300
X-Gm-Features: AVVi8CcrijvdbHQVpJqjEqeOb1JSN6FIx_2WzRJ2op4hx0-LyN894GNSivE7TBs
Message-ID: <CANhJrGOHk-Q7zb8sd6PHcf2BfsYxfo97bpm5d3NODBbMgJzTmg@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: mfd: ROHM BD73800 PMIC
To: Linus Walleij <linusw@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pe 3.7.2026 klo 23.46 Linus Walleij (linusw@kernel.org) kirjoitti:
>
> Hi Matti,
>
> thanks for your patch!

Thank you for the review!

> I have some inevitable pin control nitpicks!

Great! That's what the v1 is sent for, right? ;)

>
> On Wed, Jul 1, 2026 at 2:41=E2=80=AFPM Matti Vaittinen
> <matti.vaittinen@linux.dev> wrote:
>
> > +  # The GPIO1, CLKOUT (GPIO2), FAULT_B and EXTEN_OUT pins can be
> > +  # configured to interrupt pins by OTP.
>
> Maybe move this helpful comment into the top description: instead?
> It's kind of generic helpful info.

Sure. I believe Krzk asked for that too.

>
> > +# The GPIO1, CLKOUT, FAULT_B and EXTEN_OUT pins may be configured for =
a
> > +# specific purpose (like ADC input, 32.768 clk output, fault indicator=
 or
> > +# delivering power sequence to a companion PMIC when multiple PMICs ar=
e
> > +# used) - but also to be either a GPO or GPI. (When used as a GPI the =
pin
> > +# can also be used as an IRQ source). The pin purpose is determined by
> > +# OTP (One Time Programmable memory), typically during device manufact=
uring.
> > +# The OTP can't be read at runtime so device-tree should describe the =
pins.
> > +  rohm,pin-gpio1:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Indicate if the GPIO1 pin has been set to GPI or GPO at manufact=
uring.
> > +    enum: [gpi, gpo]
> > +
> > +  rohm,pin-clkout:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Indicate if the CLKOUT pin has been set to GPI or GPO at manufac=
turing.
> > +    enum: [gpi, gpo]
> > +
> > +  rohm,pin-fault-b:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Indicate if the FAULT_B pin has been set to GPI or GPO at manufa=
cturing.
> > +    enum: [gpi, gpo]
> > +
> > +  rohm,pin-exten:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Indicate if the EXTEN_OUT pin has been set to GPI or GPO at
> > +      manufacturing.
> > +    enum: [gpi, gpo]
>
> Can we explain what "GPI" and "GPO" means in this context?
>
> I read it as "general purpose input" and "general purpose output", but...
> you just describe the exact purpose? So what is "general purpose"
> about them in that case?

I see I could improve the description. These properties aren't really
configuring the pins, but telling the SW how they have been set at the
manufacturing. For example the CLKOUT pin's "usual" purpose is to be
the RTC CLK output. If this is what has been set to OTP, then the
GP(IO) registers have no relation to the pin and they shouldn't be
used. However, it is possible to configure the OTP so that the CLKOUT
pin is not outputting the RTC CLK, but is a GPO. (Eg, is an output
which HIGH/LOW state can be set by the software). In this case it
truly is a general purpose output. With another OTP config the pin can
be an input, and state can be read from a register.

So, these properties are intended to describe the hardware for the GPIO dri=
ver.

>
> I would re-use "input-enable" and "output-enable" from:
> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> (I mean don't $rf that, just use these strings).
>
> I suppose:
> enum: [input-enable, output-enable]

These sound like control properties to me. To me this sounds like a
request to enable input/output - and this is something we can't do
with this IC. But I think you still have a valid point regarding
re-use. I will check this when I rework the series, but I believe the
BD72720 does already use these same properties. I might be able to do
a common binding for these and $ref them from this and BD72720
bindings. (But I will check this when I am back at the business).

>
> > +  rohm,clkout-open-drain:
> > +    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "c=
mos".
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 1
>
> Here I would also reuse the generic pinconf properties,
> something like;
>
> rohm,clkout-drive-type:
>   enum: [drive-push-pull, drive-open-drain]
>
> (Push-pull is what is colloquially referred to as "cmos".)
>
> > +            rohm,pin-gpio1 =3D "gpo";
> > +            rohm,pin-exten =3D "gpi";
>
> If you instead use nodes with properties you can do this:
>
> rohm,pin-clkout {
>     output-enable;
>     drive-push-pull;
> };
>
> This collects the clkout config in one place and make
> it obvious what is going on. But I don't know what the DT
> maintainers think about this idea.

I will take a better look at this when I am back. Still, the
"rohm,clkout-open-drain" is also already used by
rohm,bd71815-pmic.yaml, rohm,bd71828-pmic.yaml and
rohm,bd72720-pmic.yaml so I am a bit reluctant to changing it as it'd
require me to either ask people to change their dt-entries (asking for
a nose bleed) or support both old and new properties in the same
driver (asking for a nose bleed).  :)

Yours,
    -- Matti

--=20

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
