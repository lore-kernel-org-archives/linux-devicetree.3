Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072B048A2CE
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078983; cv=none; b=RrweuqJt8Ag6c5dI680NqdjakESepRnKMM8AvUVjfYfBgXIP4+Wb91zF/HNMzcBityEg+xTruXSD14QCr3vLMolc90CHCITZYHmAypqVkiBDeCf/cFSP7bnLF9/4kRoOxFoxzRjgilI7MAZlnBG2osWGntumoR+i3+X4V0EwX48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078983; c=relaxed/simple;
	bh=E4j/5JIxs2RFw0dHYZvGZu3nb78ZTFUG1m2FapdPN/8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XnQy8c05KHHNEkx7f65gohT3L78crMPd8p9TWshX+bqBkAIy/cM5428urz+apXQzcvTv2lZxomlUxf2TfSHzecrMjd51489HtsS/lwFoxm3iXF05NX0qPPIABKvp1NnGNvv3JGJXCaqMkZHlF3SrKEJFiuK5x/2IOXa0fTkiDG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ra7swc/T; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ra7swc/T"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a74032ff8so3708673f8f.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778078977; x=1778683777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgbuIPvwGTDZ1vH1DcLJwAkJi5BHMTFvMXCyADYeRKI=;
        b=Ra7swc/TdMCBet5b5E26NIoZpFvYs+cf9u03RjKhFYltjZkFMPsIblfjPPNpsyLC/5
         NZXVgLTMfgu+qvfJDeuIAWuewpuvjLRCIwybgBD3MFCmli0ePqwDaPkX/rjbnLBR2NE1
         IdvwFn7htzHqcnDGFPhUwb5ExQMKRiInQ2lKyobmTUYBOa5+6QjzZjY3fY6qENGlS8pA
         S3CvCW13qcPbUGLsaD9R6+LyslHLpeaFAehyXQIBIFnpOPN+MnoeUlFj7LjnhBfoxYS/
         fekhi1DYU/q2+xXok/VHCrcaHAdfV7cj+46FHZ9zqkhDez+iYhL4dZHl38yNoaYEcTrk
         RA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078977; x=1778683777;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgbuIPvwGTDZ1vH1DcLJwAkJi5BHMTFvMXCyADYeRKI=;
        b=JBIAFccKDWIGFJAbof2bOfWvbj+ykhQQXo4HyRGs3Nq1Yx+doSN0HmnHc3gniEefsa
         fyzUZB2K9cxEukoaxnks1EO180R6GpXivWTkvE9EPBMDvaF9/Rv0mhRoLHhaIz6Ql3vR
         /8+ivIwrC4af+Gsm1LSeryMvIl18LtMnKvgiENuHHWpHJ8Qknmsv6eQ5LYKOPTszgUem
         syZ5wdh+zruJGFUouG97jd5sOAuzTMaJG7uV19V79NMTtdVHnW3/sUxTwdFMQcrJxujg
         Vx8pka3DOSdYBVjKl68LxVySo0nQq78tnu14bhkyjUudhmR9WNoRtgh0TC3dG+CLNs7a
         O/Wg==
X-Forwarded-Encrypted: i=1; AFNElJ8qCATOonezsNUXXKYutzy++ZDzDGV66Zt0KSyNN0rUtbprupO4TfEjpz1u+k1NhB+TCTTfbx6+d8Pn@vger.kernel.org
X-Gm-Message-State: AOJu0YysYBBeTA3ut2dbgqavyfh4E40Hlic3zv7bYfdCubGlBF8AOo3L
	Ffnl/H2d/ehvRdhOqx+3d98+B8dYAkNoiXPbaUUQcmfWSz4TQrIlEkVPpUGXLGiVf7g=
X-Gm-Gg: AeBDietAYrUxLMTs74sPzzg+68RsJ/y4pNJhnLgq4/SItM0A8uqxGo5nXM+BqJmJrlx
	lkWst8H3mMMYIyPAgZsz5b41ocw53Egi6b4IkdlNs4EjlMM7xk4WDNpjnkU4jNWBa36etABBUnK
	RHTy0SHrJjg1SaIxnG36Nbj+Qy7hy6NeyFAB4uh4UTwhuQllZu9YyLHLcrSBwAv4tglmmCSPAb8
	h7Z14F6LXeIHO0W/vmR0gMkuaJ7skCqvcIN23kmmAWJRV56dAPacsP3IzlO6hDxqN2hgJu8itI1
	yNx1uubfDiz2VVKxNGofbz+iJA1XbaMjB5xTnFLkiz9CxUuFKsbUD/IgevvwtrUt6O7BJJ1nIDl
	oXA1pM8BHH2Tf6p6FeUPP5DRtXHq9VCziF4lc2HPf0y53Fjta17AO7RC7pz+Pe3SNRR9H4161Lg
	bxHDWONkWx0b30BR4IkUOJrkdXky9rjox2wG1R0qIHeCe5qCBve13zA7OBKKWWQoYYud8gyxThN
	PUEosLpCD2IjchGkg==
X-Received: by 2002:a05:6000:2013:b0:43c:f3ef:ee36 with SMTP id ffacd0b85a97d-4515d4d0fbcmr6911189f8f.33.1778078977349;
        Wed, 06 May 2026 07:49:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02c5asm13014040f8f.19.2026.05.06.07.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:49:36 -0700 (PDT)
Message-ID: <ab5efb9a-a2a7-4871-94c3-599ba8510dd3@linaro.org>
Date: Wed, 6 May 2026 16:49:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 05/16] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 devicetree@vger.kernel.org, William Wu <william.wu@rock-chips.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <20260428-rockchip-usbdp-cleanup-v4-5-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-5-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 18:13, Sebastian Reichel wrote:
> From: William Wu <william.wu@rock-chips.com>
> 
> According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
> the device under test(DUT) must not respond if LFPS below the
> minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
> platforms, because the default LFPS detect threshold is set to
> 65mV.
> 
> The USBDP PHY LFPS detect threshold voltage could be set to
> 30mV ~ 140mV, and since there could be 10-20% PVT variation,
> we set LFPS detect threshold voltage to 110mV.
> 
> [1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf
> 
> Signed-off-by: William Wu <william.wu@rock-chips.com>
> [Taken over from rockchip's kernel tree; the registers are not described
> in the TRM]
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 1f686844c337..97e53b933225 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -413,7 +413,8 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
>   	{0x0070, 0x7d}, {0x0074, 0x68},
>   	{0x0af4, 0x1a}, {0x1af4, 0x1a},
>   	{0x0440, 0x3f}, {0x10d4, 0x08},
> -	{0x20d4, 0x08}, {0x0024, 0x6e}
> +	{0x20d4, 0x08}, {0x0024, 0x6e},
> +	{0x09c0, 0x0a}, {0x19c0, 0x0a}
>   };
>   
>   static inline int rk_udphy_grfreg_write(struct regmap *base,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
