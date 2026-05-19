Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5850F3E0C67
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180611; cv=none; b=j5YxqfJoVZgJRuai/ULVegJHVI6/E2yz5BvngV8lGVZllwxFV9LHkuE7rdcmwrEcWBXBqj+oaKWHGin/DUA3EBNhmFVIpphLxXLCxvyF4pifo5cT/Nf9599g/19xR6iFcbEzJI6JSt1k6b1k6iJKsWC7OmWXt6hvb2LxJLct1TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180611; c=relaxed/simple;
	bh=qO9OQkbrpxgoymEUi8XxSIQ1hb0/JFhnaJJzFviE5S0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kJjvC12+ZOMq0AsG0yGQbP9bzzKCz/o0PveTegYgE/2FyuKTb2JeLnRl8O1SmFO34CD9SdnHwSNIC2kfvQUXNd9MNHuGPof11I07VRK5gtfJCS6jF5QIaCUmzZHUgPfk43sDimnKYBFHfRfi1I+5PF/gsfOy/FXRNfINgb982Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nbv3bfVc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nbv3bfVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FA3C2BCB3;
	Tue, 19 May 2026 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180611;
	bh=qO9OQkbrpxgoymEUi8XxSIQ1hb0/JFhnaJJzFviE5S0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Nbv3bfVc/zyOLtqKsuN2vo7zQ2bnW0GrBKTAUeDCJwhw3Txb4H3GV6otnJ4r2iTAY
	 6S+FXrFKBGJtb5umAh1me3+fAV9DhS57/DrCemefgyzUblKYV54HdDNSx5e6n0oxEh
	 2WXMkEz+4nHGyhY6eXfTo6qiSk7bCZyjBHKKnfFo1clSfi7x4fYz5zRAc+Hrba4NBu
	 6aWUVF5J1duO13+2uls1Loeipe4HHryFfAxAkGm2FNcL+ECKNaWMWURe1XCHyoNhr7
	 v8LnIOlSwvUE6sWXjtztgsXJMeyQWUQnlesAxym0hHqwtmQl/LE34Czf37Q3MxY0si
	 yDuMH8h7EKMtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:50:10 +0000
Message-Id: <20260519085010.D8FA3C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Calling `rproc_report_crash()` followed by returning an error =
from `.attach()` causes critical Use-After-Free vulnerabilities.
- [High] Returning `-EINVAL` when the subsystem is not ready breaks the int=
ended fallback to offline boot and causes device probe failure.
- [Medium] The `handover_irq` is left enabled on multiple error paths, caus=
ing an unbalanced IRQ enablement depth.
--

commit 1111bc6bad772baf2e724e0d339a047f01859d2f
Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

remoteproc: qcom: pas: Add late attach support for subsystems

This commit adds late attach support for subsystems brought out of reset by
early bootloaders. It introduces qcom_pas_attach() to check subsystem state
via SMP2P bits, reporting crashes or falling back to offline mode.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c

[ ... ]

> @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rp=
roc)
>  	return qcom_q6v5_panic(&pas->q6v5);
>  }
> =20
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	int ret;
> +	struct qcom_pas *pas =3D rproc->priv;
> +	bool ready_state;
> +	bool crash_state;
> +
> +	pas->q6v5.handover_issued =3D true;
> +	enable_irq(pas->q6v5.handover_irq);
> +
> +	pas->q6v5.running =3D true;
> +	ret =3D irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +
> +	if (ret)
> +		goto disable_running;

If ret is non-zero, we jump to disable_running and return an error without
calling disable_irq(). Does this leave the handover_irq enabled?

Since the attach fails, the remoteproc core never calls the stop callback,
meaning qcom_q6v5_unprepare() is bypassed. This might permanently leak the
IRQ enable count.

> +
> +	if (crash_state) {
> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		ret =3D -EINVAL;
> +		goto disable_running;
> +	}

Could calling rproc_report_crash() and then returning an error lead to
use-after-free conditions?

rproc_report_crash() asynchronously queues the crash_handler work on
rproc_recovery_wq. If auto_boot is true, the attach failure causes
rproc_add() to abort, and devres will free the rproc object. The queued
crash handler is not explicitly cancelled during cleanup, so it may
dereference the freed rproc memory when it executes.

If auto_boot is false, rproc isn't freed, but rproc_attach() cleans up its
failure by calling rproc_disable_iommu(), which frees rproc->domain. The
async crash handler later executes, fails to abort on the RPROC_DETACHED
state, sets the state to RPROC_CRASHED, and triggers recovery. The recovery
process calls rproc_stop() -> qcom_pas_stop() -> qcom_pas_unmap_carveout(),
which unconditionally dereferences the freed rproc->domain via
iommu_unmap().

Additionally, does this path leave the handover_irq enabled as well?

> +
> +	ret =3D irq_get_irqchip_state(pas->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +
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
> +		pas->rproc->state =3D RPROC_OFFLINE;
> +		disable_irq(pas->q6v5.handover_irq);
> +		ret =3D -EINVAL;
> +		goto disable_running;
> +	}

Does returning -EINVAL here prevent the intended fallback to offline boot?

If the device has auto_boot enabled, rproc_add() treats the -EINVAL from
the auto-boot attempt as a fatal error. It executes goto rproc_remove_dev,
which destroys the remoteproc device entirely and fails the driver probe.
This makes the intended fallback impossible, as the device is never
registered.

> +
> +	return 0;
> +
> +disable_running:
> +	pas->q6v5.running =3D false;
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-knp-soccp-=
v6-0-cf5d0e194b5f@oss.qualcomm.com?part=3D5
