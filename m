Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63BD3A1E7E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107933; cv=none; b=YWahypBCTwJWf0JcdnjVSBb7s6YAm26s1AdvGnP2BUCtr5droBhWKvM6iH3dpxBlEJ+lc/q05AKnNCTKpyvkoILMNUnEy1BCySPAfCiw7JDjUn8iYCOOo2kUaGjOHbGrVLR3SdTUkYjOKyIXxZQQiDgtbbdXMzBOc+eKUAqoAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107933; c=relaxed/simple;
	bh=5Pa64Nig0rWSZElYBR14pwF/MyM6jqSP5qEFFkSBf3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r3M3rq4P8S0vAZQxVFNQV2rI7nUf7WoqSp6rCdvg7mHR8TFRj808556SErONcjqfiPjGUW5gl6zmtmNgnN/fvJd9QpWrY8psjocxkZSuXxY9o+57XB7vQgXEdUHhKOUYncd8mYeFMPBM0p0CGAA54hotIQdsLbJuRKI84I38Cyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OymVpnsS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OymVpnsS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522551F0089C;
	Tue, 22 Sep 2026 20:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790107908;
	bh=/WbY15yBrBak26HFGVMdBuMYytspWWUB9Ac0tjojGsI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OymVpnsSebYcc504fXKS1AhRa9E7mbXrTuYNNZHZxQzoPD6ChuvL95VqPegMGV3OW
	 VAl3fImVItm+mHTk67t3M2RqLKYInIHqK2crWb67x/cig1sVrwCIxvFrZOuzlpO7jJ
	 OU69tO76VBa6ObgY6lTC53bogYe9d3MySAeYx+1UlIri/pSXVqJLyXCCB9w/LKQw1z
	 3cUlfgWC1k3aI0XH/IzN7AoERRflNq1zehV0BFzhgljpJR7F0QkP9VVylZuLOGQPW8
	 PIn8vD30ZEUZQtkjSf/DIoTuYPqgTYkgsQQOMAjCEtj0XgmOayCd6f8ScrRJ7P4rp1
	 w9NcMoynY565g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 13/14] dpll: sit9531x: model the inter-PLL sync net
 as a pair of pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921201108.42676-14-arouhi@sitime.com>
References: <20260921201108.42676-1-arouhi@sitime.com>
 <20260921201108.42676-14-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:11:47 +0000
Message-Id: <20260922201148.522551F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dpll: sit9531x: intsync_disable unconditionally re-enables sync on=
 success
- [Medium] dpll: sit9531x: error paths in intsync_disable bypass global bit=
 rollback
--

commit 95c79d6f4b1eae6316f594ced6eed52e8dcec752
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: model the inter-PLL sync net as a pair of pins

This commit updates the sit9531x driver to model the inter-PLL sync net
as a pair of pins (one output, multiple inputs) to better track state.
It introduces functions to enable, disable, and detect the sync net source
across the phase-locked loops.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 1cb691f040194..e8d47999f1a97 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> +/*
> + * sit9531x_intsync_disable - disable inter-PLL synchronization
> + * @src_pll_idx: source (frequency) PLL index (0-3)
> + *
> + * Clears INTSYNC global bit, writes disable values to the source
> + * PLL's EXT page, and triggers a small update.
> + *
> + * Caller must hold sitdev->multiop_lock.
> + */
> +int sit9531x_intsync_disable(struct sit9531x_dev *sitdev, u8 src_pll_idx)
> +{
> +	u8 ext_page, val;
> +	int rc, lock_rc, i;

[ ... ]

> +	rc =3D sit9531x_read_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL, &val);
> +	if (rc)
> +		return rc;
> +	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL,
> +			       val & ~BIT(SIT9531X_INTSYNC_EN_BIT));
> +	if (rc)
> +		return rc;
> +
> +	/* Small update on Page 0 */
> +	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_GLOBAL_UPDATE,
> +			       SIT9531X_SMALL_UPDATE_CMD);
> +	usleep_range(1000, 2000);
> +	if (rc)
> +		return rc;

[Severity: Medium]
If this I2C write fails, returning directly bypasses the restore_global
recovery block below. Does this leave the global bit cleared while the EXT
page still holds the enable pattern? This could cause the detector to report
the net as unowned, causing any retry of the disable operation to short
circuit.

> +
> +	/* Unlock debug on EXT page */
> +	rc =3D sit9531x_write_u8(sitdev,
> +			       SIT9531X_REG(ext_page,
> +					    SIT9531X_PLL_REG_DEBUG),
> +			       SIT9531X_PLL_DEBUG_UNLOCK);
> +	if (rc)
> +		goto relock;

[Severity: Medium]
Jumping directly to relock on a debug unlock failure abandons the global bit
rollback. Should this jump to restore_global instead to ensure the global
state is properly reverted?

> +
> +	for (i =3D 0; i < ARRAY_SIZE(intsync_config); i++) {
> +		rc =3D sit9531x_write_u8(sitdev,
> +				       SIT9531X_REG(ext_page,
> +						    intsync_config[i].offset),
> +				       intsync_config[i].dis_val);
> +		if (rc)
> +			goto restore_global;
> +	}
> +
> +	/* Small update on source PLL */
> +	rc =3D sit9531x_write_pll_u8(sitdev, src_pll_idx,
> +				   SIT9531X_PLL_REG_SMALL_UPDATE,
> +				   SIT9531X_SMALL_UPDATE_CMD);
> +	if (rc)
> +		goto relock;

[Severity: Medium]
Similar to the debug unlock failure, jumping to relock here on a small upda=
te
failure also fails to revert the global state.=20

> +
> +	rc =3D 0;
> +
> +restore_global:

[Severity: High]
Is a goto relock missing right before the restore_global label? Without it,
a completely successful disable sequence will unconditionally fall through
into this error recovery block, which writes the INTSYNC_EN_BIT back to 1.
This could leave the hardware in a corrupted state where the global enable
is set but the EXT page is disabled.

> +	/*
> +	 * The global enable was cleared first, so a failure here leaves the
> +	 * EXT page still holding the enable pattern with nothing pointing
> +	 * at it: the source detector keys on the global bit, would report
> +	 * the net as unowned, and a retry of the disable would then
> +	 * short-circuit.  Put the bit back so the state stays one the
> +	 * driver can describe and the request can be repeated.
> +	 */
> +	if (!sit9531x_read_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL, &val))
> +		sit9531x_write_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL,
> +				  val | BIT(SIT9531X_INTSYNC_EN_BIT));
> +
> +relock:
> +	/* Close the EXT page debug window the sequence opened. */
> +	lock_rc =3D sit9531x_intsync_debug_lock(sitdev, ext_page);
> +	if (lock_rc && !rc)
> +		rc =3D lock_rc;
> +
> +	return rc;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921201108.4267=
6-1-arouhi@sitime.com?part=3D13
