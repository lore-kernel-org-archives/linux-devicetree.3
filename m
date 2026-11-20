Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175156;
	b=DtNsRFg1W9C8nEzM82dAhCxVYljnabnbl+zCd8CO8WqO/FhjYI9htPyATg8ARb2ulVwJ
	 2B+SVOv+VSuTWk+Kljj2gdrpujj6dL2cOeLmZDD1NXClS9UK/xwKo6YkLnd/y3NWE2Qbr
	 7V6AYQoZVuMdNZDim6H0RTYTOVaDvLyVJSpLomf83LGIpR04GePWlp2GmCuN/t895U4ad
	 Mt4dtNTDyhwtk6xP8LzzxUNwNHho4O/338LkjFuNkTGnpvMcSg26ryU7Ijufd8wT/ZyYq
	 u69o7nyuA+SnIF1hYz+ITVt4IHkbkgJNIrOrSPJnVg1voolk6pPyqlfi30L22MUNKlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175156;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=cXx0a8LeeD7MJwMvVRKUDaLbCvneP22P9q9pHTmM+cc=;
	b=QnLkUDm2sBspTJlMiLiB/nk2iJ/3VczaxQUVZ+s4NBJIpPEQuvd6bvTM9MQCl4HWrlRm
	 Trfan+t7ybWuudG0suWQUyKMW29/uPpYJxYBULvzJSe9+EKdELmdaPQ+KYEkdEYkofnpL
	 e5ZHRagvSMy9Iyn+KwhAIbTtvRlMRmRzGf6WM2/3S/P23OfbNSCepvre6gvFjrv9BVInH
	 NmNFwWHX5rcgefk22xhLwUdwXsG964zbGVLyzvqMN6wJrbggF6VMZoYW07gP3A1Kkblon
	 vorFv6hX0hQm1mAzK6DRqfZJMNOnoy69ZrE/gBeX5PC3oFK/brmxbzG4gxMmm/1IlbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkPJ+L1W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B436A606A32A;
	Fri, 20 Nov 2026 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkPJ+L1W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B5A1F000C0;
	Fri, 20 Nov 2026 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175156;
	bh=cXx0a8LeeD7MJwMvVRKUDaLbCvneP22P9q9pHTmM+cc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MkPJ+L1WgTP5flX1Nr9XFJoUwfmWlpy89lNoJbZ5mpEXF2XlNG+vQcMKEJEzS7lUu
	 ZiYY4eZDfGWBBScPEop3t3gZb4219h0+lGg0rQJy6tux/+rD7SlCH+y70d3PZ326ex
	 YpvSZY2sEO/IiFYzysdRgCeqDn+FTNe/+SyOWd/eLZWbrlkwI+axdGu08zBhcMt8nl
	 E5+K7QnqlmVajSR2+3S5atXOJIZ/+6KGix2fb08PYp/1tJ8xvKvdMrqFgVxatnoZGN
	 25f+jsJmtoeUCMG8TykV2LieBQAIbWWurLXH3HLbnkAx0K2Arqn0DmT3Ih03/chHQy
	 TwUK/cisfvlug==
Subject: Re: [PATCH net-next v4 02/10] net: phy: dp83867: add regulator supply
 management
From: netdev-bot+sashiko@kernel.org
To: mohd.anwar@oss.qualcomm.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, richardcochran@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, lorenzo.bianconi@oss.qualcomm.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 20 Nov 2026 11:45:54 +0000
Message-ID: <179517515449.3136.10802254198110142730@kernel.org>
In-Reply-To: <20261117-shikra_ethernet-v4-2-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-2-c41902e5f2fa@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The supplies are only enabled from the phy_driver probe
  (dp83867_probe() -> dp83867_power_on(), drivers/net/phy/dp83867.c:769…
- [Low] The commit message says "When any supply is newly enabled the
  driver sleeps for 200 ms".
- [Low] dp83867_power_on() turns on the DP83867 rails after phylib has
  already released the PHY's reset GPIO.

--

net: phy: dp83867: add regulator supply management

This adds dp83867_power_on(), called at the start of dp83867_probe(). It
enables up to four optional supplies (vdda-2p5, vdd-1p0, vdda-1p8, vddio)
with devm_regulator_get_enable_optional(). If any supply is described, the
driver then sleeps 200 ms for the post power-up stabilisation time given
in datasheet section 6.6.

> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> index b4b4931c6f8ce..ed8b3089e8e0b 100644
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c

[ ... ]

> @@ -730,11 +731,45 @@ static int dp83867_resume(struct phy_device *phydev)
>  	return 0;
>  }
>  
> +static int dp83867_power_on(struct phy_device *phydev)
> +{
> +	static const char * const supply_names[] = {
> +		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
> +	};
> +	struct device *dev = &phydev->mdio.dev;
> +	bool supplies_enabled = false;
> +	int i, ret;
> +
> +	if (!IS_ENABLED(CONFIG_REGULATOR))
> +		return 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
> +		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);

[Severity: Low]
How does this interact with boards that describe both reset-gpios and
these switched rails? By the time dp83867_probe() runs, phylib has already
released the PHY reset line twice:

phy_device_register()
    phy_device_reset(phydev, 0);

phy_probe()
    phy_device_reset(phydev, 0);
    ...
    err = phydev->drv->probe(phydev);
        dp83867_probe()
            dp83867_power_on()
                devm_regulator_get_enable_optional()

So the reset pulse and its reset-deassert-us wait happen while the PHY is
unpowered. The rails then come up with RESET_N already high, and the PHY
depends on its internal power-on reset. That may well be tolerated, but
the reset pulse described for the board has no effect.

There is also the gap between phy_device_register() and the supply enable
in probe, which can be long if the regulator provider defers. During that
time the deasserted reset GPIO drives a high level into a chip whose VDDIO
domain may still be off. Could that back-power the chip through its pin
protection diodes?

Would it make sense to call phy_device_reset(phydev, 1) before enabling
the supplies and phy_device_reset(phydev, 0) after the stabilisation
delay?

> +		if (ret == -ENODEV)
> +			continue;
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to enable %s supply\n",
> +					     supply_names[i]);
> +		supplies_enabled = true;
> +	}
> +
> +	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
> +	if (supplies_enabled)
> +		fsleep(200000);

[Severity: Low]
The commit message says:

    When any supply is newly enabled the driver sleeps for 200 ms before
    returning.

Is that accurate? supplies_enabled is set for every described supply where
devm_regulator_get_enable_optional() returns 0. The regulator core returns
0 whether or not the rail was already on, for example with
regulator-always-on, regulator-boot-on, a rail shared with another
consumer, or a rail left on by the bootloader.

So the 200 ms sleep runs on every probe of any board that describes at
least one supply. It also runs again on each re-probe after a later
-EPROBE_DEFER from dp83867_of_init(), such as the nvmem cell lookup in
dp83867_of_init_io_impedance().

Should the code check regulator_is_enabled() before enabling? Or should
the commit message say the delay applies whenever any supply is
described?

> +
> +	return 0;
> +}
> +
>  static int dp83867_probe(struct phy_device *phydev)
>  {
>  	struct dp83867_private *dp83867;
>  	int ret;
>  
> +	ret = dp83867_power_on(phydev);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Is this reached when the rails start out off? dp83867_probe() only runs
after the MDIO core has created a phy_device and matched it by PHY ID.

If the PHY node has no ethernet-phy-idXXXX.XXXX compatible, that ID is
read from the PHY over MDIO before any driver code runs:

of_mdiobus_register()
  __of_mdiobus_parse_phys()
    of_mdiobus_register_phy()
      fwnode_mdiobus_register_phy()
        if (is_c45 || fwnode_get_phy_id(child, &phy_id))
            phy = get_phy_device(bus, addr, is_c45);
          get_phy_c22_id()
            if ((*phy_id & 0x1fffffff) == 0x1fffffff)
                return -ENODEV;

The GPIO-controlled rails can be off at scan time, either because the
hardware defaults them off or because a non-boot-on fixed regulator has
already driven its enable GPIO low. In that case the ID reads back as all
ones and __of_mdiobus_parse_phys() only logs:

    "MDIO device at address %d is missing.\n"

No phy_device is created. dp83867_probe() and dp83867_power_on() never
run, so the supplies are never enabled and the PHY is never detected.

The companion binding patch "dt-bindings: net: ti,dp83867: add supply
properties" allows the four supply properties on a node that only
requires reg, and its example has no compatible. With the ID compatible,
fwnode_mdiobus_register_phy() calls phy_device_create() and skips the
MDIO read.

Should the binding require, or at least document, the
ethernet-phy-id2000.a231 compatible when supplies are described?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-shikra_ethernet-v4-0-c41902e5f2fa%40oss.qualcomm.com
