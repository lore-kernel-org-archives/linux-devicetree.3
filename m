Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B469E3E63BB
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917062; cv=none; b=SKB7tLN7tKbgSArRx4VixuuXsMQLniYpEMyVZ6kj6K7w0wCIcxgmnbF7kywurrsX7A69tiSZnTXG00PDrmDgYt2IW0VTxEISNYlvRfnWhNI4W1v5Sy/5j5Gb8/VACfHGdU+jymJoxWikBjVJwV9ZIko479vguET1O92cgcDdpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917062; c=relaxed/simple;
	bh=Aa1JaFtz8MlSsKVnE0g16Mz6N9GzVfKUfZiLujMz4q4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qSHmkz460FqO1rCqjTsAaIA4/tKZkp7Wl0z6p7aGU0T3XK4X3L11U/ntBDV7DwxPue3QQJ1bT0kbhJ39ZlP7VFkHcQAncbtyPoofh6QUd41B2wXDbbc40uAkDn4dFqNILJKr4SKGGySJkqB085WMgPOvaoTrFOgR3au8QJmTqMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j2mrl/Uy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j2mrl/Uy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso3106185e9.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785917059; x=1786521859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cRhrleIU3+1JG/NfXXlVvS5CznbPxrAOhcYmmtvzeY=;
        b=j2mrl/UyMhaLZ9xYaGVHPhFaUm1z7svBIFSMMYvQ2k8Qpdzcnq93SdVQoZi1HrkrWo
         qdK8FhLLR/n0pJIKYi70g5zbFpgRNVTIwIDfnfhEm9zoc+/uVEWZBEB72Yq8cLaYIIIn
         ZTXhRc6E0h6xenBg0I8py5gb7Q1pfhOP5ogT/k2Gw0T4L7yZN6/4sEUyX4XRuMx+WrAa
         iHj7QooeQEgzDvDQb5O+aRvejjeXb3eGUkhRtI0gUihEUcoVjSiHk0BRI9HBi6+uKY+U
         SkQ2WYQsfMt9z/dLDnOUx3Hdjx7uRUwri+yhL1lho98xy8tbjyDCIMOwdS8ZdKR/R2tt
         nmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785917059; x=1786521859;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cRhrleIU3+1JG/NfXXlVvS5CznbPxrAOhcYmmtvzeY=;
        b=dD9lpkSqlk8x5zleuze2XB6u4ndEa+bS53MMLdIoMWseulKRrTn1HNAwkXkvkkyr2c
         Tq3zeI2WSFwB4HTGwlk4OlmlfViOkyz6LuUegaUa6KURTLikfgUGbynh8ltBhPGNKBMa
         JlYmzYXseZjYlvN+QPuqdeLqrFsgJ5WdwdkGRovmEXUp1Devxu1ZEknc8wZr6orqrJUs
         bZz1JnScpA1z1ZcOWQR9+iKsBM+lXtbxOTJPZNdBlohIoFLtkrWscNLBJsQwAz4NmKYc
         pJJkuWbGpJ8jE+xTZLOz7Fa2Cx/XJ2BPvqm9QglSgpl4CG1yvPXj40IXooyrqxJLCP/2
         gAng==
X-Forwarded-Encrypted: i=1; AHgh+Rp2OZkRa+vepTo5aDiKzJngRrDxs8GtpvTqxtAv7miKYvMq4BZg3BQ2B2JeT81zvLpdyqnjoukqOgCA@vger.kernel.org
X-Gm-Message-State: AOJu0YwXA7aus5FiInb68fzLuPlCUkhssBRTsbzUbYIJtj1OzsDczlZg
	e66tCkaDsOn6NUfmVLvr5FECjvF7+sxk4jGffYrSN9Zqz7ljWeM4Nm1eYzXkTwxy4gQ=
X-Gm-Gg: AR+sD1396W/0dct4fbPDeD5jr6VlXj5ikEfzkfKFDzgschestC3+kvtmP5A5GsYRV02
	lCDXlZgzb1IYBx+TDjTBm5H/5krwpMR8eX9iw7YT38tBldA22KYbMQr8BOeU1jfvwkmYCK98jmy
	cZFd63rbM9uj9PM79eI5as8FKxiwTNGtzFwnU+zLtdPi8pcthHbzEQFktCqitH5xVXW8cax5NNA
	4lCWUvfHgCkWDG/0qV3XmDTm3E4BN/lSUbGIxFQIm5fha+yHLzX4VWAtPP0DJjdpOdToDTN3pPl
	4oES203Mg646lZwrll+jhNWcE6u7l6OuURu+g8Wf8sIV6Z5Yrlq18mFs+ymSLGziVBMh0anl0qg
	nB++5W+abh7xLUHu8ngkLJsyTUHFV0MAha78n7A1m7f9sU2w4nWJ3zuLOM61MAztxGaa0KItRIc
	MkQc4lKrpOax5/ezWbuEQohj57GW2GvqYT0kqkESxQtY5g2jOnmZBSwjD86H2PmvA2dM7Pa9OYq
	b5xTU6HVSF44pMknh5SayteNbtcapzMfhv+5xjP7/nH
X-Received: by 2002:a05:600d:4448:20b0:495:5e3d:15e1 with SMTP id 5b1f17b1804b1-4994e7d21fdmr42969565e9.16.1785917058566;
        Wed, 05 Aug 2026 01:04:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b524:aa27:5120:b778? ([2a01:e0a:106d:1080:b524:aa27:5120:b778])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a101ac9sm147307405e9.15.2026.08.05.01.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 01:04:18 -0700 (PDT)
Message-ID: <800c66ff-4c91-4afd-8681-0d7d24376d18@linaro.org>
Date: Wed, 5 Aug 2026 10:04:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
 <20260805-topic-sm8x50-next-hdk-i2s-v3-1-07a6483c430f@linaro.org>
 <20260805075925.D09111F000E9@smtp.kernel.org>
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
In-Reply-To: <20260805075925.D09111F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/26 09:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Device Tree topological violation: SoC I2S and MCLK pinctrl states are incorrectly assigned to an external I2C codec node.
> --
> 
> --- Patch [1]: [PATCH v3 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI ---
> commit 1e06799a0230632b985134cd0731cc4a2e53b31d
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
> 
> This commit adds the necessary Device Tree nodes and configurations to enable
> I2S audio output via the DSI HDMI bridge on the SM8450 HDK. It defines the
> audio clock and pin configurations, links the DAI components, and assigns
> the pinctrl states to the HDMI bridge node.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> index b37998cd9a2c3..6bc2e8630dc37 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> @@ -665,7 +665,12 @@ lt9611_codec: hdmi-bridge@2b {
>>   		vcc-supply = <&lt9611_3v3>;
>>   
>>   		pinctrl-names = "default";
>> -		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
>> +		pinctrl-0 = <&lt9611_irq_pin>,
>> +			    <&lt9611_rst_pin>,
>> +			    <&i2s0_default_state>,
>> +			    <&audio_mclk0_default_state>;
> 
> [Severity: Low]
> Are the SoC's I2S and MCLK pinctrl states being assigned to the correct
> node here?
> 
> These pins belong to the host SoC and are driven by its audio controller,
> rather than the external LT9611 HDMI bridge. Assigning the SoC's pin
> configuration to the external bridge's node makes the codec driver
> responsible for configuring the host SoC's hardware, which seems to cross
> topological boundaries in the Device Tree.
> 
> Should these pins be assigned to the sound card node or the CPU DAI node
> instead?

No

> 
> [ ... ]
> 

