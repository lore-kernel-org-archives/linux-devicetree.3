Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396C0472772
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047441; cv=none; b=epSWgMzyIF1Lu1CroL4f5ykOcncxS5kkfaGaiMMtb0lr/6cPwBES5tIVErdx+kEw+hug+iMcOeji8IqE3AuBmwK+RVvFt+hgb4XKCrRP+ZDTUAcfgvf2v8blLvxNGKYK7Ol797vHpFOndeGJ3nkl1/tbJMUK1XqzbYuKUWLQjcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047441; c=relaxed/simple;
	bh=lfcTX4TL2A22VsA7xIY+rPkefGCSN06tu5AGdvEz78Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RohdBlfRJvlHisIENKtWiZZ/mVuQsfMqBlBW8OfwTGZ9wkmBcxcPoO2vlyXXcQa9t/omJES/7aNFdYfC03PUZDxp1q/alHEuFAAjLHMevzjKo1ySOfVbu1tcVRaCDsg2ahWvutDG6eJBRNyKVMtK+FfXDQlEKyMyWAHn1AITJqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yo/5mabD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yo/5mabD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso5103667f8f.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789047438; x=1789652238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MV7aOFJWyf4fVQJnUJPY31C9vQENrTENQEYoiqtHwng=;
        b=Yo/5mabD1Z2s3VdL128GtIqoAoDG1XV60VvulKWLvS4wwo0z+Ekr7ylFTr8vVsWJ6N
         18UaNvdT6D1Tq8m0lkb3vsMecxvEsBmsJ77kAVwZo8Tw8ko/pB/5q1jjurWLvHBleqrC
         Sx0jR8inAcSXRMeiB88b0HvHIgcGkwaId6AF0FrJeLGPyh+t+zpMa2olPX80z/8tkkAA
         pdswLcAMPd1SMfSIlwUwq2i3J4mPhJQynvBokKka4RWQ/jR03wi/Oh4TaDk75s4HYLjy
         DYQ89pk5vKaCWkidUl3pkHLLuQldV+3cdbtPNENb+6+gQsnFiFSvexpSpo5I/Yavqxuw
         ujmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047438; x=1789652238;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MV7aOFJWyf4fVQJnUJPY31C9vQENrTENQEYoiqtHwng=;
        b=Smb0CZt7NREZ1GKgFIZyyNJt21DjEnJ+aZZQJ0O3YxrjDqgXmwrtjSfZkEI9phTGP+
         xxfYJ4r7z7+jH4RaNXpenokfiap7KaJgQI4d6Ucfb45xhTOdi9AfJ9Wla4icvD/p8c0U
         ppYPMDwm4K6jIGiDMgIFfo7/h9zLp4U+XX1Gkl/r3ejWV+RzfMyfWtJH2sR62TFWxSXk
         usOfzBGCiafsx0zhk2TWivg5yDjwEciEpoTgUlr2OFnVQdqhFxLxpVOriFFcmVKsXFui
         IJlGByHlMacWPtI36SSND/j0/oES8+qr3+RmYL510nF5GaE7+fGfpn9p6hk+lg6K7ZPQ
         0+Vw==
X-Forwarded-Encrypted: i=1; AKwUvByHjWZ6bY/AgXVUPPjPDJA4BRX21mS+Gtesfcv7SUIUiOR/QQipHFzkWi0ND6clYLYLROUOIwPYrJ6B@vger.kernel.org
X-Gm-Message-State: AFuF++kGZnDp1f0V4TONc/coaRbFHjuGofE6w4Agz37AQ5n/JVfOdCUB
	CyRnEUiFEMf7R4kgCcrd2G8C8pB4zEmQRRLhbQXcSZNaL3ZTrZ6eb7YdcKKxE6ShG1I=
X-Gm-Gg: AYBFou3z8XIpsr6/67g79qo2Sbk4asR84Yr4ME3WdVbH61A0HoO5tZbF3f4++zUQlxk
	7nZQe5+DCJy2vs0clt8R3trCVe0kR+Nn5YBw3i8f3WVscUZ0pWsXa8nV/Z4UO2UU47fj7sKhWaY
	tls+n6KCxv+1O/FW547ycY+1kixgZ1/Ykm7NMx5PCvvxyRnu7kCkNJLNaHr2iTnZW5o3NI6D37G
	ttbnvs+VO6Zue1/iN92OhnYXoFsVPUcyOxkF+1cvFnXOxTbs3N/C6R1trzUallxX8isrqmbAdDB
	Y0dSl8kwHLRsdZvvh9CMjWDHxRhcDjfMWWRWCi/U5VxtjOf0Tzi+hsjvKA9qu4EcE86H7DkvAE0
	/kREI9gg5KpT3Os7ub98f/eZpdvrmGgq9VmXuLkCU0OUZjbpmAX/xcOw7tuRBHezKIuYGFcIign
	u5GgIJabqlobaH5jwDYJ7ns5+JwAJm2E0LUIl3s+p+AOItusE/uWb991GeEK7BU4TPPJkim22YO
	HvjWn5Vq2xgYvumBS2URoWVNh+jk/t6oo7lXUa3Q8gWdlUJqhAQyQebWP9c+pV+lQ==
X-Received: by 2002:a05:6000:22c8:b0:485:8fe2:ed95 with SMTP id ffacd0b85a97d-4858fe2ef52mr36331221f8f.18.1789047438281;
        Thu, 10 Sep 2026 06:37:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:edd1:1b07:ea07:35f2? ([2a01:e0a:106d:1080:edd1:1b07:ea07:35f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485aa2c9acasm15339035f8f.36.2026.09.10.06.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:37:17 -0700 (PDT)
Message-ID: <6da75e1e-674f-4b4a-8070-ed6ea0d183f4@linaro.org>
Date: Thu, 10 Sep 2026 15:37:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 29/34] arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-29-90a252ddbbfa@oss.qualcomm.com>
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
In-Reply-To: <20260910-root_port-v1-29-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 15:29, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0, allowing board-level overrides. Rename perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
> 
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
