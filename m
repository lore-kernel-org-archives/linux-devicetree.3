Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CA826159E
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 18:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744904; cv=none; b=CEuINxZstZ/YY6ycCtn8m7cH8zDpidZNflSHniblZpz7xJaRghJgEW4fWJeiHrn6E//e/zJPKB57wovh5a3SEDU3/5t9//9TjkVE4ibOYfZvI2vvFpFn2xf7EWDaGUTo/Ot/q9DfcbjkjFfZSzbPoWMWWNXh7gs+jnas2N+bWRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744904; c=relaxed/simple;
	bh=M2PrcJTioUK+Kp7yK36JM8lBE7XBk3StW997NhCLb3E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FEPSjhSp1HcHmTUjjZ/Ywsje0VYU9dL7YunUkSj9aViPT8gv3NYdbsDDjGyWzYDhn4Q8we9diTTCops1uUtdtPp0mdG/N37S9Vz55UrKQ+gRKPoMHwqyVWP+H8HUmtf+IEfSTfLbm+N62iZY+PJDIqnJhpNGgUKMnxnXGnAA+4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGaF40Y7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGaF40Y7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2C01F0089B;
	Sun, 11 Oct 2026 18:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791744901;
	bh=kBV3NLQmiQvgsrDGuJg8zivprRDWpo8x5AxR4voIeR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XGaF40Y7U4Si5gQTpx9zi2WmqNoSFYX/N0/v6pX5X9PQasBgu7K8mx7a2t3vMYx5q
	 5/c2htj5oBe5tU7FVHaY0yFJdzwXf2P2nkVbTglMgL4HwyNSEhG3Yz+Czt3UNI0xyB
	 BzKpmxrRsutH8RBUxCw5mTvJtHSUunuREACUxS7VDxqT6Jd0YUvyoqdCwLtlh4Y8KD
	 AB1/aJ6PK+pV75HI2Qu7fuxdz2Vo0dOZdV3+KNgvgES/dBkh+WLRvh305BPEDwBB7Y
	 aZVL/GuZKdR9bjxZPKmJSd+cOIkZigDvKh5ox3nOXTBfWC78IpN1gPboOj5vE8rNCD
	 8C/7F9B78ux6A==
Message-ID: <sashiko-outbox-167387@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] pmdomain: mediatek: Restore a register after
 powering a domain on
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261011184755.2058017-3-michal@nozomi.space>
References: <20261011184755.2058017-1-michal@nozomi.space>
 <20261011184755.2058017-3-michal@nozomi.space>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 18:55:01 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pmdomain: mediatek: Incomplete error path in scpsys_power_on() f=
ails to unwind hardware state
--

commit f298ac6e69f935973c035a0a1e72ad788976e0f8
Author: Micha=C5=82 Kope=C4=87 <michal@nozomi.space>

pmdomain: mediatek: Restore a register after powering a domain on

Some blocks lose a setting when their power domain is turned off, and it
has to be restored every time the domain is powered on again, before
the devices in the domain use it.

> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index f0fa79e01f9c3..0585a663f48a6 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -755,6 +757,13 @@ static int scpsys_power_on(struct generic_pm_domain =
*genpd)
>  	if (ret < 0)
>  		goto err_disable_sram;
> =20
> +	if (pd->init_regmap) {
> +		ret =3D regmap_write(pd->init_regmap, pd->data->reg_init->ofs,
> +				   pd->data->reg_init->val);
> +		if (ret)
> +			goto err_enable_bus_protect;

[Severity: Medium]
If regmap_write fails here, the error path jumps to err_enable_bus_protect,
which cascades down to err_pwr_ack:

err_enable_bus_protect:
	scpsys_bus_protect_enable(pd, 0);
err_disable_sram:
...
err_pwr_ack:
	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
err_reg:
	scpsys_regulator_disable(pd->supply);
	return ret;

However, err_pwr_ack does not reverse several earlier steps from
scpsys_power_on(). It fails to call scpsys_bus_protect_enable(pd,
BUS_PROT_IGNORE_SUBCLK), does not re-enable ext_buck_iso, and does not invo=
ke
scpsys_ctl_pwrseq_off() (or the other pwrseq variants).

Does this leave the power domain logically powered off in genpd, but physic=
ally
powered on and partially unprotected, risking system instability on subsequ=
ent
power cycles?

> +	}
> +
>  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION)) {
>  		ret =3D clk_bulk_prepare_enable(pd->num_subsys_clks,
>  					      pd->subsys_clks);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011184755.2058=
017-1-michal@nozomi.space?part=3D2
