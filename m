Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127830EF7D
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779328354; cv=none; b=FI1QjbNo2JD46Pm3ps4jvg/D7gefmRWipy9QiGfIUSE+xt/cdy4G3bYE9zjMu8rLOYVKy3Ri6p+lVXZYzaPw3Opujyu3cp26n5o0FzkH2lfHb8P+hIX2+8yiQDt9pLZO0oLRExoUQFT/8fXofqjBLuYtOzESxMivHDd/uBlbeds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779328354; c=relaxed/simple;
	bh=M7lT5id78LwczkebB9TPjZdy1p/74fkyz45FjLhZkTw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H7t854R5DZP4JgslIOiGJiMtE+z+1ZbVXxq9jRxdvqXYdNWKcEaS8VV7TXYazLVY3QJpHdPE9eYapa6ZxWwpznjxS6DrAtKq6KUSa72E/uS/FYT4uyuLo4WOVNa/vlQEWwTfkSLAMvA249Tr8zRh9BxX4eyGoLP90ialB0oiYKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bz0jAjWV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bz0jAjWV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C111F000E9;
	Thu, 21 May 2026 01:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779328346;
	bh=WNS/pIAxF1J6xE3ucTOOTwB5PG3rS5FLeWPYQdnG5pA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bz0jAjWVV1KDOkioT0hv2oxiQnDwP8aXmD9x0zE3fQZZrzvDddgQh6hY/HMmgDiTP
	 WuS2hm4HUJjlbZEgWWVhTDLJFWsKsAZj40wdRw55IAdfTnuIw1gli4JuGtrIEhLo+V
	 DONkfAl9S+OnU+YS8hUSTJ48NtRo8zh59c8u9vEoTC6X+hNeisZlZSwE7rUxAUwsys
	 1Z1DxWSwsRC1ppF3K3RMRMxi8biOtWnasK0OiBJCmuehLBcJjyywWCNfLeVRTxuRaE
	 CEYLmlALGLES2Sg+0gv4+c/MBQQ1Uf7YGZm6F/TpG3uLPxyNKNoZiSK5K6ziqs3Z7E
	 PSprGWPl+0xDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] phy: qcom: qmp-combo: skip USB power_off/exit
 after device teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Scott" <mike.scott@oss.qualcomm.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260521010935.1333494-2-mike.scott@oss.qualcomm.com>
References: <20260521010935.1333494-2-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 01:52:23 +0000
Message-Id: <20260521015225.56C111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The lockless check of `qmp->usb_init_count` in `qmp_combo_usb_exit=
()` introduces a Time-of-Check to Time-of-Use (TOCTOU) race condition that =
can lead to an integer underflow and unbalanced resource management.

Pre-existing issues:
- [Critical] The patch attempts to prevent a crash by checking `qmp->usb_in=
it_count` after the device's backing resources are released, but the `qmp` =
structure itself has already been freed via `devm` cleanup, resulting in a =
Use-After-Free.
--

commit 639386ffdb78db9a5c3e78a1f3ada8713f38acd7
Author: Michael Scott <mike.scott@oss.qualcomm.com>

phy: qcom: qmp-combo: skip USB power_off/exit after device teardown

The commit attempts to prevent crashes when external consumers like dwc3
call phy_exit() after the QMP PHY's backing resources have been released,
by guarding the power_off and exit paths with a check on the
usb_init_count balance.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index cdcfad2e86b1d..0db200292642e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3926,6 +3926,17 @@ static int qmp_combo_usb_power_off(struct phy *phy)
>  	struct qmp_combo *qmp =3D phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> =20
> +	/*
> +	 * Reachable as ->exit from external consumers (notably dwc3) after
> +	 * this device's backing resources have already been released along
> +	 * a teardown chain. Refuse to touch registers in that case.
> +	 */
> +	if (!qmp->usb_init_count) {

[Severity: Critical]
This is a pre-existing issue, but the qmp structure itself is allocated
using devm_kzalloc(), so it is freed during the device's devres cleanup.
If dwc3 calls phy_exit() after qmp_combo has been unbound, won't accessing
qmp->usb_init_count result in a Use-After-Free (UAF) read?

If the freed memory happens to be zeroed, the read evaluates to 0 and
successfully masks the bug by skipping the remainder of the function. If
SLUB poisoning or KASAN is enabled, this will trigger a UAF splat or read a
non-zero value, proceeding to call mutex_lock(&qmp->phy_mutex) on freed
memory.

Does this patch replace a vmap UAF on qmp->pcs with a slab UAF on the freed
qmp structure instead of fixing the underlying lifecycle bug?

[ ... ]

> @@ -3968,6 +3979,17 @@ static int qmp_combo_usb_exit(struct phy *phy)
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
Does checking qmp->usb_init_count outside of qmp->phy_mutex introduce a
Time-of-Check to Time-of-Use (TOCTOU) race?

If a concurrent thread (such as qmp_combo_typec_mux_set() reacting to a
Type-C event) acquires the mutex and decrements usb_init_count to zero
immediately after this lockless check succeeds, qmp_combo_usb_exit() will
proceed to acquire the lock.=20

It will then call qmp_combo_usb_power_off(), which will safely check the
count under the lock and return 0 for success.

Because qmp_combo_usb_power_off() returns success, qmp_combo_usb_exit()
mistakenly proceeds to call qmp_combo_com_exit() and unconditionally
executes qmp->usb_init_count--.=20

Since the counter is an unsigned int and is already 0, could this wrap
around to UINT_MAX and cause unbalanced regulator and clock disables
which can crash the system?

> +		dev_dbg(qmp->dev, "%s: PHY not initialised, skipping\n",
> +			__func__);
> +		return 0;
> +	}
> +
>  	mutex_lock(&qmp->phy_mutex);
>  	ret =3D qmp_combo_usb_power_off(phy);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521010935.1333=
494-1-mike.scott@oss.qualcomm.com?part=3D1
