Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2698936EA80
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064843; cv=none; b=Qz6weVZflOXvY10vqYLqWSte0u2WZthlyNCM4SnXCotypLKEsWKNBxJrLPuPDf7vYjGhg/gXdFL0KROFX+OOwIo5SUzxh0LE+ROeynWMfCPZ+pYrZTR98ZFy4w/GZUuWLvM0BAl3x3k6fBgUa0XQBtm68HvpBKutqYDy/DZ2Zsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064843; c=relaxed/simple;
	bh=7IVWCHfP5MwVTCA3fIsaCAaolAt/KSw/x8IVH8+NdoQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XufvTnQ/GQNhXv7a8lBKzVk0qrok6YulgWACLYN+l+8INicbIz94qoFF6xDpMgM/ribkyhmFRFjciUFLRCys48y0dQTl6+toopqBKpJph8BPiWKMXkSnHoSssaZBzhFHsAUtb+VXoa1mHalrzk84L0AnIZBMsiJDshnO9EsFr20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B4DUz/10; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B4DUz/10"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-476a130c138so280981f8f.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783064839; x=1783669639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0p62SZWRaW03RXCqUmh0+MOM6FMNGTWsoP+vgWvFmoQ=;
        b=B4DUz/10MLZA7P/uVUOQZx3qdKl/h1c0DgNqTQyIJIsIYSpbd+/7kOkQn0W6M/no9u
         VCztok+nzdX7H5TQq88rY7649BQamTl9sZLbm0iuuurXyMD6hqJbKEohJ3vbJiFKMedb
         0HTta3pvS6ZlUECw2k9+qKSuN2kGAe+rFOT2rNlEIi29qK2aOVSLf8Iu7KXzRBElO/Tr
         236dL2OhxoNBWaj3pVergAeGkwyLYoYsbPyHQrn3snvLb+g+v5NZVe9pDwYZpPxwn2Ps
         ZoPA3akbsK5ou9A8yvEBcXRs8rRnS4Sk3oDzsdUBDvS7MLU4MkGWqTARdS13ibIV4QsS
         9Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064839; x=1783669639;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0p62SZWRaW03RXCqUmh0+MOM6FMNGTWsoP+vgWvFmoQ=;
        b=mVRnMghXLDPG97cDHanO1CSsIB7fQkc9r3OdmUCYN4wMHYeyXOaf6OByUixxkmWScr
         KENVDRmFR1tfJtxW275BP1lqoj9eDD/gJSAhYh2v9gn+TOyi7NEqnFewzEs8g510qTqq
         bSUtdJkzuvZ4XWJNQXOt3hCkqBun2mwq/w5+t/MEWcbGUO9A54H+nH5JW3NFIjn3o+Zd
         9b1n4PGmvg75h3GrlUHS9DE/j94/hIxjEvhPrrxrHHUK7rX6lefJQd9+eJUcBgmgiW7F
         WFxHpOUt52uTJHrc9LA2LiImph67Wf4h0c+JHFXnhrdSEAmive5Va+TSLM6NOP+pnEGF
         UXvA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6diQOSXguAokB74u73qoMDBkYDxBkfkmABHsW6ApcZXOAEDi2F3N7qa8e8LMs7lv1+ZF6l85OlESw@vger.kernel.org
X-Gm-Message-State: AOJu0YzDrJ2wHoLw4e1Uc9HalP2BvjJeabzIK1/MRAmtlDnNuNXpCd2d
	jYSCEfhmsO+73tXo/YEJUoSUp8eTZ0DHgmGLGXZ0P5/qNxIo1AXhgB7r0oWrgo1Qf6k=
X-Gm-Gg: AfdE7cnSpNhpvND1mwD7wBBzvWG/p6z6hhDCbCq7Z0HyP8w/8M0+U73TsBTzmqVPS1h
	Ccx8bKBcGYm40Im0jEKi/bCGqdVjQi15sPsE6fxlSsarTiGSAFQptUa5I4F/+QYrG1goSJZNJJx
	zBgPMndntGC6jrb3qOYyMpgcgdS12uKCJFourSVmme3HrS0KhfP8eKDHOG0qw9oNx/5b6lhXy5w
	N1HTbHt288g17n2nb7ayT67LxvHNQhpM6Jjq0jO3NP1lxbjZF4BF1ftz2VIRyF3xMJHjV9lhDUQ
	nruMuLBJctYc7VZR/oDuKZv4cHaWcnts5HKG7Vzd0RARqx5G/w1wnE3HUw7Uhdqv9cZkV+wjxSK
	/1VY6dcKyCQNj1qiWn7UllQS3c0HWr0bPW3J/xM8Lqg+q+spZqKQScKS3/AYvMZ3oseVnV4nrKv
	mopxB0g2BANUtF2WcE0uz6M/3ajtIT8ljzHyCptk9eqYU2/LhFwXEfP5l0DTvHVn2bqHVE
X-Received: by 2002:adf:ed42:0:b0:477:80fa:f44d with SMTP id ffacd0b85a97d-477b5677843mr9598440f8f.40.1783064839203;
        Fri, 03 Jul 2026 00:47:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e9e1:7bf9:472f:c4d8? ([2a01:e0a:106d:1080:e9e1:7bf9:472f:c4d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbc75sm16621817f8f.5.2026.07.03.00.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:47:18 -0700 (PDT)
Message-ID: <446be9c1-b9a6-485a-b21b-ec812c163e8a@linaro.org>
Date: Fri, 3 Jul 2026 09:47:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8650: add CPU cache size
 properties
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260615-topic-sm8650-upstream-cpu-props-v3-2-eeb6e9fa7581@linaro.org>
 <20260615165606.ABC8B1F000E9@smtp.kernel.org>
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
In-Reply-To: <20260615165606.ABC8B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 18:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The L1 data cache size for the Cortex-A520 cores (cpu0 and cpu1) is incorrectly set to 64KB (`<65536>`) instead of 32KB (`<32768>`).
> --
> 
> commit e69e8fc4f3866077641d02b02b7f11554b632507
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8650: add CPU cache size properties
> 
> This commit adds L1, L2, and L3 cache size and line size properties to the
> CPU and cache nodes in the sm8650 device tree. It splits the unified L1
> cache properties into instruction and data cache sizes based on clidr_el1.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index e8e43ddc3032a..090a4739ebc1d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -75,6 +75,11 @@ cpu0: cpu@0 {
>>   			compatible = "arm,cortex-a520";
>>   			reg = <0 0>;
>>   
>> +			i-cache-size = <65536>;
>> +			i-cache-line-size = <64>;
>> +			d-cache-size = <65536>;
> 
> [Severity: Medium]
> Is the d-cache-size for the Cortex-A520 correct here?
> 
> According to the ARM Cortex-A520 Technical Reference Manual, the L1 data cache
> is strictly fixed at 32KB (<32768>), even though the instruction cache can be
> configured to 32KB or 64KB.
> 
> This misrepresentation of the hardware topology could potentially lead to
> suboptimal scheduling decisions or misguide userspace optimization algorithms.

Just looked into https://developer.arm.com/documentation/102517/0004/L1-data-memory-system, and no it clearly states:

L1 data cache	32KB or 64KB

This is AI slop

Neil

> 
>> +			d-cache-line-size = <64>;
>> +
>>   			clocks = <&cpufreq_hw 0>;
> 
> [ ... ]
> 
>> @@ -117,6 +126,11 @@ cpu1: cpu@100 {
>>   			compatible = "arm,cortex-a520";
>>   			reg = <0 0x100>;
>>   
>> +			i-cache-size = <65536>;
>> +			i-cache-line-size = <64>;
>> +			d-cache-size = <65536>;
> 
> [Severity: Medium]
> Does this node also need to be updated to <32768> for the 32KB fixed L1 data
> cache on the Cortex-A520, similar to cpu0?
> 
>> +			d-cache-line-size = <64>;
>> +
>>   			clocks = <&cpufreq_hw 0>;
> 

