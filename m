Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5B835CB6A
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 14:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668254; cv=none; b=rio6p0dw2nqxMWVg67wcLJp8gw3wgRv7QyjKOro8025bnCVaZtpnixmY50bkdHwvB16TZMRLAs7DQBKNH1sPTmnYSLWVzPmGRT2azkmgpf3TjUecwI+thLmtmwd6xAyk4CeoKxVpr9A6bM7q/2ga1OofH2ucBD42xbbBje6lRZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668254; c=relaxed/simple;
	bh=Xo2hFHtyKCsSF8RLQqHJE7GMwdSmwWbFyUfFPVgdm7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E8slFIAgN9yr6/ckw62JUQv97vZ63l+GNxU51lw9eCJVdg2Q443Vfk3dl9rc4T7j541/OwMiGQ2Y/x3VJJaGyw8pUT3uWyDBnecpTTZE3ikjxEsvtZEMx8ym12mKLXU5qSmVeBo+Lv9J4QShjxto7+zKSYjhhNXa1Y3cKfodQAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+FnFUgJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+FnFUgJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2A81F00898;
	Fri,  5 Jun 2026 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780668253;
	bh=aOHUT2Ksa9+eTBrlEuneSYRR/2rvuY0xgQ+fmf7/3Z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O+FnFUgJoOKGpajFLKJ086PMLhTye7CxGvS7bOHzTCQXHIB3aSwYZhZSzdotTwruc
	 f4i0i7hO81e/8H1I+vtFSyI8JdNDr+O9zmG1bbhKmzuYO1Lr1otBtlxXdzqrfOLzb5
	 6Z3uOhvmgt+Z/NK7gH5R5aH42/Gq8XE3CfdcqsZZEEwSP7lHdYn5Ws4IBKjxxmMDlL
	 ZNH0HVZ31IQYQcQbTh8yOr9yIIUNjhsveuJCSHmfwmIGtnwtbJ0YUkOwTX78sZVbIH
	 Coux5i31gvRc4bSvgRKP17mpK2EdKDeEbp6KRHlKA+NdScYXCWWwLLYnQ1SODTppAn
	 SQFWW4aDSRzxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/10] ASoC: renesas: fsi: refactor clock
 initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605121955.105661-9-phucduc.bui@gmail.com>
References: <20260605121955.105661-9-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 14:04:12 +0000
Message-Id: <20260605140412.CB2A81F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing cleanup for previously allocated FSIA DMA channels if FSIB=
 clock initialization fails in probe.

Pre-existing issues:
- [High] The DAI trigger callback executes sleeping clock operations while =
holding a PCM spinlock.
--

commit 7a2af4d59dffa88627e517f84d651b199bf13ef8
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: refactor clock initialization

This commit moves the fsi_clk_init() function call from fsi_dai_set_fmt()
into the fsi_probe() path. It aims to ensure that clock resources are
validated early during the driver probe rather than deferring the lookup
to hardware configuration.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index a2d7d17dd2bb0..3f303e15e8351 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c

[ ... ]

> @@ -898,6 +904,11 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
>  	int ackmd, bpfmd;
>  	int ret =3D -EINVAL;
> =20
> +	if (!ick || !div) {
> +		dev_err(dev, "ick clock or div clock is missing\n");
> +		return -EINVAL;
> +	}
> +

[Severity: High]
This isn't a bug introduced by this patch, but does this clock initializati=
on
path ultimately lead to sleeping while atomic?

The ASoC framework invokes fsi_dai_trigger() in an atomic context with the
PCM stream spinlock held and IRQs disabled. For the start command, the call
chain executes:

fsi_dai_trigger()
  fsi_hw_startup()
    fsi_clk_enable()
      fsi_clk_set_rate_cpg()
        clk_set_rate()

clk_set_rate() attempts to acquire the global prepare_lock mutex in the com=
mon
clock framework, which will trigger a scheduling-while-atomic panic when
called from the atomic trigger path.

[ ... ]

> @@ -1985,6 +2000,9 @@ static int fsi_probe(struct platform_device *pdev)
>  	fsi->master	=3D master;
>  	fsi_port_info_init(fsi, &info.port_b);
>  	fsi_handler_init(fsi, &info.port_b);
> +	ret =3D fsi_clk_init(&pdev->dev, fsi);
> +	if (ret)
> +		return ret;
>  	ret =3D fsi_stream_probe(fsi, &pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "FSIB stream probe failed\n");

[Severity: High]
If this fails, does the direct return bypass the cleanup for FSIA?

Earlier in fsi_probe(), FSIA is probed and successfully allocates
non-devres managed DMA channels. If fsi_clk_init() subsequently fails for
FSIB (for example, returning -EPROBE_DEFER for an unavailable clock), the
error path directly returns instead of executing the cleanup routine.

Would this lead to a permanent leak of the DMA channels and other stream
resources allocated for FSIA? Might a goto statement targeting the exit_fsia
label be needed here so that fsi_stream_remove() can safely clean up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605121955.1056=
61-1-phucduc.bui@gmail.com?part=3D8
