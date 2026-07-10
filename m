Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D69640800E
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 23:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783725132; cv=none; b=klUMAx+aEzs/Jcf2k6g8B2sKv/UqJZqzPLJ9ggziqgty9R+yPsB6xiQZea/Bau6WhDPyReiEs75SslLnP7Q7KDKh63lFs28+ei/duNEc7nIywMv5TUMlqwYqYlBMLC9g/MWaFk3ib0NtKNolxnLFdn4paiwtn66R4jNlxXa2CTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783725132; c=relaxed/simple;
	bh=WolUqNqLG8wcbpxo1euYF2zvMyMZNYCNCWIwYPG4YAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4wnyrVZghDUsQ8Gc3UYNff3M94eW4v53F/9Gm/FXF4NlfGUszWHyl6cro3Gswz0ihJdh4jZQWDOUP5NMzryaOuqWJmxP2A7ukOk8k7YfR6FYYbO6cixC58/OMvkgeqyY8Ii0IxDFKb1Yh/tmCFy4Oux0TGW4oqcvlzyZ6wmjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=paLba9Ga; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="paLba9Ga"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e9ecd7216cso738707a34.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783725129; x=1784329929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orAXM50ok0dlT4J0LLGqek12i5V341QLmN68gXTBWUg=;
        b=paLba9GaMx2aJNEVWo8/61lzZuD+9h6A3fbJwZEZBoGXmVTSjIVpxWYOTxqmuJQuVz
         B7pR4Zdc63hgPdmEO7dAe/LC1geVOATe05OApro4NvcqCTCeVeEey44UQBS3WDrQ18Dn
         g2vpdrL4cNYM6pSg4jQ1QFjrd9bSX3HAjJwE+IwTtdvAstGXu4F4M8VU+KDQh1U9rVRw
         BG+a36v/CSRkQ9ZmQy0WZhOqiEDWBv3xzeQQAjf9mlv6JjB9/FB44R5H6/QUhSiNvWWQ
         edCLTDDDjDXtrX/G18AtpTiYnNjKC8V4GWiOH3KLItG3flWdnxl4icbAlCzHyrEW7KBh
         hJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783725129; x=1784329929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orAXM50ok0dlT4J0LLGqek12i5V341QLmN68gXTBWUg=;
        b=F1KaZuYwXWpIGsUvvcou0c6WEtlws1nxnuJH/sIM6Ju8HEP9L/HbLVyzlRjjHJUcgL
         smaJKfy8NYqjwKrOi/NaMaFRA5Qd2BK8AyNuZGOABKaTIxYlk5jBjdNFDp8S7KnV32YF
         6C4JpskXcRBm0YQ/m4oBPr0Jxx1pDNIdHBBh6VMCAwrC1QYtLKijujsFoRewrGF95WzM
         mqOzo5Hpi3rPEfix+FDQB8cUnvLOLzdEwsj0Er/7az4ucewbHiBo0EcKQZs9kqIUCTQq
         8+isQEpkhdzcSlG12sDFijb8N3pAiGXxgb3GKPPgzeBI8TUCBUrOh3ZhtZAEBUBOwF55
         b24A==
X-Forwarded-Encrypted: i=1; AFNElJ/IXOBsO5/YC4bi+YEETMR/30ibuN/2k7ni5XwMsjtQ2XTXCmWe4TQIrJmDd+Mlubg+tDWkUYOPY/qB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+2ar8mjx/quiUlZj7piuBYP9GTOToy1mTK75fxrCFI054fe/h
	d6qkB935qpCOtgJAulMFNa5PWE2h0tB4Id3Xtf0Rhf5qQoBWiyBFztrcEG7tadjGKwY=
X-Gm-Gg: AfdE7ck8PLd1fbxiZxnystbgZp6Z0SHhNnmhROnhO3cIebxbg59BAI2egGpbVbVDJs5
	eHqr1hDSlT6IBSZOpzm3ivRyv4UVP5VZdntPR3DJgscR2bCLroITexqjIQmfRgVjG0iyvXg76fN
	OWk+J8pxF5rdRpqINY1y6Zonz6apHCAFry69+z/ORVp6M77smfCB678dzvLKbq1IQc5POvRD1LT
	2iui9LX25QSkD4ATYet+DeekJHBN52/JSmx6xCBJhfi/JqzffgwrosaHIdJj8UPSNTsmeq5eMvm
	oYtEeXcHObmns7FWTf1hP2r4x5X236X2Vi1K1HZpLv59EJOGVZxXvM8AkX4v7JvVse2IuTpfTmC
	3nwXtpIZ6Xu+BA3WKll+HdEq90+F359zpmEQcnbZVPZF40ei9ifxKn8ycWdd4OWCjAV0EfQp1Fa
	h3GlQ7w4ErQ2xB69VdpHtCT2edDePoc7ypC55xWJZIs/qpUusrMLGncUv3dELpveo629XntF0=
X-Received: by 2002:a05:6820:178c:b0:6a1:41ae:1bd3 with SMTP id 006d021491bc7-6a39a6b62d2mr734605eaf.42.1783725129440;
        Fri, 10 Jul 2026 16:12:09 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:1b03:95c:fbd4:4d00? ([2600:8803:e7e4:500:1b03:95c:fbd4:4d00])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519124d07dsm6322280fac.2.2026.07.10.16.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 16:12:08 -0700 (PDT)
Message-ID: <f1c5be4b-6bbd-41d9-a152-ee480988f44d@baylibre.com>
Date: Fri, 10 Jul 2026 18:12:07 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] dt-bindings: iio: adc: add ti,ads122c14
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>,
 Kurt Borja <kuurtb@gmail.com>, Nguyen Minh Tien <zizuzacker@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
 <20260710-iio-adc-ti-ads122c14-v3-5-746d52cbf1d0@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260710-iio-adc-ti-ads122c14-v3-5-746d52cbf1d0@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Replying to https://sashiko.dev/#/patchset/20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com?part=5

On 7/10/26 5:50 PM, David Lechner (TI) wrote:
> Add new bindings for ti,ads122c14 and similar devices.
> 
> This is an ADC that is primarily intended for use with temperature
> sensors. There are a few unusual properties because of this. In
> particular, the reference voltage source and current output requirements
> can be different for each measurement, so these are included in the
> channel bindings.
> 
> The REFP/REFN reference voltage is usually just connected to a resistor
> that is being driven by the ADC's current outputs, so there is special
> property for this case rather than requiring a regulator to be defined
> to represent that.
> 

> ti,vref-source is reused from ti,tlv320adcx140.yaml (otherwise might
> have preferred an enum of strings).

This paragraph is leftover from v1 and should be deleted. (If someone
called it out in v2, I missed it.)


> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: FAULT interrupt (GPIO2 pin)
> +      - description: DRDY interrupt (GPIO3 pin)
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [fault, drdy]

I know the descriptions are a inconsistent with allowing names to
be in any order. I don't really know a better way to write that
though that allows both

	interrupts = <0>;
	interrupt-names = "fault";

and 

	interrupts = <0>;
	interrupt-names = "drdy";

They are just descriptions, so does it really matter?

> +
> +  gpio-controller: true
> +  '#gpio-cells':
> +    const: 2
> +

No, gpio-conroller should not be required. It is rare to use the GPIOs on
this chip and the pins are shared with other functions.

