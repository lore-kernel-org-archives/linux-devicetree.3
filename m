Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E81A3B19A5
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961457; cv=none; b=oZ/3m15vrQHOJzbgHh05yT2c/TSB5rTJamduJ9uFdFBY1SNydXQL1PwTTJUqjUoV/rGXTHMqXrozvPhxlKxXfbjw6dJo+OsNq3wX2UX7b+oPI/x0E/6q2eZUH9Ig0XrWOyfUsyMQN5PQVaPcAr7PRtgSGKIwOFWdZxjs/aF8ysA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961457; c=relaxed/simple;
	bh=WYNLpKYQdp0qMDj6rWfE/UmRh30bStsXdedOXum8yc8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=J2TamNf/UvYvAOAbIeHi1ue1TBj/rPaI8lQkdmi/xRSlghvNdOXaVQUK7nHTORH7UbnfH03HHJ9hXxuPAq3jNehxDBbCwAVX0Y0kpgpvzyl9xqK2dCZzL7bR2pMKubuKNAK/G2qMHGqHTHskGceovEVGI6xK/hVgWjwuDJF7wCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jwa0oTmT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jwa0oTmT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49048e043e5so48963665e9.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779961454; x=1780566254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2c6drxjHyA0VWHYH3QAN85Fkm3qck6usnIDM8M3U6M=;
        b=jwa0oTmTm6f2u3+6GjCYV3MrZqRCqe/iwLcZwSTrdFDpWpSOM+YDX+IZ+x4KudYeqQ
         lcvDnhbo/krOF36DaJYDn4owwRKSDkL1Jqq5S2ZXFkXl1pl2fDs8KCK0TG+mUZ/s+4CN
         BU+n93VI+vn/HoYJHCfnUDuK8MlE8vaFL8SJmFsxXFANsCnnD9nCJtVJPoRk8/R/Mzk5
         McwrG48x5wlI3zHPWc3mG5HndBEHbJabg6VureurluNiAnwEvVigRBlCowY+1dgS8nQG
         dV63s5yeXE6TYZS8pz87i4AWDLOPrqwrGs0Bkb8O8WyqYlO5tv+ss+hDCGoTw4VE9aCb
         7eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779961454; x=1780566254;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2c6drxjHyA0VWHYH3QAN85Fkm3qck6usnIDM8M3U6M=;
        b=ar0N3I84/OcPNGUch9hIYxdc8XkvLYIrhhMlN2n/vB+lB73/Cg5oBrV9vfjkvdf+/R
         BUkHO6iTlO9farlhIIwCX+gei/CfBjGB57nPUtBYJfHtvHsAphCm489VuCVqsXzlJ24h
         7DXpPcMLzcQ7I2PvmHYk04a+KjEunIPXZIg4lhjb3x5Ck+mraL3VEntqXCWzEhcAqbJd
         dd0Xs9AESn28lHxsAU0VsB+zG13logC0aexFoPIiSqiMo+Ru6PLLDKgAdiXWJZXIieQU
         wk+W0g6hb7Xnu+z6lict3fK7xvaepHvf0/ju2a9m738nmE4F8XNVPO24Zv/Tls45Gdrp
         EdOA==
X-Forwarded-Encrypted: i=1; AFNElJ+LbEQ8Hux1TxxUBtNsbVqXOYkk3Rjuub+w7lEySiz/NGn22Tc48u+T51ww5dERhgRKsKyVXKrRlm/w@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzgp2BSCgoD+qsnVV1XeVQdCPdMYh0o68dbn6C3DMqYp2XWD0K
	EdOOg2jnBVi4Y89tlbTgWdKnMJhPmYJzlRsLT28bWoSDP0m+1n5Yo2bNjBB/+WE01EDjQgQWb6V
	oGIGW
X-Gm-Gg: Acq92OESHqB6vs9Rfyec6a0GwPXPr5EHuoAFfNbyuW2NipSfvPDHwRAgQgzRzFAr2Ia
	6YbK52ffqHSGG6uvjujVucZzzDyT5mAsb4MpjraKWXWMV31lGwhcMKZ0JyJ+o+aMbtCU3TtxPre
	6sqEEGWOySzAJ96bYFVVPEhSbV7WVevSHw7q2rETdKo19TLDGNG+ZnDZjaXpP8SEJzwfGChXr41
	vZDXB9HmLxap7KUlKwpVv+imgZrpfB0kARBXL1YM2eZwK0GRDIFSOOM0qxVishws1VYs14kMATx
	a0ThMF7JmZ3JL9/2Enf7GdSI4DHjLGqxmeA1ZX2E+KSulopmUa2zO9QuI0aCnGWjD3RXF7kRYN+
	E8puI47iLEcAkRne6dFfpEETqdD6RqYPp/gtrzjQ2NtQXsEutRWnva4hw1rS3M+pYsiTieM3yNn
	tcNJGxJlw9MENrMSy5A+zjwa+clp20F0ysfQ2Cn+oMrj8=
X-Received: by 2002:a05:600c:8217:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-49051e9e233mr358289395e9.27.1779961454350;
        Thu, 28 May 2026 02:44:14 -0700 (PDT)
Received: from [172.20.10.2] ([37.167.60.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb549addsm12108102f8f.5.2026.05.28.02.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 02:44:13 -0700 (PDT)
Message-ID: <3d544bf6-4e17-4ae2-b41d-cb8df7a776c8@linaro.org>
Date: Thu, 28 May 2026 11:44:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] arm64: qcom: sm8650: misc enhancements
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
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
In-Reply-To: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bjorn,

On 4/20/26 21:26, Neil Armstrong wrote:
> Misc enhancements for the SM8650 platform:
> - update the cpus capacity-dmips-mhz
> - add the CPU cache sizes
> - correct the soundwire ports
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Add review tag
> - Fix l2 cache size to 512KiB
> - Link to v1: https://patch.msgid.link/20260128-topic-sm8650-upstream-cpu-props-v1-0-9fbb5efe7f07@linaro.org
> 
> ---
> Neil Armstrong (3):
>        arm64: dts: qcom: sm8650: update the cpus capacity-dmips-mhz
>        arm64: dts: qcom: sm8650: add CPU cache size properties
>        arm64: dts: qcom: sm8650: fix soundwire ports properties
> 
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 110 ++++++++++++++++++++++++++---------
>   1 file changed, 83 insertions(+), 27 deletions(-)
> ---
> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
> change-id: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 

Why didn't you pick those changes ?

Thanks,
Neil
