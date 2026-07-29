Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6733A9013
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316266; cv=none; b=JHEQU4lS67tN39Q/PPUIDodKR1wQYduV6XWC1v1xb8unpjRfHV9EfGBT5gj7V3GUXzF8/EmWobt1UUbzy+C2VK7cB+rxZ6ZJxHdmM1K8ar9kmVZBkRC3RYfPC/dZ5JPERTSpNcUKtVzwcYdO678w0i1yWhR1FHXZcBPdYn2Cg8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316266; c=relaxed/simple;
	bh=0SKZh1st/HhZg1CcSpdf8b/H6exD43q23fXM3I6+7Uk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SbpGCR6B+bUWZqOcXg2Xajuv7cCIyEIwVhP3qLy9hosgxjNe1NJdRA+eRK2B7N32XRXzl4zCII9e1Ql7C6NM33SGcGvlMwRJYqfdHGhpQrtSua7luzshYBX15JVv54RViN/3rXboT9sJyemsnXnKzZnH/PLTgFSsq5UWDq8cy74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CY2hYgDC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CY2hYgDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6861F000E9;
	Wed, 29 Jul 2026 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785316264;
	bh=qFhafGiS0JK1WucHXMTTN92G6qfNLMO69AgtvQrcbQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CY2hYgDCswKwRGnlGH1Nf3oXEBH1is58c+NgjRfwKkwANfjJ3Dw5LMBu505jGgHtP
	 5pihevxpDd0G0oIL3m1PYG6o20seBi2DfDBsyONaUYNgmUBy1JRKO5kF0qF/TCTjC0
	 dU5WhmlKPpMnfQwUzXLdRkbr+bZLXrfyR98CBU8Y1ZPbmk8EBx42jBk8F9mKGrtAGg
	 Apip0YzYpDzGXPTNnyq8x3056pwxhsoSvaeN5BPRTts4HtI8zLcFEO5FGrHzBN03fN
	 RHOTW3HAB25pG9Vb8HNQ4uS4LIb7HIh7sW+OZZlQs042DInKUSGESvuwcHpO6TfgeV
	 7uhqHKGHmdbGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] nvmem: rockchip-efuse: add write support with
 optional VQPS supply gating
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729085856.226001-3-hrushirajg23@gmail.com>
References: <20260729085856.226001-1-hrushirajg23@gmail.com>
 <20260729085856.226001-3-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 09:11:03 +0000
Message-Id: <20260729091104.1F6861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] Lack of preemption and IRQ protection around precisely timed S=
TROBE pulse during eFuse programming.
- [Critical] Missing driver-level locking allows concurrent reads and write=
s to corrupt global controller registers and destroy eFuses.
- [Medium] VQPS regulator is enabled without explicitly configuring its str=
ictly required programming voltage.

Pre-existing issues:
- [High] Read address bits are not cleared before ORing the next address, p=
ermanently corrupting multi-word read addresses.
- [High] CPU-endian register reads are copied via memcpy, causing byte-orde=
r reversal on Big Endian systems.
--

--- Patch [2]: [PATCH v2 2/2] nvmem: rockchip-efuse: add write support with=
 optional VQPS supply gating ---
commit 9787a852435c97fd8c38650a5baf58286ca592d1
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

nvmem: rockchip-efuse: add write support with optional VQPS supply gating

This commit adds write support for the RK3399 eFuse using the A_PGM
programming mode. It retrieves an optional VQPS regulator that is enabled
only during write operations to fulfill hardware requirements. If the
regulator is absent, the device is left read-only to prevent unsafe writes.

> diff --git a/drivers/nvmem/rockchip-efuse.c b/drivers/nvmem/rockchip-efus=
e.c
> index 013e67136f3b9..3bde09236c74c 100644
> --- a/drivers/nvmem/rockchip-efuse.c
> +++ b/drivers/nvmem/rockchip-efuse.c
[ ... ]
> @@ -177,6 +193,7 @@ static int rockchip_rk3399_efuse_read(void *context, =
unsigned int offset,
>  	writel(RK3399_LOAD | RK3399_PGENB | RK3399_STROBSFTSEL | RK3399_RSB,
>  	       efuse->base + REG_EFUSE_CTRL);
>  	udelay(1);
> +
>  	while (addr_len--) {
>  		writel(readl(efuse->base + REG_EFUSE_CTRL) | RK3399_STROBE |
>  		       ((addr_start++ & RK3399_A_MASK) << RK3399_A_SHIFT),
>  		       efuse->base + REG_EFUSE_CTRL);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for multi-word
reads to use corrupted addresses here?=20

The loop bitwise-ORs the new read address into REG_EFUSE_CTRL but never
clears the previous address bits. On subsequent iterations, the old address
bits remain set, which causes the new read address to be a bitwise OR of all
prior addresses in the sequence.

>  		udelay(1);
>  		out_value =3D readl(efuse->base + REG_EFUSE_DOUT);
>  		writel(readl(efuse->base + REG_EFUSE_CTRL) & (~RK3399_STROBE),
>  		       efuse->base + REG_EFUSE_CTRL);
>  		udelay(1);
> =20
>  		memcpy(&buf[i], &out_value, RK3399_NBYTES);

[Severity: High]
This is a pre-existing issue, but does copying the register value this way
cause byte-order reversal on big-endian systems?=20

readl() returns the 32-bit value in the CPU's native endianness, and using
memcpy() to serialize it will store the most significant byte at the lowest
address on big-endian systems. Should this use put_unaligned_le32() or
similar to guarantee consistent byte layout across architectures?

[ ... ]
> +static int rockchip_rk3399_efuse_write(void *context, unsigned int offse=
t,
> +				       void *val, size_t bytes)
> +{
> +	struct rockchip_efuse_chip *efuse =3D context;
> +	u8 *buf =3D val;
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(efuse->clk);
> +	if (ret < 0) {
> +		dev_err(efuse->dev, "failed to prepare/enable efuse clk\n");
> +		return ret;
> +	}
> +
> +	ret =3D regulator_enable(efuse->vqps);

[Severity: Medium]
Could enabling the VQPS regulator without enforcing a specific voltage cause
hardware issues?=20

The commit message mentions a 1.8V to 1.98V requirement, but
regulator_enable() does not enforce this. If the device tree defines this as
a shared or variable regulator currently set to a different voltage, could =
it
fail to program the OTP or cause overvoltage damage? Should this use
regulator_set_voltage() to guarantee the required programming voltage?

> +	if (ret < 0) {
> +		dev_err(efuse->dev, "failed to enable vqps regulator\n");
> +		clk_disable_unprepare(efuse->clk);
> +		return ret;
> +	}
> +
> +	while (bytes--) {
> +		u8 byte =3D *buf++;
> +		int bit;
> +
> +		for (bit =3D 0; bit < 8; bit++) {
> +			u32 addr, ctrl;
> +
> +			if (!(byte & BIT(bit)))
> +				continue;
> +
> +			addr =3D offset * 8 + bit;
> +
> +			/*
> +			 * A_PGM mode (TRM table 23-3):
> +			 * CSB=3DL, PGENB=3DL, PS=3DH, PD=3DL, LOAD=3DL, RSB=3DL,
> +			 * STROBSFTSEL=3DH (software controls STROBE)
> +			 * STROBE is asserted separately below.
> +			 */
> +			ctrl =3D RK3399_STROBSFTSEL | RK3399_PS |
> +			       ((addr & RK3399_A_MASK) << RK3399_A_SHIFT);
> +
> +			writel(ctrl, efuse->base + REG_EFUSE_CTRL);

[Severity: Critical]
Can concurrent reads and writes corrupt the global controller registers?=20

The NVMEM core does not serialize device-level reads and writes. Both
rockchip_rk3399_efuse_write() and rockchip_rk3399_efuse_read() modify the
global REG_EFUSE_CTRL register.

If a concurrent read occurs from sysfs during a write operation, couldn't it
abruptly overwrite the A_PGM state, clear RK3399_PS, or assert standby mode
while the programming STROBE is active? Furthermore, reading while the vqps
regulator is enabled violates the hardware requirement that VQPS must be 0V
during reads. Should a driver-level mutex be used to protect the register
state and regulator transitions?

> +			udelay(1);
> +
> +			/* Assert STROBE to program the selected bit */
> +			writel(ctrl | RK3399_STROBE, efuse->base + REG_EFUSE_CTRL);
> +			udelay(RK3399_PGM_TIME_US);

[Severity: Critical]
Can this tight programming loop cause issues if it gets preempted?=20

The RK3399 TRM specifies a precise programming STROBE pulse. This code uses
a udelay() loop that spins in process context without disabling interrupts =
or
preemption.

If a timer interrupt fires or the thread is preempted during this udelay(),
would the STROBE line remain asserted for the duration of the interruption,
potentially permanently degrading the OTP memory cells? Should
local_irq_save() and local_irq_restore() or similar atomic context guarante=
es
be used around the strobe?

> +
> +			/* Deassert STROBE */
> +			writel(ctrl, efuse->base + REG_EFUSE_CTRL);
> +			udelay(1);
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729085856.2260=
01-1-hrushirajg23@gmail.com?part=3D2
