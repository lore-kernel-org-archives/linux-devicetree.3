Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C31478E52
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635974; cv=none; b=p1RzG7tCfQVyJ/8b4eu+rHni0qbmBIfpqoOWm/cPEDcLCEkYKZ0x/YWOVJA8GWRi0jhESCvdWxubqnuOPYFDcea8u4fzLM/3NIrna1zxlru9Ii4n9wFUCYRh4l5HfiVUEnGe6z5rpkDVQkJoSMo2FgXCu0bGFdsr/zA83Nw4POY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635974; c=relaxed/simple;
	bh=CfPCLfqJ1dcGgFqUMf2iTh0mP1Mo/w6V8NMvdvj2Z8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COtUDPaLW5xqqozCnMvRVydDKww50y4YtFOOrs56p8Wd22/EWd2Fm6PnoUYpmBwG5uAFkW2lyBKNG7W/P6vH/6vXXvnzB1SpIh8NM4dyWA84nwEDqweSD9Kw3DDX75q33GlALc6cZTaGXA/tZ0RaW5T8IzL4900e2Md+tyNR5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so3471526a12.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635969; x=1787240769;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f67wdn3bVHnBmQlMR3YCbOBtB5lYRlk7n/MkzjvTnN8=;
        b=lybli08yIBjLT5vyPJChy2JjlZ4T/GZCd87C+3Q6vAC7hPQWBvNnY7U/ywJX687MX0
         d2vEr4wkXzNWFb+xFf9/7P2U/2Jb5oRAscC/eKB3ojPVUX2lhesFwUBpFEGyl0+gaDCP
         J3C09f0lMi0Vx639k5eww6ERODf1O5IHnRRvvkEj2K82KWCwURa1JwlAupVA35CbhBYm
         fGPTKYSSY3pNwHhhBpv4sbD1C1GLTrDskn39hLl555AGmPU2gUWUwGTSAWrx82klyTnd
         AE2ekMQ8o+1FfRYp0PHE7C+z2scZ8sBdmJAA2o6v+4WkzNJDf/HVA6UwYKpjheNg41MK
         CS5w==
X-Forwarded-Encrypted: i=1; AHgh+Rrru5cqC7AqpYOYg3gePlsBXzIIRl6rhazj3KgGh8Iy3iY32VQXxRtltS95Pzt6+nxxIcHf3A2JU6is@vger.kernel.org
X-Gm-Message-State: AOJu0YyWXZqckbA5SVnHr+WeLjpi9zLqKt7cFqnRY07igIrEQsEcINF3
	V9PS/8vTlBZjrD6egY3+XHpz0T4kh6Ork2bNiQt6aBdVzOQZc1/J30PmqmWkbtitT+g=
X-Gm-Gg: AR+sD13Wn0z45iYvNeSgMt7K4i8u+oZMz9FcJ2e5r7IE0iGD/RQxpV8efhVp/VrvWcW
	t2UvIpJqKtkjE0C7Jo8wZrCjtfkeujG5/CUYOFfw8+1afCuf2kA3A+DXX6Hx9EWQkCXvTwdzQYp
	MTW/gP3BhHZJrXD4M5XKUEWhnTroIlNUuXErwT0k9YyEDGgG4NNkFDX0VzfvTd/+72rIAhObCby
	Hvc4ac+kUBmZh1AfsFF4IHTxoyDn/aG+Qf/xDn7AIvzCsu21BfMnXzSHtXvWmj+Puxy5rNHiYjM
	hr0Sa2cMYm5ufQj8pqVopdOp/T//7ELUCieiNxzBWElBDT18WL6cGW4/IuTDv1wcgvgKah+9yc0
	BkAmWvVYLXK6QcFgRp+p/MJ7NF2AqssBxuOC06om3irwqVMoa4+XcDL0LnjhCW/J9nOy3XtvS70
	iKE+sgvgHV2fQiB3snjh9PQXl33MKlRTTO8g8zamaHohISCBigeMWJGOm5KpSF6lzyMOoGXOg+p
	QvGaxQf899BWvDzk6egi5CqnMC0Y6uEFmAj
X-Received: by 2002:a17:907:a689:b0:c20:83b1:396c with SMTP id a640c23a62f3a-c2108f7ba27mr379561366b.17.1786635968720;
        Thu, 13 Aug 2026 08:46:08 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2123858ca2sm5401466b.60.2026.08.13.08.46.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:46:08 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso3632247a12.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqo0XhNBXq/578mZCHiaSOBCODeWXIHLs/ebC3ijzbG8Y3W2UafFeARL7SSVO4mlO0+eO3JNyTNo65t@vger.kernel.org
X-Received: by 2002:a05:6402:52dc:b0:69a:a279:dc10 with SMTP id
 4fb4d7f45d1cf-6a3805f8791mr3074088a12.10.1786635968409; Thu, 13 Aug 2026
 08:46:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
 <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
 <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f5b7441a-d72a-41c1-b67d-5225d8e9ced0@tuxon.dev> <TY3PR01MB113468890DC8B12E1E43A54A986FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7cd113ad-3673-4f2b-97f3-aa1df4259a53@tuxon.dev> <TY3PR01MB1134672AC39737CA91F8FDBA886FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <68280642-0e36-4ba3-ae8d-486fb72ede77@tuxon.dev>
In-Reply-To: <68280642-0e36-4ba3-ae8d-486fb72ede77@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:45:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpgiGEJy74aAT4jq-YNDbFFi5S=vd_sfAJMMsgb24wmw@mail.gmail.com>
X-Gm-Features: AUfX_mwcukJIe17S8Tb__TpvCkLYwUOgvMbQ_VM8hDzlQY5Jb81CWcypwteZOLo
Message-ID: <CAMuHMdVpgiGEJy74aAT4jq-YNDbFFi5S=vd_sfAJMMsgb24wmw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, 
	"linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu, Biju,

On Tue, 14 Jul 2026 at 09:26, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 7/13/26 18:15, Biju Das wrote:
> >> From: claudiu beznea<claudiu.beznea@tuxon.dev>
> >> On 7/13/26 16:56, Biju Das wrote:
> >>>> From: claudiu beznea<claudiu.beznea@tuxon.dev>
> >>>> On 7/12/26 17:55, Biju Das wrote:
> >>>>>> From: Claudiu Beznea<claudiu.beznea+renesas@tuxon.dev>
> >>>>>> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V.
> >>>>>> The pin controller provides a register to select between these two options.
> >>>>>> Update the Renesas RZ/G2L pin controller driver to allow selecting the I3C power source on RZ/G3S
> >> SoC.
> >>>>>> Reviewed-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> >>>>>> Tested-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> >>>>>> Signed-off-by: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>

> >>>>>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> >>>>>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> >>>>>> @@ -281,6 +288,11 @@ struct rzg2l_register_masks {
> >>>>>>                          u8 other_poc_pvdd1833_oth_iso_poc;
> >>>>>>                          u8 other_poc_wdtovf_n_poc;
> >>>>>>                  };
> >>>>>> +
> >>>>>> +                /* RZ/G3S masks */
> >>>>>> +                struct {
> >>>>>> +                        u8 i3c_set_poc;
> >>>>> How this POC is different from Ethernet, SDHI and XSPI POC?
> >>>> Different bit mask and offset for I3C SET_POC compared with ETH, SDHI, XSPI.
> >>> RZ/G3L has i3c_set_poc, which has same bitmask as other_poc_wdtovf_n_poc.
> >>> Maybe create register specific masks??
> >>>
> >>> struct other_poc and struct i3c_set instead of union. So that both
> >>> RZ/G3L and RZ/G3S can share the same struct for i3c.
> >> When RZ/G3L I3C POC support will be added the i3c_set_poc member of struct rzg2l_register_masks could be
> >> moved as common member:
> >>
> >> Current code base allows for this extension. You can have:
> >> struct rzg2l_register_masks {
> >> +       /* Common masks. */
> >> +       u8 i3c_set_poc;
> >>           union {
> > OK, This union will go when we add RZ/G3L.
> >
> >>                   /* RZ/G3L masks */
> >>                   struct {
> >>                           u8 other_poc_pvdd1833_oth_awo_poc;
> >>                           u8 other_poc_pvdd1833_oth_iso_poc;
> >>                           u8 other_poc_wdtovf_n_poc;
> >>                   };
> >> -               /* RZ/G3S masks */
> >> -               struct {
> > Looks, this struct not needed now. struct with single member
> > has no value at all.
>
> I'll let Geert decide if he wants me to drop it.

I like having a struct for grouping, even for a single member, for
consistency, as the other union member is a struct.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
