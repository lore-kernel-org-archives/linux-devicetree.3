Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589EC39A81C
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774266436; cv=pass; b=sLzHhQzoK0QYDu9l14gDmwpHg9nxq9lj2jxXb8w5dymT9jaSV2eLhdv32LaqaEL18fl87hFDL7dVv8y56Gk1koYdquprXR1BPoDduQoh7rJ4EKLgIkQ/oJaYfTvUB7u6D8H1JirJtC6AlrZ344tOpJ6D/v7qbm/POUj4Y2qtCAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774266436; c=relaxed/simple;
	bh=4nry2qzy5pcCzAM5woH+HOmFMTfIBTI3KVX7x2x4kfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNQkf/X3xVYmZCukaWew2Eb8YZa1LGZil/iqaNdO40gpIjCiKCIedbMviC8ppn7aZ+iRnOBzY3A+/4fCsN8QnE0ICU/mNnayAz9RG+tJ2TBPjaKqKAwC2mecX9l6k+O2kvS27+7YTpgApJOBuWk4PVRCyG8HdGl//4h4gIp4jN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkBD3ak5; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkBD3ak5"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9831ed36d4so392350566b.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 04:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774266434; cv=none;
        d=google.com; s=arc-20240605;
        b=SKt//hLcbmD/s4SpxJFgteb6+1DdamxHZrsDdUt6zUVvcubS0EYM5+d8Y0CTrrp2zf
         cFaIPxHekQvj9tG6rwcYWck2pOgqzY47AQNcqD/2rKZccQJXpQQp/4Y87BuYnOoEUQZG
         p9haSJGkjPshmMXl+nDPztyYVTEYRETVj3vLodBn4r1ksc+mE5xkrHkQKodLRV/HhjN8
         MoFhHgI8M/t48j+QAbwleCP5lBGNffRTfkCuDN0JsbIndKNXmfsZ/anmrEFjTrZmA31/
         ZZVps8SMzV6V5e2905SUVEsOI1QCRBnWko24mtgtvzEwdI+O0dQ+ySmjwgl5NZ4pTuPz
         m6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QUJUjulURT0vpMbu4RaHS8o5NCexbA+knxvjmiKjiF4=;
        fh=dUPxNXvw7utnSR9I8Y6Lywnki9XXxfg8JWEaeCh1UBE=;
        b=CJcb4qen3RtqQ9aqwgceSQ/RrBw7cil28t6Xpu041Mm24HR1xQ/tgvEleOnqNUDQUY
         72NG2GWnaK1tNdqf6+iCirnH6d3ri28yzr45Ho5aOPSYJOYzqAW0yUva/s1TiyogwrhK
         vzsE7h+v1fGcelfuM6aXJjIreE7vM1D3z+3Ao6jMZAIjbpPOXGlclUYWKTDbHCuE1G7L
         Hf/WlCET1kIqVvDPNVVVT/+Y/f9cnEuPdqgfb2I7HMJ89ULXVoynHzu8sHqO1yzkN+ZP
         C893vULWkx1B2QPrenjZn17sjbibGzkhA5VpZHQK9wgCrF+1YuKkhctJ0HnyaJFkJ3uN
         ngLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774266434; x=1774871234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUJUjulURT0vpMbu4RaHS8o5NCexbA+knxvjmiKjiF4=;
        b=bkBD3ak5oAisJnsH4PpYJ8wjAViMT79GTt+9X8OvP8z+n9lgcVTMqEXpBZr32kxBRw
         NieMkROZNyZ5yzDIqEnKzVmXXUygFteakZMlsRTePnGnE0jjoHkPt1C2zRXBS9phJAoD
         B81qFffIggUjXlVPYm7ieba61/MfmV26R+2HxTkOxEMnDA0J+MHg0GoSKpJOKT2vwl16
         6OPxbpUqRoPE3Fo0kSyuMV+RaXNTVGvUxTbYquX2tEkpF9Q/JEukvMMOyxOBxPIPqyPm
         7tDzlqCoO1emYyYu5WgLz1SRDxG3j+1EX8txRF+EF3lQBDaKe4mk9yYOB+BIanWwenpm
         xVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774266434; x=1774871234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUJUjulURT0vpMbu4RaHS8o5NCexbA+knxvjmiKjiF4=;
        b=bwOCSTZnALZVDx3q2bNC2zDsQjb3Nc3mLw6WqJ/lOdKPAVCwYNlq7VjYW6RMiMx6mi
         Vm5Gnlgl/I9ykY0eqawxwSNEgnlfeJzZhtKZT2jONEUEKSd0mj7o4EJ7vY3RnBNAQxDL
         awZO98wWmmvvjMIAEOH3TkO04DAGZ68PN2GzI4FDRKHIa9U791BxqBCjmUgIMDZxnW7C
         fXtbCP0Pbum+jQdJilqVrYDvU/IQD2RtFYl99f2/LUfpERmfxW3po7xWkX7BVA9ot5fV
         rE8Hhkk2+FJgZdnlZHyqo68fJOD/K0l0T4kpsEgfh1AJZgcLsLABG6dliLmRVE/TeSdF
         8xDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcBw9wSM9tjKxmBZlAfquxEh8DeTv0p+oxQDJKKB7nG0GXOlOdTreFmkMK0Rh7/NtMxOPrS/ijcQ9M@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv55EdeHXeng/abA9Kc4Is4CdjcaaBCzolKyx5w+mn6ublkV1J
	9VP5Z27070q2GsQyZulMm067mreCiLgEyxzOQzgqL6GmKVGOepupqGl2aWBfoIrzevg0WzR0n9G
	JaF60dEUfrnqypeuVa7F+DxWBKzcB9UY=
X-Gm-Gg: ATEYQzwuudU9QKeqxXNiQjE1c+S12y3aYal94egKVhNixjWPyLTS/AkNMC13GqS5JEo
	/qp/wGY5G6IZo8KEBKLfe7wieGlenlj+Ms0wu8VT9R2Aw5YI7Voc5DCztMg0GZ3R+u+IJIs9hOJ
	VEMqcQCL5qbRagtRcPiuzwPF1XDstz7Ss0zWnqcMuckEuW1ZwmjwU9L5Qh1NWJ6cnopLCium09O
	RmbPEdADDG7guddAkBotrS2zgZaGsc5JrWa1PYIhyMotLz9MBruN+g523NZHv9TSsnTPpYO/+S2
	hafRb+Wi169Z5JPwlKSiD26SYaZ+N6jbJCH0bMRNnkx+iegfMrB2LQJq20RUtaH6Fdo1QcgzlGx
	rJ6JEN44=
X-Received: by 2002:a17:907:6b06:b0:b97:f050:d115 with SMTP id
 a640c23a62f3a-b982f0c310amr932278966b.9.1774266433441; Mon, 23 Mar 2026
 04:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323074505.3853353-1-sai.krishna.potthuri@amd.com>
 <20260323074505.3853353-4-sai.krishna.potthuri@amd.com> <acEbZ0O3HKrGx0u1@ashevche-desk.local>
 <8c8fa211-6244-43d3-9350-856301075e2b@amd.com>
In-Reply-To: <8c8fa211-6244-43d3-9350-856301075e2b@amd.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 23 Mar 2026 13:46:37 +0200
X-Gm-Features: AaiRm51igNpVP2kCtjt-uVTIXp5cT3pPNV4OvOgkKtoQyGTUIfXrJkbDCsd2ufI
Message-ID: <CAHp75VdcrfJn=VBnjJbA8QQnstaTay+39bumJiLt796fXsKmTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] iio: adc: xilinx-xadc: Add I2C interface support
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"saikrishna12468@gmail.com" <saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 1:32=E2=80=AFPM Sai Krishna Potthuri
<sai.krishna.potthuri@amd.com> wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Sent: Monday, March 23, 2026 4:22 PM
> > On Mon, Mar 23, 2026 at 01:15:04PM +0530, Sai Krishna Potthuri wrote:

...

> > >  int xadc_write_samplerate(struct xadc *xadc, int val)  {
> > > -   unsigned long clk_rate =3D xadc_get_dclk_rate(xadc);
> > > +   unsigned long clk_rate;
> > >     unsigned int div;
> > >
> > > +   if (!xadc->ops->get_dclk_rate)
> > > +           return -EOPNOTSUPP;
> >
> > > +   clk_rate =3D xadc_get_dclk_rate(xadc);
> > > +
> >
> > Unneeded blank line.
> >
> > Also, don't you asked for options?
> This callback is defined for all other platforms except I2C.
> Currently for I2c interface we are not supporting any configuration, it
> is used only to read the channels.

If the callback defined you should use its value and not hardcoded one, rig=
ht?

> > >     if (!clk_rate)
> > >             return -EINVAL;

--=20
With Best Regards,
Andy Shevchenko
