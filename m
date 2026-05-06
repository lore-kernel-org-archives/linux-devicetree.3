Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBA33128CC
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078736; cv=none; b=r5M2ZwYi15VE1fqx1Yr2oexprscn0K5zg56oV60OE6HxmP87xRV0S86FjdRk4GP8oThF0oxMDR5V8me1bxT7HYJ+jNqnyrErIo05TVYTf87wda+hDKbW+8AM7yVD47p2o9SYjzLmnRoHEAWGHR7x4YxB16GBrOGNWjdw237mNio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078736; c=relaxed/simple;
	bh=1wD4SnHI0tEXTRe3ebPYBWuVkqWk6+N4/ESNiqFqUhs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OhqjV8swn9uxDD0bLAAEzHnpLeUJ3rt0iPBBEgaD1h67cCpmXHQSe62ceCvjrenj4j+0P+sTzO6n67bsEN1/nWvntI2NB/SCREXedZH9TZoDqhEQADENuJRELnCAJ3zodnPufn3ANfPaTmEpu18okNaYLhlzIabf+Kuv5P77HrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wOvVrsKT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wOvVrsKT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-444826c16ffso6166836f8f.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778078733; x=1778683533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhTVObqHGZbC/8+Qwgzi1SIGB0Oq1yZ2x9f+q6AQfVw=;
        b=wOvVrsKTPI90OJLUzAYj+8hPG3z45FeWgo+bKxOwtv1mcJEBmvoe/D+cLhBXp+vHQy
         YtXRxX65+Q3h6TlONec6v+vO1JeEi+lDkheCweD5z8H5bo1HsrgXhRj9ltP7HclvvIoM
         a2taru54gwVV0AAMKS8jI4Wq8D0Q3QcdWGW785lHVDVGkIhCZPEt8JgTZkWpbAexfV1n
         qTckLAVZeRW4wnmegxwnmO7LDZivaTVwk6Ju/leQR0f+7tfpBjRPNE5bTunGzO5Ztb6L
         KKE+7Vxmkge1pzz9VJPwCv8th9SG5e2Z+wB9ziQytrjjcn5RRi6EEP51lKYIKGeOVcLj
         h4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078733; x=1778683533;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhTVObqHGZbC/8+Qwgzi1SIGB0Oq1yZ2x9f+q6AQfVw=;
        b=QC1mRXvQlOdD4xsgCFx5IqPtPtG3z/gsHdrLdUc0yGJyweCemV1FZzgfr2MaFnOzSu
         4N+Jra2w4aWoQ4H+m1byh3b1Y6hIdh8drIy/vFV8oFOtfE6C3LFV8KE8ROijb0m3HjoP
         GiKMzjWzGLViEGWtiYVOVTApTsxxXtQ2GIScJIwAu/ERRCuBSU0xhvoM7CYfObPb6WVc
         ViW3N0Zbfp80S68riwjN1HJ3+4jVql155Za9uzUIW22LYRb6U7IkHYICuI6SSTKCskWv
         3XWJDQtVk11VmUxv7EB9TlnUMMROfSvD10VOzekfj/FV623/JyGcZJ4UoGoUn0l3agqj
         8x2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9gjT25nvxTu7rbi79es5ZyihMyHhgL1a7KQmStiYdzJWEczHs6nOJRb6QTmPs5ii26uXO6w6SYWAKK@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqESZjyqlaG+hdI1tlq/bH9+TEnC0+vi9w2fM3Tj60aweZsnu
	rXayXG7cG+1Rph4T3nFxivAmab5J9pBGJvyZ5Tm8M91Iz6Tlzlge7z1RW7mo5yb6mxk=
X-Gm-Gg: AeBDietpvpDS+01cd88pabLnqoGo3P/jCg/bwk1d0Fhp7B1Ey1mcMEzNOuvJls8Jgw4
	HH/BlHRlu26AdQdm+a8VDOa5oo2KbPEAYcfPS+rBhqlq/erOozG9dXw4hVQXUGEZlZvtnKHGdSm
	/9fI80JY+CWzAFA9LYpPoMsvUQKDMpmunv+9gHZli4gWglOFC50jcRytU0i1Yn2C8G3u8rN1oYB
	PkZ27Pyw5c9iHAx8CZIHLEe77vZIFA8nb1e8zvk+GmF3hIH6KjXFDeFqeMkR1LNsKRzhLLQnBq6
	BV1sE6XvlVlwLmOY8nnFFe4QUCJJLpEGSADzXORWInZ8x6ZTPV8xVW7bK8sk3X52Vbhviyy99Zy
	A7MK5Ph1C5s0IRPeAHdfZmX49WtHZzyTe3cp/3H5GhOnQDnK0F82iD7iw1owdevIEKCV1gUbXhx
	ZzBDcOe4OfTyNFTif0LCO6jU4aekuCsOHGMhubkK7CC5bRQwAxVBHq348msVzsys0ygpuavBK7s
	oxKz/9ZXx+/MNu2qQ==
X-Received: by 2002:a5d:64e3:0:b0:449:cfea:ca91 with SMTP id ffacd0b85a97d-4515da96254mr5892163f8f.37.1778078732399;
        Wed, 06 May 2026 07:45:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm12906801f8f.32.2026.05.06.07.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:45:31 -0700 (PDT)
Message-ID: <4d41044a-1b09-4d78-a99d-53c0cd1cc539@linaro.org>
Date: Wed, 6 May 2026 16:45:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/5] phy: rockchip: inno-usb2: Add clkout_ctl_phy
 support
To: Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, jonas@kwiboo.se
References: <20260505170410.3265305-1-heiko@sntech.de>
 <20260505170410.3265305-5-heiko@sntech.de>
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
In-Reply-To: <20260505170410.3265305-5-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 19:04, Heiko Stuebner wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> The 480m clk is controlled using regs in the PHY address space and not
> in the USB GRF address space on e.g. RK3528 and RK3506.
> 
> Add a clkout_ctl_phy usb2phy_reg to handle enable/disable of the 480m
> clk on these SoCs.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 47 +++++++++++++++----
>   1 file changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> index 7cec45192393..d8879fcd4291 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -179,6 +179,7 @@ struct rockchip_usb2phy_cfg {
>   	unsigned int	num_ports;
>   	int (*phy_tuning)(struct rockchip_usb2phy *rphy);
>   	struct usb2phy_reg	clkout_ctl;
> +	struct usb2phy_reg	clkout_ctl_phy;
>   	const struct rockchip_usb2phy_port_cfg	port_cfgs[USB2PHY_NUM_PORTS];
>   	const struct rockchip_chg_det_reg	chg_det;
>   };
> @@ -228,6 +229,7 @@ struct rockchip_usb2phy_port {
>    * struct rockchip_usb2phy - usb2.0 phy driver data.
>    * @dev: pointer to device.
>    * @grf: General Register Files regmap.
> + * @phy_base: USB PHY regmap.
>    * @clks: array of phy input clocks.
>    * @clk480m: clock struct of phy output clk.
>    * @clk480m_hw: clock struct of phy output clk management.
> @@ -245,6 +247,7 @@ struct rockchip_usb2phy_port {
>   struct rockchip_usb2phy {
>   	struct device	*dev;
>   	struct regmap	*grf;
> +	struct regmap	*phy_base;
>   	struct clk_bulk_data	*clks;
>   	struct clk	*clk480m;
>   	struct clk_hw	clk480m_hw;
> @@ -312,15 +315,33 @@ static void rockchip_usb2phy_clk_bulk_disable(void *data)
>   	clk_bulk_disable_unprepare(rphy->num_clks, rphy->clks);
>   }
>   
> -static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
> +static void
> +rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
> +				    const struct usb2phy_reg **clkout_ctl)
>   {
>   	struct rockchip_usb2phy *rphy =
>   		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> +
> +	if (rphy->phy_cfg->clkout_ctl_phy.enable) {
> +		*base = rphy->phy_base;
> +		*clkout_ctl = &rphy->phy_cfg->clkout_ctl_phy;
> +	} else {
> +		*base = rphy->grf;
> +		*clkout_ctl = &rphy->phy_cfg->clkout_ctl;
> +	}
> +}
> +
> +static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
> +{
> +	const struct usb2phy_reg *clkout_ctl;
> +	struct regmap *base;
>   	int ret;
>   
> +	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
> +
>   	/* turn on 480m clk output if it is off */
> -	if (!property_enabled(rphy->grf, &rphy->phy_cfg->clkout_ctl)) {
> -		ret = property_enable(rphy->grf, &rphy->phy_cfg->clkout_ctl, true);
> +	if (!property_enabled(base, clkout_ctl)) {
> +		ret = property_enable(base, clkout_ctl, true);
>   		if (ret)
>   			return ret;
>   
> @@ -333,19 +354,23 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
>   
>   static void rockchip_usb2phy_clk480m_unprepare(struct clk_hw *hw)
>   {
> -	struct rockchip_usb2phy *rphy =
> -		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> +	const struct usb2phy_reg *clkout_ctl;
> +	struct regmap *base;
> +
> +	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
>   
>   	/* turn off 480m clk output */
> -	property_enable(rphy->grf, &rphy->phy_cfg->clkout_ctl, false);
> +	property_enable(base, clkout_ctl, false);
>   }
>   
>   static int rockchip_usb2phy_clk480m_prepared(struct clk_hw *hw)
>   {
> -	struct rockchip_usb2phy *rphy =
> -		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> +	const struct usb2phy_reg *clkout_ctl;
> +	struct regmap *base;
> +
> +	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
>   
> -	return property_enabled(rphy->grf, &rphy->phy_cfg->clkout_ctl);
> +	return property_enabled(base, clkout_ctl);
>   }
>   
>   static unsigned long
> @@ -1336,9 +1361,13 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
>   
>   	if (!dev->parent || !dev->parent->of_node ||
>   	    of_property_present(np, "rockchip,usbgrf")) {
> +		rphy->phy_base = device_node_to_regmap(np);
> +		if (IS_ERR(rphy->phy_base))
> +			return PTR_ERR(rphy->phy_base);
>   		rphy->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,usbgrf");
>   	} else {
>   		rphy->grf = syscon_node_to_regmap(dev->parent->of_node);
> +		rphy->phy_base = rphy->grf;
>   	}
>   	if (IS_ERR(rphy->grf))
>   		return PTR_ERR(rphy->grf);

The logic is not easy to follow, but it looks right.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
