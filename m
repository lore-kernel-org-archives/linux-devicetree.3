Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE93815E6
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107918; cv=none; b=jZnIJq/ddw64PZzTwjl/6sJgl70VljlGQ+ZwEOtBneBJicGUr5e9rk/WqDtpvqiuc6QRTbFTAz2GcWSahHlHPnKi8Ad9u+SYf+9uauTES2Y5k4vOebN9Vsz2pD9Jdpo/xpZeWVHBiZdHY2Yc/bgbm0iyJPtI8hRwbUD2OtsXsxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107918; c=relaxed/simple;
	bh=ZYrPOqwihHd013EtVieYG5ZIO9nELgg0QU5MRe1KTl0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eAppNX+csGd2t1RzTP1g265QlWFGnp39bM4sZZQpN0pcF99RpzGe3mPXeEpPDYYDuOHbywxT5l2hNP1eHpL+FLKlIKZHLD9vaZ9gMqX380Meum1aiV366FU71Lj4krhz4lOAsxl1k2H/Lr3BSB6aOpVw5CCK4HuoyC/ynrz1t00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anwCJKGP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anwCJKGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B3E1F00893;
	Tue, 22 Sep 2026 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790107904;
	bh=yaeTmqOb5vqEoNZhLx6WKB9kRWefAg625GK6vy/hIdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=anwCJKGPk6xuqooQFN1yN7VBiqzNnFfAmoOUpsZEHs8G6iE1KbQPl/Atir8cxsAN/
	 ce7SV4rhCFXC7wwK8OEzkkQ7rkPld19MgNHsdcrnNfmsnV0w3cnf2AEWt6HgPX9LJQ
	 GLPjzRFQo6SVGkQted7cxgIPaKSF4nhgW4BwDKb+DHlgYdWknwv3+w9PJ/GTwRqBQn
	 uKXzuL3WZNzEz9bO5dE7YwUPsSH1dUPzzeZ56Ua8vUUvY2M3noRbafJ7Ob0t9JfKM9
	 OgDeatpSF7Mb4FW59cXTGq4Hqycqzc65Y4DAeA7N3OqgVwvnEE6UoKK+sDT6XPeCu8
	 1/EWMocfPHsQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 06/14] dpll: sit9531x: implement input pin state on
 a DPLL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921201108.42676-7-arouhi@sitime.com>
References: <20260921201108.42676-1-arouhi@sitime.com>
 <20260921201108.42676-7-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:11:43 +0000
Message-Id: <20260922201144.48B3E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dpll: sit9531x: input receiver gets permanently disabled on part=
ial I2C failure
- [Low] dpll: sit9531x: priority reversal when adding new inputs to empty s=
lots
--

commit dcd68584c337184ceb7b89117cd05260207e1507
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
   =20
dpll: sit9531x: implement input pin state on a DPLL
   =20
This commit implements input pin state reporting and configuration for the
SIT9531x DPLL driver. It manages references using a priority table to
determine which input is connected and selectable.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> +int sit9531x_input_disable(struct sit9531x_dev *sitdev, u8 index)
> +{

[ ... ]

> +	rc =3D sit9531x_read_u8(sitdev, force_reg, &val);
> +	if (!rc)
> +		rc =3D sit9531x_write_u8(sitdev, force_reg, val | BIT(pair));
> +
> +	ret =3D sit9531x_read_u8(sitdev, state_reg, &val);
> +	if (!ret)
> +		ret =3D sit9531x_write_u8(sitdev, state_reg, val & ~BIT(pair));
> +	if (ret && !rc)
> +		rc =3D ret;
> +
> +	if (rc)
> +		return rc;
> +
> +	ref->enabled =3D false;

[Severity: Medium]
Can returning early on a bus error here desynchronize the software cache
from the physical hardware state?

If the I2C write to assert the FORCE bit succeeds, but the subsequent read
or write to the STATE bit fails, the function returns an error without
setting ref->enabled =3D false. If the hardware default for STATE was 0, the
receiver is now physically disabled.

This becomes problematic in sit9531x_dpll_input_pin_state_on_dpll_set():

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> +static int
> +sit9531x_dpll_input_pin_state_on_dpll_set(const struct dpll_pin *pin,
> +					  void *pin_priv,
> +					  const struct dpll_device *dpll,
> +					  void *dpll_priv,
> +					  enum dpll_pin_state state,
> +					  struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	case DPLL_PIN_STATE_SELECTABLE:
> +		/*
> +		 * Gate the receiver on whenever it is off, not only when this
> +		 * DPLL holds no claim yet.  The two are tracked separately --
> +		 * the claim comes from the priority table, the receiver from
> +		 * the force bits -- so a PLL that already lists the input can
> +		 * still find it powered down, and skipping the enable would
> +		 * report success for a reference that cannot reach the loop.
> +		 */
> +		if (!ref->enabled) {
> +			rc =3D sit9531x_input_enable(sitdev, dpin->id);
> +			if (rc)
> +				break;
> +			enabled_here =3D true;
> +		}

[Severity: Medium]
When userspace later tries to connect or make the pin selectable, this block
will see the stale ref->enabled cache and skip re-enabling it.

Will this leave the physical input receiver permanently disabled, blocking
the signal to all PLLs until the module is reloaded?

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> +int sit9531x_input_prio_add(struct sit9531x_dev *sitdev, u8 pll_idx,
> +			    u8 input_idx)
> +{

[ ... ]

> +	/*
> +	 * A slot whose code names no usable source -- a reserved value, or
> +	 * one past the inputs this variant has -- is free space, and taking
> +	 * it costs nothing.  Prefer it over displacing a real reference.
> +	 */
> +	for (slot =3D SIT9531X_PRIO_MAX_SLOTS; slot-- > 0;) {
> +		src =3D srcs[slot] & SIT9531X_PRIO_NIBBLE_MASK;
> +		if (!sit9531x_prio_src_usable(src)) {
> +			replace =3D slot;
> +			break;
> +		}
> +	}

[Severity: Low]
Does this backward loop assign new inputs to the lowest available priority
instead of the highest?

When the driver adds multiple sources to a priority table containing
multiple empty slots (e.g., after the table was cleared), the backward loop
selects the highest-index empty slot first.

This results in the first added input getting the lowest priority (highest
slot index), and subsequent inputs getting increasingly higher priorities,
which reverses the expected FIFO addition order.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921201108.4267=
6-1-arouhi@sitime.com?part=3D6
