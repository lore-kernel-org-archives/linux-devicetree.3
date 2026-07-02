Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB344968E4
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985310; cv=none; b=dHIj6J04IGBW1a7bVlV5vg1Yz7e/I6+3Thn2IB3yBEv2NpUi3HP5LKv7fn+EK89B9oKuo8SYtNgs/Ygm3maU3tez+amujRvW65uSuuIv4pnR9ZlntphLNtFjmQK5rofBWusQzvQ7WfhQYCMQjQXuU+Yt3GD/BTUEpdd9h0KLkvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985310; c=relaxed/simple;
	bh=VvR2g7Gd5pBy3+eoPP3ACJOFCw6gDHozq6bh3Zr/x5Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hjOxrbQEF6DKpo9VlQ+6O3VogohPA/VTYfYm4fJNkJFRPeJ2XlwrJEA4jIzRpl06e1Toi9i7sQc1vbUjy6PtsC76kdzeOt4Tk0sWojpe2G4cq+uVQRBmh2rmexQ6U4ao+CP5anxF9DRbcSxT16e3AQoeHSOa0wg7bFjaRnv1kg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mKDsx9Cn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mKDsx9Cn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so11006205e9.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985307; x=1783590107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6QJgxwUjEvSuaksm1pvVtvXZiVdGV+tGv9QPbT78G4=;
        b=mKDsx9CnPd/NrNWqyFu8xPDI5kZPbugZFCLKgTupSqwWWmuY07HNWtZiWRE/Qjr/p3
         l+SxPk21mN1njaVNxSlBHSGwdrQ4je3G0FU/bQ4GckYArjPF7rwsE+itrodewb4+pBkO
         erGU55zCf0QwPFieJ/JScYCLECBYfya1dkgr4n4KgOqX84YDDXkxdWraAR3S5prydc4t
         85+4imXvR6qaoV7FcQWyXXNB+BD0fv/MLL7Y4oothIILcdjNyfOptRKWQyFSg3KJoubM
         /M67rsey3Wd7tBY5ScHTZa01991gmeWVBBedtIowgVheBjKIZQnJo4Ss7gdPkXhez4w9
         qYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985307; x=1783590107;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6QJgxwUjEvSuaksm1pvVtvXZiVdGV+tGv9QPbT78G4=;
        b=prqDRkwVM2Xu1P6I+6OegvzhSOm+mil/H0nl9KhnDMzwYjNq532l6nfcUe5a0yA4cu
         YLlRzzqHYyJkPVPiW3ilZci8606xiTOR+IJKDuJ0NOvJC3jRT+wHhIdpbWmPPYajLMbk
         sNR1x2AP8BGXzEo7O38V3DQopX4nWDNem4qAWNfakXpQLVI/XWtmZ+LLEbH1nSjDKH1g
         /XWiGL99iUlQKTyZN3nBHFGu6QX1D3fnx+4O0KxmZQIoto/a65mqDKreDcZ/5IXcMUsu
         nSEO062jLubjXANpbG7m7t8/VWEQtFmcPVIyPnkH/+/JR0lbJo5XUpjZMpuIbkfQdjr6
         8r8w==
X-Forwarded-Encrypted: i=1; AFNElJ9ofjX/vKS3GQzsi1Ir404WFyxmzB6qdPdutg8NfnCYdkKOPSUaJ4NPwcEKZjGAnuI1h6/NWaVbJ0IR@vger.kernel.org
X-Gm-Message-State: AOJu0Yytc48g0D6G9VjDNN5mOLfsmiXG4F2q+SDoReyBlwkNEUiLKP9c
	ezWJXS9XiSWsvDBmciGetmx+gWVoeVZl+der0Cu7IsaE39rGetrVl/GuW8WuD8xukGM=
X-Gm-Gg: AfdE7cnbLOVx5hLPziPYZnDCLj+OMYiKVxvUJTRtc3PXnjWKgJbj1fBfvdIyMyagUMV
	Ou8CdLy3KcASbvqcgDnaOPdEgwA5XrHKJX8vhGUNhmQYL7sL8EIJEEURM85jKTYHkN+CfBV/ApY
	1eG6S1UX2o+4+9lDDy8/wjcUAjiW1q5hpmqxjIkNGqr+R9OQJ/QIl6m3CbuSjHQeX98O0IDexM5
	0hWDvkk/nfW2/mxHx3yD6kF2rb8FVXzrVOmFjJeBrV7F6QZXz86Zww0xCvxUo4qyXV5mOpdMLnm
	JiEjX/voXN8b0IMHTvvqqtNNcoNztgUgfeIw5V+mn324c6grAyi6pXOrHHAGWPa1+3cSROqtzkG
	FEnFsxZ0sAGQgBOnKzQJSV2B7N/UkXVwHo8JnprKsCfEF3svaYbr1GCykvJjxBIicq1kQI8oH4z
	biS5l1kdE4qvvL1uJJbJZyYJJRtjKOcmfWQ0ZuzidandZllkwHTHqzx9E1n5eWGGvu8G8g
X-Received: by 2002:a05:600d:c:b0:493:bc31:b2ae with SMTP id 5b1f17b1804b1-493c2b4431amr65140145e9.10.1782985307187;
        Thu, 02 Jul 2026 02:41:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:33cd:3431:8a4e:350c? ([2a01:e0a:106d:1080:33cd:3431:8a4e:350c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6354926sm41919385e9.1.2026.07.02.02.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:41:46 -0700 (PDT)
Message-ID: <92c1514e-eb93-4c85-81c3-b08530dea92d@linaro.org>
Date: Thu, 2 Jul 2026 11:41:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/5] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <ed1563c1-ecf8-440c-a39f-f8335db77b97@oss.qualcomm.com>
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
In-Reply-To: <ed1563c1-ecf8-440c-a39f-f8335db77b97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/26 12:40, Konrad Dybcio wrote:
> On 6/17/26 2:53 PM, Neil Armstrong wrote:
>> Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
>> found on the PMK8550 which allow reading ADC data on the PMK8550
>> and other PMICs on the system.
>>
>> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
>> other PMICS on the system.
>>
>> Depends on:
>> - https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com/
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Changes in v4:
>> - Rebase on https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com/
>> - Change all defines
>> - Reorder nodes
>> - Link to v3: https://patch.msgid.link/20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org
> 
> wrt
> 
> https://lore.kernel.org/all/qgjntewdw2qesvkeabvx46zxcwrikvpkgthk7e2cqw7biuhmqt@2khmbjh2dt26/
> 
> you added a comment:
> 
> /* use the default settle time */
> 
> which the bindings tell me is 15. +Dmitry did you grab that value
> from the downstream kernel or something?

Yes I used the downstream as reference

Neil

> 
> Konrad

