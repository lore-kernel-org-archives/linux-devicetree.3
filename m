Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CE441360C
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781599189; cv=none; b=QDxXtOv47apR5g/PN1L7Fds7oqHSvXPn+uyhEcoTVuSl+NaCyJZTyN5GTPW+xM+mKcP8OHdqWYukjHIkBxDoKwQ1QTSKcjZrg3Lqs9WHzr5xh6CTfTC5ahCu//UCSl/aPMCyO72qrDrYdHfW/o12hdt/3LOEtvxhw6ug/X1v6Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781599189; c=relaxed/simple;
	bh=xgqg2HEwifWUM0vuhnri1EIB65MvKX7fBHTptgMWJfY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=a+VlopmlgL+BiNJjPNRIYmtgogH1W+vZfvF3WDGcSdvBtmMLQyTMbiXFN14RUNFHae2/d1ik6jIs9+fxBQmpwtpxtPMM7xlaaHUAcL32LY5BdUHB8jcy1ojMMsvdz0IWN75hEW9hKQ5BVpX+yAZnxLXU24gZr3hGYlcS5hryz9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BcrtUyvZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BcrtUyvZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso40410625e9.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 01:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781599186; x=1782203986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2H65j63RwgTq0P0u4BfHzeL9+e1nXdHZ4T1IfU/mVhQ=;
        b=BcrtUyvZN7PVZHUdfVxapcKBlZzv4//L+SszHxuulGTPMqudFOL42G4Wm6/zwUpJN6
         AftaSO9ByaydvTI5f346xAGz9zm1jCW9YUQhZAaTnY5uzcTcwiH90PO/ASW6JqXiEmKJ
         E4seNKTMwwXkluKhn+2Y5JTlGaoQWPITlh5hX1XfHQFvNUu1RjkBVTZlm8PIp6N2YwrM
         mKhr5nZzs86F7UgmvXoX6O7qYz/+nHtFBca8VyUmc4ohR5sK+O1mJHlxtD0+09Yaw7Zz
         MSfB1o1vc3P83U3wAmp+0i7MNZvDug2R6Z/TsbzovUwhD1rkymfhFl+wWz6WGZ3vMktz
         xk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781599186; x=1782203986;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2H65j63RwgTq0P0u4BfHzeL9+e1nXdHZ4T1IfU/mVhQ=;
        b=LNWBpikn6jYdjtfULlPTL0Ph7vMYPCwtRFzOtUROIL6olWgoG4BfQ/L1x8uidt+J/3
         XcJpsKtCJ7cJ/tOeaJrOuttoeu5bqBIhcjH6O4IGJIxfL7mtxzrxU9jJsn28STSlBiSF
         tAMuQvJN8r3dM1S9/Qxa9I5bucuVr9Eji4FGpoyysvYTaOR02ee7lXWi9nrbjGkAiRHk
         Oqn3R+ObIdzUmncB/ToHj9TZQXtcCWuqpN+Gf+0fwr/JGxs5iAIbXUQxxxLbBRifMJ4s
         kHM1PiRmox6CnVj/DDoX6z3RoKcqvfbPDORl9pYmOvxYHZ1L5yw/COk/pwvR5ZxK+nja
         MsBQ==
X-Gm-Message-State: AOJu0YwUZdj5znlVf5F3PbQnAT+02tYjwcr6MxzwshdnzmYDuWmy91Gh
	BDQRf9xWStpH5t4D2W+QXYAISClRL270UV7YzkGrulq/vBa2htMvzErDQNgIiqeHLRs=
X-Gm-Gg: Acq92OFLCQexu5/O9nHc5bkQQlh+xjLCe3XpkRWu+gCg0xjpjHAa5Rwf243fYnU0UDG
	PAaNbbR3OV5/6b1dfTjmfPDvxQVfskX9xCkyarjY2hpXYJYaL1O2+ZiveyDok7FYcZZ3h2+UQ4P
	WmqR1R9n4+f8b91byeDvKLpEyqdFjjbyUobBMVH6vzBhsQuAhbuNuiibv40r1rVlzpqemwauBdD
	no3Kukzn/mfuI4MOk6plGyDzkcq8lZ2W2+1g85rEJoFsL6MN/cjYpnz7TYIadVQ/os+/D1Dt2F4
	esp+qUFZ1qfq3xY18WMGFaG7R9qSHEB87OyZ25VE5Ut/ABztexHB/busUuiH54pt8fhK1UWQdVF
	mJ4hHVZJJ/8T+7qSVoAxWgc0O/LUBuX+0paBhtQknHW+qBEyt6H+2tEEneL7+jOtkC0MpX0/qKT
	lAKNCijujVQdSbi7CclLusDSlWQYiffA==
X-Received: by 2002:a05:600c:6d4c:b0:490:d2a4:1b59 with SMTP id 5b1f17b1804b1-492201184admr149927925e9.31.1781599185914;
        Tue, 16 Jun 2026 01:39:45 -0700 (PDT)
Received: from [10.3.4.22] ([212.133.41.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a96b47sm35404405e9.13.2026.06.16.01.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 01:39:45 -0700 (PDT)
Message-ID: <542d32c7-a3a0-41a4-833a-c28f33f24cea@linaro.org>
Date: Tue, 16 Jun 2026 10:39:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v3 3/6] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260615-topic-sm8x50-adc5-gen3-v3-3-216a2b5ccb85@linaro.org>
 <20260615171519.F2A851F00A3A@smtp.kernel.org>
 <dz2leajz5bh5knzzhjlbisosfg3ujaokaoo5rq7lf2dzvgut7u@s44eop5u4li4>
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
In-Reply-To: <dz2leajz5bh5knzzhjlbisosfg3ujaokaoo5rq7lf2dzvgut7u@s44eop5u4li4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/16/26 01:59, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 05:15:19PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [Medium] Missing `qcom,hw-settle-time` for the `channel@749` 100kΩ pull-up thermistor (`pm8550b_wls_therm`), leading to inaccurate temperature readings.
>> - [Low] The ADC channel nodes are not sorted by their unit address, violating standard device tree conventions.
>> --
>>
>> commit 4a45cdf2d6ed588ab63165c08752b51ef046be4f
>> Author: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
>>      
>> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
>> other PMICS on the system.
>>
>> The thermal nodes are sorted by the sensor channel to be
>> coherent with the system thermal nodes ordering.
>>
>>
>> [Severity: Low]
>> Similar to the above, this isn't a bug, but should channel@78e and
>> channel@78f be placed after channel@747 and channel@749 to maintain
>> proper unit address sorting?
> 
> Yes, sorting might need some improvements.

Definitely, will fix

> 
>>
>>> +
>>> +	channel@749 {
>>> +		reg = <PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(7)>;
>>> +		label = "pm8550b_wls_therm";
>>> +		qcom,ratiometric;
>>> +		qcom,pre-scaling = <1 1>;
>>> +		qcom,adc-tm;
>>> +	};
>>
>> [Severity: Medium]
>> Does this node need qcom,hw-settle-time = <200> like the other 100K
>> pull-up thermistor channels in this patch?
>>
>> Without it, the ADC measurement falls back to the default settle time,
>> which might be insufficient for this high-impedance path and lead to
>> inaccurate temperature readings for the pm8550b_wls_therm channel.
> 
> I'd also guess so. Neil, are you sure?
> 

I'll check

Thanks,
Neil
