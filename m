Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3F63A2E3F
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779231344; cv=none; b=J84D69KMVLRcVYvWGJswwMnF32rHq2Q8jdwziuWrl9UScXXy+lDQUWraXyziWzHddtDF6gewBCfOvVopEzXOLR3fzY7HXZGSzfLTkoco0pJx5vrqfLkgkN1E5cXAIaPxqsBdxt0Je1PlkzWrLQ9zWJtwLu3IYAaC50IzRYcKo3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779231344; c=relaxed/simple;
	bh=gbwS0Qu1/8MpBkadoNzQKVzYZcMLXrqBIYXpkew+2MM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dRgYdUFwCRr4ufnKOfJsrQJPY9kKWOHy/hpYN0gsEV7yWPVHv7GIfdS1ZpBjT0w9hEG5DZmzrDZLJ5AbGYl+Ub5ZtGzjzd/NZ8AdsmRF2rrj0zW62XmpLTjQx7vnvTz8jrmskzBGKrC9/SaaweH9JmoLjp5uFomVPNLqEkPlBn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gn0YbGGE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gn0YbGGE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F84F1F000E9;
	Tue, 19 May 2026 22:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779231341;
	bh=kMdgjfAybJrgZH+28+IJIH0ywc6iUvTzLrENDIICB6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gn0YbGGECsfbQg70Y26yiqWRHax8/zBzBmDEybmmo1JqNIUAYjeoeaTBvNs+73Ezx
	 Om+Rx5GEgrd+9cxaOSxlOtDlvga+Vyzf+3axlsSDfi5AT1jERZwu7i7VlNkb0ZmVef
	 wdNRVyaUMxuzKEgei6rjVMysW44LYB6hNUZtRsM6k/nR5JVS+1kj0f8vXpceBVoerP
	 YE4ZTcEr1Euuv8V7GmAv9qaDsNGSVYVl0LB9XtwPNF3RQLoT5z0UijqdYIylfx6hH1
	 6pWDX1k0doaq38dV2NcO8bN+gSAS66qfnEdNWEuY2MpBp5EyJIq+TxIGZLxrypQxEj
	 oCJ/4BMCPBDYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] i2c: mt7621: rework cmd/wait OPs to support
 atomic afer variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260519223253.1093-2-ansuelsmth@gmail.com>
References: <20260519223253.1093-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 22:55:40 +0000
Message-Id: <20260519225541.5F84F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The atomic transfer error path incorrectly calls `device_reset()`,=
 which uses mutexes and sleepable functions, leading to a sleeping-in-atomi=
c bug.
- [High] The atomic hardware polling loop spins for up to 1 second, which c=
an cause severe CPU stalls and trigger hardware watchdogs.

Pre-existing issues:
- [High] Uninitialized kernel stack memory is written to the I2C data hardw=
are registers for transfers shorter than 8 bytes.
--

commit 23969b8ae7fc1346d150b2481900eddb6e43c094
Author: Christian Marangi <ansuelsmth@gmail.com>

i2c: mt7621: rework cmd/wait OPs to support atomic afer variant

This commit reworks the command and wait operations in the mt7621 i2c driver
to support atomic transfers. It adds an atomic parameter to the common tran=
sfer
path and uses readl_relaxed_poll_timeout_atomic for hardware polling when
executing in an atomic context.

> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7=
621.c
> index 0a288c998419b..700beb9e7b1a8 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -67,14 +67,19 @@ struct mtk_i2c {
>  	struct clk *clk;
>  };
> =20
> -static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
> +static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
>  {
>  	int ret;
>  	u32 val;
> =20
> -	ret =3D readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
> -					 val, !(val & SM0CTL1_TRI),
> -					 10, TIMEOUT_MS * 1000);
> +	if (atomic)
> +		ret =3D readl_relaxed_poll_timeout_atomic(i2c->base + REG_SM0CTL1_REG,
> +							val, !(val & SM0CTL1_TRI),
> +							10, TIMEOUT_MS * 1000);

[Severity: High]
Is this timeout too long for an atomic polling loop?

TIMEOUT_MS is defined as 1000, which means this loop will spin using udelay=
()
for up to 1,000,000 microseconds (1 full second).

Spinning for a full second in an atomic context stops other critical tasks
from executing, which could trigger RCU stall warnings or the hardware
hard-lockup watchdog timer.

[ ... ]

> @@ -198,7 +205,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, str=
uct i2c_msg *msgs,
>  				cmd =3D SM0CTL1_WRITE;
>  			}
> =20
> -			ret =3D mtk_i2c_cmd(i2c, cmd, page_len);
> +			ret =3D mtk_i2c_cmd(i2c, cmd, page_len, atomic);

[Severity: High]
This is a pre-existing issue, but does this write uninitialized kernel stack
memory to the hardware registers?

In mtk_i2c_xfer_common(), the data array is allocated on the stack:

	u32 data[2];

During a write transfer with a page_len less than 8, memcpy() only initiali=
zes
the first page_len bytes of the data array. The code then unconditionally
writes the full 8 bytes to the IO registers:

	iowrite32(data[0], i2c->base + REG_SM0D0_REG);
	iowrite32(data[1], i2c->base + REG_SM0D1_REG);

Could this leak uninitialized stack memory to the I2C peripheral?

[ ... ]

> @@ -237,6 +244,18 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, st=
ruct i2c_msg *msgs,
>  	return ret;
>  }
> =20
> +static int mtk_i2c_xfer_atomic(struct i2c_adapter *adap,
> +			       struct i2c_msg *msgs, int num)
> +{
> +	return mtk_i2c_xfer_common(adap, msgs, num, true);
> +}

[Severity: High]
Can the error path in this atomic transfer trigger a sleep in atomic contex=
t?

If an error occurs in mtk_i2c_xfer_common() (such as a hardware timeout), t=
he
code jumps to err_timeout and resets the device:

mtk_i2c_xfer_atomic()
  mtk_i2c_xfer_common()
    goto err_timeout;

err_timeout:
  mtk_i2c_reset(i2c);
    device_reset(i2c->adap.dev.parent);

The device_reset() function maps to __device_reset(), which calls
__reset_control_get(). This sequence acquires multiple mutexes
(reset_list_mutex and rcdev->lock) and can allocate memory with GFP_KERNEL.

Since mtk_i2c_xfer_atomic() can be executed with IRQs disabled or during a
kernel panic, won't these blocking operations trigger a scheduling while at=
omic
system panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519223253.1093=
-1-ansuelsmth@gmail.com?part=3D1
