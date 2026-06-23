Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5773B3769E3
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210020; cv=none; b=kaQKMKIjpAt+bmOnh5D/bkb8bp9fTChuNB0I7ZjRFKzImjkAdQzCxjy9Xyq5tHUNTgwbAFojkDn6RUCzm1eNI1nnh9Y502MJeaBWkYZbPM/+7mWS4V3ReGk4kwh4op/CcmFEY4S0asJckfzpNOX+E76RfdHy+xEokh/dIpyTr70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210020; c=relaxed/simple;
	bh=iCivHL5xNb8ySs+Vb1ucCCrtiXnHKr7oijvkawb8qls=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dnwgoa/pa68UFVdVQVsNiLgLWep9eb8xczU6PUdlGmFk3rZA3QS6B/votmwMPA3js9F4E2WFPudaWRdohD2fD8PYaXotQ1X/B+0P2O+90OoSyrMgbGK09YiWA3b86y0V6jI/CN2VI8nEtKI3kvMVC6PqvrVG/KxNWe7Q09adlmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsAMNJEK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsAMNJEK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12681F000E9;
	Tue, 23 Jun 2026 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782210019;
	bh=6pSbtHfjUcscTUWF/b/b+3W8SDCtNmfYJ0+f1rPGgYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AsAMNJEKs9AMHwMcMBV7fj907B7ee9/zotvTSjez7N93ycptiXgvWPMfijfaGkpox
	 owzy/kXarrWoDQqbhQNGmnwg1KQKNE3WzdV0uG9wYT0XrACBfJsNKES71DKHJkPA1q
	 BNOd9GzJLjgkUChp0i1C/2UZJ7ZKV9jWSeHx4Arn5H7SowcrHyK/AAql7Dv9eKycup
	 wt2llVp2JdAK9b1V1XNZkBsx6JGRecO1b8ZRsJ/6S6Ma4jyamewU5JQJHOgpeosn2H
	 sIS5TAJx3hba/2BZlo5Hmooc7CeGJp6UXITt2vC0jEAr0b89WKbau9KX4u3JJUxv74
	 8AlIZ9AgHpyNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623-knp-soccp-v7-5-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-5-1ec7bb5c9fec@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 10:20:18 +0000
Message-Id: <20260623102018.B12681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Returning `-EINVAL` from `attach()` to trigger a fallback causes `=
rproc_add()` to fail and aborts the driver probe entirely.
- [High] Calling `rproc_report_crash()` before returning an error from `att=
ach()` causes a deterministic Use-After-Free of the `rproc` object.
- [Medium] `qcom_sysmon_shutdown_irq_state()` passes a potentially negative=
 IRQ number to `irq_get_irqchip_state()`, causing spurious warnings.
--

commit 2eb49833f76c6090fc2bf0848fb2114975777ac0
Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

remoteproc: qcom: pas: Add late attach support for subsystems

This patch introduces late attach support for subsystems that are brought
out of reset by bootloaders. It adds a qcom_pas_attach() function to check
the subsystem state via SMP2P bits, allowing the driver to attach, report a
crash, or fall back to an offline state if the subsystem is not ready.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 808e9609988d3..8a0bb4b2e71c0 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -507,6 +508,67 @@ static unsigned long qcom_pas_panic(struct rproc *rp=
roc)
>  	return qcom_q6v5_panic(&pas->q6v5);
>  }
> =20
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	struct qcom_pas *pas =3D rproc->priv;
> +	bool ready_state;
> +	bool crash_state;
> +	bool stop_state;
> +	int ret;
> +
> +	pas->q6v5.handover_issued =3D true;
> +	enable_irq(pas->q6v5.handover_irq);
> +
> +	pas->q6v5.running =3D true;
> +	ret =3D irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +	if (ret)
> +		goto disable_running;
> +
> +	if (crash_state) {
> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		ret =3D -EINVAL;
> +		goto disable_running;

[Severity: High]
Can this sequence cause a use-after-free of the rproc object?

If crash_state is true, rproc_report_crash() asynchronously queues
&rproc->crash_handler onto the rproc_recovery_wq workqueue. This function
then immediately returns -EINVAL.

Because .attach() runs synchronously during driver probe via rproc_add(),
the returned error causes rproc_add() to fail, and the devres framework will
automatically free the rproc structure.=20

The remoteproc core does not cancel the pending crash work during device
teardown, so when the workqueue later executes rproc_crash_handler_work(),
will it dereference the freed rproc memory?

> +	}
> +
> +	ret =3D irq_get_irqchip_state(pas->q6v5.stop_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
> +	if (ret)
> +		goto disable_running;
> +
> +	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
> +		dev_info(pas->dev, "Subsystem found stop state set. Falling back to st=
art.\n");
> +		goto unroll_attach;
> +	}
> +
> +	ret =3D irq_get_irqchip_state(pas->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +	if (ret)
> +		goto disable_running;
> +
> +	if (unlikely(!ready_state)) {
> +		/*
> +		 * The bootloader may not support early boot, mark the state as
> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> +		 * start the remoteproc.
> +		 */
> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
> +		goto unroll_attach;
> +	}
> +
> +	return 0;
> +
> +unroll_attach:
> +	pas->rproc->state =3D RPROC_OFFLINE;
> +	ret =3D -EINVAL;

[Severity: High]
Does returning an error code here break the intended fallback mechanism?

If desc->auto_boot and desc->early_boot are true, rproc_add() will
synchronously call rproc_trigger_auto_boot(), which calls qcom_pas_attach().

If this function returns -EINVAL, the error propagates back to rproc_add(),
which interprets it as a fatal initialization failure, aborting the driver
probe entirely instead of enabling a normal firmware load:

drivers/remoteproc/remoteproc_core.c:rproc_add() {
    ...
	if (rproc->auto_boot) {
		ret =3D rproc_trigger_auto_boot(rproc);
		if (ret < 0)
			goto rproc_remove_dev;
	}
    ...
}

> +disable_running:
> +	disable_irq(pas->q6v5.handover_irq);
> +	pas->q6v5.running =3D false;
> +
> +	return ret;
> +}
[ ... ]
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_s=
ysmon.c
> index 913e3b750a869..a0830a48b1f40 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
[ ... ]
> @@ -736,6 +736,25 @@ bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *=
sysmon)
>  }
>  EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_acked);
> =20
> +bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
> +{
> +	bool shutdown_state;
> +	int ret;
> +
> +	if (!sysmon)
> +		return false;
> +
> +	ret =3D irq_get_irqchip_state(sysmon->shutdown_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &shutdown_state);

[Severity: Medium]
Will this cause spurious warnings if the optional shutdown IRQ is missing?

If the optional shutdown-ack interrupt is omitted from the device tree,
of_irq_get_byname() returns -ENODATA, which is stored in sysmon->shutdown_i=
rq
but safely ignored during initialization.

Later, this function passes sysmon->shutdown_irq directly to
irq_get_irqchip_state(), which expects an unsigned int. The IRQ subsystem
will fail to find the corresponding IRQ descriptor for the invalid number a=
nd
return -EINVAL, causing this to incorrectly log a spurious warning.

> +	if (ret) {
> +		dev_warn(sysmon->dev, "failed to get shutdown_state: %d\n", ret);
> +		return false;
> +	}
> +
> +	return shutdown_state;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-knp-soccp-=
v7-0-1ec7bb5c9fec@oss.qualcomm.com?part=3D5
