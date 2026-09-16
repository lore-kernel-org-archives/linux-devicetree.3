Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB9327C09
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516845; cv=none; b=kfUQv8UMZD3+5aeS9UqlhOH1yGmxo6O2VsxihViI/fIrOpxlqRlw07bwz8Q0X7+ZpKQzOq3RBlWFs0ohNkSLSjjwuQubXvvVVE5JnSK6iwqhaijErPJx/fnoZG8RxBeoG0BANtyQdaG2792CVCQTqxNaO7l7OkfBYOVivIPkmM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516845; c=relaxed/simple;
	bh=7GRlFOYj0hhCMC9Rk+Vote+4jepoo65YEfqZjxQYSdE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HkhEJ1ec9rw7boHaQ1Pb1O1yuY5aFUu8x5U658KGWN1uN4J6nyM5hwkM7vEiFmhWrT9/x4TWQ5Gm+uxfO0LPEeq08EKzhGzTEZDIc+aOx2gpHp678bvInyNXaHxAVB6XqS5Wksu/Jq1BoHxEAjK5NlIWfpGcffkeLduCldDgOn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkpGLt4Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkpGLt4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB8F1F00898;
	Wed, 16 Sep 2026 00:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789516844;
	bh=aGD0XMr4YbFCF+ZSmjUIuyz5fB0IskRifLQ+Ph94tx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FkpGLt4QWtatOuIYh0ImafWNwmI267k63eQn306n4ccDO1XYaFmZVXAxBPpmiRNiw
	 bhDSS16+emPhzCrULendZAaKjRDSqbUr+4tgt03L2a4A3B4KMxsYGhnJ21xP/XGeBR
	 aas4d5ZnWDizJ12zO6e6mskmCth/NZ86lZQGgCKFCLliqLGIyXS4nlCRddm+3AfU83
	 5XU1MygPGhTHW784jHWqTJ2sCffeJDK4CNirs7S1ORXYoly4sBImlhKiK78KZQdcPP
	 gI6U/DzxdBbohOopkYqZnp1p07/O7QbOz6/syWCi3EJEfv/d3/h/ZvxwCTKillL71B
	 1CCOrAzHcxuTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 14/15] dpll: sit9531x: model the inter-PLL
 sync net as a pair of pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260915000015.80480-15-arouhi@sitime.com>
References: <20260915000015.80480-1-arouhi@sitime.com>
 <20260915000015.80480-15-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 00:00:43 +0000
Message-Id: <20260916000043.BAB8F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dpll: missing debug block relock in INTSYNC enable/disable paths
- [Medium] dpll: cache desynchronization on I/O error allows multiple INTSY=
NC drivers
--

commit 218b2f034db2d78ade260886ea4d74abbdcc7ca8
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: model the inter-PLL sync net as a pair of pins

The device has an internal net by which one PLL can drive the others.
This commit models the source and destination behavior separately, allowing
each pin to faithfully report its own state.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 88bfa63b29755..b15859890caa7 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> +int sit9531x_intsync_enable(struct sit9531x_dev *sitdev, u8 src_pll_idx)
> +{
> +	u8 ext_page, val;
> +	int rc, i;
> +
> +	lockdep_assert_held(&sitdev->multiop_lock);

[ ... ]

> +	/* Unlock debug on EXT page */
> +	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG(ext_page, SIT9531X_PLL_RE=
G_DEBUG),
> +			       SIT9531X_PLL_DEBUG_UNLOCK);
> +	if (rc)
> +		goto err_disable;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(intsync_config); i++) {
> +		rc =3D sit9531x_write_u8(sitdev,
> +				       SIT9531X_REG(ext_page,
> +						    intsync_config[i].offset),
> +				       intsync_config[i].en_val);
> +		if (rc)
> +			goto err_disable;
> +	}
> +
> +	/* Small update on source PLL */
> +	rc =3D sit9531x_write_pll_u8(sitdev, src_pll_idx,
> +				   SIT9531X_PLL_REG_SMALL_UPDATE,
> +				   SIT9531X_SMALL_UPDATE_CMD);
> +	if (rc)
> +		goto err_disable;
> +
> +	return 0;

[Severity: Medium]
Does this leave the EXT debug page permanently unlocked on success?

The debug registers are unlocked with SIT9531X_PLL_DEBUG_UNLOCK, but
SIT9531X_PLL_DEBUG_LOCK is never written before returning. Does this
bypass the hardware protection against spurious writes?

> +
> +err_disable:
> +	/*
> +	 * The global enable is already set at this point.  The caller only
> +	 * records the source PLL when this function succeeds, so nothing
> +	 * else will ever clear the bit: undo it here rather than leave the
> +	 * net asserted with a half-written EXT page.
> +	 */

[ ... ]

> +int sit9531x_intsync_disable(struct sit9531x_dev *sitdev, u8 src_pll_idx)
> +{
> +	u8 ext_page, val;
> +	int rc, i;

[ ... ]

> +	/* Unlock debug on EXT page */
> +	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG(ext_page, SIT9531X_PLL_RE=
G_DEBUG),
> +			       SIT9531X_PLL_DEBUG_UNLOCK);
> +	if (rc)
> +		return rc;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(intsync_config); i++) {
> +		rc =3D sit9531x_write_u8(sitdev,
> +				       SIT9531X_REG(ext_page,
> +						    intsync_config[i].offset),
> +				       intsync_config[i].dis_val);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	/* Small update on source PLL */
> +	rc =3D sit9531x_write_pll_u8(sitdev, src_pll_idx,
> +				   SIT9531X_PLL_REG_SMALL_UPDATE,
> +				   SIT9531X_SMALL_UPDATE_CMD);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}

[Severity: Medium]
Similarly, does the disable path also leave the debug page unlocked?

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 2a973364a9cd2..3efe6fc90701d 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> +static int
> +sit9531x_dpll_intsync_src_state_on_dpll_set(const struct dpll_pin *pin,
> +					    void *pin_priv,
> +					    const struct dpll_device *dpll,
> +					    void *dpll_priv,
> +					    enum dpll_pin_state state,
> +					    struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	int rc =3D 0, detect_rc =3D 0;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +
> +	switch (state) {
> +	case DPLL_PIN_STATE_CONNECTED:

[ ... ]

> +		rc =3D sit9531x_intsync_enable(sitdev, sitdpll->id);
> +		break;
> +	case DPLL_PIN_STATE_DISCONNECTED:
> +		if (sitdev->intsync_src !=3D sitdpll->id)
> +			break;
> +		rc =3D sit9531x_intsync_disable(sitdev, sitdpll->id);
> +		break;
> +	default:
> +		rc =3D -EINVAL;
> +		break;
> +	}
> +
> +	/*
> +	 * Re-scan hardware after source state transitions so cache follows
> +	 * partially failed enable/disable paths as closely as possible.
> +	 */
> +	if (state =3D=3D DPLL_PIN_STATE_CONNECTED ||
> +	    state =3D=3D DPLL_PIN_STATE_DISCONNECTED)
> +		detect_rc =3D sit9531x_intsync_src_detect(sitdev);
> +	/*
> +	 * The refresh only re-reads what the device now shows.  Failing
> +	 * the request because that read hit a bus error would tell
> +	 * userspace the enable did not happen when it did.
> +	 */
> +	if (detect_rc)
> +		dev_warn(sitdev->dev,
> +			 "INTSYNC source cache not refreshed: %d\n",
> +			 detect_rc);
> +
> +	mutex_unlock(&sitdev->multiop_lock);
> +
> +	if (rc && rc !=3D -EBUSY && rc !=3D -EINVAL && rc !=3D -EOPNOTSUPP)
> +		NL_SET_ERR_MSG(extack, "Failed to set INTSYNC source state");
> +
> +	return rc;
> +}

[Severity: Medium]
Can a transient I2C error here lead to a hardware collision?

If sit9531x_intsync_enable() succeeds (rc =3D=3D 0) but the subsequent
sit9531x_intsync_src_detect() fails due to a bus error, detect_rc is
ignored and the function returns success.

Since sit9531x_intsync_src_detect() bails out on read failures without
updating sitdev->intsync_src, won't the software cache still claim no
PLL is driving INTSYNC (-1) while the hardware is actively driving it?

Could a subsequent request then successfully connect a second PLL to
drive the net, causing a hardware collision?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915000015.8048=
0-1-arouhi@sitime.com?part=3D14
