Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BBC3E3D9E
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778949623; cv=none; b=QoCWDzEB0ZF6RSgIjPkJJyVVtbfoXxGiSwG5xj0UWXdPgfI9arDizdCVEWsKHiJKTPBhHiVJgku2RaeiUMYZRi7+tRWCxpN4ssHYDymPG3+DQGaEo0418QGik8/jJLIVFEEp8MpsNL5oIYB9IGg57WHwa/cna0p8FxD66VfLJkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778949623; c=relaxed/simple;
	bh=CdqJEGbSPF3YjVUNwmIAWhJJsL06rr85axwqdznAgzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZM7DVKYKqjvv6rNXIHM0QBDrwtbK719nx0+VdY9F/SsWZME/ay3H3111gxT+def9hyPa6J1/3xo5pH74CEl/nXdKqbK4UOdGzUUGYuoIVKs5MMAzOqrzctyQxTjFbn1bOyzYKRSTsleDY2TDF4b29JyxAHnX0DHuXuHuE9mInc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=zCtnHhv1; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="zCtnHhv1"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6948ff6b006so349134eaf.2
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 09:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778949620; x=1779554420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jm966xj7zPGPn8amxpVaRSTtZJqzq+SHHS0XJfx6jk=;
        b=zCtnHhv11odmQgIWUhL+wGwI4/6RmSyjXuvnhbcoGP64Q59oBVsT0Acd59DCMYJeOG
         E5s7egY1HKJYmAvAQWBg+p+YweqJw0WYX0gssePv4mbHHVLIyGr6T5tKJFWfYP0E056L
         MwwgMscCiLczmIiIsuKJdG7MXjWRqmi+QVNAmg5Y6Dt5VWkINn1AhJtAFqoqppc8WuS6
         wOiHC8+y4/ytIF5Gt+NiObGFA2IAt5R2MWZJAkQlMfAheSRrGD8W/ESrY3/4LzV96RbA
         iZFvhNoptuyEYAHM32bV6zFCUe95v5RTNMqcZRWFTYD/Y+1BYHTQdpk6DBl1eP6C/B28
         R4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778949620; x=1779554420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jm966xj7zPGPn8amxpVaRSTtZJqzq+SHHS0XJfx6jk=;
        b=OPpaquoWJ7Hu6jXaDtu9Z4u4MJHY2t/VTQD8kcQmzjFBBcEIP/kyjW29Bx+7bo/17O
         JH082xvlvHRK+0WZ7HGMMq574IExWbLzpLDsoXVLWM8S/wleeJ9zxGNZTRjls8gPpSgD
         DJ9BSSoj0WHLn3GgPpieoenwAMXQgmE4lYGfGKClPdMQtR/nPbVwak9lBQKWAAVJBJnF
         vMA0Add0b3qyIZuxAh/FdS4kQYiayWFGUFHNRj7uk7cwBetGlP4E8jpk+WCJWz/8AZrW
         CnrLlUZspBN+gwOFz6K7BfpjuJApyfoNPNUQhQcHcPTEeo5I4zzz0KrX7WBlQ+z4u01Q
         f18g==
X-Forwarded-Encrypted: i=1; AFNElJ8ttGaVPUem+v2NU1Gcp3aGAk/7OAmzTiFF4/MemnBsxCJu7XgDTsyhLhxTtn8yEeIYoSpPo9ERi/E4@vger.kernel.org
X-Gm-Message-State: AOJu0YxZL87+3k7aQv54S4Ld3fO7/dEBba78cpK1zsjG/3kniXf/RMox
	utI3K+fzK8gYYDXZRJ96FyX55OvXVb7pDOn7G20cb3H43SbKYMTX1XkXGA8kORznST8=
X-Gm-Gg: Acq92OFDDvT/lzMtdtWngnvqmfnkn8gRvhq8cRvmR9J4RzHowFDc/OLv/OmpzUsM1Bu
	rSfZq1PpzB+QjcRehqWrJGmhsR4i3gbXLoQzWVmpLN1ZTfLAIF49qIUWQVTH9rsNtffm9I5jXWg
	ngQaEyHHvHRZVtx+afAh/1HHb6RXdqGYic/66MDTJvWZGS5j2f1Kl8X06B2xtGhEUlDf0XwXvJk
	fby0e5y9jr4f5gAHFSabT9beemGDM8ceOZiMRqxAehsqF2wwTAqmakKZgHad+3EsI+juJ1MP9pd
	6XCVbYbu6ZHazCnSbHxovJWxuGfSaDJciYGB3PaeVa9pbIv3rj1a5TtHgYhDO0i4M2WNC48Ykxj
	A+aRo4UQ1DNRgorV6Ioe6ps5C4jd0ApPbL+VV/v1kWrvumPLxUT3yI2mz+Xq0k+tIpWt0W2GSjF
	idLGJ4jRkeGECwZqM5LeAatnIJWgwzJUu8tCAvEoBtlapT+fPGAtAzA0txjmto3ojQO8CkUlxvF
	feAcSTJXcEI
X-Received: by 2002:a05:6820:f034:b0:69b:5696:e518 with SMTP id 006d021491bc7-69c9429428dmr5894777eaf.2.1778949620026;
        Sat, 16 May 2026 09:40:20 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b36d:bd18:7c02:29e2? ([2600:8803:e7e4:500:b36d:bd18:7c02:29e2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d041da4basm2702766eaf.0.2026.05.16.09.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 09:40:18 -0700 (PDT)
Message-ID: <4c1b2887-1e95-4723-b42e-329ef5b1ee90@baylibre.com>
Date: Sat, 16 May 2026 11:40:16 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] iio: adc: add support for PAC194X
To: marius.cristea@microchip.com, jic23@kernel.org, nuno.sa@analog.com,
 andy@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 broonie@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260515092946.10791-1-marius.cristea@microchip.com>
 <20260515092946.10791-3-marius.cristea@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260515092946.10791-3-marius.cristea@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/26 4:29 AM, marius.cristea@microchip.com wrote:
> From: Marius Cristea <marius.cristea@microchip.com>
> 
> This is the iio driver for Microchip PAC194X and PAC195X series of
> Power Monitors with Accumulator. The PAC194X family supports 9V
> Full-Scale Range and the PAC195X supports 32V Full-Scale Range.
> 
> There are two versions of the PAC194X/5X: the PAC194X/5X-1 devices
> are for high-side current sensing and the PAC194X/5X-2 devices are
> for low-side current sensing or floating VBUS applications. The
> PAC194X/5X-1 is named shortly PAC194X/5X.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> ---
>  MAINTAINERS               |    1 +
>  drivers/iio/adc/Kconfig   |   12 +
>  drivers/iio/adc/Makefile  |    1 +
>  drivers/iio/adc/pac1944.c | 2172 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 2186 insertions(+)
>  create mode 100644 drivers/iio/adc/
Can we please split this up into multiple patches by feature added?

We are already drowning in reviews here in the IIO subsystem. It takes
many times longer to review things that are not split up into bite-sized
pieces (aim for 500 lines in a patch).


