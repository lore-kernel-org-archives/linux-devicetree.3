Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15142395DB1
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 07:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635090; cv=none; b=TuJw0q0C41iBSkZTi9cJnr34MjDPUV2KyDr7Xu/8BBSL/K14FY+gPPqN1JAfujISWUcVa++GJlcSrHP7uq7tm6w0x2fnWD6Bzag1wx/JZv6QPoehLoImrTjkP83ueq2E240z7lSkBRM+zkb09KBv7PdPFfRpY0PtRLP987mq1Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635090; c=relaxed/simple;
	bh=tb5ayrKCU1QRWz4F+1quo/d9UHKE8nDLKnD4uurIqwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Otmz7WqjjKNM9eVd5wedfBiL3NA5gNgfvTg20ntNkrkNYXMQOL1R6zNEzCftByvDMTCwOh5B0NcC4umtVED1lslGeu2n67MSgNy1nIN08WSS14MCnqdcH0zu7qVwLORYbNKJN2PwtNM6Nvi5lhS9WjLcPvSmA5FT8rTEt7EECuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-605def5b7f8so1983710137.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 00:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775635088; x=1776239888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4R92sE+3j+L6v6U2wW4n9L1aU391JVM9cT4kRUC3wo=;
        b=Xv7t4w7ykXr+YMASC+knrPt3C6xBFYYi2t4jl7alf+gmb5Rz1a54rLtCy+Jyb2Ev0D
         bCIDawIL6WjtTmJmJ1PRxRgBWn21WOoWO1xIaCq/uip9yL4EiZVqDd92NtvLzt3JQGNA
         8tjDrCeM9hSrGeXWLzskFl+Fya6+2628eywc61fmCsYaPE14gfXwf3l8pOrkkqHv7DFw
         jrDcO9uNRSzR5sAXWheu/4uELCjID9m1AyIWArDAYpgavEJOptaUmpVhSma4l+uObiPy
         qx9qq27jnPVQ3QkOIrtuqkNe5gbHQinRQXC/gBJEiAcIl0MZCy3zrbA+oE7jPmvOjS9j
         qePQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk+6G1WCC0u1ilz8thi3gDy7oGhgzN+XeYBDz9CZJj1xKd8BkTQ3SPLsltvhiVXS++KQpqLWk4Hq7v@vger.kernel.org
X-Gm-Message-State: AOJu0YxrvEp/5+XEfshvpfbdzGsqL7Ymi4hl9mEZ1z+3/ARAf92XUKvV
	o06TkPkxOe6PdO425Na4dWbsrFelYW9s2z25NHum8ybkJ+g2zwzS2zPr6eHI5hZ5
X-Gm-Gg: AeBDieujYesNGZBVcSWgDLGL/GYVMQ95ODoG46PIQh3fa/eaq0aoTvGe8t3iYtPiWxY
	TV/SGtVRA9vMx4B3wv3fTEeO1f1E0wuwDwaugfj7yiOkbiAVZytzICCTAIjj4oAeluSkzKxm711
	w43YAi5A8GiMHxnofoTcvSitxgeOcx6AxqbGKNZBb1TX7sJvgc7rN3JWFitmzENcxo3koGtclJ7
	/WPVq9FPfxoMo7KucfVYKvmIPS5OUFLLrQWTYlt2EG2vopT99N2+DGQvOcprg2r3REm37X+ElUb
	dlxLu+1tJ5T7uq9iCFCFsJXnFOLfKbFO3kUcc9NhasXOr+gTw5QPi/OLNTAHb1VNk+idS5i5/iz
	WYFXxrNlXTSMleShWQsvpyg81hhHUBSJ7b5RO0Far97cToWRYleZGdujyiu+kYnQZgOMPmr3L7P
	sVTdgFO0b+duFORyubsTKGr/NrOTnP2gtpzWNdZlalEYqq7FWQxRGrqnsEBwTym96PUTllRE4=
X-Received: by 2002:a05:6102:801d:b0:604:ef07:592e with SMTP id ada2fe7eead31-605a51672b1mr8453148137.33.1775635088022;
        Wed, 08 Apr 2026 00:58:08 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbac435dsm15896368241.11.2026.04.08.00.58.07
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:58:07 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-604f1bfecf1so3955775137.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 00:58:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWd0qBTZfzl24lviv3a4yJG8sYctrrNCQfPfClLRb6aO0TNGfeG2kKYQEXGZirxkqz3uDgmP2SDE+59@vger.kernel.org
X-Received: by 2002:a67:e718:0:b0:604:e315:6eb1 with SMTP id
 ada2fe7eead31-605a4e92bb0mr8578869137.14.1775635086837; Wed, 08 Apr 2026
 00:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327192425.438263-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260327192425.438263-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260327192425.438263-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 09:57:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkh0Q0_O4VZ=DoJ26=+QiddsLi_CwTVwK-L+Q5zb6wPg@mail.gmail.com>
X-Gm-Features: AQROBzCZCuwf6NF6rEXqKfmkxTjFfqDW2pSk-I-eqOP6g3EoYNQgB2zRxA-RYgI
Message-ID: <CAMuHMdXkh0Q0_O4VZ=DoJ26=+QiddsLi_CwTVwK-L+Q5zb6wPg@mail.gmail.com>
Subject: Re: [PATCH 06/11] dt-bindings: timer: renesas,rz-mtu3: remove TCIU8 interrupt
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cosmin,

Thanks for your patch!

On Fri, 27 Mar 2026 at 20:25, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Based on the following pages in the User Manuals, the MTU3 block does
> not have a TCIU8 interrupt, only a TCIV8 interrupt, as the row where
> TCIU8 should have been is marked as reserved, and the GIC SPI numbers
> stop at 212.
>
>  * Page 486, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2UL
>    Rev.1.40 User Manual

According to the Revision History:

    8. Interrupt Controller page 486
    Table 8.2 Interrupt mapping
    The =E2=80=9CCause of Interrupt=E2=80=9D column, modified (TCIU8 =E2=86=
=92 =E2=80=94)

So this interrupt was definitely documented before, and I think it would be
good to document that it was removed, instead of saying "it does not have".

>  * Page 363, Table 8.2 Interrupt Mapping (6/13) in the Renesas RZ/Five
>    Rev.1.30 User Manual
>  * Page 528, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2L
>    and RZ/G2LC Rev.1.50 User Manual
>  * Page 540, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/V2L
>    Rev.1.50 User Manual
>
> Remove the TCIU8 interrupt.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

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
