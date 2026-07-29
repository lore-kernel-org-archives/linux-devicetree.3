Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319BD263F44
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785287395; cv=pass; b=Gjt+As9l8qAruZrOgv85brfX9zKBTA6uk1ALrFuPz1cuZcBUCrzT31McXGSZokrFgm6L+M9NYrk/f2Lxi3dcQPd6knAimOaCohhw9rZtbgrc5TF+A6kR3YzpqH2aHkmm07y/nv8D/QZf2jW6HH/JSi1B8MXX/+42YbTpKoVDAWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785287395; c=relaxed/simple;
	bh=n2tLOqKiA/gVaGCDuvZSUi7cs4K0xdsX0wMiKkKOk5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gt7SBt7mpwjo1YUcZqr8xBEuus8moSsaxGey3YIq/cWNDdXWb0g8Andm67jEzfACQgGKZah/6gLS2K14TIaFROY0hL70fcfHDa0m8593W5mefieBBP0YXXGLmj6Ry8lzJ3GAkgV+z2uUMVQW1FayO5lZsqYRQYdS0XxexTf0O9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahvAhaDn; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahvAhaDn"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so371785e87.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785287391; cv=none;
        d=google.com; s=arc-20260327;
        b=siXGF++ZL9+A0zWuhbKmYEd+l9a+yghy44P+8IVIevQFaKEkuzBuR3UTOAnjdyzv9N
         pp5/qwabmcFHxKrAV8ytkC3IL/X84fM4j9LrIarJ41DmHvdrJuxQwD+LqAeqF/I7vIN7
         KsbzcxFEIrHclM5JYaNMBZ/njaYNJcVJdCYbE2P+Kppc48HJeQOvnhZWItMhO0+6DuYg
         rNcCOsQ/SHEjEIs44/i+VP6rJlIb7iet3XnBuzcrcqWV3/oOX9G/O896GvFyKIEe6qlB
         BbbTvii+K2R4/8uaACU/KlbMJZE70MfBxDIR5nPwv3TZXqRrdTr3+kJ9Uz7F70T/1jDw
         1TGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4+JHf9Tz02oI14sIi4Kxcf5XaE0sSlLF7byX9LxXE0o=;
        fh=0KkxnRQV06ang3bbXuJj8KPK3SjfjVA8d2N3lvG9b8c=;
        b=dD+hybNBII9jt/oC3V84eqsAfhQgXDLlNZFynOJYaZNgYY7NeR5TMo8RDK0ttHlADq
         8KSTXaiF786gDlDuDRzrz+rrpO8D1+/PG7X/2/xgrot6pvkyXtMzU8NInCF1F63ArJZD
         Ifhp9Y2aiT9ZKBI63du4ukewG9bA4pyxwgAg70053G7nbw8IsoiBEWmo6UBtWEUeZWpb
         me6Nsk4QXZF57vEbOX52GTnBVSfbxkKGolQob0Oddkn2Hlu66wyFJTbbowh4BCz0ekzf
         NMdRw96Tk955Cb87dYzDKdWH/5kv5DFzNzj2X/H4BPT2L+QTSAm4vieZDzdgPkRZv6Bk
         5GQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785287391; x=1785892191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4+JHf9Tz02oI14sIi4Kxcf5XaE0sSlLF7byX9LxXE0o=;
        b=ahvAhaDnj2xBzcQeY9gplk34rJZHj0hP1W0Tuw2tfzGmFG6PMfJK108Y4FmYD8jjgV
         1LqImXtTaXnQN53cnHCcPu6IsdZ7fbn3HSlUAmZRCm2dhJsGwoFSO/M0NGQIVjyv5Up/
         SNYX6UN+qLfQs307+TPKNAOO/RBX2/RRcUOpR1RBLDI8Yt9Ctz1xWOmL+VdAattIMDQl
         JskhSafY3IrVUgPUUB5y4mwx72dem1yt/18AdOak/uaDbE+L6saEpk2/x5NdGgflYg5a
         ZskwJD0gjLtOp5ryLS/md3KfwVSNv70NJ2huomwN66z9+/9fuVPpA0yxjIBLPISFmjze
         srTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287391; x=1785892191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4+JHf9Tz02oI14sIi4Kxcf5XaE0sSlLF7byX9LxXE0o=;
        b=JTb/uY/xeMj0lDsNk4uxzEXyhx+eB9A0pP+dnjqwNizvb0ZzcoPsZxyfWsTuBuAM99
         yZJORTT/GovMfuMmMPQvO7Z56ZGsF5rVOMXzbQk4zL2L3t07xY7e5qpaJXHEG8FpoCCF
         43wxmMAb49kD2Ef1sdm84HqSzxKo7fmGoYP2ciyfJfW3vWRz/GSpa0ikIdrxEUb+giP2
         g/7HOi4iQQy9h7BTe6WN25cJ53PKJXpCLJqq8kVTb0mTeZH7d0BltLAVwoRpeh1O1RxN
         kapoIk0wBrJAj9ZoBL3esrlDTlAYBXK4MWAO1ncrIOmdCrYi/9mejSEDlJiCTzNlDExP
         4Wbw==
X-Forwarded-Encrypted: i=1; AHgh+RrAeQf41nWFy/cFSGc0zVD6KRU5/rAZx9c4yFXCewO6HHRojk0TxBiofTpM8m0EUS0BKlGqM51mhU8v@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/xeqi5QMDiGOPsQ4PyvvOCKqaA81zy+lzuOwX7qhU0ILAQfC
	yfxW5DWQ/HtWtF29qFzbi9/M97Ya8NcFJyFK1fSxbshBqYYlIiEGecf2e3SBI+rpGo1tAMITrMh
	ufuSQwb6iT/vghocscqIFpwb2/Z+uOgU=
X-Gm-Gg: AR+sD10/8rj/fqcPCfWjaTnR+0UZzUCEnZtLIOEeSmLwR1lpTl5BoQu/SSaYDd2r21c
	mdv4LyDU/xkp2lmjWnnG+/VbF9mudwug31c9V7hVfx6zk58WD6FvgJjk5XtqNn0wdmAC/8cRLnW
	eKp6iJPsbu3aI703JPCIlZqm8vz33aKadLGuFPHTCfMpWWL8D3NfFe2bTNF0lxDh+RQKDglabC5
	yksIqzk+y+N4rRBpraRLVoCyaR3yysRLTMb71Un83GnW32LBv4UpHEa/aes+JOf/ks8U76Wi1N9
	IX4N1BX9jp+jbWMGRGboDvSuerWlH+NScUvm0ZJghKLnpA==
X-Received: by 2002:a05:6512:10c5:b0:5b0:1760:facb with SMTP id
 2adb3069b0e04-5b2d0214458mr945160e87.21.1785287390915; Tue, 28 Jul 2026
 18:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-ti-ads112c04-driver-v1-0-475efe4e2b78@gmail.com>
 <20260728-ti-ads112c04-driver-v1-1-475efe4e2b78@gmail.com> <51752372-264c-4cef-b3d1-96030da117f0@baylibre.com>
In-Reply-To: <51752372-264c-4cef-b3d1-96030da117f0@baylibre.com>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 29 Jul 2026 09:11:38 +0800
X-Gm-Features: AUfX_mx3fcSRplAEJ_Hha200tfr12_2x1GhMG_4GN_G-k607Fr5ShEoBxTnN79o
Message-ID: <CAF7HswN-dWOuSDk=BNqXA9HxHFZFEzuRZ9qF2du7KXm6JXFNLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding for ADS112C04
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,
Thank you for the review and for pointing me to your ADS112C14 work!
It is incredibly helpful as a reference.

On Tue, Jul 28, 2026 at 10:48=E2=80=AFPM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> On 7/28/26 3:01 AM, Kyle Hsieh wrote:
> > Add device tree binding documentation for Texas Instruments ADS112C04
> > I2C Analog-to-Digital Converters.
>
> If you haven't seen it already, I'm currently working on ADS112C14
> which is a more complex, but otherwise very similar version of this
> chip.
>
> I think the differences are enough that it would be quite messy to
> try to share DT bindings and code, so OK with me to proceed with
> new bindings and driver. But we should try to make the use all of
> the same conventions as much as we can. (And to make maintainers
> happy, explain this in the cover letter so they don't ask why we
> we need a new bindings/driver.)
>
> For reference here are the bindings for that:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/tree/Docume=
ntation/devicetree/bindings/iio/adc/ti,ads112c14.yaml?h=3Dtesting
>
I completely agree it is best to keep them as separate drivers due to
the hardware differences. I will explain this decision and mention your
ADS112C14 work in the next patch cover letter to avoid any confusion.
> >
> > These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
> > interface, programmable gain amplifier (PGA), and data-ready (DRDY)
> > interrupt output.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > ---
> >  .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 76 ++++++++++++++=
++++++++
> >  1 file changed, 76 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yam=
l b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> > new file mode 100644
> > index 000000000000..55842fca1215
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/adc/ti,ads112c04.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments ADS112C04 ADC
> > +
> > +maintainers:
> > +  - Kyle Hsieh <kylehsieh1995@gmail.com>
> > +
> > +description: |
> > +  The ADS112C04 (16-bit) are precision analog-to-digital converters (A=
DCs)
> > +  with an I2C interface. They feature a flexible input multiplexer, a
> > +  low-noise programmable gain amplifier (PGA), two programmable excita=
tion
> > +  current sources, a voltage reference, and a precision temperature se=
nsor.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,ads112c04
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C address of the device.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      Data ready (DRDY) interrupt output. It is asserted low when a ne=
w
> > +      conversion is ready.
> > +
> > +  "#io-channel-cells":
> > +    const: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO connected to the RESET pin. Active low.
> > +
> > +  avdd-supply:
> > +    description: Analog power supply (AVDD).
> > +
> > +  dvdd-supply:
> > +    description: Digital power supply (DVDD).
> > +
> > +  vref-supply:
> > +    description: External reference power supply (connected to REFP/RE=
FN).
>
> VREF is an internal signal. Technically, these are REFP and REFN and both
> could have a supply connected to them. Also, there could be a resistor
> connected across these instead of a supply. See ti,refp-refn-resistor-ohm=
s
> in ADS112C14 bindings and 3-wire RTD example in the datasheet (figure 74)=
.
>
> Additionally, we need channel properties to describe a bit about what is
> connected to each AINn pin.  We will need single-channel, diff-channels,
> excitation-channels, excitation-current-nanoamp, and reference-sources
> similar to ADS112C14.
>
Understood. I will drop `vref-supply` and refer ADS112C14 implement  to
reflect the physical hardware accurately.
I will also add the child node pattern for dynamic channel configuration
 matching your conventions.
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> avdd-supply and dvdd-supply are required to power the device.
>
Makes sense. I will add `avdd-supply` and `dvdd-supply` to the required
list in the next version.
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        adc@40 {
> > +            compatible =3D "ti,ads112c04";
> > +            reg =3D <0x40>;
> > +            interrupt-parent =3D <&gpio>;
> > +            interrupts =3D <12 IRQ_TYPE_EDGE_FALLING>;
> > +            #io-channel-cells =3D <1>;
> > +            reset-gpios =3D <&gpio 13 GPIO_ACTIVE_LOW>;
> > +            avdd-supply =3D <&vdd_3v3_reg>;
> > +            dvdd-supply =3D <&vdd_3v3_reg>;
> > +            vref-supply =3D <&vref_reg>;
> > +        };
> > +    };
> > +...
> >
>
Thanks again for the guidance!
Best regards,
Kyle Hsieh
