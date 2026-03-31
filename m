Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2973B395247
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941668; cv=none; b=ezV5nj0hqyHD41aRv7HoV6Z3kyVr/PeU66mZEP96lCY3vWCzneRgDi7GrorlgOpN32sKpDr910o7ct+cKAVj3fHuf5aClLBxqUGr952LmDv3mvD84uNwyOfRymRT99in6/DwwGSYZ+IQQ7jCLxZFpQYTQNrp7KvTg8rGKu6R9uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941668; c=relaxed/simple;
	bh=q5OHA3ZdesVxiReV2n5KKI02Ui/pzuS+2M91K/dmVh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbKwQ8X9QHVZB8BK/gEXBmMaZeZathZIQS4/AfE9peq15Y8d1AzWqQg9iVFcNGOIM6iS2muHnRdIpnFwLXWJCv0Y2nXJUMIOAzdQT7H96Fa3YYeYRBXVAvO3VW98YC2gc4g2CM2gz8A6/j5a9Q/Krj7brIuhTMbVLHZw8wVSJsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cd90401034so541270385a.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774941666; x=1775546466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GybSjq2nLK8ss9TDbgAYO/BHTfGcuQ5m8BL/6DmiVDM=;
        b=Fi3Ev7eMVj73ryrCl5VRZioaI5HBwsysuPH8kuZ5RrFAhbKt5/PenlzpF6N5c8w3M5
         hDyA2j3i+sBY8yU4mcn2h7FguLtox+7RgsX+C6GwYSobjkc8J5uIPfeD6PJhv6c1r37N
         ruASRtpqBQHKZVUFL9NEeUuaKhGPhshws48QWhKZiW7ESR7TYoDqyPgX9iSM9ixCO39Z
         G4CsPBBmDJP3G2MyyNfqxh3T19aWD2DQhkXvMFKaNTQ8gbW6h13vh0ew5k8g4RyCKAre
         cLHAH280FhpEGpK/mixsxCYYLeU2imbVaDENQag0dmYExBGwe2tx7fpw1f+u9RvylNzi
         FtjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOgiHYl/c2ujah1AyxrrY886u7yBUb/FcfyMZWymO4m8Qu2xC0yEMidPU/Tb1MKofGS1xQCrMGNZGb@vger.kernel.org
X-Gm-Message-State: AOJu0YzIhkAi2WEuFOu4z/o1skMZ/norNr0HCHu80QO6GpWt4tBpR1ST
	teZVMywg5e8gDRK7fKIlmbPYmXfIFQUD8676vWLvwiweND8uGyYuJbIjAJdyY+aS
X-Gm-Gg: ATEYQzwb9T0aE6o8hZaT4/xXvddy6cxVwX11WDNHIXJrINoWfo4cekLUz7Aqf/zqg43
	qMuf4zdtTGDPerRpRVucBkL1VqTkNp1dsjTRpkHvdEmESWAFi42TZQw0DFxgh8sVkS0k1a8efkN
	5uD2gi+VMm0pLS4a43d6fN2K1XIFSy1XcmjMmZiBlsIv+rZeus8tmUaYmGZMfI8IHvc2z9RvODn
	p9/psS3TnGouvvUZNOeFPIXbmtDYHkvgitB6Vcu5XA/LV+VjD4J8IGcv7yDGMmxlKRcI2bQrhJO
	EzgyHmz+kblZpeTat7zeARcGU2DTaOhqLCM2d3ubdqIJHBhsCKeYuASQ3oTSZ/bDCzcMsNqnHVS
	eZ/keIRhPkVyTUcuoYaFi8OtdkJGQ9ZM3t7VwArgTUqDWG7FqovRBYz2dDJaLXKQKOnpZt0IhMl
	LnX5nrgtGmN9Gf3c8pQUTzXVyuYZc42qJ6p4iqLtn+N/qhdpJfoJmJhPYrlfhzjHtd
X-Received: by 2002:a05:620a:2587:b0:8cd:972d:2fc with SMTP id af79cd13be357-8d01c8437c0mr2132046285a.63.1774941665968;
        Tue, 31 Mar 2026 00:21:05 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027f06ee8sm971390685a.14.2026.03.31.00.21.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 00:21:05 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cfc40e4158so634747685a.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:21:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5zkXdMwWY6tZ35ZTE1ENsuB6n7aZtfKym+C4nTdXk6Zn9yysJAivGaWPlIgF/fpOJtPxnShZDCr+V@vger.kernel.org
X-Received: by 2002:a05:6102:32c9:b0:600:a2:138c with SMTP id
 ada2fe7eead31-604f9207584mr5893673137.23.1774941362400; Tue, 31 Mar 2026
 00:16:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527171504.346696-2-u.kleine-koenig@baylibre.com>
 <a14be34c-de2a-4bea-9282-1fac7780b9a4@kernel.org> <crk42dsypmbyqk7avldghjq32vslmalfmmouwxzgtdci4agfhz@rkbmxj5z22fx>
 <20250606141324.GA1383279-robh@kernel.org> <erst43cabswj3cwnszssolgyoh4dsgrlnjjxhb7luk3qkqhyay@6zyoixljvwwg>
 <CAMuHMdXDZD6QAbKgny1utfYhagUEZ5pcgiDCTTfJKNVVZLOUYg@mail.gmail.com> <actvzQTb-a7O7sbP@monoceros>
In-Reply-To: <actvzQTb-a7O7sbP@monoceros>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Mar 2026 09:15:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMuveJb0ntTA_VvgQ5UCSE2A3WtdcZyKus9hmHnmy-rA@mail.gmail.com>
X-Gm-Features: AQROBzC5O7y3QvMpcokNbpWXfoeDXMF1WE-YznyR1FbIsYafuG2hHGsIakeoqfI
Message-ID: <CAMuHMdWMuveJb0ntTA_VvgQ5UCSE2A3WtdcZyKus9hmHnmy-rA@mail.gmail.com>
Subject: Re: New default binding for PWM devices? [Was: Re: [PATCH]
 dt-bindings: timer: xlnx,xps-timer: Make PWM in example usable]
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Sean Anderson <sean.anderson@seco.com>, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Tue, 31 Mar 2026 at 09:03, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Mon, Mar 30, 2026 at 02:12:47PM +0200, Geert Uytterhoeven wrote:
> > On Sat, 7 Jun 2025 at 09:23, Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > > On Fri, Jun 06, 2025 at 09:13:24AM -0500, Rob Herring wrote:
> > > >    reg:
> > > > >      maxItems: 1
> > > > >
> > > > > -  '#pwm-cells': true
> > > > > +  '#pwm-cells':
> > > > > +    const: 3
> > > > >
> > > > >    xlnx,count-width:
> > > > >      $ref: /schemas/types.yaml#/definitions/uint32
> > > > > @@ -82,7 +83,7 @@ examples:
> > > > >      };
> > > > >
> > > > >      timer@800f0000 {
> > > > > -        #pwm-cells =3D <0>;
> > > > > +        #pwm-cells =3D <3>;
> > > > >          clock-names =3D "s_axi_aclk";
> > > > >          clocks =3D <&zynqmp_clk 71>;
> > > > >          compatible =3D "xlnx,xps-timer-1.00.a";
> > > > >
> > > > > There is however one concern that I want to get resolved first to
> > > > > prevent churn:
> > > > >
> > > > > In principle I think it's bad that a phandle to a PWM must contai=
n a
> > > > > period and flags specifying the polarity. For some use cases the =
period
> > > > > might not matter or is implicitly given or more than one period l=
ength
> > > > > is relevant.
> > > >
> > > > Why can't the period be 0 and no flags set if they aren't needed?
> > >
> > > I don't say they cannot, and probably that's the most sane option if
> > > there is no fixed default period and flags and we're sticking to 3
> > > cells.
> >
> > So zero should have been used for drivers/pwm/pwm-argon-fan-hat.c?
>
> Do you mean #pwm-cells =3D <0>? Or period =3D flags =3D 0?

#pwm-cells =3D <0>

> If the phandle wouldn't contain period and flags and so it would only be
> used to identify the PWM to use and say nothing about how it is used,
> then using #pwm-cells =3D <0> for PWM chips that only have a single PWM
> would work fine.

Exactly what pwm-argon-fan-hat needs!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
