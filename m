Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297180;
	b=UoNs+Cfvbsj+njBkjWhLEPTaXvpEonocKZhRLOFeiiXlxtVnVVe4LNlRjx4twW3cKCun
	 JrWyKjH+BWj6XRXGF6v/JhQQB+bLW5p5LwSm878NztT6ck837TWrxUCNuDUhPNZfmqAhn
	 9yZRIpUNb0SPmK72aKTVaZrqzUcrYSl2jsF0p89PcJ4wNVzUs24I4bqypBaew6HzSM+DP
	 +xouzoVN9aOQngAt/5fhIeuhyrJgd1nFFs/Zx3ckWyfbI+sNno8EPuo/MqtkKOfl5Ezwu
	 7nbnbVdCkdloC6XRw43qDu1DdoW3D/qoaCGnZfSo7qjt/gJnF1V0p3iZXDUmtad4lAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297180;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+BGd71qzsHDL6uZ0se5mkr5mWrtxgAnTbyOWuD93Dpw=;
	b=4fuv3SioW2ngl0UueHkEajkLMF1s4BmaWknF2PU6MAiOJ+ExFVNtQZwnQGKIN7Di3BY0
	 7O0//kvnPBb5oMNM3qlW1GSMtNp2cWtheOlPVDD4BC9/8soXgfIuWQkOLwiaPH9JJysUL
	 D0e6X2cN1B2zP25Vyalu0ZWGC+QOs9u2AWhcNnqaX0Mdvvb/JNRYs5VlMfyn9/AYoXq8j
	 f33sEwvdaZzke4m33BLMerhHCTclRB5nnluWxPXSJFeFaD/tnp3cOH5OxduYy5CCun7p9
	 6gUnmbVCC29CyTsc4US/QxSVJ1vVNqJQlL2eNVbLwDEXJCPjrjkm70w2o8ol9X1o0/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nUU/779G";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFA8606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nUU/779G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248B31F01816;
	Thu, 29 Oct 2026 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793297179;
	bh=+BGd71qzsHDL6uZ0se5mkr5mWrtxgAnTbyOWuD93Dpw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nUU/779GivLuu0PMnr+BsiDPH/KrYRZixO1xFQkbCUp/BshXKA0caKdr44dH172gD
	 Nfgsj8DS+GJSIYgmm4fWrYsRdzvuAkOBOGlKk3u8UUiO7yR/Uzi6AJkyoyzX1gkYyX
	 L4PqUCoro1EDVFC3vz6cdG7jCOHSZQXN8v6iEePHBwkHbWsbp+ww63WNRVKIxMCS8/
	 LVrfCY+huQRhadW73qocsCcZebQHZnPoLhXAotx05gS7LDIXxZnH6HUV0UCew/k4Wl
	 I7s/jd6LT33KAS/pqs9Xo4GvpPj/6ov+YsOy7GMOHzEMiPbYwnJxy0wBJ7t2mPuV/6
	 bNFZu4hrlSS1A==
Message-ID: <sashiko-outbox-189760@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/3] power: supply: add read-only CW2017 battery
 monitor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kupreenko Danila" <keckerz@yandex.ru>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <179329639684.489944.17646031923456877930.cw2017-first-public-rfc-2@yandex.ru>
References: <179329639684.489944.6322623410181934358.cw2017-first-public-rfc@yandex.ru>
 <179329639684.489944.17646031923456877930.cw2017-first-public-rfc-2@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 18:06:18 +0000
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
- [Medium] power: supply: cw2017: broken sample.error tracking in cw2017_su=
spend()
--

commit 2974e2dfc1b0336eb1b26f72d45d626971f0a216
Author: Kupreenko Danila <keckerz@yandex.ru>

power: supply: add read-only CW2017 battery monitor

This patch adds a read-only power_supply driver for firmware-initialized
CellWise CW2017 battery fuel gauges over I2C, polling voltage, state of
charge, and temperature with exponential backoff on read errors.

> diff --git a/drivers/power/supply/cw2017_battery.c b/drivers/power/supply=
/cw2017_battery.c
> new file mode 100644
> index 0000000000000..86323849a813a
> --- /dev/null
> +++ b/drivers/power/supply/cw2017_battery.c
> @@ -0,0 +1,370 @@

[ ... ]

> +static void cw2017_poll(struct work_struct *work)
> +{
> +	struct cw2017 *cw =3D container_of(to_delayed_work(work), struct cw2017=
, work);
> +	struct cw2017_sample sample =3D { };
> +	bool changed;
> +
> +	sample.error =3D cw2017_read_sample(cw, &sample);
> +	if (sample.error)
> +		dev_dbg_ratelimited(cw->dev, "Measurements unavailable (%d)\n",
> +				    sample.error);
> +
> +	mutex_lock(&cw->lock);
> +	changed =3D !cw->sample.error !=3D !sample.error ||
> +		  (!sample.error &&
> +		   (cw->sample.capacity !=3D sample.capacity ||
> +		    cw->sample.voltage_uv !=3D sample.voltage_uv ||
> +		    cw->sample.temp !=3D sample.temp));
> +	cw->sample =3D sample;
> +	mutex_unlock(&cw->lock);
> +
> +	if (changed)
> +		power_supply_changed(cw->psy);
> +
> +	if (sample.error)
> +		cw->poll_interval_ms =3D min(cw->poll_interval_ms * 2,
> +					   CW2017_MAX_POLL_INTERVAL_MS);
> +	else
> +		cw->poll_interval_ms =3D CW2017_POLL_INTERVAL_MS;
> +
> +	queue_delayed_work(system_freezable_wq, &cw->work,
> +			   round_jiffies_relative(msecs_to_jiffies(cw->poll_interval_ms)));
> +}

[ ... ]

> +static int cw2017_suspend(struct device *dev)
> +{
> +	struct cw2017 *cw =3D dev_get_drvdata(dev);
> +
> +	cancel_delayed_work_sync(&cw->work);
> +	mutex_lock(&cw->lock);
> +	cw->sample.error =3D -ENODATA;
> +	mutex_unlock(&cw->lock);
> +
> +	return 0;
> +}
> +
> +static int cw2017_resume(struct device *dev)
> +{
> +	struct cw2017 *cw =3D dev_get_drvdata(dev);
> +
> +	cw->poll_interval_ms =3D CW2017_POLL_INTERVAL_MS;
> +	queue_delayed_work(system_freezable_wq, &cw->work, 0);
> +
> +	return 0;
> +}

[Severity: Medium]
Does setting cw->sample.error to -ENODATA in cw2017_suspend() without
emitting a notification break the validity-transition tracking in
cw2017_poll() across suspend and resume?

In cw2017_poll(), validity transitions are detected by comparing the cached
error state against the new sample error state:

	changed =3D !cw->sample.error !=3D !sample.error ||
		  (!sample.error &&
		   (cw->sample.capacity !=3D sample.capacity ||
		    cw->sample.voltage_uv !=3D sample.voltage_uv ||
		    cw->sample.temp !=3D sample.temp));

Because cw2017_suspend() overwrites cw->sample.error with -ENODATA without
calling power_supply_changed(cw->psy), two notification issues arise when
cw2017_poll() runs after resume:

1. If measurements were valid before suspend (cw->sample.error =3D=3D 0) and
   cw2017_read_sample() fails after resume (for example, if the gauge lost
   its profile or readiness across suspend or an I2C error occurs), both
   cw->sample.error and sample.error are non-zero. As a result, changed
   evaluates to false and power_supply_changed(cw->psy) is never called,
   leaving consumers with stale pre-suspend values.

2. If measurements were valid before suspend and remain valid and unchanged
   after resume (sample.error =3D=3D 0), !cw->sample.error !=3D !sample.err=
or
   evaluates to true solely because cw2017_suspend() forced cw->sample.error
   to -ENODATA, triggering an unconditional power_supply_changed(cw->psy)
   uevent on every resume.

In addition, cw2017_resume() queues cw->work on system_freezable_wq, which
remains frozen until suspend_thaw_processes() runs after dpm_complete().
When dpm_complete() -> thermal_pm_complete() schedules
thermal_zone_device_resume() on the non-freezable thermal_wq (registered
for POWER_SUPPLY_PROP_TEMP via __power_supply_register() ->
psy_register_thermal()), cw2017_get_property() will see cw->sample.error =
=3D=3D
-ENODATA and fail thermal zone resume before the post-resume poll work has a
chance to run.

Would it be better to preserve cw->sample across suspend so cw2017_poll()
can compare the post-resume reading against the last reported state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179329639684.489944=
.6322623410181934358.cw2017-first-public-rfc@yandex.ru?part=3D2
