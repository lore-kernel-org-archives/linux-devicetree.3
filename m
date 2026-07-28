Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1462F90E0
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261905; cv=none; b=i/LmPW/vftQGWFbO3TRtoArHMNvWVWIWTxJS3FGOc+ylr0EddjeRZp8mTuN2sAKZMFk7XShdtOhW7yer/Obi1dO+FT9SA11IiXE24OlSRp+NErrEyd5xhSR/TXnCaVsVfBdoZ3s6PJd+hQGgjE7Z8pm6b7PTZcEWhvg2OxNDrXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261905; c=relaxed/simple;
	bh=ikGCiK5eKSxKQoqsK3/zyTpQ1b9nW1eraPuAPtXF3QE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LRB2Ky7cv3gVNQY90G8iGe+opIB2Mwdlz5Zcy6HPWEE7A9xns8rE7kJokyA/ju8PUyxADSjItEhN//RP4qlj1aqgpB4pEBHGwSb26gpV6cLw/w2EdIsxu7G7KoK3p2oAfx0k4GhOX+8LeZRYuXgmpDPG+KO96VHQ4qMEMsM73Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAplNQ7M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAplNQ7M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4E11F000E9;
	Tue, 28 Jul 2026 18:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785261904;
	bh=B1pvOub2QC/Akf/yG0pWALvW1QONwJ8d8HALcj5jdM8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bAplNQ7MuD/ntsbRKSxNqsWrs4G+VVVMNF9mPR2Pf7Kjp8HtJlsJ0Es2egIqYevEg
	 baQ4XSFgWe1JslKbkXWpzNJNFpp5GwZNGho6uPK3XJSj3DkjhIREiX7gBY7m/FwCtY
	 H18jwQqksdamk0tu2P5whPULUYaa0G5hI8tbG6e6cL0B6Jv+w28icSLQAEt4P5betJ
	 NZgkWaZDNcA28xQEnuknmMKw5l1tD9xSjClPtjKdsW4wAhiOVl52ssLN1q1d/90FNo
	 k7mxLJsXwAUg819RW5MS6yehRNsrUosroU/39VOqHWs/W4RfmSHJO5SfiUpznNDpY7
	 Wz1hHFSEMKUvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 18:05:03 +0000
Message-Id: <20260728180503.AF4E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing synchronization for `psy_work` during suspend causes I2C t=
ransfers in standby state.
- [Low] Missing Kconfig dependency on POWER_SUPPLY causes build failures.
- [Low] Unused static function `qcom_ec_get_fan_profile` triggers compiler =
warnings.
--

--- Patch [3]: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profi=
le based on power supply state ---
commit 14490e0de249214f9c1b00a4aad8f89c2d05843e
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

platform: arm64: qcom-hamoa-ec: Switch fan profile based on power supply st=
ate

This commit adds EC command definitions and handlers to switch the EC fan
profile. It registers a power supply notifier to track AC/battery state
transitions and queues a work item to apply the corresponding fan profile.

> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/ar=
m64/qcom-hamoa-ec.c
> index 4c745b78322c4..f6ff77d4e8f69 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c

[ ... ]

> @@ -351,6 +359,140 @@ static int qcom_ec_send_soc_tj_temp(struct qcom_ec =
*ec)
>  	return ret;
>  }
> =20

[ ... ]

> +static int qcom_ec_get_fan_profile(struct qcom_ec *ec, u8 *profile_id)
> +{
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_byte_data(ec->client, EC_FAN_PROFILE_CMD);

[Severity: Low]
Is this function called anywhere in the driver? It appears to be added
but never used.=20

Because it is static and lacks the __maybe_unused attribute, will this
trigger a -Wunused-function compiler warning?

> +	if (ret < 0)
> +		return ret;
> +
> +	*profile_id =3D (u8)ret & GENMASK(3, 0);
> +
> +	return 0;
> +}

[ ... ]

> +static int qcom_ec_psy_notifier(struct notifier_block *nb,
> +				unsigned long event, void *ptr)
> +{
> +	struct qcom_ec *ec =3D container_of(nb, struct qcom_ec, psy_nb);
> +
> +	if (event !=3D PSY_EVENT_PROP_CHANGED)
> +		return NOTIFY_DONE;
> +
> +	queue_work(system_long_wq, &ec->psy_work);

[Severity: High]
Is it safe to leave this work item un-synchronized during suspend?

Looking at the suspend path, soc_tj_work is properly disabled before the EC
enters modern standby, but psy_work is not:

qcom_ec_suspend() {
    disable_delayed_work_sync(&ec->soc_tj_work);

    mutex_lock(&ec->io_lock);
    ret =3D i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
                                    EC_MODERN_STANDBY_ENTER);
    mutex_unlock(&ec->io_lock);
    ...
}

Since psy_work is queued on system_long_wq (which is not freezable), if a
power supply event like an AC unplug occurs right before or during suspend,
psy_work could execute concurrently with or after the EC is put into standb=
y.

If the work runs, it sends the EC_FAN_PROFILE_CMD over I2C. Will this wake
or corrupt the EC state, or potentially deadlock if the I2C controller has
already suspended?=20

Should psy_work be disabled during suspend as well?

> +
> +	return NOTIFY_OK;
> +}

[ ... ]

> @@ -630,6 +777,17 @@ static int qcom_ec_probe(struct i2c_client *client)
>  		}
>  	}
> =20
> +	ec->psy_nb.notifier_call =3D qcom_ec_psy_notifier;
> +	ret =3D power_supply_reg_notifier(&ec->psy_nb);

[Severity: Low]
Building without CONFIG_POWER_SUPPLY will lead to link errors here because
power_supply_reg_notifier() and power_supply_unreg_notifier() are called
unconditionally, but have no stub implementations in the power_supply.h
header.

Does this driver need a Kconfig dependency on POWER_SUPPLY to prevent build
failures?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register power supply notifi=
er\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, qcom_ec_unreg_psy_notifier, &ec->=
psy_nb);
> +	if (ret)
> +		return ret;
> +
> +	qcom_ec_update_profile_from_power_supply(ec);
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-ec_add_mor=
e_commands-v1-0-771abd65ee1a@oss.qualcomm.com?part=3D3
