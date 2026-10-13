Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE464F5E0A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895006; cv=none; b=lCOHenUi3kHmybfar2iuZ/ZisqTapes4rcYnGM6DB1rqe53I+E33Zu8PtTHOOjMUsfr3S/SSxFqQ2YqZr5oN1JQQiK77y2UeamUSZ4HoLrhe0mJwVSj4f6Jw5eb08WkQHdKlTeG6j1Q2Ec1jsHSgO2MbadXsS2Hue1qZPIAoS0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895006; c=relaxed/simple;
	bh=iTqegItL46VZzOOmaKOWbD4dw0HLPDGa1sgVVAbiO/s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZWv/P7NzLf6gHgA3dHiX1HiQWhin/tooGvNur7ELf9Dr7W2Kas2DikiF9DwFUkYDDOlExxPWvl1KXM+2YSZeov2usqzf3zCT9KcH9jbZEe5ou6ufxRxHMEWrfcR/1Jpk3ESFV+EPwzNJWjObJ3+oIv9OyuxxploFTnytvCYpoZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0828nRS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0828nRS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b02a2359aso2735117f8f.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895002; x=1792499802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uTSmNl5owwJ6C1JNsqWpAVpytnSmw48VMmiRayPCI+k=;
        b=G0828nRSEeUlnOyc4KHeUotlZjd8svAZhfESRR7oZREuxfvP3crvhTlfdzXopE9Si0
         AURyO+ReoLFDJ0kLsCSVQfxn+Uar3eQcSmRz0FbRrB2BLa7ahyQJlLMwULYDn5ckhPZ5
         MLzNh6+HwPfXj7dAhYUeVRJTAWR2C2MnTmJyMs1Q9vhjpSIfalHCtfjPW7X+udZlY4tr
         4awrG9gSK2MCC93pXYb5ZFvHrFa/FDLbxsNHdYe1ppBvACpORqtBA81eHgRjGOZaeM9M
         OZhhmx/DLxC20rqz/02ywAoRNbSPGSdBbS/x69OX6QSOQJZBB6bdIu9bE34Ml5vmr087
         hBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895002; x=1792499802;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTSmNl5owwJ6C1JNsqWpAVpytnSmw48VMmiRayPCI+k=;
        b=ALfqMkcKQr8cWhc3hhLJDWOmmF22eu2YoeyqBBtHgi6ycH/G7+jCgCdPXbWoh+KAJR
         doohOp2f8Yr+LN0AmV3IOXoBk15ubpmOlduUP8UkxZTps7IvDonl14iPrhbefCEAedm7
         rB9dVIuoGIcp5xo1F2lqBA0WWfLUb5gULg8dmYUMV6NHRiyL2LTw8i0vr6+5r4n2MpJJ
         d4RexbWVVQu8jho2eSRtYaw2yoCeDbqA3Mnb/0NOGV5JaJ/9sjQZj+2o2GWTdD3CkVwi
         QkGlPCaTZV/CAvUTI1SxhIzK/CKDVpVQ+/Vvo82D7ahN8jKPlpQ5gR750RvZaVxAq0xc
         Ub7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz7CYCSvTAYQSWnNc7k8qZb4oxLzG8+IDAvTZEpvWaPwYIV34KEkiJ2NglORq9Ez5CRRAGt8l+dc8iE@vger.kernel.org
X-Gm-Message-State: AFq9FYI76xu3ZTna0NrRIoepuztqwRL7OIMeYEUMz1oKH1s4V0S8HRhq
	u02aPSacKRz8pHe6skotWToktssovY1nCySauUmVHYAI9XXZbCAqPEfv
X-Gm-Gg: AYBFou3QUJmV10N2HmgJDx2ZzkIe+wjV6pEqvdhosBm6JU7iPgb+115P2bXqCpz6cNs
	3WikSM1MMcqs7zJNi7B1UkZgUSC/cdEKz6aWk3cSqrCozGVdb+etnU7LyiehZ/HQxJP9/dh/L32
	hVU3u3Sd8DUjQkn4c8YhRVRExDO8EEufvKg04GjdM+AIXmi02+NUwnw9lvz3nO5ebTL80QEiEQC
	9L/6lFREmxIPCTwM1YB0KwLYeWBq0uKw87bPHa1aRbG+OCaPyluN9XF3+lgP0FPA2FJ3R6fEBi0
	IyrtXPvfvlVwsezrsBYzmm7H1AIU1MrpLpQ/IBUr1eFjfy+ejCeSqr5nVjOvo47fFhW3fvfSVUJ
	vnUCqcfBiZJ0L95it/brmLrUyKtBeE+DrhlEOLyLbBB4MCO33BtSU2m6ZqEaaOdkFhkAOW13c68
	CBUh6yJFTQ4SMn9nAEtAOBx5gRlOe4rdjd7AZLZFC4xbYa1pdUTBRjkRHKWNa5KwfGqREvOKUPL
	HAnd27PFyGhz2mWYPiEwLdTv3qil7w/fpuvsNllo/DdSXpDcr0cJ6Xbr2qQFOctve2IguEUZ3uG
	6iWOILoYcZABmPjUdDUHwM2LAvKfmFgNKyUJazG1IGzxfuBaPKa9QzFYqjfRR7QbLM4A2ZmcJa4
	dy1fZd3mbpanzQUIhGw8yBo4ETtfxSswcru38rjIQ8hQfU3bVQXQtkW+a1Jh+AKh30JAMVPPhQq
	GAmz57
X-Received: by 2002:a05:6000:186d:b0:488:8913:e64c with SMTP id ffacd0b85a97d-48dca34320amr17714316f8f.18.1791895000936;
        Tue, 13 Oct 2026 05:36:40 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7003982sm31222f8f.8.2026.10.13.05.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:36:40 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:36:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shi Hao
 <i.shihao.999@gmail.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: iio: light: add as7343
Message-ID: <20261013143639.000017b9@gmail.com>
In-Reply-To: <20261013115639.167433-2-marcus.yu.56@gmail.com>
References: <20261013115639.167433-1-marcus.yu.56@gmail.com>
	<20261013115639.167433-2-marcus.yu.56@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 19:56:38 +0800
Chang Yu <marcus.yu.56@gmail.com> wrote:

> Add binding for AMS AS7343 which is a 14-channel multi-spectral sensor
> with i2c address of 0x39.
> 
> The GPIO pin is not described because the datasheet does not document
> how to use it for hardware synchronization at all. The GPIO register
> also has no mode-select bit to isolate the pin from the chip's
> internal control logic. Exposing it as a generic GPIO could result
> in kernel writes being overwritten by internal logic.
> 
> Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> ---
> Changes in v6:
>  - Add a ref to leds/common.yaml for the LDR pin.
> 
> Changes in v5:
>  - Remove the GPIO pin.
> 
> Changes in v4:
>  - Fix led-max-microamp property name.
> 
> Changes in v3:
>  - Add missing include for gpio.
>  - Expand GPIO descrption to include hardware synchronization.
>  - Use led-max-microamp instead of led-current-microamp for the LDR pin.
> 
> Changes in v2:
>  - Add the LDR, the interrupt pin, and the GPIO pin to the bindings.
>  - Fix node name and unit address mismatch.
>  - Include MAINTAINERS changes.
> 
>  .../bindings/iio/light/ams,as7343.yaml        | 66 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> new file mode 100644
> index 000000000000..7fb10b0d4843
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/light/ams,as7343.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMS AS7343 14-Channel Multi-Spectral Sensor
> +
> +maintainers:
> +  - Chang Yu <marcus.yu.56@gmail.com>
> +
> +description: |
> +  The AMS AS7343 is a 14-channel multi-spectral sensor with i2c address of 0x39.
> +  https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ams,as7343
> +
> +  reg:
> +    description:
> +      I2C address of the device (0x39).
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      Open drain output active low interrupt pin.
> +    maxItems: 1
> +
> +  vdd-supply: true
> +
> +  led-max-microamp:
> +    description:
> +      The driver current for the external LED connected to the LDR pin.
> +    minimum: 4000
> +    maximum: 258000
> +    multipleOf: 2000
> +    default: 12000
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +additionalProperties: false

Should be unevaluatedProperties as you're using $refs in the binding,
but Jonathan could tweak that when applying.

-- 
Kind regards,
Joshua Crofts
