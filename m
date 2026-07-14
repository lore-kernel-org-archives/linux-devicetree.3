Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB193FA5E9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017674; cv=none; b=pRGQKveji65JhpD3NvzCW+nFVYDmjPznZzozstA4B2wU615ISCaUPidHArREa+B/iQmZQ817/zDrsoasRFIu0rpnDWP5BuRWzQkKtJk6N57Nt7rccpSBoSwka32HLY1gLch3Z3u/r4AWiYMpD+d4hcugyxspysTfzHEuIFH5bz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017674; c=relaxed/simple;
	bh=QzjTRrs477KcceAOM0SK++gAEcDJy0VjmchLy0OJLJ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=guE1qywcGkH0XyVmLowCsqIsvNrXMT0B//j2KhpA50mynUmU1Sdvf0MtSbjv8AMx65BfL6NYaSM2rYiKpStDT39qZDT8YueADouSM8xks8pNvMkI/JztuOp2ylDLVGbtD3DQQqoJ5VwcPPtqDb8f0AJ/eaTNh0K+MSYMhfGfVE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4PXG+SQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4PXG+SQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC001F000E9;
	Tue, 14 Jul 2026 08:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784017662;
	bh=TpObTcvuFSWBIibC+aW/S8iQHWr8ihagnaAkOeG8mjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V4PXG+SQ5BM+lOA7k+eW4aiDT+JA6er3ubdQXMC1KCjVaP1xwYQUWTMMxjBe4HEN7
	 12vbHEZDYZ8L4H9ZxsRNOs+UiZ5GfuG9oqX0CBSsHGOWwtqRfuXe9N7zUaWlfMPp/p
	 GKV/1awPNzo194NdWhkRfT8W5gSiO2BhGyFuJ7zim/bKcrBGNRj9SD84k5I2LtzXpe
	 hy3EIgp4ujoCIF43tdys5oQQyu75OF9TSFFK6J+GJR3035k4zyGTcwVr7dXHLs6nlS
	 LrN0oFu++Zh94V3uBVGQXEAOjM0NibnF7EJfYd1Wytfb5Obg1lCGjtyhJSZ+aqecC6
	 D176sn69TJG7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] counter: add GPIO-based counter driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714081709.17846-3-wafgo01@gmail.com>
References: <20260714081709.17846-1-wafgo01@gmail.com>
 <20260714081709.17846-3-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 08:27:41 +0000
Message-Id: <20260714082741.ACC001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Sparse initialization of the `signals` array causes a NULL pointer=
 dereference and missed registrations if `index1` is omitted but `index2` i=
s present.
- [High] Counter values incorrectly saturate at 0 and ceiling instead of wr=
apping around, permanently breaking position tracking for quadrature encode=
rs.
- [Medium] Torn reads of 64-bit state variables (`value`, `preset`, `ceilin=
g`) on 32-bit architectures due to lockless access.
- [Medium] Missing `cp->enabled` check in index pulse ISR allows disabled c=
ounters to be modified and generate events.
--

--- Patch [2]: [PATCH v7 2/3] counter: add GPIO-based counter driver ---
commit 71f827659851f1023e187d6b98a7113441670997
Author: Wadim Mueller <wafgo01@gmail.com>

counter: add GPIO-based counter driver

Add a platform driver that turns plain GPIOs into a counter device
supporting quadrature, pulse-direction, and increase/decrease modes.

> diff --git a/drivers/counter/gpio-counter.c b/drivers/counter/gpio-counte=
r.c
> new file mode 100644
> index 0000000000000..ceb79375d85b3
> --- /dev/null
> +++ b/drivers/counter/gpio-counter.c

[ ... ]

> +/* priv->lock held. */
> +static void gpio_counter_value_step(struct gpio_counter_count_priv *cp)
> +{
> +	if (cp->direction =3D=3D COUNTER_COUNT_DIRECTION_FORWARD) {
> +		if (cp->value < cp->ceiling)
> +			cp->value++;
> +	} else {
> +		if (cp->value > 0)
> +			cp->value--;
> +	}
> +}

[Severity: High]
Will this clamp the counter instead of letting it wrap around?

If the hardware oscillates or moves backward past 0, the counter will stick
at 0. Moving forward again will increment from 0, which could destroy the
absolute position mapping for quadrature encoders. Should this wrap around
modulo the ceiling instead?

[ ... ]

> +static void gpio_counter_index_pulse(struct counter_device *counter,
> +				     enum gpio_counter_count_id count_id)
> +{
> +	struct gpio_counter_priv *priv =3D counter_priv(counter);
> +	struct gpio_counter_count_priv *cp =3D &priv->count_priv[count_id];
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	if (cp->preset_enabled)
> +		cp->value =3D (cp->preset > cp->ceiling) ? cp->ceiling : cp->preset;
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	counter_push_event(counter, COUNTER_EVENT_INDEX, count_id);
> +}

[Severity: Medium]
Is a check for cp->enabled needed here?

When disabling a counter in gpio_counter_enable_write(), cp->enabled is set
to false and the spinlock is released before disable_irq() is called. If an
index edge fires in this narrow window, it looks like this could update
cp->value and push a COUNTER_EVENT_INDEX event despite the driver state
being logically disabled.

[ ... ]

> +static int gpio_counter_count_read(struct counter_device *counter,
> +				   struct counter_count *count, u64 *val)
> +{
> +	struct gpio_counter_priv *priv =3D counter_priv(counter);
> +	struct gpio_counter_count_priv *cp =3D &priv->count_priv[count->id];
> +
> +	*val =3D cp->value;
> +
> +	return 0;
> +}

[Severity: Medium]
Can this cause torn reads on 32-bit architectures?

Since cp->value is a 64-bit variable, reading it locklessly on a 32-bit
architecture requires two 32-bit loads. If the hardware ISR interrupts
these loads to increment the value across a 32-bit boundary, the reader
might fuse the old and new halves together resulting in a large, spurious
jump in the reported value.

This also seems to apply to the lockless reads of cp->ceiling and
cp->preset later in this file.

[ ... ]

> +static int gpio_counter_setup_signals(struct gpio_counter_priv *priv)
> +{
> +	priv->signals[GPIO_COUNTER_SIGNAL_A].id   =3D GPIO_COUNTER_SIGNAL_A;
> +	priv->signals[GPIO_COUNTER_SIGNAL_A].name =3D "Signal A";
> +	priv->signals[GPIO_COUNTER_SIGNAL_B].id   =3D GPIO_COUNTER_SIGNAL_B;
> +	priv->signals[GPIO_COUNTER_SIGNAL_B].name =3D "Signal B";
> +
> +	if (priv->count_priv[GPIO_COUNTER_COUNT_1].has_index) {
> +		priv->signals[GPIO_COUNTER_SIGNAL_INDEX1].id =3D
> +			GPIO_COUNTER_SIGNAL_INDEX1;
> +		priv->signals[GPIO_COUNTER_SIGNAL_INDEX1].name =3D "Index 1";
> +	}
> +	if (priv->count_priv[GPIO_COUNTER_COUNT_2].has_index) {
> +		priv->signals[GPIO_COUNTER_SIGNAL_INDEX2].id =3D
> +			GPIO_COUNTER_SIGNAL_INDEX2;
> +		priv->signals[GPIO_COUNTER_SIGNAL_INDEX2].name =3D "Index 2";
> +	}
> +
> +	return 2 + priv->count_priv[GPIO_COUNTER_COUNT_1].has_index +
> +	       priv->count_priv[GPIO_COUNTER_COUNT_2].has_index;
> +}

[Severity: High]
Does this setup handle the case where a device tree omits index1 but
includes index2?

If index1 is missing but index2 is present, the index 2 signal is mapped to
priv->signals[3] (GPIO_COUNTER_SIGNAL_INDEX2), leaving priv->signals[2]
zero-initialized.

Since this function returns a compressed count of 3, the counter framework
will iterate from index 0 to 2, causing a NULL pointer dereference on the
empty name at signals[2] and skipping the valid signal at signals[3].

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714081709.1784=
6-1-wafgo01@gmail.com?part=3D2
