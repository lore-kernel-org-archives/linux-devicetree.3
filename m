Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263E3921D8
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 20:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481496; cv=none; b=uuosrVDWyFcA1LXtayVq1GqJMNocxieo0Dkrao0Twx2+sMG+VgN4QBMbNFCqZhDkeDvYsKKsn1QAJT5sEvnYhQREHTZ9SxZYc0luxXqm/X8ckvHcPp3Xm/cLdkWN0alhD0Tc3Dok1E6hU6YQXLz86gfqWD0UiHN3BruGh4lzpOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481496; c=relaxed/simple;
	bh=lNA9sAMenH0cbDuKdb0bESSCAM0NIQ5a8wemeE9UeE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GUxceF9O6M7Hnok8PqBAwawZfW2M1LAwJztmGuhayLh08E3F06tGaHfqcyGx3gvY4xBY1feeLW5GkpLV/Mg7Y0qsKLlbx5tAoTSc844pURtD6kXWLhbN6nRBP9DsynoHgW92wtK21tQqU52rJXh8qheKsKGJnGnMshTLH2BF9vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGuQtEVK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGuQtEVK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753E21F000E9;
	Tue, 11 Aug 2026 20:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786481494;
	bh=cTl3i1vOZJhofNJ0s1amllzEXZeyy6ZYq1H+0MqYMnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dGuQtEVKHF9Xkp6M/5PjnHwGYw1XK4GELqSh2bZh8WGrdrCjVUaGwq1xTkMgsa8GB
	 mhfqQsDBd6dGusSU+eG99KCQUsl62JZcpjb0pzss78N9GDsmd9VDRshRoiEyO6Npzh
	 mNNpegKD4jXIeUCrtiBj+td/Qy+kLa5lLkWUWY8XJZ/uGMcilogrIOFa8INBIzuLKy
	 pfaC+/ekkSVgnIZNqCQ7QoUsrbdP/2CPyaP4Golz7rQiMECqwcmzoeinTN0XtT+JRt
	 999Fi1cQU8/uZSslYYsYmOFjdaJ4rf34BWBLV2bPNcOcDkXO+/2khhyLdql7Vx9SdQ
	 HQsmmn5I7CKlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] power: supply: qcom_smbx: add SMB5 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robin Snyders" <robin@snyders.xyz>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260811-submit-qcom-smbx-send-v1-v1-2-feec6cfa123a@snyders.xyz>
References: <20260811-submit-qcom-smbx-send-v1-v1-0-feec6cfa123a@snyders.xyz>
 <20260811-submit-qcom-smbx-send-v1-v1-2-feec6cfa123a@snyders.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 20:51:33 +0000
Message-Id: <20260811205134.753E21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Probe failure leaves SMB5 charging and USB input permanently disab=
led.
- [High] Watchdog configuration in `smb5_init_seq` uses hardcoded SMB2 offs=
ets, corrupting unrelated hardware blocks.

Pre-existing issues:
- [High] Missing battery voltage properties cause unsigned integer underflo=
w and write garbage hardware configurations on SMB2.
- [High] Logic bug in `smb2_get_prop_health` masks critical hardware faults=
 like overvoltage and overheating.
- [High] The watchdog interrupt handler writes to a fixed PMIC address inst=
ead of the relative charger base, corrupting unrelated hardware.
--

--- Patch [2]: [PATCH 2/3] power: supply: qcom_smbx: add SMB5 support ---
commit 6307e65683cce1f0d817fcc2cf3983ee19ae24c0
Author: Casey Connolly <casey.connolly@linaro.org>

power: supply: qcom_smbx: add SMB5 support

Introduce support for the SMB5 charger found on PM8150B and other
modern Qualcomm PMICs. It selects register layout and limits from
match data, and suspends USB input/charging during init.

> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom=
_smbx.c
> index 67fdb43353388..09d9e0f95cb56 100644
> --- a/drivers/power/supply/qcom_smbx.c
> +++ b/drivers/power/supply/qcom_smbx.c

[ ... ]

> @@ -633,19 +761,19 @@ static int smb_get_prop_health(struct smb_chip *chi=
p, int *val)
>  	}
> =20
>  	switch (stat) {
> -	case CHARGER_ERROR_STATUS_BAT_OV_BIT:
> +	case SMB2_CHARGER_ERROR_STATUS_BAT_OV_BIT:
>  		*val =3D POWER_SUPPLY_HEALTH_OVERVOLTAGE;
>  		return 0;

[ ... ]

> -	case BAT_TEMP_STATUS_HOT_SOFT_LIMIT_BIT:
> +	case SMB2_BAT_TEMP_STATUS_HOT_SOFT_LIMIT_BIT:
>  		*val =3D POWER_SUPPLY_HEALTH_WARM;
>  		return 0;
>  	default:
>  		*val =3D POWER_SUPPLY_HEALTH_GOOD;
>  		return 0;
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but does this switch statement correctly hand=
le
cases where multiple status bits are set?

Looking at smb2_get_prop_health(), the switch evaluates the unmasked regist=
er
value. If a normal status bit is active alongside a fault bit, it seems the
exact match fails and it falls through to the default case, incorrectly
returning POWER_SUPPLY_HEALTH_GOOD during hardware faults.

[ ... ]

> @@ -773,7 +916,7 @@ static irqreturn_t smb_handle_wdog_bark(int irq, void=
 *data)
>  }
> =20
>  static const struct power_supply_desc smb_psy_desc =3D {
> -	.name =3D "pmi8998_charger",
> +	.name =3D "SMB2_charger",

[Severity: High]
This is a pre-existing issue, but does smb_handle_wdog_bark() write to the
correct PMIC hardware block?

In smb_handle_wdog_bark(), the code performs a register write to the absolu=
te
address BARK_BITE_WDOG_PET. It omits the chip->base offset which is used by
other register accesses to target the correct peripheral block. Could this
corrupt unrelated PMIC hardware blocks when the watchdog interrupt fires?

[ ... ]

> @@ -787,16 +930,84 @@ static const struct power_supply_desc smb_psy_desc =
=3D {
>  };
> =20
>  /* Init sequence derived from vendor downstream driver */
> -static const struct smb_init_register smb_init_seq[] =3D {
> -	{ .addr =3D AICL_RERUN_TIME_CFG, .mask =3D AICL_RERUN_TIME_MASK, .val =
=3D 0 },
> +static const struct smb_init_register smb5_init_seq[] =3D {

[ ... ]

> +	/* Disable watchdog */
> +	{ .addr =3D SNARL_BARK_BITE_WD_CFG, .mask =3D 0xff, .val =3D 0 },
> +	{ .addr =3D WD_CFG,
> +	  .mask =3D WATCHDOG_TRIGGER_AFP_EN_BIT | WDOG_TIMER_EN_ON_PLUGIN_BIT |
> +		  BARK_WDOG_INT_EN_BIT,
> +	  .val =3D 0 },

[Severity: High]
Are these register offsets correct for SMB5 devices?

In smb5_init_seq(), SNARL_BARK_BITE_WD_CFG and WD_CFG appear to use hardcod=
ed
SMB2 absolute offsets (0x653 and 0x651). When these are added to chip->base
in smb_init_hw(), will this write the watchdog configuration to the wrong
hardware block on SMB5 PMICs?

[ ... ]

> @@ -965,7 +1237,34 @@ static int smb_probe(struct platform_device *pdev)

[ ... ]

> +	if (chip->gen =3D=3D SMB5) {
> +		/* Do not use bootloader charge limits while configuring SMB5. */
> +		rc =3D regmap_update_bits(chip->regmap,
> +					chip->base + USBIN_CMD_IL,
> +					USBIN_SUSPEND_BIT, USBIN_SUSPEND_BIT);
> +		if (rc < 0)
> +			return dev_err_probe(chip->dev, rc,
> +					     "could not suspend USB input\n");
> +
> +		rc =3D regmap_update_bits(chip->regmap,
> +					chip->base + CHARGING_ENABLE_CMD,
> +					CHARGING_ENABLE_CMD_BIT, 0);
> +		if (rc < 0)
> +			return dev_err_probe(chip->dev, rc,
> +					     "could not disable charging\n");
> +	}
> +

[Severity: High]
If any subsequent initialization step fails and probe returns early, does
this leave SMB5 charging and USB input permanently disabled?

In smb_probe(), the USBIN_SUSPEND_BIT is set and CHARGING_ENABLE_CMD_BIT is
cleared. If probe subsequently fails (for example, due to a missing device
tree property or IIO channel), the function returns without restoring these
bits. Could this prevent the device from charging or receiving USB power
until it is rebooted?

[ ... ]

> @@ -999,11 +1298,66 @@ static int smb_probe(struct platform_device *pdev)

[ ... ]

> +	} else {
> +		rc =3D (chip->batt_info->voltage_max_design_uv -
> +		      match_data->fv_min_uv) / match_data->fv_step_uv + 1;
> +		rc =3D regmap_update_bits(chip->regmap,
> +					chip->base + FLOAT_VOLTAGE_CFG,
> +					FLOAT_VOLTAGE_SETTING_MASK, rc);
> +		if (rc < 0)
> +			return dev_err_probe(chip->dev, rc,
> +					     "could not set vbat max\n");
> +	}

[Severity: High]
This is a pre-existing issue, but does this calculation handle missing
battery device tree properties safely?

If the battery node lacks a maximum voltage, power_supply_get_battery_info()
populates voltage_max_design_uv with a negative error code (like -EINVAL).
In smb_probe(), subtracting the unsigned fv_min_uv from this negative value
could cause an unsigned integer underflow, writing a garbage configuration
value to the FLOAT_VOLTAGE_CFG hardware register.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811-submit-qco=
m-smbx-send-v1-v1-0-feec6cfa123a@snyders.xyz?part=3D2
