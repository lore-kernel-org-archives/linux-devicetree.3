Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39513E3165
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407914; cv=pass; b=RB+a/B/nCCPavGgUmSKuGkApoTsT6eNqXd5pN54K9Ai+ysftOXN4NUkUZ84sQJdMzADxs6dLudAe5gV7vAiTUalikpt3HUyZVmvZLIW83Bvn0u2Z2NQGufmo6w1JxwNqjGImNB9dNyChOeCwuuI0xxlFTcP+6eUyDyp0ax/MQ6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407914; c=relaxed/simple;
	bh=mfRQt6zofjyY6ZTAQWLKGrBLLlNAa1/TidY6jbdB1k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EN7kn/r7AqPFTE0ziqAXnR8aO5/cOEaLgu14lTw4JesSggCg1lZRYfFVwRRREMJ9xStMrk/4CZVQhEp1GUH+gcaiIvcAth5m/52SSCKce4dwQiOzN0AmWDSIywu+uYcrZidj3GduKXriHtj3DqJ+UlKrvRn3aK3B90x2m6oBXHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e929EOfx; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e929EOfx"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304f0039c02so7956610eec.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 06:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780407912; cv=none;
        d=google.com; s=arc-20240605;
        b=h8DqA/yQ+jqP4SdVmAz+GVeqbCaKVIM2R9f89rVDfVrmo10YLRBFSp6JkJeAyBNRmi
         2o/Sjpgy6vWkAEjAWldUK+51fxhR1ppi7w78V/syiDL+tM7ha8b7uC5PvhaodJZ/z2+X
         fSi2n3JEWRabsrX0y4a2WzbNYLwbHWRux7Zq7o8GpCyqrIGqTZlSLRJlrvXSdUEMOsJ4
         1+S1YLoCPXYbZjI9Ht0EyI4VRcc17jNDKtc+bzpDJlC2hmOp+HlMqR2sCJVjZLQb1WoI
         ZoUnCiJsbD3LTFMl39JKmKud2hqXKG1WtD7q3lFBlTYHxAnaK+95optXWLH/X18nYRMd
         n2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zT4hcJaJAxpNku3U6+68TAPB6S0TflnId/dwWCFEDQY=;
        fh=+hW1lWl4sUUAFduR21xAOJ3rfYl1twHhrzrTFS4ynnY=;
        b=gP4fJxnRmhpyf+KQ486y18rV1O3/yjO+Tf0HuMugieB6Da+Ma6JYLKstPOOG3v8atU
         KcYE2AGpeJcgymhC0UN+94g3mHuQQXSlld+ci4yvmWGH1PPwJx1CRPduXaH2MFZLPjoP
         ghd9y3iyrPmi7BO61741akedRC+gUiQuV1U816qRKSo5rUi2PzI6mq4A/c7pqSItZIXA
         EYhJsUB6JmqP8I1merpUtLuus8maOcEGEaCevYtrVNnEhJ8UAHUnkH7asXrVzhYeHEXr
         g77t1xPRD2PRH58q8Ffj/o2W8WZaAqqp46S80UWuFThbG+pGy6j8M1QpmboutPDF+1mZ
         bL7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780407912; x=1781012712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zT4hcJaJAxpNku3U6+68TAPB6S0TflnId/dwWCFEDQY=;
        b=e929EOfxmFLsq4hUlkHzE+NE/58yILxGFpn3fOd1gvdeurK8o0AzwY8aRvFicbE+ke
         fZp7+dZqrWslwv6YzhIu7Wytt1eLhXz02mTz9XvnCYGLW7Df5QjXvgBbqfDsvDE+X4OY
         5gUD7yR4J6ikvTwaJxWeQ1oqTAIWWEzw4IvmokTpxi3XjVWsnUGYek583gN5FJieF0oH
         6zkQleJmtJAP091wg/euGBxNKHNGl3FvczfyNLOux+xJwCER0y6aaRzorubzp7iHuIjK
         wlnHb3d2gtsYVsc1pienT4XNF1eCN3rRiLFSQhH3Q3WvBk3oRFhgjjuWwKK5Z278Bu0M
         m37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780407912; x=1781012712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zT4hcJaJAxpNku3U6+68TAPB6S0TflnId/dwWCFEDQY=;
        b=musjylTYb4qwOF7U8V9tpYXS2aNZZmb9iLKmFNbAJErWj4aC7J+sVjrbmjLO1YDq51
         RIhzrSl/mkjZOmT0T13BMGDG+AV/R5UnEJk2WGE5iBJwRI/myyQiMlTBzsUr8ti4MUsP
         GKjjbf1IlnzJ51mrf28q3dNNGtuk90X9eb9X2R27zTA5Z1DP/kYXX/y0Y80lfwha1vAE
         M5pkVJoeYRO7LgSwS4WbHwWJFdBpLQlaYOzPUsyQKkKTc+Bqa4dPAMeezLz8HFiORYB/
         xK7cdhTVnWCnNuWgrvw4+p5plMeXDgnGiGxXuS25KdrVK5gv/5ExW0zc64qq9Yyv+uck
         FKhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8A4LqyExAmzvdlM2vjcWm/zpC8rTiZexWpoNF1XsX80NRW7Dl1w7GirVHtCZEblojiqCaldovH0q2a@vger.kernel.org
X-Gm-Message-State: AOJu0YwpV3PnIZLpCpTscnRT3rhjwA4Z+Uoh6Npr+dbiwXXzc+UH37ut
	VpGzjqky3SYoVrhqgs3LLuYyw+e45FNByYzhll1M9qms1/Aie4ZupF3HqcvCJJ3ydo9AcFEg1PQ
	w0CmS2j5U4Lltb8DhSA/07c4XY0FUpLc=
X-Gm-Gg: Acq92OFrY2OGnHeH/U4eikWN0OF87fLrMxjaTDe9uaftka2dBPfafxyN7JjX89o/TH+
	ZRFjC/pvFNLELlsJmTiSyjLbQ/5Q/KXUUzCkQoVaCr8LyjSNWkfFEavmFGXe0u4QR0h74qSoO93
	1ftmCr7hzr1E9S5zf0SjEs0TLyXeH2dmSRgoyihdFn6W2NRnc1seFRQZBFXo1O18OxaIJ8nX8Uo
	yw5sBwacNOhUI3iWOIWRGErdSafOKDvWBVXwvNWYbM7wLhUzV8veNpSkBE5kcE692MaTRjYv6vK
	9BXMLDsrOsyR/lYJ8rg=
X-Received: by 2002:a05:7300:724d:b0:304:8366:7456 with SMTP id
 5a478bee46e88-304fa4a97f7mr7197710eec.3.1780407912080; Tue, 02 Jun 2026
 06:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-4-clamor95@gmail.com>
 <20260602144222.7a50a041@jic23-huawei>
In-Reply-To: <20260602144222.7a50a041@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 16:45:00 +0300
X-Gm-Features: AVHnY4LTNpiSYmDW8xnqHecCTvTzpdUFD5jDfC_0pqaKrNHhEcy0XqCOTlsLpZ4
Message-ID: <CAPVz0n3x7KaaoZQAmpX-NCz2QNrhWNQaYFvX3pwS8DLb56bFuA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] iio: light: lm3533-als: Remove redundant pdata helpers
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 16:42=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon,  1 Jun 2026 18:18:23 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The lm3533_als_set_input_mode and lm3533_als_set_resistor functions are
> > used only in lm3533_als_setup. Incorporate their code into
> > lm3533_als_setup directly to simplify driver readability.
> Minor stuff inline.
>
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/iio/light/lm3533-als.c | 61 +++++++++-------------------------
> >  1 file changed, 16 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-=
als.c
> > index fb61904f110f..52136ca1abc9 100644
> > --- a/drivers/iio/light/lm3533-als.c
> > +++ b/drivers/iio/light/lm3533-als.c
>
> >  static int lm3533_als_setup(struct lm3533_als *als,
> >                           const struct lm3533_als_platform_data *pdata)
> >  {
> > +     struct device *dev =3D &als->pdev->dev;
> >       int ret;
> >
> > -     ret =3D lm3533_als_set_input_mode(als, pdata->pwm_mode);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CO=
NF,
>
> Maybe a local struct regmap pointer given dereferenced in a couple of pla=
ces.
>

sure, why not

> > +                              LM3533_ALS_INPUT_MODE_MASK,
> > +                              pdata->pwm_mode ? LM3533_ALS_INPUT_MODE_=
MASK : 0);
>
> Andy raised this in previous patch but in the interests of being specific
> regmap_assign_bits() is going to be cleaner here.
>

I am currently adjusting accordingly.

> >       if (ret)
> > -             return ret;
> > +             return dev_err_probe(dev, ret, "failed to set input mode =
%d\n",
> > +                                  pdata->pwm_mode);
> > +
> >
> >       /* ALS input is always high impedance in PWM-mode. */
> >       if (!pdata->pwm_mode) {
> > -             ret =3D lm3533_als_set_resistor(als, pdata->r_select);
> > +             if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> > +                 pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
> > +                     dev_err(&als->pdev->dev, "invalid resistor value\=
n");
> > +                     return -EINVAL;
> > +             }
> > +
> > +             ret =3D regmap_write(als->lm3533->regmap, LM3533_REG_ALS_=
RESISTOR_SELECT,
> > +                                pdata->r_select);
> >               if (ret)
> > -                     return ret;
> > +                     return dev_err_probe(dev, ret, "failed to set res=
istor\n");
> >       }
> >
> >       return 0;
>
