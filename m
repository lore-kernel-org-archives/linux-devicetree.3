Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA163DB625
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216729; cv=pass; b=q/bODaOh1dt03bMJuWqPj8NqBiTVJVoQNI1iiB1InlW4LZ9ULGw3PUGHjZ/B8BLslDZos/8bEpj5CP35WZb5kHsez4U4Pn5W/wozb3ZlMO9joEZCGBIT3FqwrD8tCjHQQJmDGH7yiB+j5jMhzM86/aDgsdqJlh+jzKH49hXX7is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216729; c=relaxed/simple;
	bh=ujJvXvjxxIbOEHj4Eme1iFctDbolQMKS+8+Glf19FY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hw8ZSTOXbiuD0rzcEDRk3wmOYxnyPtnqAPoBam2hFYfEt3koTz7P3PPNM0ttkABQm/AN6QWqdg7yKyb1itNtDOejAvjZnhbtUfM2yERZcZ/MTehtpA6DSVABRf0ZLlIJhI5pXGncGdTFnLLOIvxSVVoVfTSQLDMebfuKwSbWlCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=p740l7LH; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="p740l7LH"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66c83e34212so2549223d50.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787216727; cv=none;
        d=google.com; s=arc-20260327;
        b=dRWQFy0X3/W9i4L8obvTcZKRkRDzNXsT9ttJeDmdsr0c182uncwjgwMFPpWYYySTau
         GOAXjB/huCY3hDqswSwxg/fj1Mp2Wy2kZh8KB130758C61fvmcXPv6HmnaniVGB4hyji
         HVcdR8XpNT3nMc+CjfjVunKVJ6N4UAs4H9AdVuSLljW+qFbVuGwYk44TXWYzYR5onsCr
         MAQij5vlmh701x1zMP01aLHG1ppqH3ZHz3DNnFPpQ7TFx5rFuLCk0IoFIPCJ9dIFzde7
         tnFEtZbp7EyPscFnL1z+sIWwwrSMqH+wvBBjhaiS81E3vZ10fcHPJrQ8PmJl+H0PWX1x
         p6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1WzdsanpWGAxVKX7tDONARnJxB9o/95PB9+RTNsHDE8=;
        fh=YDu76AadSwtQiCeBLtnb2hEOFZFj2+VC8Wruxl8mdHs=;
        b=YvUX0tj6E+LyRbPSrU1WjCSXaczks/U1N++F9Y8TZ5GTHDx7/wJIn8dc/SAkLQ2qsm
         BpbsOwQ8OULx8XNYN0u/+hYUFckWQyKReEou7kJLK26P88doKYY+X4HYS3D1k1u201Up
         93R0M47PuS+k77Mk9H8zB6BotLgFfRLUAHIkcMoT3S1Cq4b+g+0Q8hxV+m7Vc3JbYwI5
         jQCZ7TdwiMRQ6/NkF9SHsp4Bu95HHckutkzvCNBbGYeJYN/zp/1xc6H87j7S1TEsJXH2
         aFhJwJEIHCOfsL5T7ubHduRSn+F73b7yk3LqAS/2f7qk48eCY4f0GVqTypGADSiAuqiU
         XD9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787216727; x=1787821527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1WzdsanpWGAxVKX7tDONARnJxB9o/95PB9+RTNsHDE8=;
        b=p740l7LHS2hPtnKYpghD3J0h0kWEPGDl+JpD2ZI85zeXT7tQu6NsD5PBIsJ7S6t8Af
         f8vdNCH/PZMv0xjM81JYmukBVAm1K1fyLpBN2yqDnUb3hL3WMbdh3SsmiWU0M9umARDE
         aEQAX0u7kQske2cYfEQV8ereJyaS1qdrXbHhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216727; x=1787821527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WzdsanpWGAxVKX7tDONARnJxB9o/95PB9+RTNsHDE8=;
        b=KTh3+JUhMVr/Lt3pU05J5G79C47DV3XGnyuEL4lLu8ea7/Dt9mP98lckKDc3O2smX2
         nC09OHbomaot+ta4z6KF4W1zLSLznt4nq4Hs6J1aTa+9hNaqnf+msCHP6S7sz/ddStKS
         l2R/GlJsx3CP8qm/tLBDZ/CFD2EfqT4SjzlMmM7V9n7WTs1guhq888wfGTDQESVGjadw
         2rgaJjrx+/yvNvlctLJvZrrV3KF/UX53nCT5eDDOAgs1cICcWbGwCZGoecfcRPd/2rvJ
         A/IT8tLUSWunDvaBStpzam5KUR/diX4M/BLsZAenDr2NoZ5XzVmDJuZonT8HDmMba3er
         VUNA==
X-Forwarded-Encrypted: i=1; AHgh+RrASbDNjXdtpZgcN2tNPaXgbV5SUOyFje07xrJO8mE/L4sG7tt18W0V3WfoYUhX5sxosMlvb12iryxu@vger.kernel.org
X-Gm-Message-State: AFuF++mudVRXcJ1fnRcE5mR9MxQM3ouZk+dgzb+1ow0LfhP1nqnUde/y
	aTxGQB68qAnvUAN+6Ns4dm4CLOzAfQgZYYnpXr7Wj3685NyC10ETMq2K5mvXlNhHtHq/J/tvI5C
	XXPHujYCfG+LqoVceY1cmSDmAEj1TKxhLj3tYtuWNXA==
X-Gm-Gg: AR+sD13I5FTKMZa5lYy2mhTnkqX2iVUVPSG+kSX9HWF7Vqz14D8jakqKtnhcUI8iYvX
	6VCynzcH8JkOCgJXZtFNuG0cFm4PVtwaMaRwIoUeYAfQUJmQKvz8S5sKw0v7CeyApsNA4tp9wgp
	vdPPU6/mWmrlKNtTkkpslHv1r8iutUYzBf9LdXhV3Y+wUAMZExCym35+U6Z+dseTy6n7zglQg8o
	HQBitbNIWfqTlv7SO//MpuVhaUyDylhn7Idq7qO9UirDVolU9UYJ3PrvdPcVknUrBKvghls22oa
	+8xzXG9KrANqE7ng5O8xFvg++hlJEUaNfFBL/epn+5med4/QHGf3PvaWkqGs6lWIMHKDs+jX2/k
	=
X-Received: by 2002:a05:690e:148a:b0:667:b314:aeb3 with SMTP id
 956f58d0204a3-66ccb6c0b96mr4398594d50.29.1787216726580; Thu, 20 Aug 2026
 02:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
 <20260715062201.3599458-16-dario.binacchi@amarulasolutions.com> <3db80a7a-e09d-40eb-b8ab-4110a5ac1f09@foss.st.com>
In-Reply-To: <3db80a7a-e09d-40eb-b8ab-4110a5ac1f09@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 20 Aug 2026 11:05:15 +0200
X-Gm-Features: AcwNN1UE6rpOTskPjzBaU3Z5xzziH-_K90B70QxjqV9m7M7C2xCsP3OCPL3sjkU
Message-ID: <CABGWkvoX5RYN5r4DbhZ1BUXjmwp-_08HBWKMGkX6cPNcQsyakQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v7 15/16] arm64: dts: st: support Engicam
 MicroGEA-STM32MP257-RMM board
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	francesco.utel@engicam.com, domenico.acri@engicam.com, 
	linux-amarula@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Mon, Aug 10, 2026 at 10:15=E2=80=AFAM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Dario
>
> On 7/15/26 08:20, Dario Binacchi wrote:
> > Support for Engicam MicroGEA-STM32MP257-RMM board with:
> >
> >   - 8 GB eMMC Flash
> >   - 2 GB LPDDR4 DRAM
> >   - CAN
> >   - LEDs
> >   - LCD panel with touchscreen
> >   - Micro SD card connector
> >   - Audio codec
> >   - Buzzer
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > (no changes since v5)
> >
> > Changes in v5:
> > - Fix touchscreen resolution to 480x854
> > - Fix SPI1 CS0 polarity to GPIO_ACTIVE_LOW
> >
> > Changes in v2:
> > - Drop the clocks property from the sai1 node in stm32mp257-engicam-mic=
rogea-rmm.dts
> >    to avoid overriding the peripheral bus clock reference defined in th=
e base
> >    SoC device tree. Suggested by Sashiko.
> > - Reference the existing labeled nodes directly at the root level using
> >    &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
> >    redefining the entire node structure and redeclaring the labels. Sug=
gested by Sashiko.
> > - Drop the #clock-cells property from sai1a and remove the reference to=
 sai1a from
> >    the clocks array in sai1b, relying strictly on the st,sync property =
to handle
> >    internal synchronization.
> >
> >   arch/arm64/boot/dts/st/Makefile               |   1 +
> >   .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++=
+
>
> Series is ok, I just have a question regarding board name. Why you don't =
add the "d" soc information inside the board name as it is done for others =
STM32 boards ?

You are right. I'll send v8 shortly with the "d" in the board name.

Thanks and regards,
Dario



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
