Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D433120C
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607032; cv=none; b=QP8DrqHZDCT4NUf5ti2n34Vq1zY+HiaRAyoDV4law4OiEVX5MAFqvinwlL3ie0a5eNkC++8L4NUeQCIpXyAueO/iiP80xBFnFXLPZ/vTlq+JunJcrHoL8guCTLMryf8ZI2E6zJbbV4ZgKlRGzLoK5PfYo/Tmv3afp3BmP+w5aiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607032; c=relaxed/simple;
	bh=w1onKlf50uEy/uaJL1PpT1Rx63vdI1ZJYNMceHJwvow=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HcpicNbL+Zg3TiWzNmczUf038T0GJjxPOQho2JKn9m8dhHqpCKQ0WZ2QMao/FsnAwiKJNwER8EvEuMnpWy75WkuF80/d3x5Nybf0O2XhJl2JLZPZk2ZDkd4E/nh56x9EZ53bxKtKnhij72gY+fEvvFpl/20atVDJ8Oj2LPgllQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpPN2DXD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpPN2DXD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E16A1F000E9;
	Thu,  9 Jul 2026 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607030;
	bh=Mi8Smvt11rBjhpa+Uk+hRBEsyaqcP1O0InEeXW3km0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HpPN2DXDVmtsznHtVqZYgaQC0bUY2Hjq9v6CVcQEuih3K/PNyPuGLKzFbk3E4qqKQ
	 RlCuC2zNbd+PIMVMrS6H/ABzuTOh+hy9+YhrzUgagnibzqBvH2B1GOpu1OvQzMESpm
	 c8ZxPKcMYRS3N3tDn7hZA0uClEiDKQa0LKVfQfYiLaflIuI2co2iPRYdXjq+tIBoJP
	 cR4WfGxUXykSMBN9XdQi8n/1oiMAGWH3pKI581r1pAhibWW/NOwUXsSZBlSAHpyMBv
	 g0etewu5Mp/C0U3wELeSKZqndZiyjHKnLGbH9scjmEZDQkex0QjjNMzLuozfaRSRIu
	 tRpOg1pK+iqdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 05/11] spi: dw: Introduce enhanced
 single/dual/quad/octal spi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709055204.138168-6-changhuang.liang@starfivetech.com>
References: <20260709055204.138168-1-changhuang.liang@starfivetech.com>
 <20260709055204.138168-6-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:23:50 +0000
Message-Id: <20260709142350.8E16A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Divide-by-zero in wait cycle calculation causes kernel panic o=
n commands without dummy cycles.
- [Critical] Enhanced memory operations completely fail to perform actual d=
ata transfers, causing uninitialized memory reads and silently dropped writ=
es.
- [High] `dw_spi_exec_enh_mem_op` ignores the operation-specific maximum fr=
equency, violating the SPI memory API contract.
- [High] Calculated wait cycles can exceed the 5-bit hardware register limi=
t and are silently truncated to 0, corrupting read timing.
- [High] Unclamped data length for enhanced mode write operations leads to =
16-bit hardware register truncation.
--

--- Patch [5]: [PATCH v1 05/11] spi: dw: Introduce enhanced single/dual/qua=
d/octal spi ---
commit 0f1cbd98fc45570180f08cb46b29e531be3e743b
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: Introduce enhanced single/dual/quad/octal spi

This commit introduces support for enhanced single/dual/quad/octal SPI modes
in the DesignWare SPI controller driver. It adds a new function to execute
enhanced memory operations and updates the SPI_CTRLR0 register configuration
when these modes are utilized.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index 010a665b17b76..58159e8269f53 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -815,6 +815,89 @@ static int dw_spi_exec_mem_op(struct spi_mem *mem, c=
onst struct spi_mem_op *op)

[ ... ]

> +static int dw_spi_exec_enh_mem_op(struct spi_mem *mem, const struct spi_=
mem_op *op)
> +{
> +	struct spi_controller *ctlr =3D mem->spi->controller;
> +	struct dw_spi *dws =3D spi_controller_get_devdata(ctlr);
> +	struct dw_spi_enh_cfg enh_cfg;
> +	struct dw_spi_cfg cfg;
> +
> +	switch (op->data.buswidth) {

[ ... ]

> +	dw_spi_init_enh_mem_buf(dws, op);
> +
> +	cfg.dfs =3D 8;
> +	cfg.freq =3D clamp(mem->spi->max_speed_hz, 0U, dws->max_mem_freq);

[Severity: High]
Does this code ignore the operation-specific maximum frequency?

The spi_mem_op struct specifies op->max_freq which dictates the maximum
safe clock speed for this specific command.=20

Using mem->spi->max_speed_hz instead might cause operations with stricter
frequency limits to execute at the higher overall bus speed, potentially
leading to hardware timing violations.

> +	cfg.ndf =3D op->data.nbytes;
> +	if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
> +		cfg.tmode =3D DW_SPI_CTRLR0_TMOD_RO;
> +	else
> +		cfg.tmode =3D DW_SPI_CTRLR0_TMOD_TO;

[Severity: High]
Can enhanced transmit-only mode operations suffer from size truncation?

Enhanced Transmit Only mode uses DW_SPI_CTRLR1 to count frames to transmit,
and this is a 16-bit register.=20

While dw_spi_adjust_mem_op_size() clamps SPI_MEM_DATA_IN, it does not
clamp SPI_MEM_DATA_OUT operations. If an outbound transfer is large,
such as exactly 65536 bytes, the unclamped length will be truncated when
written to the 16-bit DW_SPI_CTRLR1 register.

> +
> +	if (op->data.buswidth =3D=3D op->addr.buswidth &&
> +	    op->data.buswidth =3D=3D op->cmd.buswidth)
> +		enh_cfg.trans_t =3D DW_SPI_ENH_CTRLR0_TRANS_TYPE_TT2;

[ ... ]

> +	enh_cfg.addr_l =3D op->addr.nbytes << 1;
> +	if (op->cmd.nbytes =3D=3D 2)
> +		enh_cfg.inst_l =3D DW_SPI_ENH_CTRLR0_INST_L_INST_L16;
> +	else if (op->cmd.nbytes =3D=3D 1)
> +		enh_cfg.inst_l =3D DW_SPI_ENH_CTRLR0_INST_L_INST_L8;
> +	else
> +		enh_cfg.inst_l =3D DW_SPI_ENH_CTRLR0_INST_L_INST_L0;
> +
> +	enh_cfg.wait_c =3D (op->dummy.nbytes * (BITS_PER_BYTE / op->dummy.buswi=
dth));

[Severity: Critical]
Can this cause a divide-by-zero crash if the operation has no dummy phase?

For operations like READ ID or standard read/write without dummies, both
op->dummy.nbytes and op->dummy.buswidth are initialized to 0.=20

Since there is no check before the division, this will cause a kernel panic
whenever such a command is sent in enhanced mode.

[Severity: High]
Additionally, could this calculation result in a value that exceeds the
hardware register limit?

If op->dummy.nbytes is 4 and op->dummy.buswidth is 1, enh_cfg.wait_c
evaluates to 32.=20

Later, dw_spi_update_config() applies a 5-bit mask to this value:

cr0 |=3D FIELD_PREP(DW_SPI_ENH_CTRLR0_WAIT_CYCLE_MASK, enh_cfg->wait_c);

Since 32 requires 6 bits, FIELD_PREP will truncate it to 0, incorrectly
configuring the controller for 0 wait cycles instead of 32.

> +
> +	dw_spi_enable_chip(dws, 0);
> +
> +	dw_spi_update_config(dws, mem->spi, &cfg, &enh_cfg);
> +
> +	dw_spi_enable_chip(dws, 1);
> +
> +	return 0;

[Severity: Critical]
Does this function complete without actually performing the SPI data
transfers?

The function enables the SPI chip and then immediately returns 0. It
appears to omit the steps to write the command, address, or data to the
data register, and does not read from the RX FIFO.=20

Will this cause read operations to return uninitialized buffer memory and
write operations to silently drop all data?

> +}
> +
>  /*
>   * Initialize the default memory operations if a glue layer hasn't speci=
fied
>   * custom ones. Direct mapping operations will be preserved anyway since=
 DW SPI

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709055204.1381=
68-1-changhuang.liang@starfivetech.com?part=3D5
