Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AA03D7D67
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488048; cv=none; b=GuDny7uDe3bvdfV0GhbYohYaOvhCDHzM0mMPtSkfcUxY4yC2/VfzW4smEgHB4W/7UNmvDCC05fCjqZmlDY0e/NkmwSCfzeVqDh5+okJLnI1paXAVxiher+6XH6UpZi5QeG/qy/JUNP4ZA3+7Jw6v9dhaP1NcK1SKCNci8wwAmig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488048; c=relaxed/simple;
	bh=9hkG8hq7f3EoD94RjJhCYXhfWclpz33msdh4Jv9kHUQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QJHk9MzcCASCib4OKD4vEDdpBuMdezRwAXF3fTUqQ6XLMpfh5Bi4GHdLbS8STV0GgcVAoO0KFBt+6wJ3frrlG5QWAhZovg/YJ1O5WWo6TkwTLRp2p2QYWwFnzwHzX+kAUb+O9f7YJg1uRb+61PTI4hHQ1xJmh0PKo6EV4rrrF4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UJFvcuSF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJFvcuSF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47640541585so520294f8f.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785488043; x=1786092843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJGQeaClS5HVPjwprrOHXs8CtxZCye4wlWhVPeRubIk=;
        b=UJFvcuSFCwva/k0V6WP8BBdWSxjZI2QUDV4CpJ/SW6IxUXpD7Q3WiEhFuuzSnV4b0n
         euXsc9pLjqRkR5WKFSmzv8KXM8JlL9r3rQnN17eGcnbuzxAaw51xycygbPuJPH/1jiRi
         /Al7c4aGbM5ILJzuDbbJ/HDmNSWN554qNsAapI/TvZGuR74niU8p6Q71EmK85oCCbFA7
         snzpvZevroIGw52gBh8qm1ynZnUWG5hNSGQYJK1y6IlmvbK/xZM5F/YKw+4DnpSdUova
         eLhSyWr/DcF8a/9ePi155/4ANw/YeabKdIhfGJigvLORuaYpCy2bwtWTi+Fg/9zuV8hp
         M3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488043; x=1786092843;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJGQeaClS5HVPjwprrOHXs8CtxZCye4wlWhVPeRubIk=;
        b=H1vlQJqwLbrrpqUkl4NVQUU437gbLuiqCqckqEg80VEJvwsjf1ct3wKF6cvewnJ9hB
         iWTAFYfhOudEWz99/h51XCfGXf8sXN+9kovF4sBUHvzbhu3YC1XKrZ7hjOcLzybWeXDp
         q0Dz9xJfp0QBYjVUUxfA/x+sGsC2qm8wzfpO2JfK6PoauicSA0UYpjSb7uI0sq64Xqf1
         raxLjSE2O/lxiwk3EQZjHVN46pngVmHeEOSJUbE2YZnRYcyMPLDua5hWN9OvOViNqLAE
         lAVY/BzLmFq4hwyRraQ1JLUls1LXmS6VqCz7NNELQNmyIVOux1cRvYmjfdzB0kcatNVA
         fqOw==
X-Forwarded-Encrypted: i=1; AHgh+Rp0a7m0taEfsEeV0ppQI+eLU1JirlEo3KJRRJtsT2L7swMFJdhrO8TPeYlUyp/5PifwsCQsrjs70XQK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/hhVzCx+aRmelyrczdsrZ2PkGke94O5E2s1auApconeQjKFuc
	+4sNVegJ1O6wpCKyWwXUMGkhypbqHl0lWNqBqnA5kigTRd7Pa+RtOBiaQWLHeqeXxSAVu8LxMfI
	FGYP2
X-Gm-Gg: AR+sD10Hv9G5t5xjRPGpfDSkWkUOiJpra8/fDWTTOv41WJ5VNuUnUS+yBd433qsLioN
	SanJZYA7CmXwVnjGlPki2uJpTpXmiGAdKW3kGjsSt6p/3zVtquzUEu5ehI09hQGihwKvhkvgGVK
	m8Bvq42MLH0K2eUSOYCC7XpLCRAtZYWC+fKy2y+APkaeeC0pxyoqT3YN+ioCk1FFHAHx+YBhY35
	2/i00qbRQ7zWi7XZJOJj6DKsgi0sH45ATXRy6o1cBCzsaofOP6bW3VxstITNJGdT8tQX9WJiVFk
	7tG1c71IXAcLdO+m8uGxM44OPFhUZbRgrkX2Z7uC32fqJXvzn4vAEUT8Rrx6TosiAhsU5k1CMqR
	HkfM7JIMGpgnGYT4xCf0IHmYLKZfFGaNdyodkJBmvUNFm4qa0yE2bYjuJI6oMjqn52ijpdaiBAZ
	OEUBZ0lZSjw65WtBqP3SaRAv9gWYSvtZmOJHOs8ZqpRZBAu3BVPcTulDo7gsh3GaB3P4ohuDuzg
	p2u+Z1BGmvu2qSSm0MeEsVKt3hrKEyI/W1r7BPzyA==
X-Received: by 2002:a05:6000:26ce:b0:46e:c978:7ddc with SMTP id ffacd0b85a97d-47fd2adbd3emr2706225f8f.24.1785488043145;
        Fri, 31 Jul 2026 01:54:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2? ([2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bf7csm2457413f8f.32.2026.07.31.01.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:54:02 -0700 (PDT)
Message-ID: <8c8d977b-6a88-4d7d-ab58-985b915f82be@linaro.org>
Date: Fri, 31 Jul 2026 10:54:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org>
 <20260731-topic-sm8x50-next-hdk-i2s-v2-3-42c1acee5a2d@linaro.org>
 <20260731082207.A3BBD1F000E9@smtp.kernel.org>
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
In-Reply-To: <20260731082207.A3BBD1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/26 10:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The SoC's native I2S and MCLK pinctrl configurations (`i2s0_default_state`, `audio_mclk0_default_state`) are incorrectly placed in the `pinctrl-0` property of the external `lt9611_codec` I2C bridge node, instead of being managed by the sound card or CPU DAI.
> - [Low] The `dai@16` node uses an incorrect hexadecimal unit address of `16` (22 in decimal), which does not match the decimal value of its `reg` property `PRIMARY_MI2S_RX` (16, which is 0x10). The node should be named `dai@10`.
> --
> 
> --- Patch [3]: [PATCH v2 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI ---
> commit b95de62e9eeaef3502a18beec3e036edf4b8259f
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
> 
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> index eabc828c05b4c..b62d387b9afa3 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> 
> [ ... ]
> 
>> @@ -861,7 +878,10 @@ lt9611_codec: hdmi-bridge@2b {
>>   		vdd-supply = <&lt9611_1v2>;
>>   		vcc-supply = <&lt9611_3v3>;
>>   
>> -		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
>> +		pinctrl-0 = <&lt9611_irq_pin>,
>> +			    <&lt9611_rst_pin>,
>> +			    <&i2s0_default_state>,
>> +			    <&audio_mclk0_default_state>;
> 
> [Severity: Medium]
> Does this place the SoC's native I2S and MCLK pinctrl configurations in the
> external I2C bridge node?
> 
> By placing the SoC I2S pin states in the default property of the external I2C
> codec node, the pins might be unconditionally driven from the moment the I2C
> bridge driver probes. This could prevent the ALSA/DAPM subsystem from toggling
> the pins based on active audio streams.
> 
> Should these be managed by the sound card or CPU DAI instead?


No

> 
>>   		pinctrl-names = "default";
>>   
>>   		ports {
> 
> [ ... ]
> 
>> @@ -1072,6 +1092,19 @@ &pon_resin {
>>   	status = "okay";
>>   };
>>   
>> +&q6apmbedai {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	dai@16 {
> 
> [Severity: Low]
> Does this trigger a unit_address_vs_reg Device Tree Compiler warning?
> 
> Since PRIMARY_MI2S_RX is 16 in decimal (0x10), should the node be named
> dai@10 to match the hex-formatted first address of the reg property?

Damn !

> 
>> +		reg = <PRIMARY_MI2S_RX>;
>> +		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +		clock-names = "bclk",
>> +			      "mclk";
>> +	};
>> +};
> 

