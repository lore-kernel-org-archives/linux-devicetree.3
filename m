Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271146;
	b=I9oukiG6Vr5S0mI/OSXh9XA/qkiMHVwJ5JMqQKqZVtuilCxbHx/ONBBxC+G+AkiULHyb
	 Gn/StbvukkDEs2g32jx7EszMJqH6gvRwqrW+/vwpvr2LtweCDkTbj8RZ1EYYudEWzIy1A
	 1degFIk4ruksOY8VnvdBNlKI8cb3L05kesqHS23s7rHwv+/HwJSUEMIcMZrIjz6YXxNZI
	 BNBE8lGlfy3L9FCQnzVYBK/7g4Y6Wpw9muDBtAZi+uNteVH/w15sJ47+09Tiz16dJrI2l
	 zXHIcviVuV7F8C2AjpkP7dls5YnEoLS0Lpd4JhoOPRhr3xCq9JWuJe7L2HTH4SAQ8jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z9CuJJHkbbNNuzLS3GGtdXngJnS4fF2IBPDFiplXDVI=;
	b=ntbzKHC3eYELmGebC0QbwGDMV03QvFa91D/WLmahFCeZU0nbnzaJqK4u5u4JLJ4zygFk
	 FWxHaF52zBkwyzZtMrNjr31b51gqae4sOoRIplQRBPOWGQGtFOGWj4von15rTSyL7BxQ/
	 2NaAVYw9ic2sHU6P+XiEa8aQ/aqlN2cEKk/eqbn0iaS7ms9fSdBEpSCuyrIGHbXscJKJV
	 h0lT5DvKKCshF6jQ41HYk6eC39HP+p1muiJNj7MIvlav5YJa4rjvCjf1I0lKQ31dVVYp+
	 CaiIfQ8qTNiH+6RKQHZKBlMmpZcYDODimvG8T5yjGlxnGSVmOGg5dLuuv+HC8uO5+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsYvEjgx;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81925606A32C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81925606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsYvEjgx
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1751215f8f.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271145; x=1793875945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9CuJJHkbbNNuzLS3GGtdXngJnS4fF2IBPDFiplXDVI=;
        b=PsYvEjgxQzAaHbqnKMmKaATrRLL3eF78bLWpfKuowjhm9iKoiYVq+QgV27M271RkK9
         U0lV17SWE2FvHqBV8dHwPsyXM0iiPfahckMTEUjM4vepU2oEIRv9h4vPrVWCSKYV1e/Q
         z+ZYVBCIu1iWfyuTGFHun73FLD3PUyseydCFA8M/ACRg1UM6cJVeJLDl7qbu4gZLm+mP
         CKCsKhX/rc/bgD7Rrh9Nx3+81uQ53QlJTEjJ8mXQQNAIz8NvC+rBbb6CXewLhr74D48+
         Z7iYe08xhjdECnx0favoECnlXvKP1cL5eaJ/P8Wy9fI9htrlCFYOlNLFFQqZ8T0v9Z7z
         Salw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271145; x=1793875945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9CuJJHkbbNNuzLS3GGtdXngJnS4fF2IBPDFiplXDVI=;
        b=W+Rc9aW1HImzJjcPKJ8EAdOr5ZfXobpSQDecS5OeJemTgiAJ1pVcLB9e7qDeH+iifb
         pt7gasxxeObpnGIVAbJ5i5e7tURA+T3eI4Jlsf4JVroYaw34RB2dn7PuswOf9M8BRl53
         C+hZ/6656Ef2uhhBpAjZAuVoWSuhQxhoYIhuuP8Zi1bLcOBcQC64TeW/gvtyNBB8w7f7
         I3lHHXN+pJYKAK28Q7yAAWbuQfqDmntoHRUZnkzq1CIZ48tGniXDxyQsiltOUWpSUnqN
         HYwWJ3dKQIL0rk0/pRiY1c62Z3tUrawDl0+fuoo1OZtgrKTiGq1uayq5T+uSmH3+wc6F
         l75Q==
X-Forwarded-Encrypted: i=1; AKwUvBymygK7vKAIj316xQagXFKn4wW5WgDw36eWL+UpPqYx2mLX/zXpFJk0qx/CzwqgfVhPHvaRbmxTnXOK@vger.kernel.org
X-Gm-Message-State: AFq9FYILip1uJ5Q00bdRpSvNRGTiKKnabnFGNEBNpznip+MpQ3AeevYG
	N6Wh8+AmX57DTt7TuG0BbtuM0eBzh0D5bovVE8siw79wFAt+iIRNzh5Y
X-Gm-Gg: AYBFou3iiFmu8gYmcMDKbKUlgaiDmZpr6/PKDytDfEd1npE7WkmQu2tETL1ziK8Gf+A
	fcZsXk3G7WhVyuw26Ayp4W6v6Kf7/ZRO27INiLEuRenbTXL78gFoEylyxdM/y/JBUGliNGn0BOh
	cChdRconHhj9hpk2ODLSe5whko1sdX/Lkxf/tHMAbv++ClwUuA4FGAjTVOakYJRqUQp0K++SquT
	Hr8geYV/c1Oy+6+dc7Xvit+nm6JYixjXhvDp6wWkyjeg9IFDEl3hRNYRFluz9uTWl0i2y5MtAdi
	4+XTR70KBroZo8NvcYQ7TQS/0NVCCcLPv3qAAdGzLIx9JlMYPlgZZV7UAu7wvpXFtsi3PwNDxAL
	MPE6dGOMmsY9pu4dknPpjsCr759xPeJp30u2/H7Ae6o+CDAvXn5I9a5p6qu3tQK24wje/wWm0eR
	3aSo0YmeNUwgXRrN9eOCdKtG8ukkR9RfyUng1rveoaHKvzMrVXX6idQXbnavNlZtnAyb0ObMQKE
	K5LKkSMiAyvmXDxTe4ZBC8vgfw2t3+pN0DLvDSNHmFe1kpLQyU9hAoKUje/JwkJEgNZzX3NoaNQ
	X+NUK5UOFk0SpQTCsstPWkUon+WGXWEi5LwU7XXYk9Moxg==
X-Received: by 2002:a05:6000:2284:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e5d46820amr12549573f8f.40.1793271144749;
        Thu, 29 Oct 2026 03:52:24 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm36664688f8f.48.2026.10.29.03.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:52:24 -0700 (PDT)
Message-ID: <7558d438-5d5d-41bf-8853-33bee931dc50@gmail.com>
Date: Thu, 29 Oct 2026 11:52:23 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dt-bindings: iio: light: add as7343
To: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joshua Crofts
 <joshua.crofts1@gmail.com>, Shi Hao <i.shihao.999@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261029074851.216029-1-marcus.yu.56@gmail.com>
 <20261029074851.216029-2-marcus.yu.56@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261029074851.216029-2-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 8:48 AM, Chang Yu wrote:
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
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
