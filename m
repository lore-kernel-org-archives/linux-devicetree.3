Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE552773E5
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973786; cv=none; b=Z1JPcQRXdBEd7enpTMWbwFzkjftFcfO5rrVF2OP9+MMjHscG6TLq81rD1I7lVgSgp+2jSy4l2ZyGAjr/m8uIsT+NWiLsWpRdhb5zJP5jHTHfskwe0Tj85YI890F0FcfHX8JgNWW6SSFiuc5+KePsE2/6dCoiVO9IJQ2JDHOl7qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973786; c=relaxed/simple;
	bh=XvOu7vKIBQH8W1wdvaZOou39KGTXKcJOzdL6pItRvsY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lzWBrg/6BMj/FxKSvir8ZhYwkll8owZTErxHtFp2FA9OOKTJAoYY361YIruQ1gZAr/UgTxDOmBtHzbtjJ3Q4cC3nXymo58z8PGbHngKhGSji81BNPATtvcB4N7VVBzn9qi4ue+VskkulnH0pb2VpS1Mfb2F0UNF1zR7f+cEIQdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHYlGIN5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHYlGIN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C8D1F000E9;
	Mon, 13 Jul 2026 20:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783973784;
	bh=oaRghehr9OLJXuub/QVXSF7SYBPr6BDDf/bUvviwbSk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YHYlGIN51fLUI9+bsKyNnssf1BIEm5/G+sqzzCEteWtmwJksMRbmBbXWCqUM6sBho
	 iV6PuBwXq+VsLNMcWfJEn5kwSoGPdTXoBMB0BWT3PmaayxcH66WX5PoiZ6jh9YWm/0
	 qx/fW5F/JdVwZJnIxPHLve1S1ULj0/BnGsroTyfghaomB3+2C+lYPbL9WYQkrB3X2K
	 9n10w6TTfSRPKqn3YLo36aUWlZqL8sib1A4KRU00VXIu7stj1bEa95xJfi4V+zSB8u
	 oC8UOjtWqnfJYJtT/MKTojcGqyWNfOenAeGGD7ABRMXloKWYhgBud7DByJQrH535L9
	 5fo7V8IDtkYcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: Add LPASS VA CSR heartbeat pulse clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarath Ganapathiraju" <sarath.ganapathiraju@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714-master-v1-2-1ebe5993225e@oss.qualcomm.com>
References: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
 <20260714-master-v1-2-1ebe5993225e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 20:16:24 +0000
Message-Id: <20260713201624.99C8D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Uninitialized stack variable `val` is evaluated if `regmap_read()`=
 fails in `heartbeat_pulse_is_enabled()`.
- [High] The clock enable/disable callbacks use a standard regmap and Maple=
 Tree cache, leading to lock nesting violations and 'sleeping in atomic con=
text' panics on PREEMPT_RT.
- [Medium] The return values of `regmap_write` and `regmap_update_bits` are=
 silently ignored in `heartbeat_pulse_enable`.
--

--- Patch [2]: [PATCH 2/2] ASoC: Add LPASS VA CSR heartbeat pulse clock ---
commit 7fe84986850c91283daded46e6a43a50beacfb9f
Author: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

ASoC: Add LPASS VA CSR heartbeat pulse clock

This commit adds the LPASS VA CSR driver to model the rate generator
as a clock provider. This enables automatic enable and disable via
the clock framework during runtime PM resume and suspend.

> diff --git a/sound/soc/codecs/lpass-va-csr.c b/sound/soc/codecs/lpass-va-=
csr.c
> new file mode 100644
> index 0000000000000..14aec8f941008
> --- /dev/null
> +++ b/sound/soc/codecs/lpass-va-csr.c
[ ... ]
> +static int heartbeat_pulse_enable(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr =3D to_lpass_va_csr(hw);
> +
> +	regmap_write(csr->regmap, LPASS_RATE_GEN_COUNTER_0, csr->data->counter_=
0);
> +	regmap_write(csr->regmap, LPASS_RATE_GEN_DELAY, csr->data->delay);
> +	regmap_update_bits(csr->regmap, LPASS_RATE_GEN_CTRL,
> +			   LPASS_RG_CTRL_EN, LPASS_RG_CTRL_EN);
> +
> +	return 0;

[Severity: Medium]
Does this function unintentionally mask hardware or cache errors? By ignori=
ng
the return values from regmap_write() and regmap_update_bits() and
unconditionally returning 0, the clock framework might assume the clock is
enabled even if the hardware write or cache allocation failed.

> +}
[ ... ]
> +static int heartbeat_pulse_is_enabled(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr =3D to_lpass_va_csr(hw);
> +	unsigned int val;
> +
> +	regmap_read(csr->regmap, LPASS_RATE_GEN_CTRL, &val);
> +
> +	return !!(val & LPASS_RG_CTRL_EN);

[Severity: High]
Could this evaluate uninitialized memory if the regmap read fails? If
regmap_read() returns an error, the stack variable val is left untouched,
which might result in the clock framework registering an incorrect initial
hardware state.

> +}
> +
> +static const struct clk_ops heartbeat_pulse_ops =3D {
> +	.enable =3D heartbeat_pulse_enable,
> +	.disable =3D heartbeat_pulse_disable,
> +	.is_enabled =3D heartbeat_pulse_is_enabled,
> +};

[Severity: High]
Is it safe to use a standard regmap and maple tree cache in atomic clock
callbacks? The common clock framework invokes .enable, .disable, and
.is_enabled callbacks under the enable_lock raw spinlock with interrupts
disabled.

However, the regmap configuration omits use_raw_spinlock =3D true:

static const struct regmap_config lpass_rate_gen_regmap_config =3D {
	...
	.cache_type =3D REGCACHE_MAPLE,
};

This means the regmap operations rely on a standard spinlock. On preempt-rt
kernels, a standard spinlock is a sleepable rt_mutex, which could cause lock
nesting violations and kernel panics when acquired inside an atomic context.
Additionally, the REGCACHE_MAPLE cache type allocates memory and uses its o=
wn
standard spinlock.

Should these callbacks be moved to .prepare and .unprepare instead, which r=
un
under a sleepable mutex context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-master-v1-=
0-1ebe5993225e@oss.qualcomm.com?part=3D2
