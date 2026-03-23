Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71614316197
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774247474; cv=none; b=qEfHc76/ecB4fqrxq/rWzC7rJqSRbkXyrmauhOXUc4DFaDqitqeTiWu0ZvuMmCQ6KzryDCDMLg15jCDonP4gIF9Los51f2OUAg3oDZCUplgWxTXkqEihAUmRsasnKqcspfYZHizvwPt0rDRGO9Y8bVnHKOz2mufjftCfxPwO0iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774247474; c=relaxed/simple;
	bh=dvhEk3O+a2ERwLtOA0cX9p85UC+OOoWreUsEp4G31h4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0ULM5RHvDuPKe1HCkj7CPeLQrfyhL84ox9xTz2j1oz4KWj0aKV4PNei+teeVZbOc02iDNi7bGHlCkbHq2ikmySKcyfTzBE58M+sqBjvz0ogo+phuDT1ICAsdBKdvqZ13ljgqIC+mv68WKcZiRz6EKr6IIsZhr0qgW9MfHiuQgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3VU6Z7A; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3VU6Z7A"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c742723c863so2299081a12.0
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 23:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774247470; x=1774852270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uJOOsx893BHAo1XKwzCoPb5W2B/EQDBZpSJL6AVlTw=;
        b=U3VU6Z7AH8eqwIs3UJ9Xyv7pq07tCbNbdiNXaGZAV9u8U3iWGPGAOT5Pn4DcNShVMc
         TOivh6o9lKZfqOqzMyVickPdAh9uGWWqwgRLI6Mf5K1y8StPp5L5QdeYGDXXIQI3cKf8
         rFeGngvv4f7uDOAkJfDvPnHZS867bLPi1hezbezUnd+t7D6s3gRDfYBnPAWhCmh59l8U
         xoIyB67zx+EGXMOvVVzOovwGoZnS3LPEjlyEGoW4qKc0rW4f35vJazOL8zIzRcfVA8WC
         +zTXJcYrNfNLqQc8Z6/avayID7hSUD5nDmOXjmBZrES3GvEi1RXOw/1lm4r9CZW9eoNI
         4mPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774247470; x=1774852270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uJOOsx893BHAo1XKwzCoPb5W2B/EQDBZpSJL6AVlTw=;
        b=p/uhp60G15o7lQqyfCSaOUdbs9CcWLwYsllN4EUNdQqCrrcq5aotFIl4hq6QpJB8xE
         h7EbwHYCiIMDVBJyHRcoPEoF7pkIUeK8h/qVwwom/Zxrvogt1b8IMZn+waGfDhMDic1W
         CtxRPw8CoFSmFX5cjR+5StUYf6NpKbly/rIyibdMSI2YQVDFRlenV34FrniOO0rAsLke
         QREsHSXnytmMLpq6qJw9EqKHBuSKZVyrBXtG9t9anyMuBgLej/H0nA5m7sAtVcTEfY1a
         EuUjZCPV61SEjqieMGwaRxw7BTVUzf+Nb/WytZSZ92nSUdeeRQL1XxMrm3+Qheq8clop
         TS8A==
X-Forwarded-Encrypted: i=1; AJvYcCUHeRP9FeepVdsdwDnEi5YbiHhYQPBgj7htZfoyZTCrx8QIwQ8cZUSh0ZcmQxkrCSW887IoyJuDu+Oa@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhaY7M66HuYlnZaQKbRIVlOF2hsrWJJiwyDKkIwUF50Ha++zS
	jZHJFQVsx1QprpTlk9pA99N0mjcMpgVL39m+W+oSCRVnVMNXQpcvxyVS
X-Gm-Gg: ATEYQzzq8vZOpDmOfAQk5My0L4T9QLB48qRaHcGJjKiOayuANjT/xMTs9QqeXXorQbr
	zh9x2+pV1L8an3Wzkn9xtdw+NCUcrQP2xC9ct2TJBTeRNOjgXDCejGus+O8EjljpoyWPL5DsO6f
	s2V0c6tCmv8m+4k5GW8PFwUAU3tt1yik17e8iJpFe+8jcc4g7qSSORp0TuZMgZRm28B6dos8N63
	6OLTcoL85SofYDG/UE8ft2/OVxJt83jEB50y+mxKUHmcPFStnPUuRKqXOE1yc7bu4wc5GX91G3a
	HCS0LsT3qieCoamEUBMoXcsEV4h8o+jQ2jN3etEHgBk2/OG27dsnyfJgUbvv/dxhNqRhUVthFGh
	WQ+shTw2uUlOYtruAJz6zE58Q1+tFvhtkWZPflYoKJ0dXE5EllqjEy8DqHsjiV84uucfIVXgbEf
	WkLXEZMJ3WpOJuyVtrz9uUd+Q5+L/5/Tv+oJF9Vs1WdzrTZ3BckoD9cS5sBp3V4FKOu48L8Z7/f
	tph
X-Received: by 2002:a05:6a20:7f82:b0:398:919a:ddf5 with SMTP id adf61e73a8af0-39bce9e9efemr10260089637.24.1774247470439;
        Sun, 22 Mar 2026 23:31:10 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a938743sm6476741a12.19.2026.03.22.23.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:31:09 -0700 (PDT)
Message-ID: <e381ce59-c13d-4cb4-b0d3-70f15a500999@gmail.com>
Date: Mon, 23 Mar 2026 14:31:05 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v14,3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Simon Horman <horms@kernel.org>
Cc: richardcochran@gmail.com, devicetree@vger.kernel.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 netdev@vger.kernel.org, conor+dt@kernel.org, schung@nuvoton.com,
 linux-arm-kernel@lists.infradead.org, davem@davemloft.net, robh@kernel.org,
 yclu4@nuvoton.com, andrew@lunn.ch, mcoquelin.stm32@gmail.com,
 ychuang3@nuvoton.com, openbmc@lists.ozlabs.org, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com
References: <20260316055427.1310569-4-a0987203069@gmail.com>
 <20260318082346.1825390-1-horms@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260318082346.1825390-1-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/18/2026 4:23 PM, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
>
> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac
> driver.
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> [ ... ]
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> [ ... ]
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> @@ -0,0 +1,136 @@
> [ ... ]
>
>> +static int nvt_gmac_probe(struct platform_device *pdev)
>> +{
>> +	struct plat_stmmacenet_data *plat_dat;
>> +	struct stmmac_resources stmmac_res;
>> +	struct device *dev = &pdev->dev;
>> +	struct nvt_priv_data *priv;
>> +	int ret;
>> +
>> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get platform resources\n");
>> +
>> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>> +	if (IS_ERR(plat_dat))
>> +		return dev_err_probe(dev, PTR_ERR(plat_dat), "Failed to get platform data\n");
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
>> +
>> +	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
>> +							    1, &priv->macid);
>> +	if (IS_ERR(priv->regmap))
>> +		ret = dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
>> +
>> +	if (priv->macid > 1)
>> +		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>>                                                                                    ^^^^
> Does this code return the error on failure? The dev_err_probe() result is
> assigned to ret but the function continues execution without returning.
>
> Russell King's v12 review suggested using set_phy_intf_sel callback,
> which led to significant refactoring in v12. This refactoring appears to
> have inadvertently broken the error handling here and below.
>
> The code should be:
> 	if (IS_ERR(priv->regmap))
> 		return dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
>
> 	if (priv->macid > 1)
> 		return dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>
> See Russell's v12 review:
> https://lore.kernel.org/netdev/aYsurPBMnzWDZCco@shell.armlinux.org.uk/

Sorry for missing that, I'll fix it so that function properly returns 
failure.

Joey

>
>> +
>> +	plat_dat->bsp_priv = priv;
>> +	plat_dat->set_phy_intf_sel = nvt_set_phy_intf_sel;
>> +
>> +	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>> +}
> [ ... ]
