Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46117330307
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262545; cv=none; b=JxGWZoloALngZ+diYVnsO4CUi6303tA3rlZyk78nK/Bd+JEhkdwsdzjkAIIS1bXiwkdRA3K3BAkttWKfb6/yTDPM6QRv50+ZnDSLcQB3esuRSHRpKw1aNLJXjsKLgFxZgis0H/ufPUae87GDIbHhjlfOqSYWwtiZNWx0xK5WSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262545; c=relaxed/simple;
	bh=V3SwTVppQwsk2D2SfyUFRIvk1SgJs4CX538TBgNFy9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kqUf8wJaQaM/b3zS2O6Dgw6elKOuoFsGrI9k/bOau2mvXzBlL5rNE0+pxRjoE6unqA1zYPjFkKGHFdfq9b9iysLiFcUVeh6CNgsponj72wfkwJmrDxBgQmNv5gb+oamf7/M8phkQ8Gf/dw71FatgoYMi07JGSLQCNnqXM0azCyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFuawuH/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFuawuH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3131F000E9;
	Tue, 28 Jul 2026 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785262543;
	bh=CC7q8fA6VsMajguSEpw7ZGIHd/c/oKYgfUSd8D6GO1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BFuawuH/PJHH06Gd5GreSVp3yjVaB5jLYMVZ7h2WSRid3QTcE4cBLSTBGjZlwjaPw
	 05Au9dyTKzEsbRlWzizddDnbl9b/9yeEosSpqXL5/aIEZhPs+iEz6XyRdoEmbtHzjq
	 jeRkzm7EWCJoZ3RD5mzShizIuAydgQDe12It3EhSrRyzKqdHlVmIAiVcSlfDcjBdQn
	 GRFWAUvmDmw7urg1oJKvAJvPvjnZwtO54RNKsOsC3SZu22qWIt8O67QvKMStGZqpIp
	 2SgCto5nlvty2uD2EX6Fz/SZ+uVXotf9rOCa0apFidxFsgVauOLkUFwmv7Rqup4Bsv
	 Zt3a5dL4KyFaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query
 and LUT calibration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 18:15:43 +0000
Message-Id: <20260728181543.AB3131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Race condition between suspend/remove paths and `fan_calib_work_fn=
` can cause a 10 to 20-second hang.
- [High] `psy_work` can be queued and executed while the device is in suspe=
nd, leading to I2C transfer failures.
--

--- Patch [4]: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM quer=
y and LUT calibration ---
commit e49733d2c63b28585a159eb3f465f9613c0aec7d
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

platform: arm64: qcom-hamoa-ec: Add fan RPM query and LUT calibration

This commit adds EC command definitions and handler functions for querying
fan RPM and programming per-fan LUTs mapping SoC temperature to target RPM.
It implements a runtime calibration work item to determine the maximum RPM,
and programs the LUT once calibration finishes and upon power-supply change=
s.

> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/ar=
m64/qcom-hamoa-ec.c
> index f6ff77d4e8f69..d0c45d9970eee 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
[ ... ]
> @@ -665,6 +1097,49 @@ static void qcom_ec_soc_tj_work_fn(struct work_stru=
ct *work)
>  	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_P=
OLL_JIFFIES);
>  }
> =20
> +static void qcom_ec_fan_calib_work_fn(struct work_struct *work)
> +{
> +	struct qcom_ec *ec =3D container_of(work, struct qcom_ec, fan_calib_wor=
k);
> +	struct device *dev =3D &ec->client->dev;
> +	int i, ret;
> +
> +	reinit_completion(&ec->calib_abort);

[Severity: High]
Can this race with the suspend or remove paths and cause a long delay?

If qcom_ec_fan_calib_work_fn() begins executing concurrently with
qcom_ec_suspend() or qcom_ec_remove(), the suspend/remove thread calls
complete_all(&ec->calib_abort) to signal the worker to abort.

However, if the worker executes reinit_completion() immediately after the
suspend thread's complete_all(), the abort signal is erased. The suspend
thread then blocks in cancel_work_sync(), waiting for the worker to finish,
and the worker will block in wait_for_completion_interruptible_timeout()
for the full timeout per fan (up to 10-20 seconds total).

> +
> +	mutex_lock(&ec->io_lock);
> +	ec->calibrating =3D true;
> +	mutex_unlock(&ec->io_lock);
> +
[ ... ]
> @@ -690,7 +1169,16 @@ static int qcom_ec_suspend(struct device *dev)
>  	struct qcom_ec *ec =3D i2c_get_clientdata(client);
>  	int ret;
> =20
> -	disable_delayed_work_sync(&ec->soc_tj_work);
> +	if (ec->lut_cfg && ec->thermal_cap.fan_cnt) {
> +		complete_all(&ec->calib_abort);
> +		cancel_work_sync(&ec->fan_calib_work);
> +	}
> +
> +	if (ec->lut_cfg)
> +		cancel_work_sync(&ec->psy_work);

[Severity: High]
Does this allow psy_work to be re-queued and executed during suspend?

While cancel_work_sync() stops currently pending work, the system-wide
power supply notifier qcom_ec_psy_notifier() is not unregistered during
suspend.=20

If a power supply event occurs during the suspend process after
cancel_work_sync() has run, the notifier can immediately queue psy_work
back to the non-freezable system_long_wq.

This could cause the work to run and attempt I2C transfers while the
I2C controller is suspended or the EC is in Modern Standby, potentially
leading to bus lockups or suspend failures.

> +
> +	if (ec->lut_cfg && ec->lut_cfg->send_soc_tj)
> +		disable_delayed_work_sync(&ec->soc_tj_work);
> =20
>  	mutex_lock(&ec->io_lock);
>  	ret =3D i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-ec_add_mor=
e_commands-v1-0-771abd65ee1a@oss.qualcomm.com?part=3D4
