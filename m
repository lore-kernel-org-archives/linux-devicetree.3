Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D243EF0C9
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896167; cv=none; b=h2XhAmZ840sdGlscDDh/5BwuNjZOB15tR7c2CPKd+5awBJkjFOO3W1QY1fjDJWsbm5VH+VqetPj04AmsfLdeGFRbJeUm+IQ/TCbMoX0UNCDh0zdQ0VOvqCMIzjaPBBEipOZ+h2wrCv9X4LObqAfdAMRsTI+bY/xBOIoQNYOtYBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896167; c=relaxed/simple;
	bh=0/P61UJIVTkm5oyLIC2oV3YaApLz35OTT7LIJ2uSBUc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M0Qt38Er3pMnzHbiTZa54KKEeZxKv7/FnTJfq+EzzH0cY8ey8NX+rK/0OWKyurK2LRtpXkyr/E2rFv96A/Yl9a2O4uwZXsPIvvEWSutPza1Wx+Lk0m9Yh53lhUybpja5ZkajKMB+mPr5wJFaqlJv5wOZnUbB/ImHucxabOUGpZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPNUvDP6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPNUvDP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E6E1F000E9;
	Wed,  1 Jul 2026 08:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782896166;
	bh=9DaA9kVTOedHvOjZqWyeSBbHPj/u5hBht2LonyPHTrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aPNUvDP6ZJLWrjyEGUPDpfPBGZ39qJU1thy8o8dDZWnQhtM5PSC+q1hAGCl7SdGhv
	 4K8MiQrCMDp00814D6QBijqPQVSU06WSFHzAE1yU2/z8jY/CT5mOFnNNWppX6xdKhF
	 Xsu2tGP8cEnI9hYMo1x1sO/SKHDx56KGezixHaISmaZaYl9o+f4I2+R7kFu4JytzrT
	 leO11RfP0aI8NaDEzXK/fE2f4DvuD9c0491sjSaNiUTbDt43AmjGg+BOnI8zeaFkrL
	 omNZxxRWIAyVpj9usl0+uQJnpIqsuS8eeSMJNctV81QpeYGtUrcdEUGHRtiUpQn3Mp
	 yhWD2P/UOvc/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] cpufreq: qcom-nvmem: Add IPQ5210 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-cpufreq-v1-2-98656ad20ff3@oss.qualcomm.com>
References: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
 <20260701-cpufreq-v1-2-98656ad20ff3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 08:56:05 +0000
Message-Id: <20260701085606.33E6E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the function `qc=
om_cpufreq_kryo_name_version()` triggers a kernel `BUG()` panic when the SM=
EM SoC ID is not recognized, rather than gracefully failing.
--

commit efa443e3ef471a943647c359a1a0b9da9950bda0
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

cpufreq: qcom-nvmem: Add IPQ5210 support

IPQ5210 SoCs expose CPU frequency limits through an eFuse speed bin, and
the valid CPU OPPs depend on the SoC variant. This patch adds IPQ5210
support to the Qualcomm NVMEM cpufreq driver and blocks the generic
cpufreq-dt platform device.

[ ... ]

> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-=
cpufreq-nvmem.c
> index e6d28d162442a..b2aeda7c564a9 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -200,6 +200,13 @@ static int qcom_cpufreq_kryo_name_version(struct dev=
ice *cpu_dev,
>  	case QCOM_ID_IPQ9574:
>  		drv->versions =3D 1 << (unsigned int)(*speedbin);
>  		break;
> +	case QCOM_ID_IPQ5200:
> +	case QCOM_ID_IPQ5210:
> +	case QCOM_ID_QCF2200:
> +	case QCOM_ID_QCF3200:
> +	case QCOM_ID_QCF3210:
> +		drv->versions =3D (*speedbin !=3D 0xcd) ? BIT(0) : BIT(1);
> +		break;

[Severity: High]
This is a pre-existing issue, but should the default case for this switch
statement continue to use BUG() when an unhandled msm_id is encountered?

If a device tree successfully matches the driver, but the SMEM SoC ID
returned by qcom_smem_get_soc_id() is unexpected (such as from a mismatched
device tree, firmware issue, or prototype hardware),
qcom_cpufreq_kryo_name_version() will hit the default case:

        default:
                BUG();
                break;

Would it be safer to return an error code like -ENODEV here instead of
triggering an immediate kernel panic during device probe?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-cpufreq-v1=
-0-98656ad20ff3@oss.qualcomm.com?part=3D2
