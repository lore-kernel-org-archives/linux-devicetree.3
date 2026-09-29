Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE51350A0F
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665177; cv=none; b=WAQHn7B1v60u97TjzfAuibyV0fwT0LwwjAjrOyv/dNXmqsGx0OKiYMpUhTf451Vb/MA+bTxLbjY+sUdVecfKEMI9XCWpXyCWtZMsmJVPkRO6uNYBeae6enawt+kgkAtJKId0IXD5frd72za6AY/rtl3zsJk2Pxqr8POafnR6e5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665177; c=relaxed/simple;
	bh=/0bryKEn8/bU6ZC/MErvrVUJ4fVJuDEYf1A35GrxDbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZYwEGkJFS8bjsM+d/LMaff0A90m49nVwZTZRaAhBsKdyQiOEupGNBKgIKZc1HYphIz1WS2eZhyckUd8IR1AAZ6mfmH5n66UQQbyBPTrWT1KySpi/YZNUfCgdAUnuq0jsl1bd/wpbAeV5bNZcsIVFrXzMNSdFHJ+9U2FfdT0FHAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXBjDZiv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXBjDZiv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93B41F000FF;
	Tue, 29 Sep 2026 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790665176;
	bh=3TMiSkXUeiRIIYNuDTucUaNt8Iig6l4DkCaMSUoJXpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LXBjDZivaDkrMF1Q2QpgenuqHqieZeagIuSS26A5sJzPqpYLjLA8tk4k5NV1xd+z7
	 pD/LauS84dq9HcKu+EOfcElLuoslTlEjo+qJv8lKVJQRPwq0/fTrgjyifT64sdWNMg
	 HHYObiOqmX+gGAfp0BZYoLHvqYgSCks/ZXoFigCNka2poepjjkw5RKKr8K0MbS5gBO
	 inuo7dsZI+BWzTbTkjESGL5wPNDpNHLp9JXYn+E3pSAuE4HfgelHdfs5dgKl6T7Knh
	 3Jju9AutEkx6iueAaMU7GKYm5P+3ZNKJNUJ3NltpWWyGjmdEsiqBApnSdOn5LXjDAC
	 R7CaUDtTinFaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 11/19] spi: cadence-quadspi: enable PHY for direct
 reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929063529.1235417-12-s-k6@ti.com>
References: <20260929063529.1235417-1-s-k6@ti.com>
 <20260929063529.1235417-12-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:59:35 +0000
Message-Id: <20260929065935.D93B41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi: cadence-quadspi: hardware state leak on PHY read disable time=
out
--

commit 439a6492544eb30602326054af398141c453e461
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for direct reads

Add cqspi_tune_phy_read() to toggle PHY mode around a direct-mode DMA
read. On enable, it reprograms the DLL from the per-CS calibration result,
configures read-capture for the tuned delay, and asserts PHY_EN and
PHY_PIPELINE in CONFIG. A fallback mechanism drops the clock to the base
rate for operations that cannot use the tuned PHY.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 494008b953cd6..ad99e72578337 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -1075,6 +1076,105 @@ static int cqspi_resync_dll(struct cqspi_st *cqsp=
i)
[ ... ]
> +static int cqspi_tune_phy_read(struct cqspi_flash_pdata *f_pdata, bool e=
nable)
> +{
> +	struct cqspi_st *cqspi =3D f_pdata->cqspi;
> +	void __iomem *reg_base =3D cqspi->iobase;
> +	u32 reg;
> +	u8 dummy;
> +	int ret;
> +
> +	/* Wait for idle before touching CONFIG/RD_INSTR either direction. */
> +	ret =3D cqspi_wait_idle(cqspi);
> +	if (ret)
> +		return ret;

[Severity: High]
Does returning early here on a timeout during disable leak the PHY state?

In cqspi_direct_read_execute(), a direct read is initiated and then the PHY
is disabled via cqspi_tune_phy_read(f_pdata, false). If the direct read
operation stalls and cqspi_wait_idle() times out here, the early return
bypasses the cleanup in cqspi_phy_restore_read_config().

This would leave the CQSPI_REG_CONFIG_PHY_EN and CQSPI_REG_CONFIG_PHY_PIPEL=
INE
bits permanently set in the controller's configuration register. Could this
cause subsequent untuned or indirect operations (which do not clear these
bits) to execute with the PHY unexpectedly active, leading to timing
mismatches or data corruption?

> +
> +	if (!enable) {
> +		cqspi_phy_restore_read_config(f_pdata);
> +		return 0;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929063529.1235=
417-1-s-k6@ti.com?part=3D11
