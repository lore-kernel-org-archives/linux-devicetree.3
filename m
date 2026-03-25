Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358FF1C3BEB
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774404034; cv=pass; b=PslRjJn8RqErvXptt3NMYmndXN/Fznal8GNW4hDK/SPLALjdFrlJgN6ujzUrTgHvIGPLDHY+hrge841c/Q0wqfRC0w1D9JZluSRzYZWIzj6GpVdehdfMVFEvYVu5jcbjPR3H5kra0sOYTQCoMOy8tYrwr3dwlm2TVXSp82tsoh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774404034; c=relaxed/simple;
	bh=QY+rzemyPmh6LMA8O66BXTsOH7YdfHPmzTbktSy7Zbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNjQtXHSPhQBgJ6Tv+EQh4Qw2nUR1t4cfhk4OnNJgOTFrqNxd2JP42aJ4tt+SefpvAcibvArYPtZsPQP2CzPWt/zOYw6kyoHhz5JYd2nCR2ntwbRtlCYEsn5rmG+dSYiIOGVRIaEHd7g5dQd2o7gcQ38UT0h3dGCgtZy/ddRzgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPCAnbWy; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPCAnbWy"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso1908889e0c.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 19:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774404032; cv=none;
        d=google.com; s=arc-20240605;
        b=TP+uHRr8tKH9jYVZZ211N/SGOGiRLzUsyP0us+82qhwoDc7JynOJT3DVycbUL8L20A
         yks6bo0V0H51mkQBkE+lR6FUfMolWMvDskPKfJN6JrCwu9YNn2qdK/6KbtEkr0xLRa2q
         AstTVMyf3hdz77IiW+ZVOZk2jJGT0C+8dMjvQ+Y8l3Qusz7P/neS17pq5EMVmc4rIfrw
         nO1AFLqkPPQ+o46Q3cTRPlbqCU0k2EHtmbJ8fI+cVlKWeztUGYuv2cmE/2nzt9svCnHw
         hOXHTonnxfqfqC9CJjnRRiEGOIHFjCGhTkJk7NU3m4qklAlBbDJFo0Fm/hfaPNEJkcZi
         rlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WPFE6/dRCTDV9VmECkpI6GoCeCw4eygyemSJ43rKzrU=;
        fh=+Cja57e+EA2tjC5BSHD0OyENJtZbfAKizZn95XFkN/Y=;
        b=CCI87qDRC2Ar7aJh1lOgNSy5ykltZBj4ivQnsXt/g4/KXhevdUz3tB4o++0NxX2a0r
         tyl1VTqq+/jK5lo4XbccXCz/2HAOXZTP/WbzxcMLAirIj2RkBgXlk3Rb+MutUfGMsS7f
         aTZNDBfEn+16jGo0Er1OmqI5/0yseYB04Ez/EupacVOj0w9JAdtuNCig0dzELUW/Amn7
         U4l/kMO0v+PEuTYGVzEEbNmdwjTEEZLy8tMB4cpMc7tvYH9SwXcpyzD3MEkeGavnb+46
         NN0fxL3nH89DiGWykJOTOLzFj8AFhm3hmFeD7c/Iehz9cQriiH6VSMN4K2eHyxdPZ+sy
         Q3FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774404032; x=1775008832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPFE6/dRCTDV9VmECkpI6GoCeCw4eygyemSJ43rKzrU=;
        b=YPCAnbWyi1p6j268ZpLzQ6coXdv4j/5TM3FOOcRUFjhzrLX6WntRcBxsLv9nLmJtDh
         MBPlNXbXlupMg+KkDuf61behGWZBvzoYr8v3yrjTfRDv1ZWkfefpK9XcYfuhFJcJQYyD
         IuOPGG/X9iV8K1EGBi4PuKwRbeRkxMSpNkpCQ6BQnzhEk1cjjxCWYfLOOmL1xLtXTtGf
         5lypcEleWbFXVkOCKL/PZmXknFLkdUJ4o7GSb0A4n/NxSJoQZZFp5/vMwqeYmT1ed4bu
         gQe9tuK8JpgO9fE2r24LjDR/YlTZMIUOH3rZWvBss1oFGSJsfAJ0o/ZiaFh58+Ff5bbA
         YcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774404032; x=1775008832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WPFE6/dRCTDV9VmECkpI6GoCeCw4eygyemSJ43rKzrU=;
        b=AS0eN3leDWGnvLWMj0yjbNpIScqUm87isdpXFdkSGyl5fFpepH11XHcKWGcb1cYMRR
         AOK/1O90A7XLjz7xuGWuKT4LlORRQI4PVSb+8UvL6ztlG3lrK6ACJnz8lY2i3SVDkV7j
         J88eae8CSJs+H6Ic7tjjUksRvD3BGEIYW6dD2lOj9APEf0U/KmJ7oBlN1mRNB0y2sRup
         dJImwS31DvV+mv2kI9IQsHQxwjGj7lNoTIq58MhwLPrUa7zi5byBOy8kDnPfTpTrgcVY
         SYpFMfXkBOUfSujWn5ynFX7dFoGm+YRIMhP5V7xSv94v/PoXwd2CqmqFLCjMTQT97A8O
         M8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWhhgi/HjcJqodqHNJC++jdCNrtrv+/orxpSPaW4FHDBLfgbb4H91LC0C5XEql+oEJVOwuB3VVrUG7A@vger.kernel.org
X-Gm-Message-State: AOJu0YwP+ezTIHF2UyavMe1iahkP52qoRN3ejLCgOl3Fz0FfuD6Kp+uu
	l7igoS8omSZaVSN4KtbCTdcsH5dDAmd08DmVzqAh6Ujn52i0FQvCtNiVb7XZt8vmHF0qAmG7mMP
	rqkviMgP218x7b2kD7m7T6FBoPN8bCJw=
X-Gm-Gg: ATEYQzxl8vwnS0rAXPAEchGd/HYfhwOYQT8yEt2LNL+nTftOp8x9EoBGbdZoad/s2AV
	v4Y/dsOF27BK7ImTYKUqtzYufRxSwTiCulWVxVJScNjMzRKHySCK7Eg/LOF0Ri1ZqGjNRxptCK2
	T4wg/N7EfJ3p2xm07JfBGRC6LO0KBtu37pEPyCHVvcl8WkzCybpPavFVCCUcLxRhltHOgQTBohl
	jah0CpdPUC6QNb7AIGGPV5xONzf+Jgi3scG5Mw0VtczQox1XxY7L7NBXe9aL8DwMnM8gsZlbD7s
	3poRdZoPuX73Vt44ut4=
X-Received: by 2002:a05:6122:6d19:b0:56a:f542:78f9 with SMTP id
 71dfb90a1353d-56d21f881admr974081e0c.7.1774404032136; Tue, 24 Mar 2026
 19:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-add_ltc2305_driver-v4-0-bc350d347f33@gmail.com>
 <20260311-add_ltc2305_driver-v4-2-bc350d347f33@gmail.com> <abEVfIKYZSl-AnL8@ashevche-desk.local>
In-Reply-To: <abEVfIKYZSl-AnL8@ashevche-desk.local>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 25 Mar 2026 10:00:37 +0800
X-Gm-Features: AQROBzB4Hue480mzEh1l6BixpPONpXCggyki0VftwNNteXbgZ6LJaNJjvXxrPuM
Message-ID: <CAF7HswPunWXkfW+Qp+FS7GDyPgd86LJivGVsHTWwnKRzHCrsYA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] iio: adc: ltc2309: add support for ltc2305
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Beguin <liambeguin@gmail.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 3:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Mar 11, 2026 at 09:43:02AM +0800, Kyle Hsieh wrote:
> > Add support for the 2-channel LTC2305 ADC in the existing LTC2309 drive=
r.
> > The LTC2305 and LTC2309 share similar features: both are 12-bit,
> > low-noise, low-power SAR ADCs with an I2C interface.
> > The main difference is the number of channels: LTC2305 has 2 channels,
> > while LTC2309 has 8 channels.
>
> ...
>
> >  /* Order matches expected channel address, See datasheet Table 1. */
>
> This comment now confusing, it should be kept at the initial enum, but th=
e
> better idea is...
>
> > +enum ltc2305_channels {
> > +     LTC2305_CH0_CH1 =3D 0x0,
> > +     LTC2305_CH1_CH0 =3D 0x4,
> > +     LTC2305_CH0     =3D 0x8,
> > +     LTC2305_CH1     =3D 0xc,
> > +};
> > +
> >  enum ltc2309_channels {
> >       LTC2309_CH0_CH1 =3D 0,
> >       LTC2309_CH2_CH3,
>
> ...to assign proper values (in necessary order) explicitly and adjust com=
ment.
> Then add this patch on top.
>

Thanks for your suggestion.
It makes sense to have explicit values for both chips to avoid
confusion with array indices.
I will split this into a series in v5:
1. A preparation patch to refactor ltc2309_channels using explicit hex
values from the datasheet.
2. The patch to add ltc2305 support on top of that.

> >  }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best Regards,
Kyle Hsieh
