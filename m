Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E8441A92D
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785924093; cv=pass; b=O6l2tGsSJI0IsZqmZdPYk9iE1TAGxAfRaZ4/lpvO7IskAWoK6mPIFABydDQmfJhUeMvCYwKgkMcYZaG4C9sLa0ZAJJZDwKpXh1aUKedoPvVd7fkPtPsmkCo1ywvoTEk0bzYIImxlesj5OeeMSGhhOUt8i8KC7ObJqxirnFG861c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785924093; c=relaxed/simple;
	bh=aCuQ4awIDkcto3h7JAxQRBcQRaCA8V5TXtFjb1C7Jqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faogiamS53HTrVlABF7u05g/qLNMJXeyr18Qi1PbBKB9Prez8H29MvZtJLB/RjaySnMmwepCOXYV8CSM6x3NtOykYqC/rGmtuYrwI5mTDSc00y9CkFGgvLGc6Ef1LwfgVFriCs8Wiu48xCcjB+rqTQfqCdIIgjKlbTLXMKzcPwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oU9gyGy/; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oU9gyGy/"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1c26d7e951so135712266b.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 03:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785924089; cv=none;
        d=google.com; s=arc-20260327;
        b=NskOpiGRPBdwVixkv8jjsDYq/apdWh1MNxSdeS+YL1P0Jsngvzplnlqg00KYrD+dwS
         gO07PxErYUYO/mgsiDR4O4SDZB9ueSqWdQx9QFNSDSjEyqU5u5fiCj8/49k+I/SY7Yi5
         XNigbcTI1xkii1HqxN9gw/R5Pr3qNfNx3sGHtuvoZ8dNH5X1+Et+pKpQvDqQYnNROlPj
         D4fp914VX6PuM8pEEAJrCOz6rolCzHNgiQRTDCEaAMi1+I/A7X8SYpfOthNwPfz16Ct/
         4DsDznY9kcyqjwz+ZrVuzdtL9DBjn9niYsAcOfIBeAiCIhB0IYNJ8eBC2RLQJmGg8Lyo
         Ybcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nnl7dBC/2J2lIlaFKwTpn9e1OS3QoYewBPdtWMkrWUc=;
        fh=S5JNIZy2i7N3CzwzpvR+S7VCy80L/wkcmcZm7AHyNbo=;
        b=RIQXQXkEct59+u0MxYmfxPkh0jJJgMQCWDFrjRDVUiCus3IFndnz2v5NnpXNsTdnXt
         ZLa9V/ESe3h4y5tZYuau1NXFU6BU5j6c7JVxWOHlMypylWRDXr+7NvED5znNkXO4EL1l
         cG6+SkSHjkgnJqnbQVZHaWXml8a028U666OXYRIZ50y7sF3DGN6EjqN7R9OnuAfuKuIw
         WtUJlMvtNE6c2rnpYxFyWVkjrRLfdy0EmNIaB72JVV23NFT+TYALYZytW4TAsRkghFDc
         xQ89Y72ClURaSleZHNYby8rSyaVk/IAGE7HQnkdCiQ12xrGpEqkUpxIxbaomcIX3d1eW
         gT9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785924089; x=1786528889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nnl7dBC/2J2lIlaFKwTpn9e1OS3QoYewBPdtWMkrWUc=;
        b=oU9gyGy/C5nrjgJx98zRUyagS8GwnZ9J7gr0uQoFcum+k86VezsGOSH8zb9kNiCZ3+
         Kn0JvsnHQjJPFV8saQZhCT6GFKuFc8iv0N4esJ+YkfrvoKV5fcaK9ElDG8II1T0IBlWV
         BGCwq7Ws/3tYXmotBS0IICK14WrFfgJHstIeKBwG2yay6RMjHY+2NtRKXx5DXbvfT/4z
         gjxH1LUk70RojATFvXRKM1yjNnk535aG89plizdqKYqllKZmv9tz/ON8CLZvbIRdxhmJ
         nq2971kS9xxB5k7GiU99Luj41ARB6cqbo3GZQ4PFF5RRZ1dg+0TUGHhXFg2HIehOG4aZ
         AvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785924089; x=1786528889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nnl7dBC/2J2lIlaFKwTpn9e1OS3QoYewBPdtWMkrWUc=;
        b=gPfYVzdGcJNnG704wMz6UlBm2RfCSE3ObfNWLA+oZ1T8KR3HHlDzJrexFgUG5HoYJe
         FmEn2PrFldYI6U+n+L4bNmyZjKa0aFVdrJN8uP/t4lWiJ7zGBnhUkxo+k0lh3hqjdBr9
         JriN7Mgz4LUiO/KfMngL7TfqEb0R27QgK7TerCBysxL7a3NlDKYeBsporTc7922ZYOuB
         tooO2wFQdpeZSL03vY26Lgo/rVW/DEjiwIt8yV3DuEYzNZOTar5VrsWBFClTpRpahEim
         V3jDcBhLBco8prJHCnV7ldkUYJynxC043HE19hPZ1ocN27ZIeodgS4UaS1Ys1XVzMISi
         4z2w==
X-Forwarded-Encrypted: i=1; AHgh+RpNHqwLCheP2nQC9VVYYE42dcyEYYkQDdzebUBAYOfJjqoW98LvXXZlfeZ1/8mFQmzrKt77CIPAcJui@vger.kernel.org
X-Gm-Message-State: AOJu0YxToRUlsQ4C8FBPg7rlt8urQ//KFKLX8thsizad1BhqQ0VSkZ5j
	9k0qRD4Pn2KpLsMn7YTZUUNPGBMiMcQWkug4Uh0doKjF5hFlP9X0e77O7IdD0q51sRtz7u8qdpJ
	DAgaaYZNu2j05PtGxuSiRi20Z9Jp8OOM=
X-Gm-Gg: AR+sD13Q4h0CIDMt1e0Hx6FSFkUzi6ZtfCQe5lbrPKEKYIfC3itPUtOUYHuMjztzfAR
	oGE87HXNJ2w4lQCkQcJ13ObwZZrwfII+TH5xkB88wb6jn/hrrPX0I+APPI+w8cdnNHAol27QYzI
	3/KqrOyJDiIBCTHqJcT9SErjtBNQlgRo0ZMjFY+QBhJ0ZqdoQiwZrfZLvkxBFjzYzuWgQBFDJ3y
	dDl1hXt3QMNKbsvWKyUwTS3rD+Mi5AbNshOpu+GFBLmoq9CZslaqizUdChp3aqoe+SFTYdlJccj
	nUME+mTwUI2pooHCvperJsH/NroUlD1uyGNmaYQQidOoADaQ3ZZQ6RFpgw6LovRMuG23DvDBR2+
	IQNEBwDFnpibljvD/yU8gCMQwLL/zUKVWVlmXxiU6royA24bqo5VRkld3ecPFYkQiBuW4ycHwl5
	O6HNhtZFkngTSDpdw0efoQOc6TdUZXUAVYRHh6dxBI26Tlgj9pzKQN8FZCot5Q++M=
X-Received: by 2002:a17:907:a713:b0:c15:e118:9b99 with SMTP id
 a640c23a62f3a-c2039f3d9bdmr219169966b.23.1785924089154; Wed, 05 Aug 2026
 03:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805094135.11762-1-andrei.stancovici@analog.com> <20260805094135.11762-3-andrei.stancovici@analog.com>
In-Reply-To: <20260805094135.11762-3-andrei.stancovici@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Aug 2026 13:00:52 +0300
X-Gm-Features: AUfX_myxZcCbcuRckig6xJMzKtCW_4zohTq4GXPN5nDQZGPWkO2ClR0bcilWv3E
Message-ID: <CAHp75Vd7sq58kFE6EsLxFwk2z0QtOsyNwh0b-CrZb0HDYVjDJA@mail.gmail.com>
Subject: Re: [PATCH 2/3] iio: adc: ltc2497: add LTC2499 internal temperature channel
To: Andrei Stancovici <andrei.stancovici@analog.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Beguin <liambeguin@gmail.com>, linux@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 12:44=E2=80=AFPM Andrei Stancovici
<andrei.stancovici@analog.com> wrote:
>
> The LTC2499 has an internal PTAT (proportional to absolute temperature)
> sensor that is activated by a second I2C configuration byte (EN2 | IM).
> Expose it as an IIO_TEMP channel providing raw, scale and offset so the
> standard IIO formula
>
>         T[m=C2=B0C] =3D (raw + offset) * scale
>
> reconstructs the temperature.
>
> The PTAT sensor yields the absolute temperature as
>
>         T(K) =3D DATAOUT24 * Vref / 1570          (Vref in volts)
>
> The raw value exported here is sign-extended and normalised to
> 2^(resolution + 1) =3D=3D 2^25, i.e. raw =3D 2 * DATAOUT24, so on the IIO
> milli-degree-Celsius convention
>
>         scale[m=C2=B0C/LSB] =3D Vref_uV / 3140000
>         offset         =3D -273150 * 3140000 / Vref_uV
>
> The scale and offset are derived from the reference voltage returned by
> regulator_get_voltage(); its error is propagated as before, so a board
> that fails to describe vref-supply gets a clear read error instead of a
> silently wrong temperature. No board-specific reference value is assumed
> in the driver.
>
> The single temperature channel is appended as the last entry of the
> shared channel array and excluded via num_channels for parts without an
> internal sensor, so the existing LTC2497 channel layout and device name
> are unchanged.
>
> The LTC2499 latches its converter configuration from the second command
> byte and only re-evaluates it when that byte has EN2 set. EN2 | IM
> selects the internal temperature sensor. Because a single-byte command,
> or a second byte with EN2 =3D 0, means "keep previous", a one-byte channe=
l
> select cannot pull the device back out of temperature mode: after a
> temperature read every subsequent voltage read would keep returning the
> PTAT result instead of the selected input. Temperature support is
> therefore only correct if the voltage path also emits a second command
> byte that re-selects an external input.
>
> Send two-byte commands for all conversions on parts that have the sensor
> (has_temp):
>
>         temperature:    EN2 | IM
>         voltage:        EN2                     (IM =3D 0 -> external inp=
ut)
>
> The LTC2497 and LTC2496, which lack the second-byte mechanism, keep using
> the original single-byte channel select and are unchanged.

...

> +               case IIO_VOLTAGE:
> +                       *val =3D ret / 1000;

We have SI unit multipliers

> +                       *val2 =3D ddata->chip_info->resolution + 1;
> +                       return IIO_VAL_FRACTIONAL_LOG2;

...

> +       case IIO_CHAN_INFO_OFFSET:
> +               switch (chan->type) {
> +               case IIO_TEMP:
> +                       ret =3D regulator_get_voltage(ddata->ref);
> +                       if (ret < 0)
> +                               return ret;
> +                       /*
> +                        * 0 =C2=B0C =3D=3D 273.15 K must map to raw + of=
fset such that
> +                        * (raw + offset) * scale =3D=3D 0 m=C2=B0C, i.e.
> +                        *   offset =3D -273150 / scale
> +                        *          =3D -273150 * 3140000 / Vref_uV
> +                        * Computed in 64-bit to avoid overflow.
> +                        */
> +                       *val =3D div_s64(-273150LL * 3140000, ret);

We have ABSOLUTE_ZERO_MILLICELSIUS, use it.

> +                       return IIO_VAL_INT;

...

>         indio_dev->num_channels =3D ARRAY_SIZE(ltc2497core_channel);
> +       /* Only the ltc2499 has a temperature channel; it is the last ent=
ry. */
> +       if (!ddata->chip_info->has_temp)
> +               indio_dev->num_channels--;

I would do it explicitly:
if (...)
  num_channels =3D ARRAY_SIZE(...);
else
  num_channels =3D ARRAY_SIZE(...) - 1;

--=20
With Best Regards,
Andy Shevchenko
