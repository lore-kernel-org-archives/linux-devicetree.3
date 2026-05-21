Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17985282F23
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351441; cv=none; b=DH+FaZp1zYqOIfclB6FJlp0JLlDCGwtRXDzLmOGKmmdRqugHo/xIgDB3DS5VyDXjAVuPcIeRpA25EJ0anqOh32PA/FD9sE8FJcbNhWRP3ytLhfpaaW08R0vvply/WIJJqPUY8ttjiT47ePyjI0mVcpqiCRi2xVu2PB+/X0DDZbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351441; c=relaxed/simple;
	bh=5P5hjZxDYwO2q9ZLPBJEGR5LdLHCMWb9MUIe9M9mId0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KmOe8gMEA3urRepRPwa+LL/TlaM7dbz2wM/SUVGY+e2Xl+S3SLXWzwplujk4qXnffeKQm1u9g89JLyDyd15MV134v5REsghHG8be0mGJlIKKEn543nDSDftg5U8pzSak7Cco9yo1mSvHjBibPRaxLE5/CjFhO3tVQTgaphOObrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lj61f9X0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lj61f9X0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d734223e4so3833663f8f.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779351438; x=1779956238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ugf5QDKMZMTAiOA1ypuevR075zMsv/NRbxAQvzE+1ik=;
        b=lj61f9X0aZjytBNIvJLCVTnul3hxtUmLNoGldmBECSWbMpOzcOXir+rOZG6Q1qsx/H
         HweLGH0dTeWWifFQkBDEcNJPd1KaRHzt2xR06xgN7y3lgaYc6KZUS2QnRd4h3Skj7E3B
         ftB8oi193cWRFzKnfCvWbYCazmzFWTUPEtMPIwXiPIwNthMuVWPqlFna2nELSA+yjyvd
         hJbp1IVgJswBP0OGf9zv5e3rvsZddzN1aTFgMPvlaoQG7XstgDTrmK8piio9CovmkZ6T
         K3WKEcuAJ0q0xwJaeq/EOf+Cq6mk5NfAWMVr0Wv+ci/wCAgi+9FtyQr8+sT9orJ4tYt4
         yGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351438; x=1779956238;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ugf5QDKMZMTAiOA1ypuevR075zMsv/NRbxAQvzE+1ik=;
        b=PMV0o+D6BChFEN/uEs07ZsioDI/TXWEuOropoNaQBtiUh0ia0bkubBd7JlZ/fHW8X9
         hogc5QYNcEWXCwS/6IUoPSx+Nwiyxz/wsKpaWRgXTfovP5hxwphb2ugDNWWb5F9p/0M3
         fbeYwzzbUf98YrDa0wlt8A052cpAPfbTKKHdbFMLUKSYaGZn9c9UHY/4NlVlx94AgHZA
         jbrhBFv1lhVq4LpFRFo3oMTXjSrjDLz88q3FmdVwHZoTfgSgFLFD3BxIRM3GnLnnEzPy
         2El7nHF1GfUFuVy/2TDjTX0uQUIcQR3k76rLONYR4XHyHT7yDcPHOZp3qT0jH4abD5vV
         luxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/E9pMRoWjmBT39oAVeWwj+tJwFWRZ4eX2NXwFJJk5iYiuRZDXSCegEMDsz1q/QrvYaCNIMuHP49+jY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+78Ojz/aQzMf+6Nf/KVUD5nHQRTCVWQiF37liyc/QLYXPV1z1
	00it13c3im3q5PXgDr77bA49yIW1jHyeyr/P2XGedt7i4Xkn8qVGhxbNNa6Q/M88NYxlflTJxwl
	/66uJ
X-Gm-Gg: Acq92OFzCmgcofCbAAe3Ofz+U8+z5bSp4X//tzRGha/yoFEWn52IJr0MuYMboC3rfQU
	5WA/nX6LWDf1wNGsZxs20XJer9yHiGWm6nMJyaIPbMlg8LPZJo3xw7J4dr7g5g2nTIaoOPrOijj
	GJUkAZ7tBNDwAEIuwWKA9XLky1JUpLib/RBNA6ZVRJzXwqXrcNjRgkXnNQdOAFRFNA6UCWk2Bzb
	nf2fhPeJ0itFuraKrkGzvwYEjMFw5ESeu+uObF6mMuEfjEL54pKIairYpyRid07b7MSPj/xdJih
	XjZiIxXr89LkztG38ZTU35ZYtEQ6k00NoJfHmV2isLt76iG9Oi3V7C15XtGCnQSvrlOS2ZohCha
	bAMBINDWJrdpNnM+Kn7KaJxXciM5RsJMxl3qCAo8r4x6O2U0ufHuEkpIZC/6xMALjtXzTqBGyPY
	ZxvGDmjY873HvSelPD4t31001145euWdd+u3jOwhuZAdkw7ObXbcabSq94zPmSNLjNPHq46AvR2
	7fxK562clp2zFi0C33h/2MNxyKV
X-Received: by 2002:a05:6000:2798:b0:45e:733a:a0ff with SMTP id ffacd0b85a97d-45ea31290bcmr1657841f8f.3.1779351438367;
        Thu, 21 May 2026 01:17:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa93ce5fsm895798f8f.33.2026.05.21.01.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:17:17 -0700 (PDT)
Message-ID: <91ace2b7-a0c7-485f-a464-d7db397e0df7@linaro.org>
Date: Thu, 21 May 2026 10:17:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] regulator: add SGM3804 Dual Output driver
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 KancyJoe <kancy2333@outlook.com>
References: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org>
 <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-2-7495e7905693@linaro.org>
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
In-Reply-To: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-2-7495e7905693@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mark,

On 5/6/26 09:34, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add support for the SG Micro SGM3804 Single Inductor Dual Output
> Buck/Boost Converter used to power LCD panels a provide positive
> and negative power rails with configurable voltage and active
> discharge function for each output.
> 
> The SGM3804 is powered by the enable GPIO pins inputs and only
> supports I2C write messages.
> In order to add flexibility and simplify the driver, the
> regmap cache is enabled and populated with default values
> since we can't write registers when the 2 GPIOs are down.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/regulator/Kconfig             |   7 +
>   drivers/regulator/Makefile            |   1 +
>   drivers/regulator/sgm3804-regulator.c | 308 ++++++++++++++++++++++++++++++++++
>   3 files changed, 316 insertions(+)
> 

<snip>

I checked the Sahiko review and the reported issues are all false issues that
won't happen in real life.

Do you see any parts I'll need to improve ?

Thanks,
Neil

