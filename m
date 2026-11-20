Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204557;
	b=E9VT/5p+w6Rh/MYRRnfGPgSrPZwlrp++tpswl3Wj6iMxGSqZ7hU49MTHqHwMSV2clQHE
	 Y0QOUnP0m8adoDw3T7ax+ddMHZSz+LL9HkNtTSmShgZyoRRNMRgzJLxDWGjqmDaCSdaLq
	 LHWb+DGdMVF2M2036t0mBgfINSFiAJE4t2qlmcq/UsO4dKopc2zfYp6rZzOKCO1yAly7N
	 b4UK/W2VZr/cDmWx2BMMl6IZZrE9TFhDm//KCI/yM8B/ECx85xAddPQfV5AvwUxvHVj1p
	 faFCMZVUuSC+jQZbNHhTXxbkqsdWU6fL0Ozlv5Yy6UP+Ys+rMOgFpG4K1Yq53639MLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204557;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iS4IwvMSMKMhuZU8dW5ejbJdMZkT+IGA25GgvQwbVFY=;
	b=qHPe+tj2MBq8jkuE1/s9INGP9X/BgJt89/jl3kGW03PbHbR3gYOWYIzgFWUUvp3Oskb9
	 5Gwel40op6dQpvfvNX7gtaXuzgYip/CpeMy2a3UDTFx5YsnYXOD8JCX7/TEEBCZel4KWf
	 rvRqgXaCOea/VnsKE6RjN1OQHBBGJUd2891UMHgwKZEHf1brYsEd5hx6KVIV6NHXph2R0
	 OZZyzkDsH2Je0ROr0MPIxNo+Sn4KBNHWEvgv4hlzG6f3qRAFGZiYjcX3Iq2U8srk5Bxkp
	 ISHQ+zDcM4wo9Ijw2+SXhUoQWB7tUJBVGeD+Y18jtwWRMk3ofm7F/aUzD+yJKVycTQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VaDhooN0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3DA60A2608
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 19:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VaDhooN0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A671F01823;
	Fri, 20 Nov 2026 19:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795204556;
	bh=iS4IwvMSMKMhuZU8dW5ejbJdMZkT+IGA25GgvQwbVFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VaDhooN0h97dvx66tCv46h/7H2S2OIfhqUn5+8U30C9GAlac/JdmyBvULcaswizZI
	 mZWfYPJrH3qdHIQOUQ0Pr/Shl3O3GESmYO48SMAjuwrKXQkmW48A38dVIidkjeSmub
	 gT3UmyTZAWmfisQLk9qd2vcJ6Rful0l2saTdsUGsoi3eqUxiQ1L5m//Z1UkfXQ8pvO
	 PS6VFLOkrFJNY3gZIfKNLNuaqkP4bVkh5kINdmO3zF8YGXTTNS24M4XKt7+EIMlYUC
	 Ih1flKpZswOhKcNM4WjUH9afemv5t0gcJ3g7w4iTwbTN/fBL5Kybe02AF9HxVTFJGl
	 N9biizX8XoUxw==
Message-ID: <sashiko-outbox-225981@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] i2c: omap: add DMA support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoni Pokusinski" <apokusinski01@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261120185915.150228-4-apokusinski01@gmail.com>
References: <20261120185915.150228-1-apokusinski01@gmail.com>
 <20261120185915.150228-4-apokusinski01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 19:55:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] i2c: omap: u8 truncation in omap_i2c_resize_fifo() breaks DMA
  threshold
- [Medium] i2c: omap: DMA request disabled after buffer unmap in
  omap_i2c_xfer_msg()
- [Medium] i2c: omap: ERR_PTR assigned to omap->dma after IRQ init in
  omap_i2c_probe()
- [Medium] i2c: omap: missing PIO fallback on DMA failure in
  omap_i2c_xfer_msg()
- [Low] i2c: omap: invalid kernel-doc comment prefix in
  omap_i2c_xfer_msg()
--

commit 7c0a49ff7dadae86047390fd06ce1307e0609c76
Author: Antoni Pokusinski <apokusinski01@gmail.com>

i2c: omap: add DMA support

This commit adds TX and RX DMA support to the OMAP I2C controller for
messages whose length is at least 8 bytes and a multiple of the FIFO
threshold.

> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index f02d294db42a6..650d1cce05c75 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c

[ ... ]

> @@ -663,8 +861,8 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
>  {
>  	struct omap_i2c_dev *omap =3D i2c_get_adapdata(adap);
>  	unsigned long time_left;
> -	u16 w;
> -	int ret;
> +	u16 w, pio_irq_mask;
> +	int ret, use_dma;
> =20
>  	dev_dbg(omap->dev, "addr: 0x%04x, len: %d, flags: 0x%x, stop: %d\n",
>  		msg->addr, msg->len, msg->flags, stop);
> =20
>  	omap->receiver =3D !!(msg->flags & I2C_M_RD);
>  	omap_i2c_resize_fifo(omap, msg->len, omap->receiver);
> =20
> +	/**
> +	 * REVISIT: If the message size is not a multiple of the threshold,
> +	 * the draining feature must be used.
> +	 */

[Severity: Low]
This internal comment uses the "/**" kernel-doc prefix, which causes a
W=3D1 kernel-doc build warning.

> +	use_dma =3D !polling && omap->dma && msg->len >=3D OMAP_I2C_DMA_THRESHO=
LD &&
> +		  !(omap->flags & OMAP_I2C_FLAG_NO_FIFO) &&
> +		  msg->len % omap->threshold =3D=3D 0;

[Severity: Medium]
Does passing the 16-bit msg->len into omap_i2c_resize_fifo() truncate
lengths >=3D 256 bytes and corrupt omap->threshold for DMA?

drivers/i2c/busses/i2c-omap.c:omap_i2c_resize_fifo() {
	...
static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool i=
s_rx)
{
	...
	omap->threshold =3D clamp(size, (u8) 1, omap->fifo_size);
}

For a 256-byte transfer (such as an EEPROM page read or write), size
wraps to 0 and omap->threshold is clamped to 1 instead of
omap->fifo_size.  Because 256 % 1 =3D=3D 0, use_dma is true and
omap_i2c_dma_xfer() programs src_maxburst or dst_maxburst to 1 byte for
the entire transfer.  Changing size in omap_i2c_resize_fifo() to u16 (and
widening the clamp types) would avoid the truncation.

> =20
>  	omap_i2c_write_reg(omap, OMAP_I2C_SA_REG, msg->addr);
> =20
>  	/* REVISIT: Could the STB bit of I2C_CON be used with probing? */
> @@ -692,6 +898,23 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *ada=
p,
>  		reinit_completion(&omap->cmd_complete);
>  	omap->cmd_err =3D 0;
> =20
> +	if (use_dma) {
> +		ret =3D omap_i2c_dma_xfer(omap, msg);
> +		if (ret) {
> +			omap_i2c_reset(omap);
> +			__omap_i2c_init(omap);
> +			return ret;
> +		}
> +
> +		omap_i2c_dma_enable_req(omap);
> +	} else {
> +		pio_irq_mask =3D OMAP_I2C_IE_XRDY | OMAP_I2C_IE_RRDY |
> +			       ((omap->fifo_size) ? (OMAP_I2C_IE_RDR |
> +						    OMAP_I2C_IE_XDR) : 0);
> +
> +		omap_i2c_enable_pio_irqs(omap, pio_irq_mask);
> +	}

[Severity: Medium]
Should omap_i2c_xfer_msg() fall back to PIO when omap_i2c_dma_xfer()
fails instead of resetting the controller and aborting the transfer?

Nothing has been started on the bus for this message yet, and in a
multi-message transfer where an earlier message completed with stop =3D=3D 0
(repeated start), calling omap_i2c_reset() here resets the controller
mid-transaction while the bus is still held active without sending a STOP
condition.

[ ... ]

> @@ -753,7 +994,18 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *ada=
p,
>  		time_left =3D !ret;
>  	}
> =20
> -	if (time_left =3D=3D 0) {
> +	if (use_dma) {
> +		if (!time_left || omap->cmd_err)
> +			dmaengine_terminate_sync(omap->dma->chan_using);
> +
> +		omap_i2c_dma_cleanup(omap, time_left && !omap->cmd_err);
> +
> +		omap_i2c_dma_disable_req(omap);
> +	} else {
> +		omap_i2c_disable_pio_irqs(omap, pio_irq_mask);
> +	}

[Severity: Medium]
Should omap_i2c_dma_disable_req() be called before
dmaengine_terminate_sync() and omap_i2c_dma_cleanup(), matching the
start-condition timeout path earlier in omap_i2c_xfer_msg()?  On a
timeout or bus error, the I2C controller can keep asserting DMA requests
while the channel is being terminated and the buffer is unmapped.

[ ... ]

> @@ -1478,6 +1787,22 @@ omap_i2c_probe(struct platform_device *pdev)
>  		goto err_unuse_clocks;
>  	}
> =20
> +	if (omap->scheme !=3D OMAP_I2C_SCHEME_0) {
> +		omap->dma =3D omap_i2c_dma_init(omap, (dma_addr_t)res->start);
> +		if (PTR_ERR(omap->dma) =3D=3D -EPROBE_DEFER) {
> +			r =3D -EPROBE_DEFER;
> +			dev_err_probe(&pdev->dev, r,
> +				      "can't get DMA channels\n");
> +			goto err_unuse_clocks;
> +		} else if (PTR_ERR(omap->dma) =3D=3D -ENODEV) {
> +			dev_dbg(omap->dev, "DMA setup failed\n");
> +			omap->dma =3D NULL;
> +		} else if (IS_ERR(omap->dma)) {
> +			r =3D PTR_ERR(omap->dma);
> +			goto err_unuse_clocks;
> +		}
> +	}

[Severity: Medium]
Can assigning the return value of omap_i2c_dma_init() directly to
omap->dma cause the IRQ handler to dereference an ERR_PTR?

At this point in omap_i2c_probe(), omap_i2c_init() has enabled the
controller interrupts and devm_request_threaded_irq() has registered
omap_i2c_isr_thread().  If omap_i2c_dma_init() returns an ERR_PTR,
omap->dma is non-NULL (and remains an ERR_PTR on the err_unuse_clocks
unwind path), while omap_i2c_complete_cmd() and omap_i2c_xfer_data()
only check if (omap->dma) before calling complete(&omap->dma->complete).
In addition, omap_i2c_dma_init() already calls dev_err_probe() on
-EPROBE_DEFER, so calling dev_err_probe() again here overwrites the
channel-specific deferred probe reason.  Also, since DMA is optional,
should errors other than -EPROBE_DEFER fall back to PIO with
omap->dma =3D NULL instead of failing the adapter probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120185915.1502=
28-1-apokusinski01@gmail.com?part=3D3
