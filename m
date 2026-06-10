Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259143EA955
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102084; cv=pass; b=jWPktC7gqP4YTiOndQoUecXG4w65UwW+E7pjKFCZRG9NphW9ZAmrVOr+/uA+XBguIl7SUgAZMyW0Jq5C3UqWflBjR5sJwFHkvl+sB9VFJNNdVls0Pt0FpsisTh+3UO4hfIbv/ZhDg03V8Vg94DRaGV38NB/t9WdAl71MWtzNIXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102084; c=relaxed/simple;
	bh=eHGHo1CpzP+Lhry2jDKXXEgAfPF4V1nf1rNJycM0IZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQcJPiWlvJsHgD56Tfm+G/9Yc+chUQpT4v2Zf2ZrBSfXL68dlplqGmRB9TKJ0wqzUOwO5ycX1M6g6zyB8mcoMuK/HabXfgMzqGY1b7u07dv1m0Qm3bMYz48sj03mY3uEndjESgBp7g6leQU3P9Ff3tAxNALKlsW168lJmi3eAxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEDQcYYX; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEDQcYYX"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30749947917so2890456eec.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102077; cv=none;
        d=google.com; s=arc-20240605;
        b=ZeLlfhCeUGm80RJZ/AyBZvVWTyDrr+VWpLjSDbeJW4UsNrEm9KQpjpqGOOVAJ2Kj3d
         G2QumRsMdafm2W+jVE2Z+PSLyl1h2QsQe7r8KAfS/Y1o6YZtzA4h53cDHbrX4xeYpUtA
         WJR6/EpvUby1CIHuQSeeZOeV2c2dVLg/MIXVTCObE9xAEW1QQRTMqM2+fk20pqOcyKgm
         /vB55pkLMz0ij/ZSEfmLkQkV/+/KVLvYNorqcLq+zZrEwqzJ9tSRyVX0C+3/ClaPTI+d
         vFYhw84FFM80MkNepLwfpXHh/SS9svxq1R9QfPmuRcSdcHtpcWJHB7tdGyQOnrg6umZh
         NigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4QsNr9+C2sksb8f9hiRst13xYKm9uscJWoJD0+yoDM=;
        fh=ez/4GL2yrbfRCfLo4utUOvvYlp3/v6NYcTQ525pUVC8=;
        b=kgbBCCJyntvFMHuIPB4WAMQhMk2TokJ6iXx9MDarptUpZXTR0fKxGANKeQfxMW9lzH
         mEda8MYnmYFHIh85d/jwiTcnzYJF/lT+lhofY2KgjN+97iAHowTwdwkGEP7rW14kxqZL
         3gK0t1dK/BJyWUHYyFlts+3T5eMvWUXyAcE4M1Np/ndR2tV7xxptLdpVL0VXeyt6og8v
         zWKzr39y6iCnlfEMlAOnNKfoyLJryritWVZa/DlTcwCS7xAeuBxaX1dpciebn24x4Ub5
         Rlv2iWrPV/8tN2zYrBpCBGnkenT8GMA2qbVBKCXJu5Wif39BZgsN2jXP2cHq/H6ddWtf
         naVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102077; x=1781706877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4QsNr9+C2sksb8f9hiRst13xYKm9uscJWoJD0+yoDM=;
        b=GEDQcYYXmyqDTIeTwRUeJGjkgrgVo4QvCPnJpFto2PCMedbmf6U86eQL8mQzXpK7KB
         VIcIsjPFjnPZtqjm+frmahsCAFcV/Tpc/oitHdYuiF0Ffi+0cRZmuqrXDUcf+G6s9TGC
         /bzSIVTtAwpbDrFirH3japNOGBYg3M1htuK759cGRP60+yjTFW5fLes48bA0LLAa+XcY
         4kzfilYX1T+jE4SR2K1U8f2SUC6TvKPwYZBok08tpVVWloEVr2vFsnhxHQ40EbNbde1m
         atKqXT/ycgTAmLOV5EyI56oWW2pd/Ulhw2vv2HgWj1rkJdpLctB+8zAWCHnjTUXQUrzg
         0Uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102077; x=1781706877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y4QsNr9+C2sksb8f9hiRst13xYKm9uscJWoJD0+yoDM=;
        b=WYa3amAFxdlOzEgD95VpZCSVjFjb+wz8SCKF3wxws81mc8xAoMFfZa/rIgSgYaj3hb
         lUQeOCwtZOyZo2GI1DExzYBrkOFfgmOriW4/A9ObbwBLhM1Xf5yu1P/EDRTMgAircEyW
         Oq6MIxkTjpOzWeT1BKuCHZfM73AuMqSp40TuWPJN6kLb6HuZoO6rL7ZtQV3XhJX7D6oW
         XOigOz7We1cNkONVxos3NHisb9Ij089WAKMYhbaObKO8uN3uKujbMSr+P4kutzKxzmWl
         Pvim4N2c2bigqeacT4vHPNhfKAKbK8Ff+apQfq2ZzeQcckRkO/m7VzM4czCNB+8jkOEs
         ygzw==
X-Forwarded-Encrypted: i=1; AFNElJ8i6faOxcmJieO7srMatjp7+NMl29KD+MdK1jIUeVApvVOb1ya4F8tyj6hvPkz6v8/AIgvIcriLFTUY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1pWAtBc/nO6JVkJtuVI048U6dvMMBTe4phM+zRHsOiUV0s8jw
	gEWSLFoATrVg36iugVjElG84GCygiDw4qSrkNqorMH0W9qo4KXoIsiJyFO3NFJZ9QbABpdxhdiG
	jYXs2hcPoh5i/uDyxjItRSs3qsxODswA=
X-Gm-Gg: Acq92OEuuZfSyzgxw4C7Bu18qSLSx0HArNG4yRWP7Ywj0h6KCUEeFw9FA058yfA5ilf
	fkIPOTI3MDncdJ7gnhpiv+ADUwkHTuB33cI2qf1aSRD5CgRu1wgIP8VJ4/ZEfGL3Ghj6XdKTA/A
	I7J3SHh64l8HDWpUhydcFyTj7V5sAaz5Cte1Rf6PCVzjtxXJbYnonVR0F2Azpil/U16pp7UxswX
	pyJ0k37PGdVG7L2ZOSH2kahXlt63I0Pnq9KsjQcNHs0w61bDgYA9JPEmY9yLppPLoHD7+zbJ6Z9
	TN2mK3jmFqKC1ni3v34=
X-Received: by 2002:a05:7300:4311:b0:304:d32e:65f5 with SMTP id
 5a478bee46e88-3077b7d84c8mr15465647eec.26.1781102076873; Wed, 10 Jun 2026
 07:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-5-clamor95@gmail.com>
 <aihkNekrgfu6-6Q_@ashevche-desk.local>
In-Reply-To: <aihkNekrgfu6-6Q_@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:34:25 +0300
X-Gm-Features: AVVi8CdXjWV2Xn6oo1ydHrhUl2T2tO1QvChE8BglKpS9ooBB10CdbUEM-do5fqk
Message-ID: <CAPVz0n2WG=35W7Z8USDck+xQ4sQSxkfhJR9oeYGe_vBkkXGKFg@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] mfd: lm3533: Pass only regmap and light sensor
 presence to child devices
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

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:06=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:28AM +0300, Svyatoslav Ryhel wrote:
> > Instead of passing the entire lm3533 core data structure, only pass the
> > regmap and the light sensor presence flag to child devices.
>
> ...
>
> >  struct lm3533_als {
> > -     struct lm3533 *lm3533;
> > +     struct regmap *regmap;
> >       struct platform_device *pdev;
>
> And this pdev is probably not needed. But I haven't checked the whole lot=
 of
> the patches yet.
>

It is needed since it holds childs pdev (dev would be better, but not
in this patchset), you cannot get childs dev from regmap since regmap
holds cores dev.

> >       unsigned long flags;
>
> ...
>
> >  struct lm3533_ctrlbank {
> > -     struct lm3533 *lm3533;
> > +     struct regmap *regmap;
> >       struct device *dev;
>
> Ditto.
>

Same here, dev holds either LEDs dev or backlight dev.

> >       int id;
> >  };
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
