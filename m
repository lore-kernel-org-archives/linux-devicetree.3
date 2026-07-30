Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4588638BF9C
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 03:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785382792; cv=none; b=LmOy2yRvSeu+/PokZ4zrefJzpSwXlpXggXdVfdkN9qXJmBcB3fEyJWMItSguVYgDpbP9uWZJcNJRwXcpNktc9wrpkCQDwZXJYIIhNIw+nHgpjLkda848eGapVPJS9QrdMTcK83WWZR9DeS5Qe4vvwMtqfYsDf0BsINRHg6uv5Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785382792; c=relaxed/simple;
	bh=D6gD7IPBszeLsbeNoOe2Xj2pXFFbPbEEPhtltN2WHpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q13KzmNpogKOIEfNi541nk1XW5/9tGzh6xLAl0sJNatUApSMaoq5u8x8EGz4BuMbZ5Fi5AtOvSPjTmlR5oJKyCMcc2gyyvjvzxhTqToIQOaQe1nLlHQHdy+INOWUZrIIKtHkSYA9OBawp9D4z+6/bgoQAs53CnfmiWu6TThwabM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvDqZETY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvDqZETY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E591F000E9;
	Thu, 30 Jul 2026 03:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785382790;
	bh=/8is5YmLPHrNpU2nX66cBOZpu8d2qYyVEQuo44Phyok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SvDqZETYY2df3WqILiKpqrPELFRB2arHviCAW3he0mLa7UnvNXjCBilhCyqCUtdJ7
	 2ygtOVmuprB60OZWSfps2aUGJ0wNkZWkksMTdaBytobSgaLCAK8/WSLsN4MY6Bexqr
	 f9RDLfTOsW3bMrfSuvzI4TSuaFuTMJciGvzsh3gPtIk6NsA0uefHrPmt0/tiScIX8R
	 quq3VEL44fwq/u1o7zJdpiiRbq/f4nLeJQxsc3Gk7vyyG0GEHf/wR8ajHD97pKW+LH
	 CNNeTbOHDWGZcwiyasebs0CT7lJ/YmXHN01nmTURpzxQEqtTbTG9ikMand6rVasvvP
	 utygsmc+9hWeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/7] drm/bridge: analogix_dp: Manage pm runtime and
 IRQ for native HPD pin detection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260730032744.381566-2-damon.ding@rock-chips.com>
References: <20260730032744.381566-1-damon.ding@rock-chips.com>
 <20260730032744.381566-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 03:39:50 +0000
Message-Id: <20260730033950.86E591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The HPD IRQ handler unconditionally accesses unclocked DP controll=
er registers during runtime suspend on GPIO HPD and non-Rockchip configurat=
ions, causing a synchronous external abort (system crash).
--

--- Patch [1]: [PATCH v1 1/7] drm/bridge: analogix_dp: Manage pm runtime an=
d IRQ for native HPD pin detection ---
commit 0b74430c48be5d81c8cb19f2cd5f520d6c7a696a
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Manage pm runtime and IRQ for native HPD pin detec=
tion

This commit moves enable_irq() and disable_irq() from bridge enable/disable
handlers to analogix_dp_bind() and analogix_dp_unbind() to keep HPD detecti=
on
active. It also acquires a runtime PM reference exclusively for Rockchip
native HPD pin configurations to ensure the controller remains powered.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 30c0c0b41d5aa..1c98f92e001d8 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

[ ... ]

> @@ -1508,6 +1511,14 @@ int analogix_dp_bind(struct analogix_dp_device *dp=
, struct drm_device *drm_dev)
>  		goto err_unregister_aux;
>  	}
> =20
> +	if (analogix_dp_require_pm_for_hpd_irq(dp)) {
> +		ret =3D pm_runtime_resume_and_get(dp->dev);
> +		if (ret)
> +			goto err_unregister_aux;
> +	}
> +
> +	enable_irq(dp->irq);
> +

[Severity: High]
Since pm_runtime_resume_and_get() is only called for Rockchip native HPD,
other configurations (like GPIO HPD or Exynos) can enter runtime suspend
while the IRQ remains enabled here.

If the HPD interrupt fires (e.g. via an active GPIO pin) while the device is
in runtime suspend, will this cause a crash?

The hardirq handler executes and performs unconditional MMIO accesses to the
unclocked DP controller:

analogix_dp_hardirq()
  analogix_dp_mute_hpd_interrupt()
    readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);

Accessing memory-mapped registers of a clock-gated peripheral typically
causes a synchronous external abort.

>  	return 0;
> =20
>  err_unregister_aux:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730032744.3815=
66-1-damon.ding@rock-chips.com?part=3D1
