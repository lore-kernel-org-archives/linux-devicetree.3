Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E8E26B2D3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 01:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780969625; cv=none; b=L7HhdYFvFom+5r4r1kX2uV3f6j/4fVwaCFBeUeucoEOnZcH8WLnmxNPtNQJt4twCusHgvX/3qjjw3KRWdD7IERu0FMNI8xF8IGbm3/2gb1YEAOqBDhQChN8Mqikcuvr4CZL4GZu1TMgLHXo+ywfaks2XLM2OYf6r5q/njPoArHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780969625; c=relaxed/simple;
	bh=A8r3y+kJgGo6QL63e6YIWWUbc9Dn0QZ3w4o6XWAiRLY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lcrRpl90JUv4DNSAt7hzTm3EJCUBBX42Vu0KpZxmbaJ9U08dYNJuoVk4gE+bcRSNx5AWsndLbX3PjQPh5OBiADKclPi1nRYyjZdKWNDe3FZ0WLKYrUGytEVQR0ENiHSP+ZH3rEJKO3l8vuYwG9U/kPMgNb6W1Z/84w2JyEz9EDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqveqFOQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqveqFOQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963871F00893;
	Tue,  9 Jun 2026 01:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780969623;
	bh=qhZuU3CYPrU2ybq/5u9jfRNK9wgwjwdFU8MJTV1krrU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CqveqFOQCOhS5RbdSjgrDP9H6okGlmeuchBh3+oaNCF/756SILMJq6d5xKddVfpA/
	 F3J8QcrkjW/pwNKs4MKii44gyS1Lh20y8DizAA0BAVlVnahxHGD9+HIwZJ3KZq+Q30
	 oNA7t0kygnqwR2BI5Gj0Bxc3gLjrNtghsg6Ojtz6kht+2ILhaREQrjGCuGMRC/s6Or
	 M02qfSe8BCr94PqH0puJ2oBS8UAMn/FNxuH4exYhbAufkRgR/TJ3rtyKKvUyF6dlCP
	 eg/sRkZ6e8QUg99Lfyf6jB/4SHutUPXYEFpKSQ9IEaQMoouzybR3Po9QJNK0HvpWBW
	 GRUsI8ZKD80CA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/11] ASoC: renesas: fsi: Add SPU clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609013107.5995-10-phucduc.bui@gmail.com>
References: <20260609013107.5995-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 01:47:03 +0000
Message-Id: <20260609014703.963871F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Redundant device tree clock lookup and devres allocation for missin=
g optional clock.

Pre-existing issues:
- [High] TOCTOU race in interrupt processing leading to NULL pointer derefe=
rence and unclocked register accesses.
--

commit 86706e81d382bcf14351e2e3d3945e492662cf7c
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Add SPU clock support

FSI register accesses on the r8a7740 require the SPU bus clock to be
enabled. Add support for acquiring and managing the SPU clock via the
device tree to ensure proper register access.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 13988c7dc926e..6c432c7235a41 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
[ ... ]
> @@ -1004,6 +1006,13 @@ static int fsi_clk_init(struct device *dev, struct=
 fsi_priv *fsi)
>  	if (IS_ERR(clock->own))
>  		return dev_err_probe(dev, PTR_ERR(clock->own), "Can't get fck clock\n"=
);
> =20
> +	if (!master->clk_spu) {
> +		master->clk_spu =3D devm_clk_get_optional(dev, "spu");
> +		if (IS_ERR(master->clk_spu))
> +			return dev_err_probe(dev, PTR_ERR(master->clk_spu),
> +					"Can't get spu clock\n");
> +	}
> +

[Severity: Low]
Does this code result in redundant device tree lookups and devres allocatio=
ns
if the optional clock is missing?

Since fsi_clk_init() is called twice (once for FSIA and once for FSIB), if =
the
optional "spu" clock is not in the device tree, devm_clk_get_optional()
returns NULL.

The second time fsi_clk_init() is called, the (!master->clk_spu) check will
pass again, causing another devm_clk_get_optional() lookup and allocating a
second devres tracking node for a NULL clock pointer.

Could the clock acquisition be moved to a master-level initialization funct=
ion
instead?

[Severity: High]
This is a pre-existing issue, but does a TOCTOU race condition exist between
interrupt processing and ALSA trigger stops that could lead to a NULL point=
er
dereference or external abort?

In the interrupt handler path, functions like fsi_pio_transfer() and
fsi_count_fifo_err() check stream activity by calling fsi_stream_is_working=
():

sound/soc/renesas/fsi.c:fsi_pio_transfer() {
    ...
	if (!fsi_stream_is_working(fsi, io))
		return -EINVAL;

	buf =3D fsi_pio_get_area(fsi, io);
    ...
}

However, fsi_stream_is_working() acquires master->lock, checks if
io->substream is valid, and immediately drops the lock before returning.

Concurrently, ALSA core can call fsi_dai_trigger(SNDRV_PCM_TRIGGER_STOP),
which invokes fsi_stream_quit(). This function takes master->lock, sets
io->substream to NULL, drops the lock, and disables the hardware clocks.

If CPU2 stops the stream right after CPU1's fsi_stream_is_working() drops t=
he
lock, CPU1 can then call fsi_pio_get_area() and unconditionally dereference
io->substream->runtime, causing a fatal NULL pointer dereference.

Similarly, in fsi_count_fifo_err(), the same race window exists before
calling fsi_reg_read(fsi, DOFF_ST), which can trigger a synchronous external
abort if the clock has already been disabled by CPU2.

Could we hold the lock across the entire interrupt processing sequence, or
validate io->substream safely under the lock without dropping it prematurel=
y?

>  	/* external clock */
>  	if (xck) {
>  		clock->xck =3D devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609013107.5995=
-1-phucduc.bui@gmail.com?part=3D9
