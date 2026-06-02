Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BBA3D5C12
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780396317; cv=pass; b=FL/989TPKcWnNLPhRkfcW+G+EbzeTYzUTnkSMoV69MvZok9HpwsQI2EgcsOsVCigAuIo4FoD2T3AfzjC1cDitFj0IZ2fZ7Uu09dbV9eHOr4RTyFtw15YcgX0SoZpR1dBh7guByym6uYatxnR54f17iYZd6GMtDDGSUPzvc9x+PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780396317; c=relaxed/simple;
	bh=FrPJKUKAeNpDp2O8s3b0xd97pGYPIKC59ry1jtVER0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTyFvXpxmKYTwwkTxTgi05igA5mvd09iFGIFHoBR+EUwhHQjWKYk/hQaxU2Y1Zsrnu3BNvLyTm0JeQ/BO/7JNC8eWwS1UowD3wwlFXoIg/xhS8UhqQF1RlxCRV9EcVFv8ix8SM9gjkDjqvnGT1R6ugj04dPU6ziRNk9dOHd4b30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgdcvLgs; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgdcvLgs"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-307263ad0cbso2140682eec.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780396315; cv=none;
        d=google.com; s=arc-20240605;
        b=Phajgbm2NSQBfBiAZuJ7xC/tDa4CXN310B/egKEn7YRPIdXrh4XN8hTzLZhxVWbxsG
         xtb4zxRAXMFLvwlmpsehtPGhemdLfmsxoNxjK2+iYkJ6gZaW81RFfzCGC4BUGGcwtgI3
         Z4L3rWM+Pa47rc8pzYMU+1JahkjTT5bW71uvfdQAKsx7zJBJNVqRA1X0/p1cfMbuPhmH
         qa75VDi3ulsnt2ACCbrSCTx5BLjgNrQ43rANdkjWxL1T5APXcBemvdf6Xef4AMBrprQk
         aNNyTKOgyAyYmTl7mH8/w4ZlPlkTbfhzZCU5a0fR8LQsoJCihd2By8tVzHPP5BopESa6
         xkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lDdI0YPykfuK0xhOe7sArc4RNqAa0Hyds1kbH01jcws=;
        fh=XxDiF7bfiWNQ0+Qy+fn8nqLfh2pAyd6znxKZGz7ZbAQ=;
        b=KZT8tMweyaViH7n4tbFYkr2AnDoqv6YK96xR995RRpoGzbA0/i9EY33TM63QXJUARW
         6fa1n5OaznanM4GJmkv3jvRLg73cCZeps/mh/uFnIXzYlyrURS03pQF0P7KiKKBT5MFQ
         60eF7IT6sOxE5Mal9GARmnzAeYO2nbjMU26923uBqnAQelsvpExqvO1c/Tr8bmK7M9+q
         /c6M4peG/4oSdaNz0pWVGeQQg9VQzHmESE1mENlFi5xkdSPpZHVGd0fTQi4mJdR3IEyO
         qsJSXzNmeVKLgyoCJ2b1SkSZwSB0L1HBgKCj8e621EnaxaPBtoNUfdZUxk1ioEM0nQ0B
         31sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780396315; x=1781001115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDdI0YPykfuK0xhOe7sArc4RNqAa0Hyds1kbH01jcws=;
        b=kgdcvLgsZ3uILaWfcIBvtHl1005DoEY8tGo67hlFEfjapWwGze3khJCdXZVrRKnA5h
         37CEtBPX6b8X0AaK1mntR77AtOfQ7CnhjfrTLJkgB7WDAz4Y/g/BYmJIegvqnORr9bq5
         n4OWtbMTtq/mjZcJIJcbF+jusrW4PmKgWNJhp8HOEGxYqPKN/UJEzHEriS9U5IkVSd/X
         a+n0v00qp7WOv4PuvEdollon2e7UV0qZEw4J8/TKa/gk16Yk+R6ZtCJeo0qvmGh4xIYN
         My3s/VQXDMREfLQ0j0hnhT0u5c0lkmltuEnWw+FvVO2NdGut68L28anjbQPSB74A/WSt
         icGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780396315; x=1781001115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lDdI0YPykfuK0xhOe7sArc4RNqAa0Hyds1kbH01jcws=;
        b=Hpav/GGQ6xNJ2wcu3WIqdqh18z7cpJPhJDoy4MVqRWcbpzquT5yGc7YL2KH27yYZgS
         xzunHJGV6jysINTP1xTYWfvaC6DY/+Vnes84a4vUgx8TPbd8U8TYJd1rU+MOV99R2VWY
         VQkqCIaNkSZ2BsqwlL0oIK082DK1WqRy5EgvcSGKZqCSjkdXOWmU2KgMnHv4dDXstGZj
         crSuwVAB4B7UFZZVMpDDLIBXnGxyvW7bVr2WAbWznr1iiLe4iKEt2I9FraHYE/xZS9aB
         AiH11p7gFCooxK8GiM6hwGBreABAQSRGxaKVoWAuTPKVXsIw3KbJAOH6DfzDnw++azAL
         uzjg==
X-Forwarded-Encrypted: i=1; AFNElJ9q9IuR6ABN0bS03T9UpUTezotMOx56we96uzgrCgwRGqthqUZPilfKnIlhaqnrimDrzeU8hIpzUges@vger.kernel.org
X-Gm-Message-State: AOJu0YxIyQwGWd7OyMVlic2UIdp5BPcDJ6eYiKVo9S/RpvGJDY4CAetI
	W/YM9E+hBxZ44TVAzgTlfEfo4TgTrWK9ns6cuKcvWud1jYB1ON6wmJY8KwXUhUncaYGWnZ4lOxG
	suAESLCuAolaf+N0Y8/CLaSzNracnvis=
X-Gm-Gg: Acq92OHsgi1atXcroRI4rvUS9SKJ14E7kZVG2sqCj64rC+MI+kCbYVoNy8QeGtQiOsc
	NrRRw4Qv2gKDM7R3XRTn0G814W8y264rj/iEPmgPdW4/1avbtpuCvEaQNCkJnkeG0bMiiL7ldgE
	s/dz9PqDBZFdQS1BUBruQulLuwRQXu54ATPQxIH8Iqu/XOAC5/LIQQf0b4lBzfWC44JiHm9ViBH
	H1iVWYFXVKQPsY7wJ2dIEMhZfGcq1SNsNHNaV9Pz6Ytw83U14P8RyXndj2XeNjCvd9Rn9tcMUyI
	lv3BwwyFPBM0wXv+6K7OY9SSkf+H+g==
X-Received: by 2002:a05:693c:2c86:b0:2c1:7793:7bbb with SMTP id
 5a478bee46e88-304fa64c553mr7093613eec.27.1780396315135; Tue, 02 Jun 2026
 03:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-6-clamor95@gmail.com>
 <ah6TGjRNnDpQGO60@ashevche-desk.local>
In-Reply-To: <ah6TGjRNnDpQGO60@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 13:31:44 +0300
X-Gm-Features: AVHnY4LWQiJbbknL3YlvePeYbIxJnooafI1v7YVQtfA6307ubpWpYRL37q4rijM
Message-ID: <CAPVz0n21RGAaJc1sda4xyp1h0z+6R6FJ4=XWdOtB1mgtV8=RUA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
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

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:24=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Jun 01, 2026 at 06:18:25PM +0300, Svyatoslav Ryhel wrote:
> > Since there are no users of this driver via platform data, remove the
> > platform data support and switch to using Device Tree bindings.
>
> ...
>
> > @@ -57,6 +60,9 @@ struct lm3533_als {
> >
> >       atomic_t zone;
> >       struct mutex thresh_mutex;
> > +
> > +     bool pwm_mode;
> > +     u32 r_select;
> >  };
>
> Have you run `pahole`? Does it agree with the layout you made here?
>

Noted.

> ...
>
> > -     als->irq =3D lm3533->irq;
> > +     als->irq =3D platform_get_irq_optional(pdev, 0);
>
> > +
>
> Redundant blank line.
>

Simplifies code perception, whatever.

> > +     if (als->irq =3D=3D -EPROBE_DEFER)
> > +             return -EPROBE_DEFER;
>
> What about other error codes when IRQ is found by can't be retrieved for =
some
> reasons? IIRC we check against ENXIO in similar cases
>

Then we treat it as no IRQ. Original implementation cares only if IRQ
is present or no.

>         als->irq =3D platform_get_irq_optional(pdev, 0);
>         if (als->irq =3D=3D -ENXIO)
>                 als->irq =3D 0;
>         if (als->irq < 0)
>                 return als->irq;
>
> ...
>
> > +     led->pwm =3D 0;
>
> Isn't it 0 by zalloc ?

It is, thanks.

>
> > +     device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->=
pwm);
>
> ...
>
> >  #define LM3533_BOOST_FREQ_MASK               0x01
> >  #define LM3533_BOOST_FREQ_SHIFT              0
> > +#define LM3533_BOOST_FREQ_MIN                500000
> > +#define LM3533_BOOST_FREQ_MAX                1000000
>
> HZ_PER_KHZ  (since you included units.h)?
>

500 * HZ_PER_KHZ
1000 * HZ_PER_KHZ

You meant this? Sure.

> ...
>
> > +     nchilds =3D device_get_child_node_count(dev);
> > +     if (!nchilds || nchilds > LM3533_CELLS_MAX) {
> > +             dev_err(dev, "num of child nodes is not supported\n");
> > +             return -ENODEV;
>
> Why not dev_err_probe() here and elsewhere? It looks inconsistent with th=
is
> patch.
>

I must have overlooked it, thanks. WDYM elsewhere, this is the only occuran=
ce.

> >       }
>
> ...
>
> > +     device_for_each_child_node_scoped(lm3533->dev, child) {
>
> > +             if (!fwnode_device_is_available(child))
> > +                     continue;
>
> Do we need this check?
>

This is nice to have if the node is disabled. If we assume that there
are no disabled nodes, I can remove it.

> ...
>
> > +                             dev_err(dev, "invalid LED node %s\n",
> > +                                     fwnode_get_name(child));
>
> %pfw
>

Noted.

> ...
>
> > +     ret =3D sysfs_create_group(&dev->kobj, &lm3533_attribute_group);
>
> No way. You should use .dev_groups.
>

I did not change how driver does this, just swapped lm3533->dev to
dev. I will set is back as it was.

> > +     if (ret) {
> > +             dev_err(dev, "failed to create sysfs attributes\n");
> >               goto err_unregister;
> >       }
>
> ...
>
> Can you think on how to split this change to smaller steps? I believe it'=
s
> possible.
>

No, I am done with tinkering with this patchset. It is broken enough
and it has inflated enough.

> --
> With Best Regards,
> Andy Shevchenko
>
>
