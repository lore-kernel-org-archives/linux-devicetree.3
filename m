Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6AE38B7D5
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958651; cv=none; b=cpOQVOjo7zhtMEpVKB9ZOZoj6meTHZQ1mOLwAKVWD+/5m4hGxSTtf9CjZMWRPGnWMqV0F3ic9Qz4OFtWKiQ9pz/6CQ+9LTqR/v7Ybay6CG5fFLbqy/AgEJUEzLxpDSqglrD625rerMH7g+APlhl+zCvfATCaRrq5KYEmSKaHU0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958651; c=relaxed/simple;
	bh=udN5yvImCBSxZLul/qJ3biL3aUpy3IPt8kYNBe9x0r4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VV2ny9GNESxQ3pltgMRjUB58Yjqod+tJAhsF5KSDFw4cT5XoYr+5MomtEDFz+Y6rAyZSw+T6r8g0fiSsszOA+OT7Td6rwB4hmBbw5ScQXfYhUahNaNVTFTuPJrW45VBjuhWcq4Xj9zGP5GAtx0R16D/8f5BfTQKjUYV+HefqqJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9635794b393so432797241.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 01:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958648; x=1780563448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mOQGBHBqxMpQsOHiSMJOANdscDpYsZb967PigVYTEH0=;
        b=fJyQw5bL+Cd0l5ktKfMlCqKj7fCzVm++SXEMBxYe+xxL/4mebxdHN6jXZ3nwnbYU88
         nCHGe0MDPGiVSNJBUhERwMVpladLvFJhk44Qnx1V1LTL728OaOZn2deV8Q+/eVeiyiA+
         RRbbpvP+6eoWU7KofIrrcOX7JjkGsSfwNdo/DqU/CqWohIY1ANBhvTEiN6+leVi/bhzw
         lm+Y3uHvJtxYefhGy/Hw0JZBALYhljjCJ1+CnHOgLWX0UKIuiyjVlqt2B7gv8N4oJeZ+
         +IgwbP4nFxChzTfdS5kjkJN5cR8AXfyRzutR/1RMUDPdQtTM5oz7cPFJhifZtAOL/H3t
         QM3g==
X-Forwarded-Encrypted: i=1; AFNElJ9qbK/4BWlLjM0JG+9SmWAeWf4ojzYzAx4i6+BgRBRzF0UCYOaMzpBNU2iDJI2YBBPpeYdyYIfO5Mef@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8/GAmFdM78bg971jSPn2tqYe4FCL3IhduUFMbVyAOzoPbd3Rz
	joUXRf/SwMdYR1De41Jt0vMMyxOhXy1LgE9CbQgykHa/YNbC0hj3aozg/qbCL440ubw=
X-Gm-Gg: Acq92OHjC7Kb4G1iMflHHbRTyrSdnTnobr3U+jMN/8LF81wqiZewtRXrQlp5ja5Q5nW
	hSNeXP6ZYPPkQpku8QKGvXtXsjswbqz7U+AS40PZL1YA9IXFTWUDtWBSR+aE0izHPd+NoP+eJ+U
	Em7qW9dPFVTEr1onvU3EAkBwkjxXDvMT1OIyIEOfYIbaUH9V0YiPMbSEQ9qlOUhHXg3XH1jyj7b
	WlLIqfdHXByblGMbzjaPLzrueqkFcMbcklfXlS12i1Pcrg9yHKLefq0Vuh2f0xbY/2p2OgYZEA5
	ZbEsku10s0WWDCydpEVyDmnRiHUDRl4x6dE33ss9HbpJSjRQdZqaZ41OPhqtByRg4JbFouGjGgV
	FLo3n5fLcW6GzqAJ4yPVAofVaKxEdmGzdSfNzgE1/zNmvaLLHKxf83o0ONhGZ6D1QIYCHKRNaWx
	u7GO5vn9eWdNicld9W1On4D0u8VSmf/YE5vaexX4GESTM8tQUYjsEByOlF2o78X5qXBXX9khQLX
	QknCG/FvXHxqA==
X-Received: by 2002:a05:6102:2924:b0:650:9174:f3 with SMTP id ada2fe7eead31-67c77a16d65mr13049868137.12.1779958648447;
        Thu, 28 May 2026 01:57:28 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96396dcd8f1sm501364241.11.2026.05.28.01.57.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 01:57:27 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-57611a6a69eso3866532e0c.3
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 01:57:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/6p9oiJIJ7R95vBHHSb9tnsQ9qeZOaX6YYIFM3PlNVFhq8LsHbV7gBnletIKHrxqlXeYjxcKxVkywe@vger.kernel.org
X-Received: by 2002:a05:6122:2404:b0:575:e902:bf83 with SMTP id
 71dfb90a1353d-586590103ffmr13726592e0c.0.1779958647483; Thu, 28 May 2026
 01:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com> <CA+V-a8vhCqdVf4iAusGj3rtCjkazAFqQJ4cwcnEGS0qK-EnVVw@mail.gmail.com>
In-Reply-To: <CA+V-a8vhCqdVf4iAusGj3rtCjkazAFqQJ4cwcnEGS0qK-EnVVw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 May 2026 10:57:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrKr=Y=Xe-J-udh+CqoBD6XCKCSLBX7-N2ayrnw5prSg@mail.gmail.com>
X-Gm-Features: AVHnY4I9H1eGF8fVLQOfT5PSdArnKqJgHxtwFeff4WqnVF15bhO3tOXP7xLSidc
Message-ID: <CAMuHMdVrKr=Y=Xe-J-udh+CqoBD6XCKCSLBX7-N2ayrnw5prSg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 27 May 2026 at 20:06, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Thu, May 14, 2026 at 10:02=E2=80=AFPM Fabrizio Castro
> <fabrizio.castro.jz@renesas.com> wrote:
> > The HW user manual for the Renesas RZ/T2H and the RZ/N2H states
> > that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
> > interface pins have to be configured as specified below:
> > * SDn_CLK pin - drive strength: Ultra High, slew rate: Fast
> > * Other SDn_* pins: drive strength: High, slew rate: Fast,
> >   Schmitt trigger: disabled (not applicable to SDn_RST pins).
> >
> > HS DDR and DDR50 are currently not supported, and for every
> > other bus mode the eMMC/SDHI interface pins should be configured
> > as specified below:
> > * SDn_CLK pin - drive strength: High, slew rate: Fast
> > * Other SDn_* pins: drive strength: Middle, slew rate: Fast,
> >   Schmitt trigger: disabled (not applicable to SDn_RST pins).
> >
> > Adjust the pin definitions accordingly.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -275,12 +275,63 @@ data-pins {
> >                                  <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* S=
D0_DATA5 */
> >                                  <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* S=
D0_DATA6 */
> >                                  <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* S=
D0_DATA7 */
> > +                       drive-strength-microamp =3D <5000>;
> > +                       slew-rate =3D <1>;
> > +                       input-schmitt-disable;
> >                 };
> >
> > -               ctrl-pins {
> > -                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /*=
 SD0_CLK */
> > -                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* S=
D0_CMD */
> > -                                <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* S=
D0_RST# */
> > +               clk-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /*=
 SD0_CLK */
> > +                       drive-strength-microamp =3D <9000>;
> > +                       slew-rate =3D <1>;
> > +               };
> > +
> > +               cmd-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /*=
 SD0_CMD */
> > +                       drive-strength-microamp =3D <5000>;
> > +                       slew-rate =3D <1>;
> > +                       input-schmitt-disable;
> > +               };
> > +
> > +               rst-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /*=
 SD0_RST# */
> > +                       drive-strength-microamp =3D <5000>;
> > +                       slew-rate =3D <1>;
> > +               };
> > +       };
> > +
> > +       sdhi0_emmc_pins_uhs: sd0-emmc-group-uhs {
> This needs to be sd0-emmc-uhs-group and to keep it consistent, we can
> rename sdhi0_emmc_pins_uhs to sdhi0_emmc_uhs_pins (and same for
> below). Since Geert has already reviewed, perhaps this can be fixed up
> while applying.
>
> Rest LGTM,
>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks, will fix that while applying.

Apparently we've been consistent with using "-group" as a suffix,
but have a mix of "pins" in the middle and as a suffix.

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
