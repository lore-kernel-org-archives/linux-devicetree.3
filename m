Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B252E88BD
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781599142; cv=none; b=Ip2jb1GX3BDhfCACdAA2zs8/spXS9JyhxBCf5YFHYqCPZAQAHBhD/J51w/ewHRRrSBvdpgu7eHNss9J1qA9YSLYARGuwy2oOuEln+aon5QwxF3ii4/xsTXH+A2L17vrE4udJG9FGU8AO/RXtTu7gDB6jaA0Lz3mNZSLaq06wY2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781599142; c=relaxed/simple;
	bh=k8aQq5wGmFAB4J4lBgkr9j72Y9UninjoFJHtA/6CKlU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fGZiGCPW+1fz4T4TUiey6jrBBxfjdZBH9bfWw5UPUF1PKoCFnqtX+FOVZ7ouASMWnAWsQ89eqmwNW+/VCt6k5U6XcMxthFD/iLK/cjAnoz9F6FbaDCB5LnwFu46pN21grOoksTLc53xLP+Mpamp/0OBpajKqcOyi0nOsLK0tQzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7OZ/uPb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7OZ/uPb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49222b6e871so27719755e9.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781599140; x=1782203940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTZp3Url2zZDdRq9wvwMvf217hOXdGlg4G7ifVPCt0M=;
        b=J7OZ/uPbYioBaElB78mQDC8gLuglE0SIflZu864FX+21Osctd+gkjzlUrqNWORzpxR
         OIDofk8l2k3i8E8nCtN+MtlehMgE9BQiggK5SCDy8TMNWUq795eSwo0bRunt9OPTivnO
         A1GO4Icw/4yTOsDFycv0G8zAegc2SBABQcXb2wHquEALpuU2AcPIJUpRi4A2BPeckiuR
         FtEKDlfmyCbXPgGB74M9IzWexkAm1POuDWUrMdkFtVYgrXIIXkpqvk68YcrQCrNBtyG+
         C6PMzV8A5c8o1gJyJNynwnMYxyF/YHiibeQF7fZq1nhtIwBGXbJft288cPp5/Mvi4Os4
         THAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781599140; x=1782203940;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTZp3Url2zZDdRq9wvwMvf217hOXdGlg4G7ifVPCt0M=;
        b=rNdwhl8bmfMaeeeBMtQEseTmtZDaxkRmEd9vLXI88ngS7pyX57+PKizDAsOmAam5dZ
         Qhx80A4oxWxhI0M9vCtXYpxubyxgjiLhnFFhzMWd3Zp6kr2csE++RiZXsOKNFoZ0zrBY
         yO3rFEtunqZ6Uu7uG9b/eX3C93uvNlsOPT+TS140/NMsBfWYctsl69XZ2ZRlO2PGFg6T
         ivOeeyWabESH0O+ObIXNbt0h+fKpYnbMfkOfC3qN5sbMn5ISHiCJHyHZpRf+7LSDLS/S
         LKBDJJQagUwkc+QC2L5Nrc5LkzMeHW74TXR81MfUJi/LykO7mQKHTo72NGWXGVMTfzZ1
         W0fg==
X-Forwarded-Encrypted: i=1; AFNElJ9JjVaNDhfjF2lKAhYURcVIVYvPiy1sZhpShi4Cn5cCxZzaD+/6N1UG4E+D6UFDmzEliCvSBhFvipM2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ScrBk5fTSjjwdBnTE5C1xJ0nkrWPh31a0gZfEM6iVFXUuvZN
	DvMHDXChEUhAiUvfRwEMGpYBayNs6OJ0WoeZOZMH00K9Cc4LeWgIY4yAeAuu5IdVS2Q=
X-Gm-Gg: Acq92OGt1HgpoPAzl0SQUNdodAgqeWo8VC9KL2VMG5vDglefplLXFvFGQEZtQD3mokL
	CxPcZNAzQUHtZHjfoDMq2r95xxHCkIYnlss/cRW8FSwQmSOMeb+yL0b6rL7Vc7kzOlOHIF3AVhp
	yU0kHQHqGonwPXzvkCh3DN6eeiFNiyss/GL4Bg8hR/Bm3ZBXuYdEcp0+/Si49bzrA27hnddVexc
	U3ZNXZ9sdGdAwCdAKWSYjgd9YD+MnnGepxJI3y8pryXa145IZ4qTRi0gFYlE5/8oW9ZVH0gs4tq
	4mlIQvyNVFiBp3LJaLlqyiHrXh05Uunb6g24u06a2vi5h16ig3mlry++mHkd1PLpCcLfnxP68py
	smDcPCy0Q3AJao6SSWF62yKjh3hwVexUNl4boRdvWBDbaftSIdnVf7YbOmCje06QTJ22p0rCwO+
	8XpNjGM4+RTrtzHpRhJ2+RPUDXdc+dMw==
X-Received: by 2002:a05:600c:34c8:b0:492:1e36:8c4b with SMTP id 5b1f17b1804b1-4921e368c91mr191827965e9.36.1781599139730;
        Tue, 16 Jun 2026 01:38:59 -0700 (PDT)
Received: from [10.3.4.22] ([212.133.41.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c10sm42736575f8f.21.2026.06.16.01.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 01:38:59 -0700 (PDT)
Message-ID: <50b8d6e1-7038-4752-a200-441736dc7135@linaro.org>
Date: Tue, 16 Jun 2026 10:38:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: gcc-sm8450: Add missing
 power-domains property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
 <20260615-topic-sm8x50-tie-gcc-to-cx-v2-1-6b5752dd4747@linaro.org>
 <1d4f3e4e-ec9e-44d0-9e4a-651b6920015c@kernel.org>
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
In-Reply-To: <1d4f3e4e-ec9e-44d0-9e4a-651b6920015c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/16/26 10:36, Krzysztof Kozlowski wrote:
> On 15/06/2026 18:57, Neil Armstrong wrote:
>> In order for the GCC votes on the GDSCs it provides to be propagated
>> to CX, CX needs to be declared as power domain of the GCC.
> 
> I would be happier to see here short mentioning what is the effect of
> missing votes - do things work? - as justification why required
> property, thus ABI change, is justified.
> 
> The DTS patches gave me that answer, but should be here as well the best.
> 
> Well, don't want to stall anything here, so anyway:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks I'll update the commit message with the same explanation as
the DT changes.

Thanks,
Neil

> 
>>
>> Document the missing power-domains property to that purpose.
>>
>> Fixes: 72a0ca203ca7 ("dt-bindings: clock: Add SM8450 GCC clock bindings")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> 
> 
> 
> Best regards,
> Krzysztof

