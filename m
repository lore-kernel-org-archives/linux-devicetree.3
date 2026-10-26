Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009710;
	b=uIZJGSnrlV+i+cCxYqCqRiJ0lkqJpPmxtLGKfDqCXkX+5tC7Xep/YV4gJJba4uNJ6IND
	 JuoNb1u7Ji4Fz+FGbW6xDC48lVksCV2DOVev+uuUlfsBKwjiDkztSN4/0lvCd6wSMW6nu
	 U/A45li9UF0RO9jDz2I5iF3TPFhcVb4TccF9TRdQeEgQMpBh6xJPxZVJ+fn/yrnzyhWqs
	 fZmtJnx3o76/0S0wshRIK8TT7Zi+wKVDeEGbQe2DCW0ZqtZ0FA9BWXVoPqtLaAna0r6Zp
	 WCxrMs05tnauPSKduzLmDTsAfOsyVOM0ebA3bFMiFz1pcPNjwXP2CvLr32qfxhhS5FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009710;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=xvHDL7X7nDz4fdHlD/Zd2vVTXXgNDrA1NXktS57i7t4=;
	b=X1JOwS8Md3oZrMlGx4cIh9hyo/p8fvgNbyzJD1BPNzN4x4E7EArrMv5zJOWEOcpRvM0+
	 9/CQAURhw0BcUO4Rnl+SGeeidyVqBZUi+mu3bRp0ABOPi7qja3ZuGZAmI0R57pcoevMJw
	 i07LFF0RXwvFa7Na/SmmhtNV8L9KRMMpf24iqs8ZAiz2N4TnnulY7Hv5TdGqbk+OjVESI
	 4ht6iSl5kxDctuW3PJnNBrXlUbBDAOt+9e2ffLqdPFzTCP3kM1jYJUNX/35RAk5BxpLzV
	 v7i94Bjn+TtY+cuDV3l+91S7SdNtJbEGX06diomGwie48TawXZ4hoDJ+xR9IL+8Qp3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F04606A31F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F04606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc7938c5e9so1190581137.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009709; x=1793614509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xvHDL7X7nDz4fdHlD/Zd2vVTXXgNDrA1NXktS57i7t4=;
        b=OvNh/KSi++fQeG0UdWMh1olkjlEyVRGRRH8ZrqTsiitFFx2MCOO1/5D/1pHFJKBGUa
         o/Re/2sGCFs9RljO5itnvb+Fqe4ZIenrr5ZHOo2basCIhah0cUztCazLetexoUtP8bdn
         Yu7VANMwmjjkjrdzgmDpU63uPdBpI7GwIiP4lhgw9lgHj3mzpwuo1GWX065VHy5mr+Z7
         8wekVXLXE1sPJ/FjV9aXyMadWqzgsUnQsVzAa+4q0SFfTNqL8KHpTMSflRI1f9EZy2H1
         AW5rN4UqaisBmnOtl6/G+MYn6qtLLFQsf7ww/fPmnjFKx63QmxQgrbp6biMg75zae2Yj
         pMnw==
X-Forwarded-Encrypted: i=1; AKwUvBzdBwpzFhwmjZUOeCwYEpPoGlXsP96VSPYJ74LVG/u3u6C4VkhpQxFduwC6RlBhFwKf3vKbvQvrs0IF@vger.kernel.org
X-Gm-Message-State: AFq9FYL6p86x0c1KEFLmNVeDH2SCq0RelM6UIg375OKcbzKjYBpTlI08
	jiRpmekT82ebRnM4dbgz+959+QTemBRA9oOp3zLZAKWSASdwukV63AaD/E+KAHz5
X-Gm-Gg: AYBFou08piOk3dujVFWSSDo44IwmqypjOdDCbz04IwTZJDEpWE77axcFtWAYekEc0Yw
	MnGkA8y/4hNJVCFSrLVVvQ07DVAk5sTCH3GtkK7eJqxuOwXDar7rzkZ7pl8fPwCgwARoKvD+Nk3
	fLJZF90gVr4/mAtc1dGvXHbLtb4lNpW/xg+an0nNhY7sjFq2cDGoj/0sSle/GbCm7NHs7TJRLFa
	tAd5Rxlh6FZ8KnQjamOEsJlcjv0PTpqFTqnmkwod26slACrKIJambqZxr/0mVxGF/4ot7ykhnSN
	eV4LBvo6sj0rxOPbVuM81LiennqHCHraWSkqZhQwRAy24/NtSqHHHZeOgV2yQXrU3xCzmJnldpX
	PP4dFA1rGWm08mYQa3oDPIPKa6hkPpJ+PYzAUn9ZbydUK6K0Z77OhyMHXGQSkb2ETqdTbFxoM/L
	C1YRBMrdtTx1BAehmaswYZxFD4A2uHr20J1hjXGx8SgC3xtNjxtgB0fK8h+kZhCaLIFaVwrjDB2
	AYfZJpWEJysCdDn/SgCh+N0lWvMIR2ZuOJZoFeJQqOLpWxwgOuiAoMMrgxi5EUdFivi0Y9kDlOf
	nRi277YI75fXoy7Zva2k2Q==
X-Received: by 2002:a05:6102:54ab:b0:7cc:2a1:42ed with SMTP id ada2fe7eead31-7ce5ca1787emr1299243137.1.1793009708752;
        Mon, 26 Oct 2026 03:15:08 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e2baf56sm6749621137.11.2026.10.26.03.15.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:15:06 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so3370090e0c.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:15:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz0fTdYDKMPByXha6ZeM08Gcz+//PB9L4g1e1b9j2as4fEJEzAmlURYsior2+7p0ZmGKlmSj5CdF53Z@vger.kernel.org
X-Received: by 2002:a05:6102:6890:b0:7cc:ace:24ad with SMTP id
 ada2fe7eead31-7ce5c6c0026mr1500062137.0.1793009705218; Mon, 26 Oct 2026
 03:15:05 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261023175919.160103-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <atyKo0pTYZyt5XJc@ashevche-desk.local>
In-Reply-To: <atyKo0pTYZyt5XJc@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 11:14:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8Q9UKrpoZuZfDUutrG=bOwcNWLnht1bufv0YVXJPNDw@mail.gmail.com>
X-Gm-Features: AclHuK_Zae-S6levySXX9MNUVg775ICficux5w8oZYwqHzeoFMa3QGI09OnmK_U
Message-ID: <CAMuHMdV8Q9UKrpoZuZfDUutrG=bOwcNWLnht1bufv0YVXJPNDw@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Sat, 24 Oct 2026 at 12:38, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Fri, Oct 23, 2026 at 06:59:19PM +0100, Prabhakar wrote:
> > Add support for the ADC found on the Renesas RZ/V2H(P) SoC, which shares
> > the RZ/T2H ADC IP but differs in channel count, sampling, calibration and
> > resolution support.
> >
> > The RZ/V2H(P) ADC provides 8 channels, has a fixed conversion time of
> > 20 ADCLK cycles, does not support calibration, and supports selectable
> > 12-bit and 8-bit conversion resolution.
> >
> > Expose the fixed sampling frequency as a read-only attribute and allow
> > the conversion resolution to be changed through the scale attribute.
> > Use extended scan types so the reported scan type follows the selected
> > resolution, and prevent resolution changes while buffered capture is
> > active.
>
> ...
>
> > +static int rzt2h_adc_write_scale(struct iio_dev *indio_dev,
> > +                              struct iio_chan_spec const *chan,
> > +                              int val, int val2)
> > +{
> > +     struct rzt2h_adc *adc = iio_priv(indio_dev);
> > +     u64 req_scale, scale;
> > +     unsigned int i;
> > +
> > +     if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_RES_SELECT))
> > +             return -EINVAL;
> > +
> > +     req_scale = mul_u32_u32(val, NANO) + val2;
>
> But what's wrong with the simple 1ULL * val * NANO?

IMO that looks like a useless multiplication, which will be removed
again in some future "cleanup"...

There is a reason the mul_u32_u32() helper exists...

>
> > +     for (i = 0; i < chan->num_ext_scan_type; i++) {
> > +             scale = mul_u32_u32(RZT2H_ADC_VREF_mV, NANO) >>
>
> Similar Q.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
