Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB4143F4A3
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422327; cv=none; b=pFoqscHV3u0LifNig8sJsn9Mckbh7B89rUHHo+kfAuzxvKqyhRYS9M172S+W9G1OovjED1eMBxgk70Q4byB3ZBIb6oQoOPyPFyowE+ertZIqYtZcKpV8QL2IQWdh4u/ToWORA6TR4aXmoywkXhTgPUUCodCHfXjmKLABkMUj+lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422327; c=relaxed/simple;
	bh=uD6JtYU/igxxLDKc6TINndh6iTF6GczGXcF0uArH84E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TM9pgUJM1wc1qsOKkxNvThyHDwa3AOnlMpIpuRX8HVStWFwjWHy729Eo5+yK0U8K1Khw3diP0EWmYQzQerC6oy5QAb4nDCQZtzp6nrLtIaSRkxOQFqCZ6TcR9rbF/Hem/zAAX6uvu0dzA78L8v+zseCRVDpSAORUwCaMQoknfVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/berVpg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/berVpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881DB1F00A3A;
	Thu, 30 Jul 2026 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785422326;
	bh=R0SY6WtUf5LdAt8KtbXPAeRYOI7YDuTl4nXXiAoA+m0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E/berVpgQog5J1hcOd0XKQJa82hnS3cdDBSgFAdyebMXCgEYSIVVIaLszTQ62bZ+Z
	 Tl1fhqSbu3+sBdsR9wYFrrcSPB6l10iA0trot7eUQL7lKYQYVVH40Bnb48Xp7QtRwB
	 HyG+GF6xX2/Ei8Hc8AU1eFTRZXKN6u/vil44lQhkdyd6wJ/5bMvpEnO9TnE8dHrpSM
	 TaIPbYbOW//e7Rr/IrVBXN/B/aF4CDTqGjro7WzRkEtGSo87JgAdOS8Ggd9EdA6gvQ
	 yf45McdUSbIL+jthUjScFBVC5Q8RAsyC6sNEBQWUOj/Rdj3ydihMex1MA3R3Ybv7kq
	 ezdfuUjmCIfzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260730-topic-usb4phy-v3-3-ccf0f7ea98b5@oss.qualcomm.com>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-3-ccf0f7ea98b5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:38:45 +0000
Message-Id: <20260730143845.881DB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [High] Unconditional NULL pointer dereference of pcs_aon in qmp_combo_com=
_init() when configuring USB4 mode.
- [High] Double initialization of the USB PHY hardware registers in qmp_com=
bo_usb4_init().
- [High] Type-C mux events are completely lost if the PHY is uninitialized,=
 leading to incorrect hardware configuration.
- [Medium] Resource leak of p2rr2p_pipe_clk on error paths in qmp_combo_usb=
4_init().
- [Medium] Data race due to unlocked access to qmpphy_mode and orientation =
in qmp_combo_typec_switch_set().

Pre-existing issues:
- [High] Missing lock in qmp_combo_typec_mux_set() causes race conditions w=
ith concurrent PHY initializations.
- [High] Error paths in qmp_combo_com_init() unconditionally decrement init=
_count, leading to underflow when force=3Dtrue.
- [High] The return value of qmp_combo_com_init() is ignored during PHY rec=
onfiguration.
--

--- Patch [3]: [PATCH v3 3/5] phy: qualcomm: qmp-combo: Add preliminary USB=
4 support ---
commit 77ccc077f3b20bfda2985ec877acdf62ac837b2f
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

phy: qualcomm: qmp-combo: Add preliminary USB4 support

Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
a flavor called USB43DP, which as the name implies, features USB4, USB3
and DP signal processing capabilities. This commit adds a new struct phy
to expose the USB4 mode, along with a .set_mode callback to allow
toggling between USB4 and TBT3 submodes.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index cdcfad2e86b1d..b80eac9d71401 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[ ... ]

> @@ -3661,14 +3691,26 @@ static int qmp_combo_com_init(struct qmp_combo *q=
mp, bool force)
>  {
>  	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> +	u32 dp_reset_val =3D SW_DPPHY_RESET_MUX | SW_DPPHY_RESET;
>  	void __iomem *com =3D qmp->com;
>  	void __iomem *pcs_aon =3D qmp->pcs_aon;
> +	void __iomem *pcs =3D qmp->pcs;
>  	int ret;
>  	u32 val;
> =20
>  	if (!force && qmp->init_count++)
>  		return 0;

[Severity: High]
This is a pre-existing issue, but does calling qmp_combo_com_init(qmp, true)
cause an underflow on error paths?

When force=3Dtrue, the function skips qmp->init_count++, but if regulators =
or
clocks fail to enable, it jumps to err_decrement_count and unconditionally
executes qmp->init_count--.

> =20
> +	if (qmp->qmpphy_mode =3D=3D QMPPHY_MODE_USB4) {
> +		pcs =3D qmp->usb4_pcs;
> +
> +		qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);

[Severity: High]
Does this unconditionally dereference pcs_aon?=20

Other parts of the driver explicitly check if (pcs_aon) before accessing US=
B4
clamp registers, suggesting this register block is optional and could be NU=
LL.

[ ... ]

> @@ -3993,6 +4100,119 @@ static int qmp_combo_usb_set_mode(struct phy *phy=
, enum phy_mode mode, int submo
>  	return 0;
>  }
> =20
> +static int qmp_combo_reconfigure_phy(struct qmp_combo *qmp, enum qmpphy_=
mode new_mode)
> +{
> +	dev_dbg(qmp->dev, "qmp_combo_reconfigure_phy: switching from qmpphy mod=
e %d to %d\n",
> +		qmp->qmpphy_mode, new_mode);
> +
> +	if (qmp->usb_init_count || qmp->usb4phy_init_count)
> +		qmp_combo_usb_power_off(qmp->usb_phy);
> +
> +	if (qmp->dp_init_count)
> +		writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL=
);
> +
> +	qmp_combo_com_exit(qmp, true);
> +
> +	qmp->qmpphy_mode =3D new_mode;
> +
> +	/* Now everything's powered down, power up the right PHYs */
> +	qmp_combo_com_init(qmp, true);

[Severity: High]
This is a pre-existing issue, but is it safe to ignore the return value of
qmp_combo_com_init() here?=20

If it fails (e.g., failed clock enable), the subsequent call to
qmp_combo_usb_power_on() executes hardware register writes which might caus=
e a
synchronous external abort.

> +
> +	if ((qmp->usb_init_count || qmp->usb4phy_init_count) &&
> +	    new_mode !=3D QMPPHY_MODE_DP_ONLY)
> +		qmp_combo_usb_power_on(qmp->usb_phy);
> +
> +	if ((new_mode =3D=3D QMPPHY_MODE_USB3DP || new_mode =3D=3D QMPPHY_MODE_=
DP_ONLY) &&
> +	    qmp->dp_init_count)
> +		qmp->cfg->dp_aux_init(qmp);
> +
> +	return 0;
> +}
> +
> +static int qmp_combo_usb4_init(struct phy *phy)
> +{
> +	struct qmp_combo *qmp =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	guard(mutex)(&qmp->phy_mutex);
> +
> +	if (!qmp->p2rr2p_pipe_clk) {
> +		dev_err(qmp->dev, "missing p2rr2p_pipe clock handle. Update your Devic=
e Tree.\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D clk_prepare_enable(qmp->p2rr2p_pipe_clk);
> +	if (ret) {
> +		dev_err(qmp->dev, "p2rr2p_pipe enable failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D qmp_combo_com_init(qmp, false);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does this leak the p2rr2p_pipe_clk reference?

If qmp_combo_com_init() or subsequent initialization steps fail, this retur=
ns
directly without calling clk_disable_unprepare().

> +
> +	/* USB4 mode takes precedence to USB3(+DP), force reconfigure the PHY */
> +	ret =3D qmp_combo_reconfigure_phy(qmp, QMPPHY_MODE_USB4);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D qmp_combo_usb_power_on(phy);

[Severity: High]
Can this cause a double initialization of the USB PHY hardware registers?

If the USB PHY was previously initialized, qmp_combo_reconfigure_phy()
implicitly calls qmp_combo_usb_power_on(qmp->usb_phy). Then this code
immediately calls qmp_combo_usb_power_on(phy) a second time, which might le=
ad
to hardware state machine lockups or polling timeouts.

[ ... ]

> @@ -4429,24 +4662,29 @@ static int qmp_combo_typec_switch_set(struct type=
c_switch_dev *sw,
>  	struct qmp_combo *qmp =3D typec_switch_get_drvdata(sw);
>  	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> =20
> +	if (qmp->qmpphy_mode =3D=3D QMPPHY_MODE_USB4) {
> +		/* QMPPHY has no orientation handling in USB4 mode, don't cache the se=
tting */
> +		qmp->orientation =3D TYPEC_ORIENTATION_NONE;
> +		return 0;
> +	}

[Severity: Medium]
Can this result in a data race on qmp->qmpphy_mode and qmp->orientation?

This reads qmp->qmpphy_mode and modifies qmp->orientation before acquiring =
the
mutex guard, while other routines like qmp_combo_reconfigure_phy() modify t=
hese
fields concurrently under the lock.

> +
>  	if (orientation =3D=3D qmp->orientation || orientation =3D=3D TYPEC_ORI=
ENTATION_NONE)
>  		return 0;
> =20
> -	mutex_lock(&qmp->phy_mutex);
> +	guard(mutex)(&qmp->phy_mutex);

[ ... ]

> @@ -4497,41 +4757,11 @@ static int qmp_combo_typec_mux_set(struct typec_m=
ux_dev *mux, struct typec_mux_s
>  		return 0;
>  	}
> =20
> -	dev_dbg(qmp->dev, "typec_mux_set: switching from qmpphy mode %d to %d\n=
",
> -		qmp->qmpphy_mode, new_mode);
> -
> -	qmp->qmpphy_mode =3D new_mode;
> -
> -	if (qmp->init_count) {
> -		if (qmp->usb_init_count)
> -			qmp_combo_usb_power_off(qmp->usb_phy);

[ ... ]

> +	/* The mux still receives Type-C events, even if all PHYs are uninitial=
ized */
> +	if (!qmp->init_count)
> +		return 0;

[Severity: High]
Will Type-C mux events be completely lost if the PHY is uninitialized?

Previously, the incoming new_mode was unconditionally cached in qmp->qmpphy=
_mode
regardless of init_count. Now that the state save is buried inside
qmp_combo_reconfigure_phy(), returning early here means the requested mode
is lost if the PHY hasn't initialized yet.

> =20
> -	return 0;
> +	return qmp_combo_reconfigure_phy(qmp, new_mode);

[Severity: High]
This is a pre-existing issue, but is qmp_combo_typec_mux_set() missing a lo=
ck
to prevent race conditions?

This executes without holding qmp->phy_mutex and calls
qmp_combo_reconfigure_phy() which manipulates hardware registers. Concurren=
tly,
qmp_combo_usb_init() or qmp_combo_usb4_init() can execute from other paths =
that
do hold the lock, potentially clobbering the same registers.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-topic-usb4=
phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com?part=3D3
