Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55435349CFC
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157379; cv=none; b=TkxnSoiRxr+1bBZfDA+JrHazU6txy09zTiAqhwEu2tDX3CKjJfw3H79Nrf3xvK+T1E20mxZ0KXkOoD7fAXtmTOD8NOHxy9GxcTM3/c6dt2KpwPz/QuziW6+qAqk/oXBxeFWONFWgzeozbeILQ5cXR3iB/NSbgWnelOypsPL1zSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157379; c=relaxed/simple;
	bh=pMjY9983Xlc88h8R5u18Pz/l2ARVqbS7uUVOa5DBBgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AGJnegH5ShB1WnZJ48VNeIXg6cCw3cOSUZY8UUBWoa/ildLntWELyGq5n+KCY/hCEVI+6RKzU43t1mlKtinw1JvRm9obZTNWPlXDfodiQ9AElWXeh9sopDTfYmDPTAddVqxlA9UOInOvcYGdG5RRnHB+724gwj3gymDrt624U9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=R+J0Eoop; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="R+J0Eoop"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e6dcc22cbcso3697722a34.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782157377; x=1782762177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vBmXnwn03oc3U/w10vJ5c+8dVUv/tPsH8H+LzNeyaKM=;
        b=R+J0Eoop4uXjDgfdpwTtIsCBWKnF9/23LzxhlNaxMTeP1VmOwVqRoRtoc3Qu+Cz2/N
         N1hlhFCEpt/2IM7eqRw4UuWkMFnRYgWgdLLdNtJC/PeFxixsfOlPg0kSIlc1NE+KohoI
         FmnBd2JEzLSWY181qfk0ZLQivWhl6jOAFaU2speCsoxpPVVdU2sPMMEeVLwHoP9CFxIy
         M9hM4FUEpFFYVT4cUndXhkqQ9PHb9aSJU6qIKnzDTheWRlMkKV6hvSxO9Ahw10gLXOU3
         aptjhkkR6FyNQ+6tfWcu1asct2DsFftCHrXU+p+zuos0xaPQNIw4TvCg32JU0oGCBQZp
         MAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782157377; x=1782762177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBmXnwn03oc3U/w10vJ5c+8dVUv/tPsH8H+LzNeyaKM=;
        b=HygPu0n1CL+UkzEOpSjuiCimCsD44bOpqXOPPAVGoh+7cDyDPQKv8joSuBHmfIygh7
         wb6BfZmX8qravS+BYovwLh8p8cRyykCZTI57GDqMFoHVgFNPit5iCtDi9tqa6wpgGL4D
         ask6lwTpwEUCl+F1NsCFiup7rvo1nkisrDoT7p098yQm07kogCnpyExIkKv4nwhIYueU
         r5Ta1zLTp6A0tk/Y3P/26JmyXDUfYKoE50gCb7jVnfcsVmtE/Titkew4yXLxk9zikdoW
         b+0rQTaJU6so0+8eHx343h0mgEbUdg6pt0BPY+xbBDrUG1mhIxNhf8T3LL3D2W1W3sJC
         t/sg==
X-Forwarded-Encrypted: i=1; AFNElJ+7hrP5XSGIBKcJWcH4DKeigt/kYEYpVbjsUufqymyGA71Da3Q6qxNKVE3CSUVeRsO0rhLOaTjP4rTm@vger.kernel.org
X-Gm-Message-State: AOJu0YzJT4cput2btq3Ek1DtTSW0CVu4GnXhL4edQupQHI1BAQBIWB3H
	tU+HemVcfKc1Tc0i14JOVdVq5p9wqfrDjZiA4KCx5D7jlkkJNyzyz/SSKiYGupUKuoM=
X-Gm-Gg: AfdE7ckRDu3w9OFkhPr3XeTq3s1yeg02F7AN2Jqx+UzigfwYWaT9MerHYYKUdXb8oxL
	s7noKakKq9weKQABZo3+eeY8DaCKsAbm1aNLqQ77BRIv+F5GrXK3M00qcKuzheHjl7Bl9UhDha6
	+nTnodoErMPkEaBvj417TZv3vPk1m0HoPNJnLylLhBJQRImwDD3pBkCZvtqq9kipZA1ap/A/5hR
	hMI8U5HxHlFaW5svoGmJz5d6ew/aJobVEE+gRAr6jynK0RYVUEZJNBr1WSJEgZ51jZ5ACI6AYLw
	3KZet2Hkp49kpgwruuB4zJoKvb0gnoq41lBEZTBmvKWijLJf9ZwbjFEdny+N1Q+X0miyRjHnfcE
	fFexPRc1TIwd7NYQ/uf+NiQk6HDazFGQEiWuzVjojvZj7BjGcM00tDCnmeJtnnmDKs6HUqwsmwq
	DZcbchI+V+Ge07sHTpKzg2h557Nj+WZhMk9MDWMY5kM6VOLCqJXFZahPDoO7o9q3yHP4+8s86Do
	Q==
X-Received: by 2002:a05:6830:6ad8:b0:7dc:4a43:fb5c with SMTP id 46e09a7af769-7e92d8466b2mr14360330a34.11.1782157377418;
        Mon, 22 Jun 2026 12:42:57 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6526:8577:6be9:cb7b? ([2600:8803:e7e4:500:6526:8577:6be9:cb7b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e944007d7fsm7005358a34.2.2026.06.22.12.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 12:42:57 -0700 (PDT)
Message-ID: <d02bc959-ea69-429e-a526-04067f5f70b2@baylibre.com>
Date: Mon, 22 Jun 2026 14:42:56 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/3] dt-bindings: iio: adc: Add excitation current
 sources properties
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260622-new-channel-props-v2-0-aafd5369f253@gmail.com>
 <20260622-new-channel-props-v2-2-aafd5369f253@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260622-new-channel-props-v2-2-aafd5369f253@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/26 2:30 PM, Kurt Borja wrote:
> Some ADCs incorporate current sources that provide excitation current to
> resistive temperature devices (RTDs), thermistors, diodes and other
> resistive sensors that require constant current biasing.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> index fdad6b8276c934c..160a8cfa9842a86 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> @@ -86,6 +86,25 @@ properties:
>        source. If two values are provided, the first one corresponds to the
>        positive source and the second to the negative source.
>  
> +  excitation-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Excitation current sources provide current to resistive temperature
> +      devices (RTDs), thermistors, diodes and other resistive sensors that
> +      require constant current biasing.
> +
> +      This array describes the mux configuration of the excitation current
> +      sources.
> +
> +  excitation-current-microamp:

As seen in adi,ltc2983.yaml, this actually needs to be nanoamp to be able
to be flexible for all parts.

> +    description:
> +      Excitation current sources provide current to resistive temperature
> +      devices (RTDs), thermistors, diodes and other resistive sensors that
> +      require constant current biasing.
> +
> +      This array describes the current configuration of the excitation current
> +      sources or the single matched current for all sources.
> +
>  anyOf:
>    - oneOf:
>        - required:
> 

