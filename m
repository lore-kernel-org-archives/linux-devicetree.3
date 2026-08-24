Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A5D3A0E88
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558271; cv=pass; b=fO6HNaPtb0MFxXPDqqfvM9VIP/O7OuNT5mUDHVAazD2g7YWmYuGyOSbv5Pjgb+te1iEqHOWvU4acdEVkW54wEmn6iVwlk024hOb0JaQWUXpcyBH2k7bANkaTEg5X9jMSn3CepJRKomB8IbIsabIXOoc71y6/5lGm235WV6XlO8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558271; c=relaxed/simple;
	bh=WrtUjVJk6alrvqmX7ok/YmeHd1u9WPIdgJPTrkxRxh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+s9bMgsj3YXUBx6eqlpENi2bDvXPP5Oslj0hR2sGx6nEEx6+FfAqRck4ThbXDkxfShwUTsuwUVhXUV2mh8Vqhnhm19dvhi2/9NCCMn4qwntwXo2vZTfvpNehlc1iIDB+PuGhkhXVRQV+wp7wt1o82FVw2tXWs3a2CNxOT50fSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSvEv93F; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSvEv93F"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39faa67fab8so21507281fa.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787558265; cv=none;
        d=google.com; s=arc-20260327;
        b=FoAHogtxYwQSYeg5gRtkJDjmOoSI4psnlABD/qqDvtJX/kAXBfT5YS+eCEpY4FAGty
         OITEXuJNJUwINYlpwWMD1oPBRV6G02dcEm2wZfdQDvLutPK8MqynFhXrc+xN+EYnthfZ
         bT5NjTdrKiZFzvv8ZW6siR1lodoSU0KHkRkkghUfEIvjw1OTZD+qYXbwsFVke4rECLgQ
         eagLYqF1P1rzm85FrIHHX8zCNnUlhr7MO1h0JStVSV61M9WmZeeRwUXMtt0/DMCq+KBL
         Vr5WfSCmV8zpfWHUMnE1JXitPpoq96z7RpLum6XXdGaCoc3IXR2nw0133p4m21R0MVYT
         iTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VWCwm00e2NQzgOI6ji4mfpuOp31nsUpfbcVtkliODgg=;
        fh=x+0OIQJkxfFHMduLD37EThDP4GGy63nTjnQVBhw/Tm8=;
        b=MnJEXs0XH2cZ5Z/IeGy8cPl+6dfrxWTNVc4qxHrwGGi+KAn947o6fcp7FDI2RiVoO/
         By8S4jyZ1z+ubnvADJjHjUlCFXX1sz8vRF7bilRiMjPWk33mYIvrtz/lkrQig3wYlICt
         yfO/i3BP9KgWFgGRhSk+yWt/A4ieKUVu+R1G/CW9XK4Typ/mq53XGFnDh/yV8GJtB8Ol
         3PaYSxKpAQbxlmCai4IsGN2a3WIZTA7+9jWE01ER+PIHA2Gyj04wHVwrGrJ3m9CSg2vJ
         qsElwgDicAagWWsc38wmokzbGj3r7RXUnheAMApHFKkqvVmPF/qdWHeLkBmhzqjrQO1I
         yxKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558265; x=1788163065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VWCwm00e2NQzgOI6ji4mfpuOp31nsUpfbcVtkliODgg=;
        b=YSvEv93FDh0ukiHQADBaOq1Desl2PVpJvKSOrmRiWNq5xMsecTdkdHf5k3VJboaHGj
         rM01wHo0PIATxzfH4uLAa0ciRdLrB2dskcctjMN2j4UsYD/Yq4TeA0b7nxSBVOM1Jm0N
         6BE9RujCfknSmd5mlVhQAPZjt+1vDGAApL265OOxurMJOofNaWMUN6VijceVTBssDyLc
         6AD5y8SzAzleIAk+Gku+j9D5ohIIQKEjWCPWwiNSBKkLGZZ7J00JRukqNr36pGJ3PUcf
         3xdHO9xBx7ir4vI4wwvx7Fq6czRIlfSlQsnmtKixxkqll71Ugl7RK4JTfrRt0/yPw/5C
         cUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558265; x=1788163065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWCwm00e2NQzgOI6ji4mfpuOp31nsUpfbcVtkliODgg=;
        b=MDQaRiZuZM1i3slqzuvpdlrr/JhojlE0M4gUziQXpDh2aJ5Ya8So7adq3/H9dx/XMq
         4wwFoFU7omKt/FNWaJ0trXeWaEiNkgcgjelf0niZEXnRlNNJSwIjCzDJT2askprvjYM5
         gcz3Z4ykrb1BdUe2arPluZCamLtrdlcUjiDCmmc54+A8EKqzs8I/qjAulpyE9bCRXICx
         c5kZo2ALAOOWJhpKwGNd/YrrD5T7ZsYZ/n9m25Ts0ZsJ1fpdfqD9t3cq3wjogOipri1V
         OxAkx5z3xUdrei0vIhGknDPerbWbBet0iQfAX9gwYnYoR65p9+xZutjv1nous4sGWwlH
         BzPg==
X-Forwarded-Encrypted: i=1; AHgh+RrCrVV40uvJ1lQCkz6pdS3kbltJqK+7xgoqttz3F6F1vBTv1+oehUJvlI05C/Ze+otcUwPY5PpVbiLp@vger.kernel.org
X-Gm-Message-State: AFuF++nTvBd1EroL8Ig0dbxb0IVCr5lggkwKiHlqJ9AskGUpOP70NS2y
	ciZWZvqFQFiuSMSiFeGhe6fbBIHjaKEetBTG3QUN2vBdmNXvJzgPCOU4pKDKCvesvXgi7BiORe1
	uPYzDgWW56lH8R2WkHW8GWsnSO+pxK1M=
X-Gm-Gg: AR+sD12wjA6xmHuoW5Cbdu6vFNXunSpqXC9Nc8Ejb0i9vRfPMalfRqAdprw07Dbn/h6
	88OYfHU1Ry/pqBys0IMeZlGDRiCXcLxGSgsgQ59lU51I1xTGU44UOyQEhavV6Ujs8UtdNPoPJHa
	FeUk+OpEY6S736UD3A5czaVl22/efKu/3Di6RvYa38j/qIh++J/S9sN9u5+tmi7rXy2TA1uttj7
	NZ2G/iMwPGfFDQJQMXI41A18klXaiZNeuY3EINNh+QlscX1HEtM03vCNHl19yFjkLnAEkxmM0lJ
	pyL2YRdUKDaI/VhpKJ6WxhMcOgErlvI2r4YrJixiqoKxCwhtoQlHKJ13
X-Received: by 2002:a05:651c:a382:10b0:3a1:9562:73b with SMTP id
 38308e7fff4ca-3a1aec07a7bmr42175991fa.11.1787558264439; Mon, 24 Aug 2026
 00:57:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-ti-ads112c04-driver-v6-0-0e8f0aacce9b@gmail.com>
 <20260820-ti-ads112c04-driver-v6-2-0e8f0aacce9b@gmail.com> <1b0af12a-0653-4a14-9c0b-4948eab9a4cf@baylibre.com>
In-Reply-To: <1b0af12a-0653-4a14-9c0b-4948eab9a4cf@baylibre.com>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 24 Aug 2026 16:00:49 +0800
X-Gm-Features: AcwNN1U4ahlelk9rgkeVTfIHrIU3wa7mxWz-Nrmu3SlqD4eZV_AV1OdCyJK0trQ
Message-ID: <CAF7HswMT-e87oapWSw11-Qhj570wLDiayKeSP5vuYo9Fm9AbxQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] iio: adc: ti-ads112c04: Add support for TI ADS112C04
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 8:06=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 8/20/26 2:51 AM, Kyle Hsieh wrote:
> > Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
> > delta-sigma ADCs.
> >
>
> ...
>
> > +static int ads112c04_parse_channels(struct iio_dev *indio_dev,
> > +                                 bool *need_avdd_ref, bool *need_ext_r=
ef)
> > +{
> > +     struct device *dev =3D indio_dev->dev.parent;
> > +     struct ads112c04_state *st =3D iio_priv(indio_dev);
> > +     struct iio_chan_spec *channels;
> > +     u32 num_channels, pair[2], channel;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     num_channels =3D device_get_named_child_node_count(dev, "channel"=
);
> > +     if (!num_channels)
> > +             return dev_err_probe(dev, -EINVAL, "no channel subnodes f=
ound\n");
> > +
> > +     if (num_channels > ADS112C04_MAX_CHANNELS)
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "num of channel nodes exceeds %d\n",
> > +                                  ADS112C04_MAX_CHANNELS);
> > +
> > +     channels =3D devm_kcalloc(dev, num_channels, sizeof(*channels), G=
FP_KERNEL);
> > +     if (!channels)
> > +             return -ENOMEM;
> > +
> > +     st->vref_source =3D devm_kcalloc(dev, num_channels,
> > +                                    sizeof(*st->vref_source), GFP_KERN=
EL);
> > +     if (!st->vref_source)
> > +             return -ENOMEM;
> > +
> > +     i =3D 0;
> > +     device_for_each_named_child_node_scoped(dev, child, "channel") {
> > +             const char *sp =3D "single-channel", *dp =3D "diff-channe=
ls";
>
> What does the "p" mean? I would make the names the same as the string,
> e.g. sc, dc, or s_chan, d_chan since they are used quite far from here.

Renamed to s_chan and d_chan in v7.
>
> > +             struct iio_chan_spec *spec =3D &channels[i];
> > +
> > +             if (fwnode_property_present(child, "excitation-channels")=
)
> > +                     return dev_err_probe(dev, -EOPNOTSUPP,
> > +                                          "excitation-channels is not =
supported yet\n");
> > +
> > +             st->vref_source[i] =3D ADS112C04_VREF_SOURCE_INTERNAL;
> > +
> > +             if (fwnode_property_present(child, "reference-sources")) =
{
>
> ads112c04_parse_vref_source() already calls fwnode_property_present(child=
, "reference-sources")
> and returns ADS112C04_VREF_SOURCE_INTERNAL as default, so we are duplicat=
ing that
> logic here. Either drop the helper or drop the extra code here.

Dropped the extra code in the loop and now call the helper directly.
>
> > +                     ret =3D ads112c04_parse_vref_source(child);
> > +                     if (ret < 0)
> > +                             return dev_err_probe(dev, ret,
> > +                                                  "invalid reference-s=
ources value\n");
> > +
> > +                     st->vref_source[i] =3D ret;
> > +             }
> > +
> > +             if (st->vref_source[i] =3D=3D ADS112C04_VREF_SOURCE_EXTER=
NAL)
> > +                     *need_ext_ref =3D true;
>
> Can just assign these directly:
>
>                 *need_ext_ref =3D st->vref_source[i] =3D=3D ADS112C04_VRE=
F_SOURCE_EXTERNAL;

I used |=3D instead of =3D here: the flags accumulate across all channels,
so a plain assignment would let a later channel clear what an earlier
one set. For example with channel 0 on "external" and channel 1 on
"internal", *need_ext_ref would end up false and probe would skip
reading the refp voltage.
>
> > +             if (st->vref_source[i] =3D=3D ADS112C04_VREF_SOURCE_AVDD)
> > +                     *need_avdd_ref =3D true;
> > +
>
> ...
>
> > +
> > +             i++;
> > +     }
> > +
> > +     indio_dev->channels =3D channels;
> > +     indio_dev->num_channels =3D i;
> > +
> > +     return 0;
> > +}
> > +
> > +static int ads112c04_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct iio_dev *indio_dev;
> > +     struct ads112c04_state *st;
> > +     struct reset_control *reset;
> > +     bool need_avdd_ref =3D false, need_ext_ref =3D false;
> > +     int ret;
> > +
>
> ...
>
> > +     /* Datasheet: POR releases ~500us after supplies are stable */
> > +     fsleep(500);
> > +
> > +     reset =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> > +     if (IS_ERR(reset))
> > +             return dev_err_probe(dev, PTR_ERR(reset), "failed to get =
reset\n");
> > +
> > +     if (reset) {
>
> I'm pretty sure devm_reset_control_get_optional_exclusive() already asser=
ts
> the reset. So the way this is usally implemented is that we get (assert)
> the rest, then wait chip-specific time (usually a few microsonds) then
> reset_control_deassert().
>
> I don't see any other IIO drivers that are using reset_control_reset().
> (And I think a lot might be calling reset_control_assert() unnecissaraly.=
)
>

You're right - reset-gpio requests the GPIO with GPIOD_OUT_HIGH, so the
reset is already asserted by the time we get the control. Changed to
waiting tw(RSL) and then calling reset_control_deassert(). That also
makes the pulse width explicit, rather than relying on the assert and
deassert inside reset_control_reset() happening to be far enough apart.
> > +             ret =3D reset_control_reset(reset);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret, "failed to reset d=
evice\n");
> > +     } else {
> > +             ret =3D ads112c04_write_cmd(client, ADS112C04_CMD_RESET);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
>
> If it wasn't for the duplicate code, I might have said good enough. :-)

Thanks,
Kyle
