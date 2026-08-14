Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F7733F5BC
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786684495; cv=none; b=l6Aa+r/4D6Clzy41naswwuoJAiZo8mCAX6E2tdDkc0WTetL4FoJV30ShKE4ELo6YbW2/8Dq+1rSVD6inmqyuhUIDWpKvy7kGlVPn4VBD9ybEaaIWJ8eU4d7RwarOHa28GeEoH4tbONTP1wmZq0FVVQq81UwqYRTlXoYg2U5CCeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786684495; c=relaxed/simple;
	bh=zGxFwoBKG4bstg/JyriU6zXQZnHWX1Ed/GNjRRqey2U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fk9YD3Q3GKyO++Qz7qbud0/fXKdc18tqL8PEvKWdOEiFZY0SDb49F+TIVPN+Af6mOuV6iu50Gqv1dfpKHjOxlbuMOvp05CNij/2+PXF3tpIPHzUgaH3UpIpaktk1kPu8oi3+icCMeKnwyf6KFQEQbuQ9gGSFGINM92KVQiO7lzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2tCDB/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2tCDB/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD421F000E9;
	Fri, 14 Aug 2026 05:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786684494;
	bh=0tabxgf2HqNhSwGzmW0+5bJFHR/phfXBWPKnsW3RNhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T2tCDB/agh63veMMOhnw/iRUveYvHD6bwoBeBDh6RyU1K+j74Zzem96OFNNzZhJNx
	 djMN0zmuEB8G5Yv2wf8f+xiTDws0EOGn7oR15Hfy66ggLdRn2ia7ftedCUDzBF+EG2
	 IRMALNeyCtC2/i6SSxYk/aRdUnYaSzruvk7jvZWsrmLm2CCJwIE6Ku4/vV1uooLJBY
	 x/J+8J1PYTRpGYmXEZKBl0XtYnZrVYaAS/cRs7X+8aYFRqrVe5J3Ct+etUiHoy1WQ1
	 nrjsf6KXQXcp63Bz29cTQEV8PPt5b0D2U9V1KEXxFK2ES2yg1gS7xKURhLJtTkgA5F
	 19NZlwY3PnUPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 28/38] phy: core: add notifier infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 05:14:53 +0000
Message-Id: <20260814051453.9BD421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] AB-BA lock inversion deadlock between PHY consumer state locks and=
 phy->mutex via synchronous notifier.
--

--- Patch [28]: [PATCH v14 28/38] phy: core: add notifier infrastructure ---
commit 140d5ba0c3927a01cec06534c2dc22cf14579ba0
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: core: add notifier infrastructure

This commit introduces a notifier API for PHY devices, allowing consumer
drivers to hook into PHY reset events. This provides a mechanism for consum=
ers
to gracefully handle the PHY going down during configuration or orientation
changes.

> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 21aaf2f76e53e..51d261daae7a9 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c

[ ... ]

> @@ -542,6 +542,70 @@ int phy_notify_state(struct phy *phy, union phy_noti=
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
> + * This may be called from within PHY provider callbacks (e.g. set_mode,
> + * power_on) where phy->mutex is held. Consumer notification handlers mu=
st
> + * therefore NOT call back into the PHY framework (e.g. phy_power_off,
> + * phy_exit) on the same PHY, as this would result in a deadlock.
> + *
> + * Returns: %0 if successful or no notifiers registered, a negative error
> + * code if a notifier returns an error (for PRE_RESET only)
> + */
> +int phy_notify_reset(struct phy *phy, enum phy_notification event)
> +{
> +	int ret;
> +
> +	if (!phy)
> +		return 0;
> +
> +	ret =3D blocking_notifier_call_chain(&phy->notifier, event, phy);

[Severity: High]
Does this synchronous notification under phy->mutex introduce an AB-BA lock
inversion risk with consumer driver state locks?

For example, if a multi-port PHY has multiple consumers (like DP and USB),
Consumer A could acquire its driver state lock (e.g., dp_lock) and call
phy_power_on(phy), blocking on phy->mutex.

Concurrently, if Consumer B triggers a phy_set_mode(phy) call, the PHY core
acquires phy->mutex and invokes the provider's callback, which in turn calls
phy_notify_reset(). This synchronously invokes Consumer A's notifier callba=
ck
via blocking_notifier_call_chain().

If Consumer A attempts to acquire its state lock (dp_lock) within the notif=
ier
callback to safely quiesce its hardware, it will deadlock. Is it safe to ex=
ecute
this blocking notifier chain while holding phy->mutex?

> +	return notifier_to_errno(ret);
> +}
> +EXPORT_SYMBOL_GPL(phy_notify_reset);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D28
