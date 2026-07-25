Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C3932B12B
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785013031; cv=none; b=Xnw9uuAa+Z9yLD3qn7ySEnKIW+CNN/BMUXmv2How2HIIiw7ITnm5p+efEuTNnLlCz38X1F2C0KVIzF5OOk6B5MgkCx9AzOJrKnY+7pZ4B7BbdO5TkPZZsvUFBpXuEzD8fX0j5b2XF/10XG3l9oaVeLyFxWHTWSSa/4+J3zx8Sws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785013031; c=relaxed/simple;
	bh=Sywa6/Ye08B6vTkrcTaHJZX5fieJQ2q2ifsiIriTUl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPv7ij62ELZCdOJZW6QzZ29qAZ3C12hJOYb31AuuvPECJqXsIqXjEUZTlzugP8iKdl4pdlgcqS4ew5hsRznYhd9nJAp5nGCvsvip3loTHHrhDhvDu+i2P6AyS3S4LAzw9YWDEjiCVk+fG6hY78ov+LZi4gl9ss60pW9Q6Xu+FQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XgXGecnW; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XgXGecnW"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb42a2f5feso616029a34.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 13:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785013029; x=1785617829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BJq+VUPT3xZNhGxvs3I7o0afQFSkLHmMhg0Yb2V7f4=;
        b=XgXGecnWc2nEmXeTMJu4aE+7fYlkAajlinZaSfzJqoYWHspr36w66qq6lE9JiL1rO/
         YGJj13SiwXIjqC/4fp5RVpVhP+onvxpmqUXUGOO6Sp9UMx0vhZqVCKcMRe3rQpmFBwKP
         8Crb3Gk/URnYS6g5TZzGm2cg3gXqzNmSTsUfThmm+zgXR8DkG8GDZkIvNeGq6QlM/kab
         7ho5dDQ3jzpmKLdh7Bp+FGYNTWBeLcEQ1AJ/eW+0ns9/RvHv+BCjcZEcJtrG9FOtuS0w
         r0cnJdzeGZ979yUmbd4DmcrNg89ZdbNvpAxuQH0N0t2JeghqlXP6zblvP6+ZvRnS0OS5
         MaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785013029; x=1785617829;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BJq+VUPT3xZNhGxvs3I7o0afQFSkLHmMhg0Yb2V7f4=;
        b=KAz0kvfnRUaHySbNDvQvhb5h0h9qWuPEBsZqbzHgkQjI8eBCH4RHMfigNgbpi8AQDN
         1My8726y5di7MBtUGqoh5QnDGsmMUqhdFBvzVBy2mYbNo2dSG0mnvyuDFEERTaM+QEG0
         a0PmzZWJw342zpHrHyqudcH59/IKN3fitp4+SOslPiaYNVypL332ztJqk+MnFrikjFn3
         ap7XOlHW4JeDSNnB39GI1W2QTQOW55RHHTgF5qZnpwaE82phVJbPph5W5jSziRZV/XuA
         n/Ifox1CsMbSsGbvwX04KDbBN1l7ouyJ+KlVfARB+wxipd/ysRB5XtDCxkHMvDIxfrxJ
         /3nQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAUJBwD7zuJi4nkKG9ioYU85zQ3atnuyQwBKwjGidb/Qu1YGVL1sJFXCnxP2Fz8jT6/VAgu9WtySbh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9b1TCB/B/d+BGDf5XmuG01fsfU8B/48SS46hcha1Wf1KbRKxk
	kUY0DQRWOKkIWAQlCUcDWe5KVFvQKebUmgHCVLC8pBCvaP7FpecVDhiu3w5D8OS3NRk=
X-Gm-Gg: AR+sD11R5sJCEgXhzS0gQLfqFr8ufhwo3qUOZPH6zp/TMovKaNdYKe4W/9Zi6aX2t8T
	OmxuwOhHxyg4xDd13xfvoQN6IWBEXdcHaO/h4Kx7VISm/wOJ70yKqAIYILG/JjnkNJ6LH7btIuD
	n83ItNxbyU2KGelHmaMdqgEcQg11B0JLmliUM584jRl9TI2H/qrLSAtUJlLQJaouYlPicdhhZqz
	Pjs6KbsnYmOaFiJ8yiZ/lvdIwuvlcHAYnFctZNiFs9HCcwco06Pn/YdWZnNz27vZanXsavuBYZ6
	n5JsphGW/SsmVNkN8ux2cHQ0b/IGSZdmvTLUnb1c6M8f+TAlPr+5Ph4i9C7rTm1rsf+3vQWin9R
	0r+QlzN/BeO9c0RP+rkpNCcPnT+CIZSxZWKPceTze2nX6wp81Uq6nwBI96jUl9NpTW/9WiyQIBV
	sEfPIBjfdshXFDS10gnh6wI8EOjtYb8d5eEqs1OKSS5NXtYWe2r/0k
X-Received: by 2002:a05:6830:2906:b0:7ed:ceed:95b9 with SMTP id 46e09a7af769-7ee78d2ae71mr2872531a34.32.1785013029154;
        Sat, 25 Jul 2026 13:57:09 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:677a:56dd:37eb:cf53? ([2600:8803:e7e4:500:677a:56dd:37eb:cf53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee2a0ad02fsm9782435a34.19.2026.07.25.13.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 13:57:08 -0700 (PDT)
Message-ID: <cb4098c1-4bad-4a11-9a6f-a833e554f197@baylibre.com>
Date: Sat, 25 Jul 2026 15:57:07 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] dt-bindings: iio: adc: microchip,mcp3564: Add
 spi-device-addr
To: Janani Sunil <janani.sunil@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marius Cristea <marius.cristea@microchip.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Janani Sunil <jan.sun97@gmail.com>, linux-spi@vger.kernel.org,
 Kent Gustavsson <nedo80@gmail.com>
References: <20260722-ad5529r-driver-v7-0-7781cd74ad75@analog.com>
 <20260722-ad5529r-driver-v7-2-7781cd74ad75@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260722-ad5529r-driver-v7-2-7781cd74ad75@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 2:54 AM, Janani Sunil wrote:
> Add the generic spi-device-addr property to the binding and deprecate
> the existing vendor specific microchip,hw-device-address property.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  .../devicetree/bindings/iio/adc/microchip,mcp3564.yaml         | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> index 675319276197..de1ea289e7f5 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> @@ -80,6 +80,7 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      minimum: 0
>      maximum: 3
> +    deprecated: true
>      description:
>        The address is set on a per-device basis by fuses in the factory,
>        configured on request. If not requested, the fuses are set for 0x1.
> @@ -91,6 +92,12 @@ properties:
>        clocking of the device address (BITS[7:6] - top two bits of COMMAND BYTE
>        which is first one on the wire).
>  
> +  spi-device-addr:
> +    maxItems: 1

Does it not make sense to all for more than once device connected
to the same CS here? I would expect maxItems to be 4 to match the
number of possible addresses.

> +    items:
> +      enum: [0, 1, 2, 3]
> +    default: [1]
> +
>    "#io-channel-cells":
>      const: 1
>  
> @@ -123,7 +130,6 @@ dependencies:
>  required:
>    - compatible
>    - reg
> -  - microchip,hw-device-address
>    - spi-max-frequency
>  
>  allOf:
> @@ -159,7 +165,7 @@ examples:
>              spi-cpha;
>              spi-cpol;
>              spi-max-frequency = <10000000>;
> -            microchip,hw-device-address = <1>;
> +            spi-device-addr = <1>;
>  
>              #address-cells = <1>;
>              #size-cells = <0>;
> 

