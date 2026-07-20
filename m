Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920CB3C3C03
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534806; cv=none; b=MFwf99CawgdGJR2VKsmQGbvufuw36b9nSn2dt3ODSVwgcfiHuHsd5IV1JI5GbM4OzxYQCYXq6wrMB0SMM6s1nJsHV8tfhssnLbhJI1ngi3axIWnmmzPh5s0wQtft1fYI4SzzmE6sUj59CpU+7b9y8iYumPJR5Y77kHNcYH8B/kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534806; c=relaxed/simple;
	bh=zxTMx06WakuSUEdShfezq3N3fs2Jm2Hc8+wp0GUiiaA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NElTzzA3jEcD2O1m4/tksjfqBcKfTf22NnkT5NkkfryUj2T3E6nYpSB5OgmfBH+Hy10mGyNb+j/DUNQFiSNC0r7uab+nDx2Vw6kJHWf1r+DQsxhaBJjThDnKCKjkIw3PlZHCvbQz+dL7S+m/x17QoK4Fs7eEsogqBcLP0Xd3lIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2NypfkM; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2NypfkM"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f752b3423so646952f8f.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784534803; x=1785139603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utfs8BXgE/KFrZPI+EKqPACTTPV1vra7Y9X6fBcDxRc=;
        b=i2NypfkM9f++K4eioD96KfUcJOJ1hBj8ACpacywKg79CMmrOL40CAB914Sk3nuOSLa
         4CBrKKvlofLr43sX+QtBoeMIfaFdik4ClKb4Dg/zkgxp92sRAeCXrBsFzfySyM11efmY
         WWrgqS2BvBtYGVcInIyILHz01aZ6VHt7H1qHvoJqw6JjCTFnDWsD35vT2rkyb7CrzWAi
         swriFH0ugbl2L788D2XAGgC2ZlrDl0/fdroKQOsUoEe8ZESiuV2bCCql/T57OZe3kzSh
         3lpwdURxOmNcCrYftjP94WEK1wXo0W6gYw5EIi4y+SJ3JpUwQHBCSYN429+2NaBXunWV
         qRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534803; x=1785139603;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=utfs8BXgE/KFrZPI+EKqPACTTPV1vra7Y9X6fBcDxRc=;
        b=CslbXU8e92w3O4oa7wR8CAj27uwZK6etCln/95zMDPgC8e/RxX8RsHgwIT6sPPiwKR
         p65qfYD5rkkUoRaBhs2VNe0xUk4CRq9shBdTvZbtutprJq+pvxXQg36jM0rERoNFlFro
         pEAuXrhzWx1u5inZuW8sH4WoZwQggrFqrhol65l6EOszaLzYPJvFMej2d7QE/OZLfDOP
         LEQV1IQFisHiRVHmj9fJBjE++e2faC2kJqb8xLO49JeCeKAJUaSvi+Wu6BNHizfgDyen
         wReJbr075FXnPthVZs4oLan8fAi8DvGngGPr4RgsCHkVt4hk5RCz6mqdKvj7mI2KytQd
         aYhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsGusn40F7aiFVhGqThsex7K5zSPHIDgQwgUzNz05morXJWpRzPN3o/wVoFrv/Wf6TRkTi+e/bcb7s@vger.kernel.org
X-Gm-Message-State: AOJu0YwrMxC8Y2ay9lGFXFybzw38JaKq1rPLXUdd73s0t/yWASHdmAHM
	B1rxkeHDWTvOOPqLbPndpKYjH4/VEEKcUYNfrQ9QAP2bOlIytMDMVrTZQXGVpk3Ge1g=
X-Gm-Gg: AfdE7cnT/2Ju/fUBKLSxQgi31i2+4f7omIxv8xs9/vVkxi12OgDtR65O1vzwHrA3T4f
	rTxIBDHkzLnFyKcBBEAdxigmHpXQX8u+w11ew/QgfexOXRIT2HgOtOri2YQT6tU4/zDoChW7sfG
	s2lX7uhA8WmxFyL1E5EOvnEz0u+mxEVSVpJ8HhzF4ahUHoIqsKNJ08AzPrfvvvkQCstaOQQMkCh
	umS2YrSNs6tEi2SUFKQACrB0zh5U4is+G6o0eSQL4FX+5rYEf1R3OXHW4VtAAvO69GXJKr5FIhV
	cbbD43i3rV8TlN/NyGTQ+V9QkBxRrZSssIUaMG+p0ysPUSeo5hMaoBNM0jCbauvwWdtSSwdpWzS
	VJhPKHeGMG/DHjjLSomOwnrrCNCX6PDHunrFzruxAi2CYe5dLpjBSBsvw/knsta0lTeV1VB3abu
	ScnkTmDyEgkY8xmWAONYIFHh59rTV32G4jISdQf9LIf5cYLh2r1D7SgMxfAw==
X-Received: by 2002:a05:6000:2208:b0:47f:7736:54a8 with SMTP id ffacd0b85a97d-47f773655a2mr4048536f8f.13.1784534802746;
        Mon, 20 Jul 2026 01:06:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6048:6804:bc89:a6b1? ([2a01:e0a:106d:1080:6048:6804:bc89:a6b1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496afsm28630710f8f.1.2026.07.20.01.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:06:42 -0700 (PDT)
Message-ID: <8d587743-20d7-430e-8a02-163a458c37fe@linaro.org>
Date: Mon, 20 Jul 2026 10:06:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-2-8169953634ad@linaro.org>
 <04dfd2a8-a6b2-48d0-bd51-6cdca6250d38@oss.qualcomm.com>
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
In-Reply-To: <04dfd2a8-a6b2-48d0-bd51-6cdca6250d38@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/26 12:21, Konrad Dybcio wrote:
> On 7/2/26 11:48 AM, Neil Armstrong wrote:
>> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
>> other PMICS on the system.
>>
>> The thermal nodes are sorted by the sensor channel to be
>> coherent with the system thermal nodes ordering.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 
> 
>> +	channel@749 {
>> +		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(7)>;
>> +		label = "pm8550b_wls_therm";
>> +		qcom,ratiometric;
>> +		/* use the default settle time */
> 
> P.S. grumpy nit - I'd prefer if default was captured explicitly
> anyway

Ack will update,

Thanks,
Neil

> 
> Konrad

