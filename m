Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8CB34252C
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254454; cv=none; b=AT3xRvsf8TkjQiln9dEZ2oSAHb3gSuCYecuNuzei9T4pD2ktlltt+M3tMAD7TAhMNu2Bq3VLv+pezyCPRNOemYm/vp6mtPfFI2/xWedzep3O0hlVxHNMO93hZ0vATVrZKXSIZGWGacxczzmy4uiSO8hkN6qyb4F07q9ookKZuEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254454; c=relaxed/simple;
	bh=b2w2RorCXv27vklyrn2f1yMaMM9jdltE6H4XLsiCA/g=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pan76Rb2u8oGUjAlLSLj975XyqXeG13/95UNGqTcpJ0ht+P5knnz14lcRj9KKN4u6iMDGFaHRkHPOUWA/ULm7oS/nEPYxfZp7+fK28q/4j9JR04CXt3lh4g4SC4ijWaMfDA9uioZpZQiRsesExT0FnOeweHQuFoZBaqs9momfy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgBpVhaQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgBpVhaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE211F000E9;
	Fri, 12 Jun 2026 08:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781254453;
	bh=SPgyNtMlVxZwVRLgvYwdmmAwYSEPNa5R7a6nqBzQ9uQ=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=TgBpVhaQ07s5se6DMColvl02TLhhVC4qY3KdbSppxqfjKuEZqbewfilCw8khPZyak
	 1qrYx4iNHlWX1Gb9JuxqlBeiipB9ChwO1SWI0mF+lVSA5B/NIjMmwnqrYA02xT5Xq2
	 qVOqER5BmEfETKnHaT7cQP+aC9sV/4Ny1RUy37rrGOiEepco9gLKUltQajFUuc5Sdp
	 v142zd6nRQkbLV5wf+azuTZ2A8z5pD/QBJWJYpuUmbMFWW1gjuWQ8KGUd9ZORUEAPO
	 VOLd2gsiX4OKHS0oUV9MNc0HGYeJvL7ocZ4GEv5UR3VOuRcREHSNfLakwD+/BowWx0
	 3+Ykspk2uQxmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/6] clk: Introduce clk_hw_set_spread_spectrum
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612-clk-v10-v10-2-eb92484eda38@nxp.com>
References: <20260612-clk-v10-v10-2-eb92484eda38@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 08:54:12 +0000
Message-Id: <20260612085413.3AE211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk_hw_set_spread_spectrum() modifies clock hardware state without=
 checking if the clock rate is exclusively protected.
- [Medium] clk_hw_set_spread_spectrum() silently returns success (0) when t=
he clock provider does not implement the set_spread_spectrum callback.
--

commit fbe42efd1852814fc95559f8dd8be280e7cdb66e
Author: Peng Fan <peng.fan@nxp.com>

clk: Introduce clk_hw_set_spread_spectrum

This commit adds clk_hw_set_spread_spectrum() to configure the spread spect=
rum
feature of a clock. It also introduces the set_spread_spectrum callback for
clock drivers to provide hardware-specific implementations.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 048adfa86a5d0..8c78621cde253 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c

[ ... ]

> @@ -2774,6 +2774,33 @@ int clk_set_max_rate(struct clk *clk, unsigned lon=
g rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> =20
> +int clk_hw_set_spread_spectrum(struct clk_hw *hw, const struct clk_sprea=
d_spectrum *ss_conf)
> +{
> +	struct clk_core *core;
> +	int ret;
> +
> +	if (!hw)
> +		return 0;
> +
> +	core =3D hw->core;
> +
> +	clk_prepare_lock();
> +
> +	ret =3D clk_pm_runtime_get(core);
> +	if (ret)
> +		goto fail;
> +

[Severity: High]
Should this check if the clock rate is exclusively protected before modifyi=
ng
the hardware state?

Other clock adjustment functions like clk_set_phase() or clk_set_rate() che=
ck
clk_core_rate_is_protected(core) and return -EBUSY to prevent interference
with consumers that require a strict, stable clock. Since enabling spread
spectrum dynamically modulates the frequency, it seems like it could disrupt
consumers relying on that protection.

> +	if (core->ops->set_spread_spectrum)
> +		ret =3D core->ops->set_spread_spectrum(hw, ss_conf);
> +

[Severity: Medium]
If the clock provider does not implement the set_spread_spectrum callback,
will this silently return 0 (success) because ret was set to 0 by a
successful clk_pm_runtime_get(core)?

Returning success when the operation is unsupported might mislead callers i=
nto
believing the spread spectrum modulation is active. Does it make sense to
return an error code like -EOPNOTSUPP instead?

> +	clk_pm_runtime_put(core);
> +
> +fail:
> +	clk_prepare_unlock();
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_set_spread_spectrum);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-clk-v10-v1=
0-0-eb92484eda38@nxp.com?part=3D2
