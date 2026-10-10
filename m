Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20013FB04E
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637828; cv=none; b=uu5XBmOHVD9rKwyn+i6LRfnGrWGXNEs1lrTQpoOAwyr4mGxZzRSpuUeVCeZsZ0POAedAAs0xMIQYfaTR4z0T/YKQM2P0qiAIofrNCrHjMAuqXbZfbMBPeLFR0FDhlb4zUAzyQV3qK2iMZO27aj+/8cKMVmm5LGTIosdf9x62WZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637828; c=relaxed/simple;
	bh=kf8JQy1hTADazrL2lYHM+6EZf+2TAhNAPrAwUuQAAKw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hZlssI+7HhsJXvBFkGmwGGkcI444u0eRIWmgyWq8DLKBqGHxEhrnTXEunL0gDrdUYOPQy+RO7X6SNOkuMPH5730H3Gw7Dzeh4EFkyZdopoLLkDLitCoPIVJ8gD+w+ZLHDo0EY0CgIvQ0DYeFO1XcyCCH9YDWcrEA2pWPNLkNR7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGI0eZ2w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGI0eZ2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208321F000FF;
	Sat, 10 Oct 2026 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637827;
	bh=aTzZv87s3UxIvOc3OnqKRNg4LYHwGBKc8XGgdolxGrI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GGI0eZ2wuchp4LcXV7KoTaB1G5vx8jXbtVzAULUu8tChIJyy9sSGSuLT6ysnOiSyN
	 d1lbRbts6jCV7mTLKzX6uaLVKIAucZjDI2uDBNbJIQpiqci3q3TUviKQr0JE9vTk0o
	 3mq+/4/mQEbhB24qnp7umgV9dRfHbZ9vd6LukXn+53OoMDdK5YRsU2eOvLSrn1qaPT
	 9lE0QGvnVHE9FWl9GAcqHEejmFK7oGwOUNzyoZHTPHVIkuaEziCtPvA2esH6rLJNG2
	 3ZaosO/aIZw4EM38dA6UWbwx/a2ygd5AH1IQDyLjJReVcYRIVAtNs6wkG9WYSAP5Xk
	 y9f3aoqPwxOaQ==
Message-ID: <sashiko-outbox-166568@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/24] ARM: l2c: Serialize device reads with cache
 maintenance when requested
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010130024.177503-3-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-3-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:10:26 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm: unbounded IRQ latency in L2C_IO_LOCKED_RANGE_OP wrapper
--

commit 200bbafd893402f8ddb823a9bb579e0fb79d8e62
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

ARM: l2c: Serialize device reads with cache maintenance when requested

This commit introduces an optional lock to serialize device reads with L2C-=
310
maintenance operations. It works around an interconnect deadlock on some So=
Cs by
taking a spinlock during outer cache range operations and device reads.

> diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
> index 470867160076f..35cc2eaf85a60 100644
> --- a/arch/arm/mm/cache-l2x0.c
> +++ b/arch/arm/mm/cache-l2x0.c

[ ... ]

> +#define L2C_IO_LOCKED_RANGE_OP(op)					\
> +static void l2c_io_locked_##op(unsigned long start, unsigned long end)	\
> +{									\
> +	unsigned long flags;						\
> +									\
> +	raw_spin_lock_irqsave(&l2x0_io_lock, flags);			\
> +	l2x0_io_fns.op(start, end);					\
> +	raw_spin_unlock_irqrestore(&l2x0_io_lock, flags);		\
> +}
> +
> +L2C_IO_LOCKED_RANGE_OP(inv_range)
> +L2C_IO_LOCKED_RANGE_OP(clean_range)
> +L2C_IO_LOCKED_RANGE_OP(flush_range)

[Severity: High]
Does this introduce unbounded interrupt latency during large outer cache ra=
nge
operations?

By wrapping the entire O(N) range operation in a single
raw_spin_lock_irqsave(), local interrupts are kept disabled for the duration
of the operation.

Standard L2C range loops natively execute with interrupts fully enabled, as=
 seen
in __l2c210_op_pa_range():

	while (start < end) {
		writel_relaxed(start, reg);
		start +=3D CACHE_LINE_SIZE;
	}

For functions that do take a lock internally, like
l2c310_flush_range_erratum(), they explicitly bound interrupt latency by
yielding every 4KB:

		if (blk_end < end) {
			raw_spin_unlock_irqrestore(lock, flags);
			raw_spin_lock_irqsave(lock, flags);
		}

Wrapping the call defeats this latency bound completely. Could this cause
dropped hardware events, audio dropouts, or watchdog timeouts when performi=
ng
DMA mapping on large buffers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D2
