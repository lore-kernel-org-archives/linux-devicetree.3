Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384618;
	b=JiVNe1rZdHjEPU/n6slusiec1vRRLaEUCWh1sD+nt+b7EG7nWFeazSY4Y/OSZPRNv6Ir
	 d3vPEX2RNek6SrFb/CkWGfc/2buxEXiGSf9KmetXQE2ua+TvGHAiuKBy6wYxTKxAY22Kh
	 slZyPWIMc1FP8y5c/TtI0b/LzEAfxePg91JfOTY1BKFjKX+yW6R7xWIqSoYiDzceFVQGy
	 pUFB09WPfDIz1locFbq0hm2TnS3Y6T3v5m9FuxiWX28h/JRwsVoIhXv59NrdC7B/QsB7u
	 Z8EoBrZfI1Gy811df4XvYBWFx5I6hGzJfGCPYz0XS8Q4xzxRtMV0GTIDykVLjQ0ZSgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384618;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jXpcicRQvvdQmIEDAXIk+GYTbWLlwy/52Qk6C2+xAZ4=;
	b=o0e/7RKBosaibXiNQHXXNr7nbAIognMkcVETomGZGwEQ6SIzoh5h3CSLTHFVVJt1rJOB
	 BemtFV0byA0DM2/INUczIoL0MpHb6s66zLAS2QDv2ZiGRqhyO/O9FXFsToGal81GW+4vQ
	 N2Z8FmOM2sOHBrZhuR1v4vXKh66Bw7o4mKYRLDFket4u0nXNwvV2PZogLyu2F1v5KnxZe
	 GCEqB3uQBpdZ3S1aeGVdPVckYjKEGHrE2AZOJuC+LiTJyHv1D62Pn5AZdEDtAh8oalPLV
	 fbSk+wLzbSQ4psRu1sGlZIn6qkv9NbEIspsePTMCd3RubxaffI70t1aIgzAP5eDZevg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmEGsZk3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29BD606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmEGsZk3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FA11F00A05;
	Wed, 11 Nov 2026 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794384618;
	bh=jXpcicRQvvdQmIEDAXIk+GYTbWLlwy/52Qk6C2+xAZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dmEGsZk3dZnxgOWx7FsFnBTfyLwpddC1ZsC2fdXl/PhW5yx1PKgpuQM+FhL/mMWlV
	 oP1IP4neKY0zohbZpWfWK3Td6C3W6THvxnVS5Nsj0KrP6GOxYrFGLMczYN6c85UyDs
	 zlmxFb2b1kOuE15bvqACa3zIogNaacRmtOTLACEu+PtRXBsBQCjxt2pygKL7Dr8h2J
	 hVRALl6NBWsMYgQub7lB84DJ8QA3a4dkn4g7dij68/+7447Wd6IoZ3nvutOCNUh4h2
	 xCW3Lfh//ANSQn7tQiFtkxtKqJ0fiDnt5O9KNUjAk8+6hFdBHdv0P3VJF2r4QNTTP9
	 EDLvxy8VXEF5g==
Message-ID: <sashiko-outbox-208574@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 2/3] ptp: Add driver for R-Car Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261110080727.2377040-3-niklas.soderlund+renesas@ragnatech.se>
References: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se>
 <20261110080727.2377040-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:10:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ptp: rcar_gen4: check pm_runtime_resume_and_get() in
  ptp_rcar_gen4_probe()
- [Low] ptp: rcar_gen4: missing PTPTMDC_REG write on error in
  ptp_rcar_gen4_probe()
--

commit 0b281490f8408b05b34c2584004769891977d1ff
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

ptp: Add driver for R-Car Gen4

This commit adds a PTP clock driver for the system-wide gPTP timer found
on Renesas R-Car Gen4 SoCs.

> diff --git a/drivers/ptp/ptp_rcar_gen4.c b/drivers/ptp/ptp_rcar_gen4.c
> new file mode 100644
> index 0000000000000..e82b6c5abc306
> --- /dev/null
> +++ b/drivers/ptp/ptp_rcar_gen4.c

[ ... ]

> +static int ptp_rcar_gen4_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	pm_runtime_enable(dev);
> +	pm_runtime_resume_and_get(dev);

[Severity: Medium]
Should ptp_rcar_gen4_probe() check the return value of
pm_runtime_resume_and_get()?  If runtime resume fails, the device remains
suspended and its usage reference is already dropped, so the following
iowrite32() calls access unclocked registers and a later
pm_runtime_put_sync() in the error or remove path will underflow
dev->power.usage_count.

> +
> +	iowrite32(priv->default_addend, priv->base + PTPTIVC0_REG);
> +	iowrite32(1, priv->base + PTPTMEC_REG);
> +
> +	priv->clock =3D ptp_clock_register(&priv->info, dev);
> +	if (IS_ERR(priv->clock)) {
> +		pm_runtime_put_sync(dev);
> +		pm_runtime_disable(dev);
> +		return PTR_ERR(priv->clock);
> +	}

[Severity: Low]
Should the ptp_clock_register() error path also write 1 to PTPTMDC_REG as
ptp_rcar_gen4_remove() does?  On R-Car S4 and V4H the gPTP block shares
its module clock with the Ethernet controller, so pm_runtime_put_sync()
does not gate the clock while the Ethernet device is active, leaving the
hardware timer running after a failed probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110080727.2377=
040-1-niklas.soderlund+renesas@ragnatech.se?part=3D2
