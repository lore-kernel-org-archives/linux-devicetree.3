Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440D3ACF0F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486541; cv=pass; b=TLTxAitlPezq+A6Dz+aVs6UMXWh0ivUARXLo3ulc9JAec/0nw0iWNp1n7PDIniOHGTRMirhdf7gmctFmc/uFcj8cWJNMwdpJA9U7fcxxAJjzOlba/JOFysyUn3OOa9ah+zpOc+++mlATZR5KLk/9RmILZ8e+zHNHINmqN/5Y8/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486541; c=relaxed/simple;
	bh=hAvNwN3LdfvaDvVGl1LPpgogRMQ+ezfmubbeLc9ID7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gulqj8/t/JjLi1JDLajsvDB1RnsHU4kAXLFMzjRBC0SsvkNX8M4TFGT2dQNwyM2P3GVySTUkgir5v9uY4aNyMTaxFGE9OOIklIYCdDF3OOiis4A5t2Uw6KQqQkvVYK/FdhOeznG65FE8LcA12xfYHcH9tMFVvKNJ13ksTaVCvHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUkO44xe; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUkO44xe"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-651d6347a69so4087664d50.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 01:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778486530; cv=none;
        d=google.com; s=arc-20240605;
        b=RHbTpl7DTco9Qsm8HI8AjiMlmc3k0h0/FABaRU2C06jn0IXecD8sSNY4UNQjQxfePy
         iQSdlq/RCSs0mtUY48GY7OqnBX1T9U9j8Z8E7qDrBGLB3IewuIFldmyjxktsV6dRhlF8
         5AnUabEdQaYw3cPzSpgib4Q6rBwHdm3hHeIKbnAvO23LnuPj3L5hB6BCQNM083K2jxce
         382JGpoYfzPbvfNQ7oIGXoh4e6x+bikydJuGhL6Ob4uBGbBbIGwUfkPOEgTw1RGjzOkF
         L0VqA68Iv96tyCgCD1eZ8tHJUeoWdImn69LNra2754AwV+F5G/fS3oXDOpOZI42O61L+
         bnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sW6azkXa80yI0rJXwT2HYG22XiYQ/sn39R3AWBjjzho=;
        fh=hSSuEe4jvXl5wRY6rqLl0Yv+hN1KO3waRZ6bU7ZOKZM=;
        b=joZAd3wd1NWKXNWnj1w8GGC+qdCB2cHoW0ZRIfiGy0h5OMcQ6DqGVyI6h9enCovH18
         9sbDyjo/cOF/1PiJosYfzveEg/blwcrpz1sZ13bliiHV+urHlBJm6C7yU2L6sfQx/lnd
         h11iWjYl/qcikpfX+2srUzL7RSWGexEGEr1zG453LiC5CO3Yusjw2tq1hE6ut5uSQEsi
         YNbi9WHee21CacadlvrNCso7TXLJIRy3xIaePPWhcz2HOVf2IBlXOXbdogAoS0fu+gxe
         zN/V1efsCYtgzGMs1hhZKZEuv2iKLt+7aipMH1s4HYDxPWqdd4zHqY4ColnXl5h33VPZ
         MyfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778486530; x=1779091330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW6azkXa80yI0rJXwT2HYG22XiYQ/sn39R3AWBjjzho=;
        b=eUkO44xefUFP8aEssUo9MXyWjgm1v1yHWVLPH/Zbdfqd2B/O6cCKT/4ABqCzT7xUUp
         FO2H4Aj9CilhbibtcofkQakiQB2WgKqRXLfdeJg0JYsRaQOYHTYmvwzBjkgZC6cRNX9m
         CAqAmzVufJkP8xBZjiRMNKsKytiCEnqOKoqzANaQo0erh1HqIj4d8hQ7HNtuEWJqQ7FU
         rRZFBJT1dg1sLxdxRUHywmoSowkA6ibL3DH2wAjk39QEe7natmVTiMfO90Wx2OKvm1V+
         ZEtO4T55bQ8yBw2hrM0uxHJql1DEjN/EUIsTQHTVi9avuPayKye8iES/h18ROY4CxAp/
         oWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486530; x=1779091330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sW6azkXa80yI0rJXwT2HYG22XiYQ/sn39R3AWBjjzho=;
        b=roTGnz7oCEESdb993lAEWjqoI/qa2+nSIusy3KLGzac7AnnCiN0Kw39dRXq1GukbXt
         4BVpEIvLmkxTPHJ0yIgue4lEcnGAvxapzW+RHuddDwP5Cc2wzbskU6Dl7wV76/fvDdpN
         /C60+hnWl9jidf9Gwo2ZQmqdMrtwxxNiR+ahsbKlWVHGGD4th7gcvMjKtaGQQSTzu/FW
         um6V9Z8R8ukX/l6+RG7dQfeS28Y/cMhxG5T7If8X4rmAN3FmP0oCE8mvcR3ouGrKNTiE
         MbHZqDuElSgMkEKeUhhZ5C+xfktkoyWeuHTfhUuQUKwAcvALDOT85OsqPPAD9/IQz3cn
         7HHA==
X-Forwarded-Encrypted: i=1; AFNElJ8FFF7eYe1D55QAQdTVztAv0ncFbLuqNm3XFFPCDtTmUyGQ9x7oO1BO+/iNo1oZzctScH7vUqNuBUli@vger.kernel.org
X-Gm-Message-State: AOJu0YwRM25bvyAjDHtidhQOhPhgIOU3jlU8P8zbPywtOBAUT5Q4ctWc
	XLgu5rKxmCyfXvgcwjz8iadZrGOa3dvGPZ1Z0ThrM34RnSCcP5bQ2iTQItqJSDmP5Agl05ZCda9
	Cs93zUylNghi3nYKTAfQ7sLaeyL4wKaY=
X-Gm-Gg: Acq92OHpQXD/8q793bdnu0CgxRyh1SRBnmwLaH1kG423QTHgCMVuJqMD5PHNUp8RFVk
	2M03w2gMwRNOmU7TWqrQt5AGeq9QzyN0F61Hc1GQoCBMyyj7mFNIXfUQCBjxXiYe3v5JvU/zWVq
	T5zjPDQaJSJtk01pXPYDFLx8xADTbOPUsv5a9yap0xoLX3Kj6d/hDCcyq8G89kjQsw3pOQXvzxw
	mpxAFSoi2Xbl5rtz8uDpAIkU/0lZnxvVVLyLnDPmnuWpCWdmv2/zMfH1ckOqtIlovzksqBlvIOf
	ui6UBsDm
X-Received: by 2002:a05:690e:1905:b0:65c:6ffb:3038 with SMTP id
 956f58d0204a3-65d7e822e64mr13587707d50.17.1778486529994; Mon, 11 May 2026
 01:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
 <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
 <CABdCQ=OsPva9=YPdBd=3HW1OO7=_zJtpXjvaiA0WLEDT5Scs_Q@mail.gmail.com>
 <DICDTHYTPDSP.210EBVHTQ6966@linux.dev> <20260508225341-GKB3590877@kernel.org> <20260508231051-GKC3590877@kernel.org>
In-Reply-To: <20260508231051-GKC3590877@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:01:58 +0200
X-Gm-Features: AVHnY4Jd8hC8nSk1elUyO1V0E_fXdX8QCiSMcWMOA11otgjNrlNzYjy97ZtHNls
Message-ID: <CABdCQ=NFuW-XBK2zrw2TUFrEg0Q1Wf3_qS28zT3v-Hfud8mkew@mail.gmail.com>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
To: Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
	Margherita Milani <margherita.milani@amarulasolutions.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El s=C3=A1b, 9 may 2026 a las 1:10, Yixun Lan (<dlan@kernel.org>) escribi=
=C3=B3:
>
>
> On 22:53 Fri 08 May     , Yixun Lan wrote:
> > Hi Iker, Troy,
> >
> ..
> > I would object to add CONFIG_I2C_K1 as hard dependency, the reason is
> > that the spacemit sdhci driver (sdhci-of-k1.c) has no used i2c
> > api/function, it's just need I2C function via an indirect requirement,
> > which sdhci -> regulator(p1) -> i2c, besides, from the hardware design
> > perspective, it just happens that K1 use P1(via I2C) as PMIC, it's
> > totally possible(even in theory) to use other PMIC as power supply
> > control which may not be I2C interface (maybe use SPI, for example)
> >
> > If we want to solve this more gracefully, I'm in favor to add explict
> > option enabled in defconfig..
> >
> or I think it's better we do this way..
>
> +++ b/drivers/i2c/busses/Kconfig
> @@ -794,6 +794,7 @@ config I2C_K1
>         tristate "SpacemiT K1 I2C adapter"
>         depends on ARCH_SPACEMIT || COMPILE_TEST
>         depends on OF
> +       default ARCH_SPACEMIT

Thank you all for the feedback! I agree that enabling I2C_K1 by
default makes sense for the user experience.

To keep this patchset focused and avoid cross-subsystem complexity,
I'll send the I2C default configuration change as a separate patch to
the I2C maintainers after this series lands.

This way we can get the SD card support merged without delays while
still solving the dependency issue properly.

>
>
> --
> Yixun Lan (dlan)
