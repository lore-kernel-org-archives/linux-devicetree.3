Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E5F3B47FF
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783784947; cv=none; b=aa3tSRP+I/1NRJIaebcwkVFZ9891Vlj7mvF4zMr5tgc/+MqO7TG/opvTsvCzQf+wNQmywbDl4sWZznC663sg3An4CkWVou/jz+fgUlyraok4W6JNHrnGlUOWEEE40o86mFvKOKzI3Nk9JXcL6uoX4F+bH9Xb0ewJAhhZR61Iwwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783784947; c=relaxed/simple;
	bh=cNxVYmciaGx0HxZhzCE6dp9hIUsKTjqHkSJazoMby5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HjWM+IfjjHXpniTAcp79VfD0B0Y05EaZIPQmX+eDo6B/a/gc85+OkJogdhpp+O6HVJwhBemG3I+r6OXBuzHisxef17dIxIDZ93zqJeczPxAnFNCistFT84YpEs7FJUV+shcgvE/O5sFoFEui3ZbtXjFxL/6R1vgqIJ6Bd2huxn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PV1kHeUZ; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PV1kHeUZ"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso779195a34.1
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 08:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783784945; x=1784389745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBNOQnmDXwx/WMHGnaOrdiEo9LQa60JbMecTtADGoTo=;
        b=PV1kHeUZCweRq5mgDup4P++nr8R8A/ao+OgSrW8uJ8qyvrpCa0G2FALhS+ViqjI0qA
         F47YktZ1+Bv0UsczXggpfVY0ZAWxkRQWUbM9VbAeFKSFGhWLZXSebNhB8wnsOy4XD3rY
         9Dzogte8lJ5S6Hu96jin0+ZnLX3K/YEm/d70YOqeR7gy5OGscN0UMjd2lfc1vBwH2v1C
         moLlqQklHCGroUUEwaT/TDg0HwOZF42lLvMqUqc0nNlVa5ai9bUchxa0RPMUf1dbeOGt
         YFebizaCHFkeK6PjlyERxNBc3gFC6tCsuHsrBN7QqaDRtAtxvpxCMclneB2vJp1KvyU5
         jS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783784945; x=1784389745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBNOQnmDXwx/WMHGnaOrdiEo9LQa60JbMecTtADGoTo=;
        b=XUnNTwzStZjMRmSGTA58pYBD0IFknfR7OP/MIOIwb5EOvFRHOAN/p/8h0A5xqu7sx8
         Di4R2jUURKQJzTOaBFuKZuzW8RAcNNgu5yytQ2dzbXLmgGbUW6y36Y1e9cEFzYiu3T1c
         gVYA5j8EQacxsK8wahxjn7hBzM9BzqeMz8m4/fySrel5IZzX4UXgKlTOLf8LvVwlIFgQ
         7eXgRUj5vAG3kSLK1gQvO7Hm6gilw3/eW079tlxL8GhVjrWnUzE+xSKXu/4XReiGi9y+
         2BTU9yt8Ml17v4LU6cjeTlRXkLDVc1E6iqNF7NepiPQL2kw0As+WDoiySP2/Ri3eDx+A
         9cIA==
X-Forwarded-Encrypted: i=1; AFNElJ/pd+TBm4fXkHE63/3PILJGCKbg/IrssMmPvd7lJpcgAOrbgogQg5jRhlTc+9UJG9bfxjfqPSINUseK@vger.kernel.org
X-Gm-Message-State: AOJu0YzhMl//8oYIGMEbIpJwcEhN7ZYtQmOs1GPJnHuGZSwKHDiEF6SI
	VQpTi19GbW1XhqdZTb4/d0CiNZz7P0sTLvlC5b3prKSTYVJNnx95H5QWjVCV+sSonAw=
X-Gm-Gg: AfdE7cmddYdgkgvM8r21AvV2ZtQoD2VxG8bkxeown3uUnwbqTsj7WZE9tvqYwiAFHsS
	4hDTce82/F+csH+1xLWGIo3bWNlQYcWGUlhmOIj0kYax7wuttIXWCGH6AIV8Qvd1PKHhrahVIhH
	xDqJycfOhPuY45Bli0aMCnn4GmcYwaeHzrf5VodUPyOU6QFlv8ESf6q83ZO7n7HjzGLcVdc76sF
	tAaOiDwfA0gvafjaVMmMC9DmDDAtwTRECNdZoy7diLs9E13GCv+EAIUFQdmR1wmjbiGWfLEgS6F
	pmeFqznwUs4nOs/LgU26SXs22ZWT5PXffYJB+ypxVeRf4UE6j8ruuibkoxHPVCO/r93AwXgc7Ut
	1wgPS40S280TDNqZUybKFSwQMoAK4/LZaYkkS+TsN9l/aZDJBW88il1g/+RE4Useoh5Q7tQ0aPE
	6lHOM6pY5oOTbhKSf/bwCe+bbwEQi+xlrqhrE/LZ9zFQdvKwlNhIN2N0xkdGrTPu8=
X-Received: by 2002:a05:6830:3e03:b0:7e6:c819:22e9 with SMTP id 46e09a7af769-7ec097acbe7mr1938308a34.17.1783784944833;
        Sat, 11 Jul 2026 08:49:04 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a950:74e5:81f2:8c89? ([2600:8803:e7e4:500:a950:74e5:81f2:8c89])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm8657965a34.0.2026.07.11.08.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 08:49:03 -0700 (PDT)
Message-ID: <d0d6e0f6-2b6b-427b-96be-84acd49bbac7@baylibre.com>
Date: Sat, 11 Jul 2026 10:49:02 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] iio: adc: Add support for LTC2378 and similar ADCs
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 julianbraha@gmail.com, marcelo.schmitt1@gmail.com
References: <cover.1783629101.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <cover.1783629101.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/9/26 3:49 PM, Marcelo Schmitt wrote:
> This patch series adds support for LTC2378 and similar low noise, low power,
> high speed, successive approximation register (SAR) ADCs. These ADCs are similar
> among each other, varying mainly on the amount of precision bits, maximum sample
> rate, and input configuration (either fully differential or pseudo-differential).
> 
> Patch 1 adds device tree documentation for LTC2378.
> 
> Patch 2 enables single-shot sample read with a GPIO connected to the LTC2378 CNV pin.
> 
> Patch 3 enables high-speed data captures with SPI offloading.
> The setup is similar to AD4030, with a specialized PWM generator being used both
> for SPI offload triggering and conversion start signaling.
> 
> Patch 4 enables running buffered data captures without SPI offloading.
> 
Nice to have this split into reasonable-sized patches. Makes it easier/faster
to review.

Reviewed-by: David Lechner <dlechner@baylibre.com>

