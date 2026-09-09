Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14804B04B2
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961778; cv=none; b=bSD/gQXof0vVt/KHQ11vSiOYXDOkiJReQVfjwIdAKGfqYURA6Hsv2yszkQVDvh9CDHOnNFtyFJ2cgCQvyLvUwHGKHX3p2vy02AeCPaj51P7ErWtcwsHPOv8RTf3s4WCYibRrd2B+zD0/pS4I8HkmgtjzXXqQ+SM+Z0xMY0cr6yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961778; c=relaxed/simple;
	bh=czUzjAzwEvbsG98Oa01XrotXE+fukm6kiX5X36SjW9w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CkcKpqRyVIrcJ52ysdRRsqTzkIvAqabZ1E2DEhV6215RWCBkC1FNrJKbzGMKfZRbvu0QJVLbgRhDfmrsGJzeb82qEleKd7wDfDl6QJLJ5w7aPTcand8Oi3MAlEbyNUkyexB1GF06AjQoUraDoOgg10FYKAhAdrNMi+yMzAUTzDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpUFVf5w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpUFVf5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA701F00A3D;
	Wed,  9 Sep 2026 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788961776;
	bh=YDDRLcpbGkfIg2sJFPILudHHdHmKor1x3nGX0n21MzM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WpUFVf5whc0KTERMngpBRZRAZybMeiGmWHzjLo82PE+TqzpTQT+JBaexxEDOsovLQ
	 42rP4yq2us+N9HYt8znHdipAwEgFqajcBJTpR7pAVZIFuHIEoVcYVrfVWv57lAN/lQ
	 tQKN9VhgV6SvU1GHBtnLEq89eDVFaudbznuECdffo8VUAy7SZGviJvTmKBuUZFBmE4
	 OrAyCqW1j1zUyw2DkLsw+X2SrwZSHe2pU5MwKJyGVHxcu3k9oRN/PiLLpU+AoLNIOJ
	 bSZeGSgPvH/9D8hYJJyKFd2cdJ+2SF+Jv2YxR3IT+q7Ky1/PweADYkMcwIhBAgC/Fq
	 ICERUctvEuo3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 17/22] media: i2c: maxim-serdes: add MAX96717 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260909-gmsl2-3_serdes-v17-17-002499e534e8@analog.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
 <20260909-gmsl2-3_serdes-v17-17-002499e534e8@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 13:49:36 +0000
Message-Id: <20260909134936.7AA701F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect pin index mapping for slew rate configuration modifies w=
rong hardware registers and rejects valid pins.
- [High] Setting a pin to input direction fails to explicitly enable the re=
ceiver, leaving the GPIO permanently unreadable if previously disabled.
- [Medium] Incorrect initialization of `diff_old` restricts maximum matchab=
le clock frequency on 64-bit systems.
- [Medium] Speculative: Missing delay between hardware reset assertion and =
deassertion for the reference generator.
--

commit 29038ca9d5127738bdf88351f0cbd48295171826
Author: Cosmin Tanislav <demonsingur@gmail.com>
Subject: media: i2c: maxim-serdes: add MAX96717 driver

Add a new MAX96717 driver that also supports MAX9295A, MAX96717F and
MAX96793. Integrates it with the common serializer framework.

> diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/media/i2=
c/maxim-serdes/max96717.c
> new file mode 100644
> index 0000000000000..c87ea9e82c1ca
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96717.c
[ ... ]
> +static int max96717_get_pin_config_reg(unsigned int offset, u32 param,
> +				       unsigned int *reg, unsigned int *mask,
> +				       unsigned int *val)
> +{
[ ... ]
> +	switch (param) {
> +	case PIN_CONFIG_SLEW_RATE:
> +		if (offset < 3) {
> +			*reg =3D MAX96717_PIO_SLEW_0;
> +			if (offset =3D=3D 0)
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO00_SLEW;
> +			else if (offset =3D=3D 1)
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO01_SLEW;
> +			else
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO02_SLEW;
> +		} else if (offset < 5) {
> +			*reg =3D MAX96717_PIO_SLEW_1;
> +			if (offset =3D=3D 3)
> +				*mask =3D MAX96717_PIO_SLEW_1_PIO05_SLEW;
> +			else
> +				*mask =3D MAX96717_PIO_SLEW_1_PIO06_SLEW;
> +		} else if (offset < 7) {
> +			return -EINVAL;

[Severity: High]
Does this logic improperly treat the pin offset as a sequential register
index?

When offset is 4, it is mapped to MAX96717_PIO_SLEW_1_PIO06_SLEW instead
of its correct register. Additionally, valid offsets like 5 and 6 return
-EINVAL.

This issue surfaces when max96717_mux_set_rclkout() is called with group
set to 4 (MAX96717_RCLK_MFP):

> +static int max96717_mux_set_rclkout(struct max96717_priv *priv, unsigned=
 int group)
> +{
> +	unsigned long config;
> +	int ret;
> +
> +	config =3D pinconf_to_config_packed(PIN_CONFIG_SLEW_RATE,
> +					  MAX96717_PIO_SLEW_FASTEST);
> +	ret =3D max96717_conf_pin_config_set_one(priv, group, config);

This will corrupt pin 6's slew rate and leave pin 4 unconfigured. Should the
offsets be explicitly mapped to their corresponding physical pins?

[ ... ]
> +static int max96717_conf_pin_config_set_one(struct max96717_priv *priv,
> +					    unsigned int offset,
> +					    unsigned long config)
> +{
[ ... ]
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		arg =3D arg >=3D MAX96717_BIAS_PULL_STRENGTH_1000000_OHM;
> +		config =3D pinconf_to_config_packed(MAX96717_PINCTRL_PULL_STRENGTH_HIG=
H, arg);
> +		return max96717_conf_pin_config_set_one(priv, offset, config);
> +	case PIN_CONFIG_LEVEL:
> +		config =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 1);
> +		return max96717_conf_pin_config_set_one(priv, offset, config);
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		config =3D pinconf_to_config_packed(MAX96717_PINCTRL_RX_EN, 0);
> +		return max96717_conf_pin_config_set_one(priv, offset, config);
> +	case MAX96717_PINCTRL_TX_ID:

[Severity: High]
Does PIN_CONFIG_INPUT_ENABLE need to be explicitly handled here to re-enable
the receiver?

When max96717_gpio_direction_output() cascades into
PIN_CONFIG_OUTPUT_ENABLE, it sets MAX96717_PINCTRL_RX_EN to 0 to disable
the receiver. If the pin is subsequently reconfigured as an input via
max96717_gpio_direction_input(), PIN_CONFIG_INPUT_ENABLE merely disables
the output driver but lacks a cascade to set MAX96717_PINCTRL_RX_EN back to=
 1.

This could leave standard GPIO inputs permanently unreadable if they were
previously disabled.

[ ... ]
> +static unsigned int max96717_clk_find_best_index(struct max96717_priv *p=
riv,
> +						 unsigned long rate)
> +{
> +	unsigned int i, idx =3D 0;
> +	unsigned long diff_new, diff_old =3D U32_MAX;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(max96717_predef_freqs); i++) {
> +		diff_new =3D abs_diff(rate, max96717_predef_freqs[i].freq);
> +		if (diff_new < diff_old) {

[Severity: Medium]
Will U32_MAX restrict the maximum matchable clock frequency on 64-bit syste=
ms?

Since unsigned long is 64-bit, if a client requests a very high rate
(e.g., ULONG_MAX) to query the maximum supported rate, the calculated
diff_new (ULONG_MAX - freq) will be far greater than U32_MAX.

The condition diff_new < diff_old will be false for all iterations, causing
the loop to exit without updating idx and falling back to the lowest
possible frequency (6.25 MHz). Should diff_old be initialized to ULONG_MAX
instead?

[ ... ]
> +static int max96717_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				 unsigned long parent_rate)
> +{
[ ... ]
> +	val |=3D MAX96717_REF_VTG0_REFGEN_RST;
> +	val |=3D MAX96717_REF_VTG0_REFGEN_PREDEF_EN;
> +
> +	ret =3D regmap_write(priv->regmap, MAX96717_REF_VTG0, val);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_clear_bits(priv->regmap, MAX96717_REF_VTG0,
> +				MAX96717_REF_VTG0_REFGEN_RST);

[Severity: Medium]
Is it possible the hardware reference generator needs a delay to cleanly re=
set?

This asserts the reset flag and immediately clears it in the next I2C
transaction via regmap_clear_bits(). If the I2C bus is fast or commands are
batched, the hardware might not register a sufficient pulse width. Could th=
is
cause the PLL state machine to fail to lock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-gmsl2-3_se=
rdes-v17-0-002499e534e8@analog.com?part=3D17
