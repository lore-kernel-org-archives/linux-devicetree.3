Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8766D282F0B
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774132755; cv=none; b=U4INM3FIfIv8qo8E9zBjK1t3+Qr4Pu05KElaAvRwhcWSmx80uRZ8wsmZWiQ6Tn2txoA2vdIPpnno9nyHUtZyytii9j2YNvqhGKSIdmPEleDo3N+k85ELbXYkOCw5HirWuWwUeS/dVeU8xRs/c1ftT29bXaq1/Fu4lhXcRXlB6qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774132755; c=relaxed/simple;
	bh=tCOkiwP3pijnaqh15oBnF1Bom8SOKIZWDzHWvDC7Iuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZfaG4m1IuZaCXBo6r2TOuOVqObDzbcYeEn2TSCiE4tEBtzQIxaTO0TDcAY1V7ImXimD8ZhMDqNtW5R6mcye23z97jx5P+meaqpEC296v0jWnSm5xHt/49i+Nn+Iz95XzaJnV6XFs49LEjteeTkTcwC6RYm1LaWrFzOsARR/uzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ca6595c8aso1379207d50.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 15:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774132753; x=1774737553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dwPIAwzmIqLH6UY5qG7+Exq5GeZYYmIywMuNQZPZybY=;
        b=Ql89UQZjBMmRcYV0ce+W4Kh67D18qWZ7wGZVlRjG7JLSzQXB1ld8IHZ+HtZuJajQ13
         a9OsX1wfoH4ernswTPWQWV49kqnf25AeJodFWkqxcW2jShYxM0iSHH7hOqynlisOtB2D
         2e0whhTe32Ev0p8m2PhnOm4fp7X6I6oom8ezDE2MGL/RcVHvR6l+OmHqrqbDjFZXZNBl
         /WALA/HJeGoKrkdNr/Kl4WrM6eYJngvPfc6vh3i/WfT+oxUJUZ7ZBwN/OwO2PMnHAASX
         IrFYHF0AwIUI61X9e89CJ4WfPbxw9A6h2CIHM22t/XU9xp3QAinpGBwURN8+0oYlUeZd
         S4mg==
X-Forwarded-Encrypted: i=1; AJvYcCUJM8vMN/uhrsOp4k+0MKy6l9MMkWqWTcfyx/q7I0XlD2Z8fQXb8poqYi/vaC7gAkpGCjnVRU+oC0gx@vger.kernel.org
X-Gm-Message-State: AOJu0YwkzSiZbEwT7jo78j8q9pOpfyqGhhjDgOccTu6zd9ZJ3yde7Xwi
	vHIKc4XdZYOFa4kmYbyFBTUvK3VX7m82ytADdN96z7QbETPkovGnJCgd0ag8k/Kb
X-Gm-Gg: ATEYQzws1KPfWAMz+GTzXRIH7VF1U5Q07uyUhGmvFdZJYsLEr8qTjnpm7PmbCTjLASV
	d6UiE/giOzjCLFAADAu1jbzSxo4scv2bvWNsThFfgAXDfh0AVHTgWv3Wje9GnRua+4bkBDlyouW
	uIc2UqlCptdWBnYMz4Tj5DayA0ciB/cG5dxEu5R4nW38bkofDrGOofCFqH2Y+es49LMT22Ns39x
	0UcZV7swXCrEAgdnIkG9ABzI9AyMmeyJqauSXDMYbJ+1Nr1Rvv7P6OC/NwMfGMmVSahUNO8LDjH
	YzCrlKdysjOA5lVS2/tWyxC5tMDcPWWsnMrdN5eV41CIqz8GYVSRGQJSNgBoWKyAF70hJwVPq36
	bk/mVxTtw2ueYkX1EikVwKUYOjJhHNX5sGkwU7qq3iFpApBiHJKB/MaMI3oO5sasPV6ypihKOdt
	cSWzwp5hANTT5IOHWjGqdB3unt59QOZYtPIA8Jo/03e/5Lwyfww2SdtqHsgBGTbJb0ab1ivpe0e
	VsbcEukd6T1sWK56kRWYUwsZct2FfG+xyV6O5LSonoi7w==
X-Received: by 2002:a05:690e:134e:b0:64e:a530:e4b8 with SMTP id 956f58d0204a3-64eaa71bfa7mr8173572d50.35.1774132753426;
        Sat, 21 Mar 2026 15:39:13 -0700 (PDT)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com. [74.125.224.50])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabe9fda4sm3841253d50.16.2026.03.21.15.39.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 15:39:12 -0700 (PDT)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ad8435f46so1883058d50.1
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 15:39:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWz26sKkUSx0WDnifmALg4hNYsGM4k7aJ6ovP/hamwTI03pz5MwqnSkoIpOXvbd8JKMmTjErBDet0AM@vger.kernel.org
X-Received: by 2002:a05:690e:e86:b0:64a:fe95:2ba7 with SMTP id
 956f58d0204a3-64eaa712f35mr8023751d50.31.1774132752611; Sat, 21 Mar 2026
 15:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319190738.151614-1-email@sirat.me> <20260319190738.151614-3-email@sirat.me>
 <8502eb51-53c9-4f1b-92d0-21b06fa4802e@baylibre.com>
In-Reply-To: <8502eb51-53c9-4f1b-92d0-21b06fa4802e@baylibre.com>
From: Sirat <email@sirat.me>
Date: Sun, 22 Mar 2026 04:39:00 +0600
X-Gmail-Original-Message-ID: <CANn+LWJEJJoGQU7p2P2GrOcA_g2x7jEnvjcTJYG1hDRUnRw3UA@mail.gmail.com>
X-Gm-Features: AQROBzCOkEeiyGM_hVf24EiN9zU8IMOKL2dZN-mIO8VzxzXIw8q8QwSGY8OpiL8
Message-ID: <CANn+LWJEJJoGQU7p2P2GrOcA_g2x7jEnvjcTJYG1hDRUnRw3UA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] iio: proximity: add driver for ST VL53L1X ToF sensor
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 11:09=E2=80=AFPM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> On 3/19/26 2:07 PM, Siratul Islam wrote:
> > Add support for the STMicroelectronics VL53L1X Time-of-Flight
> > ranging sensor with I2C interface.
> >
...
>
> > +     ret =3D vl53l1x_set_inter_measurement_ms(data, 50);
> > +     if (ret)
> > +             return ret;
>
> Could make sense to move these into vl53l1x_chip_init() so that probe isn=
't so long.
>
These are kept out of chip_init() to match the ST Ultra Lite Driver
init sequence.
Init only covers hardware init and VHV calibration, distance mode and
timing config
are separate user-facing calls made after it.
>
> > +
> > +     ret =3D vl53l1x_start_ranging(data);
> > +     if (ret)
> > +             return ret;
>
> Why start ranging here? It looks like this is controlled during buffer
> enable/disable.
>
The VL53L1X (unlike L0X) does not have a single-shot mode. So every
measurement requires the device
to be running (Autonomous mode according to the datasheet). Starting
ranging once
in probe allows the direct read path to work without any additional
start/stop logic inside read_raw().
This keeps that path simple and low-latency. The buffered/triggered
path independently controls
ranging via postenable/predisable, so there is no conflict.
>
>
I will address the rest of your review in the next version.

Thanks,
Sirat
