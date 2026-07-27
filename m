Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CBE3E1CE4
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140558; cv=pass; b=jmOUdna8shIgq/XFwu+8s2HHwJIYjZOWPd9Xl929aFQAHafS6RsThDUUWyQY55SYJo6WU8yYMR3kGAygdqpMeiAcFdjvfeZl/+RRxrbgPnX46QUevGCFIjs51pbjKXTEAvP2z9jfe3XoV2cREQ5D7T6uX/uXILmQ0J8MwGQiZo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140558; c=relaxed/simple;
	bh=mw92Hf/dQnuOO4mzXGCnNoSoSNZ4XLCDu5vbV5GvF2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugpKP0s572zWezfrqjGojQuPgyLAQXPJqareufOdRMdlLHjTbqGaL+MkYypyBVjRrO2lTuuxPGrJVps9Ucxym8rct4AY3GMGbbhwKTS0dvO7IfOc4E66CZw6m2upg0CTIadNSraZ8cLoAh9rXsqCqbrD0UD4nu5p4lfH22eDIes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WACiFu7z; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WACiFu7z"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1747291a12.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785140556; cv=none;
        d=google.com; s=arc-20260327;
        b=Xf7E90aXCx0xAPbRhbq6j2bDT9c3I5m3xW4TnYpS1BwkGRGlXuN1u/nlmn4mauurf9
         STIr47ewLpjGs6UZnH8mkhabNUAoJzVhd4k1lXoAVlXS95H5WaLViHYRpnOPhIG/3eG3
         4pSr1B+J98YzKoSdx0nc4LOo6lBlo19+AbDODW928hbjBqmn4EbPoGFU1O8e/OSw5oRJ
         49+JsPcSa4AU0RAAXeyFSqUI94pkDGLwMNTougvM3mrbo9NZm1cmVM47U/7S7l3810Vb
         SY+LjofeargnnvsZ4l+0uDsrr5LiT4GbwDHVgaLONMuy99Aia7pQ12RG0pbE+k1VXomy
         t0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jiiyofhSvlGJbOk+zjioYY1U+uBRekjwWzmE0lyF8KY=;
        fh=s7apbVcc4nuuR8Sq1GUTHdT1o9ldz6CPpky0cAdjfH8=;
        b=QayZ7baUYGGCyugpevy2CjE/1hkRFmPuv9RZt0xy63CZdk+bzejcAlt5TFYRCapQPt
         ZuC+ZIWmHywrz+tJqKfG4wpjAoSX/E7xKVuOvjLr/wV+PdyN8U5kxJUwJ0iRBU5kclof
         zEa4pSPW3TKrcCvtQTIfQRA8vsbNvCw4+IBtAXh1tUY6S62B++V4CptIOKbFKNJg7iHW
         0pibqSOiX5uMAVBb7ReBFGL5a9txKmWqQX78dwA+u3z6b0n4LwR6h3GlghtztJxAk0rP
         6p/4hGPKj8F1OObGfBv/1n2Td+bQ8wBsTQVa/ELpyMflKNun08SsZMD4Kn8T+ZOJjnLO
         fDXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140556; x=1785745356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiiyofhSvlGJbOk+zjioYY1U+uBRekjwWzmE0lyF8KY=;
        b=WACiFu7zKLA7BiL2tpISJ0tGgW8Q7+/skiRVtyUHYBi1b43cDK4VZyHLREaMb22n+C
         qCJwpIvJFwIzFatu6RchWr++GLOFdvA6og0DgwtoCQ7TbK00pC/o9wlQRLf2vAHipe9L
         x5NQTLcPenfEXWOVPE/CXXmATcyuxKKLpBrwSlDMnQBZvr+MiSxbN7EFGsowUyn02eUz
         8fAenl2u1hS88bHRfmejE7cVjj58XkT6yLs/xSilKEvTVrbBkK1AUqdX+WPUpsg9+CDF
         WgNWQeMvk8GC7lsJbMiZdXV+KZUEIuTk8Zhfdom+YA44W2fT3A9ip4Y0hTlzBT8IeR5v
         IewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140556; x=1785745356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiiyofhSvlGJbOk+zjioYY1U+uBRekjwWzmE0lyF8KY=;
        b=jiCOppIBNYJGCluAZ94fBIkAoqSj2QzKVhHxNgo123ABqIygXU/6z3ZCtRN/oQszTv
         FN0a6qw0LCWjAqcGMOkoQ/UDxw/j8D3ycmZPjt2JwGEWp/QPFDZ++Dfq+9HjKIoAMEzW
         yQ3qrpSg5jYXcm/LOCVOOmYaDHGRjIcxBeXtfingXM20RG5cTWJNSOoQl62S7tFpLV5k
         /SZkb9Tvorcr0oXUzL+JP9TBFAnQMFad1rT4l0pyRZWsFovy+5usc5BkuEyXynetIc3W
         jIz64ofjhg/aaEq9HhGQDsjZ+YNZuYDTcjq6xnR4z2heG8Ec1RBz81bdcKM1odpWDG5H
         qb2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoxFI2sNKwlq7qbJn5hJ7Jyi9bOQnq9pJWU2by9hOMgKB3DlHugCDg7xVtCrctNnPUJdWAPO+Qqx2GI@vger.kernel.org
X-Gm-Message-State: AOJu0YxTenFIJFO11YDrEVxHADPfuyPIzwYwmb5FC4xV9fdsPvM/54rA
	HISAasdsjVtz9x3x0Lcw8/OazVOKV5HI9d9kcjwj2gBLpiyPyZGixV6zQUTJsEZW6n4jZWr9GcC
	Xt/Le4p4ZzfEouuChjCrMW/BGFUkwlyI=
X-Gm-Gg: AR+sD12naYksfXSUv1hoSlUEIMiKP64o6t/wpd057Vvk6HPGAsDAgjBWYGSDVgjcdEy
	jaLjq5IhgEpu9iAIYXQW1L22oh0gfXy5h1hcfmHBe/YjYF8gvLFOS4Gx9tn5kielLKAyRYJxzvB
	2UCastEFV/hAacg6xBVX4zJKewpQV3ELBApUDc5oDnOp7yw1I4uXk7+o6t+TohwwXVVPEXzOq6H
	Z1UN5UUE0cRTqfFc2iycEaH4vCIk7pgKrEQwQjbabK7w3dURSltrFJ12Kyo2rMfF0ZMvhT8bDFQ
	ms67Y/Dpk4m0/24jy4k=
X-Received: by 2002:a05:6a20:7291:b0:3c3:a9ad:a747 with SMTP id
 adf61e73a8af0-3c67da6cbabmr7867709637.26.1785140555737; Mon, 27 Jul 2026
 01:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-7-clamor95@gmail.com>
 <20260722022519.3b1e4fd3@jic23-huawei>
In-Reply-To: <20260722022519.3b1e4fd3@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Jul 2026 11:22:22 +0300
X-Gm-Features: AUfX_myZ-uH2FsBg2M-NpEbqqEjSB6AkjRrQi_JMKQ0vOPgoMTtIwPKkN8lpkdE
Message-ID: <CAPVz0n2JBNRW3EP+b8Nk1C2MbJnszLiC3hSwEsV7r1ga8obX3g@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] mfd: lm3533-core: Remove redundant pdata helpers
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

=D1=81=D1=80, 22 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 04:25 Jona=
than Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 17 Jun 2026 11:00:23 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The lm3533_set_boost_freq() and lm3533_set_boost_ovp() functions are us=
ed
> > only in lm3533_device_setup(), which in turn is only called by
> > lm3533_device_init(). Incorporate their code directly into
> > lm3533_device_init() to simplify driver readability.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> >  static int lm3533_device_init(struct lm3533 *lm3533)
> >  {
> >       struct lm3533_platform_data *pdata =3D dev_get_platdata(lm3533->d=
ev);
> > @@ -437,9 +396,21 @@ static int lm3533_device_init(struct lm3533 *lm353=
3)
> >
> >       lm3533_enable(lm3533);
> >
> > -     ret =3D lm3533_device_setup(lm3533, pdata);
> > -     if (ret)
> > +     ret =3D regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
> > +                              LM3533_BOOST_FREQ_MASK,
> > +                              pdata->boost_freq << LM3533_BOOST_FREQ_S=
HIFT);
>
> As you are touching this maybe get rid of the shifts and have one source
> of info on where the field lies in the register.
>
>                                  FIELD_PREP(LM3533_BOOST_FREQ_MASK, pdata=
->boost_freq));
>

Very decent suggestion, thanks!

> > +     if (ret) {
> > +             dev_err(lm3533->dev, "failed to set boost frequency\n");
> >               goto err_disable;
> > +     }
> > +
> > +     ret =3D regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
> > +                              LM3533_BOOST_OVP_MASK,
> > +                              pdata->boost_ovp << LM3533_BOOST_OVP_SHI=
FT);
> > +     if (ret) {
> > +             dev_err(lm3533->dev, "failed to set boost ovp\n");
> > +             goto err_disable;
> > +     }
> >
> >       lm3533_device_als_init(lm3533);
> >       lm3533_device_bl_init(lm3533);
>
