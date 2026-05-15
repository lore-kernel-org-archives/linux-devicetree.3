Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1063F86E5
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861669; cv=none; b=jDMEJtCCNUi631nxYCwBMXgxJpluGLMETnpI6LwMHEcYvF0/Mf7WXMIJC5vem3VUbVbt+ONESxbtHtFIcn880BNN3VLAqo4An/z9A6ro1KijET4KeoIbO6ToXwwfmoPUeAXT42OBkkVDQFXzC7KZFhO5tK8ObMSUsnM9sax6V8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861669; c=relaxed/simple;
	bh=WBaF7H0AgSiaIkeYN/WcAi5XPkVo8ibQxwttT6O+2nw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ebkx9GEEA9syji6tYgh1xvHdwme56YaCYH/klph7bAJ52HTkNQexgqpSd+hT9lJRpkHdCCVwsCmhw5IcLFmJQv98GgpUgwHmY1Y32f4+4VnpCWAPHFyJu0bNlsZFv2mpMHR4CH0ajwu4J/07xg89xMJJTsQrptVjxQULmG30RPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tn5CkTor; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tn5CkTor"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8311CC2BCB0;
	Fri, 15 May 2026 16:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778861669;
	bh=WBaF7H0AgSiaIkeYN/WcAi5XPkVo8ibQxwttT6O+2nw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=tn5CkTorXdch7mgE9flc26qWLImLjXpvoOgL4TKJTqjbnhE9114XxwjAPwNUWtujc
	 Bi68ZtAps03xsFMYBeH/xfWFBNZooDVKYdkPGtCE2X5sA7cqHcm3iK7gFIWo3+J/mJ
	 bsIkVXHxd8ERPylxd1s1CS3ZqabKlh71KJx0QDN0gsBKTWlo8r6wQZIZA+7Fohycwy
	 QBbo72uLNZSCfgSxHFFqf0ukfiPQJ+rPj9e7ZwdvAFN8tiCLr1ScQQtUtPvuOIgPC6
	 ONbfUdkQ/Pn5fA83oC6juLtyrLL4c17L0cmV819b2TWhmcYL5ErNuDdLci0pOL63nq
	 vHYf5eDzgP0sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] counter: add GPIO-based quadrature encoder
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515153616.157605-3-wafgo01@gmail.com>
References: <20260515153616.157605-3-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:14:28 +0000
Message-Id: <20260515161428.8311CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Out-of-bounds read due to unhandled negative error codes from gpio=
d_get_value()
- [High] Unbalanced IRQ enable/disable calls in sysfs write callback trigge=
r kernel warnings and break state
- [High] Counter can bypass its ceiling limit due to preset TOCTOU race and=
 incomplete limit enforcement
- [High] Sleeping inside atomic context if bound to sleepable GPIOs
- [Medium] Incorrect synapse action reported for X1 quadrature modes
- [Medium] Data races when reading function and direction in sysfs action r=
ead callback
- [Medium] Global IRQ state leak due to irq_set_status_flags()
--

commit 3a9bb860a232c16bc4e2617a18915383b18a1726
Author: Wadim Mueller <wafgo01@gmail.com>

counter: add GPIO-based quadrature encoder driver
   =20
Add a platform driver that turns ordinary GPIOs into a quadrature
encoder counter device.  The driver requests edge-triggered interrupts
on the A and B (and optional Index) GPIOs and decodes the quadrature
signal in software using a classic state-table approach.

> diff --git a/drivers/counter/gpio-quadrature-encoder.c b/drivers/counter/=
gpio-quadrature-encoder.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/counter/gpio-quadrature-encoder.c
> @@ -0,0 +1,739 @@

[ ... ]

> +static void gpio_qenc_update_count(struct gpio_qenc_priv *priv, int delt=
a)
> +{
> +	if (delta > 0) {
> +		priv->direction =3D COUNTER_COUNT_DIRECTION_FORWARD;
> +		if (priv->count =3D=3D priv->ceiling)
> +			return;
> +		priv->count++;

The ceiling enforcement relies on strict equality here. If priv->count
somehow becomes greater than priv->ceiling, will it bypass this check
and increment endlessly?

[ ... ]

> +static irqreturn_t gpio_qenc_a_isr(int irq, void *dev_id)
> +{
> +	struct counter_device *counter =3D dev_id;
> +	struct gpio_qenc_priv *priv =3D counter_priv(counter);
> +	unsigned long flags;
> +	int a, b, delta;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +
> +	a =3D gpiod_get_value(priv->gpio_a);
> +	b =3D gpiod_get_value(priv->gpio_b);

If the driver is bound to a GPIO controller on a sleepable bus (like an
I2C expander), gpiod_get_value() could sleep. Could this cause a
"scheduling while atomic" panic since it is called while holding a raw
spinlock? Should the driver check gpiod_cansleep() during probe and
reject sleepable pins, or use threaded interrupts instead?

Additionally, gpiod_get_value() can return a negative error code (like
-EINVAL). If that happens, wouldn't these negative values be passed
directly into CREATE_QE_STATE() and used to index the
gpio_qenc_quad_x4_table array? Does this allow an out-of-bounds memory
read?

[ ... ]

> +static int gpio_qenc_action_read(struct counter_device *counter,
> +				 struct counter_count *count,
> +				 struct counter_synapse *synapse,
> +				 enum counter_synapse_action *action)
> +{
> +	struct gpio_qenc_priv *priv =3D counter_priv(counter);
> +	enum gpio_qenc_signal_id signal_id =3D synapse->signal->id;
> +
> +	/* Index synapse always observes rising edges, regardless of mode. */
> +	if (signal_id =3D=3D GPIO_QENC_SIGNAL_INDEX) {
> +		*action =3D COUNTER_SYNAPSE_ACTION_RISING_EDGE;
> +		return 0;
> +	}
> +
> +	*action =3D COUNTER_SYNAPSE_ACTION_NONE;
> +
> +	switch (priv->function) {

Both priv->function and priv->direction are accessed here without holding
priv->lock. Since these can be modified concurrently via sysfs or hardirq
handlers, could this lead to a data race that returns momentarily stale
or inconsistent synapse actions to userspace?

> +	case COUNTER_FUNCTION_QUADRATURE_X4:
> +		*action =3D COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
> +		break;
> +
> +	case COUNTER_FUNCTION_QUADRATURE_X2_A:
> +		if (signal_id =3D=3D GPIO_QENC_SIGNAL_A)
> +			*action =3D COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
> +		break;

[ ... ]

> +	case COUNTER_FUNCTION_QUADRATURE_X1_A:
> +		if (signal_id =3D=3D GPIO_QENC_SIGNAL_A) {
> +			if (priv->direction =3D=3D COUNTER_COUNT_DIRECTION_FORWARD)
> +				*action =3D COUNTER_SYNAPSE_ACTION_RISING_EDGE;
> +			else
> +				*action =3D COUNTER_SYNAPSE_ACTION_FALLING_EDGE;
> +		}
> +		break;

The driver's actual counting logic in gpio_qenc_a_delta() only evaluates
counts on the rising edge of the active signal (!prev_a && a), regardless
of the counting direction.=20

Since the synapse action API describes the physical signal edge that trigge=
rs
evaluation, does returning FALLING_EDGE misrepresent the hardware logic to
userspace?

[ ... ]

> +static int gpio_qenc_enable_write(struct counter_device *counter,
> +				  struct counter_count *count, u8 enable)
> +{
> +	struct gpio_qenc_priv *priv =3D counter_priv(counter);
> +
> +	if (enable) {
> +		enable_irq(priv->irq_a);
> +		enable_irq(priv->irq_b);
> +		if (priv->irq_index)
> +			enable_irq(priv->irq_index);
> +		return 0;
> +	}
> +
> +	disable_irq(priv->irq_a);

The sysfs core does not filter duplicate writes. If a user writes '1' to
the enable attribute when the counter is already enabled, will this invoke
enable_irq() while the IRQ depth is 0 and trigger an "Unbalanced enable for
IRQ" kernel warning?

Conversely, if '0' is written multiple times, will it increment the core IRQ
descriptor's disable depth indefinitely, preventing a single write of '1'
from re-enabling the interrupts?

[ ... ]

> +static int gpio_qenc_preset_write(struct counter_device *counter,
> +				  struct counter_count *count, u64 val)
> +{
> +	struct gpio_qenc_priv *priv =3D counter_priv(counter);
> +	unsigned long flags;
> +
> +	if (val > priv->ceiling)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	priv->preset =3D val;
> +	spin_unlock_irqrestore(&priv->lock, flags);

Is there a race condition here? Since val > priv->ceiling is checked
outside the spinlock, could a concurrent ceiling_write lower the ceiling
before the preset is saved?

If the preset ends up greater than the ceiling, and a hardware index pulse
unconditionally sets count =3D preset, does this allow the counter to go
out-of-bounds and bypass the strict equality check in
gpio_qenc_update_count()?

[ ... ]

> +static int gpio_qenc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;

[ ... ]

> +	irq_set_status_flags(priv->irq_a, IRQ_NOAUTOEN);
> +	ret =3D devm_request_irq(dev, priv->irq_a, gpio_qenc_a_isr,
> +			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
> +			       "gpio-qenc-a", counter);

irq_set_status_flags() modifies global IRQ descriptor flags. Because these
flags aren't cleared on driver unbind, does this leak the state?=20

If another device later requests this IRQ line, will it unexpectedly inherit
the IRQ_NOAUTOEN behavior? Should the IRQF_NO_AUTOEN flag be passed
directly into devm_request_irq() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515153616.1576=
05-1-wafgo01@gmail.com?part=3D2
