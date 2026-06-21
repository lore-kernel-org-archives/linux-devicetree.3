Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5811431F9A3
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 18:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782066789; cv=none; b=TVxg+aZKaOiWV+mbq2WZ5vz0ELlBt/mIo/+rXhhk+lA1L0ZGJ6xWZnbR2hl0nqML6Jw/xNp8W2RzeEt7YG77Mhma9sj2owpjZkASa9t42ppNpvyjjUw3hFc5mBmVI6Q3hDKvER9RAtbH675NcZpnk8J6Brpfii85rH1Q/wmOqfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782066789; c=relaxed/simple;
	bh=afy8gHu2UvcnSrWZy43cE4WQezTnCjkao3mbOBuVfwM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m65Bx4urBM50d8zhS+TMY4qtAmFmnHxbOPD0awSIqEOdpjx96fJ+8bB52dvyZWhDmxQaw6ED5aTX1KV31qrYyOLQrHQ2XfFR8ehc7g3or6J3SCGQjpkVU01DL5vxCus7M3S7n94uQgD1Kk1FG19w3EYUccKTrhXAsbmSpvlfNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYBP1+uX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYBP1+uX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso1635842f8f.2
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 11:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782066787; x=1782671587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BtFcftqMIozGzWy6CXRRwSzUeTjhCeJaK6U+BbNRPM=;
        b=PYBP1+uX1Hg/28OGJoyN6onBk+NOunEB5NEFx4fBFixRHkCSmLWFMjEZag1aWs7atQ
         43G4T/dRxQa8UUJFl2zYsvA7uaoBUTxy+J7bCg5sMLFer+BLAqDmL4N6GYAawQJL7NPk
         wUjZ0kafa1+5hCAa7Im8/I+J7zYpJqTnAVooRc0WI5ez3uOt1I7swHJGnucxNTRcudCT
         AuJUqvWx6Wre2ZKzDeNTnnqgViJAQbWebxTAzSVTuT+gWDFw7XRQvrsI+j2odZJZVSTq
         IEsXA4Z1rFY4bAlgZTXQtAmhaT/6OUJDGsVtaP/kenp9jnz58yFqxiyhXTUG9yKWFf8N
         DdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782066787; x=1782671587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3BtFcftqMIozGzWy6CXRRwSzUeTjhCeJaK6U+BbNRPM=;
        b=LytR8ZC4Hj7dHtlfycnwYyCG2uFMOBo/2zJ9hEmnqg979u18/nTRIWw5WhMTxmmHlW
         q8u5KyeNHU33VwJInDZs8KLi4TX1gCsG5PUGXkXhNi/QwYccjs+ewgAl5dQxysjPVDlo
         fnpSP5CIKQa6jzGyWMrIeYSf6Zj5ZJugwUkBTs9OHXNzVmnjn2J2hlsy4rbtBSsFNsMX
         exGDETN+KZl/4EWEeRQ+WaeCmLMuZdj2aX9Sd8deVcTXmqSNGx8LhBspBRH/E8WZRrkI
         EgjLoAWA+xXpicZgp4FCdwhcUdvA4cFJCp6yvwcYNXJbyQNZ+NAccbw14StJi69Y84UF
         r7zw==
X-Forwarded-Encrypted: i=1; AHgh+RruOl4P5NBthsjyje88xjJYS8wHmjPnnvj+PKElLE56WylvsQnMg1OhdYsVnW7vwxSF399NeWss0zOS@vger.kernel.org
X-Gm-Message-State: AOJu0YySRFLKEwCImmPyPpLnQPuTrPm/zxpBGbR79RPETzPRjR5V/JHX
	j7leedxUtjPIrTlUJYQnsChciyNz8p6vHqKj8S32gf2cE02eIsClxeYK
X-Gm-Gg: AfdE7cmwYOYjdKuLQ7hiz5Ab5xMETC4+h7pfKaZXp4uBfvAPU5wn8hsPCKHnLWYnVL2
	mnBNjQd6b4Y503ptOmV1dyvvnrYODEvouByZfz29NHwS+LfNsLwMukdA5zaUx6CS+kFDVD0yOLq
	eXvvvuEfdrEBMI0DusmcIsuqhJASjBWxxS9jPVWgRJX46fpr53hxI31irIV96stRaqjidTA4Z0o
	kf4U1T5+Rb1opUFXIo0UTZAbpMXTlRtBUbO1StPvf6uX0qtO/i8H+c6IXCsN7KGuLZbuz2ehHEq
	Of5ay0KLO767ETKs8jRc+vMCOfz2GKaWEtjrFuLc5P1r2TwJwlHapakSZKPqRRoFLmmM+3tZuYF
	mRXIv02nH16qa0yzqtW0+luVEJKcrwlkANjUYj1eoWhQyFHib6fNmSF+3c5tKf3Dezpioggne4A
	6jmULCGbt7TNKnR6OdkqgZjvRUmkmdd+Tu+63EyPCY1uT/I2DjCf6eKhivkBOrT9ALuZLuNis/F
	C6dBiv00ZiCPt9F6jAMlqXqdKB1jvScTVxabsaq/9dmMYveYKaE4DPUcp/NNGCluq/e3PdXFm5y
	+fkAFw==
X-Received: by 2002:a05:6000:41ea:b0:464:5df5:332a with SMTP id ffacd0b85a97d-465026e230fmr18615319f8f.34.1782066786621;
        Sun, 21 Jun 2026 11:33:06 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f563dsm17228387f8f.3.2026.06.21.11.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 11:33:06 -0700 (PDT)
Date: Sun, 21 Jun 2026 20:33:03 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2 2/2] iio: temperature: Add STS30 temperature sensor
 driver
Message-ID: <20260621203303.0f8c5d08@systembl0wer>
In-Reply-To: <20260621004626.66629-3-m32285159@gmail.com>
References: <20260621004626.66629-1-m32285159@gmail.com>
	<20260621004626.66629-3-m32285159@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 20 Jun 2026 19:46:24 -0500
Maxwell Doose <m32285159@gmail.com> wrote:
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/crc8.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/i2c.h>

I am a numpty as I also forgot to mention a missing
mod_devicetable.h header.

-- 
Kind regards

CJD
