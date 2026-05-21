Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE9023EA84
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779331073; cv=none; b=ZkyKFkyf4ZujcQXtRsjRsGLtSRYEsmd2qn8t6+Fi0F17v6ejEaFa/JbCMG2nM1Qpp3l6uCTmmTodOWb2pDQIMN6b34pBX2kRJNFnI2LsseYRpb+x9PXoSeLNAn/M5+l5BCIc3IGWXoBUp90Z5qWkTx723p89h7rpv9M7wgduBZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779331073; c=relaxed/simple;
	bh=Ro4aVKKD1HaKTTzE+Kh9Q1NQr+kiGe60zJ68Yh16VME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lcy1BqJjVKO8HfnkrFlhPAAfjx31milxdPCyhXshaP1aioUWl+d19l2LVFpdFlM10VhpRtR98bF21OPsKkByM9sDCK2ZW6WtM1f12bmchNe+25xbSU3fl7md6jX0jJ3SZraYHTRojylq6krT6vSRb8n2ED1+KMSW+qyLghl7JZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GT2zdoAN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GT2zdoAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46421F000E9;
	Thu, 21 May 2026 02:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779331072;
	bh=WSTyVe7OqLlaZJo9xDBU9ryVwlnHoQoWqeaZOnwy1/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GT2zdoAN/5ynnVYS6ivClgw3LHEoeEPncPpbZzIFOrJy+WT6R5XWZrlHxT/Tx8V+Z
	 WHHvgDm9hVTSmakz7D+UAtEY+Y12snUAP37S4wjbBtMsWBNiLNDofqtwKfejioL/7r
	 OY7Uq7brnSTqwtyapFBIUF+CrMxay1d+U7g87AudX85MRDZULiYzid5fiIHJajoK5C
	 HG9t3haHzuLqRi8A4VFimVw/G/rux7uU/hoPUmsB8Fbskyaf6xOjF52qOT8zMlj5i1
	 vzlHdZOKW47zy8hYXx997XU7HkNqLjwrSGscAV+oG8Kd3erigT/PIDI2DOaqoXj1wG
	 xkFHhGhlV1ejw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-combo: track whether the cached
 typec_mux mode was committed to hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Scott" <mike.scott@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260521010935.1333494-3-mike.scott@oss.qualcomm.com>
References: <20260521010935.1333494-3-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 02:37:51 +0000
Message-Id: <20260521023751.B46421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The patch fails to resolve the unprogrammed hardware state because=
 the reprogramming sequence is still completely bypassed when `init_count =
=3D=3D 0`.

Pre-existing issues:
- [High] The error handling path in `qmp_combo_com_init()` incorrectly decr=
ements `init_count` when called with `force =3D=3D true`.
- [High] Type-C MUX set operations modify `usb_init_count` independently of=
 `init_count`, leading to resource leaks.
- [High] Lockless access to `qmp->usb_init_count` in `qmp_combo_usb_exit()`=
 causes a Time-Of-Check to Time-Of-Use race condition.
--

commit c4bd0ad144568b18cf6ccfdc50c09f8d088db9c4
Author: Michael Scott <mike.scott@oss.qualcomm.com>

    phy: qcom: qmp-combo: track whether the cached typec_mux mode was commi=
tted to hardware

    This commit introduces a qmpphy_mode_committed flag to track whether the
    cached typec_mux mode has been applied to hardware. It aims to prevent =
an
    early bail-out in qmp_combo_typec_mux_set() when the PHY has not yet be=
en
    initialized and the hardware state is out of sync with the cache.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index 0db200292642e..e28bc1cc7a78b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
[ ... ]
> @@ -3754,6 +3755,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp=
, bool force)
>  	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>  			SW_PWRDN);
> =20
> +	/* com_init() just programmed registers from qmp->qmpphy_mode. */
> +	qmp->qmpphy_mode_committed =3D true;
> +
>  	return 0;
> =20
>  err_disable_clocks:
>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>  err_assert_reset:
>  	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>  err_disable_regulators:
>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>  err_decrement_count:
>  	qmp->init_count--;

[Severity: High]
This is a pre-existing issue, but does this error path permanently break the
PHY's power management lifecycle?

When qmp_combo_com_init() is called with force =3D=3D true, the init_count =
is not
incremented at the start of the function.  However, if a hardware
initialization step fails and execution jumps to err_decrement_count, it wi=
ll
decrement qmp->init_count, leading to an integer underflow.

>  	return ret;
>  }
[ ... ]
> @@ -4509,9 +4513,22 @@ static int qmp_combo_typec_mux_set(struct typec_mu=
x_dev *mux, struct typec_mux_s
>  		new_mode =3D QMPPHY_MODE_USB3_ONLY;
>  	}
> =20
> +	/*
> +	 * Fast-path bail only when the cached mode is also known to be
> +	 * committed to hardware. The cache may be ahead of the hardware
> +	 * if a typec_mux_set arrived while the PHY had not yet been
> +	 * initialised (init_count =3D=3D 0); in that case the cache update
> +	 * below was the only thing that ran, and we still need to drive
> +	 * the registers when the PHY does come up.
> +	 */
>  	if (new_mode =3D=3D qmp->qmpphy_mode) {
> -		dev_dbg(qmp->dev, "typec_mux_set: same qmpphy mode, bail out\n");
> -		return 0;
> +		if (qmp->qmpphy_mode_committed) {
> +			dev_dbg(qmp->dev,
> +				"typec_mux_set: same qmpphy mode (committed), bail out\n");
> +			return 0;
> +		}
> +		dev_dbg(qmp->dev,
> +			"typec_mux_set: same qmpphy mode but uncommitted; reprogramming\n");
>  	}
> =20
>  	if (qmp->qmpphy_mode !=3D QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
> @@ -4523,6 +4540,7 @@ static int qmp_combo_typec_mux_set(struct typec_mux=
_dev *mux, struct typec_mux_s
>  		qmp->qmpphy_mode, new_mode);
> =20
>  	qmp->qmpphy_mode =3D new_mode;
> +	qmp->qmpphy_mode_committed =3D false;
> =20
>  	if (qmp->init_count) {

[Severity: High]
Does this actually fix the unprogrammed hardware state?

When init_count =3D=3D 0, the early bailout is bypassed, but the hardware
programming block inside this if (qmp->init_count) condition is also skippe=
d.

Once phy_init() is called, it executes qmp_combo_com_init(), which sets
qmpphy_mode_committed =3D true.  Would subsequent calls to typec_mux_set() =
then
see committed =3D=3D true and hit the early bailout just as they did before=
 this
patch?

>  		if (qmp->usb_init_count)

[Severity: High]
This isn't a bug introduced by this patch, but can the interaction between
usb_init_count and init_count lead to a resource leak?

When transitioning to DP-only mode in qmp_combo_typec_mux_set(),
qmp->usb_init_count is decremented while using qmp_combo_com_exit(qmp, true=
),
which bypasses decrementing the master qmp->init_count.

If usb_init_count drops to 0, would a subsequent phy_exit() by the USB cons=
umer
return early in qmp_combo_usb_exit() and skip calling
qmp_combo_com_exit(qmp, false)? This would leave the USB consumer's original
contribution to init_count unaccounted for, keeping regulators and clocks
enabled forever.

[Severity: High]
This is a pre-existing issue, but does lockless access to qmp->usb_init_cou=
nt
in qmp_combo_usb_exit() cause a Time-Of-Check to Time-Of-Use race condition?

If qmp_combo_usb_exit() checks usb_init_count without holding qmp->phy_mute=
x,
could it drop to 0 concurrently via a MUX switch to DP-only in
qmp_combo_typec_mux_set()?  When qmp_combo_usb_exit() subsequently acquires=
 the
lock and continues, it would decrement usb_init_count causing an underflow =
to
UINT_MAX, allowing future exits to bypass the zero check and trigger unbala=
nced
teardowns.

> @@ -4551,6 +4569,9 @@ static int qmp_combo_typec_mux_set(struct typec_mux=
_dev *mux, struct typec_mux_s
>  			if (qmp->dp_init_count)
>  				cfg->dp_aux_init(qmp);
>  		}
> +
> +		/* Reprogram complete; cache now reflects hardware. */
> +		qmp->qmpphy_mode_committed =3D true;
>  	}
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521010935.1333=
494-1-mike.scott@oss.qualcomm.com?part=3D2
