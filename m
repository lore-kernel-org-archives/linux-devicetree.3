Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E83378D7B
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782681211; cv=none; b=Ly2sw7RzhrcQIQaaHlvw4vVE+GzTRL86cU6mEmtI0UsFXO0YQ8zy0HnConkSggdhmVuAfXGTzp7kIYwreQFFFWfY7NcNHD+CLR0rJqpmEvCZp9PQRne3y99spUQYtUy6t+gyGjnxx3FwjLNG+0QuqydkZ9xc6sV9XBDSXkQyYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782681211; c=relaxed/simple;
	bh=0ITZXD2qGoTbnVzKEcTdqTzDrOE6MN5FXNndW3Y4AJY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uyg0CLuKMwv7k+XYl2qZ+0eUJ8PP+20ePT0y+eV0ZJNC0xAQye24oEvZfp7owI6mtyzVf0JY0AMwX951dSAN3nY7NTQkpxzSPWXvY7wlVxUv84KAMG8AWt7ym2qx1z+WPaaVDdKzY+UwSX8nfHMKQHpogXvUBQidpuXICJEq1eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzFvxgUW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzFvxgUW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3A31F000E9;
	Sun, 28 Jun 2026 21:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782681210;
	bh=y6ryoKP8Hl7VD6YWa2B+y05VkvgktHJxo49p8E7UkKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nzFvxgUWD9Nnglh3m2RVeTvde1cGMEucHckDPB/Ahhdp847VlFW/jvOBANVN+znFN
	 N2RgdCLpVz8Genq0HZv0t9Q01nhKJ6Y+ibvB26xWeAnbGs3EBjIWPP1R8pIuNlie6I
	 n3S17NZntfokSsrLc6nrdJqXvgvaowm76uLxSbHuh1Nke9fSb/qhbRPRK9HvB2NOhe
	 0C5D3hyatO1d4TWx0rw7ih9aTazvxcHNgfmzZ5A4NYP7XYaua9w5H3DY+mmNRycnGi
	 68enrMXQznKrCEG/Mld3q55qPmKo9LGEN7J2s6RJe6rkkacT76Cw7mnu4TV6BT4dcY
	 cCm5wN9HR4ozg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] counter: add GPIO-based counter driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628210241.119825-3-wafgo01@gmail.com>
References: <20260628210241.119825-1-wafgo01@gmail.com>
 <20260628210241.119825-3-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 21:13:29 +0000
Message-Id: <20260628211330.0F3A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing direction state update on enable for PULSE_DIRECTION mode.
- [High] Reading GPIO pin states outside the spinlock in the ISRs allows ou=
t-of-order state evaluation, leading to spurious counter steps.
- [Medium] Enabling a count overwrites shared quadrature state, corrupting =
the active state machine of the other running count.
--

commit 002c8f1bc700b17784c2bbc34b75aada303eee61
Author: Wadim Mueller <wafgo01@gmail.com>

counter: add GPIO-based counter driver

This adds a platform driver to decode plain GPIOs into a counter device,
supporting quadrature, pulse-direction, and increase/decrease modes.

> diff --git a/drivers/counter/gpio-counter.c b/drivers/counter/gpio-counte=
r.c
> new file mode 100644
> index 0000000000000..8d9fa0b616d5c
> --- /dev/null
> +++ b/drivers/counter/gpio-counter.c

[ ... ]

> +static irqreturn_t gpio_counter_a_isr(int irq, void *dev_id)
> +{
> +	struct counter_device *counter =3D dev_id;
> +	struct gpio_counter_priv *priv =3D counter_priv(counter);
> +	struct gpio_counter_count_priv *cp =3D
> +		&priv->count_priv[GPIO_COUNTER_COUNT_1];
> +	unsigned long flags;
> +	bool enabled;
> +	int a, b;
> +
> +	/* !! drops negative gpiod_get_value() errors. */
> +	a =3D !!gpiod_get_value(priv->gpio_a);
> +	b =3D !!gpiod_get_value(priv->gpio_b);
> +
> +	spin_lock_irqsave(&priv->lock, flags);

[Severity: High]
Does reading the GPIO pin states outside the spinlock here and in
gpio_counter_b_isr() create a data race that allows out-of-order state
evaluation?

If high-frequency edges on A and B pins trigger interrupts that are serviced
concurrently on different CPUs, CPU 0 could read the states locklessly, get
preempted, and then apply a stale state after CPU 1 has already acquired the
lock and updated it. This could rewind the Gray-code state machine and
generate spurious backward steps or drop valid transitions.

Would moving the gpiod_get_value() reads inside the lock ensure late-arrivi=
ng
ISRs read the most current state and safely drop redundant edges?

[ ... ]

> +static irqreturn_t gpio_counter_b_isr(int irq, void *dev_id)
> +{
> +	struct counter_device *counter =3D dev_id;
> +	struct gpio_counter_priv *priv =3D counter_priv(counter);
> +	struct gpio_counter_count_priv *c1 =3D
> +		&priv->count_priv[GPIO_COUNTER_COUNT_1];
> +	struct gpio_counter_count_priv *c2 =3D
> +		&priv->count_priv[GPIO_COUNTER_COUNT_2];
> +	bool c1_enabled, c2_enabled;
> +	unsigned long flags;
> +	int a, b;
> +
> +	a =3D !!gpiod_get_value(priv->gpio_a);
> +	b =3D !!gpiod_get_value(priv->gpio_b);
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +
> +	c1_enabled =3D c1->enabled;
> +	c2_enabled =3D c2->enabled;
> +
> +	/* Count 1: A+B decoding on this B edge */
> +	if (c1_enabled) {
> +		switch (c1->function) {
> +		case COUNTER_FUNCTION_QUADRATURE_X4:
> +		case COUNTER_FUNCTION_QUADRATURE_X2_B:
> +		case COUNTER_FUNCTION_QUADRATURE_X1_B:
> +			if (!GPIO_COUNTER_STATE_CHANGED(priv->prev_a,
> +							priv->prev_b, a, b))
> +				break;
> +			c1->direction =3D
> +				GPIO_COUNTER_GET_DIRECTION(priv->prev_b, a);
> +			if (c1->function =3D=3D COUNTER_FUNCTION_QUADRATURE_X1_B)
> +				gpio_counter_quadrature_x1_step(c1, b);
> +			else
> +				gpio_counter_value_step(c1);
> +			break;
> +
> +		case COUNTER_FUNCTION_PULSE_DIRECTION:
> +			/* B is the direction line */
> +			c1->direction =3D b ? COUNTER_COUNT_DIRECTION_BACKWARD
> +					  : COUNTER_COUNT_DIRECTION_FORWARD;
> +			break;

[Severity: High]
Is a direction state update missing on enable for PULSE_DIRECTION mode?

Since the direction is only updated here when the count is enabled, any B p=
in
toggles that happen while the counter is disabled are not tracked. When the
counter is subsequently enabled, gpio_counter_enable_write() does not
synchronize cp->direction with the current B pin level.

Could this cause the counter to step in the wrong direction until the B pin
toggles again?

[ ... ]

> +static int gpio_counter_enable_write(struct counter_device *counter,
> +				     struct counter_count *count, u8 enable)
> +{
> +	struct gpio_counter_priv *priv =3D counter_priv(counter);
> +	struct gpio_counter_count_priv *cp =3D &priv->count_priv[count->id];
> +	unsigned long flags;
> +	bool current_state;
> +
> +	guard(mutex)(&priv->enable_lock);
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	current_state =3D cp->enabled;
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	if (current_state =3D=3D enable)
> +		return 0;
> +
> +	/* disable_irq() may sleep, so it can not run under the spinlock. */
> +	if (enable) {
> +		spin_lock_irqsave(&priv->lock, flags);
> +		priv->prev_a =3D !!gpiod_get_value(priv->gpio_a);
> +		priv->prev_b =3D !!gpiod_get_value(priv->gpio_b);

[Severity: Medium]
Does enabling a count unconditionally overwrite the shared quadrature state,
corrupting the active state machine of the other running count?

Because priv->prev_a and priv->prev_b are updated here whenever any count is
enabled, enabling Count 2 while Count 1 is actively running will overwrite
Count 1's state tracker.

If an edge interrupt was pending for Count 1, its ISR might observe no state
change and incorrectly drop the step.

> +		cp->enabled =3D true;
> +		spin_unlock_irqrestore(&priv->lock, flags);
> +		gpio_counter_enable_irqs(priv, count->id);
> +	} else {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628210241.1198=
25-1-wafgo01@gmail.com?part=3D2
