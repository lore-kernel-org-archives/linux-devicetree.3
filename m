Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20447311C07
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786037642; cv=none; b=dlmwsqURDVn+8E8hMq3zu8FM1GwL+AT05C12vA0U1nHSlZ+Byr3Wkyy2BC2UjihoP2/rjIQQYIIjsM3x3vTlFRvUREiBdBvLrd/XFLQGdmNIr5IFMNex4hQcE94AUBkHlahNRl8Q2K3KxqKxIdgrWYHA+MRp4KPdRV742VHg9Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786037642; c=relaxed/simple;
	bh=LDcKhah52Mq8Rv+RRubVjAwh6esj9+905oQbwMLvYoA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k8sPnTOwsmW7+1WboHUBN6GCPmiZBoRNPBTtqb6lLIsQhWvOpOJDEHlwYoeJ+WDIM0IPXxds18JGUScHUUcq6Y8V3hGcyMUahihB4+9mGbG7nG1of27dNHcmoDuKAgjy2YBW5KK68JAdC1A/P7ivuR6pVbBQFvIQbai5J6KNMMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5jJ5m9G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5jJ5m9G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBB41F000E9;
	Thu,  6 Aug 2026 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786037640;
	bh=axcjxoSREeS5VB7wx97hgdvzpChrofsLAJMy2BbsmyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g5jJ5m9GcDRQmX939ylSvmXntbQ4L1F5u6+pXYkbORKuZynDpsGYzNck1s+GBjxwo
	 LFFVbgruoIs7u5U80T1Zu/x56p0Whiuedq//kUSjkUqDJArBRW6l5alEWceW5BGRKX
	 gkaMJdj0hDM9qpznBkU1qmKLFxo71xY46gE3aCL1NxttP0+lSYv1p5kEAuVJYklicV
	 iPUjchEYJaFwRyRIX+tBePMn1gLLLDrxK0ecL2j30mAvswUc0pBrMGhzRUkDFU87Re
	 Y5OpwDwWpcri7CPlza8tiZaV2UTiK1o8x5KzSiV8kkhjuuuH197Xk9T4O3F58xcRwZ
	 En1J1WD1zG15Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 04/21] drm/bridge: synopsys: dw-dp: Document missing
 reset line deassert
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-4-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-4-0d508505f383@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:33:59 +0000
Message-Id: <20260806173400.5CBB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing completion reinitialization causes spurious AUX transfer s=
uccesses
- [High] HPD event state overwrite race drops hotplug events
--

--- Patch [4]: [PATCH v11 04/21] drm/bridge: synopsys: dw-dp: Document miss=
ing reset line deassert ---
commit 34c619c6d4754597f7c81d207e5acfe482e8b36d
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Document missing reset line deassert

This patch adds a comment explaining why the driver avoids using automatica=
lly
deasserting reset controls. Unbinding the device with the reset line deasse=
rted
can cause the SoC to hang if the shared power-domain is still active. The
current reset handling remains unchanged.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 21d60e89126f0..52e3b37259a69 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does dw_dp_aux_transfer()
miss a completion reinitialization?

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_aux_transfer() {
...
	regmap_write(dp->regmap, DW_DP_AUX_CMD, value);

	status =3D wait_for_completion_timeout(&dp->complete, timeout);
...
}

If a previous AUX transfer times out, wait_for_completion_timeout() returns=
 0
without decrementing the completion's done counter. If the hardware later
generates an interrupt, the IRQ handler calls complete(&dp->complete).

Will the next call to dw_dp_aux_transfer() immediately pass its
wait_for_completion_timeout() without actually waiting for the new command =
to
complete?=20

This could lead to reading stale or invalid hardware status.

[Severity: High]
This is a pre-existing issue, but is there a hotplug event state overwrite =
race
between dw_dp_handle_hpd_event() and dw_dp_hpd_work()?

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_handle_hpd_event() {
...
	if (value & HPD_IRQ) {
		dev_dbg(dp->dev, "IRQ from the HPD\n");
		dp->hotplug.long_hpd =3D false;
		regmap_write(dp->regmap, DW_DP_HPD_STATUS, HPD_IRQ);
	}

	if (value & HPD_HOT_PLUG) {
		dev_dbg(dp->dev, "Hot plug detected\n");
		dp->hotplug.long_hpd =3D true;
		regmap_write(dp->regmap, DW_DP_HPD_STATUS, HPD_HOT_PLUG);
	}
...
}

If a long HPD event occurs, long_hpd is set to true and work is scheduled.
If a short HPD event occurs before the workqueue runs, the interrupt handler
overwrites long_hpd to false and calls schedule_work(), which coalesces with
the pending work.

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_hpd_work() {
...
	if (!long_hpd) {
		if (dw_dp_needs_link_retrain(dp)) {
			ret =3D dw_dp_link_retrain(dp);
			if (ret)
				dev_warn(dp->dev, "Retrain link failed\n");
		}
	} else {
		drm_helper_hpd_irq_event(dp->bridge.dev);
	}
...
}

When the work finally executes, it sees long_hpd =3D=3D false and fails to =
call
drm_helper_hpd_irq_event().=20

Can this drop hotplug events, leaving userspace unaware of display connecti=
ons?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v11-0-0d508505f383@collabora.com?part=3D4
