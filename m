Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EB83B47FB
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916425; cv=none; b=j2E+hMtxYkjapEQDeZd7csje3KrAHy/J0UD0d1XYdrqJ1Llez4nevz6ma/zlgGL/1g35rmuyZiiub+E1S1rE1qvAd+QwcVmksrhRJeZg6TDlSNf9zqwM+miPtUJgPk5HK/Bt0yyIyFkrvbaLbwV4ktShqH73npGI6GfcT9+ABlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916425; c=relaxed/simple;
	bh=uwbTheRxj+yCut56Z2OBUgfjWKw49pVIDvBDA7a9KSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVlMo1t7FHziz6jECzh2xBpObV/5XBsm4giAh8jEXyPYbhMgGady/5hd8w9T54KDjFb86MDSdcencVIfqoRwaGQnyHZ2y5uSdCT24wCCsMlNNfo5TqQ3vAkY4TcI2/4x5PWtb/Ci1Z/rs4rz5T4xanip+7cKroPDgr+Y42yQ++0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso240864e0c.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916422; x=1786521222;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Jr0GgueyARZ20CCzQ9FDczXEeTxE2eTPx3t7jOdiD4=;
        b=GmU8A5lNpDIpnvAUw6PYX0617l8B3PkMVo8ILdkA5t43qKYA+Ib8QqYXdtnqajsz2b
         s+6/dBVUVs+pKlD3r5/wcswCUne0nI2srdR24KE/ppvHhU0Cz5N7LU2VLcrB5DBkJYTW
         iDnuJnLYHWVdm1VYp+KfGlFztmzRfSExd2yhzvxXwsdUu18Oa1dJ4Uuu54OvmGCwG65D
         C2YNbyPpQfu/YCm24JBuzvuagSqx//DFzWLjSvT2ka7iH6ifmbU87ohY7USS6Hh4WLr4
         Z3GbTiDi3HAwFJI9rsJeAoRRzPZyTZqAIC/MG7QSNhOXvgUvWBgMSrQwu5tr2NMy5Pme
         h7sQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGL8nmQgUgzpAyQBR3HyzGGdk68YLr3417uJ1uem7GlqsD4+1sbE2afsdWQomBolzteIUna9URDGy8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2TSRzpKG8Vt/ENCIkDZF3V9CZnXBh2DU3sT/P7YMPyJDUkDLd
	k375iIWGvE54n15kK14AvUWN9GbFlTTL66oKW1EFLA59BMbhpHWq/4pbTJZhIjxP
X-Gm-Gg: AR+sD10CRU+iY5/xexcLL5RkbmiVF79NZdYD+i+rc8Oa7XGnozHt9oX+UvpZuTUs7ns
	7Wp21dHRdg291vT1obEr2i0biOKm/aYD8S4ILvbtgNVD3fjsYhr3vji4pJAL09XZf3Hn9p+cx/h
	RHymZS5D04e6P35NtBILg9gKXdMtkxO3Agnu44y3OPjhcO66YVSuRw3jjUI7tn4RAWw8XMtn6Rg
	9ML2ePhX5sn8ECv9y8UOfH9v8UnxjZY/mgueeEEzLY8CATMITycnSZcnNCJX9wmoN1lQoI9yE2B
	DutyhGbjdEAXhnLRGqgrvMSz4Jy+M20Zfa58l30dN47oCIY6LBhW+IRyWROie6m0KQGYi1eBLkA
	b0Ah2iRergjF09S42WUbU1FsQaTyB2ZRdDhxrop4Zs0BSOnbRb5wz/DQCXPvnmzvIdO4O1i6iwV
	SACw8PvLvqr0NHAhqsVm78mjgBLzL4cVdyr46QKownPcCDn4sXngVnRdA3SinEPdrNeOIEWvlDA
	Axjar57JjJgE8zMZqoFkOFraw==
X-Received: by 2002:a05:6102:570f:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-760e78e60fbmr1050303137.6.1785916422570;
        Wed, 05 Aug 2026 00:53:42 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7604503266dsm1713710137.1.2026.08.05.00.53.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:53:41 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-966eabad303so187624241.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rre6XBD0e43HI0c9Jh975caJbpwp3O2IRJFh84A729D3Jw1UvG9/ZiY/C5zJ5kaJJKOD/twa2eG4OOP@vger.kernel.org
X-Received: by 2002:a05:6102:4bc2:b0:738:84c:6b3 with SMTP id
 ada2fe7eead31-760e6ed510fmr1096569137.3.1785916420540; Wed, 05 Aug 2026
 00:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
 <20260728011656.465040-2-marek.vasut+renesas@mailbox.org> <anJ6HkPgDb7I4xeL@vbox>
In-Reply-To: <anJ6HkPgDb7I4xeL@vbox>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2026 09:53:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQRJv8zoQYmgiObivaOoOBnE53mVdF3hPsJBK4bu4-Ew@mail.gmail.com>
X-Gm-Features: AUfX_mxP7XFNZTbkOdgjKR201hDCIQfWC5qVjcrN0qm75x-GUJxSc7cxG09TMSI
Message-ID: <CAMuHMdVQRJv8zoQYmgiObivaOoOBnE53mVdF3hPsJBK4bu4-Ew@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB
 controller glue
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Thanh Quan <thanh.quan.xn@renesas.com>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thinh,

On Wed, 5 Aug 2026 at 02:48, Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> On Tue, Jul 28, 2026, Marek Vasut wrote:
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-rcar-gen5.c

> > +static int __maybe_unused dwc3_rcar_gen5_suspend(struct device *dev)
>
> Avoid using __maybe_unused. If it's not used, remove it.

Whether the function is used or not depends on CONFIG_PM_SLEEP ;-)

> > +static DEFINE_RUNTIME_DEV_PM_OPS(dwc3_rcar_gen5_pm_ops,
> > +                              dwc3_rcar_gen5_suspend,
> > +                              dwc3_rcar_gen5_resume, NULL);

As DEFINE_RUNTIME_DEV_PM_OPS() uses pm_sleep_ptr()
internally, the __maybe_unused annotations above can be removed.

> > +
> > +static const struct of_device_id dwc3_rcar_gen5_of_match[] = {
> > +     { .compatible = "renesas,rcar-gen5-usb" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_rcar_gen5_of_match);
> > +
> > +static struct platform_driver dwc3_rcar_gen5_driver = {
> > +     .probe          = dwc3_rcar_gen5_probe,
> > +     .driver         = {
> > +             .name   = "renesas-rcar-gen5-usb",
> > +             .of_match_table = dwc3_rcar_gen5_of_match,
> > +             .pm     = &dwc3_rcar_gen5_pm_ops,

But as Sashiko pointed out, the pm_ptr() is missing here.

> > +     },
> > +};
> > +
> > +module_platform_driver(dwc3_rcar_gen5_driver);


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
