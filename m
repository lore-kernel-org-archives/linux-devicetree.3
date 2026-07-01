Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CEE3EDE54
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900110; cv=pass; b=LaxhHLcJdpPzIJBLDQGAIxHKMeZufJGz3t4goZ+fstlNsJlY4IKSVnz6i7Azgkp1gYJjwoxIb/UOmF0oCzta39EDnL+ulSg7jaCkr6hN71q3TzVTYjcuinsFTFeQAZy9gMohyj7axGCMycKDPPq/4iKbjqDgaKJCPAJGawNnHZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900110; c=relaxed/simple;
	bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VcVTZUTl8H/gTlEc/kDfqBLywLa9ew2ViMmSah2QMwgibF2x6kHboXDoyMzXcYxYsUFNt0227sJ5f5aLQ03/ZYObca1ycPJV92802xbbmG6yjVBIuyjfUJhr7nGTuUt62FkHiZ5l5O6BtLsZZEFoWuZ7UUMKubj30+lh07CM/tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luhcVtIx; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luhcVtIx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69532288224so973545a12.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782900107; cv=none;
        d=google.com; s=arc-20260327;
        b=mWZn31/lhj5NFu9EYwTYwkIRksVhJp6KK7edTkTDzA+ch9wVGbMYwrqt9tjZnOP83g
         LAmUv7O9nwQRgpCvr5JH9EMba3nN+lI+q92PDK/vPjGE9b4oBKs/ALVGcgBNG9MIfIqu
         iafLffOWYeHv5ZwB0RcbsrHGxgYshe/tkvKcVRASMB24I6ubzHXJbHHD198/xX0YNoci
         Wa+Cv0UylfElHzLxzi2873rgMWI+WlbFMIzQpdmI7ePXdbcUFVFwnyKq74WxKb2chi/K
         Y+/pUN/+c/CbTXYM/iim5zShltnEL9Ey6OkzriAf5P79HjBUHuReVwkYC39umHPnGrj7
         5Wfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=;
        fh=1mb2Mb5IU79pmXqrfEG1ODN0LCWbsN+c7etagTcsiQ8=;
        b=GmXxidtNG56Wejcw1WzBxtiY+2UwOh8NQlVskunz6PvoX2W8UOmBBZrbEg0n1EIBDT
         67QOf/XyOSOnRJcmRWhwJkakujMxRmHtQYqy/879DS8268/mF0UqssT+32E8khy1M9Gg
         dZqs6Tur/5XWF66gDbhlD2sA3FfI7BoShalXkczSUq8upVB5qCoILjpAbtdWdwy3LLqg
         8vH7qs5OfS4sjxK1sABkrSU/2aJQ8dHMSXpwp7p3yioqZJeyiMGhpDsN/IQ9OTiXtWFX
         GIUGHqHUVUma5qjbghU9BhUPTCzxANJlvOhMTJFCA9XXX4KXHRn7nY07CamNlCNFX6lG
         r9+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782900107; x=1783504907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=;
        b=luhcVtIxtXDBoC5Se65QYH/Vd6YU0Id1WuYpLuLNfpZBMWEoL4kMwRi8j3syUsn3Dg
         1MjgATDpW0X07i2O+IgMiiXB0f9WEcwUre31vcqBwBHDl0Ts7RJw9R94iqFBMm6Hn/6b
         Lp2GJtsAlD5gj2Aj7AvdfMKVRiKn/inwjX/Ct1uu7Ln7wYIdRMegDBUeNKKDX0CHjh9e
         tJCBZ9zW7ll94ele9mlSXTJclf73jepdYY1u5aSs6syX5NKskqZI9VTTpViEB957vvmW
         LrLbPtPnP+MqbNOfWAZyRV6mA+LTKZPnfvflF5XWRCAa/24ru0ROYFIoHTSbsSFxZ+f/
         8wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900107; x=1783504907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=;
        b=b1sJONvilhW3uxgPn+JwbtePspM1JwPFE4mhBS2eljcSNWngmvZZO1dIJETArylHUQ
         RinKJTq/AOhp1ZaPu0kh6TqlUU9FvhYLADFrFvrBPG6uj1rAXfh2dSkVtHc8wErJ2CK1
         72LOYrDRmTsIlOl2Uc+t2F0ZEtsw558w8tEZSfEzuD1kwXGZ8mbpWP0fuwi96f3gM97w
         yvgeZ7MPb7SUL+37AF+PBPYBtwjvdDTCs/7P6Vg/12HMfo2IqNGBngQ701tpV/YZMvnW
         I+yQqXASj3sr/XWFEAtMk5a3OcbsRHky9dKeOyp8990ZUVYjFnKoranOw/Uh5dkLnVWT
         bBVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwaozDP3lMq6Xvm5W+aXFwIvFmj6ffxDT8K/29AnIaJMHBdDZ2ljHcfwL/SgV8LkRUybeYd8NIRbur@vger.kernel.org
X-Gm-Message-State: AOJu0YzXlpmPymWWwSgcjtrCJJbqAaqOKuMQOPDiCCQ4SqYsLWFY71MK
	zWlJdNpTfC7fBkGL5Yji56yHrObF0auaC40i09fE7Ui01f+1iW7DTOXYDBIbcgAHyYvqER1A0+8
	8zMTKE5tIuB7/n9rl+yQMspMXriVrg3o=
X-Gm-Gg: AfdE7clawR8CvbR5HyuJEapDkpk09A6sfV7dXYJ3ZekfKCZ+XQyfVPndANJwf7hhuXe
	2M6um1oac5CAVC7nDxIp6cfyCa365j2+s22qC2H/A3s9b1jNvymDrIXM6z3Whpw5YWxs+vXt6I9
	g+DvDPB5cn3OpH2FSc5iOHNXt2AjK0Y+ytN9FYBv81HPth5VKUfYYm7Uclr3LgrYkutuOcfsmIn
	sPnq46DhJMKY5mztVZTrft/sGvcTTVq6cyOTvKa2PtFOgf0S0HlxB/LxwlyCMEKBZ1yOH7Tc2gy
	JqFxuG1y2/vcMlUAoqMpBdCX4l+6cfAWP6Zw/pnMaUHQKO8XlvxTNrRkx9OpuR90n9J7vE+umKp
	snjsvg6rbHbr3c+4syJnMJUse9p68lEWmaMFoNEEkDIHao4o5sQFHOAn9DA==
X-Received: by 2002:a17:906:b792:b0:c12:7eeb:d2d5 with SMTP id
 a640c23a62f3a-c12aa1affdamr33696466b.33.1782900106941; Wed, 01 Jul 2026
 03:01:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com> <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com> <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org> <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
 <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
In-Reply-To: <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jul 2026 13:01:10 +0300
X-Gm-Features: AVVi8CfOApAIask00J9b0BLe88oz7fAW8fQFHDlsxs93vuIf3dHnb0iovhmAtW4
Message-ID: <CAHp75VeTp4eYQ4QBoeH2VyVhUivxNn1CaC9jskmeg-1zTAOYLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip() accessor
To: Michael Walle <mwalle@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"afaerber@suse.com" <afaerber@suse.com>, "wbg@kernel.org" <wbg@kernel.org>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, "lars@metafoo.de" <lars@metafoo.de>, 
	"Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>, 
	"nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org" <andy@kernel.org>, 
	"dlechner@baylibre.com" <dlechner@baylibre.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 11:44=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
> On Fri Jun 19, 2026 at 11:08 PM CEST, Linus Walleij wrote:
> > On Mon, Jun 8, 2026 at 4:41=E2=80=AFPM Michael Walle <mwalle@kernel.org=
> wrote:
> >
> >> >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot ret=
rieve the
> >> >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these requi=
rements in our
> >> >>> map() function.
> >>
> >> Why is gpiochip_irq_reqres() called in the first place? Isn't that
> >> only called if the irq handling is set up via gc->irq.chip and not
> >> via gpiochip_irqchip_add_domain() like in gpio-regmap?
> >
> > Not really, the gpiochip_irq_reqres() is called to mark that a
> > GPIO line is used for IRQ, so the gpiolib cannot turn this
> > GPIO into an output line, gpiod_direction_out() will fail
> > on lines used for IRQ. So it's a failsafe.
> >
> > You can live without it of course, but then you don't get
> > this failsafe.
>
> Thanks for the explanation! So did I make a mistake years ago by
> adding the gpiochip_irqchip_add_domain(), see commit 6a45b0e2589f
> ("gpiolib: Introduce gpiochip_irqchip_add_domain()")
>
> As Yu-Chun found, gpiochip_irq_reqres() expect the irq chip data
> to be a gpio_chip, which isn't the case (in general) for an
> externally allocated domain, is it?

So the whole issue comes from the fact that the IRQ chip is not marked
as immutable. For immutable IRQ chips (which all GPIO provides should
have) there is no such issue to begin with, id est there is no
gpiochip_irq_reqres() callback assigned (and respective _relres).


--
With Best Regards,
Andy Shevchenko
