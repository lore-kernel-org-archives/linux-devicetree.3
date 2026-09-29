Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C40338F928
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665238; cv=none; b=GTGaALOTDRjokJnAhENYbGtRwfO91qMXv2i5aCNVH4uATLhq74K/RTO0AZiqKUu75ciMcYHcSoVBjI2RCnFBP16yhSixlHdxGM1Yg3I4ekGwf9oIBCmp89jdEQLII4doDMBvSbq21fJucYxyBkpO+L4K5uWFNuq50pQzGy3bdxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665238; c=relaxed/simple;
	bh=axBRWw7NLlwpLXXfMDS84PCu4smGR5Te0wgAFbGfd8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LdSrm7kY8YH0ftgM3v87DCT5JqdvAy5jFNB+vH1vyb885t/8iChkM2z2bANecfhVJwyDLywo4n+5K95U9pHBwb2JchHhahlmUrUc2cgKmPOKlOcXDMtWLImlRbjSKb7dofv7bWZr4q2UL/DBrz/hd/Trcqvgn/R0cqGwko5FjdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgfh7908; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgfh7908"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40011F000FF;
	Tue, 29 Sep 2026 07:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790665237;
	bh=yjjH2zF2sQa2U4lgiR9xooBh3GZTR9aHHGWgB00C2rs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jgfh7908mDcNDD2r6Pjxzcrz4mWQXyKhSWyJ4EfmDzoceBNmLAHU3zEfI2asY9C2J
	 aM6NGq7YnA6x5aHN8d75d+asRMu4xqiLDXysbQ9WfQLleJltXOC2LJWIROdjtUaFgw
	 nSnUEy5OUycM0QUyoPogd2bGlvNwIvfYBuJ+nq3h2s9Mly8yqbdJCNREpC8OReSRuJ
	 jHKNo0QbyTTfOYJiXyhdMZfPrSRV6WZAfFbGnmdgBudoaj8ZaV2WS1tp58pxQ1IkHL
	 oT78/FTaVk6esQtn01ceEkA9jd/EoM3EJXIaW/WtIS+W0vnA23Hnv9zc1VYM72TEb2
	 ReANUI6DC3+dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 12/19] spi: cadence-quadspi: enable PHY for indirect
 writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929063529.1235417-13-s-k6@ti.com>
References: <20260929063529.1235417-1-s-k6@ti.com>
 <20260929063529.1235417-13-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 07:00:36 +0000
Message-Id: <20260929070036.B40011F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] spi: cadence-quadspi: modify CONFIG before controller idle in cq=
spi_tune_phy_write()
--

commit 4f09f6b26f85c3cbe5dbc4f013c4a13b3d48d1d9
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for indirect writes

This commit enables PHY for indirect writes of at least a minimum length,
adding cqspi_tune_phy_write() to toggle PHY mode based on calibrated rate
checks. It ensures indirect writes are cancelled before disabling the PHY
in the error path.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index ad99e72578337..2752e7cce16cf 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -1175,6 +1178,37 @@ static int cqspi_tune_phy_read(struct cqspi_flash_=
pdata *f_pdata, bool enable)
>  	return ret;
>  }
> =20
> +static int cqspi_tune_phy_write(struct cqspi_flash_pdata *f_pdata, bool =
enable)
> +{
> +	struct cqspi_st *cqspi =3D f_pdata->cqspi;
> +	void __iomem *reg_base =3D cqspi->iobase;
> +	unsigned int reg;
> +	int ret;
> +
> +	if (!enable) {
> +		reg =3D readl(reg_base + CQSPI_REG_CONFIG);
> +		reg &=3D ~(CQSPI_REG_CONFIG_PHY_EN | CQSPI_REG_CONFIG_PHY_PIPELINE);
> +		writel(reg, reg_base + CQSPI_REG_CONFIG);
> +		return cqspi_wait_idle(cqspi);
> +	}

[Severity: Medium]
Is it safe to modify CQSPI_REG_CONFIG here before ensuring the controller
is idle? In the error path of cqspi_indirect_write_execute(), this is called
with enable=3Dfalse immediately after cancelling the write. If the controll=
er
is still busy waiting for AHB data, could modifying this register lead to
undefined hardware behavior and potentially leave the PHY enabled?

[ ... ]
> @@ -1367,7 +1401,7 @@ static int cqspi_write_setup(struct cqspi_flash_pda=
ta *f_pdata,
> =20
>  static int cqspi_indirect_write_execute(struct cqspi_flash_pdata *f_pdat=
a,
>  					loff_t to_addr, const u8 *txbuf,
> -					const size_t n_tx)
> +					const size_t n_tx, bool use_phy)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but does the remainder byte
handling in this function (and cqspi_indirect_read_execute) corrupt partial
transfers on big-endian systems?

For the bulk of the transfer, the stream accessors (iowrite32_rep /
ioread32_rep) are used, which preserve byte order. However, for the
remainder bytes:

		if (mod_bytes) {
			unsigned int temp =3D 0xFFFFFFFF;

			memcpy(&temp, txbuf, mod_bytes);
			iowrite32(temp, cqspi->ahb_base);
			txbuf +=3D mod_bytes;
		}

Will using iowrite32() (and ioread32() for reads) cause the remainder bytes
to be unexpectedly byte-swapped on big-endian hardware since they use
register accessors instead of stream accessors?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929063529.1235=
417-1-s-k6@ti.com?part=3D12
