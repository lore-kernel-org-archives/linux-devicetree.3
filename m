Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5433939B0
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 19:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244459; cv=none; b=emosKhu2KfzjbLa5FyxQFgpiCmKzbhAiWVwRrLLZPV/0wxxIG37nLVoL1h2UJ02uIkJ/rBq6fYXSz6H+8y8awBmz7/YGYpSLWuEm7HHKc8iRt+qn14UbnzFlDQnxPt4kZUFxAbCiq791joShd5uWrLKiZgCCfiMr3NGkfQXkJP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244459; c=relaxed/simple;
	bh=kEtYiwGGXfxf9OZgvwT4esSaZCDsxd/HBEXxCtejDdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0QiPUs0rxgYaFDHRqd2f+lrHfIYlz9ggE7S8l1kmWo61vCiizcimkDyDqSCFnpIgv3h5hThnmsYgjixZgBsK2bQP4vVvpXhU/NVWF/+Nw7NvNNlAFp1o/9SCDtzpPx9suJztHgLt5oGoCuYtf87Pd3BP63hRPHezmKUIGOco5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LxzfCC+2; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LxzfCC+2"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e936c2473dso877452a34.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782244457; x=1782849257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=psbJjHxePMcruU5APTrGLttW1uAsloPB1ho5xqlQwMM=;
        b=LxzfCC+2hNSYGs88bSYlCl0yonuC40HHtpySn7CoiqT7ZQ+TY4JpX5nsKMKpsKgFxe
         6qDMW9lmoDmjhmfZfP5vW2wDavmzb3dzMHZkDtuVkGmL748m/o6Np26Tj5+Ypk8KGabp
         BHbROhKFYhpf59olIGOXisNWUjSwcHS2PJ9Sa5so6aoxeI+ESYBlCc1iNfkXfsht5TB9
         rJ3gUuu3joXteh/oz0nd+SP2kdb0G+HFr61gWMx2fkMXLZLbr0vumo4utJVYjk5VCi65
         aw+HXokES7pB1MFmToWul7GIf6b/xmInLVKT5WXUMKzPoUvpvmL0k0SzcePlPsP14ruJ
         dNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244457; x=1782849257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psbJjHxePMcruU5APTrGLttW1uAsloPB1ho5xqlQwMM=;
        b=eLU7aqJnkeZ6jM9XpddSQm67nF8zbAgFdRnpq9KxdjGiFvLoHbx1OZGNfpJKJLgjjd
         ePCmjAIASbOrXbh5yZARzO37q80y+CXAz9IZRAPaFWrnYCw/XYhwZdikqy+Z7uQphxyG
         NJfTDUb5tukZM66fTGhfeU+i3aQDja+pkGzaDq7LdQRXZIFOjJgQAN3g+QB176FvSWyE
         +JWaolxFPrqlDZVnhlQPRYPP1UF/xYPQABECBvenxZlULGUFpeF48TyMdkaF/Ltk+obG
         vCgC3haBAjZD1rv+IwitHteLeK89j75W+KmFMf+Mt4z4FQ/D8Y8vD+dZEB5StsBZus02
         hdqA==
X-Forwarded-Encrypted: i=1; AFNElJ/zGksWej9p9Tz+EmvkmNz/U+PmY42MBZbfSFgkIKFAxWp2JPiEup5Xe1HvpFfTm2Hi5rU4IFzHtN29@vger.kernel.org
X-Gm-Message-State: AOJu0YxsAJi4+2HDAIiXMFIMgIx8+TkJ+MGwUhBuBGafHTD6flDOJkY1
	xORZSrAk2v670pD0Md8vjbgGfaP4MaFMtLiQoPTXqUGGfayZ8UxUVTjjR8dZesrKZf0=
X-Gm-Gg: AfdE7clmFfhtMt8BM1T4i8ekxLbQPe1DK743QmQi8ZO3ZycpYlXK9LBcbOMvO4sbx2W
	wugAqk1cVr3dpaJlQ7TT02tbo3RHOZxDWbeBaNWkCHxM+PDSrAjEcftcdt4SAO+MuGU5ZodH4Gb
	nmXKqi4y2J1+23nLfDcwrBXtQBfVXgq1g6eswcZJYvBaDJvQvqcVW1EWm0rbjgRt3VX493gnAoS
	vq/j434kH3JagAHQ4WiCa+M+6OagwOwATJDs82CJ+Rwqnkx6Bvj50JLbF+G/ZMkFAZ/7Yjc1fO4
	r331Y698Ok2B4CcK7C1et2RlHR3qTO+OQPFGZltgXtW4JOK9oTah+b3dzp3q31dPayveTEfrOqR
	7xdRN6XYPyS6gR4VKfKNYKKVFiRmZbcbFtnPM2G0KsiuD9F1uSJNhsBZjRuo1YBIvXjvsGei1T0
	5PPWyxQujN2OiXT6vJP6ia3kl5z1vx7MAUFppwMIvHA1lOVTrs+Fv2NYNil8sPjn8=
X-Received: by 2002:a05:6808:6f93:b0:48a:c6b6:b76f with SMTP id 5614622812f47-48ee45925eemr3311675b6e.20.1782244456969;
        Tue, 23 Jun 2026 12:54:16 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:68dc:b788:b3ac:e34e? ([2600:8803:e7e4:500:68dc:b788:b3ac:e34e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48ae8b3b1efsm7202725b6e.0.2026.06.23.12.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 12:54:16 -0700 (PDT)
Message-ID: <9f206645-9503-41f6-b33f-9f96b472a1d7@baylibre.com>
Date: Tue, 23 Jun 2026 14:54:15 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: iio: dac: Add DAC8163
To: Lukas Metz <lukas.metz@gmx.net>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260623-dac8163-work-v1-0-5b508158faa0@gmx.net>
 <20260623-dac8163-work-v1-2-5b508158faa0@gmx.net>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260623-dac8163-work-v1-2-5b508158faa0@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/23/26 11:07 AM, Lukas Metz wrote:
> Add device tree binding for the Texas Instruments DAC8163 family
> including the DAC7562, DAC7563, DAC8162, DAC8163, DAC8562 and DAC8563.

One other thing worth mentioning here as to why none of these are fallback
compatible (in addition to the resolution bits) is that the xxx2 chips
and xxx3 chips have a different output state when CLR is asserted.

> 
> Signed-off-by: Lukas Metz <lukas.metz@gmx.net>
> ---
>  .../devicetree/bindings/iio/dac/ti,dac8163.yaml    | 75 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 76 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac8163.yaml b/Documentation/devicetree/bindings/iio/dac/ti,dac8163.yaml
> new file mode 100644
> index 000000000000..bb4bad389323
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/ti,dac8163.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/dac/ti,dac8163.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DAC8163 family of DACs
> +
> +description:
> +  The DAC756x, DAC816x, and DAC856x devices are low-power, voltage-output,
> +  dual-channel, 12-, 14-, and 16-bit digital-to-analog converters (DACs),
> +  respectively. These devices include a 2.5-V, 4-ppm/°C internal
> +  reference, giving a full-scale output voltage range of 2.5 V or 5 V.
> +
> +maintainers:
> +  - Lukas Metz <lukas.metz@gmx.net>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,dac7562
> +      - ti,dac7563
> +      - ti,dac8162
> +      - ti,dac8163
> +      - ti,dac8562
> +      - ti,dac8563
> +
