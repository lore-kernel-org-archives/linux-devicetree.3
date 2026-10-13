Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D639FCD7
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894927; cv=none; b=BT+ivZsSThj8FARpYt+Z2uhtxgEiUU5OB7m12Xvz50JvfOzBRJqMeIwBhb6Fl6n/K9Db6tTxBqaANtGfAkQpQ6tGAJ7Qfuj1DGvOuDDfi+mhI5p3vHSxvth9/R+aZasLzEs3LYmSVP7e/5lnYYHUEVpRzyEaF7jS8m9YOpOicek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894927; c=relaxed/simple;
	bh=D5aocd7LzcUTTHKmUFRWoUuPVx4SWmW7g0SA54wCh78=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GqtiQSFsmfhzUWVUzIe0OJ2uxBf+VMLymj1y+uww6RcXDIU6MsVxo2Ccib7/yvqiLqxByuOx91SbgkHU3MtXxMhAXW/qcFOs59ZZ7DHdX8bNAh77xMowY/iE95rNlArM5c3hlxnHTooDVZ4dyIpktvtBniZtmUjDoAm2hd0Z0BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4ZZyqyJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4ZZyqyJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so1782997f8f.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791894925; x=1792499725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ah9kS2eOZPTjVhcN2vGZg1uNRYJuhJ0H56YtxNuvC+c=;
        b=l4ZZyqyJ87fx5f6T6jsGQlkaJSFAoZnipq7YyLo5Jb/ShuoboXcsvQuitMncNE1jTJ
         UJpxBoyIpXIXvTUSQs2lkvnKoo1hTf2YRCHb173eC+B1ksGGV8NKHrRelamqMGe0q8Af
         ncjDzMxuQnAqz8HKUUdJsqRU8pXJ3bENuw5f/k6/dsF0ANNKm0AI/+rfbE4WR1Z9crNk
         du7QaZDNSjsBO8JaaARiffOCu9AvwgNHaC2ceMa1lnTnBFmCKTNpk8nYESnyxcsy04X2
         qpqnrNbBDCOk2LGRxk3KLnLsw4sZoohw0TZXY3kgsIu7bp5hanDWh45ua8mzrNYbSf63
         FPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894925; x=1792499725;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ah9kS2eOZPTjVhcN2vGZg1uNRYJuhJ0H56YtxNuvC+c=;
        b=AlXAKN6n/AJrNheWvhVZIrpqY8ma/TGCx4Nsjjm8b6s2oOKVIQkb85q9IF1wWwK7QR
         H/k4WyK+OdhTEgFSB9lzbgzOLh51rAtez7vW9HVsWYzyRvxBuRjIyMjjxlMQqcRLK3B4
         gKjG2F+U8bCu83bREiuQ08f2UKWx5LdzSQit+jCuByJNDHdYWQoulbHC6Zr37GvYEnHs
         utnTig237njlP3Zp0iJ/KafDQSCXUKpCdbjzQBhIE4m5h9Mw++eimHF04oOaM+t8xMpV
         WGHm/x8xe2Iv0xYmAair0oxFx+yhea5arbqKWdwpgwTFBmXOBo+gvY7FMNZOyqRZD1NB
         JFHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdH6MJz/MfdRzK2N4Gbc4Mp0VsF66OvoDaxJxwpEmYIZ+5QwVgdpkB38caQmyzUmQSn3J4FlhP/prf@vger.kernel.org
X-Gm-Message-State: AFq9FYLoc9ZFjp07SJPetNNen2u5w74V0Elwh8vexqheVhyTII/BhLE7
	VNtCSbcIiwHEkUuOWXY0AKSaFQS37y0rXKadeXmHMxn+bHW15KJar3WC
X-Gm-Gg: AYBFou1ioWCAjJegklKcXkKE512eq6mvkVGkW+dOYJyE8hHoKJPQoSJU02hEAix0xd0
	9Gax4ELPi/iwJ98PfPRemLxhODcpfQ0r6LD5aUKMZN80mm0XMx9HcVXlCBS1h+aLt9B6QwfYDAS
	HFDoNcCNteRegBE14d7BzG6BA2mF2S2T55F7+WCg8EF0zZCY7bW6IJptmHRwEBozUm7Ed2do1NT
	2Jr8fmZ331aXYX5R1G6G4m9x1jZ+9GEAEwZTdyBNSoiDSPp4aq7SK25u2pVZaVGFXsuu7xVpFQE
	WfHE7CeCTNm1yY/xUPIX97OH0p9TEtVVbTUc8AqlZ341jwl+oi9oVzSBrQiAKszDoFkyXfXLVuz
	XQhdxwWJ3Rrbg8cCVsBgKYdUnEWGs/znn3X1DNt0JJakXmF4Ij19d/aChvSun4ACVo0UoSyXK19
	1irPUkvgANmOZfeH6rjpwFlXlbF49Q71AIesAkYPLi6vqanT3HKdfObLRiPTN7ruJR1cDKeyPyX
	pREL5a33Z970OlZN8XFajccUy5tHdfHOHpvFcMJtiPzUfBPpvQTc4d7ytLqgF+upiWsKVCPN0FP
	nsIb3S04KiL2XzLAwhZGCVBQVvejZfbSyHXS3zdJSX59AM4P9cIOYUSQMiMLkeq4HCM4m7wTZMm
	Dkugp78I7C0CcJDguJ+2R8b+xC6lhn3naqdfDgOG+RHmC67kSH6bGu0Dv5H65Quvc1a1AlrGyRd
	7GiAjX
X-Received: by 2002:a05:6000:2212:b0:488:823d:5086 with SMTP id ffacd0b85a97d-48dba6f5688mr22978399f8f.0.1791894923407;
        Tue, 13 Oct 2026 05:35:23 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967affsm4477888f8f.1.2026.10.13.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:35:23 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:35:21 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shi Hao
 <i.shihao.999@gmail.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <20261013143521.00006de9@gmail.com>
In-Reply-To: <20261013115639.167433-3-marcus.yu.56@gmail.com>
References: <20261013115639.167433-1-marcus.yu.56@gmail.com>
	<20261013115639.167433-3-marcus.yu.56@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 19:56:39 +0800
Chang Yu <marcus.yu.56@gmail.com> wrote:

> Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
> 
> The AS7343 is a 14-channel spectral sensor featuring 11 visible
> channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
> flicker detection channel.
> 
> The driver exposes 12 spectral channels (11 visible light and 1
> near-infrared) via sysfs. Runtime PM is implemented to stop
> measurements when the device is suspended or torn down. Power is
> never cut (PON=1 always) to preserve register values.
> 
> Future patches will add configurable gain and integration time,
> interrupt support, buffered reads, VIS channel, and flicker
> detection.
> 
> Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> ---

I think this is ready to be applied.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
