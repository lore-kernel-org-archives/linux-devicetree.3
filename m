Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A65C2E5B21
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784380237; cv=none; b=e+yWVG8nndMeVP+HZycwxZk3vPAPz+t/8IgoB2eD20oz1AXh27x6naDeNaCLFEg5baw4mS0KPpLLYh8retcJlh6NgRKBOBN2B6eaEu5txIXm2OiVnZRfBFmd/AOEBjvTIzyvGTOgS+Xe/jNDlW/JM43Nc3qUwi+p338nRVW0gaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784380237; c=relaxed/simple;
	bh=fPxEP+DDlwpytgcYa4EbK3Ouu3egGz4v5N53vvUrVxE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tN7+EKfSVCI9WPVK3/IL4GhWEaDCs4wenGdi8f8mwVAVehVWv9dQyo5Ps3lOr7OSEgdzyu0FVf1I7/l5ilzlBYkNkYf5EevmYmy2DPKwHtRhZwfb6jztDzACZL1y5PGMC+gbtjGSkIXPAuZDMszq+0mz8pIMIg62iCnQOpKoioc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4P3CfFr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4P3CfFr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F471F000E9;
	Sat, 18 Jul 2026 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784380236;
	bh=C2AqEqXBw9xzbKBzFkbcFcv64bmfGjKLMAW49IvTwbg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z4P3CfFrIcVNkGDJHTKo4HyV/vdiqhG3iVLAxN8NEXaO58MyAFymIeUigPhFxEKSs
	 dqayXvnSvHiTNrv2WjItloO7b28PJVqAwkSDD4wl5BirtFdJ+GBBcDNCH9sAUJBase
	 SGIkNfbDPdzz6aUPmUlaGiY7IVR+BGWUhlkRU+d4JoEaW9VSShK8umQQlTu9yZPfPv
	 ZltcY+8wVcaWVQzZwQOtdRAT4iQEpR9NWoopgf7EpuTVB/RZjKAvzjh+4jIhgJPKun
	 CMi4Y1WD5/znS9mnWUaNs3bAynGKc5lzX0vuq1Y3G+hXILOgLLKiv2iznYBLT5bFho
	 6xS34oyFe63Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/16] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-8-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
 <20260718-shikra-dispcc-gpucc-v6-8-62703e05ef0f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 13:10:35 +0000
Message-Id: <20260718131035.D9F471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe function unconditionally returns 0 on the error path and log=
s a misleading copy-paste error message.
--

--- Patch [8]: [PATCH v6 08/16] clk: qcom: gpucc-qcm2290: Drop pm_clk handl=
ing ---
commit 01c8b0bd5cb4f5e13257da3723ae92aece05f86d
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: gpucc-qcm2290: Drop pm_clk handling

This commit drops the pm_clk handling from the QCM2290 GPUCC driver since t=
he
required GCC AHB clocks are kept always enabled by the GCC driver during pr=
obe.

> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qc=
m2290.c
> index 4e97a02d942ad..f14b4620090ef 100644
> --- a/drivers/clk/qcom/gpucc-qcm2290.c
> +++ b/drivers/clk/qcom/gpucc-qcm2290.c
[ ... ]
> @@ -385,16 +384,6 @@ static int gpu_cc_qcm2290_probe(struct platform_devi=
ce *pdev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D devm_pm_clk_create(&pdev->dev);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D pm_clk_add(&pdev->dev, NULL);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to acquire ahb clock\n");
> -		return ret;
> -	}
> -
>  	ret =3D pm_runtime_resume_and_get(&pdev->dev);
>  	if (ret)
>  		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this functio=
n,
I noticed an issue further down in gpu_cc_qcm2290_probe():

	ret =3D qcom_cc_really_probe(&pdev->dev, &gpu_cc_qcm2290_desc, regmap);
	if (ret) {
		dev_err(&pdev->dev, "Failed to register display clock controller\n");
		goto out_pm_runtime_put;
	}

out_pm_runtime_put:
	pm_runtime_put_sync(&pdev->dev);

	return 0;

Should the error path propagate ret instead of unconditionally returning 0?
This appears to silently ignore probe failures from qcom_cc_really_probe(),
which could leave the system in an inconsistent state.

Additionally, is the "display clock controller" mentioned in the error mess=
age
a copy-paste error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-shikra-dis=
pcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com?part=3D8
