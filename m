Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD66E340283
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786617993; cv=none; b=gWKgYWJF0ou/mkKm8TKlIfOYaAWn7Cb6bCqQw5QYRfjBE0yWtS4Fa+DgeeG7TjH4mh7SRomKOIFpNL2J42NzOBUGfeNPX8wSqpNwx8oyPOzOedPShfYHg8Q3oJgPMdYvg6HiOEn6mi2LjVn/+ummnYhIN207hwWZbYT94Of5BRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786617993; c=relaxed/simple;
	bh=62Z+MBNXTOtCCRn0RGnAn26OV8vwPV1jmsrY21GE8oo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OzgICn4QlnpK+vzTEZq1B6SC2fWz5gRPbJept0/6F0fDYotqF46QlQ0UotqnaC1YxsGpViMzI7NpsA7Q/euy59mudQFyA9cmwd4Ga97P1gPZ6S9tVapURAD6rEcTJ/jSjSPjXYrTq2tyuVg0tc50rizx91cIO6Knn3qysrlqwxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbEecBnY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbEecBnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346231F000E9;
	Thu, 13 Aug 2026 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786617991;
	bh=a9cT1iEeFiSPZvyUihVhPdcTpdx6JWzbNOfYY+Bul0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LbEecBnY01HdXVzDggmALfcsUaZ+tFD1uq/CZXfmqp5vDYJd4cI9iGPZDUyN9HNF7
	 mtO8+79oN6OZhmueb750JJb5lsErY5KpdAsIDgf17NYFfY2n5GWz+rqbzFir8VzFRW
	 j7xjhou84JaS+DsdToi14Q3l46dbBdhsXGOHwKuwP1D9mp3A1NcnQ9VFL31Cs6cUTj
	 MAuWhqzB/wNThqH+XvU2sijvAH7YaEO+F3v2SZF4ys3GEdICMENUNiGUnAl0H6/hZI
	 BZipGk099aD9FKo27FdOt3APAQuyWo2tO9pyFiI9o0l4798S5B45+uzWszra+oPgJr
	 F7/vJ6JNFz2DA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] serial: 8250_dw: add Ambarella CV75 quirks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813-cv75-v3-c-v3-2-9352b3fd6026@ambarella.com>
References: <20260813-cv75-v3-c-v3-0-9352b3fd6026@ambarella.com>
 <20260813-cv75-v3-c-v3-2-9352b3fd6026@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:46:30 +0000
Message-Id: <20260813104631.346231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Premature and lockless write to UART_IER in dw8250_ier_mask_startu=
p defeats interrupt deferral and introduces race conditions.

Pre-existing issues:
- [High] Runtime PM is enabled after port registration, violating subsystem=
 PM initialization rules and causing circular wait conditions.
--

--- Patch [2]: [PATCH v3 2/2] serial: 8250_dw: add Ambarella CV75 quirks ---
commit 6e65f0f86d7deb4c1cfc42c64f909eb5435425fe
Author: Long Zhao <longzhao@ambarella.com>

serial: 8250_dw: add Ambarella CV75 quirks

Add CV75 platform data with an ETOI IER mask and skip-set-rate so the
DesignWare 8250 driver can drive the Ambarella UART for console use.

> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/=
8250_dw.c
> index 5fba913f33010..e8aa592924d4d 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
[ ... ]
> @@ -572,6 +576,23 @@ static void dw8250_prepare_rx_dma(struct uart_8250_p=
ort *p)
>  	dw8250_writel_ext(up, RZN1_UART_RDMACR, val);
>  }
> =20
> +static int dw8250_ier_mask_startup(struct uart_port *p)
> +{
> +	struct dw8250_data *d =3D to_dw8250_data(p->private_data);
> +	struct uart_8250_port *up =3D up_to_u8250p(p);
> +	int ret;
> +
> +	ret =3D serial8250_do_startup(p);
> +	if (ret)
> +		return ret;
> +
> +	/* Keep variant-specific bits in the shadow across subsequent updates. =
*/
> +	up->ier |=3D d->pdata->ier_mask;
> +	serial_port_out(p, UART_IER, up->ier);

[Severity: High]
Does this lockless write to UART_IER introduce a race condition against the
serial console?=20

The 8250 core explicitly defers enabling hardware RX interrupts until
set_termios() configures the FIFOs to prevent swamping the interrupt handle=
r.
Writing to UART_IER here defeats that safety mechanism.

Furthermore, if a printk occurs concurrently, serial8250_console_write()
executes on another CPU and performs a read-modify-restore on UART_IER. This
lockless write races with the console driver, which can permanently drop the
ier_mask bits or cause unpredictable hardware behavior.

Should this write be protected by p->lock, and potentially deferred until
the FIFOs are configured?

> +
> +	return 0;
> +}
> +

[Severity: High]
This isn't a bug introduced by this patch, but there is a pre-existing
issue in dw8250_probe() regarding runtime PM initialization:

drivers/tty/serial/8250/8250_dw.c:dw8250_probe() {
    ...
	data->data.line =3D serial8250_register_8250_port(up);
	if (data->data.line < 0)
		return data->data.line;

	platform_set_drvdata(pdev, data);

	pm_runtime_enable(dev);
    ...
}

Does registering the port before enabling runtime PM cause circular wait
conditions during device probe?

Registration synchronously invokes the driver's pm callback (dw8250_do_pm)
via uart_add_one_port(). The dw8250_do_pm() callback unconditionally calls
pm_runtime_get_sync(port->dev).=20

As documented in the TTY subsystem guidelines, invoking runtime PM APIs from
callbacks before pm_runtime_enable() is called leads to circular dependenci=
es,
hanging the probe function indefinitely because the runtime PM infrastructu=
re
is not yet initialized for the device.

Should pm_runtime_enable(dev) be called before serial8250_register_8250_por=
t()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-cv75-v3-c-=
v3-0-9352b3fd6026@ambarella.com?part=3D2
