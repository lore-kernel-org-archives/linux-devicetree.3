Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB75466AEF
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709129; cv=none; b=il0IdV3SqKmBeC6FKN/pzNyAUMmBlapw4DKqBXOYrS2vCHQYpxMsetYHl8jyKbD19HRdwsVm7ZoQeuMnH/nz2UGcCTDsEZECR+3zv8MRALvZrhyTf1Frqd38bnjClAXCqXp7YsRVGuNc+JNsFs80gNW8VEBZ9l++jB4MBcu04k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709129; c=relaxed/simple;
	bh=BE9MULq+r86Jt4iDc7PXZTQnV4s9riebEvsdMM1QcsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fh9tyACOasMRA6HU8YTtlEBv2WgrG0+o/2NdW0R/mCqZpFKwB7VdghO+eOA1RHkZWjmNcVCsVXo/I2dg4WZn7DBJ4o8X9kXqw7lA93foHRN2yrQYzN38XItgzE4bUFzV8NMg8h3Cu1y8sClY/45TyihQ+bWIQ9ZzoAJQnXLdefo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTGZ2w59; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTGZ2w59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA1A1F00A3A;
	Fri, 14 Aug 2026 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786709127;
	bh=ah4/xGc+OMD64RAmYLXzgpjk3qixWzswb1EU2KSAzz0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NTGZ2w59P7YOIPBUg5/VW2KPtIaNnnDKMW9cNlKN94wkJCOO2Fjw8Oh4miCXtp7Co
	 4npK23g0JF7p5/zXwIM69qzF1N89xTNEz2t/P5GqaBU3cAmbhg2auU/dxvccXeJUPq
	 xKaTEBT+VAr3kWRdT1ZwPxGSs+8di6uVj2wTrGfFmNrsfN63voTCKT9nmH2eDI9LVp
	 Aq9EATz0Ruiw9DOm1wc/m/9zr9onbx6FeDyHAEI7Q2G2koMgJkU8gi8Kql3/tUtVNw
	 mrVNr/PD8JJrWlZHz2FIpWAyq5d3O8fe2suu+nRM7SXvAWQP04FeaD6kgJVk7N9wb+
	 ABmbrpPbTwSIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] i3c: master: amd: Add support for in-band
 interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260814115155.3974988-3-shubhamsanjay.patil@amd.com>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-3-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 12:05:26 +0000
Message-Id: <20260814120526.CAA1A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] ACKed In-Band Interrupts (IBIs) are permanently discarded when the=
y race with normal transfers.
- [High] Eager polling of the shared RX FIFO corrupts read transfers with I=
BI payload data if an IBI wins arbitration.
- [High] Race condition in IBI teardown allows late IBIs to be queued after=
 the generic core's completion check, leading to a Use-After-Free.
- [Medium] The controller-wide IBI enable refcount is decremented even if d=
isabling the target on the bus fails.
--

--- Patch [2]: [PATCH 2/3] i3c: master: amd: Add support for in-band interr=
upts ---
commit 49feb531b9ade85c295172ceec9457d5f98c1d0d
Author: Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: i3c: master: amd: Add support for in-band interrupts

This commit adds support for receiving and dequeueing I3C in-band
interrupts (IBIs). The controller interrupt carries IBI events only, and
the IBI ACK enable and its interrupt mask are controller-wide. It handles
demultiplexing shared response and read FIFOs when IBIs race with normal
transfers.

> diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd=
-i3c-master.c
> index ef5ad5abb788c..d47b04326ea46 100644
> --- a/drivers/i3c/master/amd-i3c-master.c
> +++ b/drivers/i3c/master/amd-i3c-master.c
[ ... ]
> @@ -206,23 +269,79 @@ static inline bool xi3c_is_resp_available(struct xi=
3c_master *master)
[ ... ]
> +static bool xi3c_xfer_resp_available(struct xi3c_master *master)
> +{
> +	u32 resp;
> +	u16 len;
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
> +		len =3D FIELD_GET(XI3C_RESP_BYTES_MASK, resp);
> +		dev_dbg_ratelimited(master->dev,
> +				    "IBI raced with transfer, dropping %u bytes\n",
> +				    len);
> +		xi3c_master_drain_ibi_fifo(master, len);
> +	}
> +
> +	return false;
> +}

[Severity: High]
Since the hardware has already ACKed the IBI on the bus, doesn't draining
and discarding the IBI response here mean it is permanently lost?=20

If an IBI arrives while the driver is executing a normal transfer, the
driver masks the IBI interrupt, but the hardware still ACKs the IBI on the
bus. The target device won't resend the IBI once it is ACKed. Could this
cause essential target events like sensor data ready or hot-join requests to
be dropped entirely?

[ ... ]
> @@ -437,13 +575,19 @@ static int xi3c_master_read(struct xi3c_master *mas=
ter, struct xi3c_cmd *cmd)
[ ... ]
>  	/* Read data from rx fifo */
> -	while (cmd->rx_len > 0 && !xi3c_is_resp_available(master)) {
> +	while (cmd->rx_len > 0 && !xi3c_xfer_resp_available(master)) {
>  		if (time_after(jiffies, timeout)) {
>  			dev_err(master->dev, "XI3C read timeout\n");
>  			return -EIO;

[Severity: High]
Is it safe to eagerly poll the shared RX FIFO before validating the
transfer response?

If an IBI wins arbitration concurrently, its payload might enter the shared
RX FIFO first. Because xi3c_master_rd_from_rx_fifo() is called within this
loop before the transfer's own response word arrives, it seems the driver
might mistakenly read the IBI payload bytes directly into the normal read
transfer's buffer. Could this corrupt normal read transfers with IBI
payload data?

[ ... ]
> @@ -1052,9 +1207,296 @@ static void xi3c_master_bus_cleanup(struct i3c_ma=
ster_controller *m)
[ ... ]
> +static void xi3c_master_free_ibi(struct i3c_dev_desc *dev)
> +{
> +	struct xi3c_i3c_dev_data *data =3D i3c_dev_get_master_data(dev);
> +	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> +	struct xi3c_master *master =3D to_xi3c_master(m);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&master->ibi.lock, flags);
> +	master->ibi.slots[data->ibi_slot] =3D NULL;
> +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> +
> +	i3c_generic_ibi_free_pool(data->ibi_pool);
> +	i3c_dev_set_master_data(dev, NULL);
> +	kfree(data);
> +}
[ ... ]
> +static int xi3c_master_disable_ibi(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> +	struct xi3c_master *master =3D to_xi3c_master(m);
> +	int ret;
> +
> +	ret =3D i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SI=
R);
> +
> +	xi3c_master_ibi_disarm(master);
> +
> +	return ret;
> +}

[Severity: Medium]
If i3c_master_disec_locked() fails (for example, if the target NACKs the
DISEC command), the device is still considered enabled by the core. Does
unconditionally calling xi3c_master_ibi_disarm() here risk dropping the
master->ibi.enabled_count prematurely? This could unintentionally mask the
global IBI interrupt.

[Severity: High]
Does this teardown sequence need a synchronization barrier (like
synchronize_irq()) to ensure the hard IRQ handler has finished processing
events?

If a late IBI fires just before the DISEC command, the IRQ might be pending
on another CPU. Because xi3c_master_disable_ibi() completes without waiting
for the IRQ, the core might see no pending IBIs and proceed to call
xi3c_master_free_ibi(), freeing the data->ibi_pool.

Could the concurrent IRQ handler then execute, copy the payload, and queue
a work item that accesses the now-freed IBI pool?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814115155.3974=
988-1-shubhamsanjay.patil@amd.com?part=3D2
