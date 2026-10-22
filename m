Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690643;
	b=s/wQPZ8vmHbDcg16hmiJXMjgjd6EgnPbQns6GC/+jzCODTo2gV1KvDbmcV0OVflQBel8
	 eTy+xYNA+wGbrDn6zZEOvOTR4BDL2vhYGviebKH1H64VnBlGqQ7nkmA6h0HuQDIlryYdR
	 QKvEfM8U627gtMP2vEu4GHq0HwpCLXaLwk+np5BQdWf1GSolcHn56nzmuSvm18gqx10s+
	 7PfQBxYw40Ubt1K8HJfqBBRbkUAiC21XDi+sIRFnVbTYbpXT2fdf0H2ZDSTSYriwJV8f/
	 d2eT8hm9g9G4Bdwhz5cr08vix2Qm+Ycwic/vJTWGDb2FVJtDCmjGKVM5+gF6OSk5opw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690643;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=90PpyRvqw50zWmq9+jh1atWjcGYKGRTrDoZ7I20u5a0=;
	b=hKcR8z+XjZey33nu+xBffswPXkMKKDxukrFOKSiB0bJby1DhR7RUjneHJooPam+jU0s/
	 QOVelPRBjXjHhRfT7rSmsbY8WI+E4amttMB5SWMvPNf65MQdTjwGOJ9v46MMFobvQU52j
	 dnkS3hQZSPS52pk+/pHvcJolDjXJyS+duBUVWPIbBXdUawlu9NWmkJ0I9hlPAdPrguEtW
	 P+JIiQqynbKjwzp0TPVJBcZB2m6kCmWW3QwRj5qVQwXYyXY/yut9hi4qXPvyKb0qDO8DV
	 D7A3Gkii6Yi1vq81iDWaF7JXcmNZkPHmpCGBCJCzOtvAmSyyLgMmOtSgp6xayRwLuRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA5B606A32E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA5B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df54150dfso31323f8f.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690641; x=1793295441;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90PpyRvqw50zWmq9+jh1atWjcGYKGRTrDoZ7I20u5a0=;
        b=HwSjqKKnrWAmvR8BRoAIFvrRfuTwkZlvBxb5C638qINnU0YxLYsAFGgaZFrIgTn/8w
         Dc3JgxYqOyeyY7zVSddibk05RweJi2esKKE0DdCmGYRU0GB44CTNNNkA+w1HVyJSxRVu
         hiq5gxMDDiN1DmSAlGoVdsOV4I8xM7NBfZmGR0VCaA1QmarDBM7KmTeOI7eOQnXI6zop
         TkHPF+zle8BmyDL64C9KI79/l36unX1eNrfSAP+MqJX4SEQDmfJvhjt2egyhjpjJcCaS
         FvhKk1nejfAe4utsuMd7qtXU4Zf690TGMoq/A1DnLwgaEQ8ZETQ0xxYYz0XfTgWsiGoO
         mwvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTCGBvWd4x+LnnAk0Ok2yjb+wMeohLBBxw0ajzQYlGDPGqttPRkt1i2sXLmmeE7TTjv7/vz7kGwl/t@vger.kernel.org
X-Gm-Message-State: AFq9FYIw2S2CA57xsyNC31xk3QBIhsl+5g908uz9IdOMQfUFIb4MRdBz
	zZUg5Lxhw4dWbw0z6E4Y9IrNnCVttNTNMg9LS6p6bzvksg042arwOXyw
X-Gm-Gg: AYBFou0p1c+o8gYAgh8Po5c+6GETgPtfSTlJDpbfvSuKY5IBqDZj8Y1ahjMuiyZzeS9
	KJv8eqbiXyMahOIKgjNOLhNIjVa+1qlHCEsMCBYB9yC3UNX3gQctl1pI/RiWQyp4J9t1VvvRTgq
	K9VAzElTChUuKDqav2BwXKcejaQhAGaEblEbsDg1oArZdqxy1vD4ueI5mBmpiJx+FcU3cSmDonh
	xDHKPJzOWqLv178JXJ1j+T7ldWcsXYpbkXf380v0r4bIrw6xpPBGsLb+CHcSjl5c2utA9yMCx31
	++NXza1/g/p1atO8U04Esmtk7vdxUj5aDnt1szZIIQ+Z7xK7wgxd/sWYaOnhwCpD8QU+pq2xPAp
	4/IIOp205+1GZm2tVu9dV/Kr5kQmFmrZsTAIkt3Ik6cP3/fyiloubb8x31VltB+iXuiBwwhPcHG
	Z8xdiGB2siWxqW5QS7i0fUM+k3pPX4WvoWn7eM3mFeMOo6TTw7NVljasD1ghNqd0ZYKr0UcXAtl
	CB77QMA7GJPnB5MxQZnBUQfqfandbjt+FWHsZOGFwvyUvtpqnDhKujQ/m1LwtUDqgJWT/8087qm
	ZIatbqCEoo51141kQYPzHi5zwWP4VLyE
X-Received: by 2002:a05:6000:4e:b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-48e264f2be7mr9021652f8f.35.1792690640831;
        Thu, 22 Oct 2026 10:37:20 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm13391825f8f.1.2026.10.22.10.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:37:20 -0700 (PDT)
Message-ID: <00b94eed-fe1b-4cf3-a4ed-12813faacb86@linux.com>
Date: Thu, 22 Oct 2026 18:37:19 +0100
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
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-5-tanure@linux.com>
 <a1c0b76b-7b67-43e9-af15-3139f17d7fe7@lunn.ch>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <a1c0b76b-7b67-43e9-af15-3139f17d7fe7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 13:30, Andrew Lunn wrote:
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> @@ -82,6 +82,7 @@ struct meson8b_dwmac_data {
>>   	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
>>   	bool has_prg_eth1_rgmii_rx_delay;
>>   	bool has_pipeline_clk;
>> +	bool mac_applies_dt_delays;
> 
> Please can you invert this and call it broken delays.
> 
> We should make it clear that new devices should not set this, because
> it wrong, broken.

Moved to a function for T7. And the previous SoCs have their own 
function which gets a comment that new SoCs must not use it.

> 
>> +static int meson_dwmac_init_dt_delays(struct meson8b_dwmac *dwmac,
>> +				      struct plat_stmmacenet_data *plat_dat)
>> +{
>> +	struct device_node *np = dwmac->dev->of_node;
>> +	u32 tx_delay_ps = 0, rx_delay_ps = 0;
>> +	phy_interface_t phy_mode;
>> +	bool mac_tx, mac_rx;
>> +
>> +	mac_tx = !of_property_read_u32(np, "tx-internal-delay-ps", &tx_delay_ps);
>> +	mac_rx = !of_property_read_u32(np, "rx-internal-delay-ps", &rx_delay_ps);
>> +
>> +	/* one step is a quarter of the RGMII clock period, 2ns at 1Gbit/s */
>> +	if (tx_delay_ps > 6000 || tx_delay_ps % 2000)
>> +		return dev_err_probe(dwmac->dev, -EINVAL,
>> +				     "The RGMII TX delay must be 0, 2000, 4000 or 6000ps\n");
> 
> tx-internal-delay is not listed in amlogic,meson-dwmac.yaml. Please
> could you add it, and list the valid values.
Patch 2 of this series adds it to the T7 block with the valid values.
That changes in v4, see below.
> 
> Do you have access to the datasheet? Could you check these numbers are
> correct, because they are larger than typical. 4ns, and 6ns makes no
> sense, the RGMII standard only calls for 2ns.

Yes. The field is not a delay line. It selects the phase of the TX
clock sent to the PHY: 0, 1/4, 1/2 or 3/4 of the clock period. At
1Gbit/s that is 0, 2, 4 or 6ns, which is where the numbers come from
(the existing amlogic,tx-delay-ns property lists the same four). Only
1/4 is a usable RGMII delay; 1/2 is an inverted clock and 3/4 is a 2ns
lead. And since it is a fraction of the period, the 2ns is only true at
1Gbit/s, at 100Mbit/s the same setting is 10ns. I agree 4000 and 6000
make no sense.

> 
>> +
>> +	/* the RX delay line moves in 200ps steps and reaches 3000ps */
>> +	if (rx_delay_ps > 3000 || rx_delay_ps % 200)
>> +		return dev_err_probe(dwmac->dev, -EINVAL,
>> +				     "The RGMII RX delay range is 0..3000ps in 200ps steps\n");
> 
> Please could you listing these values in the binding.
> 
> Also, mark that amlogic,tx-delay-ns & amlogic,rx-delay-ns are not
> valid for this compatible.
The RX values are in patch 2 as well, the T7 shares the G12A list
(0..3000ps in 200ps steps); v4 drops the 0. The two vendor properties
are already rejected for the T7: they are only defined for the older
compatibles and the schema has unevaluatedProperties: false. v4 adds an
explicit "false" for both in the T7 block so that it is visible.
> 
>> +
>> +	phy_mode = phy_fix_phy_mode_for_mac_delays(dwmac->phy_mode, mac_tx,
>> +						   mac_rx);
> 
> This is not correct. This function assumes mac_tx and mac_rx are
> Boolean values, the MAC is applying the full 2ns delay. However, if
> rx-internal-delay-ps is only providing 200ps, that is not true.
> 
> I would prefer you keep to the usual way of doing things. Allow the
> MAC to apply small tuning delays, but have the PHY do the 2ns. So
> don't make any modification to phy-mode.
> 

OK. v4 does not touch phy-mode. rx-internal-delay-ps becomes the tuning
the MAC adds on top, 200..3000ps. On the TX side the T7 has nothing
small to offer, the only step is the 2ns phase, so v4 does not accept
tx-internal-delay-ps on the T7 at all, in the binding and in the
driver. The VIM4 then uses plain rgmii-id with the PHY adding both
delays. That also removes the wrong claim in patch 7 that the RTL8211F
TX delay does not work; the real cause was a bootloader value left in
the glue register, details in my reply to Martin on patch 7.
>>   static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>>   {
>>   	u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
>> @@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>>   	dwmac->dev = &pdev->dev;
>>   	dwmac->phy_mode = plat_dat->phy_interface;
>>   
>> -	/* use 2ns as fallback since this value was previously hardcoded */
>> -	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
>> -				 &dwmac->tx_delay_ns))
>> -		dwmac->tx_delay_ns = 2;
>> -
>> -	/* RX delay defaults to 0ps since this is what many boards use */
>> -	if (of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
>> -				 &dwmac->rx_delay_ps)) {
>> -		if (!of_property_read_u32(pdev->dev.of_node,
>> -					  "amlogic,rx-delay-ns",
>> -					  &dwmac->rx_delay_ps))
>> -			/* convert ns to ps */
>> -			dwmac->rx_delay_ps *= 1000;
>> -	}
>> -
>> -	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
>> -		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
>> -			dev_err(dwmac->dev,
>> -				"The RGMII RX delay range is 0..3000ps in 200ps steps");
>> -			return -EINVAL;
>> +	if (!dwmac->data->mac_applies_dt_delays) {
> 
> I suggest you do this at a higher level. Either call this function if
> _broken_delay is set, or the other one.

Done through the callback. Probe makes one call, and the parsing of the
vendor properties moves into the older function.
> 
> 	Andrew

