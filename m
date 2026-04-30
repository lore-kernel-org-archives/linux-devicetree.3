Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310D139526B
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540353; cv=none; b=dbwGJA5QUpmVzGZKreKUsNqiDbcJYyILxNG5HEPhclbQpNfqZ4HG2LVEFqlQpYL1jaXGOaU/NXESg2UrhtZ+gIHPHnLrpTEl6G6G5ROSLxNIRZKNCxrsiw+0XT7pMEXH/Qp62s+/sNvjgu4ynYUNRzRldIvJ2D2GhqG8R6bDLEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540353; c=relaxed/simple;
	bh=2tcHBZdgLu+Id73c9frQue9C59SGcYJBPtlBAQQ9eo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ys/kRhC7RqRywgCmtv0RpuqzbfIX/YUutBo+VPAobRSe464kKJ8flM+2ZBCnminryejoEBICHwpA8BRTxw769QXPewR8cAFLR8rCke7acmgWzjF7QOJ5KDFQJ5IoF5N1id8cL+9mJMJc05CLyFNqKLnK43YUoZqRur3Pkaa9w3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rMjAOFy9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rMjAOFy9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso17392015e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 02:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777540348; x=1778145148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXwiU5e9+FBK2pxQninpsC9pqc7dd0IMCHk0/eRjISw=;
        b=rMjAOFy9u9IYwRyqtf1SYJwM13G2z7HE2RP7Fp9BBLgZZ5azf161xuq95W4mZ9v1HX
         pxDGaD24tZf6DWEfFNIGLWwZzCxLoBu6nzbbXr8YZwFbMXT24qftWbpEu6b+8OnZtsiN
         oYfrQBTYIcoAAplEfiSu73+nrStLYwlGBy++zMlle8LbNkRKzlCVk5zIByAcFlHsZKy/
         PCkb/5IWhhZdxkuUzOmmU3nY7VO0fOqVJClHYggFbBOejV5gWu0SA8cbVtqq9I7VF82y
         7/fYCUsT156Zrc+iFe/+AbQQ/sCAvK7uiEQPO8ENMuQ8Z0f4ZJr09sAZQZ7ox7ZY+tQp
         K2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777540348; x=1778145148;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXwiU5e9+FBK2pxQninpsC9pqc7dd0IMCHk0/eRjISw=;
        b=QE/YWN+4eACWZzhanFWFMegsXVUtA8HTtkf3vooQAA2GarSEME1s21Gsxw7iv4TYzn
         JbRUhbk0/Ty9gh+lC0iG/brxphrJJpju9tbTX6sdjA6QSj7DAzPVF1nqCYvlUiRrwoqC
         hYFEFswY+8cV9KxDUrD2yw43BJseddgrOcWwJypbyTt4uxcug6GJ+IGEflP7WCKX0UQ7
         jLx+iJl6djPKTZ9n6wM4OOq+p7KX0Hy9+Hs6KWtVfsPchpvYRj9JudeZzGS1JcoNu9MS
         OdtPnhN0A+LLWfIiufWv6KgtDQ9yxsaRJvD8ir/HuYKHbVabVemrr3JyUlaSxTT3YVtT
         +H1A==
X-Forwarded-Encrypted: i=1; AFNElJ8XkVL6GuvKV1WALlkBhU+QGVXiBnTC5UZmW9GsMuhvIb3/Ey++eBLOTPxKdj19IjKAMDC9qtOBYa4d@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6hU/Wo4Hp3tV+296BhC8MsRrAz9Y9wBkOjk/GPZEo2Ahz36zV
	QYaqyGjYKt76oTiKyA3s71mrf9aTpQViE3fIxUwf10v7HY9WpoQlBQZWCWlp08x96BA=
X-Gm-Gg: AeBDieth5K69F4BngroLZIXQr9+Z7I+pw+iMT2lJWOEUm3/PpxGKB9IuaD7ulRTYMc4
	05ltiJhPlSD/nUUeY6l6x29udzhdsz8acEvTiGX7L7Y/qsRgsoGrJZ9jxt9WRn2KQPfZsYjbUW2
	59C2y91EUlOHcm6pNfY8028EPnnjS82ED22v4aD6ySxERJ7kx/84FYfrUCAcFm9PX1EA2tfLeN6
	27jPR4OmHbtlNMvjqO3JVaO6e73QIQCb8cDFOCE4LrJY3NB92ALyyVx2fBIKjTeiDBxWZ5Shitf
	p/DSaaXkH2DG6mlp6oFrFq5TSICRmp9MOlAFc9jGtqPveFnw+Bvvd1rsIZ5tC++Nyw3Q/n0fgSa
	eX3oGPUZu+23p0LhM0bHt5uX4hoZ2LxpqpJCaEzd1KNK21unOQuo9PSD3Ssim1YguvMUCey8olU
	rWZbvu8SV2ER2Fl9z/jcymGKx396VKsWw6LqlkqzWzdOPW6DioSk4T+gzT2gFkqfJxv325qfZaL
	+mD5DY4K1ce8aHfDg==
X-Received: by 2002:a05:600c:c098:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48a85e172e2mr19009335e9.3.1777540347367;
        Thu, 30 Apr 2026 02:12:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6dcc:3980:fe87:c6ae? ([2a01:e0a:106d:1080:6dcc:3980:fe87:c6ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f7csm53496155e9.12.2026.04.30.02.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 02:12:26 -0700 (PDT)
Message-ID: <444ff296-fa63-4704-bb4d-1940ca0a28ff@linaro.org>
Date: Thu, 30 Apr 2026 11:12:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] Add ADC support for lemans and monaco
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
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
In-Reply-To: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 4/30/26 10:58, Jishnu Prakash wrote:
> This patch series adds Gen3 ADC channel macro definitions, with basic ADC
> support for lemans and monaco.
> 
> Patch 1 adds ADC virtual channel macro definitions, which are used in
> the "reg" property of individual ADC channels and also by ADC clients
> to reference channels. These are a combination of PMIC SID and HW ADC
> channel number, which are parsed in the driver to identify the intended
> PMIC and channel under it.
> 
> Patch 2 adds ADC nodes with channels under the PMIC instances on lemans.
> 
> Patch 3 adds ADC nodes with channels under the PMIC instances on monaco.

I sent https://lore.kernel.org/all/20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org/
which has a similar goal.

Thanks,
Neil

> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
> Ayyagari Ushasreevalli (2):
>        arm64: dts: qcom: lemans-pmics: Add ADC support for PMM8654au
>        arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
> 
> Jishnu Prakash (1):
>        arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros
> 
>   arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 43 ++++++++++++++
>   arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h  | 88 ++++++++++++++++++++++++++++
>   3 files changed, 224 insertions(+)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260430-adc5_gen3_dt-f0434155ee25
> 
> Best regards,
> --
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 

