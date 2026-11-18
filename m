Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005238;
	b=KnlR/h9jDJB/5AsP5TY4Qo25sGR0+BUpSwij3K+DMm8A1/PCRl8Vnrp4zONukWW8FYhx
	 tUUbeFlidWO96xGaWSsk6CHj7OKKLBwHTWvAwKOWEIG741LrTFNCnq1uuP3a52GBseWeY
	 LsJKcwQkqG6f+mcDVl4+1jVtcMHeY5k7YktM+K3lgha34mrChPPVv4yiap4cwpt0VHYk6
	 kP/NG1IqSZFhaaSZRQPMzQky8I1WYK38zQ/Gqh0KBur+S7/kIxaiRXnrYyfOQRAnYKfCz
	 lFyuEzDnUK+GYrfHdKSB/fXtLdM1uAZYGKau6bMHWPz3mgG1KtyAgpTgRSVyITnSuhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005238;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7KqS7FUoP8+YKU7UrHzi7vh0N1UT3YTJh6Xu6F9Q1YE=;
	b=g1ML/WRTwQq5QuvWqqcbOQtoy745cQjoMl/IKUfpYRs+L3U2bXORfAi/2VhG6PvBGBts
	 xlLcGSN/6g6sOXay9XhrkdiVTveaHDvZV7ACkFUCJhCqnCDm/bGJ/m2Z2uIcDypAmgQj+
	 aPJMoFJL1VECtf5oaUDgMtd2q9MYQ6TgMyWTFKw0iBCpWhcLfF/eQvxWzOZoQT73tUcuw
	 wnK7Z2RY45tpboAOHN3HcZVy4f6P1CFhyJnrZ2Tra6LTDh0lXE2UxtJttleqtGOYob9GZ
	 XwnMrNsGMN8+KohHefV91HENy1Z4Rdp5zt9hCSpSjJof54zbNsenzVxzkMsAyxAvSlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqOxdMhE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57830606A31C;
	Wed, 18 Nov 2026 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqOxdMhE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F871F000C4;
	Wed, 18 Nov 2026 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005238;
	bh=7KqS7FUoP8+YKU7UrHzi7vh0N1UT3YTJh6Xu6F9Q1YE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AqOxdMhEs01XQBpejSIlq0G8D0FKi9lFXWJYsZrPjRaSggICn9tOqDlXl194k2MxS
	 +QccRf2dtIxUxvYZtO4fb+129fQ/ICWKCpyvCZsLh062xtvLMdewbw1tTscUXSFz7A
	 jlAlyD7vtNw4TAd4q2zQh3vbAqNfNVUIOpK4PfO7Gxcqfcjyxm5zBjWKD+n9UOthBF
	 ZhFvnTYjiF4/Ythmu/vFvU+u7S6nge5eWbCMrF3l8hkv9K++rzIbd08bU9QGJ0gWpF
	 YcHDAt9aKLBGcIc3yWqmZwm3xDKNyYsfe37quRpGJImD7NXS9QfE0oru22D3wOk7db
	 rx6TEPM39+OIQ==
Subject: Re: [PATCH net-next v4 2/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
From: netdev-bot+sashiko@kernel.org
To: joseph@telaak.dev
Cc: hauke@hauke-m.de, andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, daniel@makrotopia.org,
 p.zabel@pengutronix.de, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 12:33:56 +0000
Message-ID: <179500523674.3136.3797005435367758007@kernel.org>
In-Reply-To: <20261115-mxl-gsw1xx-reset-v4-2-4ecd18c922e2@telaak.dev>
References: <20261115-mxl-gsw1xx-reset-v4-2-4ecd18c922e2@telaak.dev>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] gsw1xx_probe() (drivers/net/dsa/lantiq/mxl-gsw1xx.c) can skip
  the switch reset without logging anything.
- [Low] gsw1xx_probe() pulses the hardware reset on every probe attempt:
  assert, fsleep(250000), deassert, fsleep(1000000).

--

net: dsa: mxl-gsw1xx: reset the switch through reset-gpios

This patch gets an optional reset control in gsw1xx_probe() and pulses it
before the first register access. The pulse is 250 ms asserted, then 1 s
before access, which is the timing from the vendor's GSW150 driver. It
also adds imply RESET_GPIO to the Kconfig entry and extends the help text.

> diff --git a/drivers/net/dsa/lantiq/mxl-gsw1xx.c b/drivers/net/dsa/lantiq/mxl-gsw1xx.c
> index 0c7ea242a62c2..33b73b2ed5fe7 100644
> --- a/drivers/net/dsa/lantiq/mxl-gsw1xx.c
> +++ b/drivers/net/dsa/lantiq/mxl-gsw1xx.c

[ ... ]

> @@ -737,6 +739,30 @@ static int gsw1xx_probe(struct mdio_device *mdiodev)
>  	if (!priv->gswip.hw_info)
>  		return -EINVAL;
>  
> +	/* The MDIO core handles reset-gpios only for PHYs. Reset the switch
> +	 * here, so it does not run with whatever the bootloader configured.
> +	 */
> +	reset = devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset),
> +				     "failed to get reset control\n");
> +
> +	if (reset) {

[Severity: Medium]
If the switch node has reset-gpios, can the reset still be skipped here
with no message at all?

In two configurations, devm_reset_control_get_optional_exclusive()
returns NULL even when reset-gpios is in the DT.

With CONFIG_RESET_CONTROLLER=n, the stub in include/linux/reset.h does:

    return optional ? NULL : ERR_PTR(-ENOTSUPP);

With CONFIG_RESET_GPIO=n, __fwnode_reset_control_get() in
drivers/reset/core.c returns before it tries the reset-gpios fallback:

    if (!IS_ENABLED(CONFIG_RESET_GPIO))
        return optional ? NULL : ERR_PTR(ret);

In both cases the if (reset) branch is not taken. Probe then continues
with the bootloader state. The commit message says this state makes port
0 fail with "failed to connect to PHY: -ENODEV".

The new help text in drivers/net/dsa/lantiq/Kconfig says:

    A switch whose hardware reset is described with reset-gpios is
    only reset when RESET_GPIO is enabled as well, which this option
    does by default.

Is this true for every config? RESET_GPIO is inside "if RESET_CONTROLLER"
and depends on GPIOLIB. RESET_CONTROLLER is only default y if
ARCH_HAS_RESET_CONTROLLER. NET_DSA_MXL_GSW1XX provides neither
dependency, so on x86 or generic MIPS, for example, the imply has no
effect.

The reset-gpios binding added earlier in this series describes it as the
switch's hardware reset input. It also says the slew rates return to
their power-on defaults "after a reset through reset-gpios". A DT that
follows the binding can silently get neither.

Other DSA drivers with a switch-level reset-gpios call
devm_gpiod_get_optional() directly, and that only needs GPIOLIB. Examples
are qca8k-8xxx.c, realtek/rtl83xx.c, mv88e6xxx/chip.c, lan9303-core.c,
vitesse-vsc73xx-core.c, mt7530-mdio.c and ksz_common.c.

Would that approach work here? If not, could probe at least warn or fail
when reset-gpios is present but no reset control was obtained? Could the
help text also name the RESET_CONTROLLER and GPIOLIB dependency?

> +		ret = reset_control_assert(reset);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to assert reset\n");
> +
> +		fsleep(GSW1XX_RESET_ASSERT_US);
> +
> +		ret = reset_control_deassert(reset);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to deassert reset\n");
> +
> +		fsleep(GSW1XX_RESET_DEASSERT_US);
> +	}

[Severity: Low]
Does this pulse the reset again on every probe attempt after
-EPROBE_DEFER?

The reset runs before gswip_probe_common() reaches dsa_register_switch().
dsa_register_switch() can return -EPROBE_DEFER, for example when the
conduit is not registered yet:

net/dsa/dsa.c:dsa_port_parse_of() {
    ...
		conduit = of_find_net_device_by_node(ethernet);
		of_node_put(ethernet);
		if (!conduit) {
			rtnl_unlock();
			return -EPROBE_DEFER;
		}
    ...
}

It also defers when the tagger module is not loaded yet.

For MDIO-attached switches, the conduit is often missing on the first
try. The MAC driver registers its MDIO bus, which probes the switch,
before it calls register_netdev(). That first attempt usually runs inside
the MAC driver's own probe.

Each retry resets the chip again and blocks for another 1.25 s, because
both fsleep() calls become msleep(). The commit message says this timing
is only known for the GSW150. Nothing breaks, since the next attempt
redoes the PCS init and the GPIO pin-mux, so the cost is boot time.

Could the reset be pulsed only once, or could the line state be kept
across probe attempts?

>  	priv->gswip.gswip = gsw1xx_regmap_init(priv, "switch",
>  					       GSW1XX_SWITCH_BASE, 0xfff);
>  	if (IS_ERR(priv->gswip.gswip))

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115-mxl-gsw1xx-reset-v4-0-4ecd18c922e2%40telaak.dev
