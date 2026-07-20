Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9A8248F57
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556182; cv=none; b=kR35hfXBKSC5Lb/MfhE1jqX7bRKlBtHVYsuhxDlotWA5iMYyBS7NJtPv5Lrjie+fOqloJ7tGWY7Fn42Kq9J9Srzd9DRKEjC7oOZfNWgXj28umwgdkvTfemtYxfVgzivnoFBV9Oib1S3/IBiIcl3M6hMoUexSnNc4yfpIt+FDPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556182; c=relaxed/simple;
	bh=wy4/FM2u53+EWmLwYLSsf3e9ZOiNshqhCPq2dGA+2tQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ERtVo1PRBM/uO7oqSuxyK7couGW8IsdwegLXhlRt3rcKesy+QH3vlgPl5k1LB4vrtlwsNUcQ6sISojIziJlR3j4cTd2B+UGRYbzs6rSsIcHbpt6NXaPm4BOoVAX4cIV8e3Zot66hR9cTVbT9PFN9X+TZa4fubOoSA4TQElCYVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6J3iN+2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6J3iN+2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EE91F000E9;
	Mon, 20 Jul 2026 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784556181;
	bh=uDxczAFgtDx8GHVIRwwdNo8oNbF7C9V6n1YBLbwhP3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j6J3iN+2k/9ZOr8tEi7dd6Lf+gyJ32LCFnctGYD/1GqszICWSxBTSrCVHdZhAhAl6
	 LBqdsZSicBSdPXi5TDZhxq/Pfx1QXb6sV6gq8B8Zv1+bAUqInt6bifWJIimaa9Hf76
	 zrjHtpnbjZ2ugovbTA1WhM4AdsLOV5uPtdYHjt+ywoxpiDQaVTzGI4RRmqGwadXyRa
	 1NGZ06up3s2Ew8tKjPdeNxqFoJdwELOKb28IKqFhEMUgAvRZQcTXOTocErV3B99daa
	 oTYJMfE/qPICx1ym+NUz6Nj6GCYkw6xpyekvmqF17RryI0chjbV7aSReR+AgZXED+5
	 zTurtGUN2Iy+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 phy-next 7/8] soc: fsl: guts: implement the RCW
 override procedure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720133642.136324-8-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-8-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:03:00 +0000
Message-Id: <20260720140300.A0EE91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] SerDes block index validation incorrectly uses `>=3D` instead of `=
>`, rejecting the highest valid SerDes index and breaking configuration.
- [High] SoC-specific GENMASK macros execute undefined behavior via negativ=
e shifts when `lane >=3D 4`.
- [High] Bulk RCW override initialization clobbers active configurations on=
 uninitialized lanes.
- [Medium] Non-atomic read-modify-write on shared state causes lost lane in=
itializations.
- [Medium] Extremely short 1 microsecond timeout for hardware register stat=
e reflection causes spurious failures.

Pre-existing issues:
- [High] Dereferencing `soc_dev_attr` on the error path causes a kernel pan=
ic.
--

--- Patch [7]: [PATCH v3 phy-next 7/8] soc: fsl: guts: implement the RCW ov=
erride procedure ---
commit a1f1c62bf1e452bc97a7f348215d8401bd095833
Author: Ioana Ciornei <ioana.ciornei@nxp.com>
soc: fsl: guts: implement the RCW override procedure

This commit adds support for the RCW override procedure to enable runtime
reconfiguration of SerDes lane protocols through the DCFG DCSR space.
It exports functions to notify boot time modes, validate protocol changes,
and execute the RCW procedure on specific SoCs.

> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index b9973ca3a440d..4d49d1b953007 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
[ ... ]
> @@ -210,6 +210,13 @@ static int fsl_guts_rcw_rmw(int offset, u32 val, u32=
 mask)
>  {
>  	u32 rcwcr, rcwsr =3D fsl_guts_read(&soc.dcfg_ccsr->rcwsr[offset]);
> =20
>  	rcwcr =3D rcwsr & ~mask;
>  	rcwcr |=3D val;
>  	fsl_guts_write(&soc.dcfg_dcsr->rcwcr[offset], rcwcr);
> =20
>  	/* Updates to RCWCR should be visible back in RCWSR */
>  	return read_poll_timeout_atomic(fsl_guts_read, rcwsr, rcwsr =3D=3D rcwc=
r,
>  					0, RCW_TIMEOUT_US, false,
>  					&soc.dcfg_ccsr->rcwsr[offset]);
>  }

[Severity: Medium]
Is a 1 microsecond timeout sufficient for cross-domain hardware reflections?

The atomic polling loop strictly uses RCW_TIMEOUT_US set to 1, which might =
be
too brief for the hardware to propagate the state across clock domains. This
could lead to spurious -ETIMEDOUT failures when configuring SerDes lane mod=
es.

[ ... ]
> +static int
> +fsl_guts_serdes_get_rcw_override(int serdes_idx, int lane,
> +				 enum lynx_lane_mode lane_mode,
> +				 struct fsl_soc_serdes_rcw_override *override)
> +{
> +	const struct fsl_soc_data *soc_data =3D soc.data;
> +
> +	if (!soc_data)
> +		return -ENODEV;
> +
> +	if (serdes_idx >=3D soc_data->num_serdes || serdes_idx <=3D 0)
> +		return -ERANGE;

[Severity: High]
Does this bounds check incorrectly reject the highest valid SerDes index?

If soc_data->num_serdes is 2, a client driver attempting to initialize
serdes_idx 2 will trigger this return path because 2 >=3D 2 evaluates to tr=
ue.
Should this use > instead of >=3D to allow configuring the last SerDes bloc=
k?

> +
> +	if (lane >=3D MAX_NUM_LANES || lane < 0)
> +		return -ERANGE;

[Severity: High]
Can this loose bounds check lead to undefined behavior in the SoC-specific
macros?

MAX_NUM_LANES is 8, but macros like LS1088A_RCWSR30_SRDS_PRTCL_S2_LNn
assume a maximum of 4 lanes:

GENMASK(3 + 4 * (3 - (lane)), 4 * (3 - (lane)))

If a PHY driver requests a lane index of 4 or higher on LS1088A, this macro
evaluates to GENMASK(-1, -4), which causes negative bitwise shifts.

[ ... ]
> +int fsl_guts_lane_init(int serdes_idx, int lane, enum lynx_lane_mode lan=
e_mode)
> +{
> +	int err;
> +
> +	err =3D fsl_guts_lane_validate(serdes_idx, lane, lane_mode);
> +	if (err)
> +		return err;
> +
> +	soc.lane_mode[serdes_idx - 1][lane] =3D lane_mode;
> +	soc.lanes_initialized[serdes_idx - 1] |=3D BIT(lane);

[Severity: Medium]
Could concurrent PHY probes cause lost lane initialization status here?

This performs a non-atomic read-modify-write on the shared global state arr=
ay
without holding a lock. If two PHY instances on the same SerDes controller
probe asynchronously, one update to soc.lanes_initialized might overwrite t=
he
other.

[ ... ]
> +static int ls2088a_serdes_init_rcwcr(int serdes_idx)
> +{
> +	int i, err;
> +	u32 reg;
[ ... ]
> +	/* We need to configure the initial state of all lanes for
> +	 * the SerDes block #1
> +	 */
> +	for_each_set_bit(i, &soc.lanes_initialized[serdes_idx - 1], MAX_NUM_LAN=
ES)
> +		if (lynx_lane_mode_uses_xgmii_mac(soc.lane_mode[serdes_idx - 1][i]))
> +			reg |=3D LS2088A_RCWSR30_SRDS_CLK_SEL_XGMII_Ln_S1(i);
> +
> +	err =3D fsl_guts_rcw_rmw(29, reg,
> +			       LS2088A_RCWSR30_SRDS_CLK_EN_SEL_XGMII_S1 |
> +			       LS2088A_RCWSR30_SRDS_CLK_SEL_MSK);

[Severity: High]
Does this bulk RCW override initialization clobber active configurations on
uninitialized lanes?

If a client driver for lane A calls fsl_guts_lane_set_mode() before sibling
lane B has initialized, this read-modify-write uses a mask spanning all
lanes (LS2088A_RCWSR30_SRDS_CLK_SEL_MSK). This forcefully writes zeroes
to lane B's configuration because it relies purely on the software state
in soc.lanes_initialized, potentially discarding its bootloader-configured
active state.

[ ... ]
>  static int __init fsl_guts_init(void)
>  {
>  	struct soc_device_attribute *soc_dev_attr =3D NULL;
[ ... ]
>  err_nomem:
>  	ret =3D -ENOMEM;
>  err:
>  	kfree(soc_dev_attr->family);
>  	kfree(soc_dev_attr->soc_id);
>  	kfree(soc_dev_attr->revision);
>  	kfree(soc_dev_attr->serial_number);
>  	kfree(soc_dev_attr);

[Severity: High]
This is a pre-existing issue, but can dereferencing soc_dev_attr here cause
a kernel panic on the error path?

If earlier initialization steps fail, such as of_iomap() failing and jumping
to err_nomem before soc_dev_attr is allocated, soc_dev_attr will remain NUL=
L.
The unconditional access to member variables like soc_dev_attr->family will
result in a NULL pointer dereference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133642.1363=
24-1-vladimir.oltean@nxp.com?part=3D7
