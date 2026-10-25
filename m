Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938220;
	b=ZQMwiRjbg58mnjdb2OQY7RJ5RCLGK6zAwgVlFy3VQQNSQIpeFgljEmfZ2G1JTogUn9vg
	 kaGY121n1GnaX8ONN94jEitK3WSMXKFJRQ6RQYYIQ9QqOC0rsSW6EFbF/HH26zGcMs/xA
	 rCEa4H64NXnU25wV4KD+f5Ufrpzi+vYnoaq0HPf566YJXEV6UnvgjVf1B8l5f/m8rrpFN
	 AYr6SGhjLVba6HFmfew/lExO/4IMH7mrjs+gbAT0P4z7gXuAVw3lorIIliLDIowTf/gtI
	 cz4u/oQz09+aYDk3uu6/hWK+9fc8JvDIK3s2s/JA03Rl4nXC/DhdMTt9uhgZeaOa0Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938220;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZhbMJhI8iGTCtni0sYru210nv+ngobeaGqxIs/tggkw=;
	b=pprxBNcpM1MSgvh+4vxSkqycKBmsTk/8LMfic2DbOKDGqTQJMK/uGLd7FW+8gnjtoUla
	 RSdPThdd0+idYR32D+ROFTdSUxehUL72qwyLzVoYL84ZkbteYtjwTfNljgXkWdzAFeHRL
	 IuTmaPTovrHxS1DjJIRn4kviRnKU9rYgnqfd33caegeQpWLGpqQlp8qG1FXrDks0lwg8c
	 GVwDexlnUnMudh11lTpeqdTo6eTvTEEX9Rjrv7uF9umQg8JjODYApUcjBzDPqOGb+2blp
	 Wybm0relyhnFySRDS/OYOn/y2+rTBbare2Um78Ge+LOjKvKd3bytIz2ZPbSuKtK+Zcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HNAcNEEb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45A8606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HNAcNEEb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206171F01825;
	Sun, 25 Oct 2026 14:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792938219;
	bh=ZhbMJhI8iGTCtni0sYru210nv+ngobeaGqxIs/tggkw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HNAcNEEbwRmhcIhsTjYVtZth0nktgaWgEoVstHrxMK/kDEVVYtLKStChJyi6eDjww
	 zH+2ISjKY2U6b4KBGh6tzj2bIALXRbVOimNJO3MkO2XuqDvUjKbszTIsbZ79wBeQov
	 z1kEebNV5RNXTXoX5mYGpSuFFAQQk7q09ntLpRJqZtWcON2ZnQveptKUzyTpKXCOQt
	 LY/PuLj0g2YuFxklW7eX/rN1TXxy25m+HYgNye6jKpGkwKxc3x6QzjED/SmztErGRY
	 DaRV6h3qtWXQ6/V1Ft/EO6ckg3XYK5VnFhgPpkFt/dk6d4k/bLEq7ECgBy/dZpSTrz
	 ekDVQck50RfuQ==
Message-ID: <sashiko-outbox-184247@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/2] mmc: jz4740: Use the integrated DMA controller
 on the X1600
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261025140325.73204-3-olivier@mgcrea.io>
References: <20261025140325.73204-1-olivier@mgcrea.io>
 <20261025140325.73204-3-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 14:23:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mmc: jz4740: unreset bytes_xfered on idma read error masks I/O fai=
lure
--

commit 03cdfaf8519d89524e6b08dadbfa32014a811a97
Author: Olivier Louvignes <olivier@mgcrea.io>

mmc: jz4740: Use the integrated DMA controller on the X1600

This commit adds support for the MSC's integrated descriptor-based DMA
controller on the Ingenic X1600 when external DMA channels are not
provided in the device tree. It falls back to PIO for unaligned buffers,
transfers smaller than a block, or segments not aligned to the block size.

> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
> index 6a3c26b7c82d8..300ad2a01b177 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c

[ ... ]

> @@ -371,13 +411,101 @@ static int jz4740_mmc_start_dma_transfer(struct jz=
4740_mmc_host *host,

[ ... ]

> +static void jz4740_mmc_idma_wait_read(struct jz4740_mmc_host *host,
> +				      struct mmc_data *data)
> +{
> +	unsigned int timeout =3D 10000;
> +
> +	while (!jz4740_mmc_idma_read_done(host) && --timeout)
> +		udelay(1);
> +
> +	if (!timeout && !data->error) {
> +		dev_err(mmc_dev(host->mmc), "DMA did not finish a read\n");
> +		data->error =3D -EIO;
> +	}
> +}

[ ... ]

> @@ -786,6 +929,9 @@ static irqreturn_t jz_mmc_irq_worker(int irq, void *d=
evid)
>  			 */
>  			timeout =3D jz4740_mmc_start_dma_transfer(host, data);
>  			data->bytes_xfered =3D data->blocks * data->blksz;
> +		} else if (host->idma_active) {
> +			/* Running since the command started */
> +			data->bytes_xfered =3D data->blocks * data->blksz;
>  		} else if (data->flags & MMC_DATA_READ)
>  			/* Use PIO if DMA is not enabled.
>  			 * Data transfer direction was defined before
> @@ -812,6 +958,9 @@ static irqreturn_t jz_mmc_irq_worker(int irq, void *d=
evid)
>  		fallthrough;
> =20
>  	case JZ4740_MMC_STATE_SEND_STOP:
> +		if (host->idma_active && (data->flags & MMC_DATA_READ))
> +			jz4740_mmc_idma_wait_read(host, data);

[Severity: High]
Can a failed or timed-out integrated DMA read complete with BLK_STS_OK and
return stale buffer contents to the caller?

In jz_mmc_irq_worker() under JZ4740_MMC_STATE_TRANSFER_DATA, when
host->idma_active is true, data->bytes_xfered is set to
data->blocks * data->blksz before JZ_MMC_IRQ_DATA_TRAN_DONE is polled and
before jz4740_mmc_idma_wait_read() verifies that the DMA engine has drained
the read data to memory.

If jz4740_mmc_idma_wait_read() times out in JZ4740_MMC_STATE_SEND_STOP, it
sets data->error =3D -EIO, but leaves data->bytes_xfered set to the full
request size (and if data->error was already set earlier by
jz4740_mmc_transfer_check_state() or jz_mmc_irq(), jz4740_mmc_idma_wait_rea=
d()
still spins for up to 10 ms while leaving data->bytes_xfered untouched).

When the request completes, mmc_blk_mq_poll_completion() enters
mmc_blk_mq_rw_recovery():

drivers/mmc/core/block.c:mmc_blk_mq_rw_recovery() {
    ...
	err =3D __mmc_send_status(card, &status, 0);
	if (err || mmc_blk_status_error(req, status))
		brq->data.bytes_xfered =3D 0;
    ...
	if (brq->data.bytes_xfered)
		return;
    ...
}

Because the bus transfer from the card finished cleanly and the failure
occurred in the host's integrated DMA controller, __mmc_send_status()
succeeds without card status error bits, so brq->data.bytes_xfered is not
cleared. Then mmc_blk_mq_complete_rq() sees nr_bytes equal to the full
request length and finishes the block request with BLK_STS_OK:

drivers/mmc/core/block.c:mmc_blk_mq_complete_rq() {
	struct mmc_queue_req *mqrq =3D req_to_mmc_queue_req(req);
	unsigned int nr_bytes =3D mqrq->brq.data.bytes_xfered;

	if (nr_bytes) {
		if (blk_update_request(req, BLK_STS_OK, nr_bytes))
			blk_mq_requeue_request(req, true);
		else
			__blk_mq_end_request(req, BLK_STS_OK);
	} else if (!blk_rq_bytes(req)) {
    ...
}

Should data->bytes_xfered only be set after the transfer and
jz4740_mmc_idma_wait_read() succeed without data->error (or be reset to 0 on
error), and should jz4740_mmc_idma_wait_read() skip waiting when data->error
is already set?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025140325.7320=
4-1-olivier@mgcrea.io?part=3D2
