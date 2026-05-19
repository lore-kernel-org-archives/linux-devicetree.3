Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9053438A3
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779232568; cv=none; b=A3iaxyilBMfEA7tNK2Jn3Q5IVtXR95JKOyKkakVfPSpPhlLA7Lr1LNzfLKjMoJV1uviN0hUcntIZqxf1kZ4UhCzzXWAZ+24amc3TXYYaxd6+M1wtF1acMnchCgUjpNL9hiIJa5mUIwUQh5Opj//75Cga/rf6IXoswvHMIR23xwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779232568; c=relaxed/simple;
	bh=RQbgsyJGVpN8Qy1JY0B5Pc0cDNsTSOQn/AIaGZ5DEO4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ejAKAwmQGaCWsdkLcQhU0YlpJwGodVvHAQIMXz15hbW0lilLkrl/lxXwml2hBWHwzvqAoZ/5I1NKra2lX+FAspqdut+x5EahpfJ8NKxteMr0gN/vLDaBYoV04jTu2n/Mu7tO4XD2efW4JrtsW/1psG+5jXtkqtMk6n/bClbeyv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocPj+hRa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocPj+hRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA3C1F000E9;
	Tue, 19 May 2026 23:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779232567;
	bh=6GhKsz/i9HkoeM2J6t5HHWfFUSUhVU3jiEDgRvMsIKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ocPj+hRabaPTt6RY3OZD8zQHn+vVFRUxZl+Tx9h8njvl+O/BnQce6C1gLR4mRfR/C
	 7M+4OFfNclTmMsAT4TB8M6y6WbZoD/rPTO3zfwW3h7KyX6dt1txXkB2S9u1sG7to3G
	 taoFMherwREAVg9auzfwWrDJGnLhDhNB3TKaNEROzSnJimvKCH7tEBZqwW2heCwYSt
	 EozRoV3hr87nO4tzYzdGvHRv0crs7X/nC7u38VEBSHdzaVMA7fVM5nXhPSOEAS7HWy
	 wFrffF2vVDSHq6/rXWuhOWR5HzS338tmYtCTygr8E8xZD0QqK2Ytluz8BzWoDOJ2DF
	 TgNEZxztCkKOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] i2c: mt7621: clear pending interrupt on i2c
 reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260519223253.1093-3-ansuelsmth@gmail.com>
References: <20260519223253.1093-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 23:16:06 +0000
Message-Id: <20260519231606.AAA3C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The patch mistakenly writes to the Interrupt Enable register (`REG=
_PINTEN_REG`) instead of the Interrupt Clear register (`REG_PINTCL_REG`), w=
hich fails to clear the interrupt and can trigger an unhandled interrupt st=
orm.

Pre-existing issues:
- [High] The function `mtk_i2c_reset()` calls `device_reset()`, which may s=
leep, but it can be called from an atomic context.
--

commit d97627074d52407e96e5474c13276e0a4ad61014
Author: Christian Marangi <ansuelsmth@gmail.com>

i2c: mt7621: clear pending interrupt on i2c reset

This commit attempts to clear pending interrupts during an I2C bus reset
to ensure a consistent state for subsequent operations.

> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7=
621.c
> index 700beb9e7b1a8..d8fa29e7e0fa3 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -101,6 +101,8 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)

[Severity: High]
This is a pre-existing issue, but can this function be safely called from an
atomic context?

Earlier in this patch series, mtk_i2c_xfer_atomic() was introduced, which
can trigger a reset from an atomic context on transfer timeout:

mtk_i2c_xfer_atomic()
  mtk_i2c_xfer_common(..., atomic =3D true)
    mtk_i2c_reset()
      device_reset()
        __fwnode_reset_control_get()

The __fwnode_reset_control_get() function attempts to acquire a mutex.
Acquiring a mutex in an atomic context is a lock context violation that
can lead to a kernel panic.

>  	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
>  		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
>  	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
> +	/* Clear any pending interrupt */
> +	iowrite32(1, i2c->base + REG_PINTEN_REG);

[Severity: High]
Does this code inadvertently unmask the interrupt instead of clearing it?

The comment indicates the intent is to clear pending interrupts, but
REG_PINTEN_REG is the interrupt enable register, whereas REG_PINTCL_REG is
typically used to clear interrupts.

Writing to the enable register unmasks the interrupt at the hardware block
level. Since the driver operates entirely in polling mode and does not
register an IRQ handler, asserting the hardware IRQ line can lead to an
unhandled interrupt storm. If the interrupt line is shared and unmasked at
the GIC, the spurious interrupt detector might eventually disable the shared
IRQ line, potentially causing a denial of service for other devices.

Additionally, writing 1 only targets bit 0. To safely clear all pending
interrupts, should a full bitmask be written to the clear register instead?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519223253.1093=
-1-ansuelsmth@gmail.com?part=3D2
