Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF5937FF49
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896727; cv=none; b=DQuhNhlw48TSzpXASm1auOAVprhVY6MJnS3wEkV7RFMKzoxE02/UDmE22GuC1iVPoRMR4G9eSz/0tL284wHY60lttzSIq3bF/zcozreRyn1EDbVrBrOGc/VCvcbLpJZR/ttpUo4zCSyASes1n0TnNLy27oOi5XRAspryoGYt+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896727; c=relaxed/simple;
	bh=64AjsCM32ow8eV6+udUpdB2v5Y+cSGnnihxYiV2n9E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNhdt61Fy49NYJVKcYKXVQx1/DDfGWmR/tSrs/oAOT0ngvEbI2u0QwMtpRKgQmU+oVfGVJhCf7IrnUh3phPX564QBDLF87n4c34TLhX1Wch9bqXyhvfTVC6RZNQlufKN2a+yVmqVnC7uIFJCjCykosmU1EU15r0JKZcySSHkLSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-63124ac76f5so3798633137.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896725; x=1780501525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfOoR/aqXQDsThFuP1OYYuQj5JnMHoQiHq+9j/hSjtk=;
        b=smaXjZH4AqBJEMW2uVUMfDFI/eS5Ts0Wo0uuHThrZrguP+w+JnYpnnMbL5aRb75p4C
         UPKgyRmjoen2rib6hPGVQK/x00s8Z9c/sQgZYLOsavfh/+ItkLRkkuaHhmWXF5PW/vNz
         GpDkCXKIBtYY/f2vqAviaPjp49OgS++5Liwy268loIOQpwkEjywqjIHeBmwUS9D2CDgw
         81JRy6LmcntBThdL4xbZeZuDn63ZNxLSdRKBWJU0pgFKSkhCBPxz1ozMdovARLst8c5u
         VESWQc2gheT27pSfjDyCXywzQIR74V+N8yq7vHoXiHPIqqHO1+4qPrjso5VLGm6je5xk
         fjNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JEr3qV6xci/bXkDKmBaQ/C8vC1zsDm4aeIZHIgZ2abN5LNLwscCebhtTwARRDzoib1wM2PjlA7FPT@vger.kernel.org
X-Gm-Message-State: AOJu0YykVvPqoz5izfN/joAg+cT2HiHmI3Q4A87KIqyrBi2TmVkXb6Ts
	j1ni+dxdegve64amVh5+CFtXRfaYDWRrIe1Y4/L/maFFEHum6kQO8LbYSd2wwzWHWZQ=
X-Gm-Gg: Acq92OH4u9H67vr/6ScPPTj1bkL0uwWB1BqEKOeLNJ5G8MgpyJPRUZsn/GBEQnwdzqg
	hkjAQ7PQfikz32bCRl/sOjF3NglzJZHcW4W9honz4MJHjwV6wjWw0j57+qVecy1anDAu9jp78rB
	/nUU9uBuHfs1T4QJ0Ff78ggSA8UWvfD2gkCaIfSckdB8jN6uuIdorDgTXopayzfQ1hkBugJtvJk
	0PxE0mFPeYf7PtcwCu0bxOcYbKkzhHHCID+unCm3R+tuSWxAzOOrxFJX1NLjAOjC+BVWAzAytxq
	Kvto3VBDUplWQNn16pp8apNCS7kP8mRFGDT3Rpzj7+VjebOg/uaIhgPWuuHsIq0oLxPvX7hZaDq
	kaR6u4iIBw1ldtfqUutMIMRa9ik/dvKxNFgVoZrrGyWREkmXczAhlm3VB3DgiCSVsRDmXgFQrTz
	J1EWpjwsfm4PLMiuyBUElyJnTNVEqnS4F7ZJYtmYHPKYKBFcibSppIpn5tW7wg
X-Received: by 2002:a05:6102:15da:b0:6a2:cf9a:a18a with SMTP id ada2fe7eead31-6a2cfe71d7dmr2928783137.15.1779896724769;
        Wed, 27 May 2026 08:45:24 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9617383b1a2sm17546322241.4.2026.05.27.08.45.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:45:24 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-63124ac76f5so3798626137.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:45:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8jutabF4KhDzpPt04OAVgTaKFUk3uu5CCuZSeZyrM7alLZ06g2mAa+bgc0XtEsTUx10YuZM+KkVD5t@vger.kernel.org
X-Received: by 2002:a05:6102:6a88:b0:6a2:b2a1:f16a with SMTP id
 ada2fe7eead31-6a2b2eee043mr2865434137.2.1779896724115; Wed, 27 May 2026
 08:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
 <20260525111920.15F771F000E9@smtp.kernel.org> <20260525-gaining-unaired-c96367a78c9b@spud>
 <CAMuHMdWUeExOnKm1=kRSr0=HVJhgyLDBAK3VqTP-LK1q0-f9gA@mail.gmail.com> <20260527-prankish-causing-4139d0dd0b51@spud>
In-Reply-To: <20260527-prankish-causing-4139d0dd0b51@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:45:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtLorK+Hjc-ZWCAn273ZN6yUEdyjxpJ5ynZ09sWqcBdg@mail.gmail.com>
X-Gm-Features: AVHnY4JYQCCMZ23A5R3RVcLGsHx5LrnGPL_lIUR8tDNP9RgCHgiKXFedQjj7oJw
Message-ID: <CAMuHMdVtLorK+Hjc-ZWCAn273ZN6yUEdyjxpJ5ynZ09sWqcBdg@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock
 inputs for RZ/V2H family
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, 
	John Madieu <john.madieu.xa@bp.renesas.com>, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Wed, 27 May 2026 at 16:54, Conor Dooley <conor@kernel.org> wrote:
> On Wed, May 27, 2026 at 02:44:51PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 25 May 2026 at 18:57, Conor Dooley <conor@kernel.org> wrote:
> > > On Mon, May 25, 2026 at 11:19:19AM +0000, sashiko-bot@kernel.org wrote:
> > > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > > - [Medium] Strict array ordering prevents the independent use of newly added optional clocks.
> > > > --
> > > >
> > > > commit 3723d06ba80fe72a3e7492af52e5e54aa0f36b03
> > > > Author: John Madieu <john.madieu.xa@bp.renesas.com>
> > > >
> > > > dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
> > > >
> > > > This commit updates the clock bindings for the RZ/V2H family SoCs to include
> > > > the optional external audio clock inputs AUDIO_CLKB and AUDIO_CLKC. The
> > > > AUDIO_CLKA input is fed internally and thus does not require a binding entry.
> > > >
> > > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > > --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > > @@ -26,16 +26,22 @@ properties:
> > > > >      maxItems: 1
> > > > >
> > > > >    clocks:
> > > > > +    minItems: 3
> > > > >      items:
> > > > >        - description: AUDIO_EXTAL clock input
> > > > >        - description: RTXIN clock input
> > > > >        - description: QEXTAL clock input
> > > > > +      - description: AUDIO_CLKB clock input
> > > > > +      - description: AUDIO_CLKC clock input
> > > > >
> > > > >    clock-names:
> > > > > +    minItems: 3
> > > > >      items:
> > > > >        - const: audio_extal
> > > > >        - const: rtxin
> > > > >        - const: qextal
> > > > > +      - const: audio_clkb
> > > > > +      - const: audio_clkc
> > > >
> > > > [Severity: Medium]
> > > > Will this strict array ordering prevent the independent use of the newly
> > > > added optional clocks?
> > > >
> > > > Because JSON schema validates arrays strictly by position based on the items
> > > > list, if a hardware board connects AUDIO_CLKC but does not connect AUDIO_CLKB,
> > > > the device tree node would provide an array of 4 clocks where the 4th name
> > > > is audio_clkc.
> > > >
> > > > When dt_binding_check evaluates this, won't it check the 4th element against
> > > > the schema's expectation of audio_clkb and fail, incorrectly rejecting a valid
> > > > hardware configuration?
> > > >
> > > > Should this use an anyOf block enumerating the valid permutations of optional
> > > > clocks to avoid forcing users to write incorrect device trees to pass
> > > > validation?
> > >
> > > Seems like a valid question to me. Can be solved by making the second
> > > last clock an enum.
> >
> > Calling them optional may be a misnomer: these pins are present.
> > Typically we provide zero rate fixed clocks for such clocks in the
> > SoC .dtsi, to be filled in or replaced by the board .dts.
>
> IOW, either both clocks will be provided or none will be?

Exactly, see the first hunk of "[PATCH v4 3/8] arm64: dts: renesas:
rzv2h: Add audio clock inputs" later in this series.
https://lore.kernel.org/20260525110603.4018170-4-john.madieu.xa@bp.renesas.com


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
