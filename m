Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795116248;
	b=Jrtt6Ol+RXPev/IlP3ftkT8B321NMaQj6OurDqHo6rC3RBoDYSJwOewby2J99Y5oClem
	 SNSJXP2CZE8jwtPmELNaC3dMOScBzw5Jk/YTSUZQTKntiJGEygJehUwwUiEQRNzYGEdaO
	 Q9RnT0913Ff8SqyFaFKV75pjgAxbTElJwkp6yti65rDtKDtOT/fHTKze7CIfYA7alhESF
	 4ZAFAeKk2fHFDl6/Vnv5JbD4j/A4UaPzIQNzmbkRbLxtlQfUa3KVSdtVlNjDRvipJPSeV
	 X4UZUh7XxnPpylKK7hVJSXnTydIuzgbQMEIqYa9cNUMhKSIF0HG6OlLw8ofLLKtojQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
	b=JPIaJi9EJ8YDkw4NWp3jhigNs7lajK5Gy5bcbMOnn22znpXehhXW7DDVXUoliA2ksIYS
	 HN4LNFq3Q7NpOiF2Dn/AG2ZO1Pf/htO7UVfvd2rw2rSrHE68Dmdn2xZ5e4FNv1TrSURNv
	 hZj2UE0gn55mIAyrIsN7y8Eg1DFcFcyc2xzW+Tgc0HJVz+zQnPACM5fn5tVP3/cTlP57B
	 T01djXn/v35QtGNy27zoUt+1ApJaFd5xqS8T6I1spuSIErF7sXVzxLxFmUfAuYmh1VpXP
	 Y6+/WFPe6KRiLB4g97ZSPJq/mG2uV0vfK0cEFver4YK9MNAFBOQPjlLBTPP5zXvWvjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkZbmnP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C4E606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C4E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkZbmnP
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ee029fd76aso37190e0c.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:24:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795116247; cv=none;
        d=google.com; s=arc-20260327;
        b=q7yRMBuBXn8EMg/dG7GSIlsTuQu6YBxxFlABdFhQqK1KAjCmDtiGdfophVQCQQRUTJ
         I7QjSbmB8SQ3kWc+RVgEh7qTl8ccKSaDyKk0IVSKqUMar5YwSdn9BrdXPFN9v8duzwOz
         UaJAnwGIS/ZdKxvbcrPERHEQfUShhIB4dLwrXIH6QcPZXOVgZtBFJlF6owP8xzUYgShk
         U1NzGQDcFCZkDbChnlowMm+ZLbGlKmcKMY0CwGT39hiI4hi8CfkOdpU84iGSYnZBZ9jv
         3iASxQUrD0kEBvsYoSM/q7BtCnb63I4gzHrciwZJ7R32HideTimZgvwRSMD9IkiNZmCq
         UgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
        fh=bSVZ7ufNddlB2FV2JJ4XVxXvsu9B6b/Ijobz6sarEqU=;
        b=ObTOwE1yVAZsuUBa3Bvn7hBF0N99ySmTZqilrV3eiXY68GDbHOJ7IAo5Ui3m7ORwbo
         XkufU/7KrkXfgTsSEk45Eg4Qz13BLkHG4WhrtabeZxb9RPcJB1GzwMD8FHeO88uJDauB
         XI/NjsGNPyYmXjF91qA/iT2FC63IEw+cX6vJyIViFJ21/R3WLPgz3M4pBldsy/dXNWhU
         2BNTwCdqeAIofVHYtP4dJabjVTE4iMH3Df87+Fi8RuPSPk2C5sFhu02YiMY2yaKEzxnm
         HHI3KWxtiaK89OQAi2dMFdQl1g8FN3p78YzsCepwaaW1zDbxIQaXyIqDC2TcewG28Llz
         8Y0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795116247; x=1795721047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
        b=GAkZbmnPpvFsFsqgo/LWj9XBPVO7UGtHR1bduh6eAqChw1OaT+7pFmFLFUubAv7nfu
         BTkx0xCdFfad6UgWlWiPpG09Dn1TGC6G/2rGD3nnKDl/M393MCnv+VlbnhmldaAWHEyO
         OFpf+48my2TINLNgBHd9E8ltjfX8lpbms4Iol7iQts+xWh4sY76cKi7P1VoA6jfBCu7h
         BVI9vXqyrLjAE3oLTUBzbtsvD8T03Zf7f6Rolu7FMuTv48Y2QMW6Ix9bd4cQwYYtrURA
         JkXAQS45HTBK+gnOr3e8MrHzvbRfUO35VlTO1lmIc14K37rAjRyAF098F+GCUjoAGob+
         cIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116247; x=1795721047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
        b=fsARaGJnShKpk5KZJUS/V0TL9u8ORXj3DLJ9SPJD7x+G2P/Bac4G66fLSbYUnno8FR
         H/2bzYDSptj2TTwSN1AGD57HOUtWOVnHJlNDS/m12LzQqxYmgKunixinoyHz3Kxhh8j9
         lUqgccAXu0HaGqPFVrVE21mVqvRRYTX78b4quMy9Q10kJjjpZVnqtYaowZLkRy84sjrh
         lM1tse2I6uwk1vugvdy+B5NnqY9Pnwy8MxLnoVHIWjgpo8fv7wKCM7yJViyqt4LrXMVE
         Bn86SbFF6kqpDVz4MQOHrSJbC71oXbrwA37QqtKpSoV2D86SDzyLIBgjQC3ZpQZ+jBQf
         2twQ==
X-Forwarded-Encrypted: i=1; AL+hErGAKgA+MgBlG0Z4Pv6j7tFN3ST2QHwJY8qsDzDW14y2dTP3k2x1wMf0ONg6fD694Han+tXlUZduQOPd@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zpe5NSbE6acTGDtuwIDLpz7md1Jl45MmGsvjsLcNHH5cWw/Fk
	fRWzHOKKNrptVEVqWA9MX+5kaqcP2joYn7yCeF8nsxj6FvN21P3AjctBRbj3/mdePCUS290Y1wN
	6xUocUZsWIn9fTzIRNnvECnLEZgAWvkA=
X-Gm-Gg: AYBFou0ACk3vQI/f/w20austhrQTkZeXmaR9k7v97Y9c+17rh9T0Ax3I3RuEOu6b3s6
	7xQCxkab4LsP4PbBK9iyUCLyUbkrbGkVKKoTqdHXir17JQZhoo8p88PDT1mubBKtN7IRoweOF0u
	1ZGbpnOatuFd/gh/aK5TVH/a7F1X1t3qINBp2cvNEt8FsMITXcXGK5ZvVxB0+2Nz0HDX+alPYSK
	KR9gx6Hml3F2ITpz5KTe4M3JRkEHQLiGd09/QTfCUbnES23oa4Rf3J+4HGG01dtXLUM6IgdX6SM
	azUmIC9lP4YwPa8Ok3MptiFuFOouoQWIdrJDP/GziQ6owZp5b+8mjckkb2TnwWDJj/5r4p/DwRe
	sWMvv+2guAICrY4PdPpUtZbd5xWNtNunBhZiGxj+HSBKDCYGdX9AxvGj27fzh9CNAxbh89qcKZU
	Pd/XFggLdeuOAU8wQ=
X-Received: by 2002:a05:6122:4307:b0:5c9:a60b:e5a2 with SMTP id
 71dfb90a1353d-5ee8af4fbdfmr474971e0c.13.1795116246978; Thu, 19 Nov 2026
 11:24:06 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179489221679.1.1429296960451969532.led-label-policy-rfc@gmail.com>
 <179510277952.63755.11124972443142013738@kernel.org>
In-Reply-To: <179510277952.63755.11124972443142013738@kernel.org>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Thu, 19 Nov 2026 12:23:56 -0700
X-Gm-Features: AclHuK__KoKm0l4co8BZ367Zdnaot1-gmSZVSutowrjZ0dfQ-AxhOu-o9nn73F4
Message-ID: <CAH87RzTz0MuLP1yn25CCeL+TgDajNWNEvwZBVNJre9Gw2TFkUg@mail.gmail.com>
Subject: Re: [PATCH RFC] leds: DT: migrating existing labels to function/color
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

This is not a patch, but just an example of what it might look like if
I submitted patches to change all the LEDs.
I didn't know whether it was desirable to switch all the old LED
labels to the new format. But now I have my answer, and I will not
submit any patch to change the LED labels.

Regards,
Cristian Filipescu
------------------------------------

On Thu, Nov 19, 2026 at 12:02=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> I'm not exactly sure what to do with this patch, but not a patch, submiss=
ion?
>
> Sashiko already had some things to say.
>
> > From: Cristian Filipescu <filipescu.cristian@gmail.com>
> >
> > Hi,
>
> This does not belong in a commit message.
>
> > The common LED binding deprecates label in favour of function and color=
.
> > Is removing existing labels desirable when it changes established LED c=
lass
> > names, or should existing board descriptions retain them for compatibil=
ity?
>
> Removing existing 'label' properties will change the sysfs directory
> names under /sys/class/leds/ and risk breaking existing user-space tools
> and scripts that rely on them.  Existing board descriptions should
> retain their 'label' properties for backwards compatibility, though
> 'function' and 'color' can be used for any newly added nodes.
>
> > For example, the Orange Pi H6 descriptions could replace their labels w=
ith
> > LED_FUNCTION_POWER/STATUS and LED_COLOR_ID_RED/GREEN. With gpio-leds, t=
his
> > would change the names under /sys/class/leds:
> >
> >   orangepi:red:power    -> red:power
> >   orangepi:green:status -> green:status
> >
> > The example below changes two files and affects Orange Pi 3, 3 LTS, Lit=
e2
> > and One Plus. GPIOs, polarity, pinctrl, defaults and triggers are uncha=
nged.
> > All four DTBs compile before and after; comparison found only the inten=
ded
> > label/function/color changes. The renamed LEDs have not been tested on
> > hardware.
> >
> > I was thinking of converting all the deprecated LED labels, but I wante=
d
> > to see if this was something maintainers wanted, since it would touch a=
 lot
> > of files. Would you prefer retaining existing labels (potentially addin=
g
> > function and color alongside them), or reviewing migrations with the na=
me
> > changes explicitly documented?
> >
> > This is a discussion example, not a patch for inclusion. Preparation an=
d
> > static checks were assisted by OpenAI Codex.
> >
> > Thanks,
> > Cristian
>
> This does not constitute as a SoB.
>
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > index ce82aa265..8e4117057 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > @@ -8,6 +8,7 @@
> >  #include "sun50i-h6-gpu-opp.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> >
> >  / {
> >       model =3D "OrangePi 3";
> > @@ -45,13 +46,15 @@ leds {
> >               compatible =3D "gpio-leds";
> >
> >               led-0 {
> > -                     label =3D "orangepi:red:power";
> > +                     function =3D LED_FUNCTION_POWER;
> > +                     color =3D <LED_COLOR_ID_RED>;
> >                       gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 *=
/
> >                       default-state =3D "on";
> >               };
> >
> >               led-1 {
> > -                     label =3D "orangepi:green:status";
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> >                       gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 *=
/
> >               };
> >       };
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/ar=
ch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > index 57b137755..49f3d2fc8 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > @@ -9,6 +9,7 @@
> >  #include "sun50i-h6-gpu-opp.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> >
> >  / {
> >       model =3D "OrangePi One Plus";
> > @@ -45,13 +46,15 @@ leds {
> >               compatible =3D "gpio-leds";
> >
> >               led-0 {
> > -                     label =3D "orangepi:red:power";
> > +                     function =3D LED_FUNCTION_POWER;
> > +                     color =3D <LED_COLOR_ID_RED>;
> >                       gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 *=
/
> >                       default-state =3D "on";
> >               };
> >
> >               led-1 {
> > -                     label =3D "orangepi:green:status";
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> >                       gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 *=
/
> >               };
> >       };
> >
> >
>
> --
> Lee Jones
