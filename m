Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD5236654C
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791740541; cv=none; b=hC8k38HcPp1shRTuYDSfnBBB1AYtlFTwojeNMNIveADlpIHspWGAI3jCJqfZgcLASoY4CdR/6YJUkkj9Y5Cc/hjc5fAPwJfMGA1EyFmaG/nittpVA5N/tGGDGJtS/k/bOOTcSqBjLXUHsLKbpJb+iqpafKfykBaFy78uN+OBtUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791740541; c=relaxed/simple;
	bh=mzIkIschMwwsvX+H0pdY/7c7KpJYchz/1Jr+bAgG1fw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mXus3+Od5MZ+mQqXX0FkEdrmsjos9NfhBTF/Q5DK4vkNykOlabpyuDjxlq+q/vj63dVUgL0KIc+Eiasyyt5vuw6HmEMuPivl7oqPENH4dN8WZ6qPa4uRPooUD8VtD25wfEZ4s2uBMfIq+LeS5KQbRA7PkelTWo6MjRCNsRp3+eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcCccbvx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcCccbvx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05671F0089B;
	Sun, 11 Oct 2026 17:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791740540;
	bh=E0dD25qyJyMAB3aVsN4H51ZK8H9D8czuqlWQjMGTa7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UcCccbvxViP29stjAPfD31KwSb+CCfRkAwkj9ZGmtWNzgsq66cMF9lKpSNDY0oZ0w
	 h4fGplJLzZl5VeSMx9H5G5X3+949ici09HbmC3Ks1871j8H1oGVo4JhYZKnXSfu951
	 q+HcBy1mCi8iVdVTZGJxKu6iEts4h/9r1i7OaCxNr9gNV1UAePole3jo58rufHrYBv
	 h9reCuVsD22hyELq/pPZhmY59iP8uzwag1AevS0jcZFEoSDQghSl0AbSwzSr6LrXaB
	 lYEPsAcLijpDrxAfK6IH+AbCqjVKctZ1ja1YQLeJgYaN8wChLgUBIk1GuVCScFZpQf
	 ARvdukvXzOLtg==
Message-ID: <sashiko-outbox-167355@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] platform: arm64: dell-xps-ec: new driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261011-dell-xps-9345-ec-v5-2-2ab1258b84c1@vinarskis.com>
References: <20261011-dell-xps-9345-ec-v5-0-2ab1258b84c1@vinarskis.com>
 <20261011-dell-xps-9345-ec-v5-2-2ab1258b84c1@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 17:42:19 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] platform: dell-xps-ec: interrupt storm caused by returning IRQ=
_HANDLED without clearing HW state
- [High] platform: dell-xps-ec: transient I2C failure during resume permane=
ntly disables thermal polling
- [Medium] platform: dell-xps-ec: mismatch between static thermistor profil=
e and runtime update IDs
--

commit f544064c3cc545aec4e67c4bd56d30853369771b
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

platform: arm64: dell-xps-ec: new driver

Introduces a new embedded controller driver for the Dell XPS 13 9345.
The primary function of this driver is to unblock the EC's thermal
management by feeding it temperature information over an I2C interface.
This enables the EC to control device fans and peripheral power.

> diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm6=
4/dell-xps-ec.c
> new file mode 100644
> index 0000000000000..cf2dd41b1aa68
> --- /dev/null
> +++ b/drivers/platform/arm64/dell-xps-ec.c

[ ... ]

> +static const u8 dell_xps13_9345_thermistor_profile[] =3D {
> +	0xff, 0x54,
> +	0x01, 0x00, 0x2b,	/* sys_therm0 */
> +	0x02, 0x44, 0x2a,	/* sys_therm1 */
> +	0x03, 0x44, 0x2b,	/* sys_therm2 */
> +	0x04, 0x44, 0x28,	/* sys_therm3 */
> +	0x05, 0x55, 0x2a,	/* sys_therm4 */
> +	0x06, 0x44, 0x26,	/* sys_therm5 */
> +	0x07, 0x44, 0x2b,	/* sys_therm6 */
> +};
> +
> +static const struct dell_xps_ec_therm dell_xps13_9345_therms[] =3D {
> +	/* TODO: 0x01 is sent only occasionally, likely TZ98 or TZ4. */
> +	{ "sys_therm0", 0x02 },
> +	{ "sys_therm1", 0x03 },

[Severity: Medium]
Will this mismatch between the initialization profile and the runtime mappi=
ng
cause issues for the EC?

The static profile initializes the first thermistor (sys_therm0) as ID 0x01,
but the runtime mapping array expects sys_therm0 to be updated using ID 0x0=
2.

This off-by-one discrepancy appears to cause the driver to send periodic
temperature updates for sys_therm6 to ID 0x08, which was never initialized,
while leaving ID 0x01 without any temperature updates.

[ ... ]

> +static irqreturn_t dell_xps_ec_irq_handler(int irq, void *data)
> +{
> +	struct dell_xps_ec *ec =3D data;
> +
> +	/*
> +	 * TODO: IRQ is fired on lid-close. Follow Windows example to read out
> +	 *       the thermistor thresholds and potentially fan speeds.
> +	 */
> +	dev_dbg(ec->dev, "IRQ triggered (irq=3D%d)\n", irq);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Critical]
Can this cause an interrupt storm?

The threaded handler unconditionally logs a debug message and returns
IRQ_HANDLED, but performs no I2C operations to acknowledge or clear the
event on the EC.

Since the interrupt is level-triggered active-low, unmasking the line
without clearing the hardware state will cause the interrupt to immediately
fire again. This could completely consume a CPU core and hang or severely
degrade the system.

[ ... ]

> +static int dell_xps_ec_resume(struct device *dev)
> +{
> +	struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D dell_xps_ec_suspend_cmd(ec, false);
> +	if (ret)
> +		return ret;
> +
> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +
> +	return 0;
> +}

[Severity: High]
If the I2C transaction fails during resume, will this permanently disable
thermal polling?

The early return bypasses re-arming the periodic work in ec->temp_work.

The PM core ignores errors returned from resume callbacks, so the system
wakes up successfully, but the cyclic temperature polling timer remains
disabled for the rest of the session. Should the delayed work be scheduled
even if the suspend command fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-dell-xps-9=
345-ec-v5-0-2ab1258b84c1@vinarskis.com?part=3D2
