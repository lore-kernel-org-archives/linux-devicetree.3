Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF6137C0FD
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083773; cv=none; b=EMW0ylKd4Cw0iQzznejkqZDsdahS/S9bDDX76FKEBK8pFRq2bOqKd8nuFhRg1qJwyKuMM3RSl30ndjZVW3FlKhtYuksR0JXVGPF7U2URg06/W7FKdAUlGVqpraDHUHzCmAE4cYzhsZGz5LFrqZvpAJlQrqliTeIcAQfpfRbh4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083773; c=relaxed/simple;
	bh=Y+ZbpH4CGll4roRmaIFQ97/HLEi/vEwhOVaAYnFO9aM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZzRr8YSDCxkTaaQKzdffZWWDIvuceM/Nd2NjNB0yFcveDEeX/5x/rrkIOntXa8hx4eB08zrSMEqK7LR4H7FW+Z75zac/uSn+UHAYBsW9oB4iQyEg23zYtQ9zPv2nY4N4pba4Z4oXfrHp1sFUPVZdWVEfJpOnA+yw/T/LldKx9i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TH6iBuJ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TH6iBuJ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A621F00A3D;
	Wed, 15 Jul 2026 02:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784083772;
	bh=YfNmx0+jpASs2ZhCzHjFfFC+fIcjATjY28vZyvYAbqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TH6iBuJ6Vz51MfmlpBACprw01vCpjC12pxI+fYQCqYLpJYIHOHL+lNUBlGLg3cRSz
	 HkiqiGs9uYV3bEzpq7aM39GJbGiViWB+z889kkJ659VA/ZMBuZBfUYwKTJV2tkw48i
	 Of5HaCs7EGhveAzhTsGViHuMt+reivofDNUAuF3+MOBPFLxlr1dIJrcd/4iZ3VILgD
	 1AedzqYk1tisd7+PHkPnyZi1IV8zjr6A46fhWhpAxc49pvINThur2MYs2TFSyi2gb4
	 KKa6DCZezjxZE13GnPEkE6Zbcq+dwX+TJyCVboViIGKD/Yrk9ka1S4ZnPf9vMQ4nwI
	 x4hLLpR9AB2Cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref
 helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-hamoa_tcsr_qref_0714_2-v1-2-13047922a376@oss.qualcomm.com>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
 <20260714-hamoa_tcsr_qref_0714_2-v1-2-13047922a376@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 02:49:31 +0000
Message-Id: <20260715024932.31A621F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch relies on an undeclared structure, an undeclared function=
, and a non-existent header file, which will cause a fatal build error.
--

--- Patch [2]: [PATCH 2/3] clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref h=
elper ---
commit c9be5146280c763b773fd80f0650fab3bbb0c928
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper

Replaces local clk_branch-based clkref definitions with descriptor-based
registration via qcom_clk_ref_probe(). This simplifies the driver to
focus on metadata and reuses common runtime logic.

> diff --git a/drivers/clk/qcom/tcsrcc-x1e80100.c b/drivers/clk/qcom/tcsrcc=
-x1e80100.c
> index 0b05c27b619b6..ad1f6be83a53e 100644
> --- a/drivers/clk/qcom/tcsrcc-x1e80100.c
> +++ b/drivers/clk/qcom/tcsrcc-x1e80100.c
> @@ -5,252 +5,141 @@
>   */
> =20
>  #include <linux/clk-provider.h>
> +#include <linux/clk/qcom.h>

[Severity: Low]
Does this header exist in the kernel tree? It appears that <linux/clk/qcom.=
h>
is missing, which will cause a fatal build error.

>  #include <linux/module.h>
> +#include <linux/of.h>

[ ... ]

> +static const struct regmap_config tcsr_cc_x1e80100_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits =3D 32,
> +	.max_register =3D 0x2f000,
> +	.fast_io =3D true,
> +};
> =20
> +static const struct qcom_clk_ref_desc * const tcsr_cc_x1e80100_clk_descs=
[] =3D {

[Severity: Low]
Since the header is missing, is struct qcom_clk_ref_desc defined anywhere?
This seems to also cause a build error.

> +	[TCSR_EDP_CLKREF_EN] =3D &(const struct qcom_clk_ref_desc) {
> +		.name =3D "tcsr_edp_clkref_en",

[ ... ]

>  static int tcsr_cc_x1e80100_probe(struct platform_device *pdev)
>  {
> -	return qcom_cc_probe(pdev, &tcsr_cc_x1e80100_desc);
> +	return qcom_clk_ref_probe(pdev, &tcsr_cc_x1e80100_regmap_config,
> +				  tcsr_cc_x1e80100_clk_descs,
> +				  ARRAY_SIZE(tcsr_cc_x1e80100_clk_descs));

[Severity: Low]
Is qcom_clk_ref_probe() declared elsewhere? It seems to be missing along wi=
th
the header and the struct definition. Should there be a prerequisite patch
introducing these helpers?

>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-hamoa_tcsr=
_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com?part=3D2
