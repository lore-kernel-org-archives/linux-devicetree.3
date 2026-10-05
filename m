Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8B4C33FC
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 15:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213363; cv=none; b=mqO3ygN0EUuF/co3mzVr9bPy0KwcXGoi974g7/VeF0J3z4SgvRIXngc+G+7qBuxFnHRw3TCllPE4CfE2IGKw2tgui2m5dvn4Kb/R/GZZQbpg+BwZUvUQi0WrabXDNwfySwNVrOscrb6GHDsvLw2mzhb7+JcUgrqNk3N1Nbr8s1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213363; c=relaxed/simple;
	bh=di9sLD7L59euqQ5+ItFDihe1+WHuLOg9s6IkVVktlX4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=olJwjBVghAebEBYHSSgshLLJDvNbTyZAxhv/wi0VuMqkPOHGuyI8f28hPkPYvSI/NFpmvP3Ai3vipXebJ0wQd07AwXIZhJowfKy47o61h3uhd03l/Q4q3OirYNDYsEHGRWHnvc77PwjoHxhRMo7vRA0UguupgRd7V+VvDxJHwII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z/cwPz6g; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Z/cwPz6g"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso16109375e9.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 08:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791213359; x=1791818159; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6x/AsX38zbMGVV1Hr2xi2v0Hi8bQK/pkRp82/YE/O4=;
        b=Z/cwPz6gOjPH2qGmog0V1op0cNOtj7fEu8Kc5JuI5cfp0g/4FVpPFN03PNEA1bVxIO
         orLTtwSbnhLzStMtZ5dL5HI0g0W2/u2QL9hRLPFLE0RoGUWuWPtIeJApA5TPm4ZIKTyQ
         vlnVev76/wpMF/y8F89L5HSV9029MLxsvF4mv3iC7gXop5OkAlaKHCrQN9QzFBW/EGKT
         RcK6pKLWIQ378Cim1wxPu2cH5a1D0lxEcx4cAGCBUWHnwyTZXNy/YB99xNp98aZwXMoO
         sxJBrMnHgUeyBIzx4p3v1WvdCNEKRbL4cQYuIRyoSC0K0VAROK7svoovkqkozPU81gia
         cs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791213359; x=1791818159;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E6x/AsX38zbMGVV1Hr2xi2v0Hi8bQK/pkRp82/YE/O4=;
        b=flb+eYOxEtQoVcdvwFE6r+2rDK5l6gMIcXFuU0ICAPG/5nBVwyQo1JAHMOaNzqVA3r
         FxO3BsM0ZKYTFer0sMjMj1A4BKUyqZm4mE6etVnPu6XVhMNKmOWljWh87Fom0PN6wKUw
         KvQFgUxB1b3wH9G5EtD8oEq56GQSwQTX9qoPi/23+0z9XO/0q85IYBeKgupHNLT8NnLd
         sKJtxNyJCdVhpwxmRJavxN3iALkiRPqHFR/1MugXc/h8olQwGK1CWK5rXUBcEa2O0lKN
         PGoV0wqnLw3rfy1DLbMPzbqMqSudcfjQYaw4g0Rnt1JDv3wudbp5xBIcuh2nuuxVfl0J
         9eOA==
X-Forwarded-Encrypted: i=1; AKwUvBw3ICQui7gkpB+OZ1DqzqyBYpHpxaMtYLiFW7loVzPXgHvOC2/dSROXUwMXyuv+JBJBbmwwO5pwqkQm@vger.kernel.org
X-Gm-Message-State: AFuF++kVnlYmD62cUlqiM3h9UVs2kc+ahywtVXVpkpO3Gqg0gJA4uHrv
	L2BfgUP4TJBXyLvCsIsrYncYHiSnao4H+iFUV+QSp7J89+xEH7d6QN4UzOqRtEqdWrc=
X-Gm-Gg: AYBFou1jiimdrpj3yQq46usdaGmDC3Ab4Mg63to+4Gb6RPIUz5u8z+er1ZcVKfOu9Sz
	RL5N0NAdX7+qRNi/G9n+HFJJCtbZ3Z7u8SeB61rGCbbYJJCeHUnUS9nSAhQAE013WaR9FWTLDy3
	i8n7zj8gK/hdaXaJR8/Lj4Ygr5nywUB4pVOGUInPDBy+adnB8JHf9xMzH1661+5QTduVEnQUNar
	xVC+hO7pmDB5pMT5eWYIM8XqWvNL8Xnj5YLyn5ikGqL4GSpt55k207Bm8vwmwsdGzBgW3cn+fvV
	AOHaFv/KhTthYcaZtnamuXCahzutvpy0rcZ/WPkg6LMM5p2if2SMgApPAH6Q5MohrV214inKx70
	GpbSy7SQ6+YF4YNTzr3wT/S4CK0jJmvy+vfrNdqmORrSsBtu03xry8KPwIdAWLZqaC/Nx6ltglw
	iGiRqzD4Mv8y65SLoSSec6vMc/boYWYruSXKvsF4TyA/Pz5jbjBTiIGw1koRG+C7AsEuhowpzLt
	Bkgj7Agg+b+if7U
X-Received: by 2002:a05:600c:4594:b0:4a0:394f:d4d1 with SMTP id 5b1f17b1804b1-4a0394fd57bmr148733425e9.20.1791213358892;
        Mon, 05 Oct 2026 08:15:58 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622bb17esm4076218f8f.45.2026.10.05.08.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:15:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 linux-gpio@vger.kernel.org, Sascha
 Hauer <s.hauer@pengutronix.de>, Linus Walleij <linusw@kernel.org>, Alvin
 =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Subject: Re: [PATCH v9 2/2] clk: add TI CDCE6214 clock driver
In-Reply-To: <97e38914-bd04-4e01-8e5a-a729dfe0c7f5@pengutronix.de>
References: <20260921-clk-cdce6214-v9-0-f2ea74fd38a2@pengutronix.de>
 <20260921-clk-cdce6214-v9-2-f2ea74fd38a2@pengutronix.de>
 <1jcxu18xme.fsf@starbuckisacylon.baylibre.com>
 <97e38914-bd04-4e01-8e5a-a729dfe0c7f5@pengutronix.de>
Date: Mon, 05 Oct 2026 17:15:55 +0200
Message-ID: <1j33uki3f8.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 29 Sep 2026 at 10:43, "Sascha Hauer" <s.hauer@pengutronix.de> wrote:

> Hi Jerome,
>
> On 2026-09-25 11:54, Jerome Brunet wrote:
>> > +
>> > +#define R0	0
>> > +#define RO_I2C_A0			BIT(15)
>> > +#define RO_PDN_INPUT_SEL		BIT(14)
>> > +#define RO_GPIO4_DIR_SEL		BIT(13)
>> > +#define RO_GPIO1_DIR_SEL		BIT(12)
>> > +#define RO_ZDM_CLOCKSEL			BIT(10)
>> > +#define RO_ZDM_EN			BIT(8)
>> > +#define RO_SYNC				BIT(5)
>> > +#define RO_RECAL			BIT(4)
>> > +#define RO_RESETN_SOFT			BIT(3)
>> > +#define RO_SWRST			BIT(2)
>> > +#define RO_POWERDOWN			BIT(1)
>> > +#define RO_MODE				BIT(0)
>> > +
>> > +#define R1	1
>> 
>> I don't really get the point of those defines
>
> It was requested by Stephen [1]:
>
>> Maybe it would be better to have '#define R30 30' just so we can easily
>> jump to the fields like R30_PLL_NDIV. I see that the datasheet doesn't
>> give a name to these registers besides prefixing the decimal offset with
>> the letter 'R'.
>
> I don't have any personal preference.
>
> [1] https://lore.kernel.org/all/e5858fe5d4276a735c5354e955358f27@kernel.org/
>

I've sync with him. keep it that way

>> > +static int cdce6214_clk_out_set_parent(struct clk_hw *hw, u8 index)
>> > +{
>> > +	struct cdce6214_clock *clock = hw_to_cdce6214_clk(hw);
>> > +	struct cdce6214 *priv = clock->priv;
>> > +
>> > +	switch (clock->index) {
>> > +	case CDCE6214_CLK_OUT1:
>> > +		regmap_update_bits(priv->regmap, R56, R56_CH1_MUX, FIELD_PREP(R56_CH1_MUX, index));
>> > +		break;
>> > +	case CDCE6214_CLK_OUT2:
>> > +		regmap_update_bits(priv->regmap, R62, R62_CH2_MUX, FIELD_PREP(R62_CH2_MUX, index));
>> > +		break;
>> > +	case CDCE6214_CLK_OUT3:
>> > +		regmap_update_bits(priv->regmap, R67, R67_CH3_MUX, FIELD_PREP(R67_CH3_MUX, index));
>> > +		break;
>> > +	case CDCE6214_CLK_OUT4:
>> > +		regmap_update_bits(priv->regmap, R72, R72_CH4_MUX, FIELD_PREP(R72_CH4_MUX, index));
>> > +		break;
>> 
>> Can you properly describe your clock rather than doing this sort of
>> matching ?
>
> You mean something like:
>
> struct cdce6214_clk_data {
>         unsigned int pd_reg;
>         u32 pd_mask;
>         unsigned int reg;
>         u32 mux_mask;
>         u32 div_mask;
> };
>
> static const struct cdce6214_clk_data cdce6214_clk_data[CDCE6214_NUM_CLOCKS] = {
>         [CDCE6214_CLK_OUT1] = {
>                 .pd_reg = R4,
>                 .pd_mask = R4_CH1_PD,
>                 .reg = R56,
>                 .mux_mask = R56_CH1_MUX,
>                 .div_mask = R56_CH1_DIV,
>         },
>         ...
> };
>
> If yes, I can do that.

The way you've done it above is duplication of code. Each clock appears
to have an offset and a field, those data should be associated to clock
then your function is just a single regmap_update_bits.

>
>> > +static int cdce6214_get_psx_div(unsigned long rate, unsigned long parent_rate)
>> > +{
>> > +	unsigned int div = DIV_ROUND_CLOSEST(parent_rate, max(rate, 1UL));
>> > +
>> > +	return clamp(div, 4, 6);
>> > +}
>> 
>> Can't you just use a regular divider operation ? split you clocks in
>> different entities ?
>
> I can switch to use the generic divider helpers (divider_recalc_rate,
> divider_determine_rate). Is that where you aiming at or do you want me
> to register the clocks as composite clocks?

No I don't mean composite, I mean use helper functions such has
divider_determine_rate(), divider_recalc_rate(), etc ...

>
>> > +static int cdce6214_probe(struct i2c_client *client)
>> > +{
>> > +	struct device *dev = &client->dev;
>> > +	struct cdce6214 *priv;
>> > +	struct pinctrl_dev *pctl;
>> > +	int ret;
>> > +
>> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> > +	if (!priv)
>> > +		return -ENOMEM;
>> > +
>> > +	priv->client = client;
>> > +	priv->dev = dev;
>> > +	i2c_set_clientdata(client, priv);
>> > +	dev_set_drvdata(dev, priv);
>> > +
>> > +	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>> > +	if (IS_ERR(priv->reset_gpio)) {
>> > +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
>> > +				     "failed to get reset gpio\n");
>> > +	}
>> > +
>> > +	priv->regmap = devm_regmap_init_i2c(client, &cdce6214_regmap_config);
>> > +	if (IS_ERR(priv->regmap))
>> > +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
>> > +				     "failed to init regmap\n");
>> > +
>> > +	ret = cdce6214_configure(priv);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	ret = devm_pinctrl_register_and_init(dev, &cdce6214_pdesc, priv, &pctl);
>> > +	if (ret)
>> > +		return dev_err_probe(dev, ret, "pinctrl register failed");
>> > +
>> > +	ret = pinctrl_enable(pctl);
>> > +	if (ret)
>> > +		return dev_err_probe(dev, ret, "pinctrl enable failed");
>> 
>> It feels like it should an MFD driver. half the driver belong in pinctrl
>
> I'd rather not go that way as it means splitting a relatively straight
> forward driver into three subsystems with different maintainers. Also it
> means getting cross device dependencies right.

... and then the trouble is for us maintainers to sort things out
whenever the framework needs change.

>
> Taking "Multi Function Device" by its name it means it's a device with
> multiple functions. The CDCE6214 is not that, it's only purpose is to
> generate clocks, only that the pins need some configuration. Most other
> devices of this type just have device specific properties in the device
> tree for configuring their pins (which I was rightfully pushed away from
> in earlier reviews).

It may have a single purpose but it is still providing multiple functions
and we will not have this pinctrl driver under clock. Please submit it
to pinctrl where it will receive proper review and maintainance.

IMO MFD is proper way to do it.

>
> Sascha
>
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>

-- 
Jerome
