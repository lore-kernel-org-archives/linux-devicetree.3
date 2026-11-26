Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698032;
	b=i6RlUbwSsqS0esvNwQayP+hmky41x10Z/FaL+wiDHcazepOfAzXSSd0ngkVFJN4oi2vd
	 HCN0ohdSjfLbbZYLmE9f1KGjFtpoqVMPls3N2D9b9dICWaoN+WON/2Sas8HLAm6yfeEOl
	 ij1y3xAbuKbo2ICSg3qEoOErut44wQejYlztCCT2chaK4RphzvsV5rdHgxAZG/HN/dd/k
	 LT1fIUoZq7etH4QYgGo8gcteOuXw3MDsgEWRaC4VuH7o6IP9qGbB4u1RupZKvOAoRcU33
	 c4zs7YCK9ms5zjtroD0cnas+vXr8wTKjNFoyZLyrsrSL+jTjpSFqgGr5MwRq2XvL3yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Db7swx/z5fRcWKIKhx/36FX+1LnzR+96h9IjzqTpdvs=;
	b=WQnnK+QAlLotNY9iUgk0RCXYopfwi2VZg6ojidoElLHv05j+tSs+C3R676BzINfhoIxp
	 Kl0t0oPZfAsdELC51xIs90VeZcFgV0R7kHCcoeu4tIoB+Gjh7mMydDCBOgt5XhDn9aq2q
	 88F/gVd1ySN5tHTko/jzzL5Qrt/CRSKhcJKRrbrWl5pXbb251YVw93HO7g9QIQpr/eYe/
	 oIrPGEvyCNfFUcetS0xJclCQ4CX2KKUgoRnkGnFqOrtMeOSk156bSyt6C+1vK1jtE0TtL
	 98HXjhbLROiTes9/WFEcS7Zxm3QUkF/at5tHkyhI+pfw+QlEsOi1kh5sNHDvrYGUYLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Vjg2M7n/";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7D1606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vjg2M7n/
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso2965070a91.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698032; x=1796302832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Db7swx/z5fRcWKIKhx/36FX+1LnzR+96h9IjzqTpdvs=;
        b=Vjg2M7n/jvQqi8Iu5gHLylk8W4DSsHak/aphtHnbT9mabryXAmvjC/sAlK9iQIo6Rr
         s1WavyhtUn00ODNDDXumZuNMzeTRrHke+qEfRMh7QO73j0pYn6hTiZ0rAHRRhXmGOteF
         5neoTKx9c9ajzyj4JZXmwUFzS34FisGo7iq/rTpTv1hZSu/Hsb2zjzvp6BqXdjiYGwV6
         +uet5W3DYizwCp/l91AI2whL6qA97od71hcC00MkfRuCSJBUOinafAtkvjB546rLiroZ
         zHee/9MOFc/gKO7nKKB6EOANaJBU4JR3apm5u6oOtt2rbwiInYCVn8B0Cm65HRQ3WElv
         QxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698032; x=1796302832;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Db7swx/z5fRcWKIKhx/36FX+1LnzR+96h9IjzqTpdvs=;
        b=PKpOzNdb3QmNVEiuLC2X26PJ2oc12I3IUnIM0yXCA7Qya9LR04y32cBSaAnkEEY8in
         BIlProVd1xQmccbJ2LCwXuOxgEF5XVpXUvf2IjmV0Tfy6FKwozdedjX+z7hVGCSnk4BN
         RqcpLbcNqDcjm2V2vnMIVLj8txLKSBCAaRjP3hay6UJhvWS7CZXYhr3pQObTzXIA54jS
         kNksXwbb8KD8GLAsH73QPXTkbKHbmPXaamvzErheQuh2mMtjRDNpqZHw5o9PzHWPn0c2
         1+cFXax3bBDO6RfITMZagwVRwI7ww41waKGX3WsEgH0W0lkLRDtGK1tzG5Hkv8ExMDLh
         9G4A==
X-Forwarded-Encrypted: i=1; AL+hErEtJNlUlNOLrBerr36sACFVDpBc92Jewt5PZiVWGalWSFTficHNfGnRrj+ElSSo/RG/ERYjZDeYFQIu@vger.kernel.org
X-Gm-Message-State: APuU4Z/hpR81pMP/wAPpmoX7+NhtISU5ZIo8q+F0p8/y4KqeHvxuWf23
	/0GErsatXhlGxrhjCWa6p4GqrMnG2Gnr/gI+9jPmwgXNLvVGkU7JsLpA
X-Gm-Gg: AZFdTZefsCPl/Bc1Ru8xdAoBd2ZCrEqVSNGB3FQedpx9wK4o0oWGO3eucIlLKtPMJbm
	IC3Eg5kiSDlrxfBVGPF2OyRMehtYwDkqGHiPwC4Y8FgmPfqWtiqzQvpM5wYuCglIczkk88+bkrZ
	k5gDv6mu/HD2oiq6XQRU1wh0uTn9msKWzJcXFHSHaQ247rKyMm4QVquCkI5aUtxhRZiJg8gW1Id
	JS4hTwhvkBIFA6LYtN9JOMSGh3xTAEBATfdSKp4NrbVcwxvp+HokJcDpCLwBTuHrT5E9WHSxAAR
	jaEyk4+9uOEfsaiMTh4gYommhvcbTwP7f9VPMuxwM/gMV21vSJnNMyQb6DMfBqINy+6o6FGDjyq
	YTwTqDe/Qu21hNLO0DI7AWX6p+pmJW6vc+FXfV6tv3El7tRHroVgMWNpMyPElqp8S3TnnbUgAlt
	9iYGJLCIGs5rNR+fDfHXxGICzfqzjwdKsSvoIJZ+luiDWa7scv//LCLjxbAHOSdyY3TVueHwlH8
	mA3KLZEcfjDj5H9NHpaimvhzTQkmYlde7b3QQ9OGqTv7MYzg3orKadDA51/0AWTWFfMzNdIeES/
	qeTUXDtIHtNROMFiI6SnUSYvFj4/Lhmy1GabdOOLHt6f1NliGAAl
X-Received: by 2002:a17:90b:2cce:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b41c9759cbmr21021163a91.54.1795698031561;
        Thu, 26 Nov 2026 05:00:31 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b0f482bdsm17077789a91.14.2026.11.26.05.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:00:30 -0800 (PST)
Message-ID: <772ec0ea-da77-42e3-a281-8b8b7f364bf9@gmail.com>
Date: Thu, 26 Nov 2026 22:00:25 +0900
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v4 08/11] PM / devfreq: rockchip-dfi: make RK3588 use its
 clocks
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
 <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-8-517a68c008fe@collabora.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-8-517a68c008fe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/19/2026 10:01 PM, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> So far, RK3588 doesn't have the pclks for DDRMON used in the driver, as
> they weren't modelled before.
> 
> However, they are now correctly modelled, so the driver should use them
> when possible.
> 
> Instead of unconditionally getting them for this SoC, add a new variant
> member that specifies whether the driver should let missing clocks
> slide. This is needed because we want old device trees to keep
> functioning, as otherwise we'd be introducing a breaking change for
> literally no functional difference here.
> 
> Fill out a clock name list for this variant as well, and hand it to it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 2b9d9b26b11a..c51d7eeec394 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -117,6 +117,18 @@ struct rockchip_dfi {
>  	const struct rockchip_dfi_variant *variant;
>  };
>  
> +/**
> + * struct rockchip_dfi_variant
> + * @init: pointer to the variant-specific initialisation function
> + * @stride: address offset between the DDRMON per-channel instances
> + * @ctrl_single: whether only one DDRMON instance monitors multiple channels
> + * @max_channels: maximum number of memory channels for this SoC
> + * @clk_names: pointer to a constant array of constant clock name strings
> + * @num_clks: the number of elements in the @clk_names array
> + * @clocks_optional: whether not finding the clocks is non-fatal. Set if the
> + *                   DT binding for this variant didn't require clocks in the
> + *                   past, so that the driver remains compatible with old DTs.
> + */
>  struct rockchip_dfi_variant {
>  	int (*init)(struct rockchip_dfi *dfi);
>  	int stride;
> @@ -124,6 +136,7 @@ struct rockchip_dfi_variant {
>  	unsigned int max_channels;
>  	const char * const *clk_names;
>  	unsigned int num_clks;
> +	bool clocks_optional;
>  };
>  
>  static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
> @@ -806,6 +819,11 @@ static const char * const rk3399_clk_names[] = {
>  	"pclk_ddr_mon",
>  };
>  
> +static const char * const rk3588_clk_names[] = {
> +	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
> +	"pclk_ddr_mon_ch3",
> +};

For proper operation of this patch, the following patch should be applied.
The following patch is applied to other git?

https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-6-43ff34ac8599@collabora.com/

> +
>  static const struct rockchip_dfi_variant rk3399_variant = {
>  	.init = rk3399_dfi_init,
>  	.stride = 0x14,
> @@ -826,6 +844,9 @@ static const struct rockchip_dfi_variant rk3588_variant = {
>  	.init = rk3588_dfi_init,
>  	.stride = 0x4000,
>  	.max_channels = 4,
> +	.clk_names = rk3588_clk_names,
> +	.num_clks = ARRAY_SIZE(rk3588_clk_names),
> +	.clocks_optional = true,
>  };
>  
>  static const struct of_device_id rockchip_dfi_id_match[] = {
> @@ -885,8 +906,12 @@ static int rockchip_dfi_probe(struct platform_device *pdev)
>  		for (i = 0; i < dfi->variant->num_clks; i++)
>  			dfi->clocks[i].id = dfi->variant->clk_names[i];
>  
> -		ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
> -					dfi->clocks);
> +		if (dfi->variant->clocks_optional)
> +			ret = devm_clk_bulk_get_optional(dev, dfi->variant->num_clks,
> +							 dfi->clocks);
> +		else
> +			ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
> +						dfi->clocks);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to get clocks\n");
>  	}
> 


-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
