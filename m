Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C1B3D1CA8
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 04:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780462693; cv=none; b=tZbOWkrdrjTHstLl8Itzsavvye5BSq1mYhKcdFlK+FuhWYSrM5Qi56FskH/38P5P6+ApQOQur5hhIvetTDx2okiGoIQsmVmyWW7jX5HJn7uE7TWlWMINURV+WxhnG6u+c8jJQVRR9XFZIsFJkz9KoMPwfr+6irhCS/WBU98fScw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780462693; c=relaxed/simple;
	bh=Fvk8bNDH9/HzvqaoAprJpzIEjYS/J/y5Xdv5baR9eVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=StlvsZD3lL/RfMCY8svOd/gLSYyfaaEDT2CHRYNzXFYW7y5DNBsBZ74ccx4u6ik/ves/ijX3IeEfFGCkJBYuIo17TyZjo+qs+TERR+K16xLkoOvF6QjEdkVKR2NS5NNq1tQriGFdE1Uj08oYLhvq5fozcdLA6kEhD3gH62n+ftI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmNCP6tF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmNCP6tF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8A21F00893;
	Wed,  3 Jun 2026 04:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780462692;
	bh=ykOcbcOFxLyqTPIYyOoj1M+z7jIeSu8+4xlLeikzbjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JmNCP6tFclEESWQPhzspO8PQulMG1DXTrjgjSWbHyyCko6SEWr+wg/mm+0k25/B3y
	 8EGmxuXwQRNBUpNWnSRyWNuZKQnRZO/xN1CHh+IoPabVd8bipsdgUXMY7l7DRjnQT/
	 87PSUu106z6tcwltPWGBpqJzDx5OdeNR+5v8T6tQle6dxQHvA1SgJ2JbXAKkNRPKEs
	 cUxGwBLvr0DCcsECoZ3V+/IIJ3d8CmxpPsP5vzZoVumaM9PWbjjGDtBypIm26AmBVx
	 XsNRgHFn2g+v6pUdZJookD7I9pjvQPvhEhEu2RPhVjvEheyedNL7aIsLp0lS13006r
	 ZPzuyTWyvOjMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] spi: Add Nuvoton MA35D1 QSPI controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260603043551.1062112-3-cwweng.linux@gmail.com>
References: <20260603043551.1062112-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 04:58:11 +0000
Message-Id: <20260603045811.CB8A21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Passing a pointer to `op->cmd.opcode` (a `u16`) to a buffer-orient=
ed transfer function causes command corruption on Big-Endian systems.
- [High] Failure to drain the RX FIFO during TX-only transfers causes the S=
PI controller to stall or drop data due to overflow.
- [High] The driver configures the bidirectional data pins as outputs durin=
g SPI memory dummy cycles, risking bus contention.
- [Medium] Memory operations (`spi_mem_exec_op`) will fail with `-EINVAL` i=
f the client device configures a 16-bit or 32-bit default word size.
- [Low] The Kconfig symbol `SPI_MA35D1_QSPI` is missing architecture depend=
encies.
--

commit 6406cd6c82b9bd8e78df612f2de82f09e50e1f89
Author: Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: spi: Add Nuvoton MA35D1 QSPI controller support

This commit adds support for the Nuvoton MA35D1 QSPI controller in master m=
ode.

> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 957c3e065b839..7e67eebba2427 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -695,6 +695,12 @@ config SPI_LJCA
>  	  This driver can also be built as a module. If so, the module
>  	  will be called spi-ljca.
> =20
> +config SPI_MA35D1_QSPI
> +	tristate "Nuvoton MA35D1 QSPI Controller"

[Severity: Low]
Should this config symbol include architecture dependencies, such as
depends on ARCH_MA35 || COMPILE_TEST?=20

Adding dependencies would help prevent cluttering the configuration menu for
users building kernels for unrelated hardware architectures.

> +	help
> +	  This driver provides support for Nuvoton MA35D1
> +	  QSPI controller in master mode.

[ ... ]

> diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
> new file mode 100644
> index 0000000000000..119c06464cb01
> --- /dev/null
> +++ b/drivers/spi/spi-ma35d1-qspi.c

[ ... ]

> +static int nuvoton_qspi_txrx(struct nuvoton_qspi *qspi, const void *txbu=
f,
> +			     void *rxbuf, unsigned int len)
> +{

[ ... ]

> +	for (i =3D 0; i < words; i++) {
> +		ret =3D nuvoton_qspi_wait_tx_not_full(qspi);
> +		if (ret) {
> +			dev_err(qspi->dev, "TX FIFO full timeout\n");
> +			return ret;
> +		}
> +
> +		nuvoton_qspi_write(qspi, nuvoton_qspi_tx_word(txbuf, i,
> +							      qspi->bits_per_word),
> +				   NUVOTON_QSPI_TX_OFFSET);
> +
> +		if (rxbuf) {
> +			ret =3D nuvoton_qspi_wait_rx_not_empty(qspi);
> +			if (ret) {
> +				dev_err(qspi->dev, "RX FIFO empty timeout\n");
> +				return ret;
> +			}
> +
> +			val =3D nuvoton_qspi_read(qspi, NUVOTON_QSPI_RX_OFFSET);
> +			nuvoton_qspi_rx_word(rxbuf, i, val, qspi->bits_per_word);
> +		}
> +	}

[Severity: High]
Does skipping the RX FIFO read when rxbuf is NULL cause the RX FIFO to over=
flow
during TX-only transfers?

In standard SPI operations, every transmitted word also shifts a word into
the RX FIFO. Because this loop never empties the RX FIFO in transmit-only c=
ases
(like a flash Page Program), could the FIFO rapidly fill up and cause the S=
PI
controller state machine to stall or drop data?=20

A dummy read might be needed for every word written, even when rxbuf is not
provided.

[ ... ]

> +static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
> +				    const struct spi_mem_op *op)
> +{
> +	struct spi_device *spi =3D mem->spi;
> +	struct nuvoton_qspi *qspi =3D spi_controller_get_devdata(spi->controlle=
r);
> +	u8 addr[4];
> +	int ret;
> +	int i;
> +
> +	ret =3D nuvoton_qspi_setup_transfer(spi, NULL);

[Severity: Medium]
Will this inherit the default word size from the SPI device?

If a client device configures a 16-bit or 32-bit default word size,
bytes_per_word will become 2 or 4. When the driver attempts to transmit the
1-byte command phase below (len =3D 1), nuvoton_qspi_txrx() will execute its
modulus check and return -EINVAL.=20

Could this explicitly enforce an 8-bit word size for memory operations inst=
ead
of relying on the device's default?

> +	if (ret)
> +		return ret;
> +
> +	nuvoton_qspi_set_cs(spi, true);
> +
> +	nuvoton_qspi_set_bus_width(qspi, op->cmd.buswidth, SPI_MEM_DATA_OUT);
> +	ret =3D nuvoton_qspi_txrx(qspi, &op->cmd.opcode, NULL, 1);

[Severity: High]
Could passing the address of op->cmd.opcode cause command corruption on
big-endian systems?

The op->cmd.opcode field is defined as a u16 in struct spi_mem_op. When pas=
sed
directly to nuvoton_qspi_txrx() as a byte buffer (const void *txbuf), the
function will read the first byte at the lowest memory address.=20

On big-endian platforms, this reads the most significant byte (0x00) instead
of the actual command byte, which would break SPI flash communication.

> +	if (ret)
> +		goto out_deassert_cs;

[ ... ]

> +	if (op->dummy.nbytes) {
> +		nuvoton_qspi_set_bus_width(qspi, op->dummy.buswidth,
> +					   SPI_MEM_DATA_OUT);

[Severity: High]
Is it safe to hardcode SPI_MEM_DATA_OUT for the dummy phase?

For Dual or Quad I/O modes (buswidth > 1), setting the data direction to ou=
tput
configures the SPI data pins to actively drive the bus. However, dummy cycl=
es
in SPI flash protocols provide a high-impedance turnaround time so the flash
chip can prepare to drive the bus for the data input phase.=20

Actively driving the lines from the host controller during this phase might
lead to direct bus contention.

> +		ret =3D nuvoton_qspi_txrx(qspi, NULL, NULL, op->dummy.nbytes);
> +		if (ret)
> +			goto out_deassert_cs;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603043551.1062=
112-1-cwweng.linux@gmail.com?part=3D2
