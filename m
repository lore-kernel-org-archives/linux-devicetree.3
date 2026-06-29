Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B7429D281
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782708273; cv=none; b=gLa9fLkMrz+l3jRpqstMlqPhMtve66Cn6y1Fu8Ki3BbbQrJG7dMKrH2Z+7+uUcq8ZYuO3rlyIw1P2/diCdYA7LeBs7y1UxbvhokGRq0ZodeTRWYkQSlOw/eaEKeSwHeOpeX6NA+N9epw4tyfaKz65J5Kv2bTVJDCoHyC4mCqVLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782708273; c=relaxed/simple;
	bh=6PvtN94zd6v2QYXkcFtiM4k8XUa6Tv6eMZD0RkYJPwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lnj8Y7+zzfMdAFu76Ng6y3v2+ndUrKcPUmDK6UFmWXTiYGIMQP35ylIJmDXWf2jeQgIhi+6/diSzQsTu+0wwDqYdc/KBfbbelgkqj+FsgaQqbm/qLCEIENyUcKEtyUSJHzhbDs+SCtaLGH1izKFpzJI2Grce4oXn8iJjmTNxqvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VN0AVfVA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VN0AVfVA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A671F000E9;
	Mon, 29 Jun 2026 04:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782708272;
	bh=ROufw8ROoukTdeJk0uuzNHCuk6uDfBQAs7p2AtJqDhQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VN0AVfVAQEzMqAV79/FrPFRcBSwPn1sLk2++b/XXRTE7Q+XtGQ0Lrhn15WIm9TeD8
	 1/HdA6iSHtVruO0d1Ptasf1KYfKgbT/A8AkNx32NX0qm3B99SPcdZ9FW6NEVZWwo+X
	 /AZTnSBwie40lkGcOqYFuP1PU7sII+VoWxcMeKxRoukwSc59vTVoFJ+r6IHRXSny8N
	 NLxZCeMmBniV5xujSkTGeIdK3Sg4vLJNVd40J0afyHgGMNEXI3hsd866UEw8F4XzR0
	 irR92uj8RMk3P4ewWLEdwQul18aDisFoyJSCglCZ3fVUtunnJMPYEa+qJHTJs09uKx
	 NWK86ts8Rx1mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
 <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 04:44:31 +0000
Message-Id: <20260629044432.34A671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The struct `ipq5210_pll_data` is missing the `const` modifier.
--

commit 4658d262070dd0e2697e2fa6367ab1728d04bbf2
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

clk: qcom: apss-ipq-pll: Add IPQ5210 support

The Application Processor Subsystem on the IPQ5210 platform sources
its clock from the Huayra PLL. Add the configuration data necessary
to set it up.

> diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-=
pll.c
> index 3a8987fe7008a..569ac76c75dc3 100644
> --- a/drivers/clk/qcom/apss-ipq-pll.c
> +++ b/drivers/clk/qcom/apss-ipq-pll.c
[ ... ]
> @@ -140,6 +152,12 @@ static const struct apss_pll_data ipq5018_pll_data =
=3D {
>  	.pll_config =3D &ipq5018_pll_config,
>  };
> =20
> +static struct apss_pll_data ipq5210_pll_data =3D {

[Severity: Low]
This isn't a bug, but is it intentional that ipq5210_pll_data is missing
the const modifier here?

The other apss_pll_data structures (like ipq5018_pll_data and
ipq5332_pll_data) are declared as const, which allows them to be placed
in the read-only .rodata section.

> +	.pll_type =3D CLK_ALPHA_PLL_TYPE_HUAYRA,
> +	.pll =3D &ipq_pll_huayra,
> +	.pll_config =3D &ipq5210_pll_config,
> +};
> +
>  static const struct apss_pll_data ipq5332_pll_data =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-apss-clk-v=
1-0-8c92fe118ce4@oss.qualcomm.com?part=3D2
