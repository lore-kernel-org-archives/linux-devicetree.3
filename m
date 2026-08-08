Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35BF2EB0F
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786214740; cv=none; b=V3Ye6ZCM3qVz1sQdXrPrsWp0mI98tQplb4cr5tP9mlZHsGRD3BcaDt9PuKb7DrDV8cgqJ44vIJ4Ju7B6stgXxkuqF5SuQRG8s6vqjLTajPRkimgtHMkO2EojUWmJsf1YW+ZoVGsCCvJ7i8Q+LwEDadjFgBhJHZqrvjit1iW6Qc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786214740; c=relaxed/simple;
	bh=v8vuZbH7MBMYklzixf4ulcQXfc8CX54gA+dXJFI3ZlE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S0X4mB/oAgAtbkTAgkBGpR8ma0gGM4v/inWpgu6r7fdR1MGj14dXIlH8/VL1klT9jYzFNw5nvBKyLXKIj3viT3Ifoo0uMyXoD5r+0aNLyHeQi4zOhbV0G/fLNdmGUrn/5yDbUiD89qdWS8Y5iMkSqqPoX4B7kQiN5PBnfADNFcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adKwgXZG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adKwgXZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6601F000E9;
	Sat,  8 Aug 2026 18:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786214739;
	bh=fWIXEONyzumnsO2T0fS63ruL98Qz1fOXY/ullml+Mi0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=adKwgXZGE/51yVo84UQVPGpTkZ8ewq9d/boOZJR8k9azGzQe6ApDFLZJC5mFHKeLL
	 Si+dX4a+wNE5VtH0nm93EzHA8QzY4RFfSrq7/7UvOB1iLxmNbbk9MfYZZtZTZYSw2e
	 7EHiPkFpmokKLMoVbxKlIK/lojp9bQe5alTiv49dYaTtqw+WqpfJBH9UI5qa3QBtEm
	 MFRg6/mVFiUMVgB7/KkqF+eQ+frzvC5d/bxDkqIIkrDRLOmFskwXmMxAiQdQnkq2Fy
	 GJA7qt1kX3+ffWmTLQnE4gTUpHpjoZs6Jye8cURX6cWqC5FR8o+xqQR/NSeJT+A5AK
	 1u7l4CzYhlhPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/5] ASoC: qcom: q6prm: Fix QAIF clock ID typo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260808181948.2489187-3-prasad.kumpatla@oss.qualcomm.com>
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 18:45:38 +0000
Message-Id: <20260808184539.3C6601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch series breaks `git bisect` by splitting a macro rename ac=
ross commits without retaining aliases, causing an intermediate build failu=
re.
--

--- Patch [2]: [PATCH v1 2/5] ASoC: qcom: q6prm: Fix QAIF clock ID typo ---
commit 2d0653a87462572279fa5b7912ec981aed567a40
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: q6prm: Fix QAIF clock ID typo

The Audio IF QAIF clock IDs were introduced with a "LAPSS" prefix instead
of "LPASS". This commit renames the definitions and updates their users
accordingly.

Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatl=
a@oss.qualcomm.com

> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q=
6prm-clocks.c
> index f613e2aee75e6..b4f9abbe02cb0 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -64,34 +64,34 @@ static const struct q6dsp_clk_init q6prm_clks[] =3D {
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
> -	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),

[Severity: Low]
Does this patch series break git bisect by splitting a macro rename across
commits?

While this regression is fixed in this commit, it appears the preceding
dt-bindings commit removes LAPSS_CLK_ID_QAIF_IF0_IBIT and related macros
from include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h.

Because q6prm_clks still references those removed macros at the preceding
dt-bindings commit, it causes an intermediate build failure when compiling
the kernel at that point.

Should the dt-bindings commit temporarily retain the old misspelled macros =
as
aliases until the driver is migrated, or should these changes be squashed?

> -	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808181948.2489=
187-1-prasad.kumpatla@oss.qualcomm.com?part=3D2
