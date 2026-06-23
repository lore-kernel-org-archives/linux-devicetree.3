Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C08033DEE1
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 18:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782240611; cv=pass; b=cmSTeG0whgOprgu3hSxT/z7se9+qAId8D27qcyp8UytQ9i+m2/ypWQ6YMQYsfFAT23zV3kQJKlp6twt9RKWbGiXU/YROCpJJIri1bxNbbnyvlP5NntkKeZQ3eXzhm5H+TjyNoNSisjl8k7hIM5z/wK1sKhau03TCLX+2i9+azLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782240611; c=relaxed/simple;
	bh=2i7rua0A3sCIdIAznJi/9R/6Zhg0AyV1Lx8kkxysH5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeOSVdqfGQhVTCF2yJBnWpdVNF1Z4XBCXa/uodRsN6Z1UdKYaMBWmiGiRSLJGSWC0DQpIMFzP7vasMDDUG+vEj3TVivkTfNAft3CH1vPTRcdXVR5m9kPf+YNqtceLONnsTf7f30Q/aRp76jfmRjZfY1/C/eyNlTONn8KaLnNxrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3TYuF7j; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3TYuF7j"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so184805a91.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782240609; cv=none;
        d=google.com; s=arc-20240605;
        b=GrhJzN3g6t6hQK48PNlzC3ITLuzQOkXB1nsbaNr5H8OiMqHlzuxsTLRyBnmbWjZZED
         9zAPlTtnfuLUmKvgKjjf2LKWok7IaoD0jo35pHQAxHY1sgv1coBKrSp89oj3ZF//usS2
         P3ZdNTfnhbWk0d2WQHcf4lFC6RL5d6mcXsrU8Oqkds85qKpxt/YuVatfiq15PJf6MRuW
         hPHtBtLhbLjho4WQcvtzJ7EcnA4RIW02Q+PX4MJJauwK1ZIrkvxHdQtk48fQ6BHYDT8Z
         LmjGo8RIIEo66tgyIQT/R2UjsXwuwXydM66BV9Kd/R5+Li6I3MUWjQ5rpcjLzYe9+vJb
         ImBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1sIxIo8I1GNUGXmx5ajo2afqYjnbFmaeXVsrW46Jp7E=;
        fh=nXZRtUL7nx+grrrST/qDqqiwFdoOMg8TJf06EZT+NN4=;
        b=SVl6ULZoPFdxR2VzyPMcIfVEcIuWhaJxBCf60HoksH/Z4MUaB2QtPVDGk3Yrf0Y4aF
         NVG+RqRJhO2L3PBJiBJJR3ge4cyBoko8HoVY/7Ep9MsujjiJTLB8gSNO2OtE5uf0kSA+
         10rv0bIRQxTdbJVCwM81gj1GU2iHGDi/OV3UuUCnfo3zVgkv8MF3cUjVzwlqHQJhIGZ+
         5CiF7tV1FuNnPyaLBgZ/Te0L5CjdBtJURpnEVDhLvg2m1FV/Y1/8MWqAcUs+L3BY2B2d
         dKvuCWXkuslhp0GbbOW7fzShvGJpLOAKcsrOQJqo9OYowWIDvlXyKPxyENfuizg4VUM+
         yfhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782240609; x=1782845409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sIxIo8I1GNUGXmx5ajo2afqYjnbFmaeXVsrW46Jp7E=;
        b=R3TYuF7jdBrtyOY033yxSpRM+lNXM6py2+7aTM4U5Bf+ijMIIBiauPfA2BuWkhyIV+
         0PM45sS3n2IzTxjsPXKdUH3zT62NgEph37cPvk3QtpUh/0vC0vOqnYof6M4XmRYhvKAH
         KwrS7F8GPdBf3nDeKFBVEbMbtveZnClubCa7Tob2UA0qAoC3fAq7A/dYSRwATBidlMpS
         WdE1/ZRtmgqaqoGnCN6CGszVtLcHwPSeDlyEXJTwbJaj6e2bp+GTHcIzwr0vJl3oD3JJ
         TCm42dPFVDKEiHO+gYwPtEI25A1O+zRPmaI97+LwEDINzTbGMaD2VtJB3D432QYUIpSo
         H6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782240609; x=1782845409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sIxIo8I1GNUGXmx5ajo2afqYjnbFmaeXVsrW46Jp7E=;
        b=LpaQ4SJRYEiLDJmBQPLLWjvMVB/agVXHW6kl7dOYDNiV/9+AQDFVX38qrHcELVjY3R
         W0MREoNZhM2uRyXyjTaXQLZx++3cC+qLSjzppLHeeQzaGcRbxbb1WWi7D9BL40dTmUZ9
         kAGUy/NgA8YmAgD6ICJl4xBdedcPFAO0qUBJvAEnlsZZjybFPgtDGaVgPD/8EHQ7vixb
         e1wIexrko35E3UJZRc5mm1/FFmDZwcxis/9UsQQYL5BBB8WVrMAFCdJssSR1vvUEzlrZ
         invjrNBsueCyHoLIqdirWEaINNcZdq/nCBP5fBvk4kU+OJ4rBjo9qQP3uaAlDrLn7a+I
         m1qw==
X-Forwarded-Encrypted: i=1; AHgh+Rrjow+/mxlcbsYm9uqbGy1WqzJWHRaco49zQVw1giMlr7N8MpMr6IhHaIi5I286orNpMp1xzgn2fIPa@vger.kernel.org
X-Gm-Message-State: AOJu0YwL94ecn7cWxlBOf9xV7nA6QVKWWcdiD6WJjBUbg0p4TYkyzNds
	TjSb72qXQK+uFzemeyABFEZUJRzqF2rHYJIHoNGCx6172a32wpBE0KN71tDF7vYDi617Sky4qCd
	NS9zRQGnNJ3jPhbTXi5MoAn8LOhrxoEptzfLNdMA=
X-Gm-Gg: AfdE7ck9rVokMgqdOGNr4sdbYzorLghWOLRqi8xzQdF6TixtcsGeHmGFGfpgYROs+6/
	7nJjK+YJG0pn5laUXVaZ0hhieAFga3+ftP5pLrxXhEocjJs30dg1CSVZQB75bN8K+ihM7jXZSPS
	4zcaAWbT+qyr7xi3PUK5WnGbWLngoXTgS9BBUPk3lip0uG6G+OJtX1WChnORiVMUjZq085i7Hm8
	X0A9wAQZZaPp/xJhJCYIx7eXYIxctCzGSZaOPOnFRNeQ7DwSgcrJ4poS2vwImA8YuOCuwP5DLkc
	PvDmN41cgsVN
X-Received: by 2002:a17:902:f651:b0:2c0:ab82:6b9d with SMTP id
 d9443c01a7336-2c7e15555e5mr920525ad.29.1782240609373; Tue, 23 Jun 2026
 11:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622221550.374235-1-jakubszczudlo40@gmail.com>
 <20260622221550.374235-4-jakubszczudlo40@gmail.com> <ajpQn8EVOx3ssxG6@ashevche-desk.local>
In-Reply-To: <ajpQn8EVOx3ssxG6@ashevche-desk.local>
From: =?UTF-8?Q?Jakub_Szczud=C5=82o?= <jakubszczudlo40@gmail.com>
Date: Tue, 23 Jun 2026 20:49:57 +0200
X-Gm-Features: AVVi8CfpUH9nZN7h7nfQ8v1HKhudLTDUvSugvE2PGx9Vd29bDH02CXQJEhI3XJs
Message-ID: <CA+gq5JitNkTpNbeKUd7bSnCx1bt2ypJxpK7SZsiybAOiWvHUeg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] iio: adc: Add ti-ads1110 support to ti-ads1100 driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, andy@kernel.org, antoniu.miclaus@analog.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, dlechner@baylibre.com, 
	duje@dujemihanovic.xyz, jic23@kernel.org, jishnu.prakash@oss.qualcomm.com, 
	jorge.marques@analog.com, joshua.crofts1@gmail.com, krzk+dt@kernel.org, 
	linusw@kernel.org, linux-kernel@vger.kernel.org, marcelo.schmitt@analog.com, 
	mazziesaccount@gmail.com, mike.looijmans@topic.nl, nuno.sa@analog.com, 
	robh@kernel.org, sakari.ailus@linux.intel.com, wens@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 23 cze 2026 o 11:23 Andy Shevchenko <andriy.shevchenko@intel.com>
napisa=C5=82(a):
>
> On Tue, Jun 23, 2026 at 12:15:50AM +0200, Jakub Szczudlo wrote:
> > Add ADS1110 support that have faster datarate than ADS1100, it also use=
s
> > internal voltage reference of 2.048V for measurement.
>
> ...
>
> >  config TI_ADS1100
> > -     tristate "Texas Instruments ADS1100 and ADS1000 ADC"
> > +     tristate "Texas Instruments ADS1100 and similar single channel I2=
C ADC"
> >       depends on I2C
> >       help
> > -       If you say yes here you get support for Texas Instruments ADS11=
00 and
> > -       ADS1000 ADC chips.
> > +       If you say yes here you get support TI ADS1100 and similar sing=
le
> > +       channel I2C Analog to Digital Converters.
>
> User won't know what similar are really supported. The rule of thumb is t=
o add
> the list of supported here as
>
>           - ADS1000 (...perhaps some very short spec info...)
>           - ADS1100 (...perhaps some very short spec info...)
>
>
> >         This driver can also be built as a module. If so, the module wi=
ll be
> >         called ti-ads1100.
>
> ...
>
> > +static int ads1100_get_vref_milivolts(struct ads1100_data *data)
> > +{
> > +     if (data->ads_config->has_internal_vref_only)
> > +             return ADS1110_INTERNAL_REF_mV;
> > +
> > +     return regulator_get_voltage(data->reg_vdd) / MILLI;
>
> For now we used "(MICRO / MILLI)" instead of "MILLI", to show the unit
> conversion.
>
> > +}
>
> ...
>
> >       if (ret < 0) {
> >               dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> >               return ret;
>
> > +     } else if (ret < 2) {
>
> Redundant 'else'.
>
> > +             dev_err(&data->client->dev, "Short I2C read\n");
> > +             return -EIO;
> >       }
>
> ...
>
> > -     microvolts =3D regulator_get_voltage(data->reg_vdd);
> > +     microvolts =3D ads1100_get_vref_milivolts(data) * (MICRO / MILLI)=
;
>
> See above, here you correctly used the existing pattern, the above is
> inconsistent and needs to be addressed.
>
> ...
>
> > +     model =3D i2c_get_match_data(client);
> > +     if (!model)
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "Can't get device data from firmware=
\n");
> > +
> > +     data->ads_config =3D (struct ads1100_config *)model;
>
> You can't drop const like this. If you need to apply modification,
> use devm_kmemdup(). Otherwise it won't work correctly if you have two dif=
ferent
> sensors of the same driver in the system.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


thanks for review, I will wait few days and start working on v5

best regards,
Jakub Szczudlo
