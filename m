Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3673D40DFA5
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541572; cv=none; b=C2CGYjsWEARYdODYekYZajSFvUd3LzO7tjW9ZyR7Fj1/U6Kx873FrGCfG1jmjr3zFgRTo8F1f08UmZ2Gw6x8zKlmC3fTVlGm+oteH/MXil2L5RrfX5TJVX6JvLVhwdeJW851QcfdgnzjyLMooRk62wcZNKYlsPwp8xjH6MwovYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541572; c=relaxed/simple;
	bh=PinZeU6ZFTvsqgRx9PSx0PJyo2g8IsvsiyyekgnBBFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vx/y5+KQLVdBukFbgKE+ey3uHzv04nQ8AwDYBSvtN1Q3NLQjdTTSFK3ZgsB+eLQVW53QKm2nR+DTj9OmQz3hdw6uSSUkFxhhH2IOIxOS5zJ7cK9wLlCxw9OWWvR4EOWZDP9FoN7CNTubzt3ClQYebVngSOvhMaWSE1Vl5AXrwDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gPib3msO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gPib3msO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so28967895e9.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781541569; x=1782146369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEnc7IU386ndnILVQYV7G4oksFbgz8rGdzJQI/dF1ZE=;
        b=gPib3msO2D5VMmPFaoIDaTje7Z+4sZUdNXdKmqvftvu39DCI9wHRxVMAtPpBLN1mp7
         IsGfSdq1OAbyRX+2R5pRqoDjfXvmP5d3xDvKuMVJ4e7VT4A3ZCVydX30GXV1oelkb+uE
         w6OEXWAxWV5NF+oObnt/5kBePjjZCjzFp2shhCG3bvZcOK2xNoKuCKRziF+19LNhQH3i
         c2uqXXGeFLu+Ogw7d5hiVN3rzQ7rBO1pjIAw0f/I9Xms/2M8Eh5rd1Mk6D9AcXabfKII
         EA5yzHGRdnN7OJ4NHqoqGIOCASjaHTg3ql8P5FvVyr5QzESUhMC+wm6EOuglQCeETUKB
         aUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541569; x=1782146369;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEnc7IU386ndnILVQYV7G4oksFbgz8rGdzJQI/dF1ZE=;
        b=qtuL0FvCr8Fv2PoVgrOY5lb1wH/pLRMtjU8zhxe17Il5+6F7Sf5ZmsEPOsI3vTmwhN
         PBwdx5xQjWKCw+ZTs2VVM+YadsAi+7AOFReJBmPS5L+qa1JQGL0oLrHchnwpaUsdZRda
         eaZxq7uF7gFR/pfuBNSWlKjroXbUG4Ou/l8+Fj+AOGCj8X31eKfLbhIiINfuXR9kXUlD
         nxOvrUmqobVCvOeXmB328cjhOp2VtsaQRv2BHsASqTqxniQiXL7rSLIVevphmffkuCXh
         RrYYhhDAQLJvJlIImB3LzhIl2wdE1yuQtfje5RHqxy830HLfgRL8bYJXBLlaopXiQHIq
         7ofQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cwr9xHWKZzIkN+adwYzaEIesRlP3nmPys+y99NtpypRabz5kFwp7JWG3DQp0pcFE8D42LHSFMa7Ja@vger.kernel.org
X-Gm-Message-State: AOJu0YxnBC6SX+2HZGYgk6IextqdWyh8OFeqmtPfvKazV90VEYJ3szzY
	haGumPiDBTFYocs6oTEFpsUWHCUexQNbAxP/sq9RvGa5eRYe8GEgNutuvNd4t2Mzh9c=
X-Gm-Gg: Acq92OFLB6FhbhJlZZHsfYD+XERs0tlM4pJZsDkeISVT7SgDfGrRrlod68obFwTKCyu
	df6SXPVJgI2srSRWwBZSClW+/vARGpznWZtlK7MeaxAvKoKaK9z3+bzsLMqT9C2Ajn0atyndkVO
	CA+oY/6wtCvCjOXdVTY/3y82Xertubs6PURTaJjSXqs1iq2+5C6Hx6nA021akFAFLwJVYvGuf32
	l0InSPpxtrYffNXk1CY8BGJ2MaD4AFd7mYmshMvE47XjJrVhBJhjJvgAtNwrK1p5TNajQX644XO
	W/mufw475rrYpE1u1x44gXKIFT2Qim+2bWGYBoIaO2zlG7EZlAR4cncbpkMbgCZmYLGyX+xyB2X
	/9ZxppMoR6icl8Pa4trSaqar7KfKqcS/ldY9tkp7kVelM9oeTuo2kpV5iWmsMH2ug8jxA4yvScH
	rchJEdwY8B7R9A1NHckhRgqUzkWqJwD7Y82POpvTVkEW/BM6BQMKOwkJFy1/PonAaHRToH4C2Om
	+2TVWo=
X-Received: by 2002:a05:600c:21da:b0:490:b99c:9337 with SMTP id 5b1f17b1804b1-490ec4c1712mr136532995e9.10.1781541568379;
        Mon, 15 Jun 2026 09:39:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8ff6:927e:47e7:5df7? ([2a01:e0a:106d:1080:8ff6:927e:47e7:5df7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c5266sm41043307f8f.29.2026.06.15.09.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 09:39:28 -0700 (PDT)
Message-ID: <831ed020-4a1f-46af-95c6-38ef1f875fd1@linaro.org>
Date: Mon, 15 Jun 2026 18:39:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-1-ab2bb40fd490@oss.qualcomm.com>
 <60170148-2fef-4282-ad68-f784e4fdfe23@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <60170148-2fef-4282-ad68-f784e4fdfe23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 6/15/26 17:55, Konrad Dybcio wrote:
> On 4/30/26 10:58 AM, Jishnu Prakash wrote:
>> Add macro definitions for virtual channels (combination of ADC channel
>> number and PMIC SID number), to be used in devicetree by clients of ADC5
>> GEN3 device and in the "reg" property of ADC channels.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

And what happens with my patch [1] ?

I had zero feedback so far

[1] https://lore.kernel.org/all/20260504-topic-sm8x50-adc5-gen3-v2-1-5cc04d6ecda0@linaro.org/

> 
> Konrad

