Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D033544A3F5
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060529; cv=none; b=fbZ3IebSm1ssW7zmhXaVM1D1Atb0p8kZ69KTlfenc+HlSeK/jGFUbSFdO8rPYf/mXu3YE0lceSTXli70vnD5M9cZcpkm4ry7dhXHL98625xGqo0pYCgW2mtWYEEUCahMEuhUSHkG5vCViQBC52Y//fZa/gEeZ4hDK49R1RIMGEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060529; c=relaxed/simple;
	bh=qfnr18SlyGIzJbdLe6TTMo/NneAfSARv1z+o/E24RuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1RwL4Htyh2E3ltj2eCH4E6Ef5/9OCsQosNQGS5eiDylIKOfdBxIT5rtQoHI72V6DYMSNnEJBOsf5VDvD6VI/5jdwKV07pDHkYIcGQN8RwrePE+FIiLqUngi7W+xmRkkocVV1RjHw9nPLfIUvbg9ulL+K/K1tw+MZJwZn00+cnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=chwQzfJ6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="chwQzfJ6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso1172097f8f.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787060526; x=1787665326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahRnGypdincJrQV1sCyNvMoD/ahUyfJQ2W/I3pAFSh4=;
        b=chwQzfJ6AVUif+8O6HlhWHEY59s5AkTmzvnbjPJEfzbZZAQw2It0MKf6gpapBuF6tp
         181OIRrMhxxsl2zUTdw779/T0p9sYEODNLBKCLL5cb5bGcHmrW5RrjhrONJEw5GUuLFt
         rqZBMwhteDMe3VkTc8Cs/K5PahPksiPNsKFzB+5kiznWkw8lhRqwElty13xGZvrmKbzf
         iKl9tzUCABnceObwA97Ya5F+nYRfciQubYzXHZY5K58qtYIEbVABwRIcy5r9SeACBoBQ
         f+si2gGocJJtOSZaCZS+kXVu0lRNzU8FjFPCiSmt/J02iTJuhgGsGcTri7d+i5J2+stH
         i31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060526; x=1787665326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahRnGypdincJrQV1sCyNvMoD/ahUyfJQ2W/I3pAFSh4=;
        b=MWgaDnP5rODd7qaLU8VkynGDbMYUcyBItArfVhfydkRySXIXA9diCdjuQrXQEtR/BH
         VPgkbs8QUfNmu5GIo7ACK6mkIxUzduU8s7QwVmwgXTN/trp8+bX4ltBQmr+KwCznCliB
         TBfa31IYg0PDEiG1ik2yfgygPGZKJ+OvVFAsiiMICymDSTZJ0QgDnTSNO//PZt7WnygZ
         ziRTy99eUcDXQGpEkwwspsxVBE2rUxhTwZaYeEl9xr+Kd8/+R1nhPHhi4yfsKOhqoo7G
         Se+jTXid3oM1PR8XLkOFVHm20pW5Mh4ii4v0sHLDN46O5n40SApwS+M+lT6kVN9TYegC
         9OQA==
X-Forwarded-Encrypted: i=1; AHgh+RoQVdIYmkmW7ZBYXEb/bf+8v2K8ZsRwM+AMJw9c/UA5SANMXdx6l8QFrdVCWxzQtFoRg4JBa7UPQwDF@vger.kernel.org
X-Gm-Message-State: AOJu0YxsESNcqM4o10M19Qc2Jwnignajb4/1sLo/7SKs8oS4Ivux1m3Z
	2cdaMJmrehunuk7UfVCElXjuqIe5iT4lkOvK7RYVbepQJOTiTshZLeEjNvwyWgU9P58xtceJbSJ
	3wQ9VRGw=
X-Gm-Gg: AR+sD11OP2rIic3Tq4I0oEc9DpuGeRXbfCA+8rxZ32DUVxnHHnF580Nhx8oyWaN0szJ
	qhaTiIz2D0uG8A9YDUJNvWPpIReLYMfd59sIj+Zjh6pv8wpBlockQY3I6QdbahNM/3xHoyB3q1C
	LsPd7G4BeHu7OarSl5J9CQl47LQqvS1HFFukQfHX+Ta1nHa3VPDRw+FBXXqFG1Bgk33Ml/MH/Hh
	CC59MrwtHKngsgCqb0AQr0zWi7xXhxMP+1KBvcILOZfgLGCz5fIj/nqpo6KYNJARW8vo2aBXzj0
	GRlklp0IP5+hb/xRNNQryZwmbISc2Hw5sM7KqXwNJNSe/pwUi9u1TEmsUK6yPizERVMPwLbcYBi
	Tk9duwQmf+hqDXHrF9OqxcJ7QJxs04DhI++GG5sSo/a/XsGTl9ZkohEmSYk7R2UGMx0Sn7zZjlr
	17+2EU1dpmgktfdhbdnmirG2rZRyFprSfUVEVsAvPCQPjgGt/iAvNrVERcvirMuw==
X-Received: by 2002:a5d:5f4a:0:b0:47f:e770:13e0 with SMTP id ffacd0b85a97d-48160715b9bmr55580729f8f.7.1787060526000;
        Tue, 18 Aug 2026 06:42:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783basm12544056f8f.30.2026.08.18.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:42:05 -0700 (PDT)
Date: Tue, 18 Aug 2026 15:42:01 +0200
From: Petr Mladek <pmladek@suse.com>
To: Long Zhao <longzhao@ambarella.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	soc@lists.linux.dev, John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH v2 08/10] serial: ambarella: add Ambarella UART driver
Message-ID: <aoRhKb0nYCLCwXGN@pathway.suse.cz>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-8-6b09707c5fe9@ambarella.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-8-6b09707c5fe9@ambarella.com>

Added John Ogness into Cc.

Jiri asked me to look at the printk/nbcon related parts.
I am going to make just a quick look after I came back from vacation.
Maybe, the custom code won't be needed at all when the 8250
API is used in v3.

Anyway, please add me and John into Cc for v3, ...

On Thu 2026-08-06 17:34:16, Long Zhao wrote:
> Add an Ambarella UART driver with console support for early boot
> bring-up on CV75. Keep udelay() in wait_for_tx(); it runs under
> console/poll paths that may hold the port lock with IRQs disabled.
> 
> --- /dev/null
> +++ b/drivers/tty/serial/ambarella_uart.c
[...]
> +static void serial_ambarella_console_putchar(struct uart_port *port,
> +					     unsigned char ch)
> +{
> +	struct ambarella_uart_port *amb_port = to_ambarella_uart_port(port);
> +
> +	serial_ambarella_putchar(port, ch);
> +	amb_port->console_line_ended = (ch == '\n');
> +}
> +
> +static void serial_ambarella_console_device_lock(struct console *co,
> +						 unsigned long *flags)
> +{
> +	__uart_port_lock_irqsave(&ambarella_port[co->index].port, flags);
> +}
> +
> +static void serial_ambarella_console_device_unlock(struct console *co,
> +						   unsigned long flags)
> +{
> +	__uart_port_unlock_irqrestore(&ambarella_port[co->index].port, flags);
> +}
> +
> +static void serial_ambarella_console_write_atomic(struct console *co,
> +						  struct nbcon_write_context *wctxt)
> +{
> +	struct ambarella_uart_port *amb_port = &ambarella_port[co->index];
> +	struct uart_port *port = &amb_port->port;
> +
> +	if (port->suspended)
> +		return;

This should not be needed. The con->write*() callbacks should never get
called when the port is suspended. Otherwise, the message would get
skipped and never printed again.

I am not familiar with the low-level driver and suspend code.
I guess that you might need to implement suspend callbacks,
for example, see pl010_suspend()/resume() or
of_serial_suspend()/resume().

Note that the printk subsystem will stop writing to the console when
console_suspend() is called, see uart_suspend_port().

> +	if (!nbcon_enter_unsafe(wctxt))
> +		return;

We might need to store the control register and enable transmit here,
for example see pl011_console_write_atomic().

> +
> +	if (!amb_port->console_line_ended)
> +		uart_console_write(port, "\n", 1, serial_ambarella_console_putchar);
> +	uart_console_write(port, wctxt->outbuf, wctxt->len,
> +			   serial_ambarella_console_putchar);
> +	wait_for_tx(port);

We might need to restore the control register here so that
the serial port is usable for the original purpose again.

> +	nbcon_exit_unsafe(wctxt);
> +}
> +
Best Regards,
Petr
