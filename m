Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34103D6CC4
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395554; cv=pass; b=K7jGHU0uIkltFilUVvcNfLgVHeoUO1i05tzEDjCcDd9IpW/CV6YHvKdeq2PoIEQDd9jPUC67bHQIAKfcwMjq3SCJQsr29QFINDaFs+Tbq1t0iFEtTP7+O+bcmB9EQWGsrcjzvdSH76xVc2cPTQOChrTxN5baGe672oF5EMJZETI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395554; c=relaxed/simple;
	bh=3B3t6ptcOYLW8i15s/yZOStzPGXLE8YErZRu0mWiPrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nIY6bPJlITMrxPoHBGStj3k0pInbEopzTF/G61dA0VRIQOcVJG7NG2UB5Hiwe2JOe5OxHCjN9W61t1vPrgrZakQ49C7ZnmSGvBhsn+pcxF6/a3PbUjLTm8qd+vWExRJKi7qr+/oEfPr4sR0sm3yUOtfVD3jQlyPslaseEXMlZ3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyUwTwsC; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyUwTwsC"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304d8e3bb72so7814556eec.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780395552; cv=none;
        d=google.com; s=arc-20240605;
        b=PpUqGDGVU5b7+JtALIndBtx89saxPDTp051CjanW01hGAKmaRBLT6vjrsACqMLLXHN
         LUp0BARvsWFJL3+S9XUc5EWPbjGafFodITdJ5mSolIzuNfe2k2ABjydYe2ECKPzTlRo0
         +dg6BS+bi287AxOWdNdbiGVuBValCSHElJ/9wJbn3fGmILzz5p0+g+iI2Lir5aEyZ3sK
         3Kolnl/v/qUPsYN9ZHdfnf7SGcI6i1EVBbEBB+xH1Gup4X+fk785LO3hJhOUB4bYUKlm
         U77UPpGeKK//hvP3S6Nm49hyLaQGZuI8120u4QPR874a/A5fJlhkd8tXz/thBLnbg0nQ
         6GWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Rz2DgaRr0tqOwLOIkcbJ3/5tQrroNwxRI/2HG/tAbU=;
        fh=t5WlViZbq8T9dEcVHLV05fkQRy0BND6ASq+inkrfDbI=;
        b=AK72MzoZ0dyc2JC+hfUG/jErPaKwiFlUScMmCDNSF7WGPEPck36gQfv5wNjuZBr6rb
         tNDw5CKm7TNgFbaQtXEeTPo7lFj4J9olJrCcdVyoQ3iVrFbiwkiH6lh19zm9NvtsEFOO
         y/mSkknv8T/3Sl+EaBNZBbHfuaFxnwDdowEU9U5VvnA8XLO7IJRUBa1hwQeIAuWJVWyo
         G2rC8889/tkZdJ0AQ2TzauzZ9iM22JhLyIybxx8GBQF48eXnl6cdaQ30RwawASqc2Beo
         h/cDlIKpF13Nh5xB6927iU/znwTIWNTwBwPAT5sf493zGim3bUVXOUr8RkqjCgrVjy4A
         XPZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395552; x=1781000352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Rz2DgaRr0tqOwLOIkcbJ3/5tQrroNwxRI/2HG/tAbU=;
        b=AyUwTwsCHthjP6xub1kYtxw/LI3RE35opRdOgCOuDfMit/QnFgIeUTShTZZIpe7lBF
         qRQWCXiVBDsalYrzAVptKLel2m0TfNtWh7rlB/0YfAa0JxZpFTBMXmCqjgmyp6XYUC2h
         QjJ6fthhtIhDtpCkrreEsYzND+1a/XPf++2mHd6EuNSDjeEjI7/TXRDIJKyO1emHRWQd
         zZIsyiRQ76oy+WEZjmkjDAgD1tRWUqjXZbd+Fs1Ujp7llqA6OFqX3OzWrDW1ZFoisIF0
         yd6l2WV2jaXKT5SEz13bXNf+ZxlWNte7M/NODRmIIqX/pt8TiBLOFbw5Wg3xJht71mBr
         S/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395552; x=1781000352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Rz2DgaRr0tqOwLOIkcbJ3/5tQrroNwxRI/2HG/tAbU=;
        b=Y89NltaprCscAZkHYUFaHTNGlMZ3mvmnIw10ruGsXHKZ96TdE+QaLS6DI9m1JgdSuC
         huIK5bGqmhAqKwIeU4WSvqwGXdCaITTtTFYbCsyYZB4/b2PEViNySTzcZaHWnf2P9jW1
         CB43SnuLglKO3IV+DM+tPGzPZulNU5XVfSytq3B4kuIDJ7k8u2iIewI13HIhy0xegMIo
         KKTlzFUbYBlNywNSF6R2OlhC0wYFTtk6Tmn7RwvQcbkWxp9GHLnMznKxwtxyP0CiScLR
         zjfb4wDpmU8b6lHVPhuUdjq/57FMn4rUlfPtyHHXbwTfRPn0Kgxcy02mkmhiPfl/H6qk
         nBqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zw6+ITxonh1yGr1WuWo7OjLNwBDA35Gf9DmBgRgqnTXHU4ZtKtWown/O5ZS2KMux3/4z44gviQR7t@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3XWgnV5QDvk/wOoiYLW4BRuhTEhXq4MJ2/l4sdS6MoeMxnXji
	FL6DLNfe4ANtv4nOxW5s7wdawfvxagnOZlN5Be0atBTx9EO67A1wxwsZXGDST3/g5sGNxx4ynZe
	qi0tIGZucd5D4hrWTBhinZzfrVoGrtrA=
X-Gm-Gg: Acq92OGak1+IVtK9f2SG2sMMM6uN8L7EuUPwrK5ET3B6siAXr4ONtXAV0AQ3QCKjBuE
	GdqqjJzh/GZNJHm/foUTfBCGFnsxl3flaCG7fqFkcwAIRnFG1tcwMIp1XJruGm8a3TcKvymirif
	vpgv66hhStlATgI0OzygLlheIKhDqbVmQQMpPO8/KavzrtIQ4P8dO39QyOn1/oOQ4P/RrXQBTK1
	1X2O0VcRaj6WNsIOEA2TL9M+LydlFened9pp9va70YfHRxNKgqKEZ0Wj6CfhBf7cdHFndeUNBrt
	9BphFYgtaUC711sDrMM=
X-Received: by 2002:a05:7300:6427:b0:2df:919f:ce59 with SMTP id
 5a478bee46e88-304fa67ee46mr6895369eec.19.1780395552116; Tue, 02 Jun 2026
 03:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-9-clamor95@gmail.com>
 <ah6PxFtoJUWkd79P@ashevche-desk.local>
In-Reply-To: <ah6PxFtoJUWkd79P@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 13:19:00 +0300
X-Gm-Features: AVHnY4KArfWMr0jnHoh9vtR5UqW4K7jQ3330Z8FTAYXvtwkDG99A7ncLjymdKC8
Message-ID: <CAPVz0n0P7Jk17cM2M1zuHZfySo2=Uibr5izwKU2tqiBpBcg0FQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] video: backlight: lm3533_bl: Improve linear
 sysfs logic
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

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:09=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Jun 01, 2026 at 06:18:28PM +0300, Svyatoslav Ryhel wrote:
> > Simplify the sysfs logic of the linear property by switching to a macro
> > and a ternary operator.
>
> ...
>
> >       if (kstrtoul(buf, 0, &linear))
> >               return -EINVAL;
>
> Besides _assign_bits() in the below, side note here to unshadow error cod=
es:
>
>         ret =3D kstrtoul(buf, 0, &linear);
>         if (ret)
>                 return ret;
>
> (obviously in a separate change).

Won't happen in this patches.

>
> ...
>
> >       ret =3D regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBAN=
K_AB_BCONF,
> > -                              mask, val);
> > +                              CTRLBANK_AB_BCONF_MODE(id),
> > +                              linear ? CTRLBANK_AB_BCONF_MODE(id) : 0)=
;
> >       if (ret)
> >               return ret;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
