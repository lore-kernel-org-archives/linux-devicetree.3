Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9403C8716
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939027; cv=none; b=O/0wTs0kSO7wF+pENZmLHEtObCMYmySLzNWoqrdi/DHqlAQsS+OK1upaV8Gb9i/hzGiah5AFMTFGh447RiLtHBtPRxbpDSa/rMz+0goF1qP47c3qGDpX6XDTGmk3YUMZV1WXGp17PTLkYhe2OSoDEDPJ8Q0T1IiYR/RCfT0FpnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939027; c=relaxed/simple;
	bh=vtGBICHvKKx33s1d3Ab3rjc41j9P9OtgnkvhDWBc+NA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G94IBmqRbr496TULMjp/oXc6F+b2SRIz3Ub8h9N2df9ICMUai9JDODP7JVjV42AmjgREAXa3Pyjglsm5sX2be/BjeWPOXKrkn4OD6hyKdVK2Q1x9NaxL979xb2GcOUVdKdkNn/ShInlBJn/LeMjIxjwC6aN5EJeMAfLcleTt7oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4z2qESF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4z2qESF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2141F00A3F;
	Wed,  9 Sep 2026 07:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939022;
	bh=0wi31xFdAeTbe8G9B4OcOaV58thcDlSPJKfTR4bbUqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g4z2qESFfgAsSUNDChybdm1VhlySgaqgIvxmquJvllRlosyB4lIHMyYi/s5W6vYcm
	 +URyuU6UcoER1RvZv0U16qNz7hZH8cPdRgN9P06tq44w9XkCUKoqPk+X/U9T6ARbGD
	 klVXPjo6n/hzqmMOXaH3vNK6QOtgD7OVnzWv1MMhvd24xTp2vAJgXCKpPp/qFprjFf
	 Obq0WvQuVN/CqoHobe+oxdVI0Ay1DBtz9kp7/Zw5W4ML69D5iTEP6HGViWrlrltDu0
	 tUYtoLhiCiXrp800yrCTyJFTieVJyqBG1RcU+I2RfqQkBFpxRrwmIDcjochxPIroCd
	 KTFuWcGfUf8Jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] i3c: master: amd: Add support for in-band
 interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: robh@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org
In-Reply-To: <20260909071340.3649271-3-shubhamsanjay.patil@amd.com>
References: <20260909071340.3649271-1-shubhamsanjay.patil@amd.com>
 <20260909071340.3649271-3-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 07:30:21 +0000
Message-Id: <20260909073021.CE2141F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Polling the shared RX FIFO during a read transfer steals an in=
-flight IBI's payload data, causing data corruption.

Pre-existing issues:
- [High] Unaligned pointer dereference in FIFO I/O accessors causes undefin=
ed behavior.
--

commit b1cc4b97eb8d4b5fc534199add697a3f1a306c98
Author: Shubham Patil <shubhamsanjay.patil@amd.com>

i3c: master: amd: Add support for in-band interrupts

This commit adds support for receiving and dequeueing I3C in-band interrupt=
s.
The ops are assembled at probe and callbacks registered when the appropriate
property is present. IBIs share the response and read FIFOs with normal
transfers and are tagged with TID 0x0F.

> diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd=
-i3c-master.c
> index ef5ad5abb788c..a50445530a430 100644
> --- a/drivers/i3c/master/amd-i3c-master.c
> +++ b/drivers/i3c/master/amd-i3c-master.c
[ ... ]
> @@ -437,13 +606,19 @@ static int xi3c_master_read(struct xi3c_master *mas=
ter, struct xi3c_cmd *cmd)
[ ... ]
>  	/* Read data from rx fifo */
> -	while (cmd->rx_len > 0 && !xi3c_is_resp_available(master)) {
> +	while (cmd->rx_len > 0 && !xi3c_xfer_resp_available(master)) {
>  		if (time_after(jiffies, timeout)) {
>  			dev_err(master->dev, "XI3C read timeout\n");
>  			return -EIO;
>  		}
>  		xi3c_master_rd_from_rx_fifo(master, cmd);

[Severity: Critical]
Does this code steal payload bytes from an in-flight IBI when polling the
shared RX FIFO during a read transfer?

If an IBI is ACKed just before a read transfer starts, its payload begins
filling the RX FIFO while the IBI is still on the bus. Because the IBI hasn=
't
completed, its response word is not yet in the RESP FIFO.

The read transfer's polling loop in xi3c_master_read() sees RD_FIFO_NOT_EMP=
TY
and eagerly drains the RX FIFO, taking the IBI payload into cmd->rx_buf.
When the IBI completes and its response finally appears,
xi3c_master_process_ibi() will expect the payload to still be in the RX FIF=
O,
but instead consumes the read transfer's data, permanently desynchronizing
the RX FIFO.

>  		usleep_range(XI3C_POLL_INTERVAL_US, 2 * XI3C_POLL_INTERVAL_US);
>  	}
[ ... ]
> @@ -1052,9 +1243,338 @@ static void xi3c_master_bus_cleanup(struct i3c_ma=
ster_controller *m)
[ ... ]
> +static void xi3c_master_process_ibi(struct xi3c_master *master, u32 resp=
, u8 da)
> +{
[ ... ]
> +	slot->len =3D 0;
> +	if (len) {
> +		xi3c_readl_fifo(master->membase + XI3C_RD_FIFO_OFFSET,
> +				slot->data, len);

[Severity: High]
This is a pre-existing issue, but does passing slot->data to
xi3c_readl_fifo() cause an unaligned pointer dereference?

i3c_generic_ibi_alloc_pool() allocates a single contiguous buffer for all I=
BI
slots. If max_payload_len is not a multiple of 4, the slot->data pointers f=
or
subsequent slots will not be 4-byte aligned.

When this unaligned slot->data pointer is passed to xi3c_readl_fifo(), it
eventually calls xi3c_readsl_be(). That accessor casts the void * buffer to
a u32 * and dereferences it directly without using put_unaligned():

drivers/i3c/master/amd-i3c-master.c:xi3c_readsl_be() {
    u32 *buf =3D buffer;
    while (count--)
        *buf++ =3D ioread32be(addr);
}

This can cause a kernel crash due to an alignment fault on architectures th=
at
strictly enforce alignment.

> +		slot->len =3D len;
> +	}
> +
> +	i3c_master_queue_ibi(dev, slot);
> +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> +
> +	return;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909071340.3649=
271-1-shubhamsanjay.patil@amd.com?part=3D2
