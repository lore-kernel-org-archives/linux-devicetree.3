Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4123333D6EE
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787547865; cv=none; b=FPBG6VuYq7WqZDnjY1eIgXD8uOj80m2H6by9PyAMZ0YuqUBe45AO6MluF+Z4r+FZjuuxFhUvg6n+Rg6nP7tKdr8ZAMYItrwCg0++Z1Baj/ekoMGi3cxIx4joVQk+DPs8tZLFvHcrJWHyQgCaoZUYM0624I3ar77F1vnUN46imlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787547865; c=relaxed/simple;
	bh=ABFoY8Kd/xi3PTZ5Pp7goeMiUi8sxiLqeBaaE2isV1g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OKURLD3kIz0N88C7z5OBGtcV9gtfc0+Nvm27hG09suvbZIqozNhyuZBA3PclX+XzeOQzuuydAPeWgGJOXUZpn5ffM2djKXAtp5cTy8v3/psrjfrD5naozp6R5fdqHu/IfN+UOgxHKZulciqSOnxl5z0ftYFsm7obKDp1Ucm0QPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ybl6PJIU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ybl6PJIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D601F000E9;
	Mon, 24 Aug 2026 05:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787547863;
	bh=f7wx6EGCh/T5ArQC2s1jZ97pGYD4zTjw2k8KAhE6maI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ybl6PJIUfDWaiP+K+8SNk8EVxr/R/mwFBHtWDy2SLynj9dvNkPVaeoUmBUPgYEWQ5
	 JtoyZA+NgIierYNUQG0/5ZF44t17/V1u1SSDYFAPDN1BDigf1/Dk3YpzUSjiKtBiyb
	 GfekU/WStIcAOa6CX0yySC95OiS+bteYlL0gNUqqIOWM0OGUdEa0OQPD/hbQOi6mdc
	 W2lJ1HtKEBtDnz9VkNJxNYhDd+IsoCbPkle7Z1JslIxFF+LMOQy0a2juvV+6lRNZlw
	 oouH5I1/ycLcwsPUEk9jpxC4glX/Nr1JuRNQWq0J0RlJXQ2F37YoIUYNIhD1S6mQNb
	 duV+tCcXme3NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] i3c: master: amd: Add support for in-band
 interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: robh@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824044835.2924141-3-shubhamsanjay.patil@amd.com>
References: <20260824044835.2924141-1-shubhamsanjay.patil@amd.com>
 <20260824044835.2924141-3-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 05:04:23 +0000
Message-Id: <20260824050423.82D601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Inconsistent register read order causes the polled IBI handler to =
read the wrong Target Address (DA).
- [High] Premature publication of the IBI slot causes a NULL pointer derefe=
rence in the IRQ handler.
- [High] Eager polling of the shared RX FIFO corrupts read transfers and dr=
ops IBI payloads.
--

--- Patch [2]: [PATCH v2 2/3] i3c: master: amd: Add support for in-band int=
errupts ---
commit 09c533cb3c7b670acbbd25a3bdfd78e983efb676
Author: Shubham Patil <shubhamsanjay.patil@amd.com>

i3c: master: amd: Add support for in-band interrupts

This commit adds support for receiving and dequeueing I3C in-band interrupt=
s.
The IBI operations are assembled at probe time if the capability is present=
 in
the device tree. It also introduces logic to handle IBIs that race with nor=
mal
transfers by demultiplexing the response FIFO by TID.

> diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd=
-i3c-master.c
> index ef5ad5abb788c..92a9f43f89344 100644
> --- a/drivers/i3c/master/amd-i3c-master.c
> +++ b/drivers/i3c/master/amd-i3c-master.c
[ ... ]
> @@ -206,23 +273,88 @@ static inline bool xi3c_is_resp_available(struct xi=
3c_master *master)
[ ... ]
> +static bool xi3c_xfer_resp_available(struct xi3c_master *master)
> +{
> +	u32 resp;
> +	u8 da;
> +
> +	if (master->xfer_resp_valid)
> +		return true;
> +
> +	while (xi3c_is_resp_available(master)) {
> +		resp =3D ioread32(master->membase + XI3C_RESP_STATUS_FIFO_OFFSET);
> +
> +		if (FIELD_GET(XI3C_RESP_TID_MASK, resp) !=3D XI3C_IBI_RESP_TID) {
> +			master->xfer_resp =3D resp;
> +			master->xfer_resp_valid =3D true;
> +			return true;
> +		}
> +
> +		da =3D FIELD_GET(XI3C_ADDR_MASK,
> +			       ioread32(master->membase + XI3C_IBI_TARGET_ADDR_OFFSET));

[Severity: High]
Does popping the response FIFO before reading the Target Address register
cause the wrong address to be read?

In the hardware IRQ handler, the Target Address is read before waiting for
and popping the response FIFO:

xi3c_master_handle_ibi() {
    ibi_reg =3D ioread32(master->membase + XI3C_IBI_TARGET_ADDR_OFFSET);
    da =3D FIELD_GET(XI3C_ADDR_MASK, ibi_reg);
    if (xi3c_wait_resp_atomic(master)) { ... }
    resp =3D ioread32(master->membase + XI3C_RESP_STATUS_FIFO_OFFSET);
}

If the response is popped first here, does it advance the FIFO head and cau=
se
this read to return the address of the next queued IBI (or garbage) instead=
 of
the current one?

> +		dev_dbg_ratelimited(master->dev,
> +				    "IBI from 0x%02x raced with transfer\n", da);
> +		xi3c_master_process_ibi(master, resp, da);
[ ... ]
> @@ -437,13 +605,19 @@ static int xi3c_master_read(struct xi3c_master *mas=
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
>  		usleep_range(XI3C_POLL_INTERVAL_US, 2 * XI3C_POLL_INTERVAL_US);
>  	}

[Severity: High]
Does this eager polling of the shared RX FIFO risk consuming an IBI payload
into the transfer buffer before the IBI response is processed?

If an IBI executes right before a read transfer, its payload will enter the=
 RX
FIFO. Since !xi3c_xfer_resp_available() can evaluate to true if the response
word hasn't been pushed to the Response FIFO yet, the loop might call
xi3c_master_rd_from_rx_fifo().

Could this blindly copy the IBI payload into the read transfer's buffer, le=
aving
an empty RX FIFO for xi3c_master_process_ibi() and dropping the IBI data?

[ ... ]
> @@ -1052,9 +1242,337 @@ static void xi3c_master_bus_cleanup(struct i3c_ma=
ster_controller *m)
[ ... ]
> +static int xi3c_master_request_ibi(struct i3c_dev_desc *dev,
> +				   const struct i3c_ibi_setup *req)
> +{
[ ... ]
> +	spin_lock_irqsave(&master->ibi.lock, flags);
> +	for (i =3D 0; i < ARRAY_SIZE(master->ibi.slots); i++) {
> +		if (!master->ibi.slots[i]) {
> +			data->ibi_slot =3D i;
> +			master->ibi.slots[i] =3D dev;
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> +
> +	if (data->ibi_slot < 0) {
> +		dev_err(master->dev, "IBI: no free slot for addr 0x%02x\n",
> +			dev->info.dyn_addr);
> +		i3c_generic_ibi_free_pool(data->ibi_pool);
> +		kfree(data);
> +		return -ENOSPC;
> +	}
> +
> +	i3c_dev_set_master_data(dev, data);
> +
> +	return 0;
> +}

[Severity: High]
Can an incoming IBI trigger a NULL pointer dereference if it arrives right
after the slot is published but before the master data is set?

If the controller's IBI ACK is already armed by another device, and the har=
dware
sends an IBI after master->ibi.slots[i] =3D dev but before
i3c_dev_set_master_data(dev, data), the IRQ handler (xi3c_master_process_ib=
i)
could look up the device and call i3c_dev_get_master_data(dev).

Would this return NULL and result in a crash when accessing data->ibi_pool?
Should i3c_dev_set_master_data(dev, data) be called before the slot is made
visible to the IRQ handler?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824044835.2924=
141-1-shubhamsanjay.patil@amd.com?part=3D2
