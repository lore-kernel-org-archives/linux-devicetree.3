Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572153;
	b=YYU4iX2k58vkhJ13hJYlmQgly7XF/VrTVih921B4vsdAD664ycrorq747qFKqja1nOUj
	 uPcItRUVISuLmnBFdZhcP1ta6hTWCiVMipxkPSIv6BZX8ZHrRYozxtdpz29Q/tZdVRChV
	 1m+14UbPoOPQuNzeV2Tqq+voZis3pqj7U++CE0858zu6mh3ld90+RiDEBh1LEdL1TS5uc
	 BByRa+HWUuNkrb52ai1DCkhquC64TbcwVpSrNUfJC8FqtQQPea9W/1BkTPVZgcHXrk9Yz
	 am4eMS8+N2VsiuDKom8q+xqMUqXFIrJqgI7QzPB96sYL04O3wo2vcAph9tBiI/rwTjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572153;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BMCCRKg7bTdZFRCvcZYfC61/CcAuDazuklhXnWavkX8=;
	b=WfPrvtQhBAfvOX6gYNy1c36/HAbiWdPoQ/pwy82Cms7UQiQ/dCDsEZwXCoO4Tktg5nit
	 18dJFCQgyFaRCv7SrTVkFBpff3qqdlREEwnoJNkALbcxpDBOL119N61+GhMEu0nJ4Cf3G
	 VXg2GJay9ZDZIZoQvwiXsPZwlJoiRJK8wlaLoyvYGJB58ZNyCP8gU965QpPA+Nr/yXGu/
	 ciAI8V4R+3HXc+R0RUpw3PG4C30pimyIUEXWI9C5E02uShus5tBFgYKOZ7162xnP2sBLC
	 NHDyGhA8z7/3GHKQGgoYtB4+sZnjA+5HwL0SEDQqfXVQvWU4LI71fLYsNr2u6riJD3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsmBKLPc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241EA606A337
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsmBKLPc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886DB1F000D4;
	Wed, 21 Oct 2026 08:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792572152;
	bh=BMCCRKg7bTdZFRCvcZYfC61/CcAuDazuklhXnWavkX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gsmBKLPcf0+FiHDeqT2ok6Jnrc+r41D+7hEsXr6Q+Y6Xme0SLZDu+vtqYIdtIQ5t6
	 6mm1YoPbmfcX+Lql4xYUzbI/hx/11ERrbpJHPRcOXPlUvG9XVnXUZF058kA0lvhUJ1
	 X0z+k30Ml7FgdZ8z1dTlu3WISmjLON8a6TtRV+wJNQgVlR5id6HWdrVAM41nXCAPsf
	 /DSWhRLMcTwyhx+MSIcc8aBERbrz7c5L8MRAVdZgBL08nEIrSGALFuI956Pblgma9a
	 xWXjTsUjmrLdcKgtxlbupTJsegoB5HfziQdi03DmXT2EG1am7c19Y3nxbFEE6slSW4
	 tFavsXCn/3RbQ==
Message-ID: <sashiko-outbox-179982@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] power: supply: Add Qualcomm SMB1351 charger
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Nguyen" <thenguyen1024@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021082841.79147-3-thenguyen1024@gmail.com>
References: <20261021082841.79147-1-thenguyen1024@gmail.com>
 <20261021082841.79147-3-thenguyen1024@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 08:42:32 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] power: supply: qcom_smb1351: race on retry_until in smb1351_get_=
property()
--

commit 775470b6736c36c7e8120aec1a8d3f4b8da3feec
Author: Adrian Nguyen <thenguyen1024@gmail.com>

power: supply: Add Qualcomm SMB1351 charger driver

This commit adds a power supply driver for the Qualcomm SMB1351 and SMB1350
switch-mode battery chargers when powered from VBUS alone. The driver keeps
charging disabled via I2C, configures the float voltage from the monitored
battery, and reports online status, charging status, charge type, and float
voltage.

> diff --git a/drivers/power/supply/qcom_smb1351.c b/drivers/power/supply/q=
com_smb1351.c
> new file mode 100644
> index 0000000000000..8089051cb44ae
> --- /dev/null
> +++ b/drivers/power/supply/qcom_smb1351.c
> @@ -0,0 +1,426 @@

[ ... ]

> +static int smb1351_get_property(struct power_supply *psy,
> +				enum power_supply_property psp,
> +				union power_supply_propval *val)
> +{
> +	struct smb1351 *chip =3D power_supply_get_drvdata(psy);
> +	bool online =3D READ_ONCE(chip->online);
> +	unsigned int stat, vfloat;
> +	int ret;

[ ... ]

> +	/*
> +	 * The chip can lose VBUS, and with it its configuration, without the
> +	 * PMIC charger reporting a change. If it has been reset or does not
> +	 * answer, run the work again, unless a run with its own deadline is
> +	 * already pending. Report "Unknown" rather than an error, which would
> +	 * drop the whole uevent.
> +	 */
> +	ret =3D smb1351_read_status(chip, &stat);
> +	if (ret && !delayed_work_pending(&chip->work)) {
> +		WRITE_ONCE(chip->retry_until, jiffies +
> +			   msecs_to_jiffies(SMB1351_RETRY_TIMEOUT_MS));
> +		queue_delayed_work(system_freezable_wq, &chip->work, 0);
> +	}

[Severity: Medium]
Can smb1351_get_property() race with smb1351_work() or
smb1351_external_power_changed() when updating chip->retry_until and queuei=
ng
chip->work?

In process_one_work(), WORK_STRUCT_PENDING_BIT is cleared before invoking t=
he
work callback, so delayed_work_pending(&chip->work) returns false while
smb1351_work() is actively executing its I2C transfers.

When VBUS is lost while chip->online is true, if userspace reads the status
or charge_type sysfs attributes via:

  power_supply_show_property() ->
    power_supply_get_property() ->
      smb1351_get_property()

while smb1351_work() is running, smb1351_read_status() fails and
smb1351_get_property() sees !delayed_work_pending(&chip->work). It then
overwrites chip->retry_until with a fresh timeout and queues chip->work with
a delay of 0.

When the running smb1351_work() subsequently checks chip->retry_until:

	if (ret && time_before(jiffies, READ_ONCE(chip->retry_until))) {
		queue_delayed_work(system_freezable_wq, &chip->work,
				   msecs_to_jiffies(SMB1351_RETRY_MS));
		return;
	}

it observes the extended deadline instead of expiring and setting
chip->online to false, and its queue_delayed_work() call with
SMB1351_RETRY_MS is ignored because WORK_STRUCT_PENDING_BIT was already set
with delay 0, causing immediate back-to-back re-execution without the 200 ms
backoff.

Similarly, because power_supply_get_property() and
power_supply_external_power_changed() both acquire psy->epc_sem for reading,
smb1351_get_property() can also run concurrently with
smb1351_external_power_changed() and overwrite the longer
SMB1351_SETTLE_MS + SMB1351_RETRY_TIMEOUT_MS deadline in chip->retry_until.

> +
> +	if (psp =3D=3D POWER_SUPPLY_PROP_STATUS)
> +		val->intval =3D ret ? POWER_SUPPLY_STATUS_UNKNOWN :
> +				    smb1351_status(stat);
> +	else
> +		val->intval =3D ret ? POWER_SUPPLY_CHARGE_TYPE_UNKNOWN :
> +				    smb1351_charge_type(stat);
> +
> +	return 0;
> +}

[ ... ]

> +static void smb1351_work(struct work_struct *work)
> +{
> +	struct smb1351 *chip =3D container_of(to_delayed_work(work),
> +					    struct smb1351, work);
> +	unsigned int version;
> +	bool online;
> +	int ret;
> +
> +	/* The chip only answers while it has VBUS */
> +	ret =3D regmap_read(chip->regmap, SMB1351_VERSION_REG, &version);
> +	online =3D !ret;
> +
> +	if (online && !chip->identified) {
> +		bool smb1350 =3D version & SMB1351_VERSION_SMB1350;
> +
> +		dev_info(chip->dev, "found %s (version %#04x)\n",
> +			 smb1350 ? "SMB1350" : "SMB1351", version);
> +		chip->identified =3D true;
> +	}
> +
> +	if (online)
> +		ret =3D smb1351_configure(chip);
> +
> +	if (ret && time_before(jiffies, READ_ONCE(chip->retry_until))) {
> +		queue_delayed_work(system_freezable_wq, &chip->work,
> +				   msecs_to_jiffies(SMB1351_RETRY_MS));
> +		return;
> +	}
> +
> +	if (!online) {
> +		/* Without VBUS the chip does not acknowledge its address */
> +		if (ret !=3D -ENXIO)
> +			dev_warn_ratelimited(chip->dev,
> +					     "failed to read version: %pe\n",
> +					     ERR_PTR(ret));
> +	} else if (ret) {
> +		dev_err_ratelimited(chip->dev,
> +				    "failed to disable charging: %pe\n",
> +				    ERR_PTR(ret));
> +	}
> +
> +	if (online !=3D chip->online) {
> +		dev_dbg(chip->dev, "VBUS %s\n", online ? "present" : "absent");
> +		WRITE_ONCE(chip->online, online);
> +		power_supply_changed(chip->psy);
> +	}
> +}
> +
> +static void smb1351_external_power_changed(struct power_supply *psy)
> +{
> +	struct smb1351 *chip =3D power_supply_get_drvdata(psy);
> +
> +	WRITE_ONCE(chip->retry_until,
> +		   jiffies + msecs_to_jiffies(SMB1351_SETTLE_MS +
> +					      SMB1351_RETRY_TIMEOUT_MS));
> +	mod_delayed_work(system_freezable_wq, &chip->work,
> +			 msecs_to_jiffies(SMB1351_SETTLE_MS));
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021082841.7914=
7-1-thenguyen1024@gmail.com?part=3D2
