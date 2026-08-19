Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC10918E02A
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161984; cv=pass; b=QsHYFcEXt5XvEXkDbh6BO62yiiitl79Rxhf5qfwkbxNKy7h3QonfTAX4S5g+FdZ2sh6jzb8wZXL27ewbZg7nVuW2By8bZolU1GsuHu82dxQMuXQ3WNL+6Pad7EO0LzPGX17idA7N/6MPezU09G891ITPHIeeSfx1F4jAHbKBvuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161984; c=relaxed/simple;
	bh=8zQc2kihKmltrWCPlwdMB1xKk2HSQAEcmpgNNDtGHUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Srxm0pCYupb+PxEx5kDbLQi5vz2rpkBlOdnfGWn0FlRfN3g8sSXIWX9o/fNFuCaRY9ZGAbMKnOco/85Mf+Noq25M5rv6h6AaFvuvNft/T6V565pesppHvyRUuOor6CUcZcr7X29oeQchJPPKmapnL7D8g74qaFhMP0HwK/cdUiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXXcfVH3; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXXcfVH3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so12580785e9.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787161978; cv=none;
        d=google.com; s=arc-20260327;
        b=rO1gg/KyCAkEILh7nXelSx4GUvbkEGP5smmGJbCK7L53yljhsOvBSU29lPwI866slo
         VdPTxmAT8hmdvULO3sfsv6Unjn1k9c45ucEwexZjgEtJ8oo2w4hCmAvW/ozWnKMcfHU8
         oMB1iOB4GiPKGSlIRdZiAystk8ActVXxkfa9HpreMTenqp/toQ1lfI84uj5RUZqng0UK
         h211eVTgyNjLIz533fReApN1ojw78CDcpjG++i5Ncto+KBWs4rTZAbLcv9kOi3H46Kbc
         uOoqhU3F80Uivv3A9qTrZU7lTQGCEo1PE8Tsv31z6NW5EAd2Z7XOeO2q2BC+WAW4/UPj
         gWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+jgLmRTKFljohDQGU+TCWbzcFi+q3XbPME2RwOajqPI=;
        fh=53Xc4/eobYf4YnCYZ1SVrFKs5QPl7PCU1rzBO830y30=;
        b=TE4mHm2CfpgqiTCHgcD+b821IzGb5YT64JEz+achrNSxzduV8N7MFNP2CbajV6nNTa
         UuCxixL9/iT4eFYUzJT8+8WLTNBjJ1iQpAoPAYzZR5rBDixLotRNKfekhZlGFesijYr7
         mI13eiLYvXAcDQnXeqBPIFltqzuEuP/TQaIIfdQ4xPvavpBdjgK91Ekmp5CIcJeCyfyB
         SVSLtkt8XDhM595lEq30/tn0RbraqVc0IBda4BVCPw4IGyGCWUpPgpqKCZ34m9hE0U7L
         sTAz6QFYUa246ShYGhqh0og+HV5JPcETgWYdoF39E5uelVuyi8E1dVs3qsKm/xt7a1uA
         5yVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787161978; x=1787766778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+jgLmRTKFljohDQGU+TCWbzcFi+q3XbPME2RwOajqPI=;
        b=YXXcfVH38vRQHLpMud0sKymlJJxYQpuCZpcwz8M53XaHtgoenBIyqf6stR6Vc/Xdeq
         uHCAnVmgW0czfJsnX5SLrPqTBpMfX4H9eYSxMWUaznI6ilM1cZNwV0P5ECAdUiNEwfAo
         7C9FAMgBH8VqvURatVNZ8AcbrRdKWfAot32hQbAal1idqXUMFNfsujkmoShfWuxaUUy3
         KJnxLCtrwnnkWFyVjlwcA5LXpVTvYgjObBuBKKDQZwtIJyMV3KgSDK299oU7OkF14CFz
         oogjPIwGfzCqZh5VILY3G6Val4jWXfcB3VkllaV5xxUTGNA3g/4/jt6sNvFrsmBqA9uj
         UY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161978; x=1787766778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jgLmRTKFljohDQGU+TCWbzcFi+q3XbPME2RwOajqPI=;
        b=euVzIbMGbsVC1jsoGFrMAaHOlN4MZ9dbC+ppVHsoKo3FTOSfqBovKX+VmWuWt4JR03
         SVwdLug3nsloAZh3EOXhmlu/F8/1HR2rDfZUyNGV3YYQf88OkHglqgpbvYAntg6TNfxt
         iVHjV2PQTuY+tupj1HY/3+PuoKqcra4mY5ffP8UNkqylvf8Dm9UsqSDdsVZ8DSQyLkZY
         MthZ2MY7vTvkligR7h5zk/y0Cc9qS6iHW81EB/33topYPAsa7KHrkM4P/pqFWsBUsqy/
         VaxF6GBA3f2t/ugRxhsDBvFjyc/+OwLTrxq6scc5/dZ40mszDFk9esGUw4V2PKRcKnq8
         IhUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOo//Vbwxl1sd+dzfysWaCz8IQ4UPwNUnbWdJvbyHe3USd3VC6vkzELZ7UP1deD2kmiA1Ojezp7U5o@vger.kernel.org
X-Gm-Message-State: AOJu0YxXK1zWC56dwSDblaaljyToo4sg6wsVs8qDlZ01RxNqA2B6C8/R
	bgfGf6FiU2KHtqNBfVrcFMarZQlLfnultRMvIduIuM8mgiRs6KsY0wQzrGf4uohGZEPncIx+L+l
	BxHRe+fqLu0EOKQAYL5NWpOOtWmiP3AE=
X-Gm-Gg: AR+sD13ohyauFGhVHoEaJKGr0XNiADYrOb52FM8fLum7CPAphguVlE+8671aSz3Vott
	0AxSbJEqN8r4FEB67DBXBTg5lFiOBxlFcsdXEYDS+5Gxh5txrN1N8JLisUEeDYW7XBJEOxi1yn7
	f8jP6c/+GGYIIsyg9AVP6kpezIT8MZdlNXPuz3LZxKU03x0ZAVKWA9vQnV35XB+ncOEMUXNaIaF
	qjGHG2WqcgPLJUFHNVHVc3xBmW7nkcOyIiM/BPecNrHI9T29x8YXYgNdnbWChHDwJlOv7X352g8
	KbTiRiRkexhVX/A3inWlk+wVkIthYtJ7xpfmq2EVEJZ3eLeap54AUmL6W/81c9iwymxO3boFAK/
	PkBZeJjF6cehOP7lLEoFO8tT6mVXd/QI=
X-Received: by 2002:a05:600c:3e0c:b0:499:4e47:eaf2 with SMTP id
 5b1f17b1804b1-499aa1a3e87mr135314645e9.6.1787161977655; Wed, 19 Aug 2026
 10:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUrD22vs+HyuxSRfgrGqugoNp4wfvet-1tRo2qF_CsFzQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUrD22vs+HyuxSRfgrGqugoNp4wfvet-1tRo2qF_CsFzQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 19 Aug 2026 18:52:31 +0100
X-Gm-Features: AcwNN1UUFcHAmSBCIsJsPZqcyHnPNsRSgvoydk2Px4kAQ_U7SkTKsV40VGJXBbs
Message-ID: <CA+V-a8upqydkSDs+aVbYVZS_x-+wr3ZZsSJgOYT-VGkZR6c6Fg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H
 and RZ/N2H EVKs with ADV7513
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review. Sorry for the delayed response.

On Thu, Aug 13, 2026 at 12:56=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 15 Jun 2026 at 13:55, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DT overlay support enabling the DU/LCDC pipeline on the RZ/T2H
> > (r9a09g077) and RZ/N2H (r9a09g087) evaluation kits when fitted with a
> > CN15/CN20 ADV7513 HDMI transmitter.
> >
> > Move the LED8 and LED9 preprocessor conditionals inside the node
> > definitions so that the nodes remain present in the base DTS. This
> > allows the LCDC overlay to reference and disable them when their pins
> > are reassigned to display functions.
> >
> > According to the hardware manual, the LCDC pins should use slew-rate
> > setting 1 (fast). However, testing on the RZ/T2H and RZ/N2H EVKs with
> > the ADV7513 HDMI transmitter showed unstable display output with visibl=
e
> > screen flicker when configured for fast slew-rate operation. Configure
> > the LCDC pins with slew-rate setting 0 (slow) instead, which provides
> > stable display output on the evaluation platforms.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
>
> > +/*
> > + * RZ/T2H LCDC configuration:
> > + * ----------------------------------------------------------
> > + * Function        Pin     SW Setting
> > + * ----------------------------------------------------------
> > + * LCDC_DATG0     P11_0, SW6[3]: OFF, SW6[4]: ON, SW6[5]: OFF
> > + * LCDC_DATB1     P18_0, SW8[3]: OFF, SW8[4]: ON
> > + * LCDC_DATB2     P18_1, SW8[1]: OFF, SW8[2]: ON
> > + * HEADER_IRQ8    P22_6, SW2[1]: ON, SW2[2]: OFF
>
> What is IRQ8 connected to on the display board?
> It is not described in the .dts[io].
>
Actually this is connected to pin 28 (INT) of the ADV7513 chip.

> BTW, r9a09g077m44-rzt2h-evk.dts uses a mix of "SWx[y]" and "SWx-y" (and
> tables), which makes it harder than needed to see which functionality
> is affected by a given switch.
>
I'll add a patch to use consistent notation.

> > + */
> > +#include "rzt2h-n2h-evk-du-adv7513.dtsi"
>
> In case of dynamic overlays, any conflicting pins must be disabled
> first, so please move this #include to the end of this file.
>
> > +
> > +&{/leds/led-4} {
> > +       /* P18_0 is used for DU function LCDC_DATB1. */
> > +       status =3D "disabled";
> > +};
> > +
> > +&{/leds/led-5} {
> > +       /* P18_1 is used for DU function LCDC_DATB2. */
> > +       status =3D "disabled";
> > +};
> > +
> > +/*
> > + * Disable SDHI0 as SW2 settings for eMMC/SD card conflict with DU pin
> > + * settings.
> > + */
> > +&sdhi0 {
> > +       status =3D "disabled";
> > +};
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
>
> > +/*
> > + * RZ/N2H LCDC configuration:
> > + * ----------------------------------------------------------
> > + * Function        Pin     SW Setting
> > + * ----------------------------------------------------------
> > + * LCDC_DATG0     P11_0, DSW12[3]: ON, DSW12[4]: OFF
> > + * LCDC_DATG3     P14_3, DSW18[5]: OFF, DSW18[6]: ON
>
> and DSW19[3]: OFF, DSW19[4]: ON?
>
Ack.

> > + * LCDC_DATG6     P14_6, DSW15[8]: ON, DSW15[9]: OFF, DSW15[10]: OFF
> > + * LCDC_DATB2     P18_1, DSW18[9]: OFF, DSW18[10]: ON
> > + * I2C_SDA1       P03_3, DSW7[1]: ON, DSW7[2]: OFF
> > + * I2C_SCL1       P03_4, DSW7[3]: ON, DSW7[4]: OFF
>
> I2C_SDA1 and I2C_SCL1 are exchanged?
>
Ack.

> BTW, r9a09g087m44-rzn2h-evk.dts uses a mix of "SWx[y]" and "SWx-y" (and
> tables), which makes it harder than needed to see which functionality
> is affected by a given switch.
>
I'll update it to be consistent.

> > + * ------------------------------------------------
> > + */
> > +
> > +#include "rzt2h-n2h-evk-du-adv7513.dtsi"
>
> In case of dynamic overlays, any conflicting pins must be disabled
> first, so please move this #include to the end of this file.
>
Ok.

> > +
> > +&{/keys/key-1} {
> > +       /* P18_2 is used for DU function LCDC_DATB3. */
> > +       status =3D "disabled";
> > +};
> > +
> > +&{/leds/led-4} {
> > +       /* P18_1 is used for DU function LCDC_DATB2. */
> > +       status =3D "disabled";
> > +};
> > +
> > +&{/leds/led-7} {
> > +       /* P14_3 is used for DU function LCDC_DATG3. */
> > +       status =3D "disabled";
> > +};
> > +
> > +&{/leds/led-8} {
> > +       /* P14_6 is used for DU function LCDC_DATG6. */
> > +       status =3D "disabled";
> > +};
> > +
> > +&i2c0 {
> > +       status =3D "disabled";
>
> Needs the same comment as led-8 above?
>
Ok, I will add a comment for it.

Cheers,
Prabhakar
