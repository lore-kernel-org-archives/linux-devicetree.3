Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345CD349B19
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471678; cv=none; b=qq5AXqF0xAcN0t6tvcGx+aMVQxqoisSKE7yGCHS0+oBFkdK+Cv93fAs6+jwikoRGsfElZ/qgGq+pdrp3e84i7cZ7iOccZlYYxQHj+GcNq7uRLdzyNLAYQ1z1VIwHLvE8MMwvI1uSuYDxWDkNQh7W/LNXJ5JG7kQ0lbfvhsRNObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471678; c=relaxed/simple;
	bh=Lqc/sYh7NZQuFeux2tyj5kGi66pvsCO8EM+qpRd6/CM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NzrM+wSc7vlxvG51uwIgkuF5oQQ3Eg3RphuKIGjmfdQqYPw5PvYX+Yppw97R5XXO+le3pKBwoV9tZ9tGeGBNdtn+oS1wJRnQgxDZHHGiTrSxMO7ODSN+RHELAYNfZvq0NMHfDIeE1h6UQi/07cLWy3gj462ILHOvdsnGmHuYFBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQh6HSUZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQh6HSUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0471F00A3D;
	Thu,  3 Sep 2026 21:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788471677;
	bh=nmFE3sfWSj0Tptj9/OujEgVtHDJ4YDZQ8UHrKZL6JqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQh6HSUZpivIZvA+V8hQKaYyJ4Vd01bjhBHf3eXQftOyUL9l7n8blFf2Ok+8MNwwx
	 nT0rZNuEXjtVa+iKjwsD1k9h0HZhwBDYvfCIN2nZphwFaoZeanF+nL/0p8KBuqS1UJ
	 XRXPX3FPPo9aEK1/QQxmFXHBSCrC0MUm7ScBGM6wWV24QAdjSO8tHOEQKObKurpbiN
	 sh9PiSuHjXjPLFlc2rIYpXigiOPVqO89KRVuAiqYpAOYnTooL5tvvnBPOjQix4Ldsf
	 d9bKZEW46EKbf0LnivHna5hOl7FvpBkXJkwL8Os3I6HLGWAmyAXuU7bQIU/cg+Qep5
	 Af0MYrDAbqPBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 07/15] dpll: sit9531x: add support to get
 and set priority on input pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902214030.20955-8-arouhi@sitime.com>
References: <20260902214030.20955-1-arouhi@sitime.com>
 <20260902214030.20955-8-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 21:41:16 +0000
Message-Id: <20260903214116.CB0471F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver returns an out-of-bounds magic value for missing priori=
ties, breaking state restoration.
- [Medium] The priority getter executes up to 12 synchronous I2C reads per =
pin during Netlink dumps, causing bus congestion.
--

commit be1678526b62caf3f5f37b6a6797c818a913f9e9
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

    dpll: sit9531x: add support to get and set priority on input pins
   =20
    The priority table is ordered: the slot an input occupies is its
    priority, and the device selects the lowest occupied slot whose signal =
is
    qualified.  Getting the priority is therefore a search of the table for
    the input, and setting it moves the input to the requested slot.
   =20
    An input absent from the table has no priority to report, and the core =
is
    told so rather than handed a made-up number.

>     An input absent from the table has no priority to report, and the cor=
e is
>     told so rather than handed a made-up number.

[Severity: High]
Is this description accurate? The DPLL core unconditionally packages the
result and lacks an -ENODATA opt-out for priority. As a result,
sit9531x_input_prio_get() actually assigns a made-up value (11) and returns
success, causing it to be published to userspace via DPLL_A_PIN_PRIO.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index f42c41d8a42e4..e706f6942f654 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -414,6 +414,49 @@ static int sit9531x_prio_prg_commit(struct sit9531x_=
dev *sitdev)
>  	return 0;
>  }
> =20
> +/*
> + * sit9531x_input_prio_get - read an input's priority slot for a PLL
> + * @input_idx:	input source in hardware encoding (see
> + *		sit9531x_input_hw_src())
> + * @prio:	output slot position (0 =3D highest); set to
> + *		SIT9531X_PRIO_MAX_SLOTS when the source is not in the table
> + *
> + * Scans the PLL's 12-slot priority table on Page 1 and returns the
> + * highest-priority (lowest-numbered) slot that references the source.
> + * This reads the value the chip actually holds rather than a cached
> + * default, so pin-get reflects the real hardware priority.
> + *
> + * Caller must hold sitdev->multiop_lock.
> + */
> +int sit9531x_input_prio_get(struct sit9531x_dev *sitdev, u8 pll_idx,
> +			    u8 input_idx, u8 *prio)
> +{
> +	u8 val, slot, src;
> +	int rc;
> +
> +	lockdep_assert_held(&sitdev->multiop_lock);
> +
> +	if (pll_idx >=3D SIT9531X_NUM_PLLS)
> +		return -EINVAL;
> +
> +	for (slot =3D 0; slot < SIT9531X_PRIO_MAX_SLOTS; slot++) {
> +		rc =3D sit9531x_read_u8(sitdev,
> +				      sit9531x_prio_reg(pll_idx, slot), &val);

[Severity: Medium]
Will this cause bus congestion during Netlink dumps?

When a user-space netlink dump invokes dpll_msg_add_pin_dplls(), it calls
sit9531x_dpll_input_pin_prio_get() for each pin. This results in up to 12
synchronous I2C reads per pin here in sit9531x_input_prio_get(). Across
4 PLLs and multiple pins, this could translate to hundreds of synchronous
reads for a single Netlink dump, blocking the I2C bus for ~100-200ms.

While Netlink operations are on the control plane, could this state be
cached (like the existing prio_mask) to avoid extensive synchronous hardware
polling?

> +		if (rc)
> +			return rc;
> +
> +		src =3D sit9531x_prio_slot_get(val, slot);
> +
> +		if (src =3D=3D input_idx) {
> +			*prio =3D slot;
> +			return 0;
> +		}
> +	}
> +
> +	*prio =3D SIT9531X_PRIO_MAX_SLOTS;
> +	return 0;
> +}
[ ... ]
> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 29088707a3e62..67b9fbba9f2e8 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
> @@ -417,10 +417,90 @@ sit9531x_dpll_input_pin_state_on_dpll_set(const str=
uct dpll_pin *pin,
>  	return rc;
>  }
> =20
[ ... ]
> +/*
> + * sit9531x_dpll_input_pin_prio_set - set input pin priority
> + *
> + * writes input priority table on Page 1 via
> + * core.c sit9531x_input_prio_set().  Forces holdover during update.
> + */
> +static int
> +sit9531x_dpll_input_pin_prio_set(const struct dpll_pin *pin, void *pin_p=
riv,
> +				 const struct dpll_device *dpll, void *dpll_priv,
> +				 u32 prio, struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll_pin *dpin =3D pin_priv;
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	int rc;
> +
> +	if (dpin->dir !=3D DPLL_PIN_DIRECTION_INPUT) {
> +		NL_SET_ERR_MSG(extack, "Priority applies only to input pins");
> +		return -EINVAL;
> +	}
> +
> +	if (prio >=3D SIT9531X_PRIO_MAX_SLOTS) {

[Severity: High]
Does this break configuration state restoration?

When a disconnected pin has no hardware priority, sit9531x_input_prio_get()
assigns the magic value 11 (SIT9531X_PRIO_MAX_SLOTS) and returns success.
This value is forwarded to the DPLL core via
sit9531x_dpll_input_pin_prio_get() and published to userspace.

If tools like dpll-tools dump the device state and attempt to reapply it,
this SET operation will reject the value 11 with -EINVAL, causing state
restoration to fail.

> +		NL_SET_ERR_MSG(extack, "Priority out of range (0-10)");
> +		return -EINVAL;
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902214030.2095=
5-1-arouhi@sitime.com?part=3D7
