Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5E149690C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718014; cv=none; b=OjSRPXskAnUDpQArLL/rZEGOS1FNdVIblz2ySFw0ucopvHX0sqo1bStvwgEuOO7s4j9tUtixYq2irhG6qMs3BqtQMy+/xO3vvvFrISlZfLu98Cp8gFSVQUG8sOgsByZSPtNK12R8tUSj3zYGRgdGI8xwDGIVYdc+qX7Iw4I9yDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718014; c=relaxed/simple;
	bh=3MSDUa+h9TihBywSVkuSZq23oOoNkm972M4Sz2lWecU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rqlr9tx4k8rAIKQN4Uu4w8AT+xGVWGYNhqQyYff7YHF0p/NseagHf8L4tcNUTWkRH67tfpwAxNC3L20Plx7UvuPLd9SMFY04W61El80/ioe+jK3cdWAMJ+kNIgWWtD02DVtF/ok2TAkFdVTrIaZi3HtIq2FenRsim19fk/18w1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfSUp5tA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfSUp5tA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947D61F000E9;
	Wed, 22 Jul 2026 11:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784718012;
	bh=MBX08ovyWhuB4/7c/iLMKw7sPZJaI2OMxP44m2oAR9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TfSUp5tAByAJ+zBy/ppbCpGKQIHf2AaOadHM9Upg7OskbbDKBJpwu53ahjhOxccCh
	 VWqNiy09ZvQAFu7lW4MgWAoIHeLiSDVyQegdfXg6qJtm89NXEfwwOcJBooqf8ch3e1
	 tVmsB8PVJSTwmboYhJ6t/RY2Kf9QPBDGkayv1nmh66pDackmTUeDBNEEcy2MiBXXXl
	 3s6h1sH6tYUSLirQ8Q95YOF4s8QFhSldSzXVg9zPX3eePZnGTvGFK07X4iE+IuSSOF
	 IfF8d2mLLaXKd/u+dXM+j/SKkYYmA9a3M9RWABD3kzLo9G75VI/aPegBsMHl36RuHn
	 apZos5J0uBc1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] mmc: sdhci-cadence: add CQE support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rohan Joshi" <rohan1sj@cadence.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-cdns_sdhci_cqe-support-v3-2-4412856a4488@cadence.com>
References: <20260722-cdns_sdhci_cqe-support-v3-0-4412856a4488@cadence.com>
 <20260722-cdns_sdhci_cqe-support-v3-2-4412856a4488@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 11:00:12 +0000
Message-Id: <20260722110012.947D61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] In `sdhci_cdns_resume()`, if `cqhci_resume()` were to fail, the err=
or path fails to roll back the already-resumed SDHCI host.
--

--- Patch [2]: [PATCH v3 2/2] mmc: sdhci-cadence: add CQE support ---
commit 3bdb7a0ff9ae82cc040dd069fa74bd0366328e92
Author: Rohan Joshi <rohan1sj@cadence.com>

mmc: sdhci-cadence: add CQE support

This commit adds optional Command Queue Engine (CQE) support to the Cadence
SDHCI host controller driver. The presence of CQE is determined by an
additional host capability register and integrated into the host setup.

> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-ca=
dence.c
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence.c

[ ... ]

> @@ -630,6 +739,13 @@ static int sdhci_cdns_resume(struct device *dev)
>  	ret =3D sdhci_resume_host(host);
>  	if (ret)
>  		goto disable_clk;
> =20
> +	/* Resume CQE if enabled */
> +	if (priv->cqe_support) {
> +		ret =3D cqhci_resume(host->mmc);
> +		if (ret)
> +			goto disable_clk;
> +	}
> +
>  	return 0;
> =20
>  disable_clk:
>  	clk_disable_unprepare(pltfm_host->clk);
> =20
>  	return ret;
>  }

[Severity: Low]
If cqhci_resume() fails, the code jumps to disable_clk, which disables the
clock but leaves the SDHCI host in a resumed state since sdhci_resume_host()
was already called successfully. Is it intentional to skip rolling back the
host resume here?

While cqhci_resume() unconditionally returns 0 today, making this error
path structurally impossible to execute at the moment, should this perhaps
call sdhci_suspend_host() on error to keep the power management state
balanced in case cqhci_resume() behavior changes in the future?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-cdns_sdhci=
_cqe-support-v3-0-4412856a4488@cadence.com?part=3D2
