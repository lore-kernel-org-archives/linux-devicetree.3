Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFDA3ED12C
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078966; cv=none; b=Fup4XTP02qwzTAukvxCR6rjkCn3VJ1b/RH/8YBhUiWZYLDV96I9yRWgLa9EHpGt/5LEZvAqUTpK6iCUHo1z5rvRyu5/4nweiFlMUJEKswoRdHrQ/tu6FtUV3ALD1IGyt/anHl/DDGehrqnRvLYNAFw2u/7pkablgo7df86Imydk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078966; c=relaxed/simple;
	bh=LrLN8k3RPHBABlBVoaMAXb2UJHFW+dwRp9U0ou8W6dI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o+M5y0Np1TQn/2WjTs4yng6uDky8ZnNzKTmgVy0vQb6csPZvjIXUQxN6y+oS1i4savyDRFh4moEJMg2+ZQ2mjlIPkUxodliwz4EzWWERN8XlPkSidL/AyfVrfTDCZYikn9MrZsII9u+PkoOVBt3+HNXGa3lKwmYUNjSIf58ltrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L4DfZiNV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L4DfZiNV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44a786a9a35so3653543f8f.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778078959; x=1778683759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArIiOc5BIENDbFYudfD+oY6YZVBcrif0Q7lUYU811cI=;
        b=L4DfZiNVdMrxOdFjkXAI9LTnl1gPsF5PUHSKIGzjGZuvyanU8r7ozuOocCcQSIfrww
         Ms92CWd+L43wsYtmrbHfUc7Ef6RPsXu2yHJOVt1oh+UXc+LSjWsMUxdOIgfCGlm/E807
         IcQPHvDANa4yQSQj0eXF8VNYHF/I/jg9+HqO9KzxZysgZ67R1HwM31ZaUk0a/+vNDUyj
         iXZNpp+Ixy0Xi7xLe7hLZKqxaItbjludQIWSPWUAq28rbJ5ZE2Nbsfwv8UYQasNa89fY
         uOGlaFzy2oT9XKbo6ZJ+bechkVp9MHejINqbY/7Z58DZ34esU6rkFCtJflOUoX9G+NYl
         Jqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078959; x=1778683759;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArIiOc5BIENDbFYudfD+oY6YZVBcrif0Q7lUYU811cI=;
        b=YYLwSMOPZQ8mUB7aWhRRKGTqITh8Xo66uh0KF9Hkeq5e7ATqY7JBjzXL8EbahDsrbQ
         1RQmWgYbIKgGxtJwt6NAH/cqP9bpG6iDTdceRHhCtSfFGk+rOs05/dhirloSrdxtx+1R
         tw10RCqUgNvTwe3i8OkWfowmP/5n2Pbntrn1B2GDOhmJcSPFcdF4qAGHpSqcRJMNyfxW
         akQd7v9m8Vzy3s5eaTnRpSPxLLXoZuAK+VFhGjRXslwPeLKYq7WYHcKVF4aNJBL6DrLh
         6BZjsb7XqPALGHApPziJ24enAkXfLKzWOFcSRBdvx9+Zvy18g/PtEqmMQlgIHjebF1HF
         KbVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iC3SW9wZ64Huq3lPUQJHncqRWVkD4RCdeeKcxVd41M/qQIaHH+dur7beroWllqeKx0h30UfNR06Jl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/o1yQqUXGRxfhW8mmYiZhiHgzEvukiB92dfe6G+a8MKomaqeO
	SGwOCzIFTA2+ehycAZuRqMt3L1GehGmlb92IIVRTnlzkRebCAm3jEzgefbgIrs7X7R4=
X-Gm-Gg: AeBDieuA5+LiSC0bRTP0mShafLshxMYnrL07NsUg2+4hVZcZIiE0fbkZr6UwoVTSh2J
	sIidutLcSA2hvsTN+WkTDAGtbgOOqv/gtlpMii7KwVLQ4m97HMmUQ40BhuLU15PWxDB+7aLkmd+
	sXLTj8oy1viGffDepRFPAHSxlxzsZISSprqPW8wZ+opG/IN77Gp9oAgPys/1YBS+zyc9dhiM00J
	VCFQ6N31WKJONqnKHL0DYEVNrnP4VmRu0IJHGtzBD3W/owgk9gH0BYy6Liu7IlPwrNcTjjgt55D
	3EEShpLiPJDEvzEXSkbBRmr62M45/ng/jz/1e3hzLF5Jt9eWtXOJKQGwZLUs18YCBWsCSLj9jjM
	kSHVGuWgCa8UpL2WbW4rn+3GlJlQmpxPMRfPHYeaP6W3j6BJYrkIWAYVdG1ykMOCCZDRULAz5Xb
	GWesEJmQipwgfYTTv8bCtfg5kwa2k2rhLQrzS9HrSwxHydRJuvp5PwmjXzP9cCjQJl7N8v0zwaW
	KXecWwMY/7DB263Rw==
X-Received: by 2002:a05:6000:144b:b0:446:db72:e8ec with SMTP id ffacd0b85a97d-4515ce1c55fmr6486902f8f.23.1778078958886;
        Wed, 06 May 2026 07:49:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960973sm12936695f8f.30.2026.05.06.07.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:49:18 -0700 (PDT)
Message-ID: <2c913dd0-d49f-40c0-8951-ea8087d09c24@linaro.org>
Date: Wed, 6 May 2026 16:49:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 03/16] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 devicetree@vger.kernel.org
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <20260428-rockchip-usbdp-cleanup-v4-3-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-3-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 18:13, Sebastian Reichel wrote:
> When a mode change is required rk_udphy_power_on() disables
> the clocks and then calls rk_udphy_setup(), which then enables
> all the clocks again before continuing with rk_udphy_init().
> 
> Considering that rk_udphy_init() does assert the reset lines,
> re-enabling the clocks is just delaying things. Avoid it by
> directly calling rk_udphy_init().
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 744cc7c642f4..98562a888b42 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1012,8 +1012,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
>   		if (udphy->mode == UDPHY_MODE_DP)
>   			rk_udphy_u3_port_disable(udphy, true);
>   
> -		rk_udphy_disable(udphy);
> -		ret = rk_udphy_setup(udphy);
> +		ret = rk_udphy_init(udphy);
>   		if (ret)
>   			return ret;
>   	}
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
