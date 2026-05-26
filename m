Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FB13B7744
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779686; cv=none; b=QwYPGkYjIjm7Tnnk5h4ZEot5llkYPhtoWCNIDUACucNZ4lu69ZXg0iSSA5Iuk78/PZ/dnAuaRq0Na/SOjXsfDLLkR+Eqm820yvmSDkF7lq5MFlsENsIw7Nib2pDAMsqCOeFwocCBScQj0hIlEJutY63WyHW9Gl9GO+HaGh2iIiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779686; c=relaxed/simple;
	bh=cjmSgMZBQqtrDKgzXep52C68RW11t7FWOD5rw1BSI/M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qfxhw3BS2thk6u0ffUMQFGLZtemsI1fQdjlKBqStfpItE5ukPZo0L0XTPZsq2LkYPFDrhBwzga1LCKnmrExnYGAN4/LrbCbKUu361dQlcheeV2JW6ciaoWlhdWvGm53scOVfwyhYHYX0zhKEGE5j+RMxv9ePwKwoVFIQUuWb/2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2MqKXTC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2MqKXTC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-444826c16ffso8706340f8f.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779779684; x=1780384484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCUC1w8o3SPo/dQIjvTcR6pWtcHK4WC6Ve79t1hbi2E=;
        b=q2MqKXTC71t9DsOh3SdPTtOUnxCBOFaPJoXN0MqguQ76CbZyFiDcDFlF+sEjxLPuKI
         bjz37aBSeIKrNDboMSETVP/PrImjuw6j6L6TACW27MChbwavpiu/6g5877V3zCDWQkBc
         hEZikSh5iPmA8FmtVsgaWclWkQ86SfaPD7OVzuJesLuLOlVHgbvGwqesWbCrD2v41IeH
         ZZ5Y6s2W26j1DmWKEV58oUgBWSbDwc27iqK+weKZlN+xyopvA5EVO98iNDGse5D7Gnk+
         f+HlrKYNA5MfyBW6RFDeJgtWNB8+qvqsCYslb20wbUiot+BZwfwVqtInShrekJklXtkx
         DL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779684; x=1780384484;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCUC1w8o3SPo/dQIjvTcR6pWtcHK4WC6Ve79t1hbi2E=;
        b=I0keCNyeRJRQ8ovl5Q/C3eBznPiwl93OSQQ0Q7uqUcj0hXNDSpG2EHKX8I2tgFxxLc
         Pzok+eReQ7mIKzzaGd12GnXHx0/+YKRKWTW22Y72OjCs7C5kNNY7zsoOCIURcSk8Nsag
         bsl8hcwE6UfuZGC4Cjd79ACkSPVK9zHstAAb3nk1ak+bPY6D6WSN67kMWHKlZK7i4023
         ql/l+YYcXDi2iiwEFSu3cy4S20gOjggovzkoxr5CDprLs88X0T0I30zKlCH6KDxCJU2Q
         aImIWjsrd9bUT3JRY63wwx/eGQyDWM3wsFwQz5yktHxz+e8ESvFJpSzTSY0ZxE4B154s
         0WwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gr9Nlq3UWfe5yPcSxS419bazrKVxPTAJPmOXQDh5ZRsNAwAuK1jkZPFwIjBbtCLHcW9GholopP1nV@vger.kernel.org
X-Gm-Message-State: AOJu0YyN7AZ39CjBlgMKK9OxlHHtYPENnNA4uaaibpghqEG7ThtmM7J9
	wyuopP4eMIsiECleDaQ62LSf9jYf8GoRML31PSyWR1IIA/fWycCx98QjAV2KiH9xuxY=
X-Gm-Gg: Acq92OGmVEenTnKcD9agUifKflXGXkTxcbcHPYU1Ufk5ybTmbXXqssnlkrBFMYSfcq3
	Fh2bmu4wmHOWIK2va5gPT3KNnJstqBCmi2nLUpsQ1c952Pl45Kl7USScaKJcTZQcWA9cxCdK8ff
	EkKmsmM29im9rPOEd4zFv/8FhhY7lnIu98b4PIcFTd/07pxoK9JMjehOwIc66AqEjfBOcGMLmKW
	5ZLndVQYwp5CJmWYfPYSixGn6VbWSArsVLIM4ea4sw80xUgGguGwxNieywBZ/g6OA7f2lNU3OtH
	+bFCRaxggIxGemeEq0ZI3CYY34KKPmJfzuxYwEFF+/2cB4UrefFyCkkkWoc2jHlvDFzxFNwp6v+
	qZoysTJ/zTfI75PlJpdmcX4oFnvb9SQ2oXvyEbbgJQgGcwWxwZ1uYgpkWHq9xoxunnpz9fODzdo
	ACHSVkJuymwdMcLAmnU1iW5fet+UgxZlEE9/c2EhL+yC74r4/5GrBv6+nggz8fFyhUcVCdqfFWV
	r5myX0=
X-Received: by 2002:a05:6000:4283:b0:45e:633e:a7cc with SMTP id ffacd0b85a97d-45eb38bade1mr29186012f8f.24.1779779683519;
        Tue, 26 May 2026 00:14:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:aba9:2be3:1465:636a? ([2a01:e0a:106d:1080:aba9:2be3:1465:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cce01asm34146772f8f.11.2026.05.26.00.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:14:43 -0700 (PDT)
Message-ID: <45081b91-7b49-44f0-998c-af9927deadf0@linaro.org>
Date: Tue, 26 May 2026 09:14:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: meson-axg: Fix whitespace issue
To: Jun Yan <jerrysteve1101@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260524154954.385778-1-jerrysteve1101@gmail.com>
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
In-Reply-To: <20260524154954.385778-1-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/24/26 17:49, Jun Yan wrote:
> Clean up whitespace misalignment in meson-axg-gpio.h
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>   include/dt-bindings/gpio/meson-axg-gpio.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/dt-bindings/gpio/meson-axg-gpio.h b/include/dt-bindings/gpio/meson-axg-gpio.h
> index 25bb1fffa97a..a0d42bcd9bd3 100644
> --- a/include/dt-bindings/gpio/meson-axg-gpio.h
> +++ b/include/dt-bindings/gpio/meson-axg-gpio.h
> @@ -23,7 +23,7 @@
>   #define GPIOAO_11	11
>   #define GPIOAO_12	12
>   #define GPIOAO_13	13
> -#define GPIO_TEST_N 14
> +#define GPIO_TEST_N	14
>   
>   /* Second GPIO chip */
>   #define GPIOZ_0		0
> @@ -52,7 +52,7 @@
>   #define BOOT_12		23
>   #define BOOT_13		24
>   #define BOOT_14		25
> -#define GPIOA_0	    26
> +#define GPIOA_0		26
>   #define GPIOA_1		27
>   #define GPIOA_2		28
>   #define GPIOA_3		29

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
