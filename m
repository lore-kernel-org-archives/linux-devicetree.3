Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869276;
	b=sNu/F9x4Mgp/wjdhaQ5SDZZWCmGCag0jmLmANe2gTWB282ulv3Dcvz7U4uoNZmDi3a7V
	 DrgITtDg/9SA6C8pSD3n+5fdrn9/Y4Uju2T4/pqrgmXQTD2neL5OPDkDbw6PPYn/78sst
	 qpXW2bb9xvXwd1PMXMNNpVKZKbSPg8bxF+ZXK7+pkYmc7jXES/qT3AGVvetpbnB3myKFU
	 ZGoZfbcEBaYa3Fnb8PRnK2VwdYakBml+dA2kgn7V6070NutWa/hGRIHTIWVGl6vCf2jOF
	 fUidl5qb7x9MByvR5JLaaGykdtI6I+9LApy3FmgbP57crUPOPuSSdGiQJK04/oAidbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869276;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NceYa3NZayFxuHHB+QmpGXbPguwXwvX7k5dpGHlALec=;
	b=y9erbQWUUPKWWLWokx+GF6VYarxN68PL5r4bm12s3oA4n5MQpur+6IqMdpUpwaf3zfyf
	 GFqTF1i0XQEXXpVZVKbf33L5cH5b7v4SWsgR3HXa0qAu3Fa0+T3HvQZzM0UIm5xkEH50R
	 H7u6ySB8OQM2MeqshxL2NRHuSfLCNk02oONO/l5zQ9k4/K4uNtCdAY2ZCUYownqU22GUc
	 G5eLj293+JuMp5FhMaXWB3CaQZ42o13ZCty0fUx2WXDGXU/8TYRZNEH9ctGzcE1OvxhbD
	 71td52/hQSCoSS5gqoiIkSRdfFqnR+sDehNGQaSVaZMnjlN219IhXbypNnE0n8HkIlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kw0M1BnE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B67C606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kw0M1BnE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3A91F000C1;
	Thu,  5 Nov 2026 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793869275;
	bh=NceYa3NZayFxuHHB+QmpGXbPguwXwvX7k5dpGHlALec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kw0M1BnExzPwaBnZ7Xyad9+a0J277W3l2fS0SmYCeFST97fiqz8ghyTfbT83DErZP
	 c+bz3QVhQmO4n9lurexB72yiBKWBawHHWxKERChQENMsU10t70scHm+MnuOkUhNNaI
	 wWP0gFa50mk1L0mur5Ph5rRhE2jNwArpY0hO0Z8GwNvohwJwnylUGcKk3CqXWBqx6/
	 GBiAB0BCqqGei1r224Z8F8Nsru6araoBV7c5rjmcvZfWHof6f5Nru+6+JHOtQuGiss
	 meSfwVY7cv5kMLQCG9LAG7C/3HUklN0D6Uy9SjjZ8kVMnvY63bxh2ALbRxYnz9YCpj
	 UDy6eTc36YmuA==
Message-ID: <sashiko-outbox-198746@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] i3c: dw: Track the transmit and receive buffer
 depths separately
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261105085425.3418230-3-shubhamsanjay.patil@amd.com>
References: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
 <20261105085425.3418230-3-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 09:01:14 +0000
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
- [High] i3c: dw: u8 truncation of rxfifodepth in dw_i3c_common_probe()
--

commit c93cc6843b57993d053db03cc3f7cee25dbd4371
Author: Shubham Patil <shubhamsanjay.patil@amd.com>

i3c: dw: Track the transmit and receive buffer depths separately

This commit splits caps.datafifodepth into caps.txfifodepth and
caps.rxfifodepth, populates caps.rxfifodepth from the QUEUE_SIZE_CAPABILITY
register, and exposes the FIFO capacities via base.tx_fifo_bytes and
base.rx_fifo_bytes.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index d1119f203d1b6..dd5462b129514 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -203,7 +203,10 @@
>  #define BUS_IDLE_TIMING			0xd8
>  #define I3C_VER_ID			0xe0
>  #define I3C_VER_TYPE			0xe4
> -#define EXTENDED_CAPABILITY		0xe8
> +#define QUEUE_SIZE_CAPABILITY		0xe8
> +#define QUEUE_SIZE_CAPABILITY_RX_BUF(x)	(((x) & GENMASK(7, 4)) >> 4)
> +/* Sizes are encoded, 0 meaning 2 DWORDs and every further step doubling=
 it. */
> +#define QUEUE_SIZE_TO_DWORDS(x)		(2U << (x))
>  #define SLAVE_CONFIG			0xec
> =20
>  #define DYN_ADDR_LO_MASK GENMASK(4, 0)
> @@ -978,8 +981,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_des=
c *dev,
>  			ntxwords +=3D DIV_ROUND_UP(i3c_xfers[i].len, 4);
>  	}
> =20
> -	if (ntxwords > master->caps.datafifodepth ||
> -	    nrxwords > master->caps.datafifodepth)
> +	if (ntxwords > master->caps.txfifodepth ||
> +	    nrxwords > master->caps.rxfifodepth)
>  		return -EOPNOTSUPP;
> =20
>  	struct dw_i3c_xfer *xfer __free(kfree) =3D dw_i3c_master_alloc_xfer(mas=
ter, i3c_nxfers);
> @@ -1136,8 +1139,8 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_d=
esc *dev,
>  			ntxwords +=3D DIV_ROUND_UP(i2c_xfers[i].len, 4);
>  	}
> =20
> -	if (ntxwords > master->caps.datafifodepth ||
> -	    nrxwords > master->caps.datafifodepth)
> +	if (ntxwords > master->caps.txfifodepth ||
> +	    nrxwords > master->caps.rxfifodepth)
>  		return -EOPNOTSUPP;
> =20
>  	struct dw_i3c_xfer *xfer __free(kfree) =3D dw_i3c_master_alloc_xfer(mas=
ter, i2c_nxfers);
> @@ -1738,7 +1741,14 @@ int dw_i3c_common_probe(struct dw_i3c_master *mast=
er,
>  	master->caps.cmdfifodepth =3D QUEUE_STATUS_LEVEL_CMD(ret);
> =20
>  	ret =3D readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
> -	master->caps.datafifodepth =3D DATA_BUFFER_STATUS_LEVEL_TX(ret);
> +	master->caps.txfifodepth =3D DATA_BUFFER_STATUS_LEVEL_TX(ret);
> +
> +	ret =3D readl(master->regs + QUEUE_SIZE_CAPABILITY);
> +	master->caps.rxfifodepth =3D
> +		QUEUE_SIZE_TO_DWORDS(QUEUE_SIZE_CAPABILITY_RX_BUF(ret));
> +
> +	master->base.tx_fifo_bytes =3D master->caps.txfifodepth * 4;
> +	master->base.rx_fifo_bytes =3D master->caps.rxfifodepth * 4;
> =20
>  	ret =3D readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
>  	master->datstartaddr =3D ret;
> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i=
3c-master.h
> index f5b4491b247a0..e23554bfc5e49 100644
> --- a/drivers/i3c/master/dw-i3c-master.h
> +++ b/drivers/i3c/master/dw-i3c-master.h
> @@ -14,7 +14,8 @@
> =20
>  struct dw_i3c_master_caps {
>  	u8 cmdfifodepth;
> -	u8 datafifodepth;
> +	u8 txfifodepth;
> +	u8 rxfifodepth;

[Severity: High]
Can master->caps.rxfifodepth overflow u8 and truncate to 0 in
dw_i3c_common_probe()?

In the DesignWare I3C controller, QUEUE_SIZE_CAPABILITY_RX_BUF(ret) can
return up to 0x7 (256 32-bit words, or 1024 bytes). When that happens,
QUEUE_SIZE_TO_DWORDS(7) evaluates to 256 (0x100), which truncates to 0 when
stored into the u8 rxfifodepth field in struct dw_i3c_master_caps.

With master->caps.rxfifodepth set to 0, master->base.rx_fifo_bytes also
becomes 0 in dw_i3c_common_probe(), and the nrxwords >
master->caps.rxfifodepth check in both dw_i3c_master_i3c_xfers() and
dw_i3c_master_i2c_xfers() will reject every non-empty read transfer with
-EOPNOTSUPP.

Should rxfifodepth (and txfifodepth) in struct dw_i3c_master_caps be u16
instead of u8?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105085425.3418=
230-1-shubhamsanjay.patil@amd.com?part=3D2
