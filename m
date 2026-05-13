Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF10345CD8
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778674889; cv=none; b=bWb9ux+O3RheTSYB4pIm6Or3p7hvHmtUnFU/B6LjLv0YrbyHvdf8ttMx7JK8Z0Fa8gX/KqZJapriGgFH6x5FeN0+j9WYuQHnRXG5Yqa6rBMd3GZQCuvRRWBnEXdH6mHW00HnTQCTmWWNhHQPg3qkMgQs/Dz6LfOqZ1AbBImls5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778674889; c=relaxed/simple;
	bh=Z82dLXYF2fYj2lFIS5lqI12k7RcfvF4UTANbl7NGiKY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JEAuL3+UR3+vpB8LjdWNuSKOf45VXxrxGkD7MruFHBBOdVlKut14lwOa+qTbMF8/LEe3cTKLnV/LDcaFh0oI68LubYPkgVSlQwgBXJNT1B3s0DCT7FIRWQ/izXq7VoIv4AjaKILAruEJ/XgTKSpvGjbvcCzEB2Ra69sph5UG2OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PC6zsvwG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PC6zsvwG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso40569535e9.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778674886; x=1779279686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyU4Sq6iUSpynWqIwbV4HNx55pG0GP3Xn1AeqfpoAcY=;
        b=PC6zsvwGVq/SgFf/EBtBgKftZW7qiwKRJtuEw5GY2p1rnBXXbyNUpY8c0TY9YeBLHc
         NVkTYGqG6olIG46m3UYH3jAw7Hc/r4WXSTGMAPYKkcA3NOVIPTBCzDgcq9vguVm2msdK
         S9aEY2GhVwT7t/Fdb1y4O6+3VZRLX8qAi4wlFgNbD6RCh3mHCAd/ODw3uxGT4G7q4P3C
         RdBXghAgsDJZHqUHxq7FKx7AvzS5FCgD//bYoPTDb603ieqQBeIJKAecdaXZCMkd8bSN
         F5JKZ9K9BEfTDtCckb6AMQ8nrjbWgRJHK3CPSHzYcEZastFViRzFoNjinnFvwkM4o284
         tGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674886; x=1779279686;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyU4Sq6iUSpynWqIwbV4HNx55pG0GP3Xn1AeqfpoAcY=;
        b=WSvvGbYdoI428Z9naU2/F2YAJEW9dMStahiccSil85UISlidRsvfkEkU56nkPBRXZd
         PpxRhlfy4F7kTAJ54qM0QP3Qmhsr5/3Anzn3zsfpyvKcjz6Ysz9rTq3MhVlq1/j3Vua/
         GBjrnfrDCU6WSLoiaJMYkhBwqneH0Aw9MVulBQHC4G6YQv0uzbDij24LZq5t7tAPkCuS
         zbPzU2kFuCgZcHwjKpspj9HI57UDKekKJIvcqY8uQPaVqaYHpxDNbkBbtiNaPsnPf6Ot
         r/RMtThlzWmziEHtbU6kuv6WpJlkEN4HfKjXxxUvk1/wC76szUUZT3OJ5mnv4GsKe+1v
         bmIg==
X-Forwarded-Encrypted: i=1; AFNElJ/GJ/NTrpwsHV4h56fSNsc8EhJdRkYKihg8RHPykLwkrC0d3bsrY+yFCbCEFfNgknxQORw4lR1gPxz3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfm8FEIwUAdTpqukxkRDmPrHyoeqGq+aWN1MsdF+HPs/zqFI9R
	7ylbi1Hu18zrar2LvCma0Mqsy9tkeglOVzqn8NE/1rHAv2/PPtr7bKh/nZlmUd7CdyI=
X-Gm-Gg: Acq92OHRf+pi0K2R8K61tZr92BJ26BIQ6nwPhn97zChK8axkkzCbjqtty7si3j1OhWT
	UZ6FKCFpMmFj9MUG0mZErOhSQgLzd4Z/Esdd8f5gHlHHp+woiq5DyqSqpIINJxAzj8l6Ko/+0+c
	LQCjpQ29hiTm6l46/LkqLWw8rSe6G2v4DDSJAYBI7sTDvZEOF4Fv3tV/gJhEeNJgV26M5GAXVx5
	cA2mNM4hfO7zclzhzQeIRaF8As3+KWaJAOfu7ExxQ6txSx8kqz+Dbherr31RVAdip+K5viBzRGw
	I8+CIu76ACSakahgcHrMkW0sL3Xyml9ZbNz84vA9urFt3v/JXjeqkL7zGS9B5CGl6Slifkxjn0i
	VmhYsKg56BqpCeXUkflKr4O3Z49Mmv3RYi6uHJV92qt3lUCn1rd01RtcjbZFegn3zLdL1uh1n2O
	NMie0makjAVDCXy/4bWRuz469KnudHFXePJX7vq+I7TgXeGhBTxM2h4iIKEo67946d1i/S4yZSh
	UuOeqrRiJyPx5M=
X-Received: by 2002:a05:600c:19ce:b0:489:a4:e578 with SMTP id 5b1f17b1804b1-48fc9a34777mr40690665e9.14.1778674886244;
        Wed, 13 May 2026 05:21:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d68b14sm71555635e9.12.2026.05.13.05.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 05:21:25 -0700 (PDT)
Message-ID: <f965ac54-f302-4e0a-b079-564abcaaa38f@linaro.org>
Date: Wed, 13 May 2026 14:21:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: amlogic: t7: khadas-vim4: reorder root
 node
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
 <20260513-add-kvim4-sysled-v2-2-3ec9779e8875@aliel.fr>
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
In-Reply-To: <20260513-add-kvim4-sysled-v2-2-3ec9779e8875@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 12:43, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Move the xtal-clk node to restore alphabetical ordering.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts     | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..fd1b983354a01 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -45,13 +45,6 @@ secmon_reserved_bl32: secmon@5300000 {
>   		};
>   	};
>   
> -	xtal: xtal-clk {
> -		compatible = "fixed-clock";
> -		clock-frequency = <24000000>;
> -		clock-output-names = "xtal";
> -		#clock-cells = <0>;
> -	};
> -
>   	dc_in: regulator-dc-in {
>   		compatible = "regulator-fixed";
>   		regulator-name = "DC_IN";
> @@ -155,6 +148,13 @@ wifi32k: wifi32k {
>   		clock-frequency = <32768>;
>   			pwms = <&pwm_ab 0 30518 0>;
>   	};
> +
> +	xtal: xtal-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xtal";
> +		#clock-cells = <0>;
> +	};
>   };
>   
>   &pwm_ab {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
