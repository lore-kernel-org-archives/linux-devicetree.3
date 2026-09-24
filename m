Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F80B440A0A
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240247; cv=none; b=lAmiTZQ1zkR0KlleoZpyAKp9+5mdFEUlm0O8is2WWs21xpu8NkIALQSNi8TYHv3VphEk0eIEjKMjqIZx0CCGDpYpLNt2KjqYpcKtgcBAkJDX+1bZJ1RkOq+VqcFSNVcKuZNYkzkx8fxhyLK3bP4bibSn88hdK/rxfV50puxq+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240247; c=relaxed/simple;
	bh=vrFUvlPmYSN3VIwmMFNIxD2D2Otj9dlAIfJt0VAtfv8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jyk99XOFB4+NmNuiUKJmQfTI6JFnNfn885DNKi12t6f6eGgelMYkKMvMyvdhRSycidNFhEEUm9EC7tZ2gWOuG43azXL6rjEP0rzOf39NOi/CM9XztGp2qiV4W+Yz5wQLYSegHOpf46qcQknIauiOMmLkzCc5AHXcpNzoOzizM74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwK47Vik; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwK47Vik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B6D1F000FF;
	Thu, 24 Sep 2026 08:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790240242;
	bh=d+lUKO/GPiQzIP+7rP9y+iiyzmlx1rNa1ItnGwxtTjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CwK47VikGtgwMmSwIZ4dfHir+YGAJxV/ixgizFipluVaG/JNoZmLUjE7gmNRVXkaY
	 7Pc4Up47KslJWIWRsOEHa7ybrqjxWVBFeTPr9thK9LJU7ELIbdtVvUwN6hYes8zf3u
	 sLlh8CvTQxEnW985zmmKWaiGeOjTMtMokaXYw31TyvVxXH8alCzF3qWmurHykC6coP
	 KTuPhz0JZ1146o1a1Bb7+u3wMSnDLgM/lLcLSCa5Ptv6d6zOqk7YQ+XEd1lmJY6eJ6
	 SHbstq6xJ2kUHqDn1jidtt52ANPvJtoXdNDXzXcZoRHP0VfA4PgxzvVI89jPItc3ki
	 7td3xgol0anLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] i2c: amlogic: Add Amlogic A9 I2C controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924-a9-i2c-v1-2-b8ad9b46f4a8@amlogic.com>
References: <20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com>
 <20260924-a9-i2c-v1-2-b8ad9b46f4a8@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 08:57:21 +0000
Message-Id: <20260924085722.59B6D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] i2c: amlogic: hardware registers accessed before clock is enabled
- [High] i2c: amlogic: race condition drops completion interrupts
- [High] i2c: amlogic: silent truncation of large transfers
- [High] i2c: amlogic: broken Repeated START for subsequent transfers
- [High] i2c: amlogic: data race on REG_CGF_IRQ_ENABLE
- [High] i2c: amlogic: IRQ storm on transfer timeout
- [High] i2c: amlogic: race in lockless state initialization
- [Medium] i2c: amlogic: crash due to early clock disable in remove
--

commit 5e779e1911cc216efb8179fa9e2910973c79bb74
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver
   =20
Add support for the new I2C controller used by Amlogic A9 SoCs.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-amlogic-a9.c

[ ... ]

> +static irqreturn_t aml_i2c_irq(int irqno, void *dev_id)
> +{
> +	struct aml_i2c *i2c =3D dev_id;
> +	int ret;
> +	u32 rd_len, i;
> +	u32 rd_val;
> +
> +	spin_lock(&i2c->lock);
> +	ret =3D controller_is_error(i2c);
> +	if (ret) {
> +		i2c->error =3D ret;
> +		goto complete_irq_out;
> +	}
> +
> +	switch (i2c->state) {
> +	case STATE_READ:

[ ... ]

> +	case STATE_WRITE:

[ ... ]

> +	case STATE_IDLE:
> +		dev_warn(i2c->dev, "i2c irq triggered abnormally!!!, irq_state:0x%x,ir=
q_en:0x%x\n",
> +			 readl(i2c->regs + REG_CGF_IRQ_STATE),
> +			 readl(i2c->regs + REG_CGF_IRQ_ENABLE));
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!controller_is_done(i2c)) {
> +		goto irq_trans_out;
> +	} else {

[Severity: High]
Could an unhandled interrupt cause an infinite IRQ storm and CPU lockup her=
e?
When a transfer times out, aml_i2c_xfer_msg() resets the state to STATE_IDLE
but doesn't appear to disable the hardware threshold interrupts. If the
delayed interrupt fires, this handler logs a warning and returns IRQ_HANDLED
without clearing the interrupt source.

[ ... ]

> +static void aml_i2c_do_start(struct aml_i2c *i2c, struct i2c_msg *msg)
> +{
> +	unsigned int reg_val;
> +	unsigned int trans_len;
> +
> +	trans_len =3D msg->len;
> +	reg_val =3D (unsigned int)((msg->addr << 1) |
> +				((msg->flags & I2C_M_RD) ? START_READ : 0) |
> +				((trans_len & 0xfff) << 12) | START_START);

[Severity: High]
Does this silently truncate I2C message lengths greater than 4095 bytes?
The length is masked with 0xfff without returning an error to the caller,
which could result in silent data corruption for large transfers.

> +	aml_i2c_set_mask(i2c, REG_CFG_START,
> +			 START_START | START_SLAVE_ADDR | START_READ | START_LEN, reg_val);
> +	clear_irq_status(i2c, IRQ_ALL_MASK);

[Severity: High]
Could clear_irq_status() inadvertently drop a valid completion interrupt?
If the hardware responds extremely fast (for example, generating a NACK on
the address byte) immediately after START_START is written, the completion
interrupt might get cleared before the handler has a chance to run, causing
the transfer to spuriously time out.

> +	/* enable thresh mode */
> +	if (trans_len > A9_I2C_FIFO_DEPTH) {
> +		reg_val =3D (msg->flags & I2C_M_RD) ? A9_RX_THRESH_READ : A9_TX_THRESH=
_WRITE;
> +		aml_i2c_set_mask(i2c, REG_CGF_IRQ_ENABLE,
> +				 A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, reg_val);

[Severity: High]
Is it safe to perform a read-modify-write on REG_CGF_IRQ_ENABLE here without
holding i2c->lock? If a hardware interrupt asserts immediately after the
transfer starts, a concurrent aml_i2c_irq() running on another CPU might
also modify REG_CGF_IRQ_ENABLE, causing a data race that loses updates.

> +	}
> +}
> +
> +static int aml_i2c_xfer_msg(struct aml_i2c *i2c, struct i2c_msg *msg, bo=
ol last)
> +{
> +	unsigned long time_left, flags;
> +	int ret =3D 0;
> +
> +	i2c->msg =3D msg;
> +	i2c->pos =3D 0;
> +	i2c->count =3D 0;
> +	i2c->error =3D 0;
> +
> +	i2c->state =3D (msg->flags & I2C_M_RD) ? STATE_READ : STATE_WRITE;
> +	aml_i2c_prepare_xfer(i2c, FIFO_FILL_FULL);
> +	i2c->pos +=3D i2c->count;
> +	reinit_completion(&i2c->done);

[Severity: High]
Are these transfer state variables reinitialized without holding i2c->lock?
If a delayed interrupt from a previous timed-out transfer fires concurrentl=
y,
it might read this inconsistent state or falsely complete this new transfer,
potentially causing memory corruption or an invalid state machine transitio=
n.

> +
> +	if (last)
> +		aml_i2c_add_stop(i2c);

[Severity: High]
While this clears the BUS_NO_STOP bit for the final message in a transfer,
is there missing logic to restore it to 1 for non-last messages in new
transfers? Without setting it back, subsequent multi-message transfers might
incorrectly emit a STOP between messages, causing devices requiring Repeated
START to fail.

> +	/* Start the transfer */
> +	aml_i2c_do_start(i2c, msg);
> +
> +	time_left =3D msecs_to_jiffies(I2C_TIMEOUT_MS);
> +	time_left =3D wait_for_completion_timeout(&i2c->done, time_left);
> +
> +	/*
> +	 * Protect access to i2c struct and registers from interrupt
> +	 * handlers triggered by a transfer terminated after the
> +	 * timeout period
> +	 */
> +	spin_lock_irqsave(&i2c->lock, flags);
> +
> +	if (!time_left) {
> +		i2c->state =3D STATE_IDLE;
> +		clear_irq_status(i2c, IRQ_ALL_MASK);
> +		reset_fifo_pos(i2c);
> +		ret =3D -ETIMEDOUT;
> +	}

[Severity: High]
When a transfer times out, is it necessary to also disable the hardware
interrupts in REG_CGF_IRQ_ENABLE? As currently written, the hardware might
still assert a delayed interrupt once this function returns.

[ ... ]

> +static int aml_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct aml_i2c *i2c;
> +	struct i2c_timings timings;
> +	int irq, ret;

[ ... ]

> +	i2c->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(i2c->clk)) {
> +		dev_err(&pdev->dev, "can't get device clock\n");
> +		return PTR_ERR(i2c->clk);
> +	}
> +
> +	i2c->clk_rate =3D clk_get_rate(i2c->clk);
> +	if (i2c->clk_rate =3D=3D 0) {
> +		dev_err(&pdev->dev, "failed to get clk rate\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D aml_i2c_init(i2c);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "fail init i2c\n");
> +		return ret;
> +	}

[Severity: High]
Does aml_i2c_init() attempt to write to hardware registers before the clock
is enabled? clk_prepare_enable() appears to be called further down in this
function. Accessing unclocked registers could trigger a synchronous external
abort on ARM and crash the system.

> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "can't find IRQ\n");
> +		return irq;
> +	}
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, aml_i2c_irq, 0, dev_name(&pde=
v->dev), i2c);

[Severity: Medium]
Since the interrupt is requested using devres here, it will remain active
until the devres cleanup runs after aml_i2c_remove() returns. Could this
leave a vulnerable window during removal where a spurious interrupt might
attempt to read hardware registers after the clock has been disabled?

> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "can't request IRQ\n");
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(i2c->clk);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "can't prepare clock\n");
> +		return ret;
> +	}
> +
> +	strscpy(i2c->adap.name, "Amlogic I2C adapter",
> +		sizeof(i2c->adap.name));
> +	i2c->adap.owner =3D THIS_MODULE;
> +	i2c->adap.algo =3D &aml_i2c_algorithm;
> +	i2c->adap.dev.parent =3D &pdev->dev;
> +	i2c->adap.dev.of_node =3D np;
> +	i2c->adap.algo_data =3D i2c;
> +
> +	ret =3D i2c_add_adapter(&i2c->adap);

[Severity: High]
Could the silent truncation of large transfers observed in aml_i2c_do_start=
()
be avoided by setting the quirks pointer on i2c->adap here? Populating the
quirks would allow the I2C core to properly enforce the 4095-byte hardware
limit and return an error to the caller natively.

[ ... ]

> +static void aml_i2c_remove(struct platform_device *pdev)
> +{
> +	struct aml_i2c *i2c =3D platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&i2c->adap);
> +	clk_disable_unprepare(i2c->clk);
> +}

[Severity: Medium]
Is the clock being manually disabled here before the interrupt handler is
cleaned up? As mentioned in aml_i2c_probe(), the devm-managed IRQ is still
active at this point. A spurious interrupt arriving after this line could
crash the system by accessing unclocked registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-a9-i2c-v1-=
0-b8ad9b46f4a8@amlogic.com?part=3D2
