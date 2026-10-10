Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB81136672
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 18:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791657130; cv=none; b=MYN9+LGbH/A9GVxuIBIjqxScGGjWPCC2fWZmv9s8ggbI+SGbfRMYtbdO44miHvY8D7AnYqVilu86HOQnJM+j0orNNzFQjyRDJoV9vwr6iEYy2AKutqaSlkuSdD1wlM5VXywbsu4qUo69NLqbzrvV9UG7o3r2fwDwLeZow50SDuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791657130; c=relaxed/simple;
	bh=JIZ2eTvFtHYNQhFnOS55O59RPBInFjJQM3saAKOT4Bc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dk1IkatC2FuCseJN4EsC38cb7zi4Bsb5/LodhCNUE3rPfxAl/ixKnecyrbS9kP/uTVsYAdtUNxvN0OIvISmSoCGLvHrzYGSW9nLmdH2W4AFMoyx0ygWO9Y2vlIJF1JzLuPqZIDBYgNc9RogFxOm03gM8ex08zsjwjR4ms9B+PyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEaIYmal; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEaIYmal"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFBC1F000FF;
	Sat, 10 Oct 2026 18:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791657128;
	bh=qAB7ASxjHRl6wlZjt6t1AzK92RFCpBwOUtU8iXSEI5I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aEaIYmalOwqRJyJbeZk7UoDaig/9X7y2ge69Qh9XNboo/wiB5QAWBziCvbpIozR4+
	 Ie9poN+C58PsMWiLUgKcXfMDULgifdKngXdbCQ4u/tc1Fk9N5q1ni2TbRwFRcWZN3E
	 w/xtazSHzd5LpRaCnCamu394JeZ/g98SA+NTGsLfYcV+YuxyCu0gklxOhBdsIG/R73
	 niBUEgFIJ09k3BqmWugLmEjdy7S9VCQlmLOEpOlL6kGNjDt76/lyRBEESqaYbl8n0g
	 HDVxkAVc+Ie7JqEOdEbufKu+EOtBnITMoMMKbsYtog3kdOdD3pBMfFSqCSCurnqcSj
	 OnqBtCUDMKUcQ==
Message-ID: <sashiko-outbox-166805@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 03/12] dpll: add basic SiTime SiT9531x
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009183151.78497-4-arouhi@sitime.com>
References: <20261009183151.78497-1-arouhi@sitime.com>
 <20261009183151.78497-4-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 18:32:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dpll: sit9531x: race condition in regmap cache invalidation on I=
2C failure
--

commit 1fc3c6add951f10b8266bc8b2d155767ac703b33
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: add basic SiTime SiT9531x support

This commit adds basic I2C support for the SiTime SiT9531x clock generator
family. It introduces paged regmap configuration, register access helpers,
and device probe functionality.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> new file mode 100644
> index 0000000000000..c7c14442df922
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> +int sit9531x_read_u8(struct sit9531x_dev *sitdev, unsigned int reg,
> +		     u8 *val)
> +{
> +	unsigned int vreg, tmp;
> +	int rc;
> +
> +	vreg =3D (SIT9531X_REG_PAGE(reg) * SIT9531X_PAGE_SIZE) +
> +	       SIT9531X_REG_OFFSET(reg) + SIT9531X_RANGE_OFFSET;
> +
> +	rc =3D regmap_read(sitdev->regmap, vreg, &tmp);
> +	if (rc) {
> +		sit9531x_page_cache_drop(sitdev);

[Severity: Medium]
Could this create a race window during the cache invalidation?

The internal regmap lock is dropped after regmap_read returns. If an I2C
transfer fails, there is an unprotected race window between regmap dropping
its lock and regcache_drop_region re-acquiring it inside
sit9531x_page_cache_drop.

A concurrent thread could initiate another regmap access in this window,
observe the stale cached page selector, incorrectly assume the hardware is
on the requested page, and perform an I2C transfer. Since the failed
transfer may have left the hardware on a different page, the concurrent
access could hit the wrong registers.

Should the driver serialize the regmap access and the error-path cache
invalidation within a single lock (such as sitdev->multiop_lock) to ensure
the cache is invalidated atomically?

> +		dev_err(sitdev->dev,
> +			"Failed to read page 0x%02x reg 0x%02x: %d\n",
> +			SIT9531X_REG_PAGE(reg), SIT9531X_REG_OFFSET(reg), rc);
> +	} else {
> +		*val =3D (u8)tmp;
> +	}
> +
> +	return rc;
> +}
> +
> +/*
> + * sit9531x_write_u8 - write an 8-bit register
> + * @reg:	register in SIT9531X_REG(page, offset) form
> + * @val:	value to write
> + */
> +int sit9531x_write_u8(struct sit9531x_dev *sitdev, unsigned int reg,
> +		      u8 val)
> +{
> +	unsigned int vreg;
> +	int rc;
> +
> +	vreg =3D (SIT9531X_REG_PAGE(reg) * SIT9531X_PAGE_SIZE) +
> +	       SIT9531X_REG_OFFSET(reg) + SIT9531X_RANGE_OFFSET;
> +
> +	rc =3D regmap_write(sitdev->regmap, vreg, val);
> +	if (rc) {
> +		sit9531x_page_cache_drop(sitdev);

[Severity: Medium]
Does this have the same race window where the internal regmap lock is
dropped after regmap_write returns, before the cache is invalidated?

> +		dev_err(sitdev->dev,
> +			"Failed to write page 0x%02x reg 0x%02x: %d\n",
> +			SIT9531X_REG_PAGE(reg), SIT9531X_REG_OFFSET(reg), rc);
> +	}
> +
> +	return rc;
> +}
[ ... ]
> +int sit9531x_update_pll_u8(struct sit9531x_dev *sitdev, u8 pll_idx,
> +			   u8 offset, u8 mask, u8 val)
> +{
> +	u8 page =3D sit9531x_pll_page(pll_idx);
> +	unsigned int vreg;
> +	int rc;
> +
> +	vreg =3D (page * SIT9531X_PAGE_SIZE) + offset + SIT9531X_RANGE_OFFSET;
> +
> +	/*
> +	 * A read-modify-write is a read and a write, and either can leave
> +	 * the cached page selector wrong, so fail the way the single
> +	 * accessors do.
> +	 */
> +	rc =3D regmap_update_bits(sitdev->regmap, vreg, mask, val);
> +	if (rc) {
> +		sit9531x_page_cache_drop(sitdev);

[Severity: Medium]
Does this also expose the same race window when regmap_update_bits releases
its lock before the cache invalidation can happen?

> +		dev_err(sitdev->dev,
> +			"Failed to update page 0x%02x reg 0x%02x: %d\n",
> +			page, offset, rc);
> +	}
> +
> +	return rc;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009183151.7849=
7-1-arouhi@sitime.com?part=3D3
