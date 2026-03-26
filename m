Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF04C26FA60
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774529718; cv=none; b=c9M7RX0IizA3DVz5M8Kh6WHzPJ5aQpCvxY4F7NmpkTDtbpriX6wkVYhHOuo11NtDXFyjVvR0XH/3yUwAdiBJEzSobIrBj8mnH5gARwVYn+z/VnUqSvopJ3perBCxhpZPRk/eH7X1twY1tIiI1o0U5Y5okyWp8g6/04GV50eb2Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774529718; c=relaxed/simple;
	bh=Y0FF9WEp5KmFXbC+L8OjWx066EP02rkF8OEbRbkcYEg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eOiAkyMyQxeUerKqBeJnIDiQ90tH8rhnqhRmjrJ0tGX/f6cTOuYvoQSkAkfiak16v2k26LDC3zsi7wtjomdplKlErvbfl7gu1d5Wy1hbis+ZF07vr8tIWin+N9XXMtbK/nBfLgt4YVOTXrg4MWHS5LvjrSEYA+/gigpN1jSgYHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KJ8ufbuQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KJ8ufbuQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso8203855e9.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774529715; x=1775134515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X67yw9hp70DJW5SbayvQBOmUIp03R92/bYFmSlkehKU=;
        b=KJ8ufbuQUFmOzhQDZvCLZ6XVPxV0h6G5EVwow/IApzRkh/cr0RTs94Nvvn5GWcmRm8
         0kYHkw5xqF3W5fR4MfNdp7XkttG9TpmjSKIS7ccHHwM4+CZD8cFEhsi3jzDp+zMRLHon
         ooUmd85gyEX6sAo2VmMsSPxgkpNPO6x5Jgw496YopxCOoMqaAc35ql8xhhtlSFVtfFuO
         XlTvhuzLydszWUNQG2vNjWiKrjsIp3DGG0fcnbnzC9wP9KYBvvxNchZdmGtN21UnGPKm
         pvC47s7rP1SSXvLU7NofnInnhtY69HsiJfaVHtnlx806r5tkeRPX2gIioZNKSPWjpxwG
         OxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529715; x=1775134515;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X67yw9hp70DJW5SbayvQBOmUIp03R92/bYFmSlkehKU=;
        b=JGISMyIebgmjqbgaXOogZEmyW4HaASJPi0/dorZA807NlHTatPt7yLAfUnB7Yaw0vm
         fxEDZm3RojtS3XAEx3j0rpsrIhZr1Qq5BrUtkdO3mPxD/qPpqUbb7X7L7iT1KDRg7DHn
         cS8jBOzCrrek7m3XYgtDddJtOocIiu2Ab8J25wMUHrXrDr7j0AtOd25gikp81vRGWmQI
         hfuqRnSh9RTJho9WFMQwR8duqss+/izRHKbJ/e86RPGJjE09HSzfFOobBi58mTPcoKzi
         Z4vme4aAbc8vOZnwt6Q0wyYZz1BFAtZkgSEjrj/Ot20uBjUK/efgBuITpJ0HuSZCgkpm
         unPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu/ii9JqxRcLs/a8SDaoLiqNIcgzyCpvl5jl+7bcc88WHjYmH4NYIeqly4HKqgBlxxAZokjmWC5eE9@vger.kernel.org
X-Gm-Message-State: AOJu0YzYrmJTvkT7ffVGcusHf6WVgPTj6dqH8AETNkJcnG9VwE7Ln312
	3yaMZ2KvZ5QDEv/ExmAW7JL3yK+OxjVZGjyei42OnvS+CgjXw35FUSXcr4847PGe5CE=
X-Gm-Gg: ATEYQzzlmdG1Q9GaK8wUTUkzN/S6gIyE2cfWHvT2szerRc5GttvlvcHafBwr07ho8vR
	0eBWDAW58Qma7SM/hSZXJIpJyg6ZUpheQSU4j8mtpq+U16udSLwZRnUODzTKkzOhCSJpKZuV6sZ
	vqYcUUKlyfLhqlFFrLhaSMq7s9R3G3C6G4v6gxLmvRnVfy3JqrgWpR6oloRX/3B9F9sSGNcxzGN
	9mfufp7Z5SDDNypB/x5xSPVBWc+rA5oMYPzK/nWonn523NBcSFt40xEhFTG5AqjDGvtSJqCjkNv
	Me8SstBGO5CNM9eIO+B6wrHBj/keDkw7fTnFvb1zuSBJYlKscB7BBSWqwQtUhyNpi+zLQ69tHMO
	pX/IDvFRRSsdeVv9N0ZncX/tpcYMPzfnZI92xTbFGIpMCmBI+T1pAIxWdNFUDMJa/KZgoyLYf8n
	FBn6b5ajdCV9WTlveXYxyab8z+7lfJmwZrVGW05R3zwf95U+9+ZzNxOegl6EPBmaRbHX1AVxe8X
	N24v4NAju5b6Z+IiQ==
X-Received: by 2002:a05:600c:1f12:b0:486:fdca:ea8d with SMTP id 5b1f17b1804b1-48716050758mr107584965e9.25.1774529715255;
        Thu, 26 Mar 2026 05:55:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487209378e2sm14061155e9.31.2026.03.26.05.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 05:55:14 -0700 (PDT)
Message-ID: <9bc23f1e-1cf3-43d1-935a-c4738d576c29@linaro.org>
Date: Thu, 26 Mar 2026 13:55:13 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 8/9] dt-bindings: net: wireless: brcm: Add compatible
 for bcm43752
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <20260326-add-emmc-t7-vim4-v5-8-d3f182b48e9d@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-8-d3f182b48e9d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/26 10:59, Ronald Claveau wrote:
> Add bcm43752 compatible with its bcm4329 compatible fallback.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> index 3be7576787644..81fd3e37452a6 100644
> --- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> @@ -42,6 +42,7 @@ properties:
>                 - brcm,bcm4356-fmac
>                 - brcm,bcm4359-fmac
>                 - brcm,bcm4366-fmac
> +              - brcm,bcm43752-fmac
>                 - cypress,cyw4373-fmac
>                 - cypress,cyw43012-fmac
>                 - infineon,cyw43439-fmac
> 

I'll apply all the other DT patches, please send this one alone with the [PATCH net-next] prefix so it gets picked by the wireless/net people.

Thanks,
Neil
