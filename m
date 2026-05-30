Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4021F3016E1
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780161255; cv=pass; b=X+uSkJnyDcWT91PfDB/9FDAAz8krjNjMbfT7okrPMbkeDNTZpezMorMWBTYua3zMX/hNtHqXdX6wmFvpmJAvusJCHv5ufY6tmTSLAG8Ck24ZRNvU2XMLHBJtKvmVBoVq/3p5jiQq/KSraiYkZZtDuILo0N02cykuWp2JZqK0MCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780161255; c=relaxed/simple;
	bh=2o+/rs9TndTp+GvavIomFayvai/SOzGUDWkHVGgdyzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrXxXaV+vzoSY2GkE/53v6zxtNGWEl1JkokHCTqBpnYYGdVyB2C6KFuzagy+h9Cxk/VH7Sp6gsgBxBaDm7L2k17N8pG+pdg5PIYGOhW6nfig2BE8nZKgr7PmdtOlKvA3Z9UPT7zuvd6vfMV8iwEFu8L9hVLy3J92PkKVuY8VG+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEymVx4y; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEymVx4y"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ccef6cbd0eso1341196d6.1
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780161253; cv=none;
        d=google.com; s=arc-20240605;
        b=Y6rXsgPShRJ9JtNKRKYXJdF5i0lX1UtMEAjqb84nZskDCSxhhsGXO2HJWy3bEPwefB
         jqKco2RN6OmvunV56OtYFnTFIaDoPxV9fPU5oS/7XkB5L0vLiHNaCiHtvgyHbq1Jx+sk
         ARi8sZuhRduAU+c52XccHQvhtR94dg7I63KW3Fl//OEPots4RkAI0EDuM4O99hbkNCRh
         0IbX3pM7pYuCMsS67XlzNUc+B4aTfaSmVwv11CDq1alIXjeaICgU/ux+zPijV+b1677J
         jYYBhSHBsnLDxzpyZHVQlIObeZf8omatFmeE6q/MjOJFdAGSdMnC+yRSrCZXtH19ayAl
         W/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ucTKT40VHRqUFLaRWPKDOED9BuLxH40CLDEbL6yUlMg=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=dzrDyMlyl2Q+yK8U+j3VzqRWY5TVpCOgiftTZ/4pXzTeC3t55ypvCKaBxc95UjVQuX
         ku/yf69YB/gectVzk5vr9f376zPaiwn11cvEjJfW7vw7FMnsN5yLXC0Id/UzbNe7TW4s
         7AZB4KXlWm6PQ/sohxmUrekEfwW71N55n29a2ZfVvt/lGDOX9SM1DccUy5C2lj58PpZ9
         pbRYvHgmOTQePrKnYPbFtMTo3Dh0JldErQr9XZ1/uRad1A+k6JRvZTKLGh/opQLMblV/
         9cXf3wRKudLg+9cj2p7+fZ8+JJkaBEWcUVaXFGns4/1bQ2HW/Rx2JL1QeiLyTeJUZ87f
         jNPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780161253; x=1780766053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucTKT40VHRqUFLaRWPKDOED9BuLxH40CLDEbL6yUlMg=;
        b=EEymVx4yFv8PL1cI6w18bkzsju6qB9lTn3GICvhXqJZHRXVtdfxowr9VhUg09PrsZx
         /WPKRs+iwUSudo/BWpAfJnEKDrYyRzMNyqnRqBmb9avD+dMuR8k4+XWbZUKvbxyYKaGs
         vvlDAofKV1bQyaUqG2t+QjCgzDcqGnPDuh6Yu9TfdKfLHXQUvA5D3ilyEGHxLCDsuokV
         N1vfvoATCK0ATvXP3+KECmkID3G/+ssSGXprdMiDWQj7D12vectPGX9/ezyoQ+YBxbXx
         EoBjVMrkR4fzOIBbrKuuZMfS+1QfQjx2Z9MXg4szwvhmAcVgZWmQNkHOY1k4fEkZRMG3
         0o+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780161253; x=1780766053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ucTKT40VHRqUFLaRWPKDOED9BuLxH40CLDEbL6yUlMg=;
        b=ZZeZVagnjmjBYFCXhPEO/SqpRNr/IN1mgVUhmSqnG2D0Lu/XT/FjrPwHU+sDwv7DXj
         DTq3MXz46/hB6uKI2EAo27RZIE/nNjQ7+J0tOila2ewj07i8/JmnaNaNOV7Hjl2AGZAy
         0bzdc29nFI46tYGmIAx3NAbXKoxq2vqYuZsRo0jPB/KLRalR5ghauSwhKxCDqmoGWGWf
         nhHPndjZCQyLv2IorwZM/DabcZW1NoJG8yEtNV7utvJqbsSqqks6sRTBysld97FoOlYa
         L7g1QWahdBcVOKcCsFKMHRXCNmgExcla2NkcHwx0vy7hXn64NL6eMrmiXhUUP9kfR6IT
         JBhw==
X-Gm-Message-State: AOJu0YwzaIrGqjBu8qgpG0lfwmCzTRCUEaG9OvOldHfSjRDMFn7RFTFv
	RwvvZgwBV5Ezc86tcxRyg6TmmVMKHVK6ulQ3ptSt/Oznu69dK9HvcUPAUULzKoENJdDA9zfhGqB
	/vHIcIbhLWGZTwAcJEwimewJQoVG6Vrs=
X-Gm-Gg: Acq92OEMEIqMm1JC6JvD/18vqyMosh54aqzVZc/azf1tOBMjdjuJ7AWQzr3OcB/eGZJ
	eAkEF35y4IEYdBx6DQHg2xTUNNPp2svW42vMUzDnPNFeYH4uBih+R9bRU5bOrLhI0ahdI5V1UV+
	5SJoSg7evq/UwztUUFh4SBkUaNzP+OfUBorRwUFHpP6eTibFuOtdrCrimI8ho7ybeYRFHZB4Fl1
	UIt/T42MPSys3c0uOk2keqTdyMBzNm7iJM1P5JqC6DtQLurPz2XGDacbZMzLfKAcrD5sYrJcxL/
	NRJThXWO1INKrtqx4A==
X-Received: by 2002:a05:622a:59cc:b0:50f:e5a1:29c4 with SMTP id
 d75a77b69052e-5173a95c0eamr37977631cf.4.1780161253242; Sat, 30 May 2026
 10:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530165917.55767-1-tahanarimani3443@gmail.com> <20260530170952.48D6B1F00899@smtp.kernel.org>
In-Reply-To: <20260530170952.48D6B1F00899@smtp.kernel.org>
From: Taha Narimani <tahanarimani3443@gmail.com>
Date: Sat, 30 May 2026 20:43:59 +0330
X-Gm-Features: AVHnY4Lv7zRXmQDf7gVKxPLn3hSGxb_gIFECi3xtDNCRDrvy6R5rVMjA-vfcYpI
Message-ID: <CAEsNvj-LoH11fWgt2d4cQsFm72+MTVNrVa6oJqsQD41Cen-zdQ@mail.gmail.com>
Subject: Re: [PATCH v3 RFC v3] dt-bindings: iio: adc: add ad7816/7/8 digital
 temperature sensor / ADC
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko AI (and reviewers),

Thank you for the review.

Regarding the hardware pinouts mentioned in the review, there seem to
be some inaccuracies based on the AD7816/7/8 datasheet:

The AD7816 DOES have a REFIN pin (Pin 4).

Both AD7816 and AD7818 DO have dedicated RD/WR pins (Pin 8) and CONVST
pins (Pin 1).

The AD7818 DOES feature an OTI pin (Pin 2) alongside its VIN (Pin 4).
Therefore, the properties vref-supply, rdwr-gpios, convert-gpios, and
interrupts are physically accurate and correctly represented in this
binding.

However, the review is absolutely correct regarding busy-gpios
breaking the staging driver probe. The existing driver erroneously
requires a BUSY GPIO for the AD7816, which doesn't physically exist on
the chip.

Since DT bindings must describe the hardware rather than accommodate
legacy software bugs, I believe the YAML should strictly disallow
busy-gpios for the AD7816 as proposed. I will send a subsequent patch
to fix drivers/staging/iio/adc/ad7816.c so it no longer enforces the
busy pin requirement on the AD7816.

Best regards, Taha Narimani

On Sat, May 30, 2026 at 8:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Strictly disallowing `busy-gpios` for `adi,ad7816` breaks the ex=
isting driver probe.
> - [Medium] `rdwr-gpios` and `convert-gpios` are unconditionally required =
for all variants, forcing dummy GPIOs for 8-pin devices.
> - [Medium] The `vref-supply` property is incorrectly allowed for AD7816 a=
nd lacks a schema restriction.
> - [Medium] The `interrupts` property is incorrectly permitted for the 8-p=
in AD7818.
> --
>
> commit c95479a0b55dc8599b178909579f060bf75eb282
> Author: Taha Narimani <tahanarimani3443@gmail.com>
>
> dt-bindings: iio: adc: add ad7816/7/8 digital temperature sensor / ADC
>
> This commit introduces YAML device tree bindings for the Analog Devices
> AD7816, AD7817, and AD7818. It formally documents the required properties
> and uses conditionals to restrict busy-gpios to the AD7817 variant based
> on hardware capabilities.
>
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml =
b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
> > new file mode 100644
> > index 0000000000000..48563e4eab446
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
>
> [ ... ]
>
> > +  vref-supply:
> > +    description: |
> > +      Optional external reference voltage supply. If not provided, the
> > +      internal reference is used. Applicable for AD7816 and AD7817.
>
> [Severity: Medium]
> Does the AD7816 actually have a VREF pin?
>
> The 8-pin AD7816 lacks an external reference voltage pin due to physical
> pinout constraints (power, SPI, CONVST, OTI), and relies entirely on its
> internal reference. Should the description limit this to only the AD7817?
>
> [ ... ]
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vdd-supply
> > +  - rdwr-gpios
> > +  - convert-gpios
>
> [Severity: Medium]
> Are rdwr-gpios and convert-gpios present on all these devices?
>
> The AD7816 and AD7818 are 8-pin devices whose pins are fully consumed by
> SPI bus communication, power, and their specific analog or interrupt
> functions.
>
> Since they physically lack dedicated RD/WR pins, does making these global=
ly
> required force device tree authors to invent dummy GPIOs to pass validati=
on?
> Should these be conditionally required instead?
>
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: adi,ad7817
> > +    then:
> > +      required:
> > +        - busy-gpios
> > +    else:
> > +      properties:
> > +        busy-gpios: false
>
> [Severity: High]
> Will this break the existing staging driver probe for the AD7816?
>
> While the hardware lacks a BUSY pin, the driver unconditionally requires =
this
> GPIO for both AD7816 and AD7817 during probe:
>
> drivers/staging/iio/adc/ad7816.c:ad7816_probe() {
>     ...
>     chip->busy_pin =3D devm_gpiod_get(&spi_dev->dev, "busy", GPIOD_IN);
>     ...
> }
>
> If a device tree complies with this new binding by omitting busy-gpios fo=
r
> the AD7816, devm_gpiod_get() will return -ENOENT and the driver will abor=
t
> probing.
>
> Can we address the driver dependency before strictly enforcing this in th=
e
> binding?
>
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: adi,ad7818
> > +    then:
> > +      properties:
> > +        vref-supply: false
>
> [Severity: Medium]
> Should vref-supply: false also be enforced for the AD7816?
>
> Since the AD7816 is an 8-pin device like the AD7818, it seems to rely
> entirely on its internal reference without an external pin.
>
> Additionally, does the AD7818 physically support the OTI interrupt?
>
> The AD7818 sacrifices the OTI pin to accommodate its Analog Input (AIN) p=
in.
> Should this conditional block also enforce interrupts: false for the
> adi,ad7818 compatible string to prevent physically impossible device tree
> configurations?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530165917.55=
767-1-tahanarimani3443@gmail.com?part=3D1
