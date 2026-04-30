Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1455239E6E4
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533369; cv=none; b=tbskEJpxa1mQoFqTgOMqjDsh4P8Rlqsfb3lGFXHZ1864qeqmRpyStOvqHZo7iQHlbEbCAEjO3a3n5McGd/nV6tik2pE6j1tMjt2gZz9RMEjtDXUJfgK94hJGk6N1IMAJ3Xl8TaJ7rnHRHio2gRh4n5+ERRW2+SBsTrBvxeb1lXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533369; c=relaxed/simple;
	bh=8y5IjJzM/6XuEQyFMJA+yn2DH9j5uTrLw1mp2yRYfhQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=giLOX11pehmmwOYLjNyaMFdAwuQIbiW/Nr0d4iDcwn7jqisXuB3iQbzrQLQJUHzIV+wa7vzXQwm9Bc8Tl5xrAqQz5CGcD1oDUy22Zx7ygTEUFTpwRApb5PMxZM61AOgGN01SqQ3LvdPzfmc8+tLDPFFerqkz9t2BiLOlqgHMPe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=srv2m/st; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="srv2m/st"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891f625344so5918075e9.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 00:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777533366; x=1778138166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOuJHF/wE9ZTofIpwa25PjNSbv38gjdXsd0cuVP+tXY=;
        b=srv2m/stjz1EFW/o9le1f/2/I8sfyz3GTefFT51akAnwwuMo8AfBkWXY4uPW7FEGye
         r5mDqIjwHW/j443sWp1Dz6lLgBsGxgQ8X9S9qUYvhlFp4AUhArpV3XJMEtpifM1MAjRP
         Q4RV2miGZ4CDDluj0US2F91h+29U7U2zrvQVcZ0gzEVXLYQPPGKu7CWjoiwqImfAH9cQ
         kjDZylTKQ1EImgJJW10UqcW237veOHOpaVLgs78mj6xs8jZHLSUXYxUVqKsM99OlYApH
         RQjT8/s5HCi8a8iv4FylC+PjFgc02OSbfDx04pt/ZFEH/42ZyUlwCLP2SYEJi6yhYaIS
         zxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533366; x=1778138166;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOuJHF/wE9ZTofIpwa25PjNSbv38gjdXsd0cuVP+tXY=;
        b=bFzOvAZlsyGNVsxPYIBJCicFjMqX2wOjluQL7ut5IVnHLbR0K6odD0aiel7zLn6Qpi
         EWMOR2agczN2B1JQXcFbvy5EZDMaxb4RpXXjSzAE+wrZ6g6P0yGYo0CTiX8lNrRVh0Va
         jZIbTGapUxT11mOAOa1TP/u9AbNihi8BJ5MvgtT1kOTlHz0Os0PiJmwTTyVfOfHxehUB
         rnh6JtPe0IOupPqdUPu44VtZrmwlWkElMm3C/WuprXfKD2GmkbixoRD0ME4LbHY1elt7
         x9AcLzk/5ehdINZCof+gmRLIeGf2/ZOt2g1aax2xShB3GRH7/s0GoulMbXfVxTOmC4ug
         1bCg==
X-Forwarded-Encrypted: i=1; AFNElJ/WrPdh/E366GDgqay7akO5n0laZkIJHh0ekBjuMfvADRE6v0MMcs7s8aecj2WkWStF9geWnOsfifX+@vger.kernel.org
X-Gm-Message-State: AOJu0YwIHlRC2WKE/EMb5YgvLZjeAbCMuTxd4La7/QLtj+vtyLLJ/OoO
	wvuZRVMPrKW+HAdpyGrJSE0TS6R82w7a7cwKMXQXOa2kpkiXZmq5eRIeoWXmN6RzF5M=
X-Gm-Gg: AeBDiesxdNs7bwy9ayWz6d9hHWgT3vWhfg2vEyLX+PBDMfu8Dpz10+aXmkkOn7Rdsyl
	JisdYbxsn5vGyNGYIvAXHrBJ70VfMNpmK7Tp2I3zjQ4wuW1QduVHpOUYpnDtxU6x2VIHaNhKFT0
	QKwKCK2dPzjF3Qn6+DWuJlGff8yQiyr6aICDnVwC0j64+6or1est/hqnBAKMnQ+XzQJm/+cvaZm
	1T8bV3g7H4MTMLD5AXa1B9gybKPxVDxJ6Kw+MhEvJNueAc7YrFzc8AseHdvg0p15lqiLyATYmSB
	kXhnGLS8ya0IypRmQFd6aZETAh+8PYpo6PxEfTYjD5t7nmcxW94YxGQyBERsVr00AljYJl3ii8B
	xabrDwZAmZk2oIYaGEASDGQnQBfs1aRSkmg2SQvq/gog/PP5NZwKV6cDCL+Mxdu6cfJp3GRtBqh
	aR/KSVYde13aEvIRQUGYSV3V4Mnc/QSSEaSqETWgdYsQvhLYKvN+ceFr8OSElfyPc6tJANCGFJb
	eonsJWrXTzft20PKg==
X-Received: by 2002:a05:600c:548d:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48a85e17294mr18959865e9.1.1777533366279;
        Thu, 30 Apr 2026 00:16:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6dcc:3980:fe87:c6ae? ([2a01:e0a:106d:1080:6dcc:3980:fe87:c6ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm52768295e9.11.2026.04.30.00.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:16:05 -0700 (PDT)
Message-ID: <21657cf5-425c-4b29-927d-6e305e5ebf0a@linaro.org>
Date: Thu, 30 Apr 2026 09:16:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] regulator: add SGM3804 Dual Output driver
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-2-1d8dc7620256@linaro.org>
 <afFS3W5hokXy3T7x@sirena.co.uk>
 <7d2fd0d7-2ac2-43d8-be5c-4f9fcd7908bb@linaro.org>
 <afKrH4fdv1jXxLgk@sirena.co.uk>
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
In-Reply-To: <afKrH4fdv1jXxLgk@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/26 03:06, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 10:05:33AM +0200, Neil Armstrong wrote:
>> On 4/29/26 02:37, Mark Brown wrote:
>>> On Tue, Apr 28, 2026 at 03:52:06PM +0200, Neil Armstrong wrote:
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
>>> Please make the entire comment a C++ one so things look more
>>> intentional.  The authorship overall appears a bit confused?
> 
>> Sorry, what's confusing here ?
> 
> At various times both you and Kancy Joe are listed as authors of the
> driver, but rarely both of you simulataneously.  I can't tell what your
> roles were here.

Oh yes so I'll add my MODULE_AUTHOR() tag aswell then

Neil
