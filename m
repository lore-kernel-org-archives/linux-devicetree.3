Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DDE39C621
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121684; cv=none; b=ApnHzw7auADkrfkIBpHxv4XBocyX6zSl9KNjk2xHEz4vcHSXiTF7HSo0f3+oYc/G0eVrsm8QR8UFnxFdC9yRi8TOCow0iszCD2RKjQCPCh/u67F5OlyvJiBtYCsqvAoFjMSuh/9VVQAy9DEnxm5rSNJJG5tSWzDXjR7qVjVyGXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121684; c=relaxed/simple;
	bh=VYinWnQae4+B7P9giZn89VNsIC55c8o48r0FuxCS1fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJKNno/gTfHZT9Lb4sT4JQs+YFxjq97S7jDco160yYNPYxpLAtFJUZj6BuyvDIhaTwTysKIedGKSq6PteA1cJKphwnI3plnJ4LnRRLOZiMRVpG+FL6XgnectNeAaAb6m1wC77o3pGcymoOaXm0R5YU07gYM/3rc9ErP7qtdtxDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GDpfwImt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GDpfwImt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso1873458f8f.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782121681; x=1782726481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePKCrCfHq5Y2KE2FBQXmlLc3ZGDked2vfFdF5rmVAmI=;
        b=GDpfwImt5qjA5n3wEDm9T3ARzIekakf42LXNbdSNZ1uBA8gIvMhuhxinKpjSxHuBLC
         cZ6X+AhUw1/f8tu4zHdfrI7XupYrB0TLONV/zq4O2tiPoEsXXpMI4dGgGEgNYLdKcQ/m
         SsR5SQb5mZsEsXW7WyjtfijyYC+MzIgZA5k3IzT9S14ivdAoSBfUeSvLCr6Jxyjq4php
         O0kq/MKLlWk42ibyQSA7f8L01nZXTRcxtdR9x3UvqUdYSJNC2IhKuMI8X5CP4CYQIGmW
         TCidNEu24mV76Ni1Tdi51joJtbYH1oDHIfSu1mStySQHHv7qzp1k6R1lihOsJsjPZ9zP
         z+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121681; x=1782726481;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePKCrCfHq5Y2KE2FBQXmlLc3ZGDked2vfFdF5rmVAmI=;
        b=DsL7XFSZ+E/iywq4BpoQqit5u/w1bdteLKsLytUxryP/kiJPDTNApD9OJa/cAtXHEM
         ZXAyIT2qgkZ0kp2BCIWxC2J4ScpeGBBkSEuVScoXIj4my/K6EEwEwfZcNXqZlK6uki3s
         9PE2wysMG8/C9YzN8CXIBrHPCxnk+qSiL/LFX3rdUuD5IGg47w1YIUz6y3YfhqmFzIfx
         fjDfVkeuiAN7+/F5/CtmH73PyO8QyhX7w0rOXHmoRPLCWmLIYxk8F4Tdx24T2PVl1pJb
         ZHdXUFLXpGaNkjq1wuXjVfbxCbCdGkrDu3+xIlvMJJLKiPxeMsEGgw1nlJa/CJtFpoS9
         M5Gg==
X-Forwarded-Encrypted: i=1; AFNElJ/2rb5O70DxqhUVqfVH4JhukGJEWMNcztG5QhckJda6FkUPAVy37211ITHhHXS4qY4+K1cqR0mINCX4@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjfLXtv52cWYGBa8nIsQw3ao2/UIik++gozfHa34AE8PjH52I
	x9Bqf+0rT9KY/+uTVH15w6Z4x5zc0PSd389UMALHovSV0KPsMev6jq1vAV2w9Fa0ZF4=
X-Gm-Gg: AfdE7cmhE/2jaNsXQwYYP8z7sHcbEHZY1YbHuRB7fi0/HH7x+rgo2IxRlDcKOI8Pf6q
	5uWuu09gyKpjzJ/Itsz+mAsse5pQ1JI1dT57uIMFrXdx/zQ5vJja+Y5pMFNUT8bPw1Twt5lyTew
	5WYxV89YjVBah7dGcHo741OjnYi4PfjuCAE0ElEOdqPkCC4oEqsgLWD4roBU1ET17wQ0Lo6NZaS
	4OFZmwHUlBCVsyU4bfdKxJAJH/l81R6AHXzKPr7riNMPQYjMXzJ6ncIsAZlNck/jq8sGloslFtV
	Gc6K+r3MfBKJ2nmgLdOCWus9NCnbmwsCYN2QX8iGGdoAfUXOQxBFb8NuOP7exBVNMWXFRfPQhwa
	MYKSY2vQB2+fbt2+Q1SHiOmRN3mbtxPACAUh4QVMdraL6dWKlT795EOjxdKjC+hp/qIfFSvki3e
	uSvNGHdwKw30+D9YKCIojBHkjy0NHTKJ9ra99yrhLEWdn9a87j5f4iWtsT285RhkAClgrgl0U4y
	QHG
X-Received: by 2002:a05:600c:3b20:b0:490:e196:e8df with SMTP id 5b1f17b1804b1-4923f5730cemr270851925e9.23.1782121680570;
        Mon, 22 Jun 2026 02:48:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9f24:cdc:bb10:65f9? ([2a01:e0a:106d:1080:9f24:cdc:bb10:65f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221da1sm24089038f8f.36.2026.06.22.02.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:48:00 -0700 (PDT)
Message-ID: <5686c654-8627-422d-8726-aafe63c2dfe2@linaro.org>
Date: Mon, 22 Jun 2026 11:47:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: install DT overlays via dtbs_install
To: Vishwas Udupa <vishwas.udupa@oss.qualcomm.com>, krzk@kernel.org
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 kbajaj@qti.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, robh@kernel.org, snb@qti.qualcomm.com,
 vudupa@qti.qualcomm.com
References: <0f045b88-94fc-46b5-8a49-8a53235fc8fc@kernel.org>
 <20260615162739.787779-1-vishwas.udupa@oss.qualcomm.com>
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
In-Reply-To: <20260615162739.787779-1-vishwas.udupa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vishwas or Claude ?

On 6/15/26 18:27, Vishwas Udupa wrote:
> EL2 DTBOs are used at build time to construct DTBs corresponding to
> an EL2 (hypervisor-enabled) boot configuration. These DTBs are included in
> distributions [1] as complete boot configurations (e.g. EL1 and EL2).
> 
> The EL2 configuration is not enabled by default and is typically selected
> after the initial boot by updating a UEFI runtime variable from userspace.
> Once set, firmware selects the prebuilt EL2 DTB on subsequent boots.
> 
> Although EL2 DTBOs are not used directly at runtime during initial boot,
> they are required to generate and package the EL2 DTBs in the image so that
> firmware can switch to EL2 when the configuration variable is enabled. Hence, el2 dtbo's
> need to be retained.
> 
> 1: https://github.com/qualcomm-linux/qcom-dtb-metadata/blob/main/qcom-next-fitimage.its#L273

Pretty sure we can directly ask the question to an AI assistant ourselves,
and I'm rather sure Krzysztof which is maintaining and reviewing DT for years doesn't
need a lesson from Claude or any AI assistant you use to assist you.

Neil
