Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D40318BA6
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 18:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780078879; cv=none; b=UUu18NmthKtv5odmUbiuRBoXD5Kc5EvTGPmWQ7mdzMpKR6fn/JNtuUcWH+uYhH6T7d7sFkUkWjo8YPB3OdLbOuTgXFdclrLfk7S8KlC2s8lxxCfqX1nL0JLdrb2ntD0gE2D/yrCEnG6jQ1uM6MTlXx0ypuRC/cPNpQwBhAxu49g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780078879; c=relaxed/simple;
	bh=I96NCFOJVWNwqBltV022jffEvkOwTtZBtO0vftPJUkE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mqE/+WolRzWeJ/Iqk1Sj9Ir9YzzdGZBJXLUTkOiekpxNrMAJfr+CXTgDRYC5CQ0MJWi4WN9U+FhmJg/ptYZjo3r2fAE5dbbyCb1Eyb2phUZm5v3S8nk7P7M6JzHQBThL3Ted3iXZDWOGJcvsqeXpwIk98DhmPFVzs7cp38k0DMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hF5xbDl/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hF5xbDl/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007AC1F00893;
	Fri, 29 May 2026 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780078878;
	bh=7L4Nefg1MpJZXVjG9kFg5PWnu/7Y78YZ+KrJSEOcupk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hF5xbDl/21VvZ3i7SSIRLqLLtiAeRs0rDpj+RVxDGudhgNM6elubTG/iHFTkmbxjQ
	 VY0BoEjpWrGUfUW4/9pl3h0rr/sj2QqDkTVoySUllWwj8ajLiE+U8C4BJ0NGHWrYc6
	 5zE1WFUVK5b/Bo6i1S5ZF8LAJrPBGrNjDG1wQ7ukFgpibfSmNxSAmGXD9LYDEdOV59
	 hW5Ji30uJH9W1H04iQNHvzRB2CLO4XxviAEYaMC1rmSJoDGY+3oR46oeAFceg8Cdbo
	 soAuo5jVSlqspdOIcNuuPujAOa2JfLY/Q1qXZqBQrxD282O2Gd0zkf/5V0jKqB11u7
	 lpNCbfceLZtvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 phy-next 14/15] phy: lynx-10g: new driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, olteanv@gmail.com
In-Reply-To: <20260529171509.1163787-15-vladimir.oltean@nxp.com>
References: <20260529171509.1163787-15-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 18:21:17 +0000
Message-Id: <20260529182118.007AC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Incorrect restoration of the PCCR mux configuration because `0` is=
 treated as uninitialized.
- [High] Potential timing violation when bringing lanes out of reset and po=
wer down simultaneously.

Pre-existing issues:
- [High] lynx_xlate can return a NULL pointer for unprobed PHY lanes, leadi=
ng to a NULL pointer dereference in the PHY core framework.
--

commit 851e6824db7b03958722b9808f3549609168de99
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

phy: lynx-10g: new driver
   =20
Introduce a driver for the networking lanes of the 10G Lynx SerDes
block, present on the majority of Layerscape and QorIQ (Freescale/NXP)
SoCs.

> diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g.c b/drivers/phy/frees=
cale/phy-fsl-lynx-10g.c
> index 0000000000000..9b04d6a4b825a
> --- /dev/null
> +++ b/drivers/phy/freescale/phy-fsl-lynx-10g.c
[ ... ]
> +static int lynx_10g_lane_enable_pcvt(struct lynx_lane *lane,
> +				     enum lynx_lane_mode mode)
> +{
> +	struct lynx_priv *priv =3D lane->priv;
> +	u32 val;
> +	int err;
> +
> +	spin_lock(&priv->pcc_lock);
[ ... ]
> +	if (lane->default_pccr[mode]) {
[Severity: High]
Can this condition incorrectly fall through to hardcoded defaults if a valid
mux configuration of 0 is backed up?

Since default_pccr is zero-initialized by devm_kcalloc(), a backed-up value
of 0 evaluates to false. This skips the restoration and allows the driver to
apply hardcoded defaults later, which could permanently reroute the hardware
lanes and break the network interface.

> +		err =3D lynx_pccr_write(lane, mode, lane->default_pccr[mode]);
> +		goto out;
> +	}
> +
> +	val =3D 0;
[ ... ]
> +static int lynx_10g_power_on(struct phy *phy)
> +{
> +	struct lynx_lane *lane =3D phy_get_drvdata(phy);
> +
> +	if (lane->powered_up)
> +		return 0;
> +
> +	/* The RM says to wait for at least 120ns between per lane setting have
> +	 * been changed and the lane being taken out of reset
> +	 */
> +	usleep_range(1, 2);
> +
> +	lynx_lane_rmw(lane, LNaGCR0, LNaGCR0_RRST_OFF | LNaGCR0_TRST_OFF,
> +		      LNaGCR0_RRST | LNaGCR0_TRST |
> +		      LNaGCR0_RX_PD | LNaGCR0_TX_PD);
[Severity: High]
Does this code violate typical PHY hardware sequencing by clearing both the
power-down bits and digital reset bits simultaneously?

Releasing the digital reset at the same time as activating the analog
components doesn't leave time for the analog circuitry to stabilize. The
prior usleep_range() occurs before power-up is initiated, which might not
prevent hardware lockups or unreliable behavior on link up.

> +
> +	lane->powered_up =3D true;
> +
> +	return 0;
> +}
[ ... ]
> +static int lynx_10g_probe(struct platform_device *pdev)
> +{
> +	return lynx_probe(pdev, of_device_get_match_data(&pdev->dev),
> +			  &lynx_10g_ops);
> +}
[Severity: High]
This is a pre-existing issue, but does the core PHY framework crash if
lynx_xlate() returns a NULL pointer for an unprobed PHY lane?

If a PHY lane is requested via device tree but the driver did not probe it,
priv->lane[idx].phy will be NULL. If lynx_xlate() returns this NULL pointer,
the core PHY framework interprets it as a successful retrieval of an option=
al
PHY and might attempt to dereference it. Would it be safer to explicitly
return ERR_PTR(-ENODEV) in lynx_xlate() when the phy pointer is NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529171509.1163=
787-1-vladimir.oltean@nxp.com?part=3D14
