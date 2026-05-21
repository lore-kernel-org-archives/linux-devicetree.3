Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4926B2BE655
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327151; cv=none; b=ONBOqmuq/bYgv0mMkca94DtdGXs42Mt4ANOU5ielZRr9YOLgdfvOjeZ5TXmO7aFKPYXwRtMY0N1zbrHYGuzr6p+V0FpaK+eV3P2e2qUUo9GtmJBYLxPoypR39p2fhHe/+v1TUR/0nuSH42VFRETqoBbpwthbsTLLtKqdcZotkdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327151; c=relaxed/simple;
	bh=lLNMwq6t0uGBVBJhdlCtfxnyfXrg2Jh3Gt2OOlmGFdE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nuZnXjHmMXeWK3qjLo5xJ1ow6OLLnXmY+NnaO0II32/HWLCHTN14FrgGu9X/96vYWif7yf2ARnkqNA27kLDHTCrKtQFBAjpRMrWYkEB5H8POeXoaFDuBKdmWG/cAGXTmfebMmijdzlc33lupSXM05RlLuqM112xJUrEi/19wWS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZDnRymr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZDnRymr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4F31F000E9;
	Thu, 21 May 2026 01:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779327140;
	bh=4oCHS9JaNse608Ki3VIT/VqoREB//wwT9D+C6wCoSSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZDnRymrwc5QBndBcFkkg6ikfeFSknDYKuiC5o5Jrrf2EuGJA7WBJpRaS1ID94Rsf
	 yGidXowM6ziDRmswFzz+rhGBdkOdrIce6SEBucMCy0HxmObN94uoJ+t5wsKxze7vfs
	 k8cwuaYCcQUvIgK5OVXrCNft1n0IhcNzlirdfprzjwRR1OdzwtyqjVMAHNbezwQiAg
	 OmI0UIItcX5mR9lBb2jymCmCm0/T4N5ZvsqMKJ60cIdeJkFF8auluRvG2w24oRxgUO
	 aQ4zTldvBtrKOK3c62fc9LJXCfEwEurNDE+Ojc5ENh44crLuRvvITpU98UNbh/4St/
	 kdS685OdGdYwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] phy: qcom: qmp-combo: skip USB power_off/exit after
 device teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Scott" <mike.scott@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260521003615.1260844-2-mike.scott@oss.qualcomm.com>
References: <20260521003615.1260844-2-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 01:32:18 +0000
Message-Id: <20260521013219.BC4F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Bailing out early in `qmp_combo_usb_exit()` completely bypasses th=
e release of shared common resources, causing a permanent reference leak wh=
en a Type-C switch to `DP_ONLY` occurs.
- [High] A lockless Time-of-Check to Time-of-Use (TOCTOU) race condition on=
 `qmp->usb_init_count` in `qmp_combo_usb_exit()` leads to integer underflow=
 and state corruption.

Pre-existing issues:
- [High] The patch attempts to fix an MMIO crash by introducing a Use-After=
-Free read on the `qmp` driver data structure.
--

commit 35c4e56f462fac540e8354624e2048c6bd3ecd9e
Author: Michael Scott <mike.scott@oss.qualcomm.com>

phy: qcom: qmp-combo: skip USB power_off/exit after device teardown

This commit adds checks to qmp_combo_usb_power_off() and qmp_combo_usb_exit=
()
to guard against being called by an external consumer after the device's
backing resources have been released. It uses the usb_init_count variable
to determine if the PHY is powered on, skipping the operations to prevent
an oops.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index 93f1aa10d4008..4057583c0cfeb 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3922,6 +3922,17 @@ static int qmp_combo_usb_power_off(struct phy *phy)
>  	struct qmp_combo *qmp =3D phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> =20
> +	/*
> +	 * Reachable as ->exit from external consumers (notably dwc3) after
> +	 * this device's backing resources have already been released along
> +	 * a teardown chain. Refuse to touch registers in that case.
> +	 */
> +	if (!qmp->usb_init_count) {

[Severity: High]
This isn't a bug introduced by this patch, but does this check introduce
a use-after-free read on the qmp driver data structure?

The commit message notes that this path runs after the device's backing
resources are released. Since qmp is allocated using devm_kzalloc(), it is
also freed during devres teardown.

When dwc3 calls phy_exit() later, phy_get_drvdata() returns a freed pointer.

Dereferencing qmp->usb_init_count accesses this freed memory. If the memory
was reallocated and non-zero, or if KASAN is enabled, wouldn't this still
trigger a use-after-free and crash instead of masking the teardown order bu=
g?

> +		dev_dbg(qmp->dev, "%s: PHY not powered on, skipping\n",
> +			__func__);
> +		return 0;
> +	}
> +
>  	clk_disable_unprepare(qmp->pipe_clk);

[ ... ]

> @@ -3966,6 +3977,17 @@ static int qmp_combo_usb_exit(struct phy *phy)
>  	struct qmp_combo *qmp =3D phy_get_drvdata(phy);
>  	int ret;
> =20
> +	/*
> +	 * See qmp_combo_usb_power_off(): an external consumer may call
> +	 * phy_exit() after the QMP device's resources have been torn
> +	 * down. usb_init_count tracks usb_init/usb_exit balance.
> +	 */
> +	if (!qmp->usb_init_count) {

[Severity: High]
Does bailing out early here bypass the release of shared common resources,
causing a reference leak when a Type-C switch to DP_ONLY occurs?

When the Type-C mux switches to QMPPHY_MODE_DP_ONLY,
qmp_combo_typec_mux_set() decrements usb_init_count to 0 but leaves
init_count unchanged. If the consumer unbinds and calls phy_exit() in
this state, this early return bypasses the qmp_combo_com_exit(qmp, false)
call.

Doesn't this mean qmp->init_count is never decremented, permanently
leaking shared resources like clocks and regulators?


[Severity: High]
Is there a lockless Time-of-Check to Time-of-Use race condition here?

This check is performed before acquiring qmp->phy_mutex. If another path
like qmp_combo_typec_mux_set() holds the mutex and decrements
usb_init_count to 0:

CPU1
qmp_combo_usb_exit()
   if (!qmp->usb_init_count) // observes > 0
   mutex_lock(&qmp->phy_mutex); // blocks

CPU2
qmp_combo_typec_mux_set()
   mutex_lock(&qmp->phy_mutex);
   qmp->usb_init_count--; // becomes 0
   mutex_unlock(&qmp->phy_mutex);

When CPU1 acquires the lock, it proceeds to decrement qmp->usb_init_count
without re-verifying the state. Doesn't decrementing 0 cause an integer
underflow to UINT_MAX, breaking the PHY's power management balance?

> +		dev_dbg(qmp->dev, "%s: PHY not initialised, skipping\n",
> +			__func__);
> +		return 0;
> +	}
> +
>  	mutex_lock(&qmp->phy_mutex);
>  	ret =3D qmp_combo_usb_power_off(phy);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521003615.1260=
844-1-mike.scott@oss.qualcomm.com?part=3D1
