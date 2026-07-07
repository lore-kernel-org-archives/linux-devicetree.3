Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE393B14D3
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 06:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407164; cv=none; b=euhJSNni8cG+WUra7lRShoovWyU6MrX2t/utLJoj2ezsOo07p9UxtKCWKQKqoYktWgPIGAlhOA3gi4O6vbsekuQ2ed6rXhx8u4Mtb0dXb3K985cjscnJa7YZLOTqoTR1xxMymZ8pPZ0G6BdUweODLLQnTDBt3qpk03lPPn9sMRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407164; c=relaxed/simple;
	bh=gD/q7SKmBrC0OtQIWUnnzJ0urKpnYBI77eKOVOV42ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6pAxuuaw56G9sjmII2Bd48wnLwOdrRNs5UTqTyRCPVIP2ukfg7RW3NBKBMm1pYHcSGcVAGvI+ZAZly6bAvf6vH7f9vYo501xSKO+MgK/IzuYwU29+hAEZSwh1+tjYn4SBFat7HfwnWDID8gIr8e1ITDEdetgcq+JdJBiWvJpbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59ebf30a91dso1159246e0c.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 23:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407155; x=1784011955;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H1oWLi+zgA/mmqPta9lQQ7n/K/VL51Ngsb+MHJRTZdo=;
        b=psUQPMMaIZK3ku+xfMx439JobtI3kXzBccOeidW4R3gAV+0i/sztNeklHdGMGyYv67
         V7UcRfC7z/lNA+z7zdRzNpUTdsvvPRyW33Ax0h5VZuoM6U6ZT+6GQnEWNOd150OEy4DI
         9G34ahRNboWbi1tLq3JvX6R9IOHbQ4uBvBDeH3gZ0XtfD8R/arIcFfNcE0ytVfaMQWfq
         soHKs5xtcwMg44a55wKJSRRthu4EYmPHRYbQqg0mbbsgO2Sx6q2jhNwrTD/STEvdipgX
         LREE1e6BNuigwfBlKzagGtiUZXm+Y+N6ilakxugXcHyWn8CdtGJDvaqLOgwEWw3KOuRj
         i+eg==
X-Forwarded-Encrypted: i=1; AHgh+RotiA/hVzbyH6pHA/TOf3sSTBmZQVzWEkcgZ7O1paj37Nka7k9H3R1BmeLTWKEk6L+F1GQnxDN1TGq6@vger.kernel.org
X-Gm-Message-State: AOJu0YzjOMXKkDiEMKfodEUVKirbPPn50inSqOnjsH8xrhE1aY3DN/HV
	TLhEoBbzR6E2VeQMQi3rAJBxYWEPje+IHvzBs4Dea2ueoMlLy3EWkjQcrVz6EPmV
X-Gm-Gg: AfdE7cnE3zjxnVlfoDp3Rto58WmJIVZTItXB57gdMRmrCeRBK9iPqSllPzZWYp+wCxi
	0ZawZuoirm6hPM6Gduxv5T/Iie6NZ2+9Vn+pZzwr/PFztU50j9pM9yNnIXOFxzXEQEuamWKhOn0
	B6o1/j9fxyh863Q08vj7pGnmVSPzPat4+0cieuIs6/8HptbySzjGrJYvGYmZgxe0H6JYCTiDRzM
	KUqgPjxtznPI5pAeMwZj6cU9hAn6AU8ug8Ffys1rD9fAxo+EguFJvLJK+2Cnen2zcJ68lbrMxha
	h5VdGKv8bI7WeKO6lLDj9/HyOA6wbOetbK7I7IY9D8byiKK7fsGAyRD8WuxSiOylqV6yGVNTKDJ
	HwehlDyCatqdGKYD0LKZxavbNWQa7Ws3+Rh5mcFjlM16WTPH6k+l0HTi0ymTr04TvcEZHExpClg
	txWNlGVfsircjiWOJ8/gai/KOh3V2/HYhMPO36bk+94rqmFn4uAQOiEAUwOnWz
X-Received: by 2002:a05:6122:1684:b0:5bd:6a65:2822 with SMTP id 71dfb90a1353d-5be908b913fmr2180445e0c.11.1783407154959;
        Mon, 06 Jul 2026 23:52:34 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9698375705dsm6498009241.0.2026.07.06.23.52.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 23:52:34 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-73be40e5c4cso1010925137.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 23:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpADtyWwe8ajZHJmfYKmJAW4S32+Fm7sQ06WC7O1Q5fsBdEvIty+ia0zvCnqBvPuzp60g8EH9Boee8m@vger.kernel.org
X-Received: by 2002:a05:6102:1606:b0:740:2717:a2d5 with SMTP id
 ada2fe7eead31-744b79c1bddmr1806938137.6.1783407153869; Mon, 06 Jul 2026
 23:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
 <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
In-Reply-To: <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jul 2026 08:52:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQQWmn612R3y6qSXOZ7YMwZcfrBTrQZ9GzGekhFhtWSw@mail.gmail.com>
X-Gm-Features: AVVi8CefYSfbwNIrN8ylhp-z_YSTf7aaF8Cz88JDJCE3fX10J7HfmxqA13tE8IY
Message-ID: <CAMuHMdXQQWmn612R3y6qSXOZ7YMwZcfrBTrQZ9GzGekhFhtWSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

Thanks for your patch!

On Mon, 6 Jul 2026 at 21:44, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/6/26 11:19 AM, Bartosz Golaszewski wrote:
> >> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >> +{
>
> I am hoping to get some input on this remap function.

I haven't looked at your patch in detail yet, but the remap function
was the first thing that struck my eyes.  This might impact performance
of bit-banging and of the sloppy logic analyzer.
Have you looked at the code generated by the compiler?
Perhaps it would be better to use a table, like sci_port_params.regs[]
in the sh-sci driver, and riic_of_data.regs in the riic driver?

> >> +    /* R-Car Gen4 and older do not need any offset remap. */
> >> +    if (!p->info.has_layout_gen5)
> >> +            return 0;
> >> +
> >> +    /*
> >> +     * R-Car Gen5 register layout is slightly different and the offsets
> >> +     * that have to be added to or subtracted from each register offset
> >> +     * can be divided into five groups, listed below.
> >> +     */
> >> +    switch (*offs) {
> >> +    case IOINTSEL...OUTDT:
> >> +            return 0;
> >> +    case INDT:
> >> +            *offs += 0x10;
> >> +            return 0;
> >> +    case INTDT...EDGLEVEL:
> >> +            fallthrough;
> >> +    case BOTHEDGE:
> >> +            *offs += 0x70;
> >> +            return 0;
> >> +    case OUTDTSEL:
> >> +            *offs -= 0x34;
> >> +            return 0;
> >> +    case INEN:
> >> +            *offs -= 0x38;
> >> +            return 0;
> >> +    default:
> >> +            /*
> >> +             * This here must never be reached, if this is reached, that
> >> +             * means there is a catastrophic failure in the driver. Skip
> >> +             * any IO read/write to prevent further damage.
> >> +             */
> >> +            WARN_ON(1);
> >> +            return -EINVAL;
> >> +    }
> >> +}
> >> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
