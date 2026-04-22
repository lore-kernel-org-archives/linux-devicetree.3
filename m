Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BACE3ECBF1
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776866965; cv=none; b=jPQFc+6pknNo3N1d4zbKk+vdpP8A6eHjezao0/8VPcz3kH2bBwmANkZLBEl8jPrEqYhu0A1nYAdGbpTS8L2KHYBpdf1gWbC6jPXv5DvqA+9GPTSzDwFUW9XcIVqaBFzFr+pTHJBdcRmSGCR5iaudVSKE6t7ZoEEqVoJMnHoAV08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776866965; c=relaxed/simple;
	bh=oXsXDlDpr6Z8h2sfymmW4mccK0oDOAXpPjJkMEQdK+8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pbD5C15OTRHt3lcjIyM2rWjASxu/wxSJ0AU8Fxh7vFmAZQlCd5wVKuBt9gqB0IuhH2oSbB4mfN1slwdNPVzdyqPmVxw+or7wy7iq3TekmFDGcrFUF8UpgbocSHSdriHpKKXUNILSpkC34mPezcyFx7cI2MPrFKFMAdYtfP9V42k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/ThnQrB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/ThnQrB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so22021715e9.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 07:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776866962; x=1777471762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMlRG6nfIwVLZpYsvGlw0C5ymmwHkKVzY8PzkFLAMGo=;
        b=K/ThnQrBuB/LLnZl854INqPS0UfG+k03wj6/wEev8Kevf/Wk6zF3c9hMiFY8mNhtAy
         I+UjpXWxwW6j4YlQCaIvYjuZytBwmj3PaneP10L6IxSv6V1m4TLnWQP2cpMZXR7z4UzI
         7+igRWwRmh8rR0RNuMB45S/Bi78eGvPC2EzFGO/1V6lkn92pOjMeWQjyvKXrjA6Faw2P
         KRADQk2gqWdC93SlJmqcxvdPUdRLqtXk9ViYgDUB846PzkBxaPHVnwh/Vtj/SWmeCYss
         jUhMxHnFIfBFjahWUc71dsZ6YdMIsTwA1rtoU2ZWZEVbnrL9bHkLEHCGfOwC5veVgiaZ
         y9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776866962; x=1777471762;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMlRG6nfIwVLZpYsvGlw0C5ymmwHkKVzY8PzkFLAMGo=;
        b=lL67/iAbtEeHvZdiVklWTT2afWu+nfqAVBI9172j+Mq3pT4rg4APUdCX4/U5ceGFiu
         cfAtZTRov9LRQKjP/PJZQpG3Pd5jxnbP9T6UjZXfC+BdoWaAvmYp/pSk3w9e/XdrpMDy
         z9P0h+pWkrb9yR9LbXwapuh4wz6AyXK58KXGKF1Oz8UalelwoNZE7vuFcmPZmW0WRMD+
         +KDVSA2o8XDsPrQZeEbbZ1g03cq/a2Luitrmjf7ISYI2CocEvb6lsqVSEbwbE5flm07Z
         a41QNWwfcsOgfCOhU2Gv7+yGUrh/MCHXv9QmF5RwhlkAB6IYqM3cnuwAiIuPQbvqxuvl
         ALGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8le3LwsIdjFKCcQheGZ3u9hELmpv+LRcge7uss1CYhMqKiEh72IJ98PFKz1mufXY9J1HDjary094Sv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7CR+WD+0xRJh9cJvuUCtHnR/wkgGWDJsfkdyli0Vw0X2ef5tt
	7ombUG+/S3nGmaF4xQeDUXBBswG7vgmzKzJIqLwNKG1zo8bmJVyVnZWNpFMfKy9/Um4=
X-Gm-Gg: AeBDiet0Qu8Jqcc8VpuDTKOCIq1C18WIpV1NppznZ02L+n9lNf64Krb49Z5qwycSk72
	UVVEqH9ZCidLnDugPOiN7FTsSx/NZhMbeshFSNhg7db5gx64ZY++YEKope5ycBjTbLQ1dUJYywi
	+9+UdbCxRSek1wQuKSxIzXqFV+eGTidiir+3ww65rSXN4ICDpsEsyyBVvxVCMsye7JrHOypADx5
	jCr1oOktNh3EpT2l5DXx1f0zEzcTa9v2U68ISQ+ptnT52IFadmVWP5MkF3fXh7G2YedGM6tfnV+
	8s72fl/R6yA7t9Jt4DqS8fbs0mSOkAFuwD7VdeGwzk8cGBeyje8LJoM0LdSyeE2w6D8iZyRkiN0
	3ReOGFtOYxIrO3eQqkNGrKSsMRk7kJFKSb1KI0qSxpohJymYByLBpF37igKxDhaeQ+Ws2DJOzUY
	mExBUQFainrCoSmg+2ILO5gaKrTovLbzvqStcXXRUGvME0LVso47RWINggKVJnM4qKSqUhRDR7v
	t0HutDcwP0k+l1uEQ==
X-Received: by 2002:a05:600c:a410:b0:48a:5821:6006 with SMTP id 5b1f17b1804b1-48a5821692dmr73406475e9.4.1776866961517;
        Wed, 22 Apr 2026 07:09:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:7d92:9cde:4eb2:46d7? ([2a01:e0a:106d:1080:7d92:9cde:4eb2:46d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm91904395e9.12.2026.04.22.07.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 07:09:21 -0700 (PDT)
Message-ID: <7df498b6-485d-4997-8e0f-4916935b8eef@linaro.org>
Date: Wed, 22 Apr 2026 16:09:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8650: fix soundwire ports
 properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
 <20260420-topic-sm8650-upstream-cpu-props-v2-3-689e07d8ab8c@linaro.org>
 <923c851b-17b9-4a8c-8b63-1e48fac5d1f4@kernel.org>
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
In-Reply-To: <923c851b-17b9-4a8c-8b63-1e48fac5d1f4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/26 13:22, Krzysztof Kozlowski wrote:
> On 20/04/2026 21:26, Neil Armstrong wrote:
>> Since commit 9e53a66a2f2f ("soundwire: qcom: deprecate qcom,din/out-ports"),
>> the ports are checked against the actul hardware configuration, leading to:
>> qcom-soundwire 6ad0000.soundwire: din-ports (0) mismatch with controller (1)
>> qcom-soundwire 6d30000.soundwire: dout-ports (0) mismatch with controller (1)
>>
>> Fix the ports count and properties of the corresponding soundwire
>> controllers.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 42 ++++++++++++++++++------------------
>>   1 file changed, 21 insertions(+), 21 deletions(-)
>>
> 
> Thanks, the change is needed. I saw the mismatch as well, but getting
> these values was just too much for me.
> 
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index c5358894fbb3..2cccfbc6d008 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -4730,18 +4730,18 @@ swr1: soundwire@6ad0000 {
>>   			pinctrl-0 = <&rx_swr_active>;
>>   			pinctrl-names = "default";
>>   
>> -			qcom,din-ports = <0>;
>> +			qcom,din-ports = <1>;
>>   			qcom,dout-ports = <11>;
>>   
>> -			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff>;
>> -			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff>;
>> -			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
>> -			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff>;
>> -			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff>;
>> -			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff>;
>> -			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff>;
>> -			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff>;
>> -			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
>> +			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff 0xff>;
> 
> So the last port values are marking it as unused (0xff)? Aren't you
> missing the sixth item instead?

I checked against downstream, and the last din IPCM port entry was missing, here's the default table:

	{3,     0,    0,    0xFF, 0xFF, 1,    0xFF, 0xFF, 1,    0x00, 0x00}, /* HPH/EAR */
	{31,    0,    0,    3,    6,    7,    0,    0xFF, 0,    0x00, 0x02}, /* HPH_CLH */
	{31,    11,   11,   0xFF, 0xFF, 4,    1,    0xFF, 0,    0x00, 0x02}, /* HPH_CMP */
	{7,     9,    0,    0xFF, 0xFF, 0xFF, 0xFF, 1,    0,    0x00, 0x00}, /* LO/AUX */
	{3,     1,    0,    0xFF, 0xFF, 0xFF, 0xFF, 3,    0,    0x00, 0x00}, /* DSD */
	{0xFF,  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}, /* GPPO */
	{0xFF,  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}, /* HAPT */
	{49,    0,    0,    0,    15,   24,   1,    0,    1,    0x00, 0x01}, /* HIFI */
	{0xFF,  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}, /* HPHT */
	{0xFF,  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}, /* CMPT */
	{0xFF,  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}, /* IPCM */

Neil

> 
> Best regards,
> Krzysztof

