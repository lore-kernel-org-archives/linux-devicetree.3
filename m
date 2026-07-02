Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9BD480968
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985441; cv=none; b=u+4cC7bjScUMFTkL2CSkKRpnyMqNn8wI2mzCV5ROK72uZ1ZW/H8LCYyImRUK1hdkhL57R9Pfuy+DmBWlTbzzMCjyIMl2y0PLzzgB5PXsyhs9VJQoynJRMyyeINtMMP63V0WK3/HsNmZ9moYLY2VdShBMQTIvC5JS1pbZ5HgTk6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985441; c=relaxed/simple;
	bh=zuK2n9vTCqYKv0UJYa1tIKwjqgrBK1ZvoKXzIBxmz9M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DWFKeee/ueYwpDc4sVOXGdcrXUv4QBIeES4DQrkrkemEp/z57zRwdali+ErAGpr8Lrs2h2V37i9DMzdSI5JKUWzdmvAjD+6VBG9ZRZkyP0X/8uPYLG6yzd/huAkQUrcIppDza5wvgUEHsKw7qtLHHKUZbX3wo/58kXyFwlf2QsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CIaGUlaK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CIaGUlaK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so10251865e9.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985438; x=1783590238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bK8KvQmLqTXD/XB1VGo1MPIszZUUe/fxLx+x8ODuUYg=;
        b=CIaGUlaK0G+PA8q8/UrU5r3GbmhqxpGFyEguUFTdHUV1mU03KzxYeHltgcxhjM62GL
         wOgXe68SsMK0FGvjUv8BfwsxhRGFepMOGDi1bIeGlSgCT9ZMjaMCK39xWSvhYB3ZvXid
         SBatuQf4vcMVCFK0aNzueiRj/nwnSsZMIzUkCDBwXQ+SxePXV1pqNxmcGloO5qxyubdI
         XiW05kRo5Ch0hODfncQu2Jh9jAA9RXSePDTOzSRjgisVuc4qMJJUVgoek6mQJ6YpIixP
         OPrdxWRu2W2sAfa3dIe7F00eAm4N98XSp773fGL/arpnqv0de5LVIRgiwzjDM1yTRMWG
         zDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985438; x=1783590238;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bK8KvQmLqTXD/XB1VGo1MPIszZUUe/fxLx+x8ODuUYg=;
        b=lKP0JndqBTpsgRE3YgMK3QanVTDfbdzcU4LocLH01huvVK0IiBGmR8klWu1Np8qRP0
         sDlA/RTLZEjpgQ1r+QdJWNp9DmmbkAaLq+9Ddzjywi/yoNrqi7l41M+HkYFfOdzysbcF
         kSlXU+pa1JdGnmlJiy0GXZ3z8sCTNHAFRZNm1wZRDnGIUIhD2lv+N10yhtL0jJuit7Fu
         RUhVzNtN5pCC4YYin3WX6/zyD9JOc1AkHOFv348GPCx5KKhqGR4KDJlT0RShPbC3p3p4
         1dy3H49sF8O3m0HBknudWvCJZgdo7A5o4JUjRVqvVHwtLDBB0zWDTnmsShmXYq7iLyNR
         rRWA==
X-Forwarded-Encrypted: i=1; AFNElJ/LmhjbBXjoBY+L+1wcCTrUVjkUsKfOE7cJaZWPcitsUnNor87VZsIAL0RCt3rJf8pj0NGN6B/Zwa13@vger.kernel.org
X-Gm-Message-State: AOJu0YwswxuCx3oBDa+3BDlhNLRmdQSqTuCZYL4MpC8p+Ma8RVfp2f/N
	gCCEbrM5l7chw2GifBgjFcsV9B73s9fuQzu6gI+UzeH/i0wrHyktsq57xJwRcApnDxk=
X-Gm-Gg: AfdE7ckjHkOekmnLcJW17zghtjxavM5ftoSUSK7O4Op0qJqsOBNqmxy8SL584dg6qec
	26QvwlAWfpbJmFhp57ppBC3vPEmEMaraS0/RMo6kRAMLgxt4g0eb6Wi8AGT9QhLk0LZvo9YWyTw
	bxdNKUCWutRjIHUUsOw40RZJY5ME+fdTlN0h6YlffTms2cjeWoUVH23U7kNx27p+rsBCHwdQaX2
	2Tv648Jmhf0ZAuwYKLcj3rdaTnVGoBkYut0fIV77Rd/IvZsH/PLWT9Iie9UmcOXww9Tq4fO+Tlb
	/u47zqybLqLDXTZD06Gjvzg5cno57E6epVhs5iVUb107woYhoyGcjL1ZLWBNHdUVJOdsysXE8kz
	liZWG3VRmjszjcrakXxh1WerBWkCVo8i1nXUDKC8nOgpO939DdiYYDT8fdtqgXyoXHrwqDteFj4
	ToFLdgs/MBWT9XcyNGuAkVgZftlqghSD7hP6njpmf4uhNGz3cwT/N3Nheih/vhaq9IYmGx
X-Received: by 2002:a05:600c:705:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493c3cd54edmr41645415e9.11.1782985437959;
        Thu, 02 Jul 2026 02:43:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:33cd:3431:8a4e:350c? ([2a01:e0a:106d:1080:33cd:3431:8a4e:350c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbc75sm7828195f8f.5.2026.07.02.02.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:43:57 -0700 (PDT)
Message-ID: <19f57744-798e-4b2b-a88f-bf6f43a462d2@linaro.org>
Date: Thu, 2 Jul 2026 11:43:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <20260617-topic-sm8x50-adc5-gen3-v4-2-4af9251731f1@linaro.org>
 <7baab74e-1d44-4791-a599-7b2eb802e438@oss.qualcomm.com>
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
In-Reply-To: <7baab74e-1d44-4791-a599-7b2eb802e438@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/26 14:07, Konrad Dybcio wrote:
> On 6/17/26 2:53 PM, Neil Armstrong wrote:
>> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
>> other PMICS on the system.
>>
>> The thermal nodes are sorted by the sensor channel to be
>> coherent with the system thermal nodes ordering.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 277 ++++++++++++++++++++++++++++++++
>>   1 file changed, 277 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> index 2fb2e0be5e4c..9356b40a1850 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> @@ -205,6 +205,92 @@ platform {
>>   		};
>>   	};
>>   
>> +	thermal-zones {
>> +		skin-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
>> +
>> +			trips {
>> +				active-config0 {
> 
> trip-point0 (the current name is very misleading)

Ack

> 
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
> 
> 125 degC for skin-thermal with a single passive trip and no cooling
> devices is.. certainly toasty

I planned to setup the cooling devices later on, plugging it the ADC is the first step!

Neil

> 
> Konrad

