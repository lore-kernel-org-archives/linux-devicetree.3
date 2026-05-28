Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9B03B6BF4
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961525; cv=none; b=PuYUmMsovrEfJnZVy0+yUaZCxXL2WfOPWahcWk6QKThxD9YJcZ3ZXH/C2gpttR4vRa0DVb/hdTmyYChFAa4HYfJySq91wT6avgnc8FXTYZ6+KKgaRu+lul9rLui5lWbdATgH6hxcjXvhJQ3fVeC/yXPeAkEOXTQRBKnLpnLY3/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961525; c=relaxed/simple;
	bh=xri3heExSX3O02hCSommLP9rtVJQ4RWgqS4s6DCsNYk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WkJAGFxBmhM3b1QNl9ds7drrSyrxfGde0s/zRyn1L/2SbWwg5mK5aqt/YZsSbUI5HmTxgVNEuRCertR1XxBJx/3dYjMhmjwiaTLLnJlf+kDl27VlTu79xcRoNity1/Y4vf/84ckLXgbWq5nqopBVGXBKoVrvBz2FRAK7FVTHTf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wPhcJgHc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPhcJgHc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4904127c32cso40319815e9.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779961521; x=1780566321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/0eF/9zyruMpO33JnJtaP+mGHWQVp58COWCcLHEVME=;
        b=wPhcJgHcziz+/AQRLwcjKIzooqo0zS85XpRbfqT3G0YApPRMXypABzl0AmleNKcBbs
         7ujFVAdLVaZu4rLJaPuFkLyBlKZuSRNUqPzd/XSd7BEr8eK9qrzIaiqeDPs/pjI+1Mqt
         afB8fXusloixXfIQufgZtJ1auxypj1UZwd4x7GSITVzW8tgeqJLN7ejurUb+BU+1vPUJ
         9p3Qi1HNo42vctYCH69kjdNwiNn/M9TZtj/pHluCHvQID+Cl6ub8Vc+6fBHrw/fUT/Jv
         go2BauqQTxuoEVfnem6aGZt2PPZa8RDO611DS7aJfEPDKAZRf2/Ai1XJCLA5bldfW68Z
         K9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779961521; x=1780566321;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/0eF/9zyruMpO33JnJtaP+mGHWQVp58COWCcLHEVME=;
        b=SFVFJFjA7CV/+2OFUJTNJO60Gzbwh/NsFqFbKjMCuvRe38hBmxkW1L+teX29Yy2Em/
         goNVpKD0kfcr9p8d4zhkxzmogm+EoH9kqLPogSSf2t7VK3opcfOVtq3WCtQXKDKHN5pJ
         aNPqTYvYgbHtSFfkEzPzKCHyl7fcL6I5KrlvfS2UvdT7pi1fo0pDSPRJ5NX2nrBD/xTi
         aHtANVresoFm2DhzjKmzVEUb5U78fTgIenruwYY2t332h/jb4ZVERiZh3gxLnM3wJBCA
         av7nt1gF2XqT+KmjnPa7STut1eUf+wl26y0hW2JgeMMmd/neS3sFaLUbAVWhMUlJUnoM
         QpDw==
X-Forwarded-Encrypted: i=1; AFNElJ/balXon4dSWuxn1O+bxZpXeTzVQ9AouyLnIfHPDfG0dIK+/53JbBUqhEsRe1WU57M/Sa2F9chJ12Qx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Eh8Zw2YympegiUxVrhTa0S3UaZ55Tp71r/q/LKW7BiMcI4e/
	1CDvQU3kEof4X7PPZDyxR1P9xjsn2qMdOoxwPcf3XZaoBydN8IkyVndLHjS8kC8osr8=
X-Gm-Gg: Acq92OFbbNTkBrxWY3XMR7oz/xY43ydbgtlaRQ+eG5XKFhU63mvY9von2F59b9Ji5IM
	Ax/NVJb8ZOpoAlU2BVIZ82araigncLMzZYIwNl3xjsUiyjXCzhpg3vmUkFhNULUoZg4y4pqJK0h
	nZBmnEUJN1poLWqJBUmiChl1NFjzGoLkQ3fQ5ZKL/IAQi3eMHCOK9EN8qCtOjsaNutKfCHffWQV
	eACAJG7RqXMv+gFxt+bIENmub1dy/gZEGxBbN/tWZ+HVirtw1GR2bnTgMRLdF6IJQquIOc9ScmT
	N3uV7FEjOKxmhaTuPSSr9nQwLT0fTey2e7M2Xq42xJTGG6Arn85X0TCXlddElIVGIGI+bXAVPNA
	Fdp5dmegW1gAZH6TdA4P7CSgMFHnK4XUvcLNeHZjWRhw6zO5zR7mJ742SS1GGgsWWCO3hRJ6xh6
	mOsV49qO/Is4HI6/z1tsk0sT6sv0ith4wgnMw+hYaKrbQ=
X-Received: by 2002:a05:600c:1393:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490428e5b31mr439149705e9.27.1779961521317;
        Thu, 28 May 2026 02:45:21 -0700 (PDT)
Received: from [172.20.10.2] ([37.167.60.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5c1e59sm11380395f8f.33.2026.05.28.02.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 02:45:20 -0700 (PDT)
Message-ID: <10cb2641-e63a-4f5e-b89b-ae2fa7b215fa@linaro.org>
Date: Thu, 28 May 2026 11:45:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sm8[456]50: Add missing CX power
 domain to GCC
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
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
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bjorn,

On 4/24/26 11:07, Neil Armstrong wrote:
> Recently, on Eliza & Milos, the CX has been tied up to the GCC,
> but this is valid for most platforms including sm8[456]50.
> So tie the CX power domain to the GCC as well, for the
> same exact reasons as on Eliza & Milos.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (6):
>        dt-bindings: clock: qcom: gcc-sm8450: Add missing power-domains property
>        dt-bindings: clock: qcom: sm8550-gcc: Add missing power-domains property
>        dt-bindings: clock: qcom: sm8650-gcc: Add missing power-domains property
>        arm64: dts: qcom: sm8450: Add missing CX power domain to GCC
>        arm64: dts: qcom: sm8550: Add missing CX power domain to GCC
>        arm64: dts: qcom: sm8650: Add missing CX power domain to GCC
> 
>   Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 5 +++++
>   Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 5 +++++
>   Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 5 +++++
>   arch/arm64/boot/dts/qcom/sm8450.dtsi                         | 1 +
>   arch/arm64/boot/dts/qcom/sm8550.dtsi                         | 1 +
>   arch/arm64/boot/dts/qcom/sm8650.dtsi                         | 2 ++
>   6 files changed, 19 insertions(+)
> ---
> base-commit: 4c406406070d57dbefeaad149181785330c23f92
> change-id: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 

Why didn't you pick up up those changes ?

Thanks,
Neil
