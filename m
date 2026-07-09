Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E73DDDAF
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 06:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783580282; cv=none; b=aBCUUGjY2BhDHqOfLB52MZIhLmbFOiaLEVdR5b9T1+ogSoH78z0zRoJDVDBhPnuUaVlhlTUmGv8TQ/Pu1DaNCDNSd6qN9ulshkl0mslxHCxmLFAV++0HSsFOdGDfmgGlETsZC8F5laKHC9XgmsZV3CsUI+wtwv047jGU/lFhvpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783580282; c=relaxed/simple;
	bh=F4jkBYDEmQhTJEhA4rY1z/0d2c02wkDCLW3QSDHLl04=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uen57pLkzCBLIE8UTqhAX6/QNbPpLzwoExbVBL6evEfArBV2mbRcxzVOZP775hNceoa7jq1Qy9HIPiJaVF+RmE3+tOBQUdZ5J2c/TCEw9L9RrPn6Azc8qCYRJe1KyCuUN6cNNERXwyKabo9yEbpeLlkI3JQvzpD+28TMqo0vjWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUHqqvZF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUHqqvZF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AC61F00A3A;
	Thu,  9 Jul 2026 06:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783580280;
	bh=cbaOBz46srE2heZPiINicbEw0+k5yBxXocBgZjx/iVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AUHqqvZFM142YTXejp4zRY/syaI7pZIsPqIszBVvLrv2o86RqZyIILk1s8DEG2Tn/
	 Uq5EpBw1oe+b1MtR+GDZOsB7YpqIlvZj5gMzyfrLkzBE3UhYpHb74upD2M7F5TlY+5
	 gqtpt5rWi5C3zy4xXxSciE0uNhd2iQ/Ng4Hf9ZAORHen54SbbPAHkMJeLXy4kNRlIP
	 dhr9+ZsFr0soOayjzvKY38xPJemlqFZdntKkMFnKVxkR4f6N9rOvDSTl/eCh5Vj28z
	 vE+T5z3KqDUzTZKIWNQW84HpIRYKZqa8qKIWji/w9OaMwlF/XaRWqnVjCedkkKkjlB
	 MoLs0qq8BupfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] i3c: master: Add driver for AMD AXI I3C master
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260709064233.1451482-3-shubhamsanjay.patil@amd.com>
References: <20260709064233.1451482-1-shubhamsanjay.patil@amd.com>
 <20260709064233.1451482-3-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 06:57:59 +0000
Message-Id: <20260709065800.68AC61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Use-After-Free due to using devm_kzalloc for a structure embed=
ding a registered device.
- [High] Custom FIFO accessors incorrectly use host-endian memory access wi=
th BE I/O functions, causing data corruption on Little-Endian architectures.
- [Medium] Clock math rounding errors violate I3C/I2C timing requirements.
--

--- Patch [2]: [PATCH v10 2/2] i3c: master: Add driver for AMD AXI I3C mast=
er controller ---
commit 00474ccc3cfbb305b1555163333b3484dcd7f140
Author: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

i3c: master: Add driver for AMD AXI I3C master controller

This commit introduces a new driver for the AMD AXI I3C master controller.
It supports Standard Data Rate (SDR) mode, Dynamic Address Assignment, priv=
ate
transfers, and CCC transfers in both broadcast and direct modes, as well as
falling back to I2C mode.

> diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd=
-i3c-master.c
> new file mode 100644
> index 0000000000000..ef5ad5abb788c
> --- /dev/null
> +++ b/drivers/i3c/master/amd-i3c-master.c
> @@ -0,0 +1,1124 @@
[ ... ]
> +static inline void xi3c_readsl_be(const void __iomem *addr, void *buffer,
> +				  unsigned int count)
> +{
> +	u32 *buf =3D buffer;
> +
> +	while (count--)
> +		put_unaligned(ioread32be(addr), buf++);
> +}

[Severity: High]
Can these custom stream accessors corrupt data on Little-Endian
architectures?

In xi3c_readsl_be(), ioread32be() returns a native 32-bit integer. When
put_unaligned() writes this back to memory on a Little-Endian system, it
writes it in Little-Endian order, effectively reversing the byte stream for
every 4-byte chunk.

[ ... ]
> +static inline void xi3c_readl_fifo(const void __iomem *addr, void *buf,
> +				   int nbytes)
> +{
> +	xi3c_readsl_be(addr, buf, nbytes / 4);
> +	if (nbytes & 3) {
> +		u32 tmp;
> +
> +		xi3c_readsl_be(addr, &tmp, 1);
> +		memcpy((u8 *)buf + (nbytes & ~3), &tmp, nbytes & 3);
> +	}
> +}

[Severity: High]
Will this remainder copy logic discard the payload on Little-Endian systems?

Because the remainder is read into a stack variable (tmp), the lowest memory
address of this 32-bit integer receives the zero-padding on Little-Endian
architectures. The memcpy() will then copy this zero-padding into the buffer
instead of the actual payload bytes.

[ ... ]
> +static int xi3c_clk_cfg(struct xi3c_master *master, unsigned long sclhz,=
 u8 mode)
> +{
> +	unsigned long core_rate, core_periodns;
> +	u32 tcasmin, tsustart, tsustop, thdstart;
> +	u32 thigh, tlow, thold;
> +	u32 odthigh, odtlow;
> +
> +	core_rate =3D clk_get_rate(master->pclk);
> +	if (!core_rate)
> +		return -EINVAL;
> +
> +	if (!sclhz)
> +		return -EINVAL;
> +
> +	core_periodns =3D DIV_ROUND_UP(NSEC_PER_SEC, core_rate);
> +
> +	thigh =3D DIV_ROUND_UP(core_rate, sclhz) >> 1;
> +	tlow =3D thigh;

[Severity: Medium]
Does this clock calculation risk violating minimum I3C/I2C timing
requirements?

The DIV_ROUND_UP for core_periodns overestimates the period. When calculati=
ng
tcasmin later by dividing XI3C_TCASMIN_NS by core_periodns, this
overestimated period could result in fewer nanoseconds than required by the
specification.

Additionally, the right shift by 1 on the DIV_ROUND_UP of core_rate and scl=
hz
discards the remainder. If the quotient is odd, thigh and tlow will lose a
cycle, resulting in an overall bus frequency that exceeds the requested scl=
hz
limit.

[ ... ]
> +static int xi3c_master_probe(struct platform_device *pdev)
> +{
> +	struct xi3c_master *master;
> +	int ret;
> +
> +	master =3D devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);

[Severity: Critical]
Is it safe to use devm_kzalloc for the master structure here?

The master structure embeds struct i3c_master_controller, which contains a
struct device registered with the driver core. During driver unbind, the
devres core will free this memory immediately after remove() returns.

However, userspace or another subsystem might still hold a reference to the
embedded device (for example, through an open sysfs file). If that happens,
it could trigger a use-after-free when the final reference is eventually
dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709064233.1451=
482-1-shubhamsanjay.patil@amd.com?part=3D2
