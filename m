Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4691D3612DB
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035643; cv=pass; b=DgmFrURWppIdCdyWqdkE5d1LfCcViGEDkpJi5DwM3MC6Cn/9y3DFapZDEyvNJAgaP/SblrDDlh33HZbhmr9KoXB4pj81qg9pXGTzGq14sEstzDCObXla0hoXFLaA5psruauGt/Tzg4v09XKSC3MHrV/ww+o85v9GED3DGfrZx9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035643; c=relaxed/simple;
	bh=Hqx+/2gwUQf5oktWMVU1iaI86zBAPEpohyRmf9hMejs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDGmVzPsBx7VJwTYOzDd8viyav0gYsjfekBUToqayzdVwEKRTkvQHmcIEP4NGfxOPOvwcLCEyxWG6KKMNsW59Zw+9CORD3HIx9uSgyUKq+fU7R2RqHGRAi0ex6QGnja6b5KOkFA8I/nXIH+WwXER4mfKYcoK4iyrOlvQa5ixol8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egSKewjS; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egSKewjS"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso860258a91.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035641; cv=none;
        d=google.com; s=arc-20260327;
        b=lv9T71qaXVC5s8HBhbLgdqGptb+I9nMJCrkhmA0SQaLCEmQvnBT7WPIBxbaPzZ2a6O
         F+Yb+8V6cAWQUZYg4PU/HAYmZycvzY87RnNqKoLOQ7LjvQSFBuvZJ1gP0KaM/M3r7SW8
         cOix2qPcd8W6nvTnPGlfe0YrPbO63KA6cJ9hQeVAO/1bPYUwhRRelrdKYCZXRiYFlqE2
         2Po66EhdC9hJMrL5b20lMibJ21DkzGhSiFbOSvOrkTX+TfQ/TdK3zgkDsAxIiyfLCFYm
         lu86Rz08fa0nI9/Z9ne0kyTQdDeIvo36/sEHYBYpd6XZLLXIr95K6/BQB263zMyoPgcs
         jKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PSq/mUWM2YvpW32XDTn1fQtxRJbdlACjQCMNg3wpfiM=;
        fh=NxUeMZhbVrxzpVHz3tpgD1piOquL2YUwGBHFxlfhUOQ=;
        b=F4nOnh+3Sffkrsh/Zbb/2EIuhKKBPQS/R/9BEAufcXHINak5p0irMznq96qsRU9Y1R
         6r6aLZJAskvdAVgfGw1ozjr/h3i9ERrCoBjYKFiCo1wQCSjiPTHHUHXZWuwx3mh3eyeR
         CXWpgAVED5DxkT4fgSsjXDZZCW64L1/k5eQTxFThA0R0kNdRE1exuWu4FZ1cgFskw4hF
         t51xWfW3g4Aj1ft9jkoTAY4gDTTrJtcGKfk+/eq2g2agNob7SMJs2G5SVwT7ZUTbnCrR
         GqyO9hzqbip3bel5lHoddgI/qh/CKM1dvG7FtJBSIB8i2nbKGdo+dTpqJ66uljWnESCM
         o8mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035641; x=1784640441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PSq/mUWM2YvpW32XDTn1fQtxRJbdlACjQCMNg3wpfiM=;
        b=egSKewjSB9QKWsQQJRVJxdBUYM87L3b2NzHjTXY2e4Lyrhp2z86pdRrS8fcXMNTw3m
         EXgJDomP8VGJNhY6mFQX3GG4onLh2IeZQaS7sh1lgkvjgT2vWxMR/eICi0cUg8kz7xv2
         r5c9voSjZr145JyTG74rT2ZgPcvogC5asUowiQ+oum+MXEuQzsLme9xiAk28xOZruLIa
         +YMgud91p92rVOdeACWN8wzl7tVSMLbF2oYYaUdUrr/qqq88DJE4ZN5Ni1h7BTnQBNMM
         i2OG54H6DA//CUQ08xfVEiYxayqkjHU5Y+uzlQcbs9v61CbLoF8FD7MaKOJ9oij+Jcvp
         T+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035641; x=1784640441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSq/mUWM2YvpW32XDTn1fQtxRJbdlACjQCMNg3wpfiM=;
        b=nWLu9HyFecW3vPTMUzWa3Mpy3i4DQDYccBriXZrrNwgfZ3RS8jmK+uj5h17U+czkkH
         NZXksBXdeP7yhZaZSeK2O3sDQGDnOd5Xm33JTPgNVlJM25MK/s9QPN3gw7UQBWKeI1Oe
         YvZ6i4L98RUZmOTXqTnjpoEHwNZ3IdFSUDby4w9pGosXN7YDKWRv+0bH+yBAJEMNT3d/
         xUAGPD55XTAB2FIDlpoiS+ubnTzREW1mQPkXVqc0Usc8gY/AXbcgYDDqdVY8HI7BVMcq
         sDiSQ763MK8F6s7LkJ7+zruD+p2JA+ngYakOA90sATb+fn8jHQ6H1u61/li4wOToRxwR
         tibQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlxaqC/qYRfHyxApdEpuVpnVBPclNjTiMRozo1qgB8achAc4f5iF+/AsLEVR+++Q65aaE5O8UVV791@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1tJ0/OdqdNztJLFKKdtA3Q9A6C5Iyj8KP3Z9GMEVy9uHnAXAT
	SEN0NcMQF1gC7F+QQZmn3JkTFFeHvsNm0OsEVyAMZh5nktaP29f5OuwoIOXUJGnZuP6JTD3Oh1D
	n46UtKAyrue5OmKZFfU4UD6rB9Jdh6Rs=
X-Gm-Gg: AfdE7clG/9kk6TUME8Z8PHcPsA5MbzYsHVjATjx0XpBdF4rQyE1kGGiEfhPL/3oF1dX
	edTuGc1UeHUdA1zbQjilq+O0RYp5hh/zWhLyXhhnryrQpZ8mHzr159CjKrfMPV3gdekyUgGFPKV
	V7K4fm8iFciT+co1B84vnrMkrZF06BmmxurmR709QAK+n1EEzmCDoXi9EmRBCTcv85PI/xR+VmZ
	uxJxu2LSGdBqal/PWbKWow/G2lPegToh8CReqpehESR0ESuL99JXPKAXerY34dRi/8H8TfOtYO3
	SnxgFdsWm/KyJSjH3zdO6EqNWh6Xqg==
X-Received: by 2002:a05:6a20:d70a:b0:3c0:b55a:80ff with SMTP id
 adf61e73a8af0-3c11063d595mr14450342637.24.1784035641387; Tue, 14 Jul 2026
 06:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-2-clamor95@gmail.com>
 <akeFmMQ_S1Y18hlu@hovoldconsulting.com>
In-Reply-To: <akeFmMQ_S1Y18hlu@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 16:27:08 +0300
X-Gm-Features: AUfX_myw9KUnmAWsWcXDIJL61TlrVu8UIEI1kefy-2iSBs3h-OI28TD8pRQoND4
Message-ID: <CAPVz0n23=F2Q2fSJJx1E_mST2zhomKcvhKtOy-Af3aoq-pZ-Zw@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] dt-bindings: leds: Document TI LM3533 LED controller
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:49 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:18AM +0300, Svyatoslav Ryhel wrote:
> > Document the LM3533 - a complete power source for backlight, keypad and
> > indicator LEDs in smartphone handsets. The high-voltage inductive boost
> > converter provides the power for two series LED strings display backlig=
ht
> > and keypad functions.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Jonathan Cameron <jic23@kernel.org> #for light sensor
> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> #for backl=
ight
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        led-controller@36 {
> > +            compatible =3D "ti,lm3533";
> > +            reg =3D <0x36>;
> > +
> > +            enable-gpios =3D <&gpio 110 GPIO_ACTIVE_HIGH>;
> > +            vin-supply =3D <&vdd_3v3_bat>;
> > +
> > +            ti,boost-ovp-microvolt =3D <24000000>;
> > +            ti,boost-freq-hz =3D <500000>;
> > +
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            backlight@0 {
> > +                compatible =3D "ti,lm3533-backlight";
> > +                reg =3D <0>;
> > +
> > +                default-brightness =3D <113>;
> > +
> > +                led-max-microamp =3D <23400>;
> > +                led-sources =3D <0 1>;
> > +            };
> > +
> > +            led@2 {
> > +                compatible =3D "ti,lm3533-leds";
> > +                reg =3D <2>;
> > +
> > +                led-max-microamp =3D <23400>;
> > +                led-sources =3D <0 1>;
> > +            };
> > +
> > +            led@4 {
> > +                compatible =3D "ti,lm3533-leds";
> > +                reg =3D <4>;
> > +
> > +                led-max-microamp =3D <23400>;
> > +                led-sources =3D <2>;
> > +            };
> > +
> > +            led@5 {
> > +                compatible =3D "ti,lm3533-leds";
> > +                reg =3D <5>;
> > +
> > +                led-max-microamp =3D <23400>;
> > +                led-sources =3D <3 4>;
> > +            };
> > +
> > +            light-sensor {
>
> Doesn't the binding (or dts) checker complain about this node not having
> an address?
>

No it does not

> > +                compatible =3D "ti,lm3533-als";
> > +
> > +                interrupt-parent =3D <&gpio>;
> > +                interrupts =3D <80 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +                ti,pwm-mode;
> > +            };
> > +        };
> > +    };
> > +...
>
> Johan
