Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C66A2EDD78
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786868190; cv=none; b=eR0pT6v16ZFJb2VxvgUxJpVI4amOUVzulqVLoXIOFgdXm3CrJuFXXr/Lh/zdrYnRosaecflnxeZC/26+PHIGBCleCVmpx5je+v2Zsj7ThaXrF1LeDuDYgmhMeRB+SMnpEA679/HKzmQNCLuDBo9PpKhd9MAckHAzs1HofbaJNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786868190; c=relaxed/simple;
	bh=2F+DHzLLCrRHnlwRNUAW+nryjRhkdR8jzMLs81B3URE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PJfO8TyGg83tISsiI30SV84ppgROCSaK4GGaQTUQ3uYTI/Od1/422eKdtCq4U7BPSo0sDpVa5UWjmedWeK7XpF4P4Q+oDqpeFI2zHkTAwme4hZVKLWXskcSxbAfDLcJwPcMtOCA1wqEtw8k3EG7wUOo+6xg+nGfnk0duiU5UmqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXIia7ma; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXIia7ma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726201F000E9;
	Sun, 16 Aug 2026 08:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786868188;
	bh=2xfkqaxvwqaYRMjjcENB0IqysT6sYocQ/hgbksD1t4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XXIia7maXSorwSz7Y8NX4iNJs+3/gd/8nXzIhoGa3CEobyLb5x6Na/5es420+EkWI
	 /+MCpM6NVPQUs4wLDyVxvW8rgEUnRUQtlJCTlq12EXt/+iXjK0NyYqixp8VxNF8Fu3
	 go6zhYPf++XdzeZoXsr/aMDQhIt4yY9vaQrUSMxFYAk+qdnSttRmLKYldHPaZ/XoER
	 8FBCftfgKV5o5c7qg/9O+T1zReW63wDipfx4JctIL379M/TTmG62nK/EW264FctfrQ
	 swVSr7TnIvg+ajJoFeeBmwoeGSpvTg9ugvgUOOvphfWtouI86OjTmV/b9dQcaTG1X8
	 tiOyIEfnBjATQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: socinfo: Add SM7250 SoC ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816081213.5495-2-sreeshankar0910@gmail.com>
References: <20260816081213.5495-1-sreeshankar0910@gmail.com>
 <20260816081213.5495-2-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 08:16:27 +0000
Message-Id: <20260816081628.726201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit introduces a compilation failure because the macro `QCOM=
_ID_SM7250` is undeclared. The macro `qcom_board_id(SM7250)` expands to `QC=
OM_ID_SM7250`, which is not defined in `include/dt-bindings/arm/qcom,ids.h`=
 or anywhere else in the tree.
--

--- Patch [1]: [PATCH 1/2] soc: qcom: socinfo: Add SM7250 SoC ID ---
commit 8ca1fecd3b445847ec519f60e57b6e9de9904c54
Author: Sreeshankar K <sreeshankar0910@gmail.com>

soc: qcom: socinfo: Add SM7250 SoC ID

This commit adds the SoC ID for the Qualcomm SM7250 SoC to the socinfo driv=
er.

> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index af418adad7aaf..54b1f8e1b9359 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -449,6 +449,7 @@ static const struct soc_id soc_id[] =3D {
>  	{ qcom_board_id(IPQ8172) },
>  	{ qcom_board_id(IPQ8173) },
>  	{ qcom_board_id(IPQ8174) },
> +	{ qcom_board_id(SM7250) },

[Severity: Low]
Does this cause a compilation failure? The qcom_board_id(SM7250) macro
expands to QCOM_ID_SM7250, but it appears that QCOM_ID_SM7250 is not defined
in include/dt-bindings/arm/qcom,ids.h or anywhere else in the tree.

>  	{ qcom_board_id(IPQ6018) },
>  	{ qcom_board_id(IPQ6028) },
>  	{ qcom_board_id(SDM429W) },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816081213.5495=
-1-sreeshankar0910@gmail.com?part=3D1
