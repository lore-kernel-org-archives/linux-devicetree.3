Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED90330149F
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 20:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779653677; cv=none; b=UFLWtu4e7ZW6TJN2jhbw6hqdMbqD+OSOSvseahIBUUjqJdvAPO71SkTuREP8kICqYEb7lg8enL8mU1MZAT4/Kje5uif9QmWf8NMsQFRcgQx5UzdoYf1MZ7LiqDsey3pv9lEAGii5/TxLMpjRiGtSZ6C29Q5Wu/E8WoQrAjmfEo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779653677; c=relaxed/simple;
	bh=lMtnUgO+5+QrMxUSBmO16IeF4VQLa4lCd9LIOTA1KBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SsZRAmMr2uK4ZMv5xzzmO2zrbdO4sk7Di6VEGW6lj8HlmGwJT6RLDBl3KqUOc242ReDtK56JUPab/8CmRKlMnHfw9r4D/Z02JnEP+DEHwzwBvebyS9eIU3AgWWn/jlbL+BAlCgGzmMS64qIYZN0V1Cz8GUUBFGj2Untny4hqJFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akwAoa7z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akwAoa7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6721F00A3A;
	Sun, 24 May 2026 20:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779653675;
	bh=5eckRXvwfwNx/O/cTdLIztqbYLlmvRQd+M+DQ5RxHF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=akwAoa7zdNOrNKv7M4hG/n7dnmFlZx0b4rsnQzGZARxDpxn/QfQymrtQcSGPVqweG
	 OxkNC6UAmqasq9UBpCo+nXpdlf9T+w1nb4f34WDRzhTKhChEAdJVtkJam5GafRV5H7
	 ifug2wlrbvSbDm8sOgcyvKF1kO1pQM/sk7xlhkw42kdqCA8O+ScGBEwtUhVJC2af9M
	 GSai27LecrHAySg48kbfAUyyWV5fCQfGpmOw4w0yvHgcQ+lzK3njlznfCXvRmzUcxi
	 zZoHn8QtqA5LFk0NgEhoIisvVm3k5U4sAGMjmamwiUWS/V2TBV7wSmRTcv+7lSpH1a
	 prGCN6Y05+3pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] counter: add GPIO-based counter driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260524193846.19216-3-wafgo01@gmail.com>
References: <20260524193846.19216-3-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 20:14:35 +0000
Message-Id: <20260524201435.AD6721F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Concurrent sysfs writes to the 'enable' attribute cause unbalanced=
 IRQ enables and desynchronize the hardware state.
- [High] The Quadrature X1_A and X1_B modes are fundamentally broken and fo=
rm a directional feedback loop, failing to decode direction.
- [High] GPIO states are sampled outside the spinlock in ISRs, causing stat=
e machine desynchronization under rapid concurrent edges.
- [Medium] Negative error codes from gpiod_get_value() are masked and incor=
rectly converted into logical HIGH states.
- [Medium] The counter saturates at bounds instead of wrapping around, viol=
ating Counter subsystem `ceiling` semantics.
- [Medium] The previous GPIO states are not synchronized when the counter i=
s re-enabled, causing missed edges or spurious counts.
- [Medium] The Quadrature X2_A and X2_B modes do not verify if the triggeri=
ng signal actually changed state, leading to false counts on noisy lines.
--

commit 9297ee567bedc28c8a463a9a4d24d31a9d00cc62
Author: Wadim Mueller <wafgo01@gmail.com>

counter: add GPIO-based counter driver

Add a platform driver that turns plain GPIOs into a counter device.
Edge interrupts on the signal-a, signal-b (and optional index) lines
are decoded in software using a 2-bit Gray-code parity trick for the
quadrature X4 mode and direct edge checks for the other modes.

> diff --git a/drivers/counter/gpio-counter.c b/drivers/counter/gpio-counte=
r.c
> new file mode 100644
> index 0000000000000..f50cec33ae366
> --- /dev/null
> +++ b/drivers/counter/gpio-counter.c
[ ... ]
> +static void gpio_counter_update(struct gpio_counter_priv *priv, int delt=
a)
> +{
> +	if (delta > 0) {
> +		priv->direction =3D COUNTER_COUNT_DIRECTION_FORWARD;
> +		if (priv->count >=3D priv->ceiling)
> +			return;
> +		priv->count++;
> +	} else if (delta < 0) {
> +		priv->direction =3D COUNTER_COUNT_DIRECTION_BACKWARD;
> +		if (priv->count =3D=3D 0)
> +			return;
> +		priv->count--;
> +	}
> +}

[Severity: Medium]
Will saturating the counter at its limits break compatibility with the Coun=
ter
subsystem semantics?

The Counter ABI defines 'ceiling' as a wraparound limit for cyclic counters,
where counting past the ceiling wraps to 0, and counting below 0 wraps to t=
he
ceiling. Saturating at the limits might cause issues for userspace
applications relying on cyclic tracking.

[ ... ]
> +static int gpio_counter_a_delta(struct gpio_counter_priv *priv, int a, i=
nt b,
> +				int prev_a, int prev_b)
> +{
> +	enum counter_count_direction dir;
> +
> +	switch (priv->function) {
> +	case COUNTER_FUNCTION_QUADRATURE_X4:
> +		if (!GPIO_COUNTER_STATE_CHANGED(prev_a, prev_b, a, b))
> +			return 0;
> +		dir =3D GPIO_COUNTER_GET_DIRECTION(prev_b, a);
> +		return (dir =3D=3D COUNTER_COUNT_DIRECTION_FORWARD) ? 1 : -1;
> +
> +	case COUNTER_FUNCTION_QUADRATURE_X2_A:
> +		return (a =3D=3D b) ? -1 : 1;

[Severity: Medium]
How does the X2_A mode handle noisy lines or contact bounce?

Unlike the X4 mode which checks for a state change, this mode unconditional=
ly
returns 1 or -1 based on (a =3D=3D b). If the signal line bounces, causing =
the ISR
to fire twice for the same logical state (where a =3D=3D prev_a), it appear=
s the
ISR will incorrectly register an additional count in the same direction.

Should there be a check to verify that the interrupted signal has actually
toggled?

> +
> +	case COUNTER_FUNCTION_QUADRATURE_X1_A:
> +		if (a && priv->direction =3D=3D COUNTER_COUNT_DIRECTION_FORWARD)
> +			return 1;
> +		if (!a && priv->direction =3D=3D COUNTER_COUNT_DIRECTION_BACKWARD)
> +			return -1;
> +		return 0;

[Severity: High]
Is it possible for the X1_A and X1_B modes to correctly decode direction?

The logic relies on checking the state against priv->direction. Since
priv->direction is initialized to forward, and only flips to backward if
delta < 0, but delta can only be < 0 if the direction is already backward,
this looks like a positive feedback loop. It seems the counter will only
ever count upward.

Should the state of the opposite phase signal be used to determine direction
instead?

[ ... ]
> +static irqreturn_t gpio_counter_a_isr(int irq, void *dev_id)
> +{
> +	struct counter_device *counter =3D dev_id;
> +	struct gpio_counter_priv *priv =3D counter_priv(counter);
> +	unsigned long flags;
> +	int a, b, delta;
> +
> +	/* !! normalises away negative gpiod_get_value() errors. */
> +	a =3D !!gpiod_get_value(priv->gpio_a);

[Severity: Medium]
What happens if gpiod_get_value() returns a negative error code?

The comment explicitly states this normalizes away errors, but treating
hardware read failures (like -EINVAL) as valid logical HIGH states could
inject phantom edges into the quadrature decoder, corrupting the absolute
count value.

Should the ISR explicitly check for negative returns and exit instead of
masking the error?

> +	b =3D !!gpiod_get_value(priv->gpio_b);
> +
> +	spin_lock_irqsave(&priv->lock, flags);

[Severity: High]
If A and B edges occur in quick succession on an SMP system, could different
CPUs handle the interrupts concurrently and sample the GPIOs out-of-order
relative to when they acquire the spinlock?

This could cause the internal software state machine to evaluate transitions
that are out of sequence with the actual hardware, leading to missed counts=
 or
interpreting forward motion as backwards counting.

Since these are non-sleeping GPIOs, should the reads be moved inside the lo=
ck
to ensure atomic transition evaluation?

[ ... ]
> +static int gpio_counter_enable_write(struct counter_device *counter,
> +				     struct counter_count *count, u8 enable)
> +{
> +	struct gpio_counter_priv *priv =3D counter_priv(counter);
> +	unsigned long flags;
> +	bool want =3D enable;
> +	bool changed;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	changed =3D priv->enabled !=3D want;
> +	if (changed)
> +		priv->enabled =3D want;
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	if (!changed)
> +		return 0;
> +
> +	if (want) {
> +		enable_irq(priv->irq_a);

[Severity: High]
If two threads write to the 'enable' attribute concurrently, could the
hardware toggles be reordered relative to the lock acquisitions?

Thread A writes 0 and Thread B writes 1. Both check the state under the loc=
k,
but Thread B could call enable_irq() before Thread A calls disable_irq(). T=
his
would trigger an 'Unbalanced enable for IRQ' warning since enable_irq() is
called on an already-enabled IRQ.

Should the physical enable_irq() and disable_irq() calls be moved inside the
spinlock, or should another synchronization mechanism be used to prevent th=
is
race?

[Severity: Medium]
Are the previous GPIO states synchronized when the counter is re-enabled?

priv->prev_a and priv->prev_b are initialized during probe(). If the hardwa=
re
moves while the counter is disabled, the first edge interrupt after re-enab=
ling
will compare the new GPIO levels against stale 'prev' states. This could le=
ad
to misinterpreting the first transition, resulting in false direction
evaluations or dropped counts.

Should priv->prev_a and priv->prev_b be sampled and updated inside this
function before enabling the IRQs?

> +		enable_irq(priv->irq_b);
> +		if (priv->irq_index)
> +			enable_irq(priv->irq_index);
> +	} else {
> +		disable_irq(priv->irq_a);
> +		disable_irq(priv->irq_b);
> +		if (priv->irq_index)
> +			disable_irq(priv->irq_index);
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524193846.1921=
6-1-wafgo01@gmail.com?part=3D2
