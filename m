Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDF235DA76
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352392; cv=none; b=XHdRmBWFABn/YQFF+vDCvE9JgSD8lTuEMoy/ixiOzg6VAsI1o/uyLyyhk/7W0TIqA9ofvzQs4ExlK7JxlXjSA4fFV8VjQ8xOU5rbd28vSimL9W2wygUEcFN6L41qtxrLcE28J87NsBphimIfae2LsYnOcWQ1J3We5KROoqXdqnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352392; c=relaxed/simple;
	bh=mDE7F8wVJgJEjEAHG5WtX3KpID23UHmJfbHZfqft+TI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fxufWSukvSH2ysqXPP/etIcVAiwU5VQpn2bWYsZ6w29UZ2Fi4ZbKBYopWsTwbHcm6ObAlHpyZZyfQS87dIvuKZRK+qkf/1BnHnb/XctR5uNvEd1tqCUfEPZKZZ4nRFltZQAa0qA/PVR4NFrZ65qaOeUHnBnpyGYLZDXml6hxNSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wOVbWEt/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wOVbWEt/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso43274455e9.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779352389; x=1779957189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmRWXyLwLE+NX7L+OQHNM2shVkMAyplWBHtM1KeJMvA=;
        b=wOVbWEt/NsykGxdladL9TQwC2dLRj0iJujtyTWprBn+b/w3sQW0RZ4ds6+UkU8m/vu
         7fc0fyXMdrQx659VB018jBWIzoSDXJ0agcAga1TSGZpxYjCQ7QjXLz7IGDsEtOhYuxJM
         kyjljXCQRug0okB/du1DIICSujiOx4DW1MWxhxUz0STUBVyEFJcwTbvS+3JI1v5S8hKP
         reT1xNHDBZ+dcKPoPUFS5taaCP3Xg9GFcMTIiD+A6pcOHejpVEgYUB69wKWPlX4PykMK
         DxLQvKdd6fDF2c7qA2pboUweYOchJ9CK8NhsTCv7/tr0wic0rcxdGMUBDQZfbB2rLIAn
         /BWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352389; x=1779957189;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmRWXyLwLE+NX7L+OQHNM2shVkMAyplWBHtM1KeJMvA=;
        b=seAxs4JAgknv+MZSbCD0//2Q+0mkATyK7zTU/KY6xL10GitUwnTlyZ7+WjqmDw4P91
         v6fdHrwL1HooD3ddVoADt/6b2wiTbgA79Xn5PxIDeGWR31dj/yxGfDSjxW7nd3WhPRko
         EHVD1R6fj6LI4/SRTZDl6lImiT4yM4nQIegmod/IUjr3LnpcOewKBAXEpWAY0piKUKPM
         JThvc3xgoWxs02z2o2ra9m0+ywnb4C2jBBoRbJiSXh4zZ2I29HtfToKB9aO0GEyfTjwI
         v2MVVQ4xGa2UuF4bpXhYMyVJIITpL7rCPG0SgFPugJLVQ9Iqnv4fHCGNNnlHUSRrULGu
         hTog==
X-Gm-Message-State: AOJu0YwP7vdsGYDjdRFRWGz6wQUAVcsDkrxSM5ng5OP1tt7hNZRApo0e
	E6Gm9ulNk4SQbOxeD2uFco/MDtRQ0UuppPldSHcR6nLjOcxk7JXMshWN4Dli47OtJZilZ25UsbJ
	huxg5
X-Gm-Gg: Acq92OEpdx/i1LPkpWh1LxQQvxy0z5sRRBeYiNzA8qLhOlaKa4l0vG22xmD5b4E9ehm
	b9vO9fiPUU5WJzGaynLpkIdXCbnq1ZyV8f3k9COqwWok8Thz75GwJLXnlk7AbMe2KXTgfLpTK1A
	PJj36VHVnOolMd0G6QKKeNOtP9GgTa1JHnIvHJxIydZAQosIAqEYbUDrz233DE4lAlEvfhE8GFD
	a+YyoeXX/1nscftrz/Re9H/NSI+dLSUcw/K8/j1ZTTXHCj1z7rhGDeLw2tGQLjCCgGRKPRY4yO+
	J09b7mYTWttxJ3rE1Ug0j0yJj4eb/DHYhmrjlIgqStTmkh0Y8gOR9HHtilOg7g74VqasCGwK+mv
	e98PMlYY1DBv5BFyLrjD8a3bzbbpmaisvYPxQ2mUoi+L9djRFCLPvgwflGfGI76bADsIhOmyZ03
	bTF5jnVpdI5A1H5tJfhFuScNYCMMTrJdxZp+R2HuLnSSbHKnWE33nOpMLLDJLqYHBcvM5LPgAPW
	vDfaxDlZRKdebSTMg==
X-Received: by 2002:a05:600c:450c:b0:490:320:949 with SMTP id 5b1f17b1804b1-490360e3332mr22610385e9.27.1779352389353;
        Thu, 21 May 2026 01:33:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035ed7ea3sm10645555e9.26.2026.05.21.01.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:33:08 -0700 (PDT)
Message-ID: <19925582-2e79-4226-815d-0b062312431f@linaro.org>
Date: Thu, 21 May 2026 10:33:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org>
 <20260521081943.4CDAC1F000E9@smtp.kernel.org>
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
In-Reply-To: <20260521081943.4CDAC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/26 10:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing main power supply property (e.g., `vin-supply` or `vsys-supply`) for the LED boost converter.
> --
> 
> commit f0b2513f96c13c59660da8495c808919bb4b44ab
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: leds: backlight: document the SY7758 6-channel High Efficiency LED Driver
> 
> Document the Silergy SY7758 6-channel High Efficiency LED Driver
> used for backlight brightness control.
> 
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
>> new file mode 100644
>> index 0000000000000..80e978d691c29
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
> 
> [ ... ]
> 
>> +properties:
>> +  compatible:
>> +    const: silergy,sy7758
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  vddio-supply: true
> 
> [Severity: Low]
> Should there be a vin-supply or vsys-supply property included here for the
> main power input?

No, the vin is provided by the panel, it's not under Linux control

> 
> Looking at the driver implementation, it references VBST (V-Boost) registers,
> confirming it operates as a boost converter to drive multiple LED channels.
> A logic I/O supply like vddio-supply typically cannot provide the high
> current required to drive a boost coil for a backlight.
> 
> Omitting the primary power supply could prevent the kernel from actively
> managing the main power rail on boards where it is switchable.
> 
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +
>> +required:
> 
> [ ... ]
> 

