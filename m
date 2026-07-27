Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A73541D222
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167960; cv=none; b=scAlhcBoXxfrQ3b84Xr2bfwkJESO2/QMLBLoWx00TtwEKc9fBrY4dRYN+ptge6xVnhKORDDviChP1dCmzCvNESuA2eLGLbxfu7E03xurczjfov627XLfizYxXRaAP/h5SxOHvN9BoByhvxGXsmpd/iwqX47vUpkpyGfk0/foKks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167960; c=relaxed/simple;
	bh=VjifW9txhxaQBAgV96MRgmACnoHUuAqVgQr1JpvPe2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IAp3KHS/EQQLIm2dELDPtiITD/4k4M89137ZVl1skCyYjmlqytLFkUnCkeMXSdHeV6W3WYgj/z5Mf7T7UZFTwaKSXBc4akGWFEglIn1xl8iri1y2wwEsE7JFMPtSMUfFo+VrRxKQDOn4dt2a3JQdbYrnW+wnx6+lM7bKsR4aZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=xwlPYMKM; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="xwlPYMKM"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51bfa429aa6so397811cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1785167958; x=1785772758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cgAvhQ6oNgYOYLZzLZcfz/CHQcSlbrGmy4p7tJHhwhI=;
        b=xwlPYMKMvXu+YpvBnQu9M38XSIJ3n1Mca5CDyI5vrJYWBCOXrzueNg2Ng2t9Z5Zf6y
         pCCoX/JInsn5AX2oX5H2osRYlkBuFaqpeRFh8UoyQHu5KEcgLPvif1aB3xS2NwgMUEAw
         yq/LtknSMOlL7upJLcZw/Zj7CZNH9Qp7gK3tktikSpJTKNNrljSZoYDu4Zf0ZvWTW7pY
         HMw1CRD5QfdIYIJnZA/BEWxUyOvdKC5CsmXXkYLq4BvqqRw/nVCHz2t+jxzTkOPOFPUv
         2VmeUDB7St/hS73vYxN1NzJicx1TkK8M7zpChDDHRBPamfR5o9xlSNBBJ4w1ozhFwsUy
         hGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167958; x=1785772758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgAvhQ6oNgYOYLZzLZcfz/CHQcSlbrGmy4p7tJHhwhI=;
        b=tU/WL6GV/U5RYv9prETMvmTDqePl1uWxf4Ko5bAVK5yrEsp+GPp1jwgvK9zLgWpqD+
         GKIgkWYK32HoOVPbTmgb2V+eZA+QdqYW8zdLphlxwTyBccRjXgcPPUKgiXazYW/INkrd
         WZFXIj+aMN2QlpZK6gFhsqsYgc3hGltbq2+uVVhae/+03ykJGyj5xJxA8rV4T9qzuZGn
         SSlH2HlxHoMeKsKKES7+jxBnnKL3aRdeo+uB2TNLWQIARLpFEdSXAGv1WbTNnyTUYD6t
         3TswAB7mZYJOwnXfP69Ipmoj8PAHohHj/hy5ax054OpGJ7itfU5DFfDk7gX+Idm2M9NG
         a+qw==
X-Forwarded-Encrypted: i=1; AHgh+RrJ+bOvIrxsio7ip2+tP8xPf7vpzsY3oCOspfnxEX6NG//RF/AhyPRrS6MbWC7Erg6bVWKty+hXzNJ6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2neZWB3WonaIfD7SI4DdfvbHMUnqeK05a1qC3OKTi1y33ILf
	L6bG3ptaxJiCx9rsGBpcPqhm9YJ/LK54NJKm6ATiaF9LVvWUFpCIPpnLo7AcEFwzXew=
X-Gm-Gg: AR+sD11GkjtUKGh2ozitb489fZOJ9EfmMFOXKJay1ATTv2pkmJ3wYwZ++87T2vIki5N
	w1yR7wFM0+LnGFUiQBepfpzM4A8Q1vX+VKQl4VLndbYM0+NkkTzGvNrzRBSvCCY7RBIAcw+haRH
	bpqgA4J8HtpvB2w3ImfoppDInxH5W2ehRGDcqPb41WuOg8qw9UZ4plJVH8QjXRF7mIxYVd/sFdg
	gBPsQLX6EGcBG9GpPPD7mq3AQSabcS/4+lgfMtM5zLXkRpy17i0hanpESEjaePvQSKq3dOraADt
	AFBbffC/wgCc8PXIdK11HS/Ba0W5VUOEuBhJ7iLpmcTtpoWJgKYH3P7bbsxfjbv9YLeSZKpYbgl
	m/0oZktTezxXyUMAErdiU8kfBN8AcOjnh43lsjaj17PkWTVmkP1EU9MzEBaXc/XBQjJWGUbk4p0
	z82g==
X-Received: by 2002:a05:622a:1314:b0:516:35fe:5524 with SMTP id d75a77b69052e-529d1dc4a90mr277321cf.5.1785167958098;
        Mon, 27 Jul 2026 08:59:18 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a262fa9dsm56944561cf.0.2026.07.27.08.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:59:17 -0700 (PDT)
Message-ID: <401210ae-e256-4458-a1f0-a1dec711c005@riscstar.com>
Date: Mon, 27 Jul 2026 10:59:17 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] PCI/pwrctrl: tc9563: Move Integrated MAC Endpoint out
 of 'tc9563_pwrctrl_ports' enum
To: manivannan.sadhasivam@oss.qualcomm.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260725-tc9563-fix-v1-0-ec4286e31331@oss.qualcomm.com>
 <20260725-tc9563-fix-v1-6-ec4286e31331@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260725-tc9563-fix-v1-6-ec4286e31331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/25/26 3:59 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> 'tc9563_pwrctrl_ports' is supposed to list only the internal ports of the
> switch. But it currently lists the integrated MAC Endpoint as well, which
> is wrong.
> 
> Hence, move it to a separate 'ep_cfg' struct and also configure/parse the
> ports and the MAC Endpoint separately.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

I like this.  It cleans up some things I was going to suggest myself
at some point.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 96 ++++++++++++++++++++------------
>   1 file changed, 60 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> index f1179737f221..9d869483b6b3 100644
> --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> @@ -81,7 +81,6 @@ enum tc9563_pwrctrl_ports {
>   	TC9563_DSP1,
>   	TC9563_DSP2,
>   	TC9563_VDSP,
> -	TC9563_ETHERNET,
>   	TC9563_MAX
>   };
>   
> @@ -109,6 +108,7 @@ struct tc9563_pwrctrl {
>   	struct pci_pwrctrl pwrctrl;
>   	struct regulator_bulk_data supplies[TC9563_PWRCTL_MAX_SUPPLY];
>   	struct tc9563_pwrctrl_cfg cfg[TC9563_MAX];
> +	struct tc9563_pwrctrl_cfg ep_cfg;

maybe something with "eth" in the name?

>   	struct gpio_desc *reset_gpio;
>   	struct i2c_adapter *adapter;
>   	struct i2c_client *client;
> @@ -263,11 +263,11 @@ static int tc9563_pwrctrl_disable_port(struct tc9563_pwrctrl *tc9563,
>   					     ARRAY_SIZE(common_pwroff_seq));
>   }
>   
> -static int tc9563_pwrctrl_set_l0s_l1_entry_delay(struct tc9563_pwrctrl *tc9563,
> -						 enum tc9563_pwrctrl_ports port,
> -						 bool is_l1, u32 ns)
> +static int tc9563_pwrctrl_set_port_l0s_l1_entry_delay(struct tc9563_pwrctrl *tc9563,
> +						      enum tc9563_pwrctrl_ports port,
> +						      bool is_l1, u32 ns)
>   {
> -	u32 rd_val, units;
> +	u32 units;
>   	int ret;
>   
>   	if (ns < TC9563_L0S_L1_DELAY_UNIT_NS)
> @@ -276,25 +276,6 @@ static int tc9563_pwrctrl_set_l0s_l1_entry_delay(struct tc9563_pwrctrl *tc9563,
>   	/* convert to units of 256ns */
>   	units = ns / TC9563_L0S_L1_DELAY_UNIT_NS;
>   
> -	if (port == TC9563_ETHERNET) {
> -		ret = tc9563_pwrctrl_i2c_read(tc9563->client,
> -					      TC9563_EMBEDDED_ETH_DELAY,
> -					      &rd_val);
> -		if (ret)
> -			return ret;
> -
> -		if (is_l1)
> -			rd_val = u32_replace_bits(rd_val, units,
> -						  TC9563_ETH_L1_DELAY_MASK);
> -		else
> -			rd_val = u32_replace_bits(rd_val, units,
> -						  TC9563_ETH_L0S_DELAY_MASK);
> -
> -		return tc9563_pwrctrl_i2c_write(tc9563->client,
> -						TC9563_EMBEDDED_ETH_DELAY,
> -						rd_val);
> -	}
> -
>   	ret = tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_PORT_SELECT,
>   				       BIT(port));
>   	if (ret)
> @@ -305,6 +286,34 @@ static int tc9563_pwrctrl_set_l0s_l1_entry_delay(struct tc9563_pwrctrl *tc9563,
>   			units);
>   }
>   
> +static int tc9563_pwrctrl_set_eth_l0s_l1_entry_delay(struct tc9563_pwrctrl *tc9563,
> +						     bool is_l1, u32 ns)
> +{
> +	u32 rd_val, units;
> +	int ret;
> +
> +	if (ns < TC9563_L0S_L1_DELAY_UNIT_NS)
> +		return 0;
> +
> +	/* convert to units of 256ns */
> +	units = ns / TC9563_L0S_L1_DELAY_UNIT_NS;
> +
> +	ret = tc9563_pwrctrl_i2c_read(tc9563->client, TC9563_EMBEDDED_ETH_DELAY,
> +				      &rd_val);
> +	if (ret)
> +		return ret;
> +
> +	if (is_l1)
> +		rd_val = u32_replace_bits(rd_val, units,
> +					  TC9563_ETH_L1_DELAY_MASK);
> +	else
> +		rd_val = u32_replace_bits(rd_val, units,
> +					  TC9563_ETH_L0S_DELAY_MASK);
> +
> +	return tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_EMBEDDED_ETH_DELAY,
> +					rd_val);
> +}
> +
>   static int tc9563_pwrctrl_set_tx_amplitude(struct tc9563_pwrctrl *tc9563,
>   					   enum tc9563_pwrctrl_ports port)
>   {
> @@ -430,11 +439,9 @@ static int tc9563_pwrctrl_assert_deassert_reset(struct tc9563_pwrctrl *tc9563,
>   	return tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_RESET_GPIO, val);
>   }
>   
> -static int tc9563_pwrctrl_parse_device_dt(struct tc9563_pwrctrl *tc9563,
> -					  struct device_node *node,
> -					  enum tc9563_pwrctrl_ports port)
> +static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
> +					  struct tc9563_pwrctrl_cfg *cfg)
>   {
> -	struct tc9563_pwrctrl_cfg *cfg = &tc9563->cfg[port];
>   	int ret;
>   
>   	/* Disable port if the status of the port is disabled. */
> @@ -505,13 +512,13 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
>   			goto power_off;
>   		}
>   
> -		ret = tc9563_pwrctrl_set_l0s_l1_entry_delay(tc9563, i, false, cfg->l0s_delay);
> +		ret = tc9563_pwrctrl_set_port_l0s_l1_entry_delay(tc9563, i, false, cfg->l0s_delay);
>   		if (ret) {
>   			dev_err(dev, "Setting L0s entry delay failed\n");
>   			goto power_off;
>   		}
>   
> -		ret = tc9563_pwrctrl_set_l0s_l1_entry_delay(tc9563, i, true, cfg->l1_delay);
> +		ret = tc9563_pwrctrl_set_port_l0s_l1_entry_delay(tc9563, i, true, cfg->l1_delay);
>   		if (ret) {
>   			dev_err(dev, "Setting L1 entry delay failed\n");
>   			goto power_off;
> @@ -536,6 +543,21 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
>   		}
>   	}
>   
> +	/* Configure the integrated Ethernet MAC endpoint */
> +	ret = tc9563_pwrctrl_set_eth_l0s_l1_entry_delay(tc9563, false,
> +							tc9563->ep_cfg.l0s_delay);
> +	if (ret) {
> +		dev_err(dev, "Setting Ethernet L0s entry delay failed\n");
> +		goto power_off;
> +	}
> +
> +	ret = tc9563_pwrctrl_set_eth_l0s_l1_entry_delay(tc9563, true,
> +							tc9563->ep_cfg.l1_delay);
> +	if (ret) {
> +		dev_err(dev, "Setting Ethernet L1 entry delay failed\n");
> +		goto power_off;
> +	}
> +
>   	ret = tc9563_pwrctrl_assert_deassert_reset(tc9563, true);
>   	if (!ret)
>   		return 0;
> @@ -593,8 +615,7 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
>   
>   	pci_pwrctrl_init(&tc9563->pwrctrl, dev);
>   
> -	port = TC9563_USP;
> -	ret = tc9563_pwrctrl_parse_device_dt(tc9563, node, port);
> +	ret = tc9563_pwrctrl_parse_device_dt(node, &tc9563->cfg[TC9563_USP]);
>   	if (ret) {
>   		dev_err(dev, "failed to parse device tree properties: %d\n", ret);
>   		goto remove_i2c;
> @@ -605,9 +626,12 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
>   	 * The first node represents DSP1, the second node represents DSP2,
>   	 * and so on.
>   	 */
> +	port = TC9563_USP;
>   	for_each_child_of_node_scoped(node, child) {
> -		port++;
> -		ret = tc9563_pwrctrl_parse_device_dt(tc9563, child, port);
> +		if (++port >= TC9563_MAX)
> +			break;
> +
> +		ret = tc9563_pwrctrl_parse_device_dt(child, &tc9563->cfg[port]);
>   		if (ret)
>   			break;
>   
> @@ -619,8 +643,8 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
>   			struct device_node *eth __free(device_node) =
>   					of_get_next_available_child(child, NULL);
>   			if (eth) {
> -				ret = tc9563_pwrctrl_parse_device_dt(tc9563,
> -								eth, TC9563_ETHERNET);
> +				ret = tc9563_pwrctrl_parse_device_dt(eth,
> +							&tc9563->ep_cfg);
>   				if (ret)
>   					break;
>   			}
> 

