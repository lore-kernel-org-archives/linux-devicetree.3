Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437592FFF89
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779992432; cv=none; b=uREKaOOxxrZxvWYXXiVBGnW3olT0tsBIU4qRKiW0gmJX+Psre4gzv52rwTG/GfsA9Co0hskaGUom3rqnwjiI3W0EnFzwSnnjo+ixbKj4APrSxpEkkkyYTvXzl26Mt5LlBpYx7oNsFVEuFxuKNktbp3pa4JGpaEUlcSiPgTvXnrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779992432; c=relaxed/simple;
	bh=HfKku8ZdR6JioSrnW5KKuB9AahHisg8n/zK3CWpO2pU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rlmjdw6e19//D4RMMIwW73RLZtadclYQWyXoqu8jKqmLi2Tk3gwGmjwalgn06v5ZBOvvho7W1vJBKi87Rl4AHXYuOf0rAIMhqNbSSFgrLDfd9OwhEPgLKEDT0bi8Rj0G1HNQhZ5MWpn13Dh5RHgg2KFNwZ0jT8sxT9C+/58OAJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAOLFjCB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAOLFjCB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9027B1F000E9;
	Thu, 28 May 2026 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779992430;
	bh=SJf/x/OprtiH6bPc++4l47ue+aXN4DtskNQbofxg1ng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gAOLFjCB37g0FqHm9X0g5WpqPCDyU4LQt0e0rU/+btIsNTFzHWJLiZF01oV2f4/HH
	 q2L0UPdPmBFa2xvXvIhjHEctvmhFRPXhQiTw1JbsD6QlgtEHIaj38s5QLZEWlGDwAI
	 NkkLueMlUCV7rnaLVBa8sAsWVaInmlYVIf925+t99GTlQJ7tTEqq1CBv8MTvkUWoZ6
	 qemnx+6XhkeM+BV1jPiAIsfHbKaOM1AAf0SOGZY+lEoc7AUQqbeo44CEDDKpKV2d82
	 Icn1XsdieDfAYPBuDS4NHPWFOEphHMyUgFPYvOtVcowy1BG6gFv3+hjZist5T1OTXc
	 D+pwarSWNgxLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH phy-next 12/13] phy: lynx-10g: new driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528172404.733196-13-vladimir.oltean@nxp.com>
References: <20260528172404.733196-13-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 18:20:29 +0000
Message-Id: <20260528182030.9027B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Lockless read-modify-write operations on the LNaGCR0 register crea=
te a data race between asynchronous CDR lock checks and PHY configuration.
- [Medium] The return value of lynx_10g_lane_enable_pcvt() is discarded whe=
n called inside WARN_ON(), masking hardware configuration failures.
- [Medium] The return value of lynx_pcvt_rmw() for the CR(0) register is co=
mpletely ignored, masking potential hardware failures.
- [Medium] lynx_10g_validate() incorrectly permits transitions from LANE_MO=
DE_UNKNOWN, which are later rejected by lynx_10g_set_mode().

Pre-existing issues:
- [Critical] The delayed work priv->cdr_check may unconditionally re-arm it=
self, leading to a Use-After-Free upon device unbind or module removal.
--

commit 8617183053a524e1cbc4453e0e8f8e478c4cf8ef
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

phy: lynx-10g: new driver

Introduce a driver for the networking lanes of the 10G Lynx SerDes
block, present on the majority of Layerscape and QorIQ (Freescale/NXP)
SoCs. The consumers use the Generic PHY framework to reconfigure the SerDes
for requested link modes.

> diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g.c b/drivers/phy/frees=
cale/phy-fsl-lynx-10g.c
> new file mode 100644
> index 0000000000000..28b0823574684
> --- /dev/null
> +++ b/drivers/phy/freescale/phy-fsl-lynx-10g.c
> @@ -0,0 +1,1319 @@

[ ... ]

> +static void lynx_10g_cdr_lock_check(struct lynx_lane *lane)
> +{
> +	u32 tcsr3 =3D lynx_lane_read(lane, LNaTCSR3);
> +
> +	if (tcsr3 & LNaTCSR3_CDR_LCK)
> +		return;
> +
> +	dev_dbg(&lane->phy->dev,
> +		"Lane %c CDR unlocked, resetting receiver...\n",
> +		'A' + lane->id);
> +
> +	lynx_lane_rmw(lane, LNaGCR0, LNaGCR0_RRST_ON, LNaGCR0_RRST);

[Severity: High]
Can concurrent modifications to the LNaGCR0 register corrupt its state?

Since the priv->cdr_check work runs asynchronously, it could call
lynx_10g_cdr_lock_check() and modify LNaGCR0 at the same time the PHY
framework calls phy_power_on(), phy_power_off(), or phy_set_mode(). These
functions also read-modify-write LNaGCR0 without per-lane locking,
potentially dropping reset or power-down bits.

[ ... ]

> +static const struct lynx_info lynx_info_ls1028a =3D {
> +	.get_pccr =3D ls1028a_get_pccr,
> +	.get_pcvt_offset =3D ls1028a_get_pcvt_offset,
> +	.pll_read_configuration =3D lynx_10g_pll_read_configuration,
> +	.lane_read_configuration =3D lynx_10g_lane_read_configuration,
> +	.cdr_lock_check =3D lynx_10g_cdr_lock_check,

[Severity: Critical]
This is a pre-existing issue, but can the delayed work priv->cdr_check cause
a use-after-free upon module removal?

If lynx_cdr_lock_check() unconditionally re-arms itself with
queue_delayed_work(), cancel_delayed_work_sync() during remove might wait
for the current execution to finish, only for it to queue itself again.
After device memory is freed, the newly armed timer would fire and access
freed memory.

[ ... ]

> +static int lynx_10g_lane_disable_pcvt(struct lynx_lane *lane,
> +				      enum lynx_lane_mode mode)
> +{
> +	struct lynx_priv *priv =3D lane->priv;
> +	int err;
> +
> +	spin_lock(&priv->pcc_lock);
> +
> +	err =3D lynx_pccr_write(lane, mode, 0);
> +	if (err)
> +		goto out;
> +
> +	switch (mode) {
> +	case LANE_MODE_1000BASEX_SGMII:
> +	case LANE_MODE_2500BASEX:
> +		err =3D lynx_pcvt_rmw(lane, mode, CR(1), SGMIIaCR1_SGPCS_DIS,
> +				    SGMIIaCR1_SGPCS_EN);
> +		if (err)
> +			goto out;
> +
> +		lynx_pcvt_rmw(lane, mode, CR(0),
> +			      SGMIIaCR0_RST_SGM_ON | SGMIIaCR0_PD_SGM,
> +			      SGMIIaCR0_RST_SGM | SGMIIaCR0_PD_SGM);

[Severity: Medium]
Could this mask potential hardware failures?

While the return value of lynx_pcvt_rmw() for the CR(1) register is checked,
the subsequent call for the CR(0) register discards its return value. If the
register access fails, the error would be swallowed here and similarly in
lynx_10g_lane_enable_pcvt().

[ ... ]

> +static int lynx_10g_validate(struct phy *phy, enum phy_mode mode, int su=
bmode,
> +			     union phy_configure_opts *opts)
> +{
> +	struct lynx_lane *lane =3D phy_get_drvdata(phy);
> +	enum lynx_lane_mode lane_mode;
> +
> +	if (mode !=3D PHY_MODE_ETHERNET)
> +		return -EINVAL;
> +
> +	lane_mode =3D phy_interface_to_lane_mode(submode);
> +	if (!lynx_lane_supports_mode(lane, lane_mode))
> +		return -EINVAL;
> +
> +	if (lynx_lane_restrict_fixed_mode_change(lane, lane_mode))
> +		return -EINVAL;
> +
> +	if (lynx_10g_lane_mode_needs_rcw_override(lane, lane_mode))
> +		return -EINVAL;
> +
> +	return 0;
> +}

[Severity: Medium]
Should validate() explicitly reject transitions from LANE_MODE_UNKNOWN?

When a lane is initialized to a non-networking protocol, it defaults to
LANE_MODE_UNKNOWN. This function permits the transition because
lynx_10g_lane_mode_needs_rcw_override() returns false. However, when
lynx_10g_set_mode() subsequently calls lynx_10g_lane_disable_pcvt(),
the underlying get_pccr() function returns -EINVAL for LANE_MODE_UNKNOWN,
causing set_mode() to fail.

[ ... ]

> +static int lynx_10g_set_mode(struct phy *phy, enum phy_mode mode, int su=
bmode)
> +{
> +	struct lynx_lane *lane =3D phy_get_drvdata(phy);
> +	bool powered_up =3D lane->powered_up;
> +	enum lynx_lane_mode lane_mode;
> +	int err;
> +
> +	err =3D lynx_10g_validate(phy, mode, submode, NULL);
> +	if (err)
> +		return err;
> +
> +	lane_mode =3D phy_interface_to_lane_mode(submode);
> +	/* lynx_10g_validate() already made sure the lane_mode is supported */
> +
> +	if (lane_mode =3D=3D lane->mode)
> +		return 0;
> +
> +	/* If the lane is powered up, put the lane into the halt state while
> +	 * the reconfiguration is being done.
> +	 */
> +	if (powered_up)
> +		lynx_10g_lane_halt(phy);
> +
> +	err =3D lynx_10g_lane_disable_pcvt(lane, lane->mode);
> +	if (err)
> +		goto out;
> +
> +	lynx_10g_lane_change_proto_conf(lane, lane_mode);
> +	lynx_10g_lane_remap_pll(lane, lane_mode);
> +	WARN_ON(lynx_10g_lane_enable_pcvt(lane, lane_mode));

[Severity: Medium]
Does WARN_ON() discard the error code returned by lynx_10g_lane_enable_pcvt=
()?

Because WARN_ON() evaluates to a boolean, the actual integer error code is
ignored. If hardware configuration fails, the system might proceed as if
successful, incorrectly update lane->mode, and leave the driver in an
inconsistent state.

> +
> +	lane->mode =3D lane_mode;
> +
> +out:
> +	if (powered_up)
> +		lynx_10g_lane_reset(phy);
> +
> +	return err;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528172404.7331=
96-1-vladimir.oltean@nxp.com?part=3D12
