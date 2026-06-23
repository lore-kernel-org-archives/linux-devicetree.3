Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0EA3D47BD
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215857; cv=none; b=Jw7ot4PinV3rAVB1+uAxM+d/ByvkD44HMuWTBPwP1iJUrg1hHvLVHgPeysbUoq5yIqc6Obh7ZzEdPpAZ1EK6sm98GFTIojoAXxY/Rp1QfTwma/Fo4lAE/5vN92L4cGXZW+hmTreW+yJfmZItcdmfAbNFi0KKK8Puf4tntI81NoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215857; c=relaxed/simple;
	bh=V9FCgp1Tm7Bile41Gzm8Z0AXeeQf3cy4HPjDnQkb/qo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PTMBz+kUS3LmMAXS99NIyGqHtHNqKFg/O5P5GkvNoJdUZ9zna+KnyZIsDyBbOAIVbVBSZkoh26JeqHoW0DyBPWPfZ3MBTRfh4Lug9ZPIzUCKccGoUN9bdnaF5W23YxeelZK0/ZC+9vqy+1KIr2aDVU31OiLS7fuCKxWrxcTD3Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6Fen6Vb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6Fen6Vb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFCA1F000E9;
	Tue, 23 Jun 2026 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782215855;
	bh=B0cjtnySAUjFzUbkZgzEp21wos//cpT73yeJFHik7mk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l6Fen6VbaEK9dZLcZZSmhDp0Ml/LFdeEdkaEAfqPIFKCB5UTY35LAEWQJw7VgGgnF
	 JAVkcW8sj5fVAi7D+ZtvaLDTiftXX8/GphHCmEaqv8E70KHWi14cS6Ym/ITuut6z5t
	 6WW6GKbMuRnxlbcOOYXZMbHI5T8wVBYr99fJyL1oiQNpPngZbTPEHLuDSDFXoi6G2h
	 MkQdAmxLK4N/HprNbFyUjUdiagDgOEU2+qB8x10RgnRIYqMKdXzbBZ5ztQhk0fXRoc
	 iyv21ZQBo9wRD0kRFJSJAJKso7/x9C4jPv/cAgEJuAf/Ja3s+7+tPT4XOvNzbRuqk0
	 cfu/52uOtJKZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] i3c: master: Add driver for AMD AXI I3C master
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260623114417.2578189-3-shubhamsanjay.patil@amd.com>
References: <20260623114417.2578189-1-shubhamsanjay.patil@amd.com>
 <20260623114417.2578189-3-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 11:57:34 +0000
Message-Id: <20260623115735.2BFCA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver incorrectly calculates `actual_len` for early-terminate=
d read transfers, over-reporting received bytes and exposing padding data.
- [Medium] Mixing goto-based error handling with scope-based cleanup (__fre=
e) in the same function.
- [Medium] Zero-length I2C/I3C transfers with NULL buffers are incorrectly =
rejected with -EINVAL.
- [Medium] Reaching DAA limits (maximum devices or exhausted dynamic addres=
ses) causes the driver to discard all successfully enumerated devices.
--

commit 31faf134bb0fbc7c1ffe6801a15207207118c870
Author: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

i3c: master: Add driver for AMD AXI I3C master controller

Add an I3C master driver and maintainers fragment for the AMD I3C bus
controller.

> diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd=
-i3c-master.c
> new file mode 100644
> index 0000000000000..34ab1028c3ce8
> --- /dev/null
> +++ b/drivers/i3c/master/amd-i3c-master.c
[ ... ]
> +static void xi3c_master_rd_from_rx_fifo(struct xi3c_master *master,
> +					struct xi3c_cmd *cmd)
> +{
> +	u16 rx_data_available;
> +	u16 copy_len;
> +	u16 len;
> +
> +	rx_data_available =3D xi3c_rd_fifo_level(master);
> +	len =3D rx_data_available * XI3C_WORD_LEN;
> +
> +	if (!len)
> +		return;
> +
> +	copy_len =3D min_t(u16, len, cmd->rx_len);
> +	xi3c_readl_fifo(master->membase + XI3C_RD_FIFO_OFFSET,
> +			(u8 *)cmd->rx_buf, copy_len);
> +
> +	cmd->rx_buf =3D (u8 *)cmd->rx_buf + copy_len;
> +	cmd->rx_len -=3D copy_len;

[Severity: High]
Does this logic correctly account for early-terminated read transfers?

If an I3C target terminates a read early with a non-word-aligned byte count,
the hardware RX FIFO might indicate a word is available, but padding bytes
are included. This driver reads the full word and decrements rx_len. Later
in xi3c_master_i3c_xfers(), actual_len is calculated from this modified
rx_len, which could over-report the received bytes and expose padding data
to upper layers.

> +}
> +
> +static int xi3c_master_read(struct xi3c_master *master, struct xi3c_cmd =
*cmd)
> +{
> +	unsigned long timeout;
> +	u32 status_reg;
> +	int ret;
> +
> +	if (!cmd->rx_buf || cmd->rx_len > XI3C_MAXDATA_LENGTH)
> +		return -EINVAL;

[Severity: Medium]
Will this fail on valid zero-length transfers? Zero-length reads, such as
standard SMBus Quick commands or i2cdetect scans, typically have rx_len =3D=
 0
and a NULL rx_buf. The check here would incorrectly reject them.

[ ... ]
> +static int xi3c_master_write(struct xi3c_master *master, struct xi3c_cmd=
 *cmd)
> +{
> +	unsigned long timeout;
> +	u16 cmd_len;
> +
> +	if (!cmd->tx_buf || cmd->tx_len > XI3C_MAXDATA_LENGTH)
> +		return -EINVAL;

[Severity: Medium]
Similarly, does this incorrectly reject valid zero-length writes with a NULL
tx_buf?

[ ... ]
> +static int xi3c_master_do_daa(struct i3c_master_controller *m)
> +{
> +	u8 pid_bufs[XI3C_MAX_DEVS][XI3C_DAA_SLAVEINFO_READ_BYTECOUNT] =3D {};
> +	struct xi3c_master *master =3D to_xi3c_master(m);
> +	struct xi3c_xfer *xfer __free(kfree) =3D NULL;

[Severity: Medium]
Is it safe to mix __free() scope-based cleanup with goto-based error handli=
ng
in this function?

There are explicit kernel guidelines against combining goto-based error
handling with __free() scope-based resource management in the same function,
as it can lead to fragile and confusing execution flow.

[ ... ]
> +	while (true) {
> +		struct xi3c_cmd *cmd =3D &xfer->cmds[0];
> +		u8 daa_byte;
> +
> +		if (master->daa.index >=3D XI3C_MAX_DEVS) {
> +			ret =3D -ENOSPC;
> +			goto err_daa;
> +		}
> +
> +		addr =3D i3c_master_get_free_addr(m, last_addr + 1);
> +		if (addr < 0) {
> +			ret =3D addr;
> +			goto err_daa;
> +		}

[Severity: Medium]
If the bus reaches the maximum device count or runs out of free dynamic
addresses, jumping to err_daa will abort the enumeration process without
registering any devices that were successfully enumerated prior to this.

Is it intended to discard the earlier successfully assigned devices instead
of keeping them?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623114417.2578=
189-1-shubhamsanjay.patil@amd.com?part=3D2
