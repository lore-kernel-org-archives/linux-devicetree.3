Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D55B42587E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784143679; cv=pass; b=JA0fBlkS1mCBElcvG6SB08lwa/nBIfytwF/cHNCDi9T69PgYj90wQPj/1BHULmMNLrMSzO1Ql1RIgOfGdpioNhfHm6rBQoMs2ZmRHYetpuvPqEMpOI+sSVu7d1DSZFMyQpcfefXmSNe3Sw31NFwmbGjb1YK27L1Es1NVQOfymlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784143679; c=relaxed/simple;
	bh=gNpBvHU8A+yPMg6gVfkM8fNj3ETnZV3pNYTn3k5ENWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=isc1RbwvBshhnZNPevj6HYEgqp71RGlX8bojudp+Q8BiJanLonC1BcxGk0V8sIhgeEa3gfG7XwQVkkc3QUYUjxZ6dm2qaKBtXu7jw6gmFGHlT6XWQbjteY0tknzz1RdUX1zWe1rJoRd5UsAoM/E2Bll5UvPaJ23W6vyzAGp7b5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eygUc0HI; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eygUc0HI"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66077ebd1d3so811154d50.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784143672; cv=none;
        d=google.com; s=arc-20260327;
        b=aWu0liHInM5lGsTaPxyGtCf7zLZop/A0fUg1HKOucySsxhMBvNzz3/ElYSv+viGCM8
         tTxZnw8GFf8j/v5P6At4gGYMVHcV/+RHT8FgtJ9rII26VT9AacxpVps8ZKMpck7+1shl
         NQTiNmXyySPJH0m3NVDYbuBx0OjdAj9rVJbusqtvI2hhzN4z3plODdokwo17FubirPpc
         Hn26EwL36qnNDVfbff2auwWfeMv4ad4pNAB9wxNcwfwIqQ/R65Z22LtwzFI6QJSF0NVY
         mbvVlHlVSOMS1po/ipHSmOC7zvceMvb/g21UmOtLjXih4ENsiOJlSdVMXlpU0H2Wiqtd
         JBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsRdDVwrcLCLoPjF0Dp3de0ewZAnett3co8GPU5q6hA=;
        fh=JVth3VhR7y0ET1qYR8gh68R21PRq6be+kbLIepgYHAA=;
        b=PYyvTDu+HGZOO2wwoGY0CaZA9NYwRbQ/tiO545jK4LYWbUNjhs6dcFB630yeKbhW2V
         XGy0SBB/UFzz6GBYCnfl+Om8UfDueatEYicO6RDboS69HsEbFeo1vlyRFrSRTBI2SOo4
         Mk2MV9uQfv7drRovxMZlUeDxhdK6TRBuOcmSM30CzOydB+w1O4gc2SOxmq9JqA/5WMOw
         hmRNU9bpBTyeH/Lziyv2pv8UeLpyHYlBxik0eZIE7q6UT/zOTA/kaLszpJ7K1PDuD4XF
         bvODbm/M2ohX/T5HEvUOyIfh3oL0lw6dxPj58LPL5mrJE8TvlCuJ21vBwJeNtn/IkFTL
         7xiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784143672; x=1784748472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsRdDVwrcLCLoPjF0Dp3de0ewZAnett3co8GPU5q6hA=;
        b=eygUc0HII9ARkv58QmFYFm5CvdgvR+7aFzqKWydSQTl2RNRB3pg6D2c7CEUPql4zqA
         CbJOuEalaHXOhJKXBDWfVdsPuz/SSkIx61pzs7Uhk310pNdr6NBlZLlMQhF0wpiqgc/A
         gqlxxKaaFtmPI+l+CGDd4ADjlUIUzZ+2ThftpLcKqD2xE0c37WEcCtm/qVPfvorE+lmt
         WJcx/29BlGSl0SgUBe8XqLTi4FsOobCbsC+AvLUTXHMvg/4g2Tg0Zm/sZsHNTN877eXB
         A6xNZ++08JClw7VCAR0Wm0sMozBz5A71U6IWOT7Nn7zmXwV8P7MVerCf89rKL+if9H8i
         33FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784143672; x=1784748472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsRdDVwrcLCLoPjF0Dp3de0ewZAnett3co8GPU5q6hA=;
        b=DBrQSufV7PhoqUow25aAZkGTWUHyOLB/TXOFxTEjf8lD2YMXy2vAPuilZYx+84wQ6w
         Zz+HoQXKVhH2UfJ703ujlVet5Lh1xO2d3sQhGlAjsZQcKowcI8lvA+9ZLeN6Erw3Mh/X
         RrkLZdBi8fR66XN6Qijf8fvgnCagYXvpQ87sdEYJf5QEs77uWgAYHh/KsFoG5T1wseKW
         IqoTeMjk2+orjTPf17oCWZT+A0Ekxs/QEOmhom2ScyyX1wlPsYfwBBVLCKrR5ARurbwk
         OtaCXBHnKH92PwzT4aVdX5HjWcB5vZPqEOxbuXm3gJaxfDzJDEuldx32i2oZE9soyaGH
         xdxw==
X-Forwarded-Encrypted: i=1; AHgh+RpMhM4jzIvxuRYyZLgP0e9Ocp7nXcOHp8BW99ktr26MNsfWmC1DYwGg8b47fZ7wbF2yBXEk6kE9ayX8@vger.kernel.org
X-Gm-Message-State: AOJu0YyMG2voEnAH4fBXRhhoUy72kMUR/xZBIB0fAcJd8ZrE8ky9IMmM
	aiKvypBxYFtr2YyPdyXDsD0EBY86fnnDXF2Zb5Ki30HvO5rlYtHZ1/w6INigMd+ENTjN7FDIcV+
	5RcAOzL2djbFMMdHKZfu/RiG7ySdSUY4=
X-Gm-Gg: AfdE7ck7I43kXBhqVrin3YFPzgMEgAlX7XYhyhMnIxD2lYip+X/rgja4EyBa+Nxqabf
	PuEbu+Pcwz8aQfPQXIXSzlWUCFcP8CJ6+1xrvCiQE1lxGsvhJZHF40E/P/32TiY1reKHeDo9zCC
	qxMgWMKM/zN4MHQxCvMJUOG/1OpAiDHYQlafjRRI9DCykNNha4eCj9SjtO7a4UDO8abVBee8Ukj
	FSvofxPykk4XQjfG4Aq27GdhmaMttWUsoLoixijYDbiNulCbyNwVje7e8R7Tj8JS2xr6cN92mrh
	8Z3cWL3MZlOfJVx7PAXx5V4Y/ooYmr0=
X-Received: by 2002:a53:d009:0:b0:668:7ba:dd5 with SMTP id 956f58d0204a3-66807ba2deemr4278075d50.8.1784143672247;
 Wed, 15 Jul 2026 12:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715051939.64652-1-royalnet026@gmail.com> <20260715051939.64652-3-royalnet026@gmail.com>
 <8089de84-0793-4668-9030-42881912e6e7@collabora.com>
In-Reply-To: <8089de84-0793-4668-9030-42881912e6e7@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 21:27:40 +0200
X-Gm-Features: AUfX_mx-M8gA_e-89t2GABw1WiRnppyJdsqw76CHeBUhWdBRpLHz0OTmUN_j5So
Message-ID: <CAEWPSH66deV2X6ytJpbFYHWGGS4euNX+-+UpO8eVDhmWTfSk-A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] media: synopsys: hdmirx: add HDMI audio capture support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

> Nit: platform_device_register_data() should work too. The specified
> DMA mask should be unused by the codec driver and even if it was
> used, it should be inherited from the parent dev and not fixed to
> 32bit. Please either remove .dma_mask or use
> platform_device_register_data().

Switched to platform_device_register_data() for v2 -- you're right,
the codec doesn't do DMA, so the mask (a leftover from the vendor
driver) is gone together with the pdevinfo boilerplate.

> Please fix Sashiko bug reports for v2. Otherwise, the patch looks
> okay. Thanks for working on it.

All five driver findings from that review are already fixed in my
tree (ERR_PTR handling, remove() teardown ordering, hw_params/worker
race, named clock lookup, consistent workqueue), along with the
Media CI sparse warnings and Sebastian's binding and S/PDIF DAI
comments. Re-validated on the Orange Pi 5 Plus. I'll send v2 with
all of it shortly.

Thanks for the review!

Igor
--------------------------------------------------------
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

On Wed, Jul 15, 2026 at 9:08=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Hi,
>
> 15.07.2026 08:19, Igor Paunovic =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +static int hdmirx_register_audio_device(struct snps_hdmirx_dev *hdmirx=
_dev)
> > +{
> > +     struct hdmi_codec_pdata codec_data =3D {
> > +             .ops =3D &hdmirx_audio_codec_ops,
> > +             .i2s =3D 1,
> > +             .no_i2s_playback =3D 1,
> > +             .max_i2s_channels =3D 8,
> > +             .data =3D hdmirx_dev,
> > +     };
> > +     struct platform_device_info pdevinfo =3D {
> > +             .parent =3D hdmirx_dev->dev,
> > +             .id =3D PLATFORM_DEVID_AUTO,
> > +             .name =3D HDMI_CODEC_DRV_NAME,
> > +             .data =3D &codec_data,
> > +             .size_data =3D sizeof(codec_data),
> > +             .dma_mask =3D DMA_BIT_MASK(32),
> > +     };
> > +
> > +     hdmirx_dev->audio_pdev =3D platform_device_register_full(&pdevinf=
o);
> Nit: platform_device_register_data() should work too. The specified DMA
> mask should be unused by the codec driver and even if it was used, it
> should be inherited from the parent dev and not fixed to 32bit. Please
> either remove .dma_mask or use platform_device_register_data().
>
> Please fix Sashiko bug reports for v2. Otherwise, the patch looks okay.
> Thanks for working on it.
>
> --
> Best regards,
> Dmitry
