Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512741;
	b=FjNL9SlGUBE9ucnK2tTrZcoRNSG6+gDzXdK4kaDZ1MNuqKubOxbNMlhvY0St4Qmm30JC
	 s10AfFzxwwozjiQN8NKFvDpXIMDu4IDXevlv6xEQjFVE3z1TO8FsRUnHd56yE5VexPjIC
	 APBDILUBMmIQtcZOLBHaLoL/u/1AzC5nfZw7ODjuhAOVKIeE/yjAoeXIJAYrFqnzyOM43
	 Cd31M/8vfm+RYCCdM22zY1NtuWqwSD3zFdIXaiU4apmw7yj3nirclBREcZgG/OXh6rEvf
	 9IqO6hycLoYcitHf9B6nYm5DU7wBufOD+G7RifZhvokc3A6e1RmRlxOdwfp9tahuYaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512741;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hWm0ynVXvG5AXrmZ+5Y1uetN5AJI0o8muWb3BlgUWHQ=;
	b=pJIU3425WH2VN3SqJczdCr+2HbStoC27K2eIJNgt9MN2O0qH58RHyUPBoOuMDVFY2lO5
	 E4ip8kmPPczfrLUszp0wj5dpL8pgeoo1f7rWzGGzQSIPunlkNWe0n7Q+VMCvvlyEeieJb
	 ME47jBgKdEsD5r0LEqptKlUeDQTgqU+S4fbsR3Xxpvyyo6j1K5p7gr/5y6za7r+0I8mkT
	 wgyux/XMWqiBaLdfqw+e4/XQA3V6M7CAqSuBAG4kFVQ/5wC/afURiCNI7hRgcZ60ySxts
	 CKhp/PXQ/sgfde3XFDMVqH4PWm8QFEgp2DtYeBZgMPLUCpafrbMdDCq7XBkO/Lm0vdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fY/NoWzR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13E3606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fY/NoWzR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3941F000C0;
	Tue, 24 Nov 2026 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795512741;
	bh=hWm0ynVXvG5AXrmZ+5Y1uetN5AJI0o8muWb3BlgUWHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fY/NoWzRRMazt8yhyI3ajYnrMzdrapAoKyA9zY3smP1onmhip0Chua3/XM8cPomkt
	 9hkYsMvrtwXcYJhOcK2FGqUCS5nSWGqmDUtpkxyDEvL4uprn0zHoxsgwmu5bDnoYMQ
	 Pi6N4KUdmU3KdVjoUzBhVD8rynSfVjPP6uZSFxi86mTgIci8+wzx0+SKextBLEIItN
	 9uYsDd/oG3sEliKpD0rSMksVLDO+u0Wva3xNQgNSRleQO4Qmv2qnwMUcZJE1MLYCOP
	 xpheucmTI9oUr94H3itn9+91WH1sTFrcZrZzMTOEh4nsHzmyJ1IOn39wKIEcSBTMOa
	 wNGKG3glmQ8SQ==
Message-ID: <sashiko-outbox-230842@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] power: supply: qcom_smbx: Add SMBLite charger
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raj Aryan" <raj.aryan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-smblite-charger-for-pm4125-v1-2-2132c9f0601f@oss.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
 <20261124-smblite-charger-for-pm4125-v1-2-2132c9f0601f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:32:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 13 potential
issues to consider:
- [High] power: supply: qcom_smbx: missing chip->base in
  smb_apsd_get_charger_type()
- [High] power: supply: qcom_smbx: wrong register written in
  smblite_enable_jeita()
- [High] power: supply: qcom_smbx: unsafe 4.54V float voltage write in
  smb_init_hw()
- [High] power: supply: qcom_smbx: watchdog disables charging during
  system suspend
- [Medium] power: supply: qcom_smbx: invalid status and rechg writes in
  smb_init_hw()
- [Medium] power: supply: qcom_smbx: stale charge_status in
  smb_get_property()
- [Medium] power: supply: qcom_smbx: missing SMBLite rerun in
  smb_status_change_work()
- [Medium] power: supply: qcom_smbx: unused resources and ABI mismatches
  in smb_probe()
- [Medium] power: supply: qcom_smbx: missing BAT_OV check in
  smb_get_prop_health()
- [Medium] power: supply: qcom_smbx: watchdog left armed on probe
  failure or unbind
- [Medium] power: supply: qcom_smbx: stale usb_type_override on replug
  in smb_handle_usb_plugin()
- [Medium] power: supply: qcom_smbx: race on usb_type_override and ICL
  in smb_status_change_work()
- [Medium] power: supply: qcom_smbx: smblite_init_typec() clobbers
  Type-C peripheral at 0x1500
--

commit 2884aa25bff648d3cce68c70d47efa2d6630bb25
Author: Raj Aryan <raj.aryan@oss.qualcomm.com>

power: supply: qcom_smbx: Add SMBLite charger support

This commit extends the qcom_smbx charger driver to support the SMBLite
charger block found on the PM4125 PMIC alongside existing SMB2 PMICs.

> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom=
_smbx.c
> index 52bb5a6eb145d..54b2942e2f5ad 100644
> --- a/drivers/power/supply/qcom_smbx.c
> +++ b/drivers/power/supply/qcom_smbx.c
[ ... ]
> @@ -451,7 +665,15 @@ static int smb_apsd_get_charger_type(struct smb_chip=
 *chip, int *val)
>  		return rc;
>  	}
> =20
> -	rc =3D regmap_read(chip->regmap, chip->base + APSD_STATUS, &apsd_stat);
> +	if (chip->type =3D=3D SMBLITE) {
> +		apsd_reg   =3D SMBLITE_USBIN_BASE + SMBLITE_APSD_STATUS;
> +		result_reg =3D SMBLITE_USBIN_BASE + SMBLITE_APSD_RESULT_STATUS;
> +	} else {
> +		apsd_reg   =3D APSD_STATUS;
> +		result_reg =3D APSD_RESULT_STATUS;
> +	}
> +
> +	rc =3D regmap_read(chip->regmap, apsd_reg, &apsd_stat);

[Severity: High]
Does the else branch omit chip->base when computing apsd_reg and
result_reg?

On SMB2 (PMI8998 and PM660), APSD_STATUS (0x307) and APSD_RESULT_STATUS
(0x308) are offsets relative to chip->base (0x1000).  Reading bare 0x0307
and 0x0308 breaks APSD charger type detection and POWER_SUPPLY_PROP_USB_TYPE
on existing SMB2 devices, and causes smb_status_change_work() to spin in a
1 Hz retry loop without setting the input current limit.

[ ... ]
> @@ -562,8 +883,17 @@ static void smb_status_change_work(struct work_struc=
t *work)
>  	chip =3D container_of(work, struct smb_chip, status_change_work.work);
> =20
>  	smb_get_prop_usb_online(chip, &usb_online);
> -	if (!usb_online)
> +	if (!usb_online) {
> +		chip->usb_type_override =3D false;
> +		chip->usb_type =3D POWER_SUPPLY_USB_TYPE_UNKNOWN;
>  		return;
> +	}
> +
> +	if (chip->type =3D=3D SMBLITE && chip->usb_type_override) {
> +		smb_set_current_limit(chip, smb_usb_type_current_ua(chip->usb_type));
> +		power_supply_changed(chip->chg_psy);
> +		return;
> +	}
> =20
>  	for (count =3D 0; count < 3; count++) {
>  		dev_dbg(chip->dev, "get charger type retry %d\n", count);
> @@ -579,27 +909,16 @@ static void smb_status_change_work(struct work_stru=
ct *work)
>  	}
> =20
>  	if (rc < 0) {
> -		rc =3D regmap_update_bits(chip->regmap, chip->base + CMD_APSD,
> -					APSD_RERUN_BIT, APSD_RERUN_BIT);
> +		if (chip->type !=3D SMBLITE)
> +			rc =3D regmap_update_bits(chip->regmap, chip->base + CMD_APSD,
> +						APSD_RERUN_BIT, APSD_RERUN_BIT);
>  		schedule_delayed_work(&chip->status_change_work,
>  				      msecs_to_jiffies(1000));
>  		dev_dbg(chip->dev, "get charger type failed, rerun apsd\n");
>  		return;
>  	}

[Severity: Medium]
Should SMBLite trigger an APSD rerun via SMBLITE_USBIN_BASE +
SMBLITE_CMD_APSD here instead of skipping the write?

When smb_apsd_get_charger_type() returns -EAGAIN after three retries,
skipping the rerun command leaves SMBLITE_CMD_APSD unused while
status_change_work reschedules itself every second waiting for APSD to
complete.

> -	switch (charger_type) {
> -	case POWER_SUPPLY_USB_TYPE_CDP:
> -		current_ua =3D CDP_CURRENT_UA;
> -		break;
> -	case POWER_SUPPLY_USB_TYPE_DCP:
> -		current_ua =3D DCP_CURRENT_UA;
> -		break;
> -	case POWER_SUPPLY_USB_TYPE_SDP:
> -	default:
> -		current_ua =3D SDP_CURRENT_UA;
> -		break;
> -	}
> -
> +	current_ua =3D smb_usb_type_current_ua(charger_type);
>  	smb_set_current_limit(chip, current_ua);
>  	power_supply_changed(chip->chg_psy);
>  }

[Severity: Medium]
Can smb_status_change_work() race with smb_set_property() and overwrite an
active usb_type_override current limit?

kworker (status_change_work)      CPU1 (smb_set_property)
----------------------------      -----------------------
if (chip->usb_type_override)
  /* false */
for (count =3D 0; count < 3; ...)
  msleep(100)
                                  case POWER_SUPPLY_PROP_USB_TYPE:
                                    chip->usb_type =3D ..._DCP;
                                    chip->usb_type_override =3D true;
                                    smb_set_current_limit(chip, 1500000);
smb_set_current_limit(chip,
                      current_ua) <-- overwrites 1.5 A with APSD limit

Nothing serializes chip->usb_type_override, chip->usb_type, and
smb_set_current_limit() between smb_set_property() and
smb_status_change_work().  In addition, setting POWER_SUPPLY_PROP_USB_TYPE
to POWER_SUPPLY_USB_TYPE_UNKNOWN in smb_set_property() clears
chip->usb_type_override without updating the hardware current limit or
rescheduling status_change_work.

[ ... ]
> @@ -625,11 +949,48 @@ static int smb_get_iio_chan(struct smb_chip *chip, =
struct iio_channel *chan,
>  	return iio_read_channel_processed(chan, val);
>  }
> =20
> +/*
> + * smb_get_prop_health - battery health based on temperature status.
> + *
> + * SMBLite: BATTERY_TEMP_STATUS_REG =3D batif_base + 0x0C (smblite-reg.h)
> + * SMB2:    BATTERY_CHARGER_STATUS_2 =3D chip->base + 0x07
> + */
>  static int smb_get_prop_health(struct smb_chip *chip, int *val)
>  {
>  	int rc;
>  	unsigned int stat;
> =20
> +	if (chip->type =3D=3D SMBLITE) {
> +		rc =3D regmap_read(chip->regmap,
> +				 SMBLITE_BATIF_BASE + SMBLITE_BATIF_JEITA_COMP_STATUS,
> +				 &stat);
> +		if (rc < 0) {
> +			dev_err(chip->dev,
> +				"Couldn't read SMBLITE JEITA status rc=3D%d\n", rc);
> +			return rc;
> +		}
> +		if (stat & (SMBLITE_JEITA_ADC_THOT_AFP_BIT |
> +			    SMBLITE_JEITA_ADC_THOT_BIT)) {
> +			*val =3D POWER_SUPPLY_HEALTH_OVERHEAT;
> +			return 0;
> +		}
> +		if (stat & (SMBLITE_JEITA_ADC_TCOLD_AFP_BIT |
> +			    SMBLITE_JEITA_ADC_TCOLD_BIT)) {
> +			*val =3D POWER_SUPPLY_HEALTH_COLD;
> +			return 0;
> +		}
> +		if (stat & SMBLITE_JEITA_ADC_WARM_BIT) {
> +			*val =3D POWER_SUPPLY_HEALTH_WARM;
> +			return 0;
> +		}
> +		if (stat & SMBLITE_JEITA_ADC_COOL_BIT) {
> +			*val =3D POWER_SUPPLY_HEALTH_COOL;
> +			return 0;
> +		}
> +		*val =3D POWER_SUPPLY_HEALTH_GOOD;
> +		return 0;
> +	}

[Severity: Medium]
Does the SMBLite path in smb_get_prop_health() miss battery overvoltage
faults?

Unlike the SMB2 path below it, which checks CHARGER_ERROR_STATUS_BAT_OV_BIT
and reports POWER_SUPPLY_HEALTH_OVERVOLTAGE, the SMBLite branch never checks
SMBLITE_BAT_OV_BIT in SMBLITE_CHGR_BASE + SMBLITE_CHARGER_VBAT_STATUS, so
POWER_SUPPLY_PROP_HEALTH reports POWER_SUPPLY_HEALTH_GOOD during an active
overvoltage event.

[ ... ]
> @@ -681,7 +1044,32 @@ static int smb_get_property(struct power_supply *ps=
y,
>  	case POWER_SUPPLY_PROP_HEALTH:
>  		return smb_get_prop_health(chip, &val->intval);
>  	case POWER_SUPPLY_PROP_USB_TYPE:
> +		if (chip->type =3D=3D SMBLITE && chip->usb_type_override) {
> +			int usb_online =3D 0;
> +
> +			smb_get_prop_usb_online(chip, &usb_online);
> +			if (usb_online) {
> +				val->intval =3D chip->usb_type;
> +				return 0;
> +			}
> +		}
>  		return smb_apsd_get_charger_type(chip, &val->intval);
> +	case POWER_SUPPLY_PROP_CHARGE_TYPE:
> +		if (chip->type !=3D SMBLITE)
> +			return -EOPNOTSUPP;
> +		switch (chip->charge_status) {
> +		case POWER_SUPPLY_STATUS_FULL:
> +			val->intval =3D POWER_SUPPLY_CHARGE_TYPE_NONE;
> +			break;
> +		case POWER_SUPPLY_STATUS_CHARGING:
> +			val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +			break;
> +		default:
> +			val->intval =3D POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
> +			break;
> +		}
> +
> +		return 0;

[Severity: Medium]
Can POWER_SUPPLY_PROP_CHARGE_TYPE report stale state from
chip->charge_status?

smb_get_property() does not refresh the hardware state before reading
chip->charge_status, and smb_get_prop_status() returns early when
!usb_online without updating chip->charge_status:

drivers/power/supply/qcom_smbx.c:smb_get_prop_status() {
	rc =3D smb_get_prop_usb_online(chip, &usb_online);
	if (!usb_online) {
		*val =3D POWER_SUPPLY_STATUS_DISCHARGING;
		return rc;
	}
}

After unplugging a charger while charging, POWER_SUPPLY_PROP_STATUS reports
POWER_SUPPLY_STATUS_DISCHARGING while POWER_SUPPLY_PROP_CHARGE_TYPE stays
stuck at POWER_SUPPLY_CHARGE_TYPE_STANDARD.

[ ... ]
> @@ -709,44 +1121,93 @@ static int smb_set_property(struct power_supply *p=
sy,
>  static int smb_property_is_writable(struct power_supply *psy,
>  				     enum power_supply_property psp)
>  {
> +	struct smb_chip *chip =3D power_supply_get_drvdata(psy);
> +
>  	switch (psp) {
>  	case POWER_SUPPLY_PROP_STATUS:
> +		return chip->type !=3D SMBLITE;
>  	case POWER_SUPPLY_PROP_CURRENT_MAX:
>  		return 1;
> +	case POWER_SUPPLY_PROP_USB_TYPE:
> +		return chip->type =3D=3D SMBLITE;
>  	default:
>  		return 0;
>  	}
>  }
[ ... ]
>  static irqreturn_t smb_handle_usb_plugin(int irq, void *data)
>  {
>  	struct smb_chip *chip =3D data;
> +	int usb_online =3D 0;
> =20
>  	power_supply_changed(chip->chg_psy);
> +	smb_get_prop_usb_online(chip, &usb_online);
> =20
> +	if (!usb_online)
> +		goto schedule_work;

[Severity: Medium]
Does leaving chip->usb_type_override set on unplug cause a stale USB type
and current limit to be applied if a cable is replugged within 1500 ms?

When a charger is unplugged, smb_handle_usb_plugin() leaves
chip->usb_type_override set until status_change_work runs 1500 ms later.
If a different cable (for example, a 500 mA SDP host port after a 1.5 A DCP
charger) is connected before that 1500 ms timer fires, usb_online is true
when status_change_work runs, so the !usb_online reset is skipped and the
previous charger's current limit is programmed onto the new port.

[ ... ]
>  static irqreturn_t smb_handle_wdog_bark(int irq, void *data)
>  {
>  	struct smb_chip *chip =3D data;
> +	u16 reg;
>  	int rc;
> =20
>  	power_supply_changed(chip->chg_psy);
> =20
> -	rc =3D regmap_write(chip->regmap, chip->base + BARK_BITE_WDOG_PET,
> -			  BARK_BITE_WDOG_PET_BIT);
> +	if (chip->type =3D=3D SMBLITE)
> +		reg =3D SMBLITE_MISC_BASE + SMBLITE_BARK_BITE_WDOG_PET;
> +	else
> +		reg =3D chip->base + BARK_BITE_WDOG_PET;
> +
> +	rc =3D regmap_write(chip->regmap, reg, BARK_BITE_WDOG_PET_BIT);
>  	if (rc < 0)
>  		dev_err(chip->dev, "Couldn't pet the dog rc=3D%d\n", rc);
> =20
>  	return IRQ_HANDLED;
>  }
[ ... ]
> +static int smblite_init_typec(struct smb_chip *chip)
> +{
> +	unsigned int val;
> +	int rc;
> +
> +	if (chip->type !=3D SMBLITE)
> +		return 0;
> +	if (chip->connector_type !=3D CONNECTOR_TYPE_TYPEC)
> +		return 0;
> +
> +	rc =3D regmap_read(chip->regmap,
> +			 SMBLITE_TYPEC_BASE + SMBLITE_LEGACY_CABLE_STATUS, &val);
> +	if (rc < 0)
> +		return rc;
> +
> +	if (val & SMBLITE_TYPEC_LEGACY_CABLE_STATUS_BIT) {
> +		dev_dbg(chip->dev, "Resetting legacy cable detection\n");
> +		rc =3D regmap_update_bits(chip->regmap,
> +					SMBLITE_TYPEC_BASE + SMBLITE_TYPE_C_MODE_CFG,
> +					EN_TRY_SNK_BIT | EN_SNK_ONLY_BIT, 0);
> +		if (rc < 0)
> +			return rc;
> +		msleep(50);
> +	}
> +
> +	rc =3D regmap_update_bits(chip->regmap,
> +				SMBLITE_TYPEC_BASE + SMBLITE_TYPE_C_MODE_CFG,
> +				EN_TRY_SNK_BIT | EN_SNK_ONLY_BIT,
> +				EN_TRY_SNK_BIT);
> +	if (rc < 0)
> +		return rc;
> +
> +	return regmap_update_bits(chip->regmap,
> +				  SMBLITE_TYPEC_BASE + SMBLITE_TYPE_C_EXIT_STATE_CFG,
> +				  SEL_SRC_UPPER_REF_BIT, SEL_SRC_UPPER_REF_BIT);
> +}

[Severity: Medium]
Does smblite_init_typec() overwrite registers owned by the PM4125 Type-C
driver at 0x1500?

On PM4125, the SPMI Type-C peripheral at 0x1500 is a separate devicetree
node (typec@1500) managed by qcom_pmic_typec, which controls
TYPE_C_MODE_CFG (0x1544) and TYPE_C_EXIT_STATE_CFG (0x1550) under
pmic_typec_port->lock.  Modifying 0x1544 and 0x1550 directly through the
parent PMIC regmap during charger probe clobbers the TCPM port state if
qcom_pmic_typec has already started.

[ ... ]
> +/*
> + * smblite_enable_jeita - enable JEITA hardware comparators.
> + *
> + * Downstream smblite_init_hw() uses a masked write on
> + * CHGR_FAST_CHARGE_SAFETY_TIMER_CFG_REG (chg_base + 0x90):
> + *   mask =3D 0x0B  (bits [3:1] =3D timer select, bit[0] =3D enable)
> + *   val  =3D 0x0A  (FAST_CHARGE_SAFETY_TIMER_768_MIN | enable)
> + * Use regmap_update_bits to touch only those bits.
> + */
> +static int smblite_enable_jeita(struct smb_chip *chip)
> +{
> +	if (chip->type !=3D SMBLITE)
> +		return 0;
> +
> +	return regmap_update_bits(chip->regmap,
> +				  SMBLITE_CHGR_BASE + 0x90,
> +				  0x0B, 0x0A);
> +}

[Severity: High]
Does smblite_enable_jeita() write to the fast-charge safety timer register
(SMBLITE_CHGR_BASE + 0x90) instead of SMBLITE_BATIF_BASE +
SMBLITE_BATIF_JEITA_EN_CFG (0x127F)?

On SMB2, offset 0x90 in the charger block is JEITA_EN_CFG, whereas on
SMBLite JEITA enable is in BATIF at SMBLITE_BATIF_BASE +
SMBLITE_BATIF_JEITA_EN_CFG (0x127F), which smb_init_hw() explicitly clears
to 0x00.  Because 0x127F is never re-enabled, hardware JEITA thermal
protection and SMBLITE_BATIF_JEITA_COMP_STATUS health reporting remain
disabled (and even for the safety timer at 0x1090, val 0x0A clears bit 0).
Also, smb_probe() calls smblite_enable_jeita() unconditionally even when
the DT threshold properties are absent, and ignores the return values of
both smblite_enable_jeita() and smblite_write_jeita_16().

[ ... ]
> +	/*
> +	 * Enable watchdog: WDOG_TIMER_EN_ON_PLUGIN + BARK_WDOG_INT_EN
> +	 * + BITE_WDOG_DISABLE_CHARGING (misc_base + 0x58)
> +	 * Matches downstream WD_CFG_REG enable sequence.
> +	 */
> +	{ .addr =3D SMBLITE_MISC_BASE + SMBLITE_WD_CFG,
> +	  .mask =3D SMBLITE_WDOG_TIMER_EN_BIT | SMBLITE_WDOG_TIMER_EN_ON_PLUGIN=
_BIT |
> +		  SMBLITE_BARK_WDOG_INT_EN_BIT |
> +		  SMBLITE_BITE_WDOG_DISABLE_CHARGING_CFG_BIT,
> +	  .val =3D SMBLITE_WDOG_TIMER_EN_ON_PLUGIN_BIT |
> +		  SMBLITE_BARK_WDOG_INT_EN_BIT |
> +		  SMBLITE_BITE_WDOG_DISABLE_CHARGING_CFG_BIT },

[Severity: High]
Will the SMBLite watchdog bite and disable charging 24 seconds after the
system enters suspend?

smblite_init_seq enables the watchdog on plugin with a 16-second bark
timeout, an 8-second bite timeout, and
SMBLITE_BITE_WDOG_DISABLE_CHARGING_CFG_BIT set, but the driver defines no
PM suspend/resume callbacks to disable the watchdog during suspend and only
marks cable_irq as a wake IRQ.  When the system suspends while plugged in,
wdog-bark is not serviced and the watchdog disables charging after 24
seconds.  While awake, smb_handle_wdog_bark() also calls
power_supply_changed() on every 16-second bark, causing unnecessary
pm_stay_awake() wakeups and userspace uevents even when nothing changed.

[ ... ]
> +	/*
> +	 * SMBLite vendor bring-up register writes.
> +	 * These are undocumented initialisation values derived from the
> +	 * downstream qpnp-smblite driver.  They are SMBLITE-only.
> +	 */
> +	if (chip->type =3D=3D SMBLITE) {
> +		regmap_write(chip->regmap,
> +			     SMBLITE_CHGR_BASE + SMBLITE_CHGR_FLOAT_VOLTAGE_CFG, 0x2F);
> +		regmap_write(chip->regmap,
> +			     SMBLITE_BATIF_BASE + SMBLITE_BATIF_BPD_CFG, 0x00);
> +		regmap_write(chip->regmap,
> +			     SMBLITE_BATIF_BASE + SMBLITE_BATIF_JEITA_EN_CFG, 0x00);
> +		regmap_write(chip->regmap,
> +			     SMBLITE_CHGR_BASE + SMBLITE_CHGR_CHG_INHIBIT_CFG, 0x00);
> +		regmap_write(chip->regmap,
> +			     SMBLITE_CHGR_BASE + SMBLITE_CHGR_RECHG_CFG, 0xC2);
> +		/* SOC recharge threshold =3D 250 (0xFA) -- aligned with
> +		 * SOC-based recharge strategy set at SMBLITE_CHGR_RECHG_CFG=3D0xC2
> +		 */
> +		regmap_write(chip->regmap,
> +			     SMBLITE_CHGR_BASE + SMBLITE_CHGR_RECHG_SOC_THD_CFG, 0xFA);
> +		regmap_write(chip->regmap,
> +			     SMBLITE_CHGR_BASE + SMBLITE_CHGR_CHG_TERM_CFG, 0x80);
> +		regmap_write(chip->regmap,
> +			     SMBLITE_USBIN_BASE + SMBLITE_USB_APSD_EN, 0x10);
> +		regmap_write(chip->regmap,
> +			     SMBLITE_USBIN_BASE + SMBLITE_USB_APSD_CFG, 0x00);
> +		/* 0x130c, 0x1340: no documented register at this offset */
> +		regmap_write(chip->regmap,
> +			     SMBLITE_CHGR_BASE + SMBLITE_CHGR_IBAT_STATUS, 0xc1);
> +		regmap_write(chip->regmap,
> +			     SMBLITE_CHGR_BASE + SMBLITE_CHGR_VFLT_STATUS, 0x82);
> +	}

[Severity: Medium]
Why does smb_init_hw() write 0xc1 and 0x82 to the read-only charger status
registers SMBLITE_CHGR_IBAT_STATUS (0x100A) and SMBLITE_CHGR_VFLT_STATUS
(0x100B)?

The comment right above those writes mentions USBIN offsets 0x130c and
0x1340, whereas the code writes to read-only CHGR status registers 0x100A
and 0x100B.  Also, writing 0xC2 to SMBLITE_CHGR_RECHG_CFG sets
SMBLITE_VBAT_BASED_RECHG_BIT (BIT(7)), which contradicts the comment and
commit message stating that SOC-based recharge is selected, and none of the
regmap_write() calls in this block check for errors.

> =20
>  	return 0;
>  }
> =20
>  static void smb_restore_charge_enable(void *data)
>  {
>  	struct smb_chip *chip =3D data;
> +	u16 reg;
>  	int rc;
> =20
> -	rc =3D regmap_update_bits(chip->regmap,
> -				chip->base + CHARGING_ENABLE_CMD,
> +	if (chip->type =3D=3D SMBLITE)
> +		reg =3D SMBLITE_CHGR_BASE + SMBLITE_CHARGING_ENABLE_CMD;
> +	else
> +		reg =3D chip->base + CHARGING_ENABLE_CMD;
> +
> +	rc =3D regmap_update_bits(chip->regmap, reg,
>  				CHARGING_ENABLE_CMD_BIT,
>  				chip->initial_charge_enable);
>  	if (rc < 0)

[Severity: Medium]
Does smb_restore_charge_enable() leave the SMBLite hardware watchdog armed
if smb_probe() fails after smb_init_hw() or if the driver is unbound?

smblite_init_seq enables SMBLITE_WD_CFG with
SMBLITE_BITE_WDOG_DISABLE_CHARGING_CFG_BIT set, but
smb_restore_charge_enable() only restores SMBLITE_CHARGING_ENABLE_CMD (and
is removed before probe returns).  Without the wdog-bark handler running to
pet the watchdog, it will bite 24 seconds after USB plugin and disable
charging in hardware.

[ ... ]
> @@ -1025,9 +1855,11 @@ static int smb_probe(struct platform_device *pdev)
>  				     "failed to register power supply\n");
> =20
>  	rc =3D power_supply_get_battery_info(chip->chg_psy, &chip->batt_info);
> -	if (rc)
> -		return dev_err_probe(chip->dev, rc,
> -				     "Failed to get battery info\n");
> +	if (rc || !chip->batt_info) {
> +		dev_warn(chip->dev,
> +			 "No battery info, skipping float voltage configuration\n");
> +		chip->batt_info =3D NULL;
> +	}
> =20
>  	rc =3D devm_delayed_work_autocancel(chip->dev, &chip->status_change_wor=
k,
>  					  smb_status_change_work);
> @@ -1035,6 +1867,9 @@ static int smb_probe(struct platform_device *pdev)
>  		return dev_err_probe(chip->dev, rc,
>  				     "Failed to init status change work\n");
> =20
> +	if (!chip->batt_info)
> +		goto init_irqs;
> +
>  	if (power_supply_battery_info_has_prop(chip->batt_info,
>  					       POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX)) {
>  		float_voltage_uv =3D
> @@ -1043,27 +1878,50 @@ static int smb_probe(struct platform_device *pdev)
>  					      POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN)) {
>  		float_voltage_uv =3D chip->batt_info->voltage_max_design_uv;
>  	} else {
> -		dev_warn(chip->dev, "No battery float voltage; preserving hardware set=
ting\n");
> -		goto skip_float_voltage;
> +		dev_warn(chip->dev,
> +			 "No battery float voltage; preserving hardware setting\n");
> +		goto init_irqs;
> +	}

[Severity: High]
Does skipping float voltage configuration here leave SMBLite charging
enabled at 4.54 V?

In smb_init_hw(), the SMBLite path enables charging at 1.5 A and
unconditionally writes 0x2F (3600000 + 47 * 20000 =3D 4540000 uV) to
SMBLITE_CHGR_FLOAT_VOLTAGE_CFG before smb_probe() reads the battery info.
If monitored-battery is omitted, has no voltage property, or
power_supply_get_battery_info() fails, jumping to init_irqs does not
preserve the hardware setting=E2=80=94it leaves the charger active at 4.54 =
V, which
can overcharge standard 4.2 V / 4.35 V / 4.4 V Li-ion cells.  Downgrading
power_supply_get_battery_info() errors to a warning also masks real errors
such as -ENOMEM or malformed battery DT nodes on both SMB2 and SMBLite.

[ ... ]
> @@ -1087,6 +1945,15 @@ static int smb_probe(struct platform_device *pdev)
>  	if (rc < 0)
>  		return dev_err_probe(chip->dev, rc, "Couldn't set wake irq\n");
> =20
> +	chip->vbus_reg =3D devm_regulator_get_optional(chip->dev, "vbus");
> +	if (IS_ERR(chip->vbus_reg)) {
> +		rc =3D PTR_ERR(chip->vbus_reg);
> +		if (rc =3D=3D -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		dev_warn(chip->dev, "vbus regulator not found, ignoring\n");
> +		chip->vbus_reg =3D NULL;
> +	}
> +
>  	devm_remove_action(chip->dev, smb_restore_charge_enable, chip);

[Severity: Medium]
Why does smb_probe() request a "vbus" regulator and a "chg_temp" IIO
channel that are never used anywhere in the driver?

Neither resource is documented in the DT bindings, and because
devm_regulator_get_optional() returns ERR_PTR(-ENODEV) when vbus-supply is
absent, every board prints a false "vbus regulator not found, ignoring"
warning at boot (or can return -EPROBE_DEFER after IRQs are already live).
Conversely, the PM4125 binding documents the "usbin_i" IIO channel, which
smb_probe() skips on SMBLite, and smb_property_is_writable() marks
POWER_SUPPLY_PROP_USB_TYPE writable in sysfs even though
Documentation/ABI/testing/sysfs-class-power defines usb_type as read-only
for USB charger supplies (in-kernel callers of power_supply_set_property()
do not check property_is_writeable()).  The struct smb_chip fields
ldo_mode, fcc_step_ua, fcc_max_ua, and charge_done are also written but
never read.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-smblite-ch=
arger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com?part=3D2
