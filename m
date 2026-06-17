Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8113AFCFF
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681435; cv=none; b=tkd/AP2/iZ67CDlO1rSVNvNIkRmWFXbIqXZPl4CJjP4ttUE0lgPIDmiTmIRAI2YPirpE7pnOn4Xk5bQYbNjKxWeKgImqoo+bu1/6tXSO1LooAmAj5Ib9sj4e293JjM+dziTmoHn+qzLhC34o+W5vV4fChGxCLNK8LhkLlCzYSEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681435; c=relaxed/simple;
	bh=ns641rOo4SmvQB02QITlRXBe7Y9sqH5VdSzYmVFmu7g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r2D++qRMnPULsHjJRjnv3EzHl21qHg279onNjApgIjFbg2bPfkApToXc7V/WQcARc8poDRz72oAJxyCwBPEeY/Na+scPYCxm8tq7jHa4g8wUcfD3zhTGOk/rGTF2OO35+n3a7pSlf3xQWHW4acMdvKJ234FcZJ4dXkMdOQBoSpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UXHSNJoM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXHSNJoM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4905529b933so53567795e9.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781681432; x=1782286232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1Eht0yqmtyjKLK+ckWvK3e4AnkyB7fNvSVWTQiIHbk=;
        b=UXHSNJoMvc7kVKtewuCnr7I7JVGuMUWe6TVC5zX2D4e9btoGMcbLCdeDyrb/lOQNzn
         YUpiKjplMVzoyR6eJ6gVxcgPlUCykuIXoGQo783E6cptj4MZXGBRCutjS+nGO8Ctc2RZ
         vGMNo2HyvqVmO/MCkLq+m2tR95DpDJWzD/oIHVt11iqk9EK9EYVbgOhqd3tIvnPpy5Aq
         wioJAdCXHe2zMiapsHJIwM+4igHS+cqNFkT54WomZDhIydHsr3RgcjzYrJ8eBiI2T/Dw
         Tl8B3Nj2vAYf4rd6Re8sj7AHJ2UBwTK0fnQ9oIIHg1aah4itxJfJFWzFDl0yZ87vfDL9
         DnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681432; x=1782286232;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1Eht0yqmtyjKLK+ckWvK3e4AnkyB7fNvSVWTQiIHbk=;
        b=oQzR/3RqT+oAc2QLy6TtJTA2b0tF7z7n1q7SvQls7c2TvxdtpiWFGBdSfho2sGF3sV
         bQNHN7iYtKk0kXYuFUMiocNdrZgAzBXiiX0tu5RNy3h9DddApZ5AeHopoVq74b28GO45
         qLC9tNHwuKroHva/EtItA8kKK6can1HZVu3oHgb+KbQBSq3tMd/lR+my1ZOmF1plnfNA
         VpSbVVCAcyb+JtrLmfSxIHP/hAuY6Mb1T+sbldu5Vjpdq04n7QD2h6q6m6pyZB14KVm3
         r1b2rPnYeMQszNx0f5wg8NTSpTPp9geryqhwCN2koSkgg4BVCXKKRdXmuIUAcopdxOyy
         pj2g==
X-Gm-Message-State: AOJu0YwWQCKT2ANdF5cxPElJyZjN0oKT078jwd7zCleVWymN3y32xWaF
	j/x5H3Q7wpmEC1icYZRX/TXzRh4bmOPI9y/ShjH03Yb5nWGAB8oU0sFWpvRgwxR/+eI=
X-Gm-Gg: Acq92OEAiWJRtYWPMH7Pvkx0wKDz/5fMJtuW1RJJiK7xuuwN48MpxPchQrwzfhgyBU/
	NuYmi7JsvsTgmkcsanSP9CZCC5boaQTOXcGru6Jbs7nDuJIurTQZbiIA8BGEay+4++FA69FhTID
	/mGlUqVApujRmyn/u6cpNyTBxqYzOh9aA8LCiuvZLbeGcMmp7pZkI9dqN1bX1ERoPzLiGKmbNU5
	9HY7V3NSc7HJF1qEnYWmI2fbqeu6C4+d5OxgKK8cTzZ1zuq5zeIt0Or1RcWhUl2e473W+2oqGbr
	gF0PD4o7nwoP9YMOgWMUaaAQu42flFiEX+rPNbXTkJMI5gFhSfG8ehRld5jw95KGe3HycKnNcNF
	UA4GvdTa834Yu1p5mNW1z4zTc58j01qn6gt9Tz6o5jzJ01iPbhUANWvgAOoQ25wniuWalW6juov
	EFnG1c+uz6LY8s5w1ZiZTXEw==
X-Received: by 2002:a05:600c:19cb:b0:490:bb45:79f0 with SMTP id 5b1f17b1804b1-492333ba306mr44593555e9.3.1781681431573;
        Wed, 17 Jun 2026 00:30:31 -0700 (PDT)
Received: from [10.12.4.106] ([212.133.41.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm170120445e9.5.2026.06.17.00.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:30:31 -0700 (PDT)
Message-ID: <915e4524-d407-4b4b-9e61-e4a2274a6f6b@linaro.org>
Date: Wed, 17 Jun 2026 09:30:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: meson-axg-s400: Enable
 pcie_phy
To: Jun Yan <jerrysteve1101@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
 <20260617071604.635627-5-jerrysteve1101@gmail.com>
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
In-Reply-To: <20260617071604.635627-5-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/26 09:15, Jun Yan wrote:
> The meson-axg dtsi now disables pcie_phy by default, so enable it
> for the s400 board to support PCIe functionality.
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> index 285c6ac1dd61..7ba249cc3d56 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> @@ -448,6 +448,10 @@ &pcieB {
>   	status = "okay";
>   };
>   
> +&pcie_phy {
> +	status = "okay";
> +};
> +
>   &pwm_ab {
>   	status = "okay";
>   	pinctrl-0 = <&pwm_a_x20_pins>;

Please squash this one with the previous patch

Thanks,
Neil
