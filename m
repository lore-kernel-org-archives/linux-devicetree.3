Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588682EACF2
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774109482; cv=none; b=QJPg4h3V0YAEtRhxUhfMX1KvZMi+1JlEmnqEaCKDeTgg7nUH8nye7BZoKgnQAcYtJDMeS1YSNHSutnNUKNdEcjpQcZ5oYJSbWivj84BFDIInxKwKvuHpxShMv9tkZTsH8W2aKOaBRXHhq+4bsdnPzZz/7HKjz5RPoeASkUaq2yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774109482; c=relaxed/simple;
	bh=Rf5h3AQOLeWbNsSTZIKH+4HXwvmOWLUEZ4Elupi7TOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcN6jM1XUNjjVMFFvJQ71oDCycjVqjdP5OU8sSXSu5wyHhi8vBQUDdIM7FaPkv9+/MV8fddCE4IwDz46eTaxu1e9guMSRNrKK/HxCBgEg470bWT2BXu5PQeoU/nOV5BxpnhYt0lJBV4ZZSS/CqgRqkAiINz5+Svn/NoUF9bD0ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t7FfDnxv; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t7FfDnxv"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40946982a78so900889fac.2
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774109479; x=1774714279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePBnLY2HsewubhlIjuJ77dk8XdKtMQwZQ4cBTDjuGuM=;
        b=t7FfDnxv18XmM8nw3xqghoKvm7duSLaIJdcSHDcs5SVo2t5CzdnoABMUmhdUE1gp/N
         tSL0SU55VVq1YUwl8mqbtYjAyDJMiHeuTMTuBDCyf0jy8cv5BvWOeXwWL7Nr+bp/RIYc
         lu/mNg6i4GLVXCQ6LGmh3GD5cvnb15Zh779RX260mGhPTR/fN1hCb1nWOXUyNRBFC+X9
         rx483XCPDzt119oiZoY6xfdyDzmm4T4KGuJ+wt3wUiWoEank+s01xFp+CY5vaAqCQSex
         SdlCV35eYe7csjL49IakP0Fh52qs3b0F4lFjhIEBI+G2ak7gEJyuXaEP+/5imoogQXKj
         i5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774109479; x=1774714279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePBnLY2HsewubhlIjuJ77dk8XdKtMQwZQ4cBTDjuGuM=;
        b=iCXVxPlOVsFh71gQcGtYcntFRI6ZeURJMHjooZZXJ19fo2OKslQigyTydOhoh7EcMR
         bW8AFcunU9IMa9esg4jr0Jjd25oUjRvT5+FGcC95plWNA4nCPw5GHhqEB90tMMYFZwp0
         7tcviHCUR2fF2NyYXNndjhNVPSnzkMgWf/jnmK2RQr1DRxgcFKNXH/o/EzArblFPTs71
         oNHPWbDGL5QF2hJ8tiJM50vVTtE66o0tJ7rj1n9OLADaBxiG8rVAVVSaGqvkaGmDfxBR
         LJhZWOloogZJr1ikXig+3cixHUDg+V/jfYOnB8l8Ogl8laq2aPBTm/3xOM8+uQZKCjse
         nd1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVxWQHn73/4wuNnUIX+M2gWfB1wRfb+bMwa/eFg1lO94fv7mdJxUKKuvQAhJyt8BqJnjvwCeCQREUp@vger.kernel.org
X-Gm-Message-State: AOJu0YwvQ2KAiaF4UNM1jvOf494m4S9g/MgH3wT7WZ7tS6XQgdRI7cGV
	CFd46yb0iHgKWLx+WAJBnTQ2mn0y/8DALC/WqgP2MYpafgaq8b6J7ypgqX3bJDfe1oU=
X-Gm-Gg: ATEYQzy6znXHA8gTAdWz2mRwX2p6L7np/qbN4XvMs4tGpP1yvmBfUIhuMOpYVYB8Idc
	oPrubbLWQ6XtoYVj4jcRMyYr2WZRyAChTCyN6aOqhG71vjh6ocBMfrcmbzT5F2QKFOOyYsz4K5W
	xU0J9pc2VVMUPSACzv64NEHrc4nyQ5nSvp55CrBAH/DyZEaM85zY7DfiQtTlxasI/vbT3yhorMR
	R2dPsPHW/T5Ic8MeMiNZgdMFwXdmyScWt5pGyXQdCuL4DatGh7gvkAjx8RAGtkAtyFar2t6KRBQ
	w7ZIfj39r5GSp/gaRAJyy3k8bI95nQAL68HbrI+IDsPxtWwUEqGdceJe/sGVOlUl1cVV7Pi0Nwn
	WvpDsiQhvBc3XH64GNC6KVK/ZuR9fvJLt4HLTadqFT31WsJU88IcRZZBxTQOxa9mmGl0YGCsxZM
	mxM9f3+btnIc1TT250En58rLiTjNPdiklqSoUalFbvDJgHDXgmoV7k3WB7eL5j3+YfjcDQJ1FUP
	Q==
X-Received: by 2002:a05:6871:80d:b0:41c:1036:84b with SMTP id 586e51a60fabf-41c112440femr4336750fac.39.1774109479055;
        Sat, 21 Mar 2026 09:11:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:8e89:f58e:e4e6:5567? ([2600:8803:e7e4:500:8e89:f58e:e4e6:5567])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41c149103b0sm4635730fac.5.2026.03.21.09.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 09:11:17 -0700 (PDT)
Message-ID: <486fe1c2-3734-43ea-b7cd-7bbba2eeb891@baylibre.com>
Date: Sat, 21 Mar 2026 11:11:16 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: iio: adc: add AD4691 family
To: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260320-ad4692-multichannel-sar-adc-driver-v4-0-052c1050507a@analog.com>
 <20260320-ad4692-multichannel-sar-adc-driver-v4-1-052c1050507a@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260320-ad4692-multichannel-sar-adc-driver-v4-1-052c1050507a@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/20/26 6:03 AM, Radu Sabau via B4 Relay wrote:
> From: Radu Sabau <radu.sabau@analog.com>
> 
> Add DT bindings for the Analog Devices AD4691 family of multichannel
> SAR ADCs (AD4691, AD4692, AD4693, AD4694).
> 

...

> +allOf:
> +  # ref-supply and refin-supply are mutually exclusive, one is required
> +  - oneOf:
> +      - required:
> +          - ref-supply
> +      - required:
> +          - refin-supply
> +
> +  # CNV Burst Mode (pwms present) without SPI offload requires a DRDY interrupt.
> +  # Offload configurations expose '#trigger-source-cells' instead.

This sounds like a current driver limitation, not a wiring limitation.
So doesn't belong in the devicetree.

A driver could use e.g. timer wait for the conversion instead of an interrupt.

> +  - if:
> +      required:
> +        - pwms
> +      not:
> +        required:
> +          - '#trigger-source-cells'
> +    then:
> +      required:
> +        - interrupts
> +
