Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F10B3947AC
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879099; cv=none; b=oy+1mNvwJ9Vpyr5P8u5Gr9FxazdAoqs8AYANqdiyGU8tUvI+4o0TwNKLaYkko9NxzxKOWBUijC/Q2Hi0gAs1mP7JCk//wQGTDgifpxaulFs2fnHW1q7kDgyle/GkB6DIZ+ubQAfkMzWTI+Zi5gYtUnvLYkSMXFQE2XNO7v5R7L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879099; c=relaxed/simple;
	bh=pGCla/vvf3lJsUCV9oSk/dYHXQS9yOlxHQdvLssuW40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZMswEKSo95NCxJxdywPOXgQ/daLxKOpT8LVVsAQatmTGJGdbVz+HHdkFq2bVKRY/4+xN9O+EHNKLv3Y3UvIAGweXpjP6JoVNAHa/ZxOIzNv/QfRB8oJmR1+m96u+NgY4zSoy8TdSVZ2QyYbHm8iL/s/0tTk9gZopi+2casFaPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=meW2LVjF; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="meW2LVjF"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4472500e25fso153695fac.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 07:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781879097; x=1782483897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26PmlAB+sYAYcUZ9jY2wJzqTIoNsm0ptg9G8UNT6ht8=;
        b=meW2LVjFmK3RVTIRdoU/KQlI369U2S8gd42Lrw5PZV6M0sL52OtjzYjNHN+DVN3Fsx
         3pFTJJKAi+UQvZs2FEDJdpIIv7UKCWS5k6EVBbWZQX/K8F+j84xvs/k8zaqlUKuMOl5B
         P4Rjk1WTl7d57UgYYEJPUQmvqbYLa+7RJ6SG5TmxxrnOG9yA6qpbbvZGtfjpxOnjAXPB
         MjjyTShfVsHYqIuhLKd9p164sz6ilCrUU1BGBOZ3whlBpJYQ92iKo7FfBWx/Jkxl6eEl
         40dfuWr8FJ5nxqOAqKT8ET9JYbSjz3T4++DP776xFj9OvTw6fW3+L21fHNx6JkYdtSkU
         v6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781879097; x=1782483897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26PmlAB+sYAYcUZ9jY2wJzqTIoNsm0ptg9G8UNT6ht8=;
        b=LzmsSoQkSiuk3RTV19dF7jcjEJ0CibhVzYQKKQEh3hOk7Lra6i8KlTZrktcl34Aj31
         0JWftE3msiFj62pJmgztIXm8VDUCxAWvZ8nX/yg1jd5eqKiuSdgRw80nnj336YBlDZ8i
         g1WSCM5XV4mPN5kNyHrRYQhMlGUCXSzrOVERBgeZFNEEhhzQTP+cIRQUlem1ZwiZU8G+
         pJAqYDN0yac722D5pjEyjUzh+V6i9o3tZzpYZsVNW6vhEPdRyUAphYGcyECucRbkQmxw
         FX44+bVOJZwmy5NZe25HPthuR2mv3gYHFk409VzfInigkeTebrjMrFIB6O4S/09eVilF
         kGkg==
X-Forwarded-Encrypted: i=1; AFNElJ+oHwMR9uTKvSkrLOGewRmzfK/rJYjgOxN4yPo7AOpOl4OUI4NX7cHlgxcshPrHD3CyX3ehb/Qggnm0@vger.kernel.org
X-Gm-Message-State: AOJu0YzQieesvYnnRdXul5k+N35V3aMwise8VLQpVp59+YtJ3tVPGgm/
	gR5ZNLYoEpPk4U/DzW2nxl7TVQeuRfN6G4pycY9xjS4ZQ0/NzjlhdxID/xNRX5QOH9c=
X-Gm-Gg: AfdE7ck6FOT/cqYmeSfoVbgIb8thqlV2KA7DHdUtxpZUYjvAbgDzvKVafhl227VUCzm
	3F9ILOlwpQbD8wsObjcxg8urBeQd0Zx3YhCk+5dAa90JqDTjxqJiWvENq0bUOSiVO9xMTUaDuQy
	NR61OgJIsuY/HOBsm9LM3t4gafESbeI9e0UFkJ7stS1578mqhc1dBjegh4aeR1/DCxW0uw+OJLh
	49Py4D5cDeEl50+bjU6KrbEf8xqEu5skqeTyUN/1t7uhZFOE0TN5IaxRHk4XWDCUefnaGDZOzir
	qpDL4oweYA2L52Oos3LUxJtjDFfM/OJSigsBB6K/a+7+WQuQSStiwqJXi0VmIXt2vC8P7/qB29O
	7Zz1QilwcfeB9O7O/o3C0wTlU5m9AOMmd+QySwtt0zJYVKX/1WEeLR9LbYKBpLFBdkCEI7mUSO/
	YLwFKnYsJqUhAvsDawxORrnaMsApmiprl9eBOE2crp9dCT+Lc26Nhz/E/Y7Q==
X-Received: by 2002:a05:6870:21d4:b0:42f:d844:7d0b with SMTP id 586e51a60fabf-44706ef4944mr3031655fac.6.1781879097453;
        Fri, 19 Jun 2026 07:24:57 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:dd8:d93b:3cde:c07? ([2600:8803:e7e4:500:dd8:d93b:3cde:c07])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4470a3091e5sm2351865fac.11.2026.06.19.07.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:24:56 -0700 (PDT)
Message-ID: <736962f9-50b9-4884-88b1-94bfd7cd8abf@baylibre.com>
Date: Fri, 19 Jun 2026 09:24:56 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] dt-bindings: iio: adc: Add reference-source
 property
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-new-channel-props-v1-0-963c1b5cf40a@gmail.com>
 <20260618-new-channel-props-v1-1-963c1b5cf40a@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260618-new-channel-props-v1-1-963c1b5cf40a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/18/26 7:33 PM, Kurt Borja wrote:
> Some ADCs have configurable voltage reference sources for each channel.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> index b9bc02b5b07a4c..c74c2084fdb68c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> @@ -73,6 +73,16 @@ properties:
>        device design and can interact with other characteristics such as
>        settling time.
>  
> +  reference-source:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 2
> +    minItems: 1
> +    description:
> +      Indicates the voltage reference source or sources for this channel.
> +
> +      This array describes either a single reference source or a positive and
> +      negative reference sources.

Do you actually know of any devices that allow independently selecting
the positive and negative sources? I don't think I've ever seen anything
like that.

Also, this should be string, not uint32.

> +
>  anyOf:
>    - oneOf:
>        - required:
> 

