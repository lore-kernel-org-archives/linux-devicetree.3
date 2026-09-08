Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA03D49552B
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861617; cv=none; b=dKvrhR11890h17StncN+a1pSsTaYBBzbsjcYr+fwE8FwUa3VwQYJia3W7MZLmJbfY+oOwv6ZqCteSKajmuQSuI1b1OU4n0aOs3jrO5dPsrGz6bpEsql1h7OMluMCPTEgOrEZY0VTqE0N7NNiS//0l8/nPzsN9S85owxMBm5GooU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861617; c=relaxed/simple;
	bh=GYKpmvQ2QIDlFJATeHFAWM+9PPQ+EYFrNQ6amZ+WTEc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rq3MCzV7YGf6MtBLmwuSfq14mVI+s1TfxtXmIZ8P0BN4MUcieWuyeeyCaCB6wSFQGj9UtlDlWtpl1WgRjkNvc1kqrxiRsTavMIu/6s2YjeYjR+j4DiDoCvQF6GMlTFIIO2qKihNKgvxFbPIK6M/+X2YjWK/r91MhJ6IHae/IjHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFJx8F6s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFJx8F6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109811F00A3A;
	Tue,  8 Sep 2026 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861615;
	bh=nou0oXP9hRCLsU1cEsbfDPsg4+dtEPcqi5lmpwYxVeE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QFJx8F6s5l2tVNbdHuom48d6KaLGeJ1nTW5wa19KbAn9GEK3G9jucM7sdHTi6ETWm
	 4hG71pAjeoxCUqPRGTuV0i9Vztff7P1kmWx4DQWtASBDqLVt/G1jNORJSLi5wZ1hSO
	 cUAsy9pS93f3Ey7jo9tEC+pMDMceUJONa9Puuwu+n6ZhpLnrnFE0tK1ASfq90FdYey
	 hn0pafezuQp/d3UhoRatESfmnCTskNHXWMARa7/Pp2yM1xnw2D+1mBuVPWEHaLkc10
	 LaU1XoLw77QfVLICCIld2xpRlUWVzPpkCWiclhgKhVjbHyhwVyzkTfyVJINWWB8W/p
	 vhW55etrwpPFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] i3c: master: amd: Add support for in-band
 interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260908094257.3196120-3-shubhamsanjay.patil@amd.com>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-3-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:00:14 +0000
Message-Id: <20260908100015.109811F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Eagerly draining the shared RX FIFO during a polled read transfer =
consumes in-flight IBI payloads, corrupting both the IBI and the transfer d=
ata.
- [High] Freeing the IBI pool before the workqueue is flushed causes a UAF =
and NULL pointer dereference if a stray IBI is queued after disable.
--

commit 4e71fd809febc81aa5e7bc809c1ce4fa618ec5a7
Author: Shubham Patil <shubhamsanjay.patil@amd.com>

i3c: master: amd: Add support for in-band interrupts

Add support for receiving and dequeueing I3C in-band interrupts. IBI
support is optional at synthesis time, so the ops are assembled at probe
time. The controller interrupt carries IBI events only.

> diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd=
-i3c-master.c
> index ef5ad5abb788c..8a8ab3cd2fa40 100644
> --- a/drivers/i3c/master/amd-i3c-master.c
> +++ b/drivers/i3c/master/amd-i3c-master.c

[ ... ]

> @@ -606,14 +678,21 @@ static int xi3c_master_read(struct xi3c_master *mas=
ter, struct xi3c_cmd *cmd)
>  		return ret;
>  	}
> =20
> -	if (!(status_reg & XI3C_RD_FIFO_NOT_EMPTY_MASK))
> +	/*
> +	 * No data queued means this read produced none, unless what is queued
> +	 * is an IBI response that raced with it; xi3c_xfer_resp_available()
> +	 * consumes that case so the wait for our own data can continue.
> +	 */
> +	if (!(status_reg & XI3C_RD_FIFO_NOT_EMPTY_MASK) &&
> +	    xi3c_xfer_resp_available(master))
>  		return 0;
> =20
>  	timeout =3D jiffies + msecs_to_jiffies(XI3C_XFER_TIMEOUT_MS);
> =20
>  	/* Read data from rx fifo */
> -	while (cmd->rx_len > 0 && !xi3c_is_resp_available(master)) {
> +	while (cmd->rx_len > 0 && !xi3c_xfer_resp_available(master)) {

[Severity: High]
Could this loop eagerly consume in-flight IBI payloads and corrupt both the
IBI and the transfer data?

If a hardware target asserts an IBI right at the start of a read transfer,
its payload might stream into the shared RD_FIFO. Since the IBI's response
word is not posted to RESP_STATUS_FIFO until the transaction finishes, it
appears xi3c_xfer_resp_available() could return false here.

The polling loop would then execute xi3c_master_rd_from_rx_fifo(), blindly
draining the untagged IBI bytes from RD_FIFO into the transfer's buffer
before validating ownership. Later, when the IBI processing path
(xi3c_master_process_ibi) runs, it expects its payload to still be in the
RX FIFO and may underflow the FIFO or steal the transfer's actual data.

>  		if (time_after(jiffies, timeout)) {
>  			dev_err(master->dev, "XI3C read timeout\n");
>  			return -EIO;
>  		}
>  		xi3c_master_rd_from_rx_fifo(master, cmd);
>  		usleep_range(XI3C_POLL_INTERVAL_US, 2 * XI3C_POLL_INTERVAL_US);
>  	}

[ ... ]

> @@ -1052,9 +1243,338 @@ static void xi3c_master_bus_cleanup(struct i3c_ma=
ster_controller *m)
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
> +	/*
> +	 * Clearing the slot above keeps the IBI handler from finding this
> +	 * device, but a handler already running may be copying a payload into
> +	 * the pool. Wait for it to finish before the pool is freed below.
> +	 */
> +	synchronize_irq(master->irq);
> +
> +	i3c_generic_ibi_free_pool(data->ibi_pool);
> +	i3c_dev_set_master_data(dev, NULL);
> +	kfree(data);

[Severity: High]
Does freeing the IBI pool here before the workqueue is flushed create a
use-after-free and NULL pointer dereference risk?

During device teardown, it looks like an asynchronous IBI could race
with device removal. If the core calls xi3c_master_disable_ibi() and then
proceeds to call xi3c_master_free_ibi(), an IBI interrupt might concurrently
fire.

The IRQ handler calling xi3c_master_process_ibi() could unconditionally que=
ue
a work item to dev->ibi->wq. By the time the core calls destroy_workqueue(),
which flushes the queue, the work item would reside in freed memory.

Furthermore, when the flushed work executes, it calls
xi3c_master_recycle_ibi_slot() which would dereference the now-NULL master
data:

xi3c_master_recycle_ibi_slot() {
    struct xi3c_i3c_dev_data *data =3D i3c_dev_get_master_data(dev);
    i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
}

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908094257.3196=
120-1-shubhamsanjay.patil@amd.com?part=3D2
