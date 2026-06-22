Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5463C349CFC
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 19:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157213; cv=none; b=sCuuYyw7BUan1RimbS48x/fj/Kz9OpXFEQIfaWM9IhUxlc6dBiOT0KDEY8msA4cIqCRS/7IabvoAWGhB10rwYC/dXAWEumcCViO8ah+dHbBQIGXuE/2PTjcFoUQ8RJj8MQb7727szBRkFic+8wmNyJDog/h566wCTxUXT6TUXnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157213; c=relaxed/simple;
	bh=lCkdrhm38AlWxxdieCJkxVeyiOyAVhbQ510MuHlfVr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFU7U/6q/TlIs4mj5RR6Cd9Mr5DS8jVoRfL5XKLTALRLGPisRnmNwcAAIbr4+m6vb6+tm2v0NvbMAh+klYzJmWF7h5lEiYLhjS8pjYbvL2ccP4oswpq7XED6Q8rrcG1v6jGq5YIZ3lQbq8FCFLcKdK+mUwxnyT7vGcVxJNbXOV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j706uKmQ; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j706uKmQ"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e92c443cbcso2568531a34.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782157211; x=1782762011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g8IT7I/yGTO1KOxNCxG0G9O3RLwfq9sFvBwNPgZ+U5Y=;
        b=j706uKmQjNTUZso9DcLWu85403YxD3TYTTKchESqsr/Fht8LNcf1pgoum47hNa36Xn
         soerpQFeJGtPC+maqgUJ9B6PSb9s8ALDob2bVPTTJD9fqLfp1ZHKQrDGVq6PGBQMQmZw
         AFZrPbvt2mQt+N0bkcuozWRO1MHpsDA8DQTfGcfh9X0+Q34dhE2aYQ9TkH1zTYf49Xt0
         yU8oakRMz9wbG4LHpQIJw3i7JZFesBKszCwQu8IKfksd23R9AOf1NPnPLx8k91x0nFln
         rOvBq3ok/czk6/54O1agcm/BxnXewSvtBhe8+yVrvNto4/X4hvxjKGZYu3lYCakyeCai
         cfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782157211; x=1782762011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8IT7I/yGTO1KOxNCxG0G9O3RLwfq9sFvBwNPgZ+U5Y=;
        b=hvcWxxWOu5ql3dX3O/zD6gtKhqiPoXqoj+es1xnrng320h6yAxJIAs4oVmFUi+RTQg
         sYqTtwaj4jjyxq4GTymSmepkqndm95kgCMBO6AZzEM+ZDqbxOSQ4SdbneA2QMO/jWL3m
         3aD2MMybpyw4ZfF3LMWXfZhajVte7x4o71BlpWKghSJJytNnOvjMn75prIkHqW2O+xDd
         p+576lFyVaENoXs3ZjaXh9lJcZ5aZ9FDHp6EeDHZ7z9K1l5OSXxSU1VZPjxRXa1zw+u5
         PgeY8fVuaKFIq2aDRYcDdbyq0Y+7Y+96fTEMwW/H7AgUGfTR42PgWrOx9xjd3hHo5/WX
         8KuA==
X-Forwarded-Encrypted: i=1; AFNElJ86U2hfqkDlXT4Ri9IsPsKsN489/zSIvREaMRKs0YWwViAx6wFc6RfZ1oapbK3ma2Aaq7dQFZQMRRSX@vger.kernel.org
X-Gm-Message-State: AOJu0YxpK0N5vtd6ReyE5RUD9TpLir9LnQa9jKSfpPLZUeMiqObOJ3S3
	l1EOP6AGUqmWM63ylsG0UGcT1EgJVbXRd0VH6WEhvSBycmDSxuP4Jq0zrZ7d/JmnCNc=
X-Gm-Gg: AfdE7clE2mC7Xx+oihEg0E31GU/V15eNaEI4k1HT+1Hxn8+lJUVCQso7dffTxHUc8bv
	LjlNfdI3clXnJyzIOPtf9l/Sl0BOBzra+wTGTmNOayCfvXOpa6QVRlmf/UbmpkyoGLj3t4XKgRn
	9Z0LBPVSaOGwXDGBAPDi9QQT7p3kyOkPJv23btHm00BLUsZNCmjeDR4wo74tlkQkUoaNqSHgN6l
	zOtOEsAY+9a29O+qTTlcBu/GDOxEBy2B7ZofQ5XXw2MTtdC3aRUT3b9dACiktFkPE3XNgWRpoCB
	DvHv8TG6OpCxMRzEiIY6x9ySzh4aN2U+BMzQLyltyERErUZlfqHsKWzs1QoTymb60MkxI+M9PUO
	TxdrvUM6wpP5N7uQulbRa3bFUF+EBtWAZRJAMz+Xca5EjDYDDXn2tNa9XwDIExhZnseV6EgvVoh
	PF2dszG3T45YZp0x2AUDom2z3E7k/r3bnUtlBNexlLyQqe1rhj4QYz7gBZkwSs50A=
X-Received: by 2002:a05:6808:4f2a:b0:48a:a85b:ba53 with SMTP id 5614622812f47-48aa85bc13fmr13627807b6e.35.1782157211349;
        Mon, 22 Jun 2026 12:40:11 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6526:8577:6be9:cb7b? ([2600:8803:e7e4:500:6526:8577:6be9:cb7b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aec0ddd7bsm5103906b6e.7.2026.06.22.12.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 12:40:11 -0700 (PDT)
Message-ID: <baeb24dd-214f-4dc8-a300-22b932c4b4ae@baylibre.com>
Date: Mon, 22 Jun 2026 14:40:10 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] dt-bindings: iio: adc: Add reference-source
 property
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260622-new-channel-props-v2-0-aafd5369f253@gmail.com>
 <20260622-new-channel-props-v2-1-aafd5369f253@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260622-new-channel-props-v2-1-aafd5369f253@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/26 2:30 PM, Kurt Borja wrote:
> Some ADCs have configurable voltage reference sources for each channel.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> index b9bc02b5b07a4c7..fdad6b8276c934c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> @@ -73,6 +73,19 @@ properties:
>        device design and can interact with other characteristics such as
>        settling time.
>  
> +  reference-source:

Since this is an array, the name should be `reference-sources`.

> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    maxItems: 2
> +    minItems: 1

Maybe minItems here is OK, but I don't think we should put maxItems here.
This way, it stays more flexible for other use cases.

> +    description:
> +      Indicates the voltage reference source or sources for this channel. Some
> +      ADCs usually allow choosing between internal reference sources or a pair
> +      of external pins.
> +
> +      If a single value is provided, it represents a single voltage reference
> +      source. If two values are provided, the first one corresponds to the
> +      positive source and the second to the negative source.
> +
>  anyOf:
>    - oneOf:
>        - required:
> 

