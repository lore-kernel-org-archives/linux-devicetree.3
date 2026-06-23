Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09BF3AD530
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 21:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782248657; cv=none; b=c54HWACZ2hamk/zEF22Zw0iClyxtwIQeYgZf1yBJSkuADkS0pwbFt6YmLYMPa67DB4h+shwrhFgPUimZyHLdgaTDBh+/s7v1tNHiB/XWaozNj6+/z2KiJGL1OaUJY8rIFRwhRcJAfFkbi/1z6lOZ6NOqZq9Z/jwmq4hozhsXcwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782248657; c=relaxed/simple;
	bh=G2O/RO+LnvNcHuRCY2ZDyqZgos6zxE4R7b3nGKbOZ3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iqd60xPD3+IjgemIIPQ2ntrEgQmDrEMSl9tpMFi/YtsbD2PlIHuYwCUJnlkOFQY5nWdFvy3DAylFK9+jhHzerLSXjZXNCUmAkAGmVj9wuIbj644+lz4ukTQ4HYlNOvx+dPmrI/4WWB2F50LF7TB3i+Br1LNPjjKyN47eZ3PoTnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pKvFbOV+; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pKvFbOV+"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-69de16f5e80so209225eaf.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782248655; x=1782853455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjxxtsMjV//5x1nEFpoBC5beYz3SbCaf566TA7ysPr8=;
        b=pKvFbOV+J4qEM1LQqOLKRuGrSPe+6kjoGHDBSbSdApV/FPsAGP/nkSRMv9yKCezW9U
         mKk5EAjVKx+RGaJdfV0WPY0PPXVde/VWD/SdgAg4i7gVK1wSsGLBb0aMZLMEnDKYWlVS
         FGh5QrZPKg0Ycmzn9QZZVXl0SZyzyDTihPcQhK9Z+e0slWqvmW4qcJCbVCwiFAJuu1R9
         k819Y6FN/LgIkOqCE4fqlOlBoJbItLPVmNKucrk+17QnRXDv6mjW8E6qVT/cLWhj5lYN
         ny8O+0V+yQZrljfEpdFMfyoo1NFrUzbndIGLj+uCWE0B53fyZUsPanJI84znOU+uVtv/
         P6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782248655; x=1782853455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjxxtsMjV//5x1nEFpoBC5beYz3SbCaf566TA7ysPr8=;
        b=GEKUbStT2533yQYdmm5xvDpiLtYRYkgKXPGl6IvX0y2YO96TNQKQ9Dcz8cIeH6fzZG
         EUHzk6QLe6Nxybnx1LWr4Bai3bj4wu3DP6S9ijHuJR/RV6Ka7K/PxTBE7VJdHQkWdWen
         HJv7or8+Y/tE50562fbwNrUftYGLSKxQTi2y3Meb8eZ8Fi0EpCz+2tLSOZb/Sl34Z1eg
         PR3NV7fPcSazfDzi9M5G4k0jthdIbSaPGo6FSAuhODHs7089eZrM8QGn5OcCnHwaZMqR
         MuG2eU9sXwGM3dzDSC0+tiBqZwFYsVANkbAGgQtYlvFJbbT2mPLWtutfPQiaEKMWc6pN
         2HDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HN4tfg6UghA3MLps9XqQiQQ6PTJLKoYQBPClcRXJS0hQ3s8ue18NCPMj/qSX80g3QACQfyKyT5bdX@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwoDcw4OjHG18cD5LSVIFm1Ey5FLT43qhBsqHr+ocoB2dNVgP
	MqcG1p6SFsv/f6jUc7G1hT6shdWYKicqhnoQrJFcEFN8MzZ+sLI+PL6k7tBqGBczFRQ=
X-Gm-Gg: AfdE7cnnx6xssQIBPNzrngocqprN8o7R8n/dDTBfkfFtY5PH7gaylO3HjbAtdZAvegZ
	onezbJktLOGeEqxyNJhLWna5onAqBZZa7f7Ebi3gH2VXZRfTQKwnggyUjymRM3478sOMtHIUWiZ
	Y/zYIBVfH4X+SW4KqFMzGH7RQxRMY5Xn4FpsEwcAYTctXMsZKVLe6UvpG9pppQJFU52sMjQn3dO
	s1M6wVBHMRMRoPNr5EkX7MIUP9cbKumU/UxVOF8bXn2aEJ92GF+MEwIzpsmWkCkZF8BXP5K3+8f
	LbKrRa69k2u+8GTYOJy2JYbAIitj3qGs5qH9uPdurb0ZG3oUD7O9QfBdfRHyUi+wv8K/okwy2xT
	9Ss/eBoUyo7pAYehykg0fkcsCD+ZWSeoaohO7AsX9Bw4J6nwm4avKKFtyE/j16k2piluuBmeoUC
	OjAf4G3wZjKnjA/i+EZXx1OlwtiUahywT6qzDu9NKmm9hcyMSru7OZzOyss8wDOVU=
X-Received: by 2002:a05:6820:2001:b0:69b:196a:de67 with SMTP id 006d021491bc7-6a122cece79mr392604eaf.0.1782248654734;
        Tue, 23 Jun 2026 14:04:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:68dc:b788:b3ac:e34e? ([2600:8803:e7e4:500:68dc:b788:b3ac:e34e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0ea0c378csm7162013eaf.10.2026.06.23.14.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 14:04:14 -0700 (PDT)
Message-ID: <0ca506a8-29d1-4514-b4bf-296fbf547513@baylibre.com>
Date: Tue, 23 Jun 2026 16:04:13 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] iio: health: add MAX86150 ECG and PPG biosensor
 driver
To: Md Shofiqul Islam <shofiqtest@gmail.com>, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 joshua.crofts1@gmail.com
References: <20260623140113.12574-1-shofiqtest@gmail.com>
 <20260623155556.13701-1-shofiqtest@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260623155556.13701-1-shofiqtest@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/23/26 10:55 AM, Md Shofiqul Islam wrote:
> The MAX86150 (Maxim/Analog Devices) combines two PPG optical channels
> (Red/IR LED) and one ECG biopotential channel in a single I2C device.
> Data is produced at up to 3200 Hz and buffered in a 32-entry hardware
> FIFO with a configurable almost-full interrupt.
> 
> This series adds:
>   1. DT binding YAML schema for maxim,max86150
>   2. IIO driver with triggered buffer support
>   3. MAINTAINERS entry
> 
> Changes in v2 (addressing Sashiko AI review, Joshua Crofts, Krzysztof Kozlowski):
Please don't send revisions in reply to previous series. It breaks
many workflows and tools that expect each series to be it's own
message thread.

Also, when submitting a series for a new driver, please wait at
least one week to gather feedback before sending the next revision.



