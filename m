Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCE63FCB3A
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091614; cv=none; b=lZ7UEqsycjKuxFy/8m9jMS5V6JCeFOfOZG2yjIPYOclIiqDq64m0tg0g6CNMhLhhgUmzUcmSjvaK7ZzeMP2/xnkOWE7MQzKVg8dJ+Bx+8KpN2x//hE6YME0aOaAVwpEIPxbhs4LiOA5KBprxZYVNp2/zxDqi7pE8gOXFML0dVFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091614; c=relaxed/simple;
	bh=XTXPz417NNDRY9tbtz/ji6BoACUBzgx43s55K1Kjass=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YFN6M6zUDOA0aEZ3dO2iJGrcts/GN6U8rG6fnHzBk+kDhyKSbb2/SSy8H5gycRtK76ZYjFVHl1KklMNZYxaImMXlQ73WKK2/ajVqdsAjbOQIOpk5Up4VQI/XwH11vDiW2KLuZBrVNJ0ZrlwKI4DRVDNAUJpxhMKthb+qjwQDVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bljldU2P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bljldU2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8501F00893;
	Wed, 10 Jun 2026 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781091610;
	bh=Ou4Oe0huuTb4StKZ1aEK4BC+UK3bkYkeopZnF3CmCfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bljldU2PBiVDzmj9brMpveK5W/qAHKFO1ktzGEEklz5pTKYeLGTTqoidv06NZEKpW
	 SJRpIli1TSNMisC5Bq4ZjuHjCO9oy0h8H110OSHWZg9WcZelhrq46/61nlf64iMJWl
	 05fIRvF73eDUNB4rO0f9zbrJSPc2oe2LYZPsR1ZO99QuYkf/CvPjxdU7fk6ZF+OEPZ
	 +GQ9HHFomIkY7l5WmgsAyPd02pubGzD3lOUMFHlQrCOJuegPIx9ESJe6jIksOapnD5
	 vYXN7sijOAMRPJWpiy5Eo4eVmnsbKTr7DXCU0ayKyAD/GNdHM6D20JADNBICFTkU7t
	 PrJhXIex4hKgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] tty: serial: Add UART driver for Cortina-Access
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Li" <jason.lee651024@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610112821.3030099-4-jason.li@cortina-access.com>
References: <20260610112821.3030099-4-jason.li@cortina-access.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 11:40:10 +0000
Message-Id: <20260610114010.9B8501F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Global array allocation, port slot selection, and cleanup lack syn=
chronization, leading to race conditions, memory leaks, and UAF.
- [High] Kernel panic in `cortina_console_setup()` due to NULL pointer dere=
ference when called for an unprobed UART index.
- [High] `cortina_poll_put_char()` uses `jiffies` for timeout calculations,=
 resulting in an infinite loop and system hang.
- [High] Read-modify-write operations on the CFG register are performed wit=
hout holding the port lock, leading to TOCTOU state corruption.
- [High] The console write function disables hardware interrupts and then t=
akes a sleeping spinlock, triggering a lockdep splat on PREEMPT_RT.
- [Medium] The RX interrupt handler incorrectly applies a single, one-time =
error status to all characters drained from the FIFO.
- [Medium] Failed probes permanently leak port slots from the global `corti=
na_uart_ports` array.
- [Medium] The wakeup source initialized during probe is never disabled, ca=
using a memory leak when the driver is unbound or fails to probe.
- [Medium] The `cortina_uart_shutdown` callback performs read-modify-write =
operations on the Interrupt Enable (IE) register without holding the port l=
ock.
- [Low] The console write function transmits an incorrect LF-CR (`\n\r`) se=
quence instead of the standard CR-LF (`\r\n`).
--

commit fd0d487faa14545601b1e17f9d5e8a68bcd53bfd
Author: Jason Li <jason.lee651024@gmail.com>
Subject: tty: serial: Add UART driver for Cortina-Access platform

This commit introduces a new UART driver for the Cortina-Access SoC platfor=
m,
adding support for the CAXXXX family along with earlycon and console
functionality.

> diff --git a/drivers/tty/serial/serial_cortina-access.c b/drivers/tty/ser=
ial/serial_cortina-access.c
> new file mode 100644
> index 0000000000000..f25eae987ccdc
> --- /dev/null
> +++ b/drivers/tty/serial/serial_cortina-access.c

[ ... ]

> +static void cortina_uart_shutdown(struct uart_port *port)
> +{
> +	cortina_uart_stop_tx(port);
> +	cortina_uart_stop_rx(port);

[Severity: Medium]
Could this corrupt the IE register state? The serial core calls the shutdown
callback without holding the port lock, but the stop_tx and stop_rx functio=
ns
perform read-modify-write operations on the IE register.

> +	free_irq(port->irq, port);
> +}

[ ... ]

> +static void cortina_uart_set_termios(struct uart_port *port,
> +				     struct ktermios *termios,
> +				     const struct ktermios *old)
> +{
> +	unsigned long flags;
> +	int baud;
> +	unsigned int reg_v, sample_freq =3D 0;
> +
> +	baud =3D uart_get_baud_rate(port, termios, old, 0, 230400);
> +	reg_v =3D readl(port->membase + CFG);

[Severity: High]
Is the CFG register read vulnerable to TOCTOU corruption here? The CFG
register is read into a local variable outside the port lock, but it is=20
written inside the lock later. If another context acquires the lock and
modifies CFG concurrently, it seems this could overwrite and lose those
changes.

> +	/* mask off the baud settings */
> +	reg_v &=3D 0xff;

[ ... ]

> +static void cortina_access_power(struct uart_port *port, unsigned int st=
ate,
> +				 unsigned int oldstate)
> +{
> +	unsigned int reg_v;
> +
> +	reg_v =3D readl(port->membase + CFG);

[Severity: High]
Does this need to hold the port lock? The CFG register is read and written
here with no locking, which might race with other register accesses.

> +	switch (state) {
> +	case UART_PM_STATE_ON:
> +		reg_v |=3D CFG_UART_EN;
> +		break;

[ ... ]

> +#ifdef CONFIG_CONSOLE_POLL
> +static int cortina_poll_get_char(struct uart_port *port)
> +{
> +	if (readl(port->membase + INFO) & INFO_RX_EMPTY)
> +		return NO_POLL_CHAR;
> +
> +	return readl(port->membase + RX_DAT);
> +}
> +
> +static void cortina_poll_put_char(struct uart_port *port, unsigned char =
c)
> +{
> +	unsigned long time_out;
> +
> +	time_out =3D jiffies + usecs_to_jiffies(TX_TIMEOUT);
> +
> +	while (time_before(jiffies, time_out) &&
> +	       (readl(port->membase + INFO) & INFO_TX_FULL))
> +		cpu_relax();

[Severity: High]
Will this loop hang the system? Since this polling function is called from =
the
kgdb framework with local hardware interrupts disabled, jiffies will not
increment. Should atomic polling loops use udelay and an iteration counter
instead?

> +
> +	/* Give up if FIFO stuck! */
> +	if (readl(port->membase + INFO) & INFO_TX_FULL)
> +		return;

[ ... ]

> +static inline void cortina_uart_interrupt_rx_chars(struct uart_port *por=
t,
> +						   unsigned long status)
> +{

[ ... ]

> +	/* Read characters while FIFO is not empty */
> +	do {
> +		flg =3D TTY_NORMAL;
> +		port->icount.rx++;
> +		ch =3D readl(port->membase + RX_DAT);
> +		if (status & RX_PARITY_ERRE) {

[Severity: Medium]
Could this artificially inflate error statistics? The status argument is re=
ad
once before the loop, but it is evaluated against every character drained f=
rom
the FIFO. If an error bit was set initially, it looks like every subsequent
valid character in the batch is flagged as an error.

> +			port->icount.parity++;
> +			flg =3D TTY_PARITY;
> +		}

[ ... ]

> +#ifdef CONFIG_SERIAL_CORTINA_ACCESS_CONSOLE
> +static void cortina_console_write(struct console *co, const char *s,
> +				  unsigned int count)
> +{
> +	struct uart_port *port;
> +	struct cortina_uart_port *pca_port;
> +	unsigned int i, previous;
> +	unsigned long flags;
> +	int locked;
> +
> +	pca_port =3D cortina_uart_get_port(co->index);
> +	port =3D &pca_port->uart;
> +
> +	local_irq_save(flags);
> +	if (port->sysrq) {
> +		locked =3D 0;
> +	} else if (oops_in_progress) {
> +		locked =3D spin_trylock(&port->lock);
> +	} else {
> +		spin_lock(&port->lock);

[Severity: High]
Will this cause a sleeping-while-atomic lockdep warning on PREEMPT_RT?
Disabling hardware interrupts and then acquiring a sleeping lock (like
spinlock_t on RT kernels) is not allowed. Should this use
uart_port_lock_irqsave instead?

> +		locked =3D 1;
> +	}

[ ... ]

> +	/* Write all the chars */
> +	for (i =3D 0; i < count; i++) {
> +		/* Wait for the TX buffer to be empty */
> +		while (!(readl(port->membase + INFO) & INFO_TX_EMPTY))
> +			cpu_relax();
> +
> +		writel(*s, port->membase + TX_DAT);
> +
> +		/* CR/LF handling */
> +		if (*s++ =3D=3D '\n') {

[Severity: Low]
Does this transmit an incorrect LF-CR sequence instead of the standard CR-L=
F?
It writes the current character and then appends a carriage return if the
character was a newline. Could this be simplified by using uart_console_wri=
te?

> +			while (!(readl(port->membase + INFO) & INFO_TX_EMPTY))
> +				cpu_relax();
> +			writel('\r', port->membase + TX_DAT);
> +		}
> +	}

[ ... ]

> +static int __init cortina_console_setup(struct console *co, char *option=
s)
> +{
> +	struct uart_port *port;
> +	struct cortina_uart_port *pca_port;
> +	int baud =3D 115200;
> +	int bits =3D 8;
> +	int parity =3D 'n';
> +	int flow =3D 'n';
> +
> +	if (co->index < 0 || co->index >=3D UART_NR)
> +		return -ENODEV;
> +
> +	pca_port =3D cortina_uart_get_port(co->index);
> +	port =3D &pca_port->uart;
> +
> +	if (options)
> +		uart_parse_options(options, &baud, &parity, &bits, &flow);
> +
> +	return uart_set_options(port, co, baud, parity, bits, flow);

[Severity: High]
Can this cause a kernel panic if a console is requested on an unprobed port
index (e.g. via the command line)? It looks like this fetches a potentially
zero-initialized port from the global array and passes it to uart_set_optio=
ns,
which will unconditionally dereference the port operations.

> +}

[ ... ]

> +static int serial_cortina_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct cortina_uart_port *port;
> +	struct resource *res;
> +	struct clk *pclk_info;
> +	int uart_idx;
> +	int irq;
> +	int ret;
> +
> +	if (!cortina_uart_ports) {
> +		cortina_uart_ports =3D kcalloc(UART_NR, sizeof(*cortina_uart_ports),
> +					     GFP_KERNEL);

[Severity: High]
Is there a race condition with this global array allocation? The
cortina_uart_ports array is allocated and searched without any locking. Cou=
ld
concurrent probing of multiple instances lead to a double allocation and
memory leak?

> +		if (!cortina_uart_ports)
> +			return -ENOMEM;
> +	}
> +
> +	port =3D cortina_uart_ports;
> +	for (uart_idx =3D 0; uart_idx < UART_NR; ++uart_idx) {
> +		/* Find first empty slot */
> +		if (strlen(port->name) =3D=3D 0)
> +			break;
> +		port++;
> +	}
> +
> +	if (uart_idx >=3D UART_NR)
> +		return -ENODEV;
> +
> +	snprintf(port->name, sizeof(port->name),
> +		 "Cortina-Access UART%d", uart_idx);

[Severity: Medium]
If a subsequent initialization step fails in the probe function, does this
permanently leak the port slot? The name is assigned to claim the slot, but
it doesn't appear to be cleared on the error paths.

[ ... ]

> +	if (of_property_read_bool(np, "wakeup-source"))
> +		port->may_wakeup =3D true;
> +	if (of_property_read_bool(np, "break-indicator"))
> +		port->has_bi =3D true;
> +
> +	if (port->may_wakeup)
> +		device_init_wakeup(&pdev->dev, true);

[Severity: Medium]
Does this leak the wakeup source memory? device_init_wakeup is called to
enable the wakeup source, but it is never disabled on the probe error path =
or
in the removal callback.

> +
> +	ret =3D uart_add_one_port(&cortina_uart_driver, &port->uart);

[ ... ]

> +static void serial_cortina_remove(struct platform_device *pdev)
> +{
> +	struct cortina_uart_port *pca_port =3D platform_get_drvdata(pdev);
> +
> +	if (pca_port) {
> +		memset(pca_port->name, 0, CA_UART_NAME_LEN);
> +		uart_remove_one_port(&cortina_uart_driver, &pca_port->uart);

[Severity: High]
Does clearing the slot name before unregistering the port open a race
condition? If the name is cleared early, a concurrent probe might hijack the
slot and overwrite the port state during active teardown.

> +	}
> +
> +	platform_set_drvdata(pdev, NULL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610112821.3030=
099-1-jason.li@cortina-access.com?part=3D2
