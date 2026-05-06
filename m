Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152712D97B5
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079808; cv=none; b=Qhc3/SpbSD0Tf3D7OwxlgJ1pRCxSw78YcYTMmrBc2TK3pO2w0NC00XlwF7ccjo2xE+8xAX7mD9XBG7rb+KPIyp8epgBTAiFvxAW+ZZ1KNjgnroA4ya+Bh/1hf95HWn4LUE0clLT38LWEFgTBx0zBej+CQmHTKY95y9El/Muk6KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079808; c=relaxed/simple;
	bh=B87l/+dXX9ZwdipiWVnNUuu8nCGR2/ZMqtA9tPmwvi4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pD66A5/qLPM824kCwRdb9ETFP2i86d62dbf0fCuyd22t12x3CwxjThp6MieDs9g1G1gjqpUFZBC1FO7msQ89SzkEdfazDcM6ZOkM4dHiIoXwQsF69V/yDwsvSa60OE3HsniCoATl9Xiu+uG/tVe6GtKcVO3/nD53Z4s3t4JMACc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sEnTyHje; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sEnTyHje"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b941762394aso951903266b.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079805; x=1778684605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2mDJXIFYlupSX9LmHl3D1F2SQl0bbq2hvtOpkX4whw=;
        b=sEnTyHjeVh00T6PqIxmybvTdjrHtr7o/WZkrO3oDRdJF887iZIdJErY339ntSQ4jsy
         JmXeTv16gTh8NzAlQCo3F/SLLaewWOJlZ6cX1GVYADm/1Pp2tjGnbsVyM8LQwvldCBI4
         wfgc2kt+Pgb0iKKRVeaBxuTZsOeld+66leTKs1YUtxwqR7GLuZ0ai1l1my3nuujuf9RJ
         irAfFA8ureSarugLI+xy+6inavJTWetceJQ3Pg/vhV1U6neQ1WCyQt0IwyZKgm4ynyyv
         /5HUg4qCGO2+htLLOPJOcA8J7S3EBX6/iuy8w1xN53029NIl7NIOi7ZupZ0F3kDY7bww
         bBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079805; x=1778684605;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2mDJXIFYlupSX9LmHl3D1F2SQl0bbq2hvtOpkX4whw=;
        b=AS82sY+puYzkTrw7RCiS0qw1zDwPL6Uhevbc2En+uxMDvW6MP9GUVyQIhJBTlK5Wv3
         fvUt3Z75dWNuBAwFRsIALaMGdeNn7Wu0Fgbh/82+vfDabAyVrt4heCRJ7hOT6o1/VZC4
         e8V+jVRQAkA6ui8d6FBqPBuqwuw9+cS4Q7PVi/0jDf29GhjKTxxAmiOr3YstjxWdp1Ke
         lsIt8izfU2UpAvRZ5w7+0mflapngN5CoqJZWMdzGPLze1Q/bBqRMw1cDDb2ZiHHIcxER
         U7Rnaa2nHeAj3vZbg5gU6LPlZj8cJ260riPZDyBb7Q4TDzvOz7+amuRTom2ZzeqFPOcH
         zi1w==
X-Forwarded-Encrypted: i=1; AFNElJ9mNeAt0N21UFNFl4f5O7/YQY58e+w1LOVfNYOEk+zCFkMfOs2EKj2e6FI1OEajohCUa86gOgk/YxU8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt40JiLPWI6dFVDC9gznbOtHNorvu3ckgYasPx5ra22IBfqqJF
	85GThH3Wg2AKb0PK+QEQoknjareIn0P8nMPKW/pqDiOwWgICWa/WkFq5Jzp7x6AGGVM=
X-Gm-Gg: AeBDiesGtwgDhOVu5bYWKASYeiIFlkwIVqGAGUzOUu9+n8qZbeUUEwMARs70a4CDx+L
	oUGeqJ7AumJ5TOy7J/XJOodCtZxOYrRLV9xOOvvrFN+WVDwTERDJ/uLQo7X65R7kPh/Jk38yBJc
	HGJKRUyubkXokZZI75dTISWIl7bnFbTSGvBFnBjtcC3XtMQ85zqxVtzPpI2KdJcsRus2BuUVeDP
	1RlXjm7gvCUyTR39aBlwcK4gV8ueEolwKj7kKyVK7+qzE4wGX/RsxXuTHR7LdG8vBLMQ6kFQQ7S
	z7MxTvw16+g/EWH4GI+nC7wAFS26XfBhSmSvHOVHQOoTksgNWMh/dzQ1bsAH7nTisI6w+Bi8GOD
	/d+h8TlTOnWI7Pfd62Xg67g91PgV6nNDh1g8z94EF8+Y7Ndz9nW7fLAmHlnjEBs1aoZDhqLpYlw
	AweSeN18GrHyv02SbRTY/iw2H17im3kMxYcX3d0De7k+oHWG9aE3kF60XSndyND3c2tH4rFQzYw
	v2OHuKJN4v7QoL7Aw==
X-Received: by 2002:a17:907:fd8a:b0:bba:3bd7:17c7 with SMTP id a640c23a62f3a-bc56ac3654amr180224366b.7.1778079805146;
        Wed, 06 May 2026 08:03:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052953383sm12652260f8f.13.2026.05.06.08.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:03:24 -0700 (PDT)
Message-ID: <e2427d64-c7dd-4184-8824-f79cf15773d5@linaro.org>
Date: Wed, 6 May 2026 17:03:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] phy: k1-usb: k3: add USB2 PHY support
To: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yao Zi <me@ziyao.cc>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
 <20260305-11-k3-usb2-phy-v4-2-15554fb933bc@kernel.org>
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
In-Reply-To: <20260305-11-k3-usb2-phy-v4-2-15554fb933bc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/26 02:00, Yixun Lan wrote:
> Add USB2 PHY support for SpacemiT K3 SoC.
> 
> Register layout of handling USB disconnect operation has been changed,
> So introducing a platform data to distinguish the different SoCs.
> 
> Reviewed-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>   drivers/phy/spacemit/phy-k1-usb2.c | 34 +++++++++++++++++++++++++++++-----
>   1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> index 9215d0b223b2..87b943d9111f 100644
> --- a/drivers/phy/spacemit/phy-k1-usb2.c
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -51,6 +51,9 @@
>   #define PHY_K1_HS_HOST_DISC		0x40
>   #define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
>   
> +#define PHY_K3_HS_HOST_DISC		0x20
> +#define  PHY_K3_HS_HOST_DISC_CLR		BIT(8)
> +
>   #define PHY_PLL_DIV_CFG			0x98
>   #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
>   #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
> @@ -145,7 +148,7 @@ static int spacemit_usb2phy_exit(struct phy *phy)
>   	return 0;
>   }
>   
> -static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
> +static int spacemit_k1_usb2phy_disconnect(struct phy *phy, int port)
>   {
>   	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
>   
> @@ -155,10 +158,27 @@ static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
>   	return 0;
>   }
>   
> -static const struct phy_ops spacemit_usb2phy_ops = {
> +static int spacemit_k3_usb2phy_disconnect(struct phy *phy, int port)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(sphy->regmap_base, PHY_K3_HS_HOST_DISC,
> +			   PHY_K3_HS_HOST_DISC_CLR, PHY_K3_HS_HOST_DISC_CLR);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops spacemit_k1_usb2phy_ops = {
>   	.init = spacemit_usb2phy_init,
>   	.exit = spacemit_usb2phy_exit,
> -	.disconnect = spacemit_usb2phy_disconnect,
> +	.disconnect = spacemit_k1_usb2phy_disconnect,
> +	.owner = THIS_MODULE,
> +};
> +
> +static const struct phy_ops spacemit_k3_usb2phy_ops = {
> +	.init = spacemit_usb2phy_init,
> +	.exit = spacemit_usb2phy_exit,
> +	.disconnect = spacemit_k3_usb2phy_disconnect,
>   	.owner = THIS_MODULE,
>   };
>   
> @@ -167,12 +187,15 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
>   	struct phy_provider *phy_provider;
>   	struct device *dev = &pdev->dev;
>   	struct spacemit_usb2phy *sphy;
> +	const struct phy_ops *ops;
>   	void __iomem *base;
>   
>   	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
>   	if (!sphy)
>   		return -ENOMEM;
>   
> +	ops = device_get_match_data(dev);
> +
>   	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
>   	if (IS_ERR(sphy->clk))
>   		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
> @@ -185,7 +208,7 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
>   	if (IS_ERR(sphy->regmap_base))
>   		return dev_err_probe(dev, PTR_ERR(sphy->regmap_base), "Failed to init regmap\n");
>   
> -	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
> +	sphy->phy = devm_phy_create(dev, NULL, ops);
>   	if (IS_ERR(sphy->phy))
>   		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
>   
> @@ -196,7 +219,8 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id spacemit_usb2phy_dt_match[] = {
> -	{ .compatible = "spacemit,k1-usb2-phy", },
> +	{ .compatible = "spacemit,k1-usb2-phy", .data = &spacemit_k1_usb2phy_ops },
> +	{ .compatible = "spacemit,k3-usb2-phy", .data = &spacemit_k3_usb2phy_ops },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
