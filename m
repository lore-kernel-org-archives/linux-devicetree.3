Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA23D8127
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009792; cv=none; b=I96VwnpicBm5gpEapYaHtNiSicLRecwctdF2Eziaxz3QxbQsDFfl2NYCFZ4Dgr2jHroMSB2EC5Ebr2t9yKn/yojQJ5QwuLSLwyRKsEVLcVaufkrOL32nuuz+BTDbn0JJAvd3GQn7QRz5iz9QsR8SuQhyPA7mHQwTlHYbDXw8wBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009792; c=relaxed/simple;
	bh=8dK7Kw0jNtBfAlqeGGoI/73U/Vc8JSupJIjmWeORKcc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A2uGmdihqqNTWxdzRpYQ6Suede966cjheJ3eBpnGGZgOCitdF9nSBaB55RbWUEtIck595Xr2wH2T5GtG0OrFI32zipwx3Hljz0fUrQJmnAD3cnNaLrqtIO6dCC3s5MZkOsv8cQEUMT2PaY2qdflAljqgwf9FW33TyqiYo2I8Yyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0ZMPccN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0ZMPccN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B75A1F00A3A;
	Thu,  6 Aug 2026 09:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009790;
	bh=lcqC4czlqK3GBy1hGWJ3ifpK/dmDF90dUGhI+S3HGtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D0ZMPccNC/hlpwnfs9SMcv3X9w1PwesXGzpFRYRaAj8gbxR7Z/RqzJn0UiFe8+S5n
	 cYd8elz++Oy3DS0dz4/rTq9VAy7cOfDwSw0Qu6PYGo+GTYjr5ifw1AzvfLVUtPKg0o
	 I2JXjVjaiCVDwASW3L7rDYsMOWvlc0oA59A16jSDKa9bgxYbC4X08fFgMDEm5eKXRh
	 N1wEQuTvek61YWlrCzM1bu4ub4IrUu9+Znhef51ztxlNo8k+n+e99FxFI6LRF+TFiT
	 ksmrD4TXAdH00GNlurSTXXTQvspMvLbfS1u5O+9O7+zW0pPqcTl0V8Oh1hq1fUS9Xw
	 VBJj5N1FX+1ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/10] serial: ambarella: add Ambarella UART driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-8-6b09707c5fe9@ambarella.com>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-8-6b09707c5fe9@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:49:49 +0000
Message-Id: <20260806094950.3B75A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Incorrect assignment of TTY_OVERRUN to the character flag causes v=
alid data to be marked as an error and duplicates overrun reporting.
- [High] The wait_for_tx() function resets both the TX and RX FIFOs when re=
covering from a stuck TX path, destroying any pending incoming data.
- [High] The IRQ handler unconditionally returns IRQ_HANDLED even when no i=
nterrupt is pending, breaking the kernel's spurious interrupt detection.
- [High] The Interrupt Enable Register (IER) is modified without holding th=
e port lock after the IRQ handler is registered, creating a race condition.
- [High] Hardware state is modified in `serial_ambarella_resume` without ac=
quiring the port lock, causing races with concurrent console writes.
- [High] Missing in-use check on the global `ambarella_port` array during p=
robe allows multiple devices to overwrite the same port structure, leading =
to a Use-After-Free.
- [Medium] The AMBA_UART_RESET_FLAG is not cleared upon driver removal, pre=
venting hardware reset on subsequent driver binds.
- [Medium] The driver unconditionally writes flow control characters (`port=
->x_char`) to the TX FIFO without verifying if there is space.
- [Medium] The `write_atomic` console callback does not manage the DLAB bit=
, which corrupts the baud rate divisor and drops panic messages if it preem=
pts `set_termios`.
- [Low] `serial_ambarella_hw_deinit()` writes FIFO reset commands to the So=
ftware Reset Register (SRR) instead of the FIFO Control Register (FCR).
--

--- Patch [8]: [PATCH v2 08/10] serial: ambarella: add Ambarella UART drive=
r ---
commit 10ca0d13a0637a7d9bf6d4a3c052576253ff7922
Author: Long Zhao <longzhao@ambarella.com>

serial: ambarella: add Ambarella UART driver

This commit adds a new UART driver for Ambarella SoCs with console
support for early boot bring-up on CV75.

> diff --git a/drivers/tty/serial/ambarella_uart.c b/drivers/tty/serial/amb=
arella_uart.c
> new file mode 100644
> index 0000000000000..7356b242f0ef7
> --- /dev/null
> +++ b/drivers/tty/serial/ambarella_uart.c
[ ... ]
> +static inline void wait_for_tx(struct uart_port *port)
> +{
> +	u32 ls;
> +	int ret;
> +
> +	ret =3D readl_poll_timeout_atomic(port->membase + UART_LS_OFFSET, ls,
> +					ls & UART_LS_TEMT, 1,
> +					AMBARELLA_UART_TIMEOUT_US);
> +	if (likely(!ret))
> +		return;
> +
> +	/* Recover a stuck TX path so console/poll can continue. */
> +	writel_relaxed(UART_FC_RX_2_TO_FULL | UART_FC_TX_EMPTY |
> +			UART_FC_XMITR | UART_FC_RCVRR,
> +			port->membase + UART_FC_OFFSET);
> +	udelay(100);
> +	writel_relaxed(UART_FC_FIFOE | UART_FC_RX_2_TO_FULL |
> +			UART_FC_TX_EMPTY | UART_FC_XMITR |
> +			UART_FC_RCVRR,
> +			port->membase + UART_FC_OFFSET);
> +}

[Severity: High]
Does this unconditional write of UART_FC_RCVRR accidentally flush the RX FI=
FO
when recovering from a TX timeout?

If the polling loop times out due to hardware flow control blocking the
transmitter, this reset logic writes the receive reset bit alongside the
transmit reset. This forcefully flushes the RX FIFO and can drop incoming
serial data that is unrelated to the TX path timeout.

[ ... ]
> +static inline void serial_ambarella_receive_chars(struct uart_port *port,
> +						  u32 tmo)
> +{
[ ... ]
> +		if (unlikely(ls & (UART_LS_BI | UART_LS_PE |
> +					UART_LS_FE | UART_LS_OE))) {
[ ... ]
> +			if (ls & UART_LS_BI)
> +				flag =3D TTY_BREAK;
> +			else if (ls & UART_LS_FE)
> +				flag =3D TTY_FRAME;
> +			else if (ls & UART_LS_PE)
> +				flag =3D TTY_PARITY;
> +			else if (ls & UART_LS_OE)
> +				flag =3D TTY_OVERRUN;
> +
> +			if (ls & UART_LS_OE)
> +				pr_debug("%s: OVERFLOW\n", __func__);
> +		}
> +
> +		if (have_char) {
> +			if (uart_handle_sysrq_char(port, ch))
> +				goto ignore_char;
> +
> +			uart_insert_char(port, ls, UART_LS_OE, ch, flag);
> +		}

[Severity: High]
Could this overwrite the valid character flag with an error flag?

When the UART_LS_OE bit is set, the code sets flag to TTY_OVERRUN for the
current character. When this flag is passed to uart_insert_char(), the TTY
layer will treat this valid character as an overrun error and drop its data.

Since uart_insert_char() inherently handles inserting a separate overrun
marker, replacing the current character's flag appears to drop valid data.

[ ... ]
> +static void serial_ambarella_transmit_chars(struct uart_port *port)
> +{
> +	struct tty_port *tport =3D &port->state->port;
> +	int count;
> +
> +	if (port->x_char) {
> +		writel_relaxed(port->x_char, port->membase + UART_TH_OFFSET);
> +		port->icount.tx++;
> +		port->x_char =3D 0;
> +		return;
> +	}

[Severity: Medium]
Should this verify if the TX FIFO is full before writing the flow control
character?

When the TTY layer requests sending a flow control character like XON or
XOFF, the driver unconditionally writes x_char to UART_TH_OFFSET. If the
transmit FIFO happens to be full, this write could overflow the FIFO and
cause the flow control character to be lost or corrupt queued data.

[ ... ]
> +static irqreturn_t serial_ambarella_irq(int irq, void *dev_id)
> +{
> +	struct uart_port *port =3D dev_id;
> +	u32 ii;
> +
> +	scoped_guard(uart_port_lock_irqsave, port) {
> +		ii =3D readl_relaxed(port->membase + UART_II_OFFSET);
> +		switch (ii & 0x0F) {
[ ... ]
> +		case UART_II_NO_INT_PENDING:
> +			break;
> +		default:
> +			pr_debug("%s: 0x%x\n", __func__, ii);
> +			break;
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Does returning IRQ_HANDLED unconditionally for UART_II_NO_INT_PENDING break
the spurious interrupt detection in the kernel?

If the Interrupt Identification Register evaluates to no pending interrupt
or an unknown value, the handler breaks out of the switch and falls
through to unconditionally return IRQ_HANDLED.

Returning that an interrupt was handled when none was actually serviced
prevents the IRQ core from detecting an interrupt storm and disabling the
faulty IRQ line, which can lead to system lockups.

[ ... ]
> +static void serial_ambarella_hw_deinit(struct ambarella_uart_port *amb_p=
ort)
> +{
> +	struct uart_port *port =3D &amb_port->port;
> +
> +	/* Disable interrupts */
> +	serial_ambarella_ier_write(port, 0);
> +
> +	/* Reset the Rx and Tx FIFOs */
> +	writel_relaxed(UART_FCR_CLEAR_XMIT | UART_FCR_CLEAR_RCVR,
> +		       port->membase + UART_SRR_OFFSET);
> +}

[Severity: Low]
Should these FIFO reset commands be written to the FIFO Control Register
rather than the Software Reset Register?

The code writes UART_FCR_CLEAR_XMIT and UART_FCR_CLEAR_RCVR to
UART_SRR_OFFSET. While the bit values might overlap, mixing FIFO control
macros with the software reset register seems semantically incorrect and
might be a typo for UART_FC_OFFSET.

[ ... ]
> +static int serial_ambarella_startup(struct uart_port *port)
> +{
> +	int rval;
> +	struct ambarella_uart_port *amb_port =3D to_ambarella_uart_port(port);
> +
> +	serial_ambarella_hw_setup(port);
> +
> +	rval =3D request_irq(port->irq, serial_ambarella_irq, IRQF_TRIGGER_HIGH,
> +			   dev_name(amb_port->port.dev), &amb_port->port);
> +	if (rval < 0) {
> +		dev_err(amb_port->port.dev,
> +			"Failed to register ISR for IRQ %d\n", port->irq);
> +		serial_ambarella_hw_deinit(amb_port);
> +		return rval;
> +	}
> +
> +	serial_ambarella_ier_write(port, DEFAULT_AMBARELLA_UART_IER);
> +
> +	return 0;
> +}

[Severity: High]
Could writing to the IER register here create a race condition with the
newly registered interrupt handler?

The request_irq() call unmasks the interrupt line. An interrupt can fire
immediately, allowing serial_ambarella_irq() to execute concurrently on
another CPU and modify the IER state under the port lock.

Because serial_ambarella_ier_write() is then called without acquiring the
port lock, this unprotected read-modify-write can clobber changes made by
the interrupt handler.

[ ... ]
> +static void serial_ambarella_console_write_atomic(struct console *co,
> +						  struct nbcon_write_context *wctxt)
> +{
> +	struct ambarella_uart_port *amb_port =3D &ambarella_port[co->index];
> +	struct uart_port *port =3D &amb_port->port;
> +
> +	if (port->suspended)
> +		return;
> +
> +	if (!nbcon_enter_unsafe(wctxt))
> +		return;
> +
> +	if (!amb_port->console_line_ended)
> +		uart_console_write(port, "\n", 1, serial_ambarella_console_putchar);
> +	uart_console_write(port, wctxt->outbuf, wctxt->len,
> +			   serial_ambarella_console_putchar);
> +	wait_for_tx(port);
> +
> +	nbcon_exit_unsafe(wctxt);
> +}

[Severity: Medium]
Does this atomic write sequence need to check and clear the DLAB bit?

The write_atomic console callback is designed to preempt any context,
including NMIs, and writes characters directly to UART_TH_OFFSET. In
8250-compatible UARTs, this offset only acts as the Transmit Holding
register if the Divisor Latch Access Bit (DLAB) is cleared.

If a kernel panic occurs while serial_ambarella_set_termios() is executing
with DLAB set, this atomic write could preempt it and write the panic
message characters into the Divisor Latch register instead, corrupting the
baud rate and dropping the panic logs.

[ ... ]
> +static int serial_ambarella_probe(struct platform_device *pdev)
> +{
> +	struct ambarella_uart_port *amb_port;
> +	struct resource *mem;
> +	struct pinctrl *pinctrl;
> +	int irq, id, rval;
[ ... ]
> +	id =3D of_alias_get_id(pdev->dev.of_node, "serial");
> +	if (id < 0 || id >=3D serial_ambarella_reg.nr) {
> +		dev_err(&pdev->dev, "Invalid uart ID %d!\n", id);
> +		return -ENXIO;
> +	}
> +
> +	pinctrl =3D devm_pinctrl_get_select_default(&pdev->dev);
> +	if (IS_ERR(pinctrl)) {
> +		dev_err(&pdev->dev, "Failed to request pinctrl\n");
> +		return PTR_ERR(pinctrl);
> +	}
> +
> +	amb_port =3D &ambarella_port[id];
> +
> +	amb_port->uart_pll =3D devm_clk_get_enabled(&pdev->dev, NULL);

[Severity: High]
Is there a risk of multiple devices overwriting the same global port
structure?

The driver gets the serial alias id and assigns it directly to amb_port
without verifying if that slot in ambarella_port is already in use.

If a malformed Device Tree assigns the same alias to multiple UART nodes,
the second probe will overwrite the first device's devm-managed resources.
When the second probe eventually fails in uart_add_one_port(), devres will
free those pointers, leaving the active first device with a freed membase
pointer and causing a use-after-free on the next interrupt.

[ ... ]
> +static void serial_ambarella_remove(struct platform_device *pdev)
> +{
> +	struct ambarella_uart_port *amb_port;
> +
> +	amb_port =3D platform_get_drvdata(pdev);
> +	uart_remove_one_port(&serial_ambarella_reg, &amb_port->port);
> +}

[Severity: Medium]
Does this removal path need to clear the AMBA_UART_RESET_FLAG?

During driver bind, serial_ambarella_hw_setup() sets AMBA_UART_RESET_FLAG
in the static ambarella_port array to ensure the hardware resets only once.
However, this flag is not cleared when the driver is unbound.

If the driver is unbound, devres disables the clock. On a subsequent
re-bind, the hardware clock is re-enabled from a gated state and needs a
reset, but the setup function will skip it because the old flag is still
set.

[ ... ]
> +static int serial_ambarella_resume(struct device *dev)
> +{
> +	struct ambarella_uart_port *amb_port =3D dev_get_drvdata(dev);
> +
> +	clear_bit(AMBA_UART_RESET_FLAG, &amb_port->flags);
> +	serial_ambarella_hw_setup(&amb_port->port);
> +
> +	return uart_resume_port(&serial_ambarella_reg, &amb_port->port);
> +}

[Severity: High]
Can this hardware setup race with concurrent console writes during resume?

Calling serial_ambarella_hw_setup() resets the UART and clears its FIFOs.
This is performed without acquiring the port lock or synchronizing with
the console.

When no_console_suspend is used, the console remains active during resume.
A concurrent printk from another CPU could invoke atomic console routines
and attempt to write characters to the UART while it is being held in
reset or its FIFOs are being cleared.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-longzhao-u=
pstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com?part=3D8
