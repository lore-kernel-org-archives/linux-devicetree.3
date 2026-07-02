Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED42625
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 00:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950815; cv=none; b=EE52x4BTDwUbyaAJateQsrQJzIOowjthn1Q4hgxn98evdYUgaOUDc7+q6qo7e88GIabJYOE2Fv/iZFL3dKIPuP0BHmqgyQM2X1npAaOpdViXyL1NNvWFKtyfYv8pMzk7V9ncnWKWVY7iVTmVBtqcJNedOOLqBz4+Qhu7antVht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950815; c=relaxed/simple;
	bh=ovYDg50TRAX1f5BDzt5ralnvA4w73rSTHb5mV9p0+Z4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pMLipRVC4KttO8Q6LsehzxIqNuMbFscS7mQNSrp9tRL2LCGku6E5OaGlQ2jfmDsX4kcXiGsuh9BoJJs7elCT99PGWnVDAIgdQfN1WPaSrzoxgIAHgXZwsDc8D7nYzKUz2vcXJW+fZX5xPCd0dkt36KkiElOzR5t4vxF8pUoDH+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivnOIbTC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivnOIbTC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7D71F000E9;
	Thu,  2 Jul 2026 00:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782950813;
	bh=BQwRPwZ8hEdTWdaM4RjwFdd6tjVYQo+WdFyfomYDeGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ivnOIbTCX6RUa/TKl0ikH9xhA5qTigoAnFRII6dzRtN6b3HoMn8b4NlYgPChPkHAI
	 7HrD8jtp8uxOF1lWaERYlRKAkl09LfDKr9V1OiSLfQfcNylYrbw+f0t8ae41N+bhb0
	 8PnDcd9TCzETpPIPJTOIJ1J5f2ZbyIljCNUAFIbEHQ3BhXgFJacvg7RPqtZLwr2nC8
	 r9NJc4C3z4HPRH2IQUQC9hSLqIWYW6wIg73ZvaR2ScMPgcNb90efhfAewOAPAM3gCC
	 H743HvipfpflAVkFB8YPbsKNjYmFbtZwLmtiXpEnmjb7rL4dg8RYk2t/Y0kOC5rhoa
	 UIZ8lh60eKqxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 31/38] phy: core: add notifier infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, olteanv@gmail.com, vkoul@kernel.org
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-31-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
 <20260702-rockchip-usbdp-cleanup-v9-31-e31efbb62d2e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 00:06:52 +0000
Message-Id: <20260702000653.5B7D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] `phy_notify_reset` returns the raw notifier chain status instead=
 of a standard negative error code, violating its documented return values =
and breaking error checking for callers.
--

commit 6d8c66a69f0a84cdc34b5b056c42d3cc35cb771e
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: core: add notifier infrastructure

This commit adds a new PHY notifier API to allow consumer drivers to hook
into reset events coming from a PHY device. This helps gracefully handle
situations where PHY devices require a reset due to configuration or cable
orientation changes.

> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 21aaf2f76e53e..533473d975d37 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -542,6 +542,62 @@ int phy_notify_state(struct phy *phy, union phy_noti=
fy state)
[ ... ]
> +/**
> + * phy_notify_reset() - notify consumers of a PHY reset event
> + * @phy: the phy that is being reset
> + * @event: the notification event (PRE_RESET or POST_RESET)
> + *
> + * Called by PHY providers to notify consumers that the PHY is about to
> + * be reset or has completed a reset. This allows consumers to quiesce
> + * hardware before the PHY becomes unavailable.
> + *
> + * Returns: %0 if successful or no notifiers registered, a negative error
> + * code if a notifier returns an error (for PRE_RESET only)
> + */
> +int phy_notify_reset(struct phy *phy, enum phy_notification event)
> +{
> +	if (!phy)
> +		return 0;
> +
> +	return blocking_notifier_call_chain(&phy->notifier, event, phy);

[Severity: Medium]
Does this return the raw notifier chain status (like NOTIFY_OK or NOTIFY_BA=
D)
instead of the documented negative error code?

If callers check the return value with `if (ret < 0)`, they will fail to
detect errors since NOTIFY_BAD and notifier_from_errno() results are positi=
ve
integers. Also, checking `if (ret)` might falsely detect an error on success
because NOTIFY_OK is 1.

Should this use notifier_to_errno() to convert the return value before pass=
ing
it back to the caller?

> +}
> +EXPORT_SYMBOL_GPL(phy_notify_reset);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-rockchip-u=
sbdp-cleanup-v9-0-e31efbb62d2e@collabora.com?part=3D31
