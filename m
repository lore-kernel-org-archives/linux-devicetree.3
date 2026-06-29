Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ADF39659E
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715666; cv=none; b=B9phaXVNbKlyAmy7VfRO6KXeO0VoVpBG0DI0zwdqiJpkLB/pPcjNMmuKYr9jUMkUn2VyiYf/5aoW/4d+4cQ+hObfROSjNUlfoN+vxvoWp6bhpt+dmLQzqoOOPnhdCOZudM9Oz4P9SHtLQiRqXmiPKb0Nkl9vLcf/1MV6c10yMpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715666; c=relaxed/simple;
	bh=v+qWVRauUjpTMkiJIe9BuToSx5p+cD4V9llEvD9oJl4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=YokWy4hV0qs3TYwo4rvY1nBgLtzNzN5X5N546ATg7JLR+wwNpEpTveYhmAXWvd44nvJM08t9zhVQV2RnPeNwIPkWSqYMDTVjbCql4EPhmnzWe2rVQWBE1wEdDnn+HMxr+lwb2jzNCOaEPApGFKX49/Euycf+ly0PwLq6b/TB+kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1R0e2+t; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1R0e2+t"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59c9b666822so2481043e0c.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782715664; x=1783320464; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+oe0ICWRfN20FKF1msz77hWxvDcYi0f/X+trcO5BX8=;
        b=H1R0e2+tnbR8pO8OI1J7c1IJknieQWaHHRkkeIWgjOPW00ncsQUQZs0e3jpG+plmpV
         C0m3GHV/JhxGzZ4mnWAN8lYpXxj9koSB3uFg0eJzSPXgR1RwTD4Fwb5dPYywQ71aXq1o
         GhlUHr8lF5A9CMno1chirc0KcrLBE17f77aEMA0svfxfzJBbeyNClZeYNCU7ZqITXFvw
         ZJ/kUp23HljTfKw3xI0IuPT+uPSw3DGTg1s+hp7fb6zRVkYU77/lVXit36IiEHmSxU2C
         kah2052a4gL7gAaLfRpBfAZEldstTzXHgQUkJUm8Iaotlkd3RAwKyk+QEXg0wTR2cfrz
         i4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715664; x=1783320464;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+oe0ICWRfN20FKF1msz77hWxvDcYi0f/X+trcO5BX8=;
        b=JQk6z819xrSUnuqeD1p0P5CAn/kt5DzkxMdWaljfKnx0EIlKOvjxDr2uviRj8qxIT3
         1Q9KX83ktmCU7LJLjzn53tQpIxf8KSoTODi3k7IujITuDCvXpUjO8GWyQSgKDzyw84rf
         ZW8lt5ViYbYO+WVMaLnUknQaSiy4WmtR+h7p7V09xF+FCmXnoLVJ+S9EcBR3lOB5ozYM
         y7+xitc+k/WQ94Pgt56rV/S6sbrfGH2dIYd9hbCL3smymzwUotu2gcIP/POheuQaVK0o
         KIagS3JJ4PLunnOBu91Hj8g4227AABF8P1hKIcp2YSq56q+LaH553P3SDV6oFHm2/BP9
         MMVg==
X-Forwarded-Encrypted: i=1; AHgh+RqJA06Ut42b3xgls74R6FhN8Gafy5tazCneXRshhG7qVtqPYN83TqaTMT5NB94ditX7XKTrd5rhiet6@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ2yxyE+SVIjEzAFfcZE+VYjnXXdftAYay94k5z2ytscnvJNnO
	Rmu5vDSj0KXHdg5aRl1eJxTZ3uzd+YPrCh+mVUe9xAv7X6D2BV/Th1ih
X-Gm-Gg: AfdE7cmnshbo9gDuGgf5tbMSa77fO7ZtYN8iZmHiAKFjT3+FO27ncezw1BxjpWPu4Iq
	5E89sRlCh5ZHCZi0UcOrvrK35JKlOLOh7mCsCzDIyHktO7lWDfucqZNXYPRDGnD2I8XPIatJbyS
	5mOUNnbi7an3+MLDsRrILi+6EYeikUqiRH3hzozURKb3gP6IbfEtl6ImfO3gT+9qB7uDuHyVKhR
	SlmIBgaphgZqlTb1jPqsFF3rZMv5jmj6J9npePd3/ID87wYFgiP4EN35d9u/RGsbmPXoU/eadTi
	RC6SF8wdzffvW6b+6pAF3Wz+Vm7SUlmqHwDmIwCH+xKZ0yfDj6P3cU4kJC2N65NsB8W7QibUu/v
	PIbqTS53eXwkDHLf1Scx4/bIDDsPh86RKaJZZmj9WyIq2a0RTUhiCBS1GLbZshS54k6MQLxxXmn
	WxdYA=
X-Received: by 2002:a05:6102:80aa:b0:650:94b2:b209 with SMTP id ada2fe7eead31-73433e36b9amr7521498137.4.1782715663900;
        Sun, 28 Jun 2026 23:47:43 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73566da9b45sm5178561137.5.2026.06.28.23.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 23:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 01:47:35 -0500
Message-Id: <DJLBYI4V0I6Z.2ZMJOFAZXG10L@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Jonathan Cameron"
 <jic23@kernel.org>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: "Chris Hall" <c-hall@ti.com>, "Patrick Edwards" <pedwards@ti.com>, "Kurt
 Borja" <kuurtb@gmail.com>, "Nguyen Minh Tien" <zizuzacker@gmail.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: iio: adc: Add reference-sources
 property
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
 <20260625-iio-adc-ti-ads122c14-v2-1-ceb9b0b561cb@baylibre.com>
In-Reply-To: <20260625-iio-adc-ti-ads122c14-v2-1-ceb9b0b561cb@baylibre.com>

On Thu Jun 25, 2026 at 4:55 PM -05, David Lechner wrote:
> From: Kurt Borja <kuurtb@gmail.com>
>
> Some ADCs have configurable voltage reference sources for each channel.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
> ---
> v2 changes (compared to Kurt's RFC v2):
> * Drop maxItems.
> * Drop 2nd paragraph of description.
> * Make reference-sources plural since it is an array.
> ---
>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documen=
tation/devicetree/bindings/iio/adc/adc.yaml
> index b9bc02b5b07a..12800737d4fb 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> @@ -73,6 +73,14 @@ properties:
>        device design and can interact with other characteristics such as
>        settling time.
> =20
> +  reference-sources:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    minItems: 1

Is minItems necessary here? Its causing dt_binding_check to fail:

	ti,ads1262.example.dtb: adc@0 (ti,ads1263): channel@0:reference-sources: [=
'ain2', 'ain3', 'ain2-ain3'] is too long

I don't really know why, but removing it fixes it and allows various
array lengths.

> +    description:
> +      Indicates the voltage reference source or sources for this channel=
. Some
> +      ADCs usually allow choosing between internal reference sources or =
a pair
> +      of external pins.
> +
>  anyOf:
>    - oneOf:
>        - required:

--=20
Thanks,
 ~ Kurt
