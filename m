Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C8C48E0FA
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045620; cv=none; b=u9arql5tanQYisU/Gp5TCm3zoLpTrFJjvLlUhooP5N0WzN/p0KuvdRF+OyU0pD0tMgJubAtJvndm7Hk8pps+zxPX16HkmRN+GYVUN8ZTFlPPafQHuu66BiyzO4JQF091OQ44WFxKGxSDTLiUswGJ8lij8Hc8oDVIPykly8UuXvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045620; c=relaxed/simple;
	bh=j++54T3sUZ+8HaFYRaDy0ZlOlzbDf1s23ZOYnPY0yUI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZVzW5o4i8ggKo3KwL/OOALU7uUVuchPnixbwHArQ3pVk80yznQu2ccxAunUPozW9lWKCz2DfJw+zYdm+B0zwFSVkYrUfAAgsNZjieU8zBre3Kf+/+X28cZTPlt4nItY34pfkeVsXowkBOfe426j1DEwjzkqpjth1oDE+Qt8/n/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fgAJpA13; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fgAJpA13"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so1262011f8f.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789045613; x=1789650413; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s417j/ysygJZ4xE0jMBISIxl2zgVW4JEiLwZ40hycxA=;
        b=fgAJpA13geelJvMo236lMup0m+UVq79aH2cHRkifKGekwSlg2wdMqhwx8yEcs3jubI
         aQiLDugU7Ybtc1d+a3nPPlP7Ki2LO2ZJ1DKlWPRrEMv/FAlatVpC6jcnloRTz6vUrP+D
         3ERhtVyC2o/FMu/xpKpuJVOQEqspvxCJqJqOiU1K89CJrcllk65/4xHuYq4SZRSgvUwD
         LDvKt8NwjMkLhS5J+JRBZyPrmGuCOxo5EnMlQhFn0oFg5Q6LAkz9ZE5etDNqkM2Qfwvg
         n2BV/u4h9ry1oVUXq/xsc217Cm+9j++B9s8Ln20p5/Xh+8dlEt1IoOQhuIuJGJPUrxGl
         SEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045613; x=1789650413;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s417j/ysygJZ4xE0jMBISIxl2zgVW4JEiLwZ40hycxA=;
        b=OyRgOghUCXC2m3FDKWr5D/dsyjqT8/Nh2y8x+Yc4swvQhEuVuAKitxrbuhwEt6wJoZ
         3IDrxQB5gABM9vZ+QI7IrN3J6wnMqr6k7NYlvUxTjQySdV8XiPK4PMEhK88O70NLX0n4
         cEqhpKx84U8omZCvmO2fgSWl9nBE68jLWi0cNMnYZbBXAM/yYdMSSx1WaDzN36TjGKQz
         jj0gzi3YGm3pWVqZs6/tGNKseuxOTUTt6T0omwHjjfGtuCsXyrvy96aA1nEKFw2JTywb
         xAYnymM6S4Se5RHZd8emKXY2TDI1jRUQ0TiNIFbs4bDAlQsQTveRO+90PifqRZTjC6ro
         dFZw==
X-Forwarded-Encrypted: i=1; AKwUvBwBhdwYy+KMhcBtjgs9/IEWKVGpQr+956QHBKsBwH9STF5zN+5X0FkQKpDoIJykdKlRl56szQn/3HBy@vger.kernel.org
X-Gm-Message-State: AFuF++m0S1z+eZEB1OQn0KTHfUE9lnQtYLX7uJmfXXRrYJas1u9WS/Or
	scUKdzOAaO6oE0TYz6Kx25oOO16eutee5irobtg33NNdyCmhMuyIti7H5FSjOBIP3WY=
X-Gm-Gg: AYBFou1g1S2VFHldjrSoltJEA/8WQP9RDfCLPFnxVnsvFVP3U3cPBf7xNbVrVtGwIzG
	SwLFJpf77lSJdwldby8UVgix5lAR51mkOesaE9UT807EfCk79ekSzqH+MTyEXhBfKehO1+lFisV
	EpU9tZy0ZSSJea1+KSV+an7BF5dOqhWkmPMh2UxVoldfnLbjIKbwp8+QQFibcz+fCmzT1Kodwie
	EmcduLLfhK9WJ8eeImEBD0E4z9p3xtpGzoxqBYkahYYxtqiaGSiFOXuYCW8zujFWOH6UwXRBfrn
	b2Ytx1RM0/aHBVXpvQMyO8U1mZyAzhdPxdlaNhRMfmesrvTkI2ZncdLYaBC1NZUaruTFzjgFpUE
	HuqOzCjnVcURX5y/NR/IP+sbG69qzr+Jeh8ujQlTQhHi09mZpprimcxyd3PxjmKLJqnV/mPjxc+
	1C2L/A3iN/g/9yJm7VE8B9lRw2ZrJRPbr03epKMpe59Ehc2C86d5ypl46kPF+N0Cr63S11UmGMC
	XWqde0at/wmCPAa4uJ5h+SDZvxG
X-Received: by 2002:a05:6000:22c8:b0:484:3310:710d with SMTP id ffacd0b85a97d-485aae0e29amr22786196f8f.25.1789045613146;
        Thu, 10 Sep 2026 06:06:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm44969402f8f.2.2026.09.10.06.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:06:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Richard Cochran
 <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add support for Allwinner
 A733 GMAC210
In-Reply-To: <44d7840d-0cde-4022-937c-4c630398c45d@bootlin.com>
References: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
 <20260910-allwinner-a733-gmac-support-v2-2-4f4a1e520c23@baylibre.com>
 <44d7840d-0cde-4022-937c-4c630398c45d@bootlin.com>
Date: Thu, 10 Sep 2026 15:06:51 +0200
Message-ID: <1jqzj16ys4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 10 sept. 2026 at 12:59, Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Hi Jerome,
>
> On 9/10/26 12:25, Jerome Brunet wrote:
>> The A733 GMAC210 is a DesignWare MAC 5.20 using an Allwinner glue close to
>> the A523 GMAC200 already supported by this driver, with the following
>> differences to handle:
>> 
>> * The glue configuration registers are a dedicated MMIO region of the
>>   controller instead of a syscon register. This new register region
>>   appears to be in the reset domain of stmmac's main reset. This requires
>>   the glue driver to handle the reset rather than letting stmmac deal with
>>   it.
>> * The TX clock delay value is 5 bits wide, split over 2 register fields,
>>   allowing delays up to 3100ps.
>> * The DMA channels have their own interrupt lines, so the per-DMA-channel
>>   interrupt mode is enabled, as the vendor SDK does.
>> * TX LPI clock gating is supported, as the vendor SDK indicates. Follow
>>   the PHY capability with STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP rather than
>>   forcing it on with the deprecated 'snps,en-tx-lpi-clockgating' DT
>>   property.
>> 
>> Unlike the A523, both GMAC instances are supported by the same driver.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> [...]
>
>> +
>> +static struct regmap *sun60i_gmac210_get_regmap(struct platform_device *pdev,
>> +						struct plat_stmmacenet_data *plat)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	void __iomem *base;
>> +	int ret;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 1);
>> +	if (IS_ERR(base)) {
>> +		dev_err_probe(dev, PTR_ERR(base), "unable to get glue memory region\n");
>> +		return ERR_CAST(base);
>> +	}
>> +
>> +	if (!plat->stmmac_rst || !plat->stmmac_ahb_rst) {
>
> Why check stmmac_ahb_rst, but not do anything with it ?

Not strictly required, it was cheap to do and catch mis-configuration
since the stmmac treat them as optional. I'll drop it

>
>> +		dev_err(dev, "missing required reset controls\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	/*
>> +	 * The configuration registers are inside the controller
>> +	 * reset domain, so the reset must happen before any write to them
>> +	 * and should not be done again by stmmac or the configuration will
>> +	 * be lost.
>> +	 */
>> +	ret = reset_control_assert(plat->stmmac_rst);
>> +	if (!ret)
>> +		ret = reset_control_deassert(plat->stmmac_rst);
>> +
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "device reset failed\n");
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, sun60i_gmac210_reset_assert,
>> +				       plat->stmmac_rst);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	plat->stmmac_rst = NULL;
>> +
>> +	return devm_regmap_init_mmio(&pdev->dev, base, &sun60i_a733_regmap_cfg);
>
> I wonder if this is the first glue to face this...
>
> If you need further setup to be done after reset has been deasserted, I suggest
> adding a dedicated callback in plat_stmmacenet_data, instead of doing this behind
> the generic code's back.
>
> maybe something like "post_reset_init()", something like that ?
>

I'll check in this direction.

The idea was to do things behind anything's back, more to handle the
specifities of this SoC without polluting the rest. The timing seemed a
bit sensitve. For example touching the other reset in here broke the
link for some reason (recognize as GMII instead of RGMII)

> the ->mac_setup already runs after reset, but isn't really for this type of usecase.
>
> For readability of the patch, maybe you should split this patch to first do the
> a523 rework, then add a733 support.

ok

>
> Thanks !
>
> Maxime

-- 
Jerome
