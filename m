Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D34C352001
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281948; cv=none; b=iG/t3YMBUf1dUWnVZ59IiN0NU+QHdks6HS/cHU8yNPcB9swuXRCu9lbPlO/TrBLCRpQfBx74sSiHP/7x82i1TYKpBUfHm5RPKgOZmko1XDkeMLf7R84YDOEsF+e+o+kEZqmNMF/SmNaB1NX6CClnCXOAv8PI3qunz1eTC8V7iGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281948; c=relaxed/simple;
	bh=2mhk7rGujPTlL8hrC8aOBubRwN7Pweuf4Tr8vFbOn1U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tYlYtdp6cH0FJ1I31OqhmeV7r0woVYqqtJoWEtjP8fD4xQl0y6y4aFSGU90ENuYk/uJnwvXFtTiwIOmLX+L8KJ+ge5QawM9HXuhK6KpcCbzIvVgAanYneWAy4lP92Hwz/6NYYwUHF4J4ryepT4Xkg4cKM9K/XWvVA5fsPjlVZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5MmG2Yt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5MmG2Yt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152F51F000E9;
	Wed, 20 May 2026 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779281946;
	bh=Bl1Q72qg4WZKjQkqHbWz1XkZiuXY9vvmLOgDjYKf59s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e5MmG2YtkBAWLiMh2Ep5hI+DfAXOJP38mx3oMVU04xg8xfOYe9VTU6YeI498zbx6C
	 PLeBzS57wTtbQcphnOnmYQoKxpVb/+AY2v9A3OS5Ff9YHw9hiaQzvETWxXt8Zl2Ia+
	 ipSvNqeaI3sJIF32HPH/7p505kOPubgZ+Q0Kh+WitlwYZSVjzusx7UsejTUxeGJ+DN
	 oBdsx+n5MZjz6rsE1SpiqnF3hY7ZyGuemn2DEX4OmrvyM0Bf+ZzBirSxf9h9GH4FTa
	 mhL5ryOtyZGCBwxkKyneWQfxa1JD7oPRat/I7xyMKlI6lg//eEAN5odQKwlelmTyiY
	 zMqu6sKpI50sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 13/17] media: ti: j721e-csi2rx: Submit all available
 buffers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520120022.539913-14-r-donadkar@ti.com>
References: <20260520120022.539913-14-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:59:04 +0000
Message-Id: <20260520125906.152F51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Use-after-free risk due to calling `vb2_buffer_done` before `l=
ist_del`.
- [High] The loop in `ti_csi2rx_dma_submit_pending` overwrites its return v=
alue, masking errors or propagating late failures that leak active DMA tran=
sfers.
--

commit 24ec89ac37ff48257e9071eff4f7a9e983db636d
Author: Jai Luthra <jai.luthra@linux.dev>

media: ti: j721e-csi2rx: Submit all available buffers

This commit moves the logic for submitting available buffers to DMA into
a separate function. It then uses this new function during stream start
so all queued buffers are submitted before starting the stream.

> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 1ec63715baf2c..071ad969dfa68 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
[ ... ]
> @@ -663,11 +663,32 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx=
 *ctx)
> +static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx)
> +{
> +	struct ti_csi2rx_dma *dma =3D &ctx->dma;
> +	struct ti_csi2rx_buffer *buf;
> +	int ret =3D 0;
> +
> +	/* If there are more buffers to process then start their transfer. */
> +	while (!list_empty(&dma->queue)) {
> +		buf =3D list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
> +		ret =3D ti_csi2rx_start_dma(ctx, buf);

[Severity: High]
Does this code overwrite the return value on each iteration?

If an earlier buffer succeeds but a subsequent buffer fails, the function
will return the error code.

If this error is returned to ti_csi2rx_sd_enable_streams(), the stream
initialization will abort, but the DMA hardware will already be active
with the successfully submitted buffers.

Could this lead to silent memory corruption if V4L2 reclaims the buffers
and userspace frees them while the hardware is still writing to them?

> +		if (ret) {
> +			dev_err(ctx->csi->dev,
> +				"Failed to queue the next buffer for DMA\n");
> +			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +			list_del(&buf->list);

[Severity: Critical]
Is there a use-after-free risk here if the buffer is accessed after
vb2_buffer_done() is called?

Calling vb2_buffer_done() relinquishes ownership of the buffer back to
videobuf2, which wakes up any process waiting on VIDIOC_DQBUF.

Since the vb2 queue mutex is not held here, a concurrent thread could issue
a VIDIOC_REQBUFS ioctl to free the buffer memory.

If that happens, would the subsequent list_del(&buf->list) execute on freed
memory and corrupt the slab?

> +		} else {
> +			list_move_tail(&buf->list, &dma->submitted);
> +		}
> +	}
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D13
