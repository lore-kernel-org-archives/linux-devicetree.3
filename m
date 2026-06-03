Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E892E65D
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 04:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780462062; cv=none; b=aQmQ7DrHd7xbHdiJMNPu5ph0CZaZZ7GlGzSl1Qmo9sJ3s2S/Ym023OoE0TQ8EYxTIsP2Z1FobvrifpNBI1XvZmqJxvCwgB2XRYcITf15EK5D4JiMGJzO9xdNmEi1dMWgJDrPpTG6csLtT94mw7Ep05K6DX9GftvjH5UdJRyCsIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780462062; c=relaxed/simple;
	bh=+YYsilwFDi1H9prVKgu10YKWKSPq+9P8IUVi86Svlzk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l7X8/fbuJJVh4ip0Ih7t0Gvi98AvZlLU/wYCyIm8nwMXF/oT/PQvJF2tO5TOBdF648KQbwzzkD5GdhDMe+YK0QpnOGFFe81bwigDr1nK0nkpnIHAtbiDF2CvANAAPzgNRLtTJcWqgqlp2EqbsarF0YK1Mrk2GVQMuGhJI3szWc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGBRufK/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGBRufK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CF11F00893;
	Wed,  3 Jun 2026 04:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780462060;
	bh=1EYPcezWs1/9LaSsl1swikPAQScLNHkgJcKogKE44Sw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iGBRufK/Vg6Rtl0xa+1RVSX59LvTwSEXUhOiK9PvVXcTl0X7v7l5+VoD3nRim+py2
	 llDr3TGchH6a5VaX8VJ3BaPo44UFvxhfIRNeD/ZHCtPlaLfSIz4nMcKgD3m9mdIWjd
	 rc8j5KZN2n8F1U5oAnqXnZ37edoCzPdRJNkYvdfKL3V+u3VKe6wHRufiqLlH7kFm1K
	 kgiPtJ7I3lGSLINERjFtRlTpRSCtqnOQrEQlrRRBB5v7Tiz9o5OEp9MMwgC4vZQONg
	 Gs6DvsYsElF6t5UjJ3w/m1F9sOKQUT7HZKfAsPm2IHSCJHfhJRH8UU7OtuU1B48vuJ
	 Uq0+q7XHc+4yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI
 Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603043551.1062112-2-cwweng.linux@gmail.com>
References: <20260603043551.1062112-2-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 04:47:39 +0000
Message-Id: <20260603044740.57CF11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Sending `op->cmd.opcode` by address fails on Big-Endian architectu=
res and ignores opcode length.
- [High] Failure to unconditionally drain the RX FIFO during TX-only transf=
ers can stall the SPI controller.
- [Medium] Silent mapping of invalid chip select numbers to `SS1`.
- [Medium] Missing `num-cs` constraint in the device tree binding allows in=
valid configurations.
- [Medium] Missing 'resets' property in the YAML schema properties list.
--

commit 4a6810e7446469e1e2c0b488d225f75f8420f815
Author: Chi-Wen Weng <cwweng.linux@gmail.com>

dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI Controller

This series introduces the device tree bindings and driver support for the
Nuvoton MA35D1 Quad SPI controller. The driver implements standard master
mode operations, quad I/O, and SPI memory operations.

> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.ya=
ml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> new file mode 100644
> index 0000000000000..f7b9cb52d8e59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-qspi
> +
> +  reg:
> +    maxItems: 1

[Severity: Medium]
Should the 'resets' property be included in this schema?

Since the MA35D1 hardware contains reset control lines for QSPI, omitting
'resets' means any board device tree that accurately specifies the hardware=
's
reset line will fail schema validation due to unevaluatedProperties: false.

[Severity: Medium]
Does this binding need a 'num-cs' constraint?

The MA35D1 controller physically supports a maximum of 2 chip selects. Beca=
use
the binding references spi-controller.yaml without capping num-cs, a device
tree specifying num-cs =3D <4> will pass validation and could cause
out-of-bounds indexing in the driver.

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
Can this stall the SPI controller on large TX-only transfers?

Because SPI is a full-duplex shift register, every byte transmitted shifts a
byte into the RX FIFO. By only reading the RX FIFO when rxbuf is not NULL, a
long TX-only operation (like a 256-byte page program) will fill and overflow
the RX FIFO.

On many controllers this stalls the shift register and causes a hang or tim=
eout
in nuvoton_qspi_wait_tx_not_full(). Should the RX FIFO be unconditionally
drained on every cycle?

[ ... ]
> +static void nuvoton_qspi_set_cs(struct spi_device *spi, bool enable)
> +{
> +	struct nuvoton_qspi *qspi =3D spi_controller_get_devdata(spi->controlle=
r);
> +	unsigned int cs =3D spi_get_chipselect(spi, 0);
> +	u32 mask;
> +	u32 val;
> +
> +	if (cs =3D=3D 0)
> +		mask =3D NUVOTON_QSPI_SSCTL_SS0_MASK;
> +	else
> +		mask =3D NUVOTON_QSPI_SSCTL_SS1_MASK;

[Severity: Medium]
Is it safe to assume any non-zero chip select maps to SS1?

If an incorrect device tree specifies num-cs =3D <4>, the SPI core might pa=
ss
cs >=3D 2 here. This branch will silently map all invalid chip selects to
SS1_MASK.

If another peripheral is connected to SS1, could this cause a bus collision?

[ ... ]
> +static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
> +				    const struct spi_mem_op *op)
> +{
[ ... ]
> +	nuvoton_qspi_set_cs(spi, true);
> +
> +	nuvoton_qspi_set_bus_width(qspi, op->cmd.buswidth, SPI_MEM_DATA_OUT);
> +	ret =3D nuvoton_qspi_txrx(qspi, &op->cmd.opcode, NULL, 1);

[Severity: High]
What happens here on big-endian systems or with multi-byte opcodes?

op->cmd.opcode is a 16-bit integer, but it's passed by address with a
hardcoded length of 1. On big-endian systems, reading a 16-bit integer via a
byte pointer reads the most significant byte (which is 0x00 for a typical
1-byte opcode like 0x03), breaking flash communication.

Additionally, this ignores op->cmd.nbytes, which would break operations that
require more than 1 byte for the opcode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603043551.1062=
112-1-cwweng.linux@gmail.com?part=3D1
