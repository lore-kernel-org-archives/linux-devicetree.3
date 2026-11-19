Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067646;
	b=j+5Bac0puAVOcXog96H0gVg2fd1gjrTe0vA+iw+WP0p7eJEbnD4DSvA1SIYWQ9kjzJNG
	 baHZ0QpK6l8jVYHrbpt2tjaxaNeX4fS8VLQwzkPeCfoMf19oGp+iHPCSjV/wBe6zYPA5d
	 clK+xrrh/LEta2zX9UFBe3Ufi7ZsHeUmBSmDvAYa8cu0n0oDyoby9TgQpjdMaRmd0tCWM
	 XddAOoHPxDm3DRwtAD7A5PigrYyMQgETOoQI6VEotqQLzMKSz9Hq5VeBsljzpNkCd1Y1t
	 PmTCbc+5CK7dIUkpNlnhEPXy6aobM4LbJWL5oFtGxp4eevyMDR514VsnHzRIHO6yaqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067646;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DqkVbgU1xTxdGmNgGGJRMnn88EytwM6IJx1esMY73Fg=;
	b=lMiu90LP5bzGitpnXHsTZgf5IN1gYlFEQJ7XZf9ljmNK47rxpWqCdP7x+uDWSHjZbb4S
	 86WPRDih9PGgl3VpyAIc/bPAmaTkQsNJLWHIhehWMGZYWzzspUPNUW3iAWLOhEjIbZGtb
	 l+H7VLiAqrxXZujKqxigp3v2eYTfm38nNTHUdiA/TMFQ6HW6qD7LJ8jzz+ohwJFDshZ9R
	 t4054rpDGOFNRau0GDO+g312wzf3wuNNgBjZTkTlz2gPBKA3G+GqTAr3UgvABZQxp4g94
	 DPNEQVvhZwxB1Zr+NQbXb+yu1gQJZOURTMNq3R1ISVzJHWHB1SW7wwN0f9GqdbmaZkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WV9aMJOz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B65A606A335;
	Thu, 19 Nov 2026 05:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WV9aMJOz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8251F000C4;
	Thu, 19 Nov 2026 05:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795067646;
	bh=DqkVbgU1xTxdGmNgGGJRMnn88EytwM6IJx1esMY73Fg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WV9aMJOzEr03KcbaWP9skSa3IgDNhf90wRhuoiktITGBHTJmAA0d9eJkMAPmtnZMv
	 zUyVXwoj31LfBhnpTdxTK+/9CqDd4jrjPEsR6Y2S1+LSBVz54W4up2MrvafmXAqKtY
	 iHJP6HhY8KYkTGKX0FBp4qwCECLlJ0F2SUqwJhSbg3kKYR9ND7GTweZWX9XR1buGys
	 9AiEFroJjPL/yy5v0bAr5Tio7kKhj53jsfInznaRpQ9ZV8MmdS0nEnd+M3QJ/eclm2
	 SHMhJ7kB9RLUYmM84t5JeBa+qSrswN8oI+FgAcOyMqKmEaiBaU5RJrIaL2M8kIw/Mi
	 PoGrqNb8yBDCg==
Subject: Re: [PATCH net-next v2 3/3] net: pse-pd: realtek-pse-mcu: configure
 global power budget
From: netdev-bot+sashiko@kernel.org
To: jonas@jonasjelonek.de
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 sander@svanheule.net, russell@personaltelco.net
Date: Thu, 19 Nov 2026 05:54:04 +0000
Message-ID: <179506764491.3136.18101194586618488763@kernel.org>
In-Reply-To: <20261116115224.1454885-4-jonas@jonasjelonek.de>
References: <20261116115224.1454885-4-jonas@jonasjelonek.de>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] rtpse_mcu_register() (drivers/net/pse-pd/realtek-pse-mcu-
  core.c:933) gets the optional 'vmain' supply with…
- [Low] rtpse_mcu_get_global_budget_idx() (drivers/net/pse-pd/realtek-
  pse-mcu-core.c:402-422) reads the MCU's current budget/power-bank…

--

net: pse-pd: realtek-pse-mcu: configure global power budget

This patch takes the power budget of the optional vmain supply and uses
it to program the MCU's aggregate PoE limit, in 100 mW units, at the
MCU's current budget index. The budget is reserved through the regulator
core and released by a devm action. The driver uses the regulator only
for budget accounting and never enables it.

> diff --git a/drivers/net/pse-pd/realtek-pse-mcu-core.c b/drivers/net/pse-pd/realtek-pse-mcu-core.c
> index d8b6e05039397..ae58581a0dad8 100644
> --- a/drivers/net/pse-pd/realtek-pse-mcu-core.c
> +++ b/drivers/net/pse-pd/realtek-pse-mcu-core.c

[ ... ]

> @@ -393,6 +399,84 @@ static int rtpse_mcu_set_power_mgmt_mode(struct rtpse_mcu_ctrl *pse)
>  	return (resp.payload[0] == 0x0) ? 0 : -EIO;
>  }
>  
> +static int rtpse_mcu_get_global_budget_idx(struct rtpse_mcu_ctrl *pse, u8 *budget_idx)
> +{

[ ... ]

> +	if (resp.payload[4] > 0x7)
> +		return -ERANGE;
> +
> +	*budget_idx = resp.payload[4];
> +	return 0;
> +}
> +

[ ... ]

> +static int rtpse_mcu_apply_global_budget(struct rtpse_mcu_ctrl *pse,
> +					 struct regulator *vmain)
> +{

[ ... ]

> +	ret = regulator_request_power_budget(vmain, budget);
> +	if (ret)
> +		return ret;
> +	pse->requested_budget_mW = budget;
> +
> +	ret = rtpse_mcu_get_global_budget_idx(pse, &budget_idx);
> +	if (ret)
> +		return ret;
> +
> +	/* Retain the programmed MCU limit even if later probe steps fail. */
> +	return rtpse_mcu_set_global_budget(pse, budget_idx, budget_raw);
> +}

[Severity: Low]
rtpse_mcu_get_global_budget_idx() accepts payload[4] values from 0 to 7,
which suggests the MCU has up to eight budget banks. The limit is written
only to the bank that is active at probe time, and the index is never
read again. The other banks keep their firmware or EEPROM limits.

What happens if the MCU firmware switches its active bank after probe?
For example, PSU presence inputs could change on a board with redundant
or hot-plug PSUs. Would the MCU then enforce a firmware default limit
that has nothing to do with requested_budget_mW? The reservation in the
regulator core and the limit enforced in hardware would then disagree.

It isn't clear that any of the supported boards switch banks at runtime.
Programming every bank with the same static value would not obviously be
correct either. Should this limitation at least be documented?

[ ... ]

> @@ -837,6 +930,20 @@ int rtpse_mcu_register(struct rtpse_mcu_ctrl *pse)
>  		return dev_err_probe(pse->dev, -EINVAL,
>  				     "dialect for chip is incomplete\n");
>  
> +	vmain = devm_regulator_get_optional(pse->dev, "vmain");
> +	if (PTR_ERR(vmain) == -ENODEV)
> +		vmain = NULL;
> +	else if (IS_ERR(vmain))
> +		return dev_err_probe(pse->dev, PTR_ERR(vmain),
> +				     "failed to get vmain supply\n");
> +

[Severity: Low]
Here vmain is used only for budget accounting. Nothing takes an enable
reference on it. There is no regulator_enable(), and no
regulator_is_enabled() check runs before the MCU budget is programmed,
the ports are ungated and the PSE controller is registered.

The PI regulators that pse_core registers take their supply from each
PI's vpwr, not from vmain, so vmain's use_count stays at zero.

Suppose a board describes vmain-supply as a switchable regulator without
regulator-always-on, such as a regulator-fixed with an enable GPIO, or
one marked only regulator-boot-on. Would regulator_late_cleanup() then
switch the PoE rail off after boot?

drivers/regulator/core.c:regulator_late_cleanup() {
    ...
	if (rdev->use_count)
		goto unlock;
    ...
	if (have_full_constraints()) {
		...
		ret = _regulator_do_disable(rdev);
    ...
}

In that case the MCU would still believe the programmed budget is
available, and the driver would not report an error.

The commit message says:

    Use the regulator only for budget accounting, leaving the rail
    externally controlled or marked with regulator-always-on.

The binding also says the supply is used for power-budget accounting
only, so such a DT would go against the documented expectation.

Would it be worth enforcing that requirement instead of assuming it?
That could be a regulator_is_enabled() check at probe, or a
regulator_enable() call, which would be a no-op on a truly fixed rail.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116115224.1454885-1-jonas%40jonasjelonek.de
