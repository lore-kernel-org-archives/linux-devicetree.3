Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14A32D0C84
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 06:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877745; cv=none; b=XFyjJjbXa8W+1omOK3HslAiD8zA5SUuPa5tAyN4suLRntDhvqOgaWVl618BvZMG/KGn+2n0BY3wzx2J+j9LRU1RFXjK6tPFs9JUyEA1dYV2Q3yEFl59GZyqfpcqZFfhZ3DJyp18Qf15Rw63khxE3GuI2uypC1+xqLIEjeHBj8UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877745; c=relaxed/simple;
	bh=GZIVdLl3kVhNX3ssX8Br2t3bbXFGzS51JUDVPw8q0Bc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BFVwTTfUTVGKz+ttsNvuuNAIV2bZd6FQeC0P1rMVswwvfim1nfqo/iUfFPDSJhOO6Kk6jkD7+3ijlbu4LupjEVodQQrxk1E0rGAo33J3TMHXigz+tFRDzcZvXPQy6Yk/oA5ZxszqI/iiLbjQz2GtjxsNhagDoHFG4PrfkDrrhWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PzFbRXBS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PzFbRXBS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d73422431so3327213f8f.2
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 23:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777877742; x=1778482542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEUnp57+dFeSCCp/1A9NmDUxCYKBXLwpvi6Pa+bh8jg=;
        b=PzFbRXBSRWHpE5A3MRoZnlQ6SkX6zJ8jlZeDBoB5WF/Tx9yI2fgZ58I2spU7ilbZJz
         TjieBrVk3loB0eHILL1XONQru7OUhTJEOomu7DgsjzNRnRWDgor4fcqR27zTgXKpGAih
         IKCLlaFvlZjTnGtJ9x9iJHJJRV7ocukLRaqyw44UwzgC0RziHqfmkndvsPjyqNa7PRA8
         VAaqZifUn41nD1jsl1yTXEr9yUCMwY0yX4yaAkgBa8FyKGsdM1zaCAIMclUYtXC6AZef
         x0Efo8jc5PGlIdHqw0gU2eop49gArETasmyXFvQVtFhGpzFijUWC2/DrkrNY19RZOrKJ
         7oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877742; x=1778482542;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEUnp57+dFeSCCp/1A9NmDUxCYKBXLwpvi6Pa+bh8jg=;
        b=SbYMIwoZ0got48LWR4eGzGOqWCIkpbehL1aJzYdvPBskt+2DkMmzSYiSCCJfNvNXbf
         FhwvC3DEttAQUp+TwTA0F4z/7Oikh13kFzpGnfVqDt0Qb0wqrZmEF4vgHdnV0R86D5r1
         jqovxKM1ElZzy1Ymgp65YtihnOe+F8snuE/FaiTcyvd5jSGLQkIUmTsh1kuwUAFyFOeS
         jy10sjj0LNY8tJUg91sOJMGF1Tz26d35P8pUJgiQHv/HbRuozNEmveFcxtX6hj9hky4q
         vGkIRzk9ZA7Wov26EQF9EQ623hk3iJEpLIEiC774diDcFY0iV27aPQpz2za0xSNyoUZr
         Sy6g==
X-Forwarded-Encrypted: i=1; AFNElJ/I4G5m2QDoSIrryHxzZmISGlQ+dG6Lc0opdNm0Up+cxSt/xQYYB14fn7ABfew8zo2RE8v9YuykjGPk@vger.kernel.org
X-Gm-Message-State: AOJu0YwmeMI4tw8C66MgbAAdgHYx7uFIsaG4rt4jNt76HaCFes8kI5aS
	ifto+bvqTrN/CKGtM+OLYKVuv5BxhVEFRHMC6TMRxbkqpCbvCnzpsqAq4AbcaO0ikAo=
X-Gm-Gg: AeBDietKMX7Tt0S9GMAiFN4GZvq8lQkb24vw5rC7YvKAWDH4yRhgMVBAcDswgwFhZfj
	hfau8E6uUfpxGsfmvzs0CroDJ1Edec3tGMH09ammh7Vqb4sqfsGNdXJjAe3TQza85ryiu+V/LE8
	+W7luRRGXqWUWGlS8Rv9bm8ceq5V6XRQHOPT7uQ5ujnEMykl1d/sT4VJhvOojoEYvaOIfGsAv2u
	l+xA9RawUzbQkYikbb8wUt4CkLvBPG3SAEXbKOAH5kkzuFUU2tqXXdJuDQk6zCrYdhZ7qAeQBF8
	xgaFW1ciIuneFMGTu6kg5GTNbjPAB0/fi13o+zcKWOlqZcTVNnCnSG404iklPH/bj3MWkXLo0di
	ALkvV+jRQATc6cN4riXPb6kuULjCtqnoQhQcWJ3uOuPov3R9/OslDtfKGG87BJPrlosr9mP0aba
	8Juoo+Z0NcGHP5pw42nMRC1LQr/5q8l3m06WMmhH2FtCM5yX/nQwpxLg7EDRNxLQhSyi9wzRFQj
	/gY9H0uHdadDOhY62VStm1UDAUt
X-Received: by 2002:a05:6000:184e:b0:43d:7af0:3a7c with SMTP id ffacd0b85a97d-44bb61111a9mr14782036f8f.29.1777877741890;
        Sun, 03 May 2026 23:55:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4245:af61:1735:3752? ([2a01:e0a:106d:1080:4245:af61:1735:3752])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8f237368sm22625014f8f.14.2026.05.03.23.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 23:55:41 -0700 (PDT)
Message-ID: <2dca0303-b296-4abd-a716-89e08e71a915@linaro.org>
Date: Mon, 4 May 2026 08:55:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] regulator: add SGM3804 Dual Output driver
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-0-76108c65a560@linaro.org>
 <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-2-76108c65a560@linaro.org>
 <afMwIVRDxl11Ty_P@sirena.co.uk>
 <150cdb85-d0ac-4802-a09b-9dab1b9b805a@linaro.org>
 <afPp8DXSLQIkQNaK@sirena.co.uk>
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
In-Reply-To: <afPp8DXSLQIkQNaK@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 01:46, Mark Brown wrote:
> On Thu, Apr 30, 2026 at 03:28:43PM +0200, Neil Armstrong wrote:
>> On 4/30/26 12:34, Mark Brown wrote:
>>> On Thu, Apr 30, 2026 at 10:48:47AM +0200, Neil Armstrong wrote:
> 
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * SGMicro SGM3804 regulator Driver
>>>> + *
>>>> + * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
>>>> + * Copyright (C) 2026 Linaro Limited
>>>> + * Author: Neil Armstrong <neil.armstrong@linaro.org>
>>>> + */
> 
>>> Please make the entire comment block a C++ one so things look more
>>> intentional.
> 
>> Sure, converted into:
>> + * Copyright (C) 2026 Linaro Limited (Neil Armstrong <neil.armstrong@linaro.org>)
> 
> That's not the issue - that's not converting into a C++ comment.

Oh right sorry I was confused, and I'm still very confused, sure I'll convert it
to C++ comment block even if I don't fully understand the rationale about it and
how does this look more intentional.

Do you want me to also switch _all_ comments to C++ style ?

Neil
