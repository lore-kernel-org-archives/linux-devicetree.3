Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909A428B7DA
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787657064; cv=none; b=LHQQ9QkKzgGCN/VgQiTAupRrYinuyqyXBzEz3KeFv58iR0TlvFzzdR60GKgH1dmw3CIBHgNmWmfdEqcDkY5vW3RnL33qhyq/yAEe6kW9XkJEg1v9Kjwnyab9dGtewXsaQJ2jWfDUhC+m474MnGxMhouFlDzdex77+allTYn5fLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787657064; c=relaxed/simple;
	bh=xLqbKAI281pxZ1yD5cvn52d7/I7KrdjIiSKYXUfwaFo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qy+XiMwYP7KkTMrOTYkLiKq0b2P356aPUn1qFoHjAM2ozwE9Ovfp8LhJG7nuelqM+jle7iprbDYBTlI4Tcv+qPxRmEmvOztBlN+nMDzuAntvZP8WfbUb+YSbyWrxBAJC+5Cu/bGK5K6IRTu3BIl6T/pVA8PALso7h6BIz7DWofQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6uxNw+U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6uxNw+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FDD1F000E9;
	Tue, 25 Aug 2026 11:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787657063;
	bh=gJoeW07gUWfDhVtrvAHhgVe6HyLIFK2fU8TU/x9pfjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j6uxNw+UOkPnyQ5gztiWiPlb1zzYUhFm84joMmcS1sEeI7slxvnfc/4zGFaVxLZ7q
	 G7fPEYcc7ZC4AI1P8kLKEE9uVe4/p/j3scT0B0DH5Ee3n/49zbkm6+ZEUSFwYyqaKI
	 hXxPYIJh9olqnl5GqE5lIGeLLTHg++Y+qh2H2W3VVxFPdEKIpsPTXme4pIyAo75OJk
	 qCG8p6fxKlQVcbij/C52O670hRLwvVl/i7I/XNK/0Ea0bq4xuRhSQ+4otU4d+0HFHY
	 hixzbvXSVGCXG76xKZkH855Q9qmL60vGUHNoK5IqrL/EN/BqUytyTp2njYrLXcUUfq
	 X7pokXmJTgWOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] mmc: sdhci-cadence: Add CQE support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rohan Joshi" <rohan1sj@cadence.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825-cdns_sdhci_cqe-support-v4-2-e9f72e338373@cadence.com>
References: <20260825-cdns_sdhci_cqe-support-v4-0-e9f72e338373@cadence.com>
 <20260825-cdns_sdhci_cqe-support-v4-2-e9f72e338373@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 11:24:22 +0000
Message-Id: <20260825112423.11FDD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardcoded cqhci_host_ops breaks SoC-specific write wrappers (e.g=
., Elba SoC byte-lane enables), causing potential hardware state corruption.
--

--- Patch [2]: [PATCH v4 2/2] mmc: sdhci-cadence: Add CQE support ---
commit dbab4b1c448ae45285ec3f2e6b5c3e939ca07cc3
Author: Rohan Joshi <rohan1sj@cadence.com>

mmc: sdhci-cadence: Add CQE support
   =20
Cadence host controller has optional CQE (Command Queue Engine).
The HW presence of CQE is determined by an additional host capability
register. Look up for "cqhci" register space from the DT and when
present, initialize CQHCI engine.

> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-ca=
dence.c
> index 435603c8c00b2..aa4431ef2b394 100644
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence.c
[ ... ]
> @@ -385,6 +392,68 @@ static void sdhci_cdns_set_uhs_signaling(struct sdhc=
i_host *host,
>  		sdhci_set_uhs_signaling(host, timing);
>  }
> =20
> +static u32 sdhci_cdns_cqhci_irq(struct sdhci_host *host, u32 intmask)
> +{
> +	int cmd_err =3D 0;
> +	int data_err =3D 0;
> +
> +	/* return original intmask to be handled by other handlers if it's not =
a CQE interrupt */
> +	if (!sdhci_cqe_irq(host, intmask, &cmd_err, &data_err))
> +		return intmask;
> +
> +	cqhci_irq(host->mmc, cmd_err, data_err);
> +
> +	return 0;
> +}
> +
> +static const struct cqhci_host_ops sdhci_cdns_cqhci_ops =3D {
> +	.enable		=3D sdhci_cqe_enable,
> +	.disable	=3D sdhci_cqe_disable,
> +};
> +
> +static int sdhci_cdns_cqe_add_host(struct sdhci_host *host, struct platf=
orm_device *pdev)
> +{
> +	struct cqhci_host *cq_host;
> +	bool dma64;
> +	int ret;
[ ... ]
> +	dma64 =3D host->flags & SDHCI_USE_64_BIT_DMA;
> +	if (dma64)
> +		cq_host->caps |=3D CQHCI_TASK_DESC_SZ_128;
> +
> +	cq_host->ops =3D &sdhci_cdns_cqhci_ops;

[Severity: Medium]
By hardcoding cq_host->ops to sdhci_cdns_cqhci_ops here, does this bypass
the SoC-specific write wrappers needed by platforms like the Pensando Elba
SoC?

The sdhci_cdns_cqhci_ops struct lacks a custom .write_l callback. Elba
requires a custom byte-lane enable configuration protected by wrlock
(elba_priv_writel). If a raw writel() from the CQE core interleaves with
an elba_write_b(), the 32-bit CQHCI write could be truncated by the hardware
to 1 byte, potentially corrupting the CQE state.

While Elba's current device tree might not define the cqhci resource, it
appears CQE support is architecturally intended for it since CQE hooks are
added to sdhci_elba_ops further below in this patch. Is there a way to allow
sdhci_elba_drv_data to supply its own cqhci_host_ops, or dynamically inherit
the write_l wrapper from the host operations?

> +
> +	host->mmc->caps2 |=3D MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
> +
> +	ret =3D cqhci_init(cq_host, host->mmc, dma64);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "cqhci init failed\n");
> +		goto cleanup;
> +	}
> +
> +	/* add host to MMC subsystem */
> +	ret =3D __sdhci_add_host(host);
> +	if (ret)
> +		goto cleanup;
> +
> +	return 0;
> +
> +cleanup:
> +	sdhci_cleanup_host(host);
> +	return ret;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-cdns_sdhci=
_cqe-support-v4-0-e9f72e338373@cadence.com?part=3D2
