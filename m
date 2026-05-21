Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322C1357D13
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779330046; cv=none; b=qmXVn3ISYAXSmrRfnLjd3acfjyTBlBqxINL5xCalmE/87Wm+h8ROLQLOQ+erS1EifLSa/nDb/edm9191LH+hhh1Uc7I0zzc2XhRFSfDEIVZVLRG3vUSFIRVaiXT7szBWydyFPBbjizF27nJT3dgkVx3iFFz7gRFMKmUqn/DZkVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779330046; c=relaxed/simple;
	bh=36pRNnHUdvnB/SflcBY1+oxf9s92ECu+J6FIgDPZ2Wo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XlKr5/tex3auW5vhQ1YgQ+HwYsHbNRUkCaYNZ4p1brEEWs/m6eLqfjpq7LVihTMIjmyvuE0s0h1084pr2otGy8zSC4a9TgvwK2ZeY+0cgyUpvaWk8aQ9Ug9XGdGmnrPTpYTxwIuG29Tj4/Jf/XAkMySDR+s3aK/jm5ddjRNEeFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cd/rUlPh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cd/rUlPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AF01F00A3B;
	Thu, 21 May 2026 02:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779330026;
	bh=YS9BBaFQ0I6KFrevP9NhpEZdbOoQlN1WCDJJolgfBSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cd/rUlPhAsovpYVVvDh8pm282rns5aLPPoHhudYZVOc+dR+mh9izA5R+rG83hDp41
	 1fdHFEZN6/S7x0XxV31EBIKVSxaxJJzmyDdIDrJ9IESqUjcb2zMcO0aHLl8LNomJyO
	 X0NJSIVqy6FrLR89ol9KZgIjjk/QxuUPuRMbyZXVUjCj5+eGdt8HZSGP57jvNz2Nkq
	 oFeRKYLKh/qIXmZFjauprbgDPlVrr7TqNgZsEqDAO6XhPTEaZsjf9mSf6gXnbQN6lN
	 QKFMlkvxO0d54t+HFYidHOAPdudH+K2U2AHiOcY6T6FEuu4KevgAPHo4w9rfnto/pJ
	 XYFbkaCtgKrKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] phy: qcom: qmp-combo: track whether the cached
 typec_mux mode was committed to hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Scott" <mike.scott@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260521003615.1260844-3-mike.scott@oss.qualcomm.com>
References: <20260521003615.1260844-3-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 02:20:25 +0000
Message-Id: <20260521022025.B0AF01F00A3B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The patch is a complete logical no-op and fails to alter the hardw=
are programming flow in the described failure scenario.
- [Medium] The patch unconditionally marks `qmpphy_mode_committed =3D true`=
 in `qmp_combo_typec_mux_set()`, ignoring hardware reprogramming failures.

Pre-existing issues:
- [High] `qmp_combo_com_init()` incorrectly decrements `init_count` on fail=
ure when `force =3D=3D true`, corrupting reference counts.
- [High] TOCTOU race condition in `qmp_combo_usb_exit()` causes `usb_init_c=
ount` integer underflow.
- [High] Delayed PHY mode switches are permanently dropped if the DP PHY is=
 actively powered on.
--

commit 6892dbad473d7036463b8a81f539f3ea5bbf55d4
Author: Michael Scott <mike.scott@oss.qualcomm.com>
Subject: phy: qcom: qmp-combo: track whether the cached typec_mux mode was =
committed to hardware

This patch attempts to fix an issue where the typec_mux_set function
bails out early and fails to reprogram hardware if called before
phy_init. It adds a committed flag to track if the cached mode matches
the actual hardware state.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index 4057583c0cfeb..9b6da783ce607 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3747,6 +3748,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp=
, bool force)
>  	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>  			SW_PWRDN);
> =20
> +	/* com_init() just programmed registers from qmp->qmpphy_mode. */
> +	qmp->qmpphy_mode_committed =3D true;
> +
>  	return 0;
> =20
>  err_assert_reset:
>  	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>  err_disable_regulators:
>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>  err_decrement_count:
>  	qmp->init_count--;
> =20
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but does this error path corrupt the reference
count when called with force =3D=3D true?

If qmp_combo_com_init() is called with force =3D true, the short-circuit
evaluation bypasses incrementing qmp->init_count:

    if (!force && qmp->init_count++)
        return 0;

However, if a subsequent operation like regulator_bulk_enable() fails, the
error path jumps to err_decrement_count and unconditionally decrements it.

Could this underflow init_count to -1, permanently breaking the initializat=
ion
state machine since subsequent checks like `if (qmp->init_count++)` will see
truthy values?

[ ... ]

> @@ -4507,9 +4511,22 @@ static int qmp_combo_typec_mux_set(struct typec_mu=
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
>  		dev_err(qmp->dev, "DP PHY is still in use, delaying switch\n");
>  		return 0;
>  	}

[Severity: High]
This is a pre-existing issue, but does this early return permanently drop
delayed PHY mode switches?

If a switch to QMPPHY_MODE_USB3_ONLY is requested but the DP PHY is actively
powered on, this branch bails out early, logs a message, and returns 0.

Because it returns success without updating qmp->qmpphy_mode or scheduling a
delayed work to apply the switch later, the Type-C framework assumes the mo=
de
was successfully applied.

Does this cause a permanent desynchronization between software state and
hardware, keeping the DP PHY powered when it should be disabled?

> @@ -4521,6 +4538,7 @@ static int qmp_combo_typec_mux_set(struct typec_mux=
_dev *mux, struct typec_mux_s
>  		qmp->qmpphy_mode, new_mode);
> =20
>  	qmp->qmpphy_mode =3D new_mode;
> +	qmp->qmpphy_mode_committed =3D false;
> =20
>  	if (qmp->init_count) {

[Severity: High]
Is this patch effectively a logical no-op in the failure scenario it
describes?

If typec_mux_set() is called before phy_init() (when init_count is 0), the
early bail-out is bypassed because qmpphy_mode_committed is false. However,
the code then reaches the `if (qmp->init_count)` check here, which evaluates
to false, causing the function to return without touching the hardware anyw=
ay.

When phy_init() eventually executes, qmp_combo_com_init() correctly syncs
hardware to the cached mode and unconditionally sets
qmpphy_mode_committed =3D true.

Subsequent calls to typec_mux_set() with the same mode will see
qmpphy_mode_committed =3D=3D true and bail out early, exactly as they did b=
efore
this patch. Does this mean the hardware state remains unchanged from the
pre-patch behavior?

>  		if (qmp->usb_init_count)
[ ... ]
>  			if (qmp->dp_init_count)
>  				cfg->dp_aux_init(qmp);
>  		}
> +
> +		/* Reprogram complete; cache now reflects hardware. */
> +		qmp->qmpphy_mode_committed =3D true;
>  	}

[Severity: Medium]
Is it safe to unconditionally mark the hardware state as committed here?

The code calls qmp_combo_com_init(qmp, true) earlier in this block to apply
hardware changes, but ignores its return value. If qmp_combo_com_init() fai=
ls,
the hardware state remains unconfigured, but this flag is blindly set to tr=
ue.

Would this prevent any subsequent attempts to correct the hardware state,
since future calls will trigger the early bail-out on
qmp->qmpphy_mode_committed?


[Severity: High]
This isn't a bug introduced by this patch, but is there a time-of-check to
time-of-use race condition in qmp_combo_usb_exit() that can underflow
usb_init_count?

If qmp->usb_init_count is checked outside the phy_mutex in
qmp_combo_usb_exit(), a concurrent Type-C mode switch could occur:

Thread 1: qmp_combo_usb_exit()
    if (qmp->usb_init_count =3D=3D 0)
        return;
    // Preempted before acquiring phy_mutex

Thread 2: qmp_combo_typec_mux_set()
    mutex_lock(&qmp->phy_mutex);
    // Switches to QMPPHY_MODE_DP_ONLY
    qmp->usb_init_count--; // Now 0
    mutex_unlock(&qmp->phy_mutex);

Thread 1 resumes:
    mutex_lock(&qmp->phy_mutex);
    ...
    qmp->usb_init_count--; // Underflows to UINT_MAX

Could this permanently break subsequent power management logic and allow
unclocked hardware accesses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521003615.1260=
844-1-mike.scott@oss.qualcomm.com?part=3D2
