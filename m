Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3F43DEFFA
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777047261; cv=pass; b=B8yQdppf5TqrX9PWu7dYglygreiFkOFvalj3hdhxXqkxbtnnjlCgwe8vuAd/f1QJ5bXb6L2RHr92qc4CDolwhKdXc9wX7hpwaG+vCsPng5ucbrhZnBUDyrb2/zx23txnGvied+7tOw7HcpcOrTTCAc8Uzn56hhKDWw9mXtk8xsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777047261; c=relaxed/simple;
	bh=y9VWWAVf+sPSulQkC75TryBTQ6nOxKyoDww0ynpLHJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCYAMbMc4KYEND4uKjOPqfKwO7s0ZSRFtKkaIEBRb5vxuRthdCeeWM8qbgWDWKD4+FDREcOPvpiX+PI9sqWQj85imtwNVr3IDv+Th5f6ab1lTrT8PXlRyI8CgsDwDT+UW/6MnU/dsGRoeqEouEt4xiqEpAtW9NSNQ9sJRDf5S2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNgGTQkl; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNgGTQkl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d64313c39so6265260f8f.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777047259; cv=none;
        d=google.com; s=arc-20240605;
        b=iwImcxjuSGXDH5yb9y9tv6mwB1R2Azy7SUaYLF4n+2xKv1uHKlaSKDjBw3f1hcH8cD
         x6dRwSxjG3AzprxBw8G+qiWc1ui+mQQOVP4BwAqWh48EJJQi8LhNFg5FBsVvbwHD1NvU
         3dU9ESC/feUzqJ6UXqDeGjjfpUgfm9Zsyq5X5OI465URjbdhs4yzDTHkNy0ZadGWT+A6
         vUW6m8c3WKFwy6KPV7ousYjwKgEo87tBFLt790JWfaxdCOoX+8HWPDC/j6V7JhzETieN
         zeLVOU+ZG/kL0P2agFZPlIAwvJDTLw0uXophquS6X+ZLgC+voLyGAZ3DHqBtcR4wMsDy
         9xWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TfB9/Ilh4zIbPmNYOZ8Zqqkr1ypd91RjaVULTxad/6w=;
        fh=03AUBfXzsYXXKmxSOcZlrJTD0M+lNsFEyIzk0pE6OO0=;
        b=fRnH8TUYc6bFLhQqM7NMo5TN9wCwwZZyzBMc3ODQ8vccKG6X0fxZndq1jShpTXOA6Z
         UABujwgiUHW+XpYZdHdiWZ7G6CoteCCq8YaZ+gtfuJUjjoTtS/j0OFjKD5aCbcWynbj9
         dzkLo/O/H6JXEF768wzsCmjtW5Otn/GlDdu98/cBvaW7KFAKz1DLdI9RF8VMdmKoHXQu
         7Dr7yGlqVV/8Dr8UDZFfxVhoctQ3F2Z/Zz+AJ28A0o9+ISbpaCMcWaF1NRle9/4pqmch
         w7JHU7e2UoISs56fxx7FFgtbBsKemhmhDECLGsb8uXJ9j1UwnjS0nIN+TUIANzGl0dUU
         SbUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777047259; x=1777652059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfB9/Ilh4zIbPmNYOZ8Zqqkr1ypd91RjaVULTxad/6w=;
        b=BNgGTQklDRRb5IjhqKx4IiT8UftLlmBRs9dBcFjroiuIXepwlmddxWEcUr0+SQbPAV
         7CVX8LfQszYcnW6pNTCuUXlnn0JuQxg34irYNXE7pilyBEOVznZOa+//APnBzjXvhhpF
         dOYHPAmK/qcSjYrWNtTDGSPOh3qRimQmNWmPhDmyOySqG4W+YbG92o8FUwFZPIlZZLBc
         Go9ySir1ILK5pDkCgCKRLcHs1n/zElMZ5k7Mo0rIwhpXrsQPP/2piN0Qs1EjBWRWOtd9
         JH+tx1zWwuiN9DQEszaQ0usbE7MqX38iWqsmw+MwgaZ9nuKHEXthh43OXCCFrPtgoVut
         3R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777047259; x=1777652059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TfB9/Ilh4zIbPmNYOZ8Zqqkr1ypd91RjaVULTxad/6w=;
        b=p155ze2pgLRRYmnSJZ6I7+IQYTTTZLu4kPPFCTX+m/b5sPpDNtJc8AaR/jS0ImAUf3
         +bVtfMsfYEmaK1cD01msIcpoxljafAAuzNKKzCrCpMzM0fwRqGkBRebnPORgf2/ja/R1
         M56D49336oDaPP030K/SRgvzTsKvAcyMayMs4uG7AJRJ+4iLxMp6fMnYKCr0Rk7mEyzh
         EnbLmVLOO7b128VYS31A4YgeY3QQ9V689uDlvqRlx5FdTWtzJD6EQEoIMrblA6xqdZMM
         NZd4r6RUiW66T07n9tpWZ+CA6uhY0MxUBbKSpRiWnhCegrC0DRt2wqRMkbTgmS6Hg1M9
         D8eg==
X-Forwarded-Encrypted: i=1; AFNElJ/Fs9z4TT2mXKYZiS5wm88qOoMUWNuAuxylNYnqsMJzIKoT0pzk/l9a4LT2jppsC64eMufz7qfeNc6+@vger.kernel.org
X-Gm-Message-State: AOJu0YyY7qnoZ5Ge6+Ed/UiLbHo26t3D0eHgR38ZYD92IcyRV88y9HCA
	xbynEWrO8m7gZhrNsqqjQ10lxzpSj7JVSEwJtRRTVO7/qFjnq0xZbz2VKcmhIT0afDTr3N7nyBG
	UwnsbN7o7cQat4Bx44/3r30qcZK9MdTo=
X-Gm-Gg: AeBDiev+KctuF39wdJw2C1rKCltLDO3ETKekCl9HJMkV/aw1448o3jojgaMGwFmmMAQ
	ukzO2rCEhU93YEDwsKlIoao2sSs8UaobkNAS8P0kit5qhKW6GCFqzuFutrwbKnCn/JBOy4hjhE+
	POE6zfFWf3d9xdkm7HBbWd08h6FhRHt6Jwy90qZuvr9ghiJyqlPTXtaY4MHiYqYhcQWEsBWidUl
	6Zs5QvsFqkqIEcYtTMs/DvBjFGwfgxx+HpyRcPMa3OwvJ6h7wHKS+sZyCDSHIL+BX8gHG1sbuX8
	3cbggGGvS+PqNfkscXo=
X-Received: by 2002:a5d:5d0a:0:b0:43f:e9ee:5610 with SMTP id
 ffacd0b85a97d-43fe9ee562dmr45512953f8f.43.1777047258447; Fri, 24 Apr 2026
 09:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424072230.90354-1-clamor95@gmail.com>
In-Reply-To: <20260424072230.90354-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 24 Apr 2026 19:14:06 +0300
X-Gm-Features: AQROBzDQ8OdXSRPg-Esx4t8hyrkv8O_kTNFel6FIImhLjgyCRL8pJaptl9yJGS8
Message-ID: <CAPVz0n3osf5=013w7=EhJKNeYmrRNg_JT2s9a9_tKWL_teQm-A@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] media: lm3560: convert to use OF bindings
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 24 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:2=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
> Remove platform data and switch to OF device tree bindings.
>
> ---
> Changes in v3:
> - added note regarding lm3559 in the schema commit
> - lm3560 power on/off functions converted to be part of PM,
>   dropped redundant wrappers
>
> Changes in v2:
> - vendor properties swapped with generic LED properties
> - added mutex lock usage optimization
> - power supply and enable gpio commits squashed into PM
>   configuration since they are both required in making
>   proper on/off sequence.
> ---
>
> Svyatoslav Ryhel (5):
>   dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
>   media: i2c: lm3560: Fix v4l2 subdev registration
>   media: i2c: lm3560: Optimize mutex lock usage
>   media: i2c: lm3560: Convert to use OF bindings
>   media: i2c: lm3560: Add support for PM features
>
>  .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 +++++++++
>  drivers/media/i2c/lm3560.c                    | 250 ++++++++++++++----
>  include/media/i2c/lm3560.h                    |  15 --
>  3 files changed, 328 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
>
> --
> 2.51.0
>

Hello Sakari! May you please not yet pick this patchset if you had
such intention. It has a few slight flaws I would like to address in
v4 next week. Thank you.
