Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEB751C060
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 18:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793268; cv=none; b=K/z2JnnNs1ie9LFCjnpC3OohzQyFICW2WZpqO5xlnDtI83LZw+DUwmqdttt92g3YG3+idA1jVf1KYMAkq3ROiB4KpNw6ZnDLRv+jy8R2zdOFWyDErNijy2RgObt5D33YagM2I3CkVvseGXb44i8xuRyhQ4VphRQrqHt79Dcqd3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793268; c=relaxed/simple;
	bh=TExRCyz2ixvwvqcfgR8j77Hkfh3EqohFYwJB+dJV1xM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UJfgXojtXb+vBXd6WguYxZ6w4AMm8EiLqyhlZnnJTOLtU/KU4I26rQEqV+iQ402/rFqz/7K1lzZ8/uSsb6dudNJpwEUbs5EvGM/AHZONr2ZSUKOPniEtiDm2Up4+NMsJZHVjEH108K04r0V763HTfXlW4bhG4DYnn08MPkQI4f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XD4wmDt1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XD4wmDt1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC361F00898;
	Wed, 30 Sep 2026 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790793267;
	bh=vZoNBx14GWNBElKSsWwMTHxJEoWgr6AlbQFQrOUt4WQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XD4wmDt1sTx+WprTe0FrZ25nZG01geHWMvpxrqkto+cI+9pOwNLdXRdYYLSUVYUe+
	 XLei18jKSbJgEvPV2ntZM0r1JgM3VdKmgnhvJtx/0to/UKndicVLjigdwiwjBWJ0YU
	 uC3QN26f1VX3zQKOn8VHj5GEDmH4yd+egNyiTr37bmrXmzoY15kp+29Pjp9bZC/AGk
	 VZiUT9rwp5539lvjsP2Ln+5SN65qMFIUP1cxeJNNYPnit+BVYPshjjqm1Nx1awgFu4
	 Y8WfKStNimEmImhQSaN4+mSHtHxfVblQ52BOg8OsmyyWyw4pnP/jHRSThzOFCiT6cA
	 e1Jf57prnY5wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] spi: sg2044-nor: Honor SPI clock limits
Reply-To: sashiko-reviews@lists.linux.dev
To: "Han Gao" <gaohan@iscas.ac.cn>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001-fix-sg204xspi-v2-2-014dbaf22b5e@iscas.ac.cn>
References: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
 <20261001-fix-sg204xspi-v2-2-014dbaf22b5e@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 18:34:26 +0000
Message-Id: <20260930183426.BCC361F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi: sg2044-nor: severe lock contention due to clk_get_rate() in f=
ast path
--

commit d5eb2cd92142b8e5a4297344fc25807495e0c3fc
Author: Han Gao <gaohan@iscas.ac.cn>
spi: sg2044-nor: Honor SPI clock limits

This commit dynamically calculates the clock divider before each transfer to
ensure the SCK does not exceed device or operation limits. It also advertis=
es
the controller maximum speed to the SPI core to supply a default when omitt=
ed.

> diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
> index ff026ca0f7663..bc9a8ee9bce44 100644
> --- a/drivers/spi/spi-sg2044-nor.c
> +++ b/drivers/spi/spi-sg2044-nor.c

[ ... ]

> @@ -385,6 +385,29 @@ static ssize_t sg2044_spifmc_trans_reg(struct sg2044=
_spifmc *spifmc,
>  	return 0;
>  }
> =20
> +static int sg2044_spifmc_set_speed(struct sg2044_spifmc *spifmc,
> +				   unsigned int speed_hz)
> +{
> +	unsigned long rate =3D clk_get_rate(spifmc->clk);

[Severity: High]
Does this introduce severe lock contention by acquiring the clock
framework's global mutex on every SPI transfer?

During every SPI memory operation, the fast path executes:
sg2044_spifmc_exec_op() -> sg2044_spifmc_set_speed() -> clk_get_rate()

Because clk_get_rate() takes a global mutex, doing this redundantly on
every transfer can drastically impact the performance of the system and
delay other subsystems interacting with clocks.

Could the clock rate be cached in the device struct during probe() instead
of being queried per-operation?

> +	u64 div;
> +	u32 reg;
> +
> +	if (!rate)
> +		return -EINVAL;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-fix-sg204x=
spi-v2-0-014dbaf22b5e@iscas.ac.cn?part=3D2
