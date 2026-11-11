Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367430;
	b=woqnWUfMxxF9Xg410ShRYHY3HJd4cqqdzMwA5NpRF3tMiicjYiCZv35vY2sSvCIuzLT0
	 8uw+BodkknYXdDUkwrvLd+3dMTl1eWKEOSJyLdYLWOjIQmE0osdg6VsukvZkniH4TSdgi
	 c4mbGFeAgjL1rqec07JCnbSxipTPU6HffJ+Is4/6zY1YGBexe2fXUIKiJwROdAaENb2Vq
	 XFAs5KY6mHG0jhi8Bt8zcTPfrPrmIMg1O9oq2/ti9c0IiNIT6gf9nnadjacYazQvPAIQ4
	 27tbGZcN4o7Z9zJT2LrpxeO42s5Gymt5Rkl2DxRIEXs3b9d8ZsXPs2I8r1gflNhVUXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367430;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xumurdd4HtUcLCD6tq9tHmWt2J8OTnMTrO2HIFiLp+A=;
	b=JOJEUcj4DZHHp5ZkPhhgxURlsuJs++9NDbWyj0RACIuakWykucoTtAmYKUUmtJmH868v
	 tIlRtm10HC1YWGXeGYwYfnwudHfSCVeMXrxZtnyd3d+w1crKzRF7N+FR3mfLi6zb3fA3I
	 qC71n5v0sDNc1r41d4qUWIzdrWU9TgJbVvClsDdfyXqKAY/JrLZJF3/MP5nNW1S0LtOK0
	 4OqWBnfPmGuBELjlVb2iMdaLXpB9nnkXjocsf6wOG9dmlj4UiQNC0ErvUuymK7yarP8B1
	 FS5qRe/6Ac3k1WWGi2dHCikWHW37egWpBt2MVdgO4dfNcLchDrsSxey1YtntP2ooVGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OsuUMHG0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF44606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OsuUMHG0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E5F1F0089F;
	Wed, 11 Nov 2026 03:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367430;
	bh=xumurdd4HtUcLCD6tq9tHmWt2J8OTnMTrO2HIFiLp+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OsuUMHG0cFVUEE54ccOGHd9e0bNID+XM+tYoxMwwRwhd8OZYGRgF+4xUZFpmGki6g
	 tnCYsAvqQdo2G3pZfsG0TaoihUfjRRi+TH9YsARnSHc0McUqlR0oc+lLlvYcbwXMxI
	 mhMSDFz4h2r0nZsrnX19EGpyCmHwOpkpgIH3f4B8A951RGDPQszA+lm839QJtip9n9
	 EcI2nYuVX079GfLv4RWejzwVyNxwxsGhHkbYvdOsBsmZNSt4b71/WXtn+8r2/yVVQy
	 BctMbAoQjJszKy4eONxg7VwLUfFc8GqCZUfxBlfvfNM5fwfj6BvNznwrGNbxmRKZPW
	 XzfB36YHGGRYw==
Message-ID: <sashiko-outbox-208179@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] phy: cix: Add CIX Sky1 USB3 PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261111030937.2954646-3-hongliang.yang@cixtech.com>
References: <20261111030937.2954646-1-hongliang.yang@cixtech.com>
 <20261111030937.2954646-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:23:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] phy: cix: redundant locking, refcounting, and wrappers in
  phy-cix-usb3.c
- [Low] phy: cix: unused 4-lane and non-0803 register macros in
  phy-cix-usb3.h
--

commit 3b4a169b7338f7dde4e66109a72c7946bef8ea14
Author: Hongliang Yang <hongliang.yang@cixtech.com>

phy: cix: Add CIX Sky1 USB3 PHY driver

This commit adds a driver for the Cadence SD0803 USB3 PHY integrated in
the CIX Sky1 SoC.

> diff --git a/drivers/phy/cix/phy-cix-usb3.c b/drivers/phy/cix/phy-cix-usb=
3.c
> new file mode 100644
> index 0000000000000..c6376f787af03
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usb3.c

[ ... ]

> +struct cix_u3phy {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct regmap *phy_regmap;
> +	struct reset_control *preset;
> +	struct reset_control *reset;
> +	struct clk *apb_clk;
> +	struct clk *ref_clk;
> +	struct mutex mutex; /* mutex to protect access to individual PHYs */
> +	bool init;
> +	int init_count;
> +	const struct cix_u3phy_cfg *cfg;
> +};
> +
> +static int sky1_u3phy_exit(struct cix_u3phy *u3phy)
> +{
> +	if (WARN_ON(!u3phy->init_count))
> +		return -EINVAL;
> +
> +	u3phy->init_count--;
> +	if (u3phy->init && u3phy->init_count =3D=3D 0) {
> +		reset_control_assert(u3phy->reset);
> +		reset_control_assert(u3phy->preset);
> +		clk_disable_unprepare(u3phy->ref_clk);
> +		clk_disable_unprepare(u3phy->apb_clk);
> +		u3phy->init =3D false;
> +	}
> +	return 0;
> +}
> +
> +static int sky1_u3phy_init(struct cix_u3phy *u3phy)
> +{
> +	int ret;
> +
> +	if (!u3phy->init) {
> +		/* usb rcsu reset is default deassert */
> +		reset_control_assert(u3phy->reset);
> +		reset_control_assert(u3phy->preset);
> +		ret =3D clk_prepare_enable(u3phy->apb_clk);
> +		if (ret) {
> +			dev_err(u3phy->dev, "Failed to prepare_enable u3phy apb clock\n");
> +			return ret;
> +		}
> +		ret =3D clk_prepare_enable(u3phy->ref_clk);
> +		if (ret) {
> +			dev_err(u3phy->dev, "Failed to prepare_enable u3phy ref clock\n");
> +			goto disable_apb_clk;
> +		}
> +		reset_control_deassert(u3phy->preset);
> +		ret =3D regmap_multi_reg_write(u3phy->phy_regmap, sky1_u3phy_conf,
> +					     ARRAY_SIZE(sky1_u3phy_conf));
> +		if (ret) {
> +			dev_err(u3phy->dev, "Failed to write the reg sequence\n");
> +			goto assert_reset_preset;
> +		}
> +		u3phy->init =3D true;
> +		reset_control_deassert(u3phy->reset);
> +	}
> +	u3phy->init_count++;
> +	return 0;
> +
> +assert_reset_preset:
> +	reset_control_assert(u3phy->preset);
> +	reset_control_assert(u3phy->reset);
> +	clk_disable_unprepare(u3phy->ref_clk);
> +disable_apb_clk:
> +	clk_disable_unprepare(u3phy->apb_clk);
> +	return ret;
> +}

[ ... ]

> +static int cix_usb3_phy_power_on(struct cix_u3phy *u3phy)
> +{
> +	int ret;
> +	const struct cix_u3phy_cfg *phy_cfgs =3D u3phy->cfg;
> +
> +	if (phy_cfgs->u3phy_init) {
> +		ret =3D phy_cfgs->u3phy_init(u3phy);
> +		if (ret) {
> +			dev_err(u3phy->dev, "failed to init udphy\n");
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int cix_usb3_phy_power_off(struct cix_u3phy *u3phy)
> +{
> +	int ret;
> +	const struct cix_u3phy_cfg *phy_cfgs =3D u3phy->cfg;
> +
> +	if (phy_cfgs->u3phy_exit) {
> +		ret =3D phy_cfgs->u3phy_exit(u3phy);
> +		if (ret) {
> +			dev_err(u3phy->dev, "failed to exit udphy\n");
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int cix_u3phy_init(struct phy *phy)
> +{
> +	struct cix_u3phy *u3phy =3D phy_get_drvdata(phy);
> +	int ret =3D 0;
> +
> +	mutex_lock(&u3phy->mutex);
> +	ret =3D cix_usb3_phy_power_on(u3phy);
> +	mutex_unlock(&u3phy->mutex);
> +	return ret;
> +}
> +
> +static int cix_u3phy_exit(struct phy *phy)
> +{
> +	struct cix_u3phy *u3phy =3D phy_get_drvdata(phy);
> +	int ret =3D 0;
> +
> +	mutex_lock(&u3phy->mutex);
> +	ret =3D cix_usb3_phy_power_off(u3phy);
> +	mutex_unlock(&u3phy->mutex);
> +	return ret;
> +}

[Severity: Low]
This isn't a bug, but since cix_u3phy_probe() registers a single struct
phy via of_phy_simple_xlate(), phy_init() and phy_exit() in the PHY core
already serialize calls under phy->mutex and refcount phy->init_count,
calling phy->ops->init() only when phy->init_count =3D=3D 0 and
phy->ops->exit() only when phy->init_count =3D=3D 1.

That makes u3phy->mutex, u3phy->init, and u3phy->init_count redundant.
Dropping them and wiring sky1_u3phy_init() and sky1_u3phy_exit() directly
into cix_u3phy_ops would also remove the cix_usb3_phy_power_on(),
cix_usb3_phy_power_off(), and struct cix_u3phy_cfg wrappers, which log
duplicate error messages using the stale "udphy" name.

[ ... ]

> diff --git a/drivers/phy/cix/phy-cix-usb3.h b/drivers/phy/cix/phy-cix-usb=
3.h
> new file mode 100644
> index 0000000000000..22666cd3b2537
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usb3.h

[ ... ]

> +#define RX_SDCAL0_INIT_TMR_LANE0     0x8044
> +#define RX_SDCAL0_INIT_TMR_LANE1     0x8244
> +#define RX_SDCAL0_INIT_TMR_LANE2     0x8444
> +#define RX_SDCAL0_INIT_TMR_LANE3     0x8644

[ ... ]

> +#define PHY_PIPE_USB3_GEN2_PRE_CFG0  0xc018
> +#define PHY_PIPE_USB3_GEN2_POST_CFG0 0xc01a
> +#define PHY_PIPE_USB3_GEN2_POST_CFG1 0xc01b

[ ... ]

> +/* Bits */
> +
> +#define PHY_PLL_CFG_0803              0xC00E
> +/* 0803 phy register */
> +#define PHY_PIPE_USB3_GEN2_PRE_CFG0_0803	0xc01c
> +#define PHY_PIPE_USB3_GEN2_POST_CFG0_0803	0xc01e
> +#define PHY_PIPE_USB3_GEN2_POST_CFG1_0803	0xc01f
> +
> +#endif

[Severity: Low]
This isn't a bug, but over 70 macros in this private header are unused,
including all *_LANE2 and *_LANE3 definitions for this 2-lane PHY and the
non-0803 PHY_PIPE_USB3_GEN2_* offsets superseded by the *_0803 macros at
the bottom.  Could the unused macros be dropped and the remaining
definitions moved into phy-cix-usb3.c?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111030937.2954=
646-1-hongliang.yang@cixtech.com?part=3D2
