Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A3A2E1C4E
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 22:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780958013; cv=none; b=LWvlzQO5jUwWOj4wp6Zpm6INi7ZkJv0tpqJ6MorLHgTIATieYr/alEI+wvJ2/O7NMFChHr9zGvXfYUdjhCpaqgIuYyZ7aDllhOMtCeK42cf2ougmgJFw4LF7WYwKtuI1roiYWiZE1ZnrWwrqQeTE9CmxVFK7i9ahorX7qglYExQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780958013; c=relaxed/simple;
	bh=WSFpRUdtK/nGZodljlgxuhfomsJw2XcCCDMQ1AeJDG4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VUetB6dtzORcqUXBvynEHxs3zDBcXMB2WS+ferMVXxjf/+7NE9yt2OINk95Ve/UZvQhlke711kxSSagWX22vD8tG4Ay/PNEorKJ7o1xC3YiSNsOqjhvxD8XiSXVi9nRkg51XHWxUl6BH7M+ylHOEHZxZR9tNeb+Khgn2ZPkE1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USkvQmUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USkvQmUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C631F00893;
	Mon,  8 Jun 2026 22:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958012;
	bh=CBnYEmX3cL5npu2upqCwanE/jFjwxDZHsXtO0GgsyfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=USkvQmUCX8fVZYCzngOzWhHuE0jwscf3e8oYJ25eI6Tknw8M3G5hBdcCj1HYAyR9u
	 jmOfPykOBSNL6qLCU4qNWUn5Uiu6prrixrKqJm5xSmn85xWYmtw3LrEq+OZXYDBABJ
	 AUMwKpX6bew4gh6YVaVIMhQAjHQYxRKTzhECtntXOTYKdVVRYB5KofBepxnUPeR3cN
	 wn+NF+UO86x1e8Bqs/Lb+rqLOdIBx6Rgjm1Y8gOGaJxC7bL7fC/xBSrYIJSHgZuPF/
	 ns9qGiAa5YromKjlLdD1QF4fFWaWJ802PfR+XkqgR1MygWJcOgeM9b/aWVaeqXj7jC
	 GdpyzHxpVWTgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 phy-next 15/16] phy: lynx-10g: new driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260608221710.1572971-16-vladimir.oltean@nxp.com>
References: <20260608221710.1572971-16-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 22:33:31 +0000
Message-Id: <20260608223331.B4C631F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver incorrectly uses 0 as a sentinel value in `lane->defaul=
t_pccr[mode]`, treating a valid backed-up PCCR configuration of 0 as uninit=
ialized data and unintentionally falling back to a hardcoded PCS muxing con=
figuration.
--

commit 0fcab57e2d19361e4720b40d6690e12c5a5bfd0b
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

phy: lynx-10g: new driver

Introduce a driver for the networking lanes of the 10G Lynx SerDes
block, present on the majority of Layerscape and QorIQ (Freescale/NXP)
SoCs. It provides the generic PHY framework to allow network MACs to
reconfigure the SerDes for different link modes based on connected modules.

> diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g.c b/drivers/phy/frees=
cale/phy-fsl-lynx-10g.c
> new file mode 100644
> index 0000000000000..7dd5d94b51cf2
> --- /dev/null
> +++ b/drivers/phy/freescale/phy-fsl-lynx-10g.c
> @@ -0,0 +1,1278 @@
[ ... ]
> +static void lynx_10g_backup_pccr_val(struct lynx_lane *lane)
> +{
> +	u32 val;
> +	int err;
> +
> +	if (lane->mode =3D=3D LANE_MODE_UNKNOWN)
> +		return;
> +
> +	err =3D lynx_pccr_read(lane, lane->mode, &val);
> +	if (err) {
> +		dev_warn(&lane->phy->dev,
> +			 "The driver doesn't know how to access the PCCR for lane mode %s\n",
> +			 lynx_lane_mode_str(lane->mode));
> +		lane->mode =3D LANE_MODE_UNKNOWN;
> +		return;
> +	}
> +
> +	lane->default_pccr[lane->mode] =3D val;
> +
> +	switch (lane->mode) {
> +	case LANE_MODE_1000BASEX_SGMII:
> +	case LANE_MODE_2500BASEX:
> +		lane->default_pccr[LANE_MODE_1000BASEX_SGMII] =3D val & ~PCCR8_SGMIIa_=
KX;
> +		lane->default_pccr[LANE_MODE_2500BASEX] =3D val & ~PCCR8_SGMIIa_KX;
> +		break;
> +	default:
> +		break;
> +	}
> +}

[Severity: High]
Since the PCCR8_SGMIIa_KX bit is explicitly cleared here, could this result=
 in
a backed-up value of exactly 0 if no other configuration bits were original=
ly
set?

[ ... ]
> +static int lynx_10g_lane_enable_pcvt(struct lynx_lane *lane,
> +				     enum lynx_lane_mode mode)
> +{
> +	struct lynx_priv *priv =3D lane->priv;
> +	u32 val;
> +	int err;
> +
> +	spin_lock(&priv->pcc_lock);
> +
> +	switch (mode) {
> +	case LANE_MODE_1000BASEX_SGMII:
> +	case LANE_MODE_2500BASEX:
> +		err =3D lynx_pcvt_rmw(lane, mode, CR(1), SGMIIaCR1_SGPCS_EN,
> +				    SGMIIaCR1_SGPCS_EN);
> +		if (err)
> +			goto out;
> +
> +		lynx_pcvt_rmw(lane, mode, CR(0), SGMIIaCR0_RST_SGM_OFF,
> +			      SGMIIaCR0_RST_SGM | SGMIIaCR0_PD_SGM);
> +		break;
> +	case LANE_MODE_QSGMII:
> +		err =3D lynx_pcvt_rmw(lane, mode, CR(0), QSGMIIaCR0_RST_QSGM_OFF,
> +				    QSGMIIaCR0_RST_QSGM | QSGMIIaCR0_PD_QSGM);
> +		if (err)
> +			goto out;
> +		break;
> +	default:
> +		err =3D 0;
> +	}
> +
> +	if (lane->default_pccr[mode]) {
> +		err =3D lynx_pccr_write(lane, mode, lane->default_pccr[mode]);
> +		goto out;
> +	}

[Severity: High]
If the valid backed-up PCCR configuration is 0, will this condition evaluate
to false and skip the restoration?

It seems a configuration value of 0 is a valid state for the PCCR register,
but this check relies on 0 as a sentinel value for uninitialized data. Could
this inadvertently cause the driver to apply the hardcoded default values
below, breaking the initial muxing configured by the RCW?

> +
> +	val =3D 0;
> +
> +	switch (mode) {
> +	case LANE_MODE_1000BASEX_SGMII:
> +	case LANE_MODE_2500BASEX:
> +		val |=3D PCCR8_SGMIIa_CFG;
> +		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608221710.1572=
971-1-vladimir.oltean@nxp.com?part=3D15
