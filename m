Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA84A252917
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816806; cv=none; b=EnVYA0F7VysMLIwyQ+ld+NkdWE+YbNowduF9CvaC3D+R3GTWhe3zDPQPsJg7Yu97z28m9ljaV4/aywDylGFlOED6pkkUG8hHyT9B/kbv2yzULwa/mcGrreP9QAhQcSFvF+7cdM8uJA8kzUTVyyH3HJL3whus/9rNdNdaWa8BwXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816806; c=relaxed/simple;
	bh=xjGOQAyeG+sLGtpTLpoNkkVbqJYjiP02GBkiprEbtwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOtmTjQyL6NJgLU2kdpNJgROE2E+wF6tvjWhmx29lOU7BstYFyuSAZjzHETWn9xxzSM+aI/W937db/Uw059jxpyK1jbtGw/M68GbCeDx3G+W0HgjaZS5VUCFVn8d6tJHWxrGLjXcYhSZByDnmaRTknywfPU9DFTPVwMg9xLNuJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97ccfeeeb11so127087241.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 00:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816804; x=1788421604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvUM4c5tWmaF+uSmQU/koXzbQA9wo3PXrWuljtwS+9I=;
        b=lvKgi6PnWaOnBwGUtRDMcTbheFnhZQUyD+tj+bPRWmyzKAHMUgin87tpeFiLpDIS+s
         CLL6W0RxMp2nqwbg1WS5qF5NBPbs3c1nTPCniBrSoDMqjsN7ky1zXx4XOm6UwaqCs6D6
         YdUrnuhteGr3xQVfeCZQFkx6roVNAMBl7k9JyhgsLFSMMTsfiarRTsK0pfsBo9PBcwb0
         Bqx6kTVPyJ2DH5BZkU4Vpb/f6G+mlS81wnZYimhbT10wPGDee70pveMqmmxxy+EL83Qt
         vvfgxWsMfrEUC1rDdtZEtUc+W/IyFpdPmFICcZVDE1L/2tafx+OKWR23WO58EBPH9RJz
         KQSg==
X-Forwarded-Encrypted: i=1; AHgh+RpE/80eHyXJZ3M1wopbycQGJck4TKW5a/jE70Wpib9d+ekR2ykN3Bmp7jk0dxddFGKv60LH8hySXgv9@vger.kernel.org
X-Gm-Message-State: AFuF++mhOtYf7YwBE3BURRHj2a3nPAt9X5OB3NEuOZUVzz9zQw0qaG0C
	1VSIY93YiPuCOFDC/HkrheveBHbZ81gFgdaDBquDh85exB5yVhvSzuRJyrCajWUV
X-Gm-Gg: AR+sD12B0/MPibrE/sty274CF0I18HMHGHb9F5PJfdgsw3WAEnHZtDDa7ps14yFrQ+S
	cTuHws2XgwSV7YEn6ROkBlidI4awYdu+NpLWFfJnbqIopdG2TPc9MQOqNkTi78keD8HW90U4g9G
	sSZxx0PaVj7HhUFwH8tOeRfGtHXX2TgwEUNi1swSxYJmeHoJkIGmsJnNW2fWDkK8cQmJNULC+Kh
	v5yV8n0AphM8qCpSE8Vv1Lf4ioYzO8QAhaBskFY+HHT5/70GAXzbdnY0Dxy4WB0mMFzXqxaYWj9
	JmOizhPJ2R/ZdmQlvBt+DG4SllGTTMgEISuLgxtt9aA0u5jWRgzuqd+zdBsVL11sDOpqvv7Mspe
	clV/8lpWViBMsxbXCmtLXhNmGb+C02W5N/8DnxVHcmlUMPuMePtfQz73yFZXurVw7EHn06iQDOg
	Q8hFvEwanb2VztMkyBztSevdTYIDzbzm0M0IMCcWbf2D4lPwXCiojfKPIFsHE1vsvKG6WFYLMbi
	kqZG7ng3izSZ49rs/rsSZPr4Q==
X-Received: by 2002:a05:6102:d92:b0:784:b6e7:cee0 with SMTP id ada2fe7eead31-784b6f72654mr480258137.3.1787816803558;
        Thu, 27 Aug 2026 00:46:43 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbe084292sm4055319241.3.2026.08.27.00.46.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:46:42 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97bf8f6a31eso501579241.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 00:46:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpP8K+CkF2yKySX/x2mpe2zVuhcF9W2xtrqnB3TVg/CGLuVy5vhBpAKgthJBuk5W2ZBR0495maMU+1V@vger.kernel.org
X-Received: by 2002:a05:6102:e0f:b0:77a:3431:669f with SMTP id
 ada2fe7eead31-782c09fedc3mr3945222137.7.1787816802245; Thu, 27 Aug 2026
 00:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com> <CA+V-a8vWaxPyhyBF3wHKrTj0WnimyjxmU7HCD+aD_BazZGdOgg@mail.gmail.com>
In-Reply-To: <CA+V-a8vWaxPyhyBF3wHKrTj0WnimyjxmU7HCD+aD_BazZGdOgg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 09:46:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfeXq7yNH4n-cMyefHfj_x3u-GbQfzv55h1EX9SfTR_Q@mail.gmail.com>
X-Gm-Features: AcwNN1WD2c4xDDI2BYSA5G3mLqbJIjczt7SqcefQ9gZ9AETqqwoYkM7EIcUyqns
Message-ID: <CAMuHMdXfeXq7yNH4n-cMyefHfj_x3u-GbQfzv55h1EX9SfTR_Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot
 partitions read-only
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 26 Aug 2026 at 19:29, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Aug 26, 2026 at 2:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, 26 Aug 2026 at 13:28, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
> > > from being modified through the MTD partition interface.
> > >
> > > The corresponding boot partitions on XSPI0 are already marked
> > > read-only.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > > @@ -825,11 +825,13 @@ partitions {
> > >                         partition@0 {
> > >                                 label =3D "bl2-1";
> > >                                 reg =3D <0x00000000 0x00060000>;
> > > +                               read-only;
> > >                         };
> > >
> > >                         partition@60000 {
> > >                                 label =3D "fip-1";
> > >                                 reg =3D <0x00060000 0x007a0000>;
> > > +                               read-only;
> > >                         };
> > >
> > >                         partition@800000 {
> >
> > Makes sense. However, what is the recommended interface to update
> > the bootloader in these partitions?
> >
> The BSP supports updates via the flashwriter tool; there is no
> recommended way as such. Are you hinting to allow this to be done via
> Linux?

Exactly. But as you recommend flashwriter, and the two XSPI instances
should be consistent, I'll just take the patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

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
