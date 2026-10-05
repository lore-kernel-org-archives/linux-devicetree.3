Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1374A3D4C
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210457; cv=none; b=gmdkivaC9TQ1d0yIwHcQFm2zrN97+vq1mq1oVtSM1YOq+TFJ/w/9rsHdSfQGx6nFDKgaRtXUJ6DmrCD3LbV3TwyxMithrD6exL+V4Btf5RSLPtXCgsRMDnJshScSY5cX0/SqPY9f5yh9qcfGF9Ro+p2m4U/Dd4WKaLBRpRSlGMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210457; c=relaxed/simple;
	bh=LKIv1FQQ/v9R/VOeLxaZRviVoQyQLJNygimijdeFGuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Km2Xt9jkVFVKRLaVbNsokSG5SlThcvKaJsUWu037FxmelU1imsFBqofmG/QLyjp3EJcNQmmIx6t082p6Pn+rgsj7DVONoV2gUUliQAAlxX5Tvpn2BjD1Xk+Q6qz8HmW/JRe9TmcS0rrxirpeUrx2FHlCOT9wdNXk7yVRReeC3eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oITD0pLb; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oITD0pLb"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so632813f8f.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 07:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791210446; x=1791815246; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFCT6IFa2ZNIfavrcCDeEnFfs6vajTT7X77aoSeAYNs=;
        b=oITD0pLbZFZAk6DQvCU528QFLjY2V5uMen2S2qQbiKMulIf4jaAHx9/O+YfoefWi/y
         BKh9AoaDdGFflBYKc4eGlAEkTikVa84NVWi/LVs1lXfWD11Ju76i8xJPB8F+5o54unFx
         pQmKLgXUHYaaXnNAoxydKkQGJtVRsqzwYyFmFDgE8EHsiF+eQwpSZgGPjrVStwC1vRAY
         H98MVDSQw4zHmAkKLlUYfvoZXN2ftHYAJ1NOh/zs9swtAZFdOVBBumxTC6fZWVKnYzyt
         vvrpuwzIzqZtB/FLgWa9HWooRD2m5nIpWns/YoRN0HplOiGHduZKz46KZqn8IK9S0b8I
         cFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791210446; x=1791815246;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vFCT6IFa2ZNIfavrcCDeEnFfs6vajTT7X77aoSeAYNs=;
        b=TXVwDdlNLtv1aWhLnu1VSttcScubHy/UO7Xw01IqPuDxwv4baaqtjrP84jmb7lQ0tK
         QB2AD/KClQSVfwveEqVR0dalVJVp0Xh+554RSAH+fgDGQxKqKfQrKGRnE9YDWPHrcAnc
         t3NgI46Tzu3+Lrl2ZLDyIGwwsBsR3XR7ULb7aXjGyHKTVyplIaCW3isyAJqF25OH1rCP
         CXqkKuFxMek1w/0Ig1EQ3Qu0YtVwDkiz8p31Xp6g2JPCVRC/19qlucUzC6bpeIogPB42
         V/3i1Y5QHCOeC/9UDM2CzKiL8t/JJu7pGA9il5kks79HbbAN/CN52kNUBc29fh8DNyas
         gkKA==
X-Forwarded-Encrypted: i=1; AKwUvBwhxgSGAM2v76d/OG+8w4e+M9iTTBuHgspWYjX9CrK7Xjsfs6PlYNNaVUv2P4VwznCrJ7u+geBLeise@vger.kernel.org
X-Gm-Message-State: AFuF++lQYhzl+O5ZBLNeKhkyuHCZVN4bZge44Gmwqz37sjfJSRjnHG5Y
	Fclg4aPIL0ZsAkxN1ahvbVaSGw2BU8Ul1DuZ57dlOLSHvb7DhnxRbzEJG6x2AOYtUN0=
X-Gm-Gg: AYBFou1DUpkbx3ruAJ7RflXINxCPhIWGP4nB2WqmpuJCuSh1M53ChztpzQoLZmhhqwg
	Jwio5yTH6T3y/G1KzizH9UOvPM7CQBcQEY5oK53iBLEotWTDvLgfMF3+tTeLUl60JMV2pazirYX
	0anpgMphKhJ8mVfKHeys98ZB5dh0ExbwXPFIkOF5wcWKBNxMsS31x8jguhg5CRec3q3a0qw6FeB
	MUGRKtY0OQ+Z5SuNohdwTD0hWBp45cl97NXj+/KtBpBlJQAVFvIjODnOpFVlY/KS6Fv1TxQ3kSM
	AYdmoUXPvH0egK17y3ZhVPgys40OT9MPqI2GZ29OqEksLikunuMP0hVpimV5CXTRBLvmzr18sx9
	a0FiflHSFR1ZB4gks1MTFYMazgv3gOv8xFEgLnXhZTiySnU8aHOg4bcAOKzCBhCBMxG8emAKEt2
	MfLeq1xNPjyoPXTjNTNXDFXmgYc6F3zswGIcrG1V+BOdNSBLF5JqnGnyH3rCHy4o6Fdkm92H7QJ
	IQIFquW2G2igik=
X-Received: by 2002:a05:600c:190d:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a02753fc8emr188548305e9.8.1791210445732;
        Mon, 05 Oct 2026 07:27:25 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff106d8sm239421195e9.3.2026.10.05.07.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:27:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov via B4 Relay
 <devnull+V.Yurkov.EXT.bruker.com@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri
 Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>,
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: Re: [PATCH v8 2/2] clk: Add gpio-locked clock driver
In-Reply-To: <20260927-feature-clock-guard-v8-2-630938e302a1@bruker.com>
References: <20260927-feature-clock-guard-v8-0-630938e302a1@bruker.com>
 <20260927-feature-clock-guard-v8-2-630938e302a1@bruker.com>
Date: Mon, 05 Oct 2026 16:27:18 +0200
Message-ID: <1jcxto6x4p.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun 27 Sep 2026 at 14:59, Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org> wrote:

> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>
> A gpio-locked clock exposes a clock, which status is determined by a
> GPIO signal. The common use-case is a FPGA-assisted clocking design
> where peripheral clocks are generated by FPGA PLLs that are outside
> CPU control, with clock-valid/PLL-lock status exposed through GPIO signals.
> Consumers can use the output clock to wait until the input clock is locked
> and only then initialize dependent peripherals.
>
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  drivers/clk/clk-gpio.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 47 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index 9099c57e2715..db68b8bc44c5 100644
> --- a/drivers/clk/clk-gpio.c
> +++ b/drivers/clk/clk-gpio.c
> @@ -138,6 +138,25 @@ static const struct clk_ops clk_gpio_mux_ops = {
>  	.determine_rate = __clk_mux_determine_rate,
>  };
>  
> +/* We can't prepare the clock, but the Common Clock Framework calls only
> + * prepare() not is_prepared(), therefore we fallback on the actuall GPIO value.
> + * The function clk_sleeping_gpio_gate_is_prepared() returns the raw boolean
> + * GPIO status (1 if locked, 0 if unlocked), but the prepare callback
> + * clk_core_prepare() expects 0 for success and non-zero integer for failure.
> + */
> +static int clk_gpio_locked_prepare(struct clk_hw *hw)
> +{
> +	if (clk_sleeping_gpio_gate_is_prepared(hw))
> +		return 0;
> +
> +	return -EBUSY;
> +}

I was apparently not clear - probably my fault since I was initially
confused with what the driver was supposed to do.

Please do not modify the gate driver. Just provide gpio-enabled-clock
clock driver along the gate and mux in there.

> +
> +static const struct clk_ops clk_gpio_locked_ops = {
> +	.prepare =	clk_gpio_locked_prepare,
> +	.is_prepared =	clk_sleeping_gpio_gate_is_prepared,
> +};

Please implement the ops you've be testing, fast or slow (or both :D if
you can test both) 

> +
>  static struct clk_hw *clk_register_gpio(struct device *dev, u8 num_parents,
>  					struct gpio_desc *gpiod,
>  					const struct clk_ops *clk_gpio_ops)
> @@ -146,6 +165,7 @@ static struct clk_hw *clk_register_gpio(struct device *dev, u8 num_parents,
>  	struct clk_hw *hw;
>  	struct clk_init_data init = {};
>  	int err;
> +	const char *clk_name;
>  	const struct clk_parent_data gpio_parent_data[] = {
>  		{ .index = 0 },
>  		{ .index = 1 },
> @@ -155,7 +175,11 @@ static struct clk_hw *clk_register_gpio(struct device *dev, u8 num_parents,
>  	if (!clk_gpio)
>  		return ERR_PTR(-ENOMEM);
>  
> -	init.name = dev->of_node->name;
> +	err = device_property_read_string(dev, "clock-output-names", &clk_name);
> +	if (err)
> +		clk_name = fwnode_get_name(dev->fwnode);
> +
> +	init.name = clk_name;
>  	init.ops = clk_gpio_ops;
>  	init.parent_data = gpio_parent_data;
>  	init.num_parents = num_parents;
> @@ -192,6 +216,12 @@ static struct clk_hw *clk_hw_register_gpio_mux(struct device *dev,
>  	return clk_register_gpio(dev, 2, gpiod, &clk_gpio_mux_ops);
>  }
>  
> +static struct clk_hw *clk_hw_register_gpio_locked(struct device *dev,
> +						  struct gpio_desc *gpiod)
> +{
> +	return clk_register_gpio(dev, 1, gpiod, &clk_gpio_locked_ops);
> +}
> +
>  static int gpio_clk_driver_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -201,8 +231,11 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
>  	struct gpio_desc *gpiod;
>  	struct clk_hw *hw;
>  	bool is_mux;
> +	bool is_gpio_locked;
> +	enum gpiod_flags gpio_flags;
>  
>  	is_mux = of_device_is_compatible(node, "gpio-mux-clock");
> +	is_gpio_locked = of_device_is_compatible(node, "gpio-locked-clock");
>  
>  	num_parents = of_clk_get_parent_count(node);
>  	if (is_mux && num_parents != 2) {
> @@ -210,14 +243,24 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	gpio_name = is_mux ? "select" : "enable";
> -	gpiod = devm_gpiod_get(dev, gpio_name, GPIOD_OUT_LOW);
> +	if (is_mux)
> +		gpio_name = "select";
> +	else if (is_gpio_locked)
> +		gpio_name = "enabled";
> +	else
> +		gpio_name = "enable";
> +
> +	gpio_flags = is_gpio_locked ? GPIOD_IN : GPIOD_OUT_LOW;
> +
> +	gpiod = devm_gpiod_get(dev, gpio_name, gpio_flags);
>  	if (IS_ERR(gpiod))
>  		return dev_err_probe(dev, PTR_ERR(gpiod),
>  				     "Can't get '%s' named GPIO property\n", gpio_name);
>  
>  	if (is_mux)
>  		hw = clk_hw_register_gpio_mux(dev, gpiod);
> +	else if (is_gpio_locked)
> +		hw = clk_hw_register_gpio_locked(dev, gpiod);
>  	else
>  		hw = clk_hw_register_gpio_gate(dev, num_parents, gpiod);
>  	if (IS_ERR(hw))
> @@ -229,6 +272,7 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
>  static const struct of_device_id gpio_clk_match_table[] = {
>  	{ .compatible = "gpio-mux-clock" },
>  	{ .compatible = "gpio-gate-clock" },
> +	{ .compatible = "gpio-locked-clock" },
>  	{ }
>  };
>  
>
> -- 
> 2.34.1
>
>

-- 
Jerome
