Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FB73845A0
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674875; cv=none; b=fR7DJKazetIVhIjWiZ+QmHfl+nGFFb1Ao5bCw/RVpheK9eaxUUzXw3nHdw72NL9x9CIqgkDVOsSDbeamL8ZAnUFMppLAMp5LEZ3k07REpbkTK9/RF+ZwhmgSf7U9+972y9QicDOjbnpDViAQtJXV0ofdv1+6S9wqWXw/IQRJOQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674875; c=relaxed/simple;
	bh=gs/WapuEs81GOfhcsfja9T9iBJvzyH2yETLcoVqKPls=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G6F27DF/fFfg2l/o6hwOiMvsBTCwUyfwYxtAOrVU9e/qJcAB9pa3B8NipIMeI23XKai3OO/0aYImVEZVIZlRjTQMiC9ru9cxmNfsnrqpiLDhxvKZxZ+jVJmvkamQbQj9e8INs0/hL33IKWoRInOHyAGziPON0gCtd3DoA0e9rl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MxxeyotB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MxxeyotB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so42603195e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776674872; x=1777279672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaJMjyFqsRA9dHCRFFX9QB7tuTN0E26/VMHzuIS3hEg=;
        b=MxxeyotByVOLw5Gh6FLpFgd5iqfPtPERlB8LSXhHW3rbr8NrzREujRJvBWQ5sdcyBz
         ur63r0yT2rtdQTXfBTVKaok853TYnUhomC1zxSrkvqetPn9MOjqBfqBnynUO3kuUwJgh
         TXJoeslFU0lU6Je9lDZgN6d9qFHhTVR/wmANKAsJkFMi0KgBzrsAQW3b4fLK0XaS0nli
         QLtUMXiIx/2LZICGRsPE+y4vdJ3TT+82P5Ickaqeaqd6jtpUF5JgrROYYO3HU86/n1iA
         jCsEG6XSfooVip2RnCtiFgGjBbLc7R46zRj+4K3V9N79pKC4X0zHfGV/t3KjGMM2oap+
         eo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674872; x=1777279672;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaJMjyFqsRA9dHCRFFX9QB7tuTN0E26/VMHzuIS3hEg=;
        b=Y/mFBnqjWbCmTVuimQ88G/Gi1BNLB7ksnuUMqJhMjERL5nkIc3Rro8PhCuTuI1vRU3
         ihg62XV8VqhBKVzLNmrZdX8cg46a7OuieJGYJN1WrhJGVIXAVZ9XLO2Kixe5w2c+YrWX
         Fr1gOU/aZetYGOfgW1RDuYma6DjFWiBZAbDAZVHwU953RjOk2ea4wtfCX+WMeFoyfUMm
         oKTd5Dx4CbXiR5zalviBEi1OUY0m/L8eRPYCbp/jcDIHxmiki9u1Wj4og+0pl1DMCFVI
         9mAqee3r1NadO4WpeakyyZmQEdTYBE6HecNlGWfMwxYSUEdKBsq1/NZQ9flDZL2n8JSj
         6koQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0QY9nzFnSStrEEkMBmxUVMgSuV/UhMW8onug+Zvs1YYJP0SSm990xLuw5pAq421tL7IYUk7r3G6dl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8CQ26O9QefYXBzlpLj4XYubnrE9NWqIjfMaiT6LUMZxfK2R6l
	4PQF/D2mXIWrj25yT4XglRlNxvA0HWFZA0Wv1+4xUvUeiSGb4UNIptz+De+1j7POPww=
X-Gm-Gg: AeBDieuMsKdi/Mmyxz6PS2GJvLiWKJA2IS4l7lp96XCAcsXVGcUY7HN3RdrZtoO21BX
	nfAfSAT2ZrN2TJE8Iip5SDp9I5Do+/+T4DbM8ulcixZItxBleSgsTi7W4UAXOeHFghltF85KMqc
	L/m+3WZEAi1tIhCCf3V7FeRLXV4c1amNjnP00F/jhwOcotK37TwduSoT1RnDY2LR9KoN6RxTh/6
	rHjVEzTejtyAt5mc6/MF3xv0nZ3s79TffnjxjsGjTnfFHsH7jKlWA6Kjj2u3ThOPd9pF2X88P5e
	j8pC/+gA6I0Pdc2jljzCyiqGRlXtoYMPS4Sf/FnJhGCwAeHmt2bysI9dGJLSTnXt8nq0nu7YfnI
	apu4nGc3clw1uGJai7mvBBZP5zkEyQ+zLH4IWlnJTg8caNALiY2G3OYfCZ5pL3PhNSfc4opzQ9z
	P6Jz85Gsng0c+spaOsDZ5AKY3HLqkttv2zxyV5AAoeqk8o2iwzzQUb9O2EK65wnIvhOPbfyaO8j
	sGLGPXQKIwO8Xs5+A==
X-Received: by 2002:a05:600c:c05a:b0:488:80b6:873a with SMTP id 5b1f17b1804b1-488fb771be4mr138962075e9.21.1776674872448;
        Mon, 20 Apr 2026 01:47:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm246815005e9.5.2026.04.20.01.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:47:52 -0700 (PDT)
Message-ID: <b6c2615f-74c7-4a08-88e7-0cf0842687df@linaro.org>
Date: Mon, 20 Apr 2026 10:47:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: amlogic: t7: Add uart_c pinctrl pins
 group
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
 <20260416-add-bluetooth-t7-vim4-v2-1-9a57098fd055@aliel.fr>
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
In-Reply-To: <20260416-add-bluetooth-t7-vim4-v2-1-9a57098fd055@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 10:54, Ronald Claveau wrote:
> Add the pin multiplexing configuration for UART C (TX, RX, CTS, RTS)
> in the T7 SoC pinctrl node, required to route the UART C signals
> through the correct pads before enabling the controller.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed623..4a55d9641bc9b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -553,6 +553,18 @@ mux {
>   						bias-pull-up;
>   					};
>   				};
> +
> +				uart_c_pins: uart-c {
> +					mux {
> +						groups = "uart_c_tx",
> +							 "uart_c_rx",
> +							 "uart_c_cts",
> +							 "uart_c_rts";
> +						bias-pull-up;
> +						output-high;
> +						function = "uart_c";
> +					};
> +				};
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
