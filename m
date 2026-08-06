Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F11370ACC
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786037559; cv=none; b=HfRICVl7D0PX86KEfeBo8EdBoksPGNHc/q2c+64cpwDGCcOOnJkE1bNZz2aanfWyxQYX/GhFmzK4CMR+rWL2lMAXrTdL6AWBlCPRNPcrkIrTf89B/lZ4vd+oXyMyPVAJvSa5vjQtdfJ4CuFfIrjDYtCj8LzGzLBH81c6stnGq3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786037559; c=relaxed/simple;
	bh=GEWp7c6YBVvReg6L2RzA0yCBGvAg3jKyF1BLufSzq7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JiUFgbcf1uiUmwN0R0GH2bdKcWvE5CWQz9WAS/vRQ2uEBpGtt++JXN0FZ+I+0vSJvsnKskS+ORPMwS/7hba/pmyP3RvXhe+jmrqxw1GqSO9ZheVIz8igHwQRUiIAOSofgkPczL2yGpYLG02L4Rqhl49otp0AcS6s/FOIiK1ZJXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJmDMMN4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJmDMMN4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5FF1F00A3A;
	Thu,  6 Aug 2026 17:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786037557;
	bh=Lzxzc43YNKTke1YdbFF/V7UKMqHnxRcYUwMbUjNcQ2U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GJmDMMN4IhSAq2HnFE9oUwpuVcv5p7RXgpgAtaOy89A9O0wIdOzUKHjBJJFEAGN2k
	 CgzG0HmTi05O8DmNj82prW16F62g3FHpUUjJKBVXzpZ8O5AJd1G0bATLbnkm/Ra4J6
	 6w5BThtvDio8rLpHtN6Y1JcaWUEwQMCMu20GFg3zCjen90MIEOdfQq/gwzg+cX5Oh0
	 ZFKwoD7RZCYaTxRq6ChPD4pdIQ7SY053xED5MEz03L81HXXjQQ9NUoAh67/391GOg/
	 PRUofPMqiG4QNUQzlBp6yB58444q4q8RKlNOpcCITy2ddoEyvM3T7mZSrqDWHjsKrt
	 ASfwTAe/9hmGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 06/21] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-6-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-6-0d508505f383@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:32:36 +0000
Message-Id: <20260806173237.7A5FF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The timeout recovery path fails to explicitly clear the latched `A=
UX_REPLY_EVENT` interrupt status, leaving a race window that corrupts the n=
ext AUX transfer.
--

--- Patch [6]: [PATCH v11 06/21] drm/bridge: synopsys: dw-dp: Fix AUX trans=
fer timeout race condition ---
commit f3d806ec9da65b4fec77558418a758675e7524f1
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Fix AUX transfer timeout race condition

This commit attempts to fix a race condition during DP AUX transfer timeouts
by re-initializing the completion before sending the command, resetting the
AUX controller, and synchronizing pending interrupts.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index b1856418f4419..2573ea2bb5744 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -1492,6 +1494,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_au=
x *aux,
>  	status =3D wait_for_completion_timeout(&dp->complete, timeout);
>  	if (!status) {
>  		dev_err(dp->dev, "timeout waiting for AUX reply\n");
> +		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
> +				   AUX_RESET, FIELD_PREP(AUX_RESET, 1));
> +		usleep_range(10, 20);
> +		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
> +				   AUX_RESET, FIELD_PREP(AUX_RESET, 0));
> +		synchronize_irq(dp->irq);

[Severity: High]
This is a pre-existing issue, but does this timeout recovery path fail to
explicitly clear the latched AUX_REPLY_EVENT in the DW_DP_GENERAL_INTERRUPT
register?

Even with the newly added AUX_RESET and synchronize_irq(), if the hardware
finishes concurrently with the timeout, it could latch the AUX_REPLY_EVENT =
in
the top-level W1C register. Since the reset only targets the AUX sub-module,
the latched interrupt status might remain uncleared.

If a delayed spurious interrupt is latched but the threaded handler hasn't
started (or the irqchip doesn't support pending state queries), could
synchronize_irq() return without clearing it?=20

If so, the caller could retry the transfer and call reinit_completion(),
after which the delayed interrupt finally runs, sees the uncleared
AUX_REPLY_EVENT, and calls complete() prematurely for the next transfer.

Should the top-level interrupt status be explicitly cleared here before
returning to fully close this race window?

>  		return -ETIMEDOUT;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v11-0-0d508505f383@collabora.com?part=3D6
