Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD32034AB14
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146779; cv=none; b=dNe/ZAoaPGEnxPOK7gvkarjca7KqLAmwMroIxhoUAzipCsvp/WO4rQBR2rkOJ/Pnhct/7ksxwh05/dc/G3AO3KtdkBXtRWrTxwdO+Dd4SmM59yIC/rBhwGNGRbpT7i4Yct3zwWeghxNzTLjTjKUfT0YAZGYH73wBGkZiLkQPszw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146779; c=relaxed/simple;
	bh=RyvN0crqntjF6RsjxPNoCRphYzAQHeJFoHSWR1hvqCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mMGw+QMCuybYsmMuWV3LGsLkfH7ecVNDMvO0kR0w9rbh/SQhwT0ofm5ieRP5qZBNU9DpOP+rMsZQakbb+YTLM019hXMJ27xichDeCscvyZnh8FgV6N+CY0ktv0Yd7C8ghyDgNk3/C7op6cQv56RZk4FAW8hEllSA1Xc99ydhWFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4jHYmKh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4jHYmKh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17281F000FF;
	Wed, 23 Sep 2026 06:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790146778;
	bh=IebydkD7rCXNitBCv9vaRlhMyLT/jTELanfovB6j2HQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O4jHYmKhUBTD31vCDcb4QvVPU5CiNcbFVcRQ0f0MNa7IswLgJCx2G4U9lXRd3KGHi
	 zr6YK7ECZGd1d/hUETSZsLOBnDwa/+3t41WCKAUwNSHVUR8QLR40eQORwYdmxKf+4I
	 bsP/uVbkfCBP3sPW3wDlr3TQBgGcY5d1a6402AUNV48Wgi/qiYE6SbOdqNSpNwD3Wd
	 GbaHN+DyWWkN+B6igbI3KlB8QdJC9yspHwaWA3aFwOOeZMI5kiBSAQd8MhYcDf+ZUA
	 X3WWV6icaZEdzugWolu1Uq1UpQ9bgBlWOP4K6mtY2foKZ1pCCkFJBJdgzbkh88ybox
	 pzmV7fhLZe33A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/10] ASoC: qcom: Add QAIF shared data structures
 and variant interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-2-d5b6f056568e@oss.qualcomm.com>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-2-d5b6f056568e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 06:59:37 +0000
Message-Id: <20260923065937.D17281F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] build: undeclared AIF DAI identifiers cause build breakage
--

commit 7db49396552f308adb4bd0b64f488c2ce96b394b
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF shared data structures and variant interface

This commit introduces qaif.h to hold common definitions shared by the
QAIF CPU DAI and PCM platform drivers. It adds driver data structures,
AIF and CIF register-field descriptions, IRQ mapping helpers, and the
SoC variant descriptor.

> diff --git a/sound/soc/qcom/qaif.h b/sound/soc/qcom/qaif.h
> new file mode 100644
> index 0000000000000..ba02784771a25
> --- /dev/null
> +++ b/sound/soc/qcom/qaif.h
[ ... ]
> +static inline bool qaif_is_aif_mi2s_port(unsigned int dai_id)
> +{
> +	return (dai_id >=3D AIF_MI2S_RX_0 && dai_id <=3D AIF_MI2S_RX_12) ||
> +	       (dai_id >=3D AIF_MI2S_TX_0 && dai_id <=3D AIF_MI2S_TX_12);
> +}

[Severity: Low]
Are the AIF_MI2S_RX_0 and AIF_MI2S_TX_0 identifiers declared elsewhere in
this series? Because they are referenced inside a static inline function in
a header file, any source file including qaif.h will fail to compile with
an undeclared identifier error if these aren't already defined.

> +
> +static inline bool qaif_is_aif_tdm_port(unsigned int dai_id)
> +{
> +	return (dai_id >=3D AIF_TDM_RX_0 && dai_id <=3D AIF_TDM_RX_12) ||
> +	       (dai_id >=3D AIF_TDM_TX_0 && dai_id <=3D AIF_TDM_TX_12);
> +}

[Severity: Low]
Similarly, does this code rely on AIF_TDM_RX_0 and AIF_TDM_TX_0 being
defined prior to inclusion? This will cause immediate build failures for
consumers of this header that do not have those definitions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-b4-qaif-sh=
ikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com?part=3D2
