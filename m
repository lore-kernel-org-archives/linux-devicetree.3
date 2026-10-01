Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EE9496D47
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859913; cv=none; b=VcIYNKT9ThhZ44zFM4/lRf1/jo4gnmK9QednGB+x18S8+qlJaNL+/Y8rUKUQCrRd9kFysKFjR5KoLClFjRAZUKS3dFLa7WNZOwQa18zfrVeMrnoVR4Z9i9bQBYbYkvlSYAnS+NLC8vOGMUs2FiCuwak6M1Lp02yX3SigFGi3SrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859913; c=relaxed/simple;
	bh=x5T0C+y2aOb8FLWxsbdzSnvL2ruHAmT1NJyZ1UHJ2mU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AwGSht1anpeyFoQxSZ20msN1hoHI7eS63v1lm6U/dpBsCv630G2SlmgoofQtf9jT4Yk1Uj9cbANFPQM06XTtcUpkAbv5LwG45BorlcLZx42wrDF+6LL39pnf8FUpT9GOH4883hf2gjO+9F3LPBJCkbLK1CEZJM9XFoXkIKbvNbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHOxTVDR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHOxTVDR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C511F1F000FF;
	Thu,  1 Oct 2026 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859912;
	bh=4Otrfy2BGJrk1BFs6/wlyPOvL77XF74ZSgxZz0beUYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GHOxTVDRqfm/sgs64c52kU2PWSLq1tuuJV61lG6pHceYB/QP50uOWkH4EaOcYTaPh
	 Py85hWlo7CVMT9Ebf8qtOZbWkIKz1zO+g6h40pncBPzRuvm+eB7cz1RMkicrqpYmHj
	 V/IDvm4HAmsxOVPxu/uGmZYrV/PPTwqLr2om1OJ273KdgQnQnLMKIfWIEe+S3uoeQg
	 y5+cNvpA1hGMEV0LOTITsGDrYxPYxqgFRCI/jf3+AQ54VBx8nbdXIpp3VCMP2R8bth
	 +17mBKCGBwmxYVrZWUsz1WdEKozmAWS0TY+UwGZEyqZMKRlDO9brvx0TWo8vbsWFiv
	 gvXlgQojEI2uQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001-regulator-off-on-delay-v4-4-258ba9612da8@oss.qualcomm.com>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
 <20261001-regulator-off-on-delay-v4-4-258ba9612da8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:05:11 +0000
Message-Id: <20261001130511.C511F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] regulator: qcom-rpmh: Use-After-Free due to devres LIFO ordering
- [High] regulator: qcom-rpmh: Data race in worker thread bypassing regulat=
or_lock
- [High] regulator: qcom-rpmh: NULL pointer dereference if delayed disable =
fires before init completes
- [Medium] regulator: qcom-rpmh: State desynchronization on driver removal =
drops pending disable
--

commit b0211424f1ad79c3af4f67d5c03d4546a1bd442e
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

regulator: qcom-rpmh: Add debounce delay before disabling regulator

This commit adds a debounce delay to the Qualcomm RPMh regulator driver to
prevent rapid disable/enable cycles. It introduces a delayed work item that
defers sending disable requests to the hardware. A devres action is also
added to cancel the delayed work upon driver removal.

> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/=
qcom-rpmh-regulator.c
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c

[ ... ]

> @@ -347 +347,54 @@ static int rpmh_regulator_set_enable_state(struct regu=
lator_dev *rdev,
>  	return ret;
>  }
> =20
> +static void rpmh_delayed_off_work(struct work_struct *work)
> +{
> +	struct rpmh_vreg *vreg =3D container_of(work,
> +					struct rpmh_vreg, delayed_off_work.work);
> +
> +	if (!_rpmh_regulator_set_enable_state(vreg, vreg->rdev, false))

[Severity: High]
Does this worker thread modify the hardware state without holding the
regulator core lock?

The core consumer APIs execute under the regulator_lock. Running
_rpmh_regulator_set_enable_state() here asynchronously might cause a data
race on shared structures like vreg->enabled and vreg->voltage_selector if a
consumer calls regulator_set_voltage() concurrently.

> +		vreg->last_off =3D ktime_get_boottime();
> +}

[ ... ]

>  static int rpmh_regulator_disable(struct regulator_dev *rdev)
>  {
> +	struct rpmh_vreg *vreg =3D rdev_get_drvdata(rdev);
> +
> +	if (vreg->debounce_delay) {
> +		queue_delayed_work(system_percpu_wq, &vreg->delayed_off_work,
> +				   usecs_to_jiffies(vreg->debounce_delay));
> +		return 0;
> +	}

[Severity: High]
Can this lead to a use-after-free during driver teardown?

When the driver unbinds, devres destroys resources in LIFO order.
The custom devres action rpmh_regulator_cancel_delayed_off_work runs first,
canceling the delayed work. Then devm_regulator_release() runs, which calls
regulator_unregister().

If regulator_unregister() flushes pending core disables, it invokes
rpmh_regulator_disable() which re-queues the delayed work here. After devres
finishes freeing vreg, the newly queued work would execute and dereference
the freed memory.

> +
>  	return rpmh_regulator_set_enable_state(rdev, false);
>  }

[ ... ]

> @@ -551 +551,13 @@ static const struct regulator_ops rpmh_regulator_xob_o=
ps =3D {
>  	.is_enabled		=3D rpmh_regulator_is_enabled,
>  };
> =20
> +static void rpmh_regulator_cancel_delayed_off_work(void *data)
> +{
> +	struct rpmh_vreg *vreg =3D data;
> +
> +	cancel_delayed_work_sync(&vreg->delayed_off_work);
> +}

[Severity: Medium]
Does cancelling the work here without syncing the hardware state leave the
regulator permanently enabled if a disable request was pending?

The regulator core would consider it disabled, leading to leaked power and
incorrect hardware state.

> +
>  /**
>   * rpmh_regulator_init_vreg() - initialize all attributes of an rpmh-reg=
ulator

[ ... ]

> @@ -677 +677,14 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *=
vreg, struct device *dev,
>  			node, ret);
>  		return ret;
>  	}
> +	vreg->rdev =3D rdev;

[Severity: High]
Could vreg->rdev be NULL if the delayed disable worker fires too early?

The regulator is exposed to consumers as soon as devm_regulator_register()
returns. If a fast consumer probes, sets a voltage, and immediately disables
the regulator before vreg->rdev is assigned here, the delayed off worker
might execute with vreg->rdev set to NULL.

This would cause a NULL pointer dereference when
_rpmh_regulator_set_enable_state() attempts to set the voltage and passes
the NULL rdev to rdev_get_drvdata().

> +
> +	if (vreg->debounce_delay) {
> +		ret =3D devm_add_action_or_reset(dev, rpmh_regulator_cancel_delayed_of=
f_work,
> +					       vreg);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	dev_dbg(dev, "%pOFn regulator registered for RPMh resource %s @ 0x%05X\=
n",
>  		node, rpmh_resource_name, vreg->addr);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-regulator-=
off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com?part=3D4
