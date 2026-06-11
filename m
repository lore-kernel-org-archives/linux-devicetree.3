Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FF43F54B7
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181238; cv=pass; b=IZ5jctUOqiONmtvi9I4cLe2ynweLhrkzHCDvOtzrx6YyLrVUJSMYY3yTXHAStvRsf7Z8Y7QGnt9P6A+DY6Tv0mB9ZV9nqOGMCBicIbhxJFpJQj5MRClTZeG5o5tmjuwZX/gvOVfeFHzUs+gh67UXQsg64gYavPj3t26pLiZOknw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181238; c=relaxed/simple;
	bh=L22iIiqclocvOudTWkPISdls3zO04nkf5zEFM94Gfhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPdXLit3Z8RcXNBY+wKxmHeV4L2Bob6MR7z0DpN98JmIaDy9379J6uS2L2NDMBlRId/Ng6avEjsQ3sDBQsIN1WbGjv8k6NszUYWUQOGB0jtZmPddv2Jy4hDcHsFrCEcHgPVdCo0crpq/e13uzUxLtvMNhQ9CI9TMsrwDVmQY5HE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDu0fAqG; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDu0fAqG"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30759632453so2996561eec.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781181237; cv=none;
        d=google.com; s=arc-20240605;
        b=dWbFiVXpnAtjEDyAtESUVHQpmH7ZNVr6S6W9QVHdCiibz2QdQ33cIVfcgEdvhErH8S
         yNBu9z/+BiHSxZD7hi2yHw6JghUXRaYNtIGB09NXnEyuTGV2jHJ3EawqvS/AX+1SMmjI
         JXCwz8aAUS397dhFIVuUM+lefREf82M1jQVutt9cxEeo3AzUP9m8GHarhLtOqKFUINOr
         Ny8eR+ixtvKwUy4sOOEsOyshi+3BRm5x8FB/BoRbU27HjzUzJ2Qe9V507H2sKkIxzw5d
         HZyTH0QXPyKU8+BCRMjIny9a/3wZ3NVeItPn8eAy2lY8YrkQltoFjsxf/xQsIsT5dN2O
         5U6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ofA25PebqL4AsSYn/VWzRODqpKmh1tVfH1mE+QYxUbM=;
        fh=ZL1+NcbFYk0TCWCbwjBUUgodAKsqy/0CCiQcWd49Fp0=;
        b=ScQ3nnPfKC7LLGZpJh7owKjExAMA8uhLuE7QxLkuWLRUjDIfr1/VNhUSwtl+GtZR3n
         AixX+OEU0BM2Nsp1/NF9gigICzTQrTKYvOWCG29WDw0m7jemDmliGRIGvtxh254IudLv
         dca4FehDmh8TkyyceG8R4TzUQPyX1IOkoHOBpWcw8Xu0FBmpUvxrVT7HtaubjAH7AH3O
         0axMgXsYppMCTPen6ORAxy+s/3PtlQk2WoSEM3qU0teHcxDoLEAxqPahdPm258ttVln9
         moFhRqPG6T7l+0u62SWz9S/7v7UFy6fygJbfrQZT8dXzPpAlnZGID7eY0+WVqh1hiQ/i
         zRlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781181237; x=1781786037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofA25PebqL4AsSYn/VWzRODqpKmh1tVfH1mE+QYxUbM=;
        b=oDu0fAqGLc15HSViIqhHK3eGlstvY2ZUf7YvgQkx7b/q6iRWhSuUKkQCbTtle2QEZi
         PXF8UWXM1NossznlpNcC818lenPYJ/hop38uSGIfgqwgaz2nVZV4S/9MSY0bJjZDIfAx
         tqh9VLntTjcB/P3hgofxBOU1pTZxzmKlmPO8FTy6hu5Ag5QjfvN4gvMgwMR4Y+hxQgR3
         I15fpSg1BXU23WScjg3GstcfCVDmQDhTuR58SAuKtbgpwXx8hq2sA8IUaMHZcxL/d7Ul
         xUqYDvf6oRzMk6+F6MXcV10HGBz/0XmAYOLULZoC9i9Klcu6iQqBv+38kw5sx1bDT0FT
         0LLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781181237; x=1781786037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ofA25PebqL4AsSYn/VWzRODqpKmh1tVfH1mE+QYxUbM=;
        b=r5CmLE6cXFwnWrOckhPopvaLND5cF+uDaPoWGZKxQa8Fskz9UldDeT8PLJLIGdIypG
         Sq+sBg2CqSy8uDJ9V4oLt4x+aX5qqOU0aUrfPw4ljMOtnGq88l0uAiLqC0I7qjf5r/BV
         EY5k6PM6YXsu/fW3OLRCicoLeoRYFT9m0zu5e1XA61LR6yvjfvAOD4L1gN1O2Gc7lhzq
         KfIQGCOPgOvxm6vx4sXOA8vofO0r6OaYZfW+KxSAkXxNbFfHuSIbENx6EmBRoDChmPN9
         zSDAWl3BmRIHxB5y0FdWdBcoJgetSOGsZvYda59zi2NxUmvhbrqCDo8RIdQvNBGiCZ/p
         h5jg==
X-Forwarded-Encrypted: i=1; AFNElJ+xmXQ86yry2tCLQbQE+jky6oXFVwcKEK3MM+H3Va3BEBz2xumXI6/hfrUp5b+weLxtbo8kRW5Y5p87@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy3BNNrDIUBHNyjCnY5Tl7pUA1X73nPmLOfUcko95XdUASbdyV
	K9wg7hc/XUbFxhEPOLUySU9+qyrvh2sg0K6AGEj/E4X/hBpw8O/axZwXdO1ebRwQJ/mDuRAoLMz
	hOq/8N+knBM8LOP7spwUqWmU8mufrnfk=
X-Gm-Gg: Acq92OFgX77OuqsB5LXMa3jkNf/qFyQfiw8/YAeC2nbh6KeKDoWAOYAwtY+LU896wJN
	DCSMp1B4lMzZcIHgEY3iWL4TjVjjcYASQIFx+h+7CcNTWzXVVcNRc9v7mmSw9xHwKmbhHYFfo1t
	EupxxEJONuwNK4c95aL+jnOfqvEHquhWI9ndqsTexmJezV4Ws5vcp0RER+L7Y7Bxdx2PZ8XhQOP
	shEUoqrYLS1H2zwTJqL2b6ICC6m1FhoXYjLB0/LLELEcNM9vslQbQSroTLmcDMCY1eGOGgQcjjS
	Jb9qzjROLEBCSFU9oTA=
X-Received: by 2002:a05:7300:6da6:b0:2d1:d434:cfe3 with SMTP id
 5a478bee46e88-3080411cef8mr2308986eec.0.1781181236808; Thu, 11 Jun 2026
 05:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-15-clamor95@gmail.com>
 <aihoH9Pmzufa9pnE@ashevche-desk.local> <CAPVz0n0m+i7wexfC0BWwvdOuJxDk_=x+EpxEbNmoHN1AsEmfNg@mail.gmail.com>
 <aimy3BxBaXQ3Uigd@ashevche-desk.local>
In-Reply-To: <aimy3BxBaXQ3Uigd@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 11 Jun 2026 15:33:42 +0300
X-Gm-Features: AVVi8CeX4OO_pI5sFq7qWhCQuBWbqnNi5DWXxYDyaE3k8yybACe4K7ODLE9J31I
Message-ID: <CAPVz0n0bpo6PAfdN+LGEgPYhEx8mqtu_SL=WnDxhWn-Cq4rQKA@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] video: leds: backlight: lm3533: Support getting
 LED sources from DT
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 10 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 21:5=
4 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 10, 2026 at 05:45:28PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 2=
2:23 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > On Sat, Jun 06, 2026 at 07:57:38AM +0300, Svyatoslav Ryhel wrote:
> > > > Add Control Bank to HVLED/LVLED muxing support based on the led-sou=
rces
> > > > defined in the device tree.
>
> ...
>
> > > > +     int ret, i;
> > >
> > > No need to add 'i'.
> >
> > This is personal preference as well. There is no strict rule that
> > iteration variable must be defined strictly in the for loop.
>
> This is a preference by Linus who is the leader of the project.
> Also in IIO we have some set of maintainer preferences.
>

Well, this is not meant for IIO, though it seems that Lee is also in
favor if this approach.

> > > > +             for (i =3D 0; i < led->num_leds; i++) {
> > >
> > >                 for (unsigned int i =3D 0; i < led->num_leds; i++) {
> > >
> > > > +                     if (led->leds[i] >=3D LM3533_LVCTRLBANK_MAX)
> > > > +                             continue;
> > > > +
> > > > +                     output_cfg_shift =3D led->leds[i] * 2;
> > > > +                     output_cfg_val |=3D led->id << output_cfg_shi=
ft;
> > > > +                     output_cfg_mask |=3D OUTPUT_LVLED_MASK << out=
put_cfg_shift;
> > > > +             }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
