Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AC847B409
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078759; cv=none; b=n9L5IRl0q746puDyD+yVW59T8jrXh/Bzgj4PY0e3oKxrP/ccJ1Z1/f+7hXIhnDR5MzbVr2cYwGnxNnleePwzppd2yexFXwmjw2TTDxBg+ulxHuo7csj4fr2w5GDv4NKD6wP7ka4nDMXSCrt18UVIDd++ihW49U7JUD2QqKrG0mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078759; c=relaxed/simple;
	bh=s/cApy1P6liA9DNXKrM8pkbh+LpqTWorqH19klmgCew=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XQRmibWlfcjMGn/hH0eOnuYsjdB06Oj+1XttK0BDzSVGv+Eh67mv4HREsnj4aM29o32FRzNmHT8OISababEwcEXE+wjf+QdIFgn2u8jQyCvsRWQPw0vXWOxNk5TTxQqBfrpymaQ+nE3FKmUTH/z/ByjLlASdXZK7+uHzED5zbYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HGqJTC5T; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HGqJTC5T"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ad135063so62068195e9.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778078756; x=1778683556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HtqF6jrqaeSm9DrDqkDcfltRHLuI2l02ndlgOFlBxs=;
        b=HGqJTC5T0QU5qgK80NLTtFl/kQ725H3DZgVfomLI+rBDhTaB4EEwcXgJ1IDkgLtE52
         qVd8k/BuF+tMV6pFePnGjecVxw3CkQUsXYPBUF9P6dqajHijcmkSZ31Ye0yjlJLF5o5X
         aGenB2DXJFlczAK46Oums4TqrPtsZ0STB3hNFwuE1O9rVfrcrluRoRx6U+2Z+tlxq8hq
         csuqGB6qjd9qZsOY5X+c0KxAlace9hAZLCkblRrwrltBj3WgKkWysGQj9PbUuONgxUpf
         237PwUMuliPaRNVDHztndAbhsit4yoxhE69ZzhN0DsYsFZhXrDdqoIvPsQXIlmIi0780
         dxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078756; x=1778683556;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HtqF6jrqaeSm9DrDqkDcfltRHLuI2l02ndlgOFlBxs=;
        b=fHX+nj7y4hHzY8N31UrioGBsDHclDplwCPiNy/d/i+vzYlq+EvcuQweS2eb/IO/5j7
         zyeXdSfdNt69Y3G+OUezhI7C6X8XSV7nKVS6eIXaapfjX4iSjXHL8SHEnwvNi8Ml54FU
         WHr9OaVtU4LZVW0Ku2NzabMmHiCg72M/474XXKwhTVrWlSWcvmt3HA6jLR1Ays0HFkYo
         CZifh59ZD83vdAxxT82ee4Oxha7EillJtFSvz0/bmcT4sjuzZdg+Asfu+Ypg/A7lUfqX
         dRlD0qaYnlrbpK/FqgdbNB0FHKfdJyzhPSSBprBApyVy20cgZuLE8qlN0MzYNGF9ydi+
         Uiqw==
X-Forwarded-Encrypted: i=1; AFNElJ8OIObXi+Fibpo9cQeGcIeLXbReVcOL/OISwngseOXA0wfBaBwoDQFCMv2F1Dckao5gUPO+RZDoJSu5@vger.kernel.org
X-Gm-Message-State: AOJu0YzFeBzirxr6qjZeYpES6X8qo9Qh3lVmkEAlrFOrETqYO4nkw3KL
	RKZmGNN8/aYOvlslUULgKxUrOa6cAAUvU1Uu8i3Hpc5UH81LYMQ6dhtGzySTdM1cMcw=
X-Gm-Gg: AeBDieuiRhEp+obFeX/hEyBttG0RSzGKX6jXT9TLg0SIYJrdR250D0t7D4/PmiqOPCx
	JExEIMjARAOKA4pDOYGhD3mmlrAygucarzdPnLMQcvSTj6WZZ5uEIjpjW6OHDQOu+CC3PLo4Y0L
	WXQkCQjhf0WcbKkoxSQyyOzXVvZlG0vNXVsIxMFC4s1Jee1SYmrQpow4or4Vdi2IhQbBzxo4Gsm
	pyXJedOVw8cBIxwY2+KN4H12FLeFDoKG0VhtKcHBbK+ewgJNd7V/857yHa+ryHDZP42x3ynnwz4
	ZSJkjzEJ/KF8+EBz6BgNIYAw6RsiMVuOcLPUBCDKdz64wMtNc5E5HKqsDkF9XfoMAKl+4cQgd4c
	alHsHZn/gZKua2zJGsSxbmovrT8E9y32puYb1AFWvWzjuJ+PrjZctz5Xu0jO7BebSrbsV7l1p2+
	9Zv/lQ9d8KnckkRheMVF2IP8MwEverEHqk3CRWWDpVd7H0q/3dkjd2OOFEyp0Vf1xzanKU+dZea
	Rdd9foMisiVreRyhg==
X-Received: by 2002:a05:600c:3f18:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48e51e19668mr63687185e9.8.1778078755449;
        Wed, 06 May 2026 07:45:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53147bc2sm30042045e9.6.2026.05.06.07.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:45:54 -0700 (PDT)
Message-ID: <38f9106e-5cb7-4446-96a2-ea5ea3b358b4@linaro.org>
Date: Wed, 6 May 2026 16:45:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] phy: rockchip: inno-usb2: Add support for RK3528
To: Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, jonas@kwiboo.se,
 Jianwei Zheng <jianwei.zheng@rock-chips.com>
References: <20260505170410.3265305-1-heiko@sntech.de>
 <20260505170410.3265305-6-heiko@sntech.de>
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
In-Reply-To: <20260505170410.3265305-6-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 19:04, Heiko Stuebner wrote:
> From: Jianwei Zheng <jianwei.zheng@rock-chips.com>
> 
> The RK3528 has a single USB2PHY with a otg and host port.
> 
> Add support for the RK3528 variant of USB2PHY.
> 
> PHY tuning for RK3528:
> 
> - Turn off differential receiver in suspend mode to save power
>    consumption.
> 
> - Set HS eye-height to 400mV instead of default 450mV.
> 
> - Choose the Tx fs/ls data as linestate from TX driver for otg port
>    which uses dwc3 controller to improve fs/ls devices compatibility with
>    long cables.
> 
> Undocumented magic-values are based on the linux-stan-6.1-rkr5 tag of
> the vendor-kernel.
> 
> Signed-off-by: Jianwei Zheng <jianwei.zheng@rock-chips.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 84 +++++++++++++++++++
>   1 file changed, 84 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> index d8879fcd4291..133cfd6624e8 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -1511,6 +1511,38 @@ static int rk3128_usb2phy_tuning(struct rockchip_usb2phy *rphy)
>   				BIT(2) << BIT_WRITEABLE_SHIFT | 0);
>   }
>   
> +static int rk3528_usb2phy_tuning(struct rockchip_usb2phy *rphy)
> +{
> +	int ret;
> +
> +	/* Turn off otg port differential receiver in suspend mode */
> +	ret = regmap_write(rphy->phy_base, 0x30, BIT(18) | 0x0000);
> +	if (ret)
> +		return ret;
> +
> +	/* Turn off host port differential receiver in suspend mode */
> +	ret = regmap_write(rphy->phy_base, 0x430, BIT(18) | 0x0000);
> +	if (ret)
> +		return ret;
> +
> +	/* Set otg port HS eye height to 400mv (default is 450mv) */
> +	ret = regmap_write(rphy->phy_base, 0x30, GENMASK(22, 20) | 0x0000);
> +	if (ret)
> +		return ret;
> +
> +	/* Set host port HS eye height to 400mv (default is 450mv) */
> +	ret = regmap_write(rphy->phy_base, 0x430, GENMASK(22, 20) | 0x0000);
> +	if (ret)
> +		return ret;
> +
> +	/* Choose the Tx fs/ls data as linestate from TX driver for otg port */
> +	ret = regmap_write(rphy->phy_base, 0x94, GENMASK(22, 19) | 0x0018);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   static int rk3576_usb2phy_tuning(struct rockchip_usb2phy *rphy)
>   {
>   	int ret;
> @@ -1924,6 +1956,57 @@ static const struct rockchip_usb2phy_cfg rk3399_phy_cfgs[] = {
>   	{ /* sentinel */ }
>   };
>   
> +static const struct rockchip_usb2phy_cfg rk3528_phy_cfgs[] = {
> +	{
> +		.reg = 0xffdf0000,
> +		.num_ports	= 2,
> +		.phy_tuning	= rk3528_usb2phy_tuning,
> +		.clkout_ctl_phy	= { 0x041c, 7, 2, 0, 0x27 },
> +		.port_cfgs	= {
> +			[USB2PHY_PORT_OTG] = {
> +				.phy_sus	= { 0x004c, 8, 0, 0, 0x1d1 },
> +				.bvalid_det_en	= { 0x0074, 3, 2, 0, 3 },
> +				.bvalid_det_st	= { 0x0078, 3, 2, 0, 3 },
> +				.bvalid_det_clr	= { 0x007c, 3, 2, 0, 3 },
> +				.idfall_det_en	= { 0x0074, 5, 5, 0, 1 },
> +				.idfall_det_st	= { 0x0078, 5, 5, 0, 1 },
> +				.idfall_det_clr	= { 0x007c, 5, 5, 0, 1 },
> +				.idrise_det_en	= { 0x0074, 4, 4, 0, 1 },
> +				.idrise_det_st	= { 0x0078, 4, 4, 0, 1 },
> +				.idrise_det_clr	= { 0x007c, 4, 4, 0, 1 },
> +				.ls_det_en	= { 0x0074, 0, 0, 0, 1 },
> +				.ls_det_st	= { 0x0078, 0, 0, 0, 1 },
> +				.ls_det_clr	= { 0x007c, 0, 0, 0, 1 },
> +				.utmi_avalid	= { 0x006c, 1, 1, 0, 1 },
> +				.utmi_bvalid	= { 0x006c, 0, 0, 0, 1 },
> +				.utmi_id	= { 0x006c, 6, 6, 0, 1 },
> +				.utmi_ls	= { 0x006c, 5, 4, 0, 1 },
> +			},
> +			[USB2PHY_PORT_HOST] = {
> +				.phy_sus	= { 0x005c, 8, 0, 0x1d2, 0x1d1 },
> +				.ls_det_en	= { 0x0090, 0, 0, 0, 1 },
> +				.ls_det_st	= { 0x0094, 0, 0, 0, 1 },
> +				.ls_det_clr	= { 0x0098, 0, 0, 0, 1 },
> +				.utmi_ls	= { 0x006c, 13, 12, 0, 1 },
> +				.utmi_hstdet	= { 0x006c, 15, 15, 0, 1 },
> +			}
> +		},
> +		.chg_det = {
> +			.opmode		= { 0x004c, 3, 0, 5, 1 },
> +			.cp_det		= { 0x006c, 19, 19, 0, 1 },
> +			.dcp_det	= { 0x006c, 18, 18, 0, 1 },
> +			.dp_det		= { 0x006c, 20, 20, 0, 1 },
> +			.idm_sink_en	= { 0x0058, 1, 1, 0, 1 },
> +			.idp_sink_en	= { 0x0058, 0, 0, 0, 1 },
> +			.idp_src_en	= { 0x0058, 2, 2, 0, 1 },
> +			.rdm_pdwn_en	= { 0x0058, 3, 3, 0, 1 },
> +			.vdm_src_en	= { 0x0058, 5, 5, 0, 1 },
> +			.vdp_src_en	= { 0x0058, 4, 4, 0, 1 },
> +		},
> +	},
> +	{ /* sentinel */ }
> +};
> +
>   static const struct rockchip_usb2phy_cfg rk3562_phy_cfgs[] = {
>   	{
>   		.reg = 0xff740000,
> @@ -2291,6 +2374,7 @@ static const struct of_device_id rockchip_usb2phy_dt_match[] = {
>   	{ .compatible = "rockchip,rk3328-usb2phy", .data = &rk3328_phy_cfgs },
>   	{ .compatible = "rockchip,rk3366-usb2phy", .data = &rk3366_phy_cfgs },
>   	{ .compatible = "rockchip,rk3399-usb2phy", .data = &rk3399_phy_cfgs },
> +	{ .compatible = "rockchip,rk3528-usb2phy", .data = &rk3528_phy_cfgs },
>   	{ .compatible = "rockchip,rk3562-usb2phy", .data = &rk3562_phy_cfgs },
>   	{ .compatible = "rockchip,rk3568-usb2phy", .data = &rk3568_phy_cfgs },
>   	{ .compatible = "rockchip,rk3576-usb2phy", .data = &rk3576_phy_cfgs },

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
