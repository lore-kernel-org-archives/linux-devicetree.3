Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FCE3A71A8
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 18:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786214387; cv=none; b=BQwPZ8vUtz+r67lAQEPE0eI8/hTAHjaIXc6/GPJ4AGJZKSevmTQJHEP1zIYrkoibAG6A31lhwLkZHW6+H/x6ks69f8+fq9nDNPbyDBh5LD4BCMn7lco7SS1Y0a4HzxqgXOQUAyd+3L2/5rcrEjA6+hCritAIU3dNYo6yDjiigGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786214387; c=relaxed/simple;
	bh=11RcXIDIZRJRr+2CsYJckF1zhJr+67XxDlvO8iduTD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWZqgN6BZ8r6TiVr4qcEdztmcP16WW/ddqSuWF8a62yCkMUJSu8DXRENkb2u3m5pbKbAv0CGd+GRYfrFs126/w2TPtR387ScYv+Eqv0HhjPIT9gpJx3VErSyOmPPYR4QecGOha3sPZGaK7hRuuqZvU8EjmG+di/AjiitMfBh+TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GSBXI756; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GSBXI756"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b046fe079aso348546eaf.3
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 11:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786214385; x=1786819185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSSU0mdXDr7Kdauu787eIHPF8JBaU64+u/a6lK27OP4=;
        b=GSBXI756LZiNdIrgYAbnvAjDBsRfV38zVus/DZMRFXNiJE0rOOuKxzMjGO5tq+l+Cb
         i6xPZiUQaYqC8+yKqb3WqX3x91K5gO8HUWZ5w7NaK4LPHBfPYJWW19yVKgVeEIMuyU1p
         uXWNvoL6Dm+Jq67qTTWgdnOHg/NxCeVJJNFCfFbwzbXaJBMV/aIzJ026PRY7uPKYXjHb
         RouCyuWGrEB75jn6l5r236M9z5Cw6JT64BXk7p/UfqQaAIlCt9IxgHFL2XrjoSY69diK
         wvbqhJlMg2PFf/UTuLpzGLISQ8//QGSf4QunCb57ImoVE1fUEyEsCbgtL9l/6ownGvRC
         V8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786214385; x=1786819185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qSSU0mdXDr7Kdauu787eIHPF8JBaU64+u/a6lK27OP4=;
        b=DxZ/uDHSV0Xiq5b1l+Zc+9U3TzFzmY7SKDziciPwhPNQkiCExMKaFao3YoVxomXs+M
         vEVxFlq09D5OZ/U4SR+oaFfs0V7hTcaJMjLTDUlml3yTEUzHzriyfu4ZAi6lNY7jTZLM
         8617p6F+HtVWkMacqyEeHf8AD8RdglzcVwIoT5aX+T88hS9hftRgxW5T17dvwEPVh2w7
         xf6kOQFICKBtvkdLYcPOM2VLv83TBkxq29Gf6YADlFB8uwW7Nuv3ys2ks3j5HvyR/1W3
         VTX8BKaOozeB3IY4xoMBoUFGNE0jtUNmOigcClXgb9n5AZy7v5gCnocvf6ZpRSfD5Gpz
         CldA==
X-Forwarded-Encrypted: i=1; AHgh+RooxVYIt2YWELdorYMHEaZpoOIJUJ3k9Frb9rum9ByN+uZeUQ1Q2JL++L3ut59DQuXtLLmXBsaWRHrq@vger.kernel.org
X-Gm-Message-State: AOJu0YyEZ3h1ri3gReNDB3P5X283qVIi56rk4bxbvOyN9zS4w3Idh93e
	dcfiX1fPPCX6kTpb+mTQdL6s6UVh1KP10IaTf6wdVgNjJQKDq8vP9bmGlThmg9aTJk8=
X-Gm-Gg: AR+sD13E1G//TGmn6pdZ4qkoOHXwOmgUbqHNmw6sMvwHyNTqhCT54HqKmEIFihwRduV
	m71if4TyrjY7NAX203ohSJgTDfdkz56+aZ/Q4vFiIonsI1O6H0eiExqrEn1ZOnMtkf/3CqS/1vm
	9dIU9XjjHJI5nG/5dM/uYU1BDYkbPjxsomOdGqpyzdg/kX7k57vZL/cDa0Cn0prUAnWW0hQltAv
	TrHNmrztV4FhyO6Rzmhxrc84RYyRnpBiYGd1YuPxPH5HsTxo7bJq6lrrX/VM3NxR/Adm0k88OLC
	HPTgAUFJZeRFdWmR00nWZ/hs+9owd2HX8SEY4J8khs2c+Um9V91eFFmu03v5S09xQTzOrz0YeIq
	UOz9q4asI1zr8gs/WwgrZOOeKxlmba36vEwp7fgbZRQ0XMgYBOp7NVHa3NMc1zyShnpNt5Yy97R
	crW8kjeqPVgUDWn6Lhbo0O3qu9/C5ncCYBENCLDzGjzrQmKk79LapSgE+zhLY4+GMHsvzwDpkc+
	NnLPZirDZ4us0K8xYO64mn3bPPZiDFjxhs9Aso=
X-Received: by 2002:a05:6820:820:b0:6aa:e854:d03b with SMTP id 006d021491bc7-6b03505ccf6mr6167181eaf.2.1786214384946;
        Sat, 08 Aug 2026 11:39:44 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:99c2:f16e:201c:3bb5? ([2600:8803:e7e4:500:99c2:f16e:201c:3bb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1d793c9sm4702369fac.9.2026.08.08.11.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 11:39:44 -0700 (PDT)
Message-ID: <d60ccde7-9a9d-44e8-9f6e-1c5e15c3cb65@baylibre.com>
Date: Sat, 8 Aug 2026 13:39:42 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] iio: adc: ti-ads1262: support excitation currents
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-6-f89925d72792@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260807-ads126x-v3-6-f89925d72792@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/7/26 10:58 PM, Kurt Borja wrote:
> Support the two IDAC excitation current sources. Each channel can route
> its IDAC1/IDAC2 outputs to a pin via the "excitation-channels" property
> and select a magnitude via "excitation-current-nanoamp".
> 

Reviewed-by: David Lechner <dlechner@baylibre.com>

> @@ -1150,7 +1192,58 @@ static int ads1262_parse_channel_node(struct ads1262 *st,
>  		}
>  	}
>  
> +	if (fwnode_property_present(node, "excitation-channels")) {
> +		count = fwnode_property_count_u32(node, "excitation-channels");
> +		if (count < 0)
> +			return dev_err_probe(dev, count,
> +					     "%s: failed to count excitation-channels\n",
> +					     fwnode_get_name(node));
> +
> +		pins[0] = ADS1262_IDACMUX_NO_CONN;
> +		pins[1] = ADS1262_IDACMUX_NO_CONN;
> +		ret = fwnode_property_read_u32_array(node, "excitation-channels",
> +						     pins, min(count, ARRAY_SIZE(pins)));
> +		if (ret)
> +			return dev_err_probe(dev, ret, "%s: failed to read excitation-channels\n",
> +					     fwnode_get_name(node));
> +		if (pins[0] > ADS1262_IDACMUX_NO_CONN || pins[1] > ADS1262_IDACMUX_NO_CONN)
> +			return dev_err_probe(dev, -EINVAL, "%s: excitation-channels not in range\n",
> +					     fwnode_get_name(node));
> +		chan->idac_mux[0] = pins[0];
> +		chan->idac_mux[1] = pins[1];
> +
> +		mags[0] = 0;
> +		mags[1] = 0;
> +		ret = fwnode_property_read_u32_array(node, "excitation-current-nanoamp",
> +						     mags, min(count, ARRAY_SIZE(mags)));
> +		if (ret == -EOVERFLOW)
> +			return dev_err_probe(dev, ret,
> +					     "%s: excitation-current-nanoamp size mismatch\n",
> +					     fwnode_get_name(node));

I don't think we need a special error message for this case. The error code will already
be printed.

> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "%s: failed to read excitation-current-nanoamp\n",
> +					     fwnode_get_name(node));
> +
