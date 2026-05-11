Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EB033F8B7
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543918; cv=none; b=s3GIe3ZECrQN0vJyhlVdgmBmOoRdKZOrzIhVsXv1Eh/+YPbodd+VYr/9qPchLLGEI9jZ59XeZU0E77q1lrtNIhhDRvhgVjNEbuR2jVx9wOK9yCpUajE0y19R6Vi3gOLbTOY+0axo6j5Wyq0fXMgBzGTKyf6LoM/69voau3T4QlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543918; c=relaxed/simple;
	bh=lLtGmBYuxyFGVz8Qv5Gq+2EAiLqH1RSdM9cxi74rMQ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XAECIgH/Qucs1ecLlr+uJPy7s7XttxQtxPjHVUIRbT2c0RvKaU8GS4L1TBwHo8+EnOwOPDyWNUrubboA3xXNt8/t0FUds85cTccq4dv+C/FLfhJFUwvYC52TQPscFMOvwMDJtIKq333jbd1z22LX9JBzDYIwH7x4zyVaVJiX3eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYI/58N3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYI/58N3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4109FC2BCB0;
	Mon, 11 May 2026 23:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778543918;
	bh=lLtGmBYuxyFGVz8Qv5Gq+2EAiLqH1RSdM9cxi74rMQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YYI/58N3ITgn2pphqFnMCyh7pHmboSoG3SM7t8KqpWFwIsUr4NTK5fz/Hi4/AjnYN
	 1zA+rljXnOMVW96U2sgmZchBIinCmwPD3TBOB6VrdNCxXPmYQzZbvkbvftBA+QxXzl
	 qgVCkd4OsaYYaFWUw81PmpjV6YlmnT/bspzYGhd7Knh03UIjE5MGJG/sp6093gufgn
	 fFYnSxWFTu/dMgBIiB+GnXJdHxWRaBB0SC7IuVlpH2Q+bSNs/7SZqSuMxEt70Xftfb
	 rINTEpZhHnTGktSzJ0kHJ4hBLxWaSuRC2qEcgPtFIvor5y+8kplY2RUgCNMlPn/tHa
	 9vtoq8DBwx6TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/10] ASoC: renesas: fsi: Add SPU clock control in
 hw_startup/shutdown
Reply-To: sashiko@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260510084303.122426-11-phucduc.bui@gmail.com>
References: <20260510084303.122426-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:58:37 +0000
Message-Id: <20260511235838.4109FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Unreachable SPU clock disable logic for clock masters leads to res=
ource leak.
- [High] Shared use of `spu_count` for both clock preparation and enablemen=
t causes API violations and clock state corruption.
- [High] Missing rollback of SPU clock enablement on error path causes reso=
urce leak.
- [High] Unhandled error in `__fsi_resume` leads to system hang if clock en=
able fails.
- [Medium] Unprotected read of `spu_count` causes a data race.
- [Low] Misleading indentation in `fsi_hw_startup()`.
--

commit f4667d95bec52234e1ed11e120e67be3aae15efd
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

This commit enables and disables the SPU clock in fsi_hw_startup()
and fsi_hw_shutdown() to prevent system hangs caused by hardware
register accesses while the clock is disabled.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index c3ac8b30f342b..5307085c06158 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1579,6 +1579,19 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
>  			  struct device *dev)
>  {
>  	u32 data =3D 0;
> +	int ret;
> +
> +	/* enable spu clock */
> +	if (fsi->master->clk_spu) {
> +		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
> +			if (fsi->master->spu_count =3D=3D 0) {
> +				ret =3D clk_enable(fsi->master->clk_spu);
> +				if (ret < 0)
> +					return ret;

If clk_enable() fails and returns an error here, how does __fsi_resume()
handle it? Looking at __fsi_resume(), it ignores the return value of
fsi_hw_startup() and unconditionally calls fsi_stream_start().

Could this attempt to access hardware registers and trigger a system hang if
the SPU clock failed to enable?

> +			}
> +				fsi->master->spu_count++;

This isn't a bug, but the indentation of fsi->master->spu_count++ makes it
appear as though it is conditionally executed inside the if block.

Does reusing fsi->master->spu_count here conflict with its use in
fsi_clk_prepare() and fsi_clk_unprepare()?

Since fsi_clk_prepare() checks spu_count without the fsi->master->lock,
could concurrent stream operations cause a data race?

Also, consider this sequence with concurrent streams:

Stream 1 opens: spu_count is 0, calls clk_prepare()
Stream 1 starts: spu_count is 0, calls clk_enable(), spu_count becomes 1
Stream 2 opens: spu_count is 1, skips clk_prepare()
Stream 1 stops: spu_count drops to 0, calls clk_disable()
Stream 1 closes: spu_count is 0, calls clk_unprepare()
Stream 2 starts: spu_count is 0, calls clk_enable()

Will Stream 2 try to call clk_enable() on an unprepared clock? Could a
separate counter be used for enablement to avoid breaking the clock state
machine?

> +		}
> +	}

[ ... ]

>  	/* start master clock */
>  	if (fsi_is_clk_master(fsi))
>  		return fsi_clk_enable(dev, fsi);

If fsi_clk_enable() fails here, does this code leak the SPU clock enablemen=
t?

Since the function returns the error directly, is there a need to call
clk_disable(fsi->master->clk_spu) and decrement fsi->master->spu_count
before returning?

> =20
>  	return 0;
>  }
> @@ -1636,6 +1649,12 @@ static int fsi_hw_shutdown(struct fsi_priv *fsi,
>  	/* stop master clock */
>  	if (fsi_is_clk_master(fsi))
>  		return fsi_clk_disable(dev, fsi);
> +	if (fsi->master->clk_spu) {
> +		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
> +			if (--fsi->master->spu_count =3D=3D 0)
> +				clk_disable(fsi->master->clk_spu);
> +		}
> +	}
> =20
>  	return 0;
>  }

Does this bypass the SPU clock disable logic entirely when the FSI device
operates as a clock master?

Since fsi_clk_disable() returns directly, it looks like fsi->master->clk_spu
is never disabled and fsi->master->spu_count remains unbalanced.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.1224=
26-1-phucduc.bui@gmail.com?part=3D10
