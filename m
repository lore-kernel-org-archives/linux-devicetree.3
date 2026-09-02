Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B441481652
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 18:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373928; cv=none; b=QqVLP3tsznMY4sc/ZgV/aV6PtXjXC/noBaY871IHXdyUkMqXH4NzrTI+/y6/F4pxNV4dboe04u3NclgkTiE0Nh+HRNjHac6eH6dHykHZUk4GFsMN5J7DBGMMMNZd8P3m2B/J1LICav5/85RtbFosdKKUw2uhC2yksVrfAc7BBVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373928; c=relaxed/simple;
	bh=5SbQ4qVfDk+O3G5b8f8HVnIF2DIqTxp8g+oQUr1NxyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2B6lewYJ5PTiGQEqoioI8dpePpgoD2CUCXDCnh/W0Qmyd6Kz0vvS1ixstdJX3GZz+tYm8naR0RYXep8O4tZpjlo5P1mLAcAMl3X2yCSG3iPUJnv3nCABNgS2bB3e8SJHSr7itRxoEGne8KH65N5EreUyDGB3rEnHbl33yhlq2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SWcF0QU6; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SWcF0QU6"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4472500e25fso757638fac.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 11:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788373919; x=1788978719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yi0Sf+aTtT6rp3DHMlcGuCDc4NN0FWj4XsTs8T+XdFU=;
        b=SWcF0QU6RhZnqsXP8ya+9RlEFTJFGKOAhGTzhyd8dRoK4sJ0RBIvuZaKxeH3turVNU
         LlrL3sbfw33+m6Qul5qtdqataDzv64uyyrrF6F4QD0MENKQ5fyA3BugKklixuAsNNqsh
         nSPMl5fHJ1Xuwu6iPyUJbZYithVB34ymu5snpRxPsttu3/LtLw1vpmBSoPwHlD4Qaqo1
         HiFCuYmq3s8m0EHpwO7sANzRLNj0WMYqDqQY08YQRUpSG69OiZb6VL3q3COMwDesn5q3
         LB+Azsm334Aiu7/fevVoSCpHWkjPgMjtULV7rkg//5YjVYWpqG5VjYR6p1axnYNNFidb
         FmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373919; x=1788978719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yi0Sf+aTtT6rp3DHMlcGuCDc4NN0FWj4XsTs8T+XdFU=;
        b=IvurFm3GjaUULDhlCG9nLoQqfqZresmXSrqmNp0K437+HD9yHITxI3BSReei9JpVut
         /dGpXOEGZwQ7Kd7WX5wTGz8yXbOdRtoLzvlxx9JElbab1w8k9T/bpiSdZD0P3UUr4mP9
         2/mlqgEsQzFi/gVcrpV5+tALWmq1VqWX+glcU3Q11YeAzOZEHnHcbnxJJCCoua5YMrmk
         A1J4xFRg3u3lQpuThqDkhI5g5KhOeKQ9enE+0Qz78FrhIfmPC/B3m1D9tWvMRKO/1W18
         6XaBbkBGvCKPZWJ9EUetmC76huztBUu32NqDMIN3QtFSEFJEJ8qSQeohMd52YTOkPIPi
         43LA==
X-Gm-Message-State: AFuF++mgWG++SPz6lJFZxoWZRUT5o2R3g3yamK2DSzW8Qn/jwvUxHIKy
	NlCmPxGLiy8jfTFMAxURVwqv+N4d9CLY48A23N2NHKhrirNPkoUFZmA8bDmrrA8XNKw=
X-Gm-Gg: AYBFou3Bag9TWOI3GsjgV/OyU3Nf51RuXXrkcCj+Dw2/eY4ljQrbWe86s8LsEicjz6/
	TEE7jzYWbZIcWZIMeM6Z+T2t9Pw+gzVkSN++tBuG+qSeKgfWDsAKNevXTgYSs/xd/JeRfaegH+k
	lXE81Vmltl1rer4uSUK2gXyvX2+szZPzFb1ZcO3Yyv00Gm8rVzfAjix0GwkrSuZdmbb4v1Kyoez
	444tr/am1Dcv0aOfk6Z1FijwJOYcaG0c2KBtFpmQrBtcYp9bXASFq7i1XrRT3snzk9ZB0oxRE8u
	QsL51zZSlzOJfXZi2LPLVRpJQbbkdVpcxNxc1BcIpLyfsk+2fmR4ByFSqANR6p3G8WJCe3OQNxL
	Wozz6xH8apTGyszExFiH2lJ+kQJ0GIaYT6vckdzdPejxNHJNSoLcgaVSnV2i9gImWx7ncAFPfFZ
	kObr6Fs9nSRx/AAZP+lMENPKu2xDGMAKakljRN6qEnhiXqbitL+vq2lJcRSmXV/UlM0WZpCInHx
	QoQq2b9rw6OZSOz9KimCyPzFLixLbkrwEFuh5I0
X-Received: by 2002:a05:6870:440c:b0:46c:feb7:5443 with SMTP id 586e51a60fabf-46f8341bc02mr4883463fac.0.1788373919124;
        Wed, 02 Sep 2026 11:31:59 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:518a:9db8:615b:293f? ([2600:8803:e7e4:500:518a:9db8:615b:293f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f32933b9asm4606620fac.9.2026.09.02.11.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 11:31:58 -0700 (PDT)
Message-ID: <60dc58c6-dfe2-4377-9a73-f65cda56179c@baylibre.com>
Date: Wed, 2 Sep 2026 13:31:57 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: ti,ads1015: Add label
 property
To: Flaviu Nistor <flaviu.nistor@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20260902172230.5234-1-flaviu.nistor@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260902172230.5234-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 12:22 PM, Flaviu Nistor wrote:
> Add support for an optional label property per channel similar to other adc
> chips. This allows assigning distinct names for each channel which can
> match the schematic signal name.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
> index 718f633c6e04..777a75c21d7f 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
> @@ -66,6 +66,11 @@ patternProperties:
>            - minimum: 0
>              maximum: 7
>  
> +      label:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description:
> +          A descriptive name for this channel, like "vcc_ram" or "CH3".
> +

Apparently this chip has quite old dt-bindings. Normally, we would have
included adc.yaml to get this and other channel properties.

And we would have used diff-channels and single-channel from that to
describe which pins are associated with which channel rather than having
a magic number for reg. And the ti,datarate looks suspicious as sampling
frequency is usually we control at runtime.

Anyway, none of that is really relevant to this patch. We'll see what
Jonathan says about using adc.yaml here vs. adding a label property.

>        ti,gain:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          minimum: 0
> @@ -125,6 +130,7 @@ examples:
>                  reg = <4>;
>                  ti,gain = <3>;
>                  ti,datarate = <5>;
> +                label = "CH3";
>              };
>          };
>      };

