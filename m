Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3016221DB3
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778280051; cv=none; b=d6GcBfHZ4QhgbbKEjnzgelHODb3X14OV5blA97XdW0Rz3Mt6kQFsolWqxAEvjjvP6sKEuYgoBWtzaQ1VLUyoqWghRWjclmzpEcDICHsbdrAaAZBurq56WHW4ct7piXcQQQFdIfR9UUmoSG1CBgRFxlRV2dzKQkxBMzWjCJ9J5uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778280051; c=relaxed/simple;
	bh=mYOsj8zE0O3q2y+dnmnJP4GsX07sJwAn/tzTmiA+MTY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DG0MJO2B+ypfkSrzQBAjZ+7mv63XgY3F9dZvWk9WFSAQ2uOhZaBE2BxOOHDkjVouLziECDr7cVv4w4NNzJYe3krD+xBBMB5OHt7A8xceyvifR7rv6eB1wcv4xnC+htqfMua+QvRDCjwCvCo6Cwi3L6VQDVGwJ3cZWK1SVvv/+4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnfOAlX+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnfOAlX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3849EC2BCB0;
	Fri,  8 May 2026 22:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778280051;
	bh=mYOsj8zE0O3q2y+dnmnJP4GsX07sJwAn/tzTmiA+MTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nnfOAlX+jFjM+cfOAxBP7wNQMYAXiU7Nvu3QmDsklFj5hWY02pZwLfQKV1CKkNRdY
	 u2q/9n8lbZQMmcgzzscRP0GVtX+vSphKle+goB72+yNkkj+LaZneDfOgtqvzURmwO9
	 yOgTQtTTnMyyIe6qNn2nWKeZlvohalpPvATrpveHodVq0JKM6C9HKFIO42eqFhJ1ad
	 qsoT/7JtpqLfS/Vmpye9zpCxyHzhF9gJ9dPralrHkTXNvxT9B+rgB/qtxWDicFEJJ/
	 Zy+LVj7AYxbKD+DqgVyguJ3atn2XydOKmrK+P2AHb/VeR2DjZtVGkMHtPxjHS4oUxo
	 3R0PVKT0mG29Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/15] can: grcan: Add CANFD TX support alongside
 legacy CAN
Reply-To: sashiko@lists.linux.dev
To: "Arun Muthusamy" <arun.muthusamy@gaisler.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260508070121.6918-13-arun.muthusamy@gaisler.com>
References: <20260508070121.6918-13-arun.muthusamy@gaisler.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 22:40:50 +0000
Message-Id: <20260508224051.3849EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch breaks the `grcan_txbug_workaround` mitigation for a kno=
wn hardware hang, causing it to bypass the trigger condition or uncondition=
ally time out.
--

commit bce48dc84fac934ecb22c0ada575ba8344b8ec53
Author: Arun Muthusamy <arun.muthusamy@gaisler.com>

can: grcan: Add CANFD TX support alongside legacy CAN

This commit includes CANFD TX support with the legacy CAN support, enabling
extended data payloads to provide higher bit rates.

> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index 4921da349a0ef..690e07c7b1ef8 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c

[ ... ]

> @@ -1441,40 +1484,55 @@ static netdev_tx_t grcan_start_xmit(struct sk_buf=
f *skb,
>  	spin_lock_irqsave(&priv->lock, flags);
> =20
>  	txwr =3D grcan_read_reg(&regs->txwr);
>  	space =3D grcan_txspace(dma->tx.size, txwr, priv->eskbp);
> =20
>  	slotindex =3D txwr / GRCAN_MSG_SIZE;
> +	bds =3D grcan_numbds(len);

[ ... ]

> +	copy_len =3D min_t(u32, len, CAN_MAX_DLEN);
> +	memcpy(hdr->data, payload, copy_len);
> +	payload_offset =3D copy_len;
> =20
> -	if (dlc > 0)
> -		memcpy(hdr->data, cf->data, min_t(u32, cf->len, CAN_MAX_DLEN));
> +	txwr =3D grcan_ring_add(txwr, GRCAN_MSG_SIZE, dma->tx.size);
> +
> +	for (i =3D 1; i < bds; i++) {
> +		frag =3D grcan_msg_frag_at(&dma->tx, txwr);
> +
> +		memset(frag, 0, sizeof(*frag));
> +		copy_len =3D min_t(u32, (u32)len - payload_offset, (u32)GRCAN_MSG_SIZE=
);
> +		memcpy(frag->data, payload + payload_offset, copy_len);
> +		payload_offset +=3D copy_len;
> +
> +		txwr =3D grcan_ring_add(txwr, GRCAN_MSG_SIZE, dma->tx.size);
> +	}

[ ... ]

>  	/* Bug workaround for old version of grcan where updating txwr
>  	 * in the same clock cycle as the controller updates txrd to
>  	 * the current txwr could hang the can controller
>  	 */
>  	if (priv->need_txbug_workaround) {
>  		txrd =3D grcan_read_reg(&regs->txrd);
>  		if (unlikely(grcan_ring_sub(txwr, txrd, dma->tx.size) =3D=3D 1)) {

Does this break the grcan_txbug_workaround mitigation?

In the original code, txwr represented the current hardware write pointer=20
when it was used in this check. Now, txwr is updated in the loop above to=20
calculate the end of the new message fragments before the workaround check=
=20
is evaluated.

Because txwr is now the new advanced write pointer, won't the trigger
condition grcan_ring_sub(txwr, txrd, dma->tx.size) =3D=3D 1 evaluate agains=
t=20
the wrong offset and fail to prevent the controller hang?

Additionally, grcan_txbug_workaround() waits for the hardware read pointer
to catch up to the provided txwr. Since the advanced txwr hasn't been=20
written to the hardware yet (it is updated in the hardware at the end of=20
the function), will this guarantee a timeout, returning -EBUSY and=20
permanently stalling the TX queue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508070121.6918=
-1-arun.muthusamy@gaisler.com?part=3D12
