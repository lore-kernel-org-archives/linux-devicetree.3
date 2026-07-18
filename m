Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB28368D6E
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381012; cv=none; b=F4q1ykv8rxg3Y2ozEcxIM/VwZOkbXiHMFszCAW0RyonSzqsQQ2lg9tXNfMnVGHGkwIbObPJurYl3ZuXjaIkPyr69LGhcaCFkuOCFU0f675dYtCrDIIe61EKGqk6EFYLGTwqsDNKlJrJFq0Csx0WBMua1dm1n+ujKZBtHdGSp8ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381012; c=relaxed/simple;
	bh=NVRzGtPVKtx2/HzfrxRUumnqyCB2jHM4nULwAAlaovY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YQ0U9UJVPGjB6jeVlrAQ4TOStU74NZKz2i5ahfShKOjwc0BnitEJFNMkSbZFOirVle0WTkGl7Uql1fnSdfnICzHJp9bsDtO95urCiutqBvK7AKOcADHemwRzdX1gSK9etL27fmDcRu7AV1P2Kyvv8R3o3eDGUHMldbTY9FucGDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anc63M+E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anc63M+E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1EE1F000E9;
	Sat, 18 Jul 2026 13:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784381011;
	bh=eibk/l2ld/9JPyvcjN7nJkgiIuYvb0SKlBUtT/ChZSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=anc63M+E3ZOtl9hZlNS+N67YyZtw1ynp+xjJ9UC1R7IE6cjS0iWz1qWba5XfTPDHF
	 dmXfovfHH17FdtGb7fr5Fmq0WKDhklEBd8NI0XQAPFlfYqUE4FZUbkGw+L7mftNkWO
	 1XYT4ay2Kq1ENGaLfwKSgD0FKeZVtEjWa2GZZAfmwM59S1kjYaM7CPWiAz5gUcerNg
	 99BR4NgWkkchjlJksA1GjsQD9BYTYkcJQYZmB2ifsKXH7AfH+fI79/z5XyTyFKL141
	 fQcQePyPA7DcI7a4jr1cjR0XteWm637OO+L11gkpOgZAWIso5AW0pz9LMituDXZa5p
	 /Uf5MYi1Jxn7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/16] clk: qcom: gcc-qcm2290: Keep the critical
 clocks always-on from probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-2-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
 <20260718-shikra-dispcc-gpucc-v6-2-62703e05ef0f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 13:23:30 +0000
Message-Id: <20260718132330.EE1EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Placing a voting register in the clk_cbcrs array misuses the CBCR A=
PI and introduces a fragile pattern.
--

--- Patch [2]: [PATCH v6 02/16] clk: qcom: gcc-qcm2290: Keep the critical c=
locks always-on from probe ---
commit d7a7b99958c3ce75a0a25d8faec4383b5f406ac6
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: gcc-qcm2290: Keep the critical clocks always-on from probe

This commit drops the modeling of certain always-on QCM2290 GCC branch cloc=
ks
and instead uses the .clk_cbcr convention to keep them enabled from probe.

> diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm229=
0.c
> --- a/drivers/clk/qcom/gcc-qcm2290.c
> +++ b/drivers/clk/qcom/gcc-qcm2290.c

[ ... ]

> @@ -2943,6 +2845,15 @@ static struct gdsc *gcc_qcm2290_gdscs[] =3D {
>  	[HLOS1_VOTE_MM_SNOC_MMU_TBU_NRT_GDSC] =3D &hlos1_vote_mm_snoc_mmu_tbu_n=
rt_gdsc,
>  };
> =20
> +static const u32 gcc_qcm2290_critical_cbcrs[] =3D {
> +	0x17008, /* GCC_CAMERA_AHB_CLK */
> +	0x17028, /* GCC_CAMERA_XO_CLK */
> +	0x1700c, /* GCC_DISP_AHB_CLK */
> +	0x1702c, /* GCC_DISP_XO_CLK */
> +	0x36004, /* GCC_GPU_CFG_AHB_CLK */
> +	0x79004, /* GCC_SYS_NOC_CPUSS_AHB_CLK */

[Severity: Low]
Does this code misuse the clk_cbcrs array? Register 0x79004 is a shared
voting register rather than a standard Clock Branch Control Register (CBCR).

Looking at how the API handles clk_cbcrs, the helper
qcom_branch_set_clk_en() unconditionally updates BIT(0) (the standard
CBCR enable bit).

While this functions correctly for GCC_SYS_NOC_CPUSS_AHB_CLK simply because
its voting mask happens to be exactly BIT(0), doesn't this introduce a
fragile pattern?

If this is copied for other voting clocks with different masks (such as
BIT(15)), won't it silently corrupt the voting register state and fail to
enable the intended clock?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-shikra-dis=
pcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com?part=3D2
