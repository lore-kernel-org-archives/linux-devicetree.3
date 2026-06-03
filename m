Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069B3E9C26
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 18:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780513004; cv=none; b=ZcOmD08tr8nL3+iWIWKw8SyNv5Uvs8nQnQYQvq25nHuHNVESeCMcXmhugFbRWKftpYQpafAAa/H6Qk5M8EjekreV0noXGOii+XaNv5KXCD8E2o4/SQSKG2DWYrXslQ5+xm1sQbS1fF1qH056W+afXLq39qYsa65LssA9k240BCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780513004; c=relaxed/simple;
	bh=/14hhAEKWOj5rTJ+hWK6yi5AOGJE+wUmVieDkD0aOWU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ipuyo/zMNaKLwEqoTy0i6Bz+SzKj03picltifYr9o9Wzxx3q5gkrJp5UWoZnygoc5GCAB7b0b7Y4SsArxB4Dh7r5KWlrdqko2pk5FjjhMAhFYEj0DFx5/94FbsEzvzgaiLOujFXeGMQA+B4C2V2ReqA74sQdcOsgA1J0+kZqIK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+V7ixTf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+V7ixTf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF071F00898;
	Wed,  3 Jun 2026 18:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780513002;
	bh=cMH4ExdSAyi6+ZCK6Oter8fKY0BnUbbAPl/WjtJtsEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H+V7ixTf0favny+/FMtGd/Jk2WgVzYkHCQFt59R2QNDHSiqGNVEbqtJaOzTY1s/pn
	 x9BEBS2Rva3E8JYcQg+Iu3RuPlq17AZ0I2JYJeUNmhGJSj0tNnTDgY+n5c0FbHCloM
	 WmbykJCV2C3oamQ1XmAJuV9fESiKY75PbU5QCxsLrDLzdMN/i2XLzMvdnNYqd9sR7K
	 KD/Wt+1fosB0TNjv5qQShi5aP7Vrwpt/Z70wrTOkKmr1n5EHf3DCIw5DnAAKjEYQjN
	 R2fIC3chIGoLuYGBaMHFdt4n0mqSIGTpJ9QZcccqVNGY16YNQWngD0bnh3zf8ESpMn
	 cUpFJHVMMe3uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: add MSM8x60 NoC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603163410.2312712-3-github.com@herrie.org>
References: <20260603163410.2312712-3-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 18:56:42 +0000
Message-Id: <20260603185642.9AF071F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Double/Triple counting of bandwidth leads to artificially inflated=
 clock rates.
- [Low] Kconfig dependency allows built-in driver to reference module symbo=
ls, causing linker errors.
- [Low] The name field in struct msm8660_icc_node is incorrectly typed as u=
nsigned char * instead of const char *.
--

commit 55dcd848add92308b8d692adbadfc253e5ad283f
Author: Herman van Hazendonk <github.com@herrie.org>

interconnect: qcom: add MSM8x60 NoC driver

Add a Qualcomm interconnect driver for the MSM8x60 family modelling the
four NoC fabrics (APPSS, System, MMSS, DFAB) that connect masters and
slaves on these Scorpion-class SoCs.

> diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qco=
m/Kconfig
> --- a/drivers/interconnect/qcom/Kconfig
> +++ b/drivers/interconnect/qcom/Kconfig
[ ... ]
> +config INTERCONNECT_QCOM_MSM8660
> +	# bool, not tristate: this provider must be registered at
> +	# core_initcall to be ready before icc_init (subsys_initcall) walks
> +	# devicetree consumers; a loadable module cannot satisfy that
> +	# ordering. Build-in only.
> +	bool "Qualcomm MSM8x60 interconnect driver"
> +	depends on INTERCONNECT_QCOM=3Dy
> +	depends on MFD_QCOM_RPM

[Severity: Low]
Does this allow the driver to be built-in while MFD_QCOM_RPM is a module?

Since INTERCONNECT_QCOM_MSM8660 is a bool symbol, depending on MFD_QCOM_RPM
without =3Dy means this can be selected as =3Dy even if MFD_QCOM_RPM=3Dm. T=
his
would result in undefined reference linker errors for qcom_rpm_write.

> diff --git a/drivers/interconnect/qcom/msm8660.c b/drivers/interconnect/q=
com/msm8660.c
> --- /dev/null
> +++ b/drivers/interconnect/qcom/msm8660.c
[ ... ]
> +struct msm8660_icc_node {
> +	unsigned char *name;

[Severity: Low]
This isn't a bug, but should name be a const char * rather than unsigned
char *?

Initializing this with string literals (via the DEFINE_QNODE macro) and
assigning it to node->name (which expects const char *) results in compiler
warnings about pointer type mismatches.

[ ... ]
> +static int msm8660_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct msm8660_icc_node *src_qn;
> +	struct msm8660_icc_provider *qp;
> +	u64 sum_bw, max_peak_bw, rate;
> +	u32 agg_avg =3D 0, agg_peak =3D 0;
> +	struct icc_provider *provider;
> +	struct icc_node *n;
> +	int ret, i;
> +
> +	src_qn =3D src->data;
> +	provider =3D src->provider;
> +	qp =3D to_msm8660_icc_provider(provider);
> +
> +	list_for_each_entry(n, &provider->nodes, node_list)
> +		provider->aggregate(n, 0, n->avg_bw, n->peak_bw,
> +				    &agg_avg, &agg_peak);

[Severity: High]
Does this loop result in double counting the requested bandwidth?

Because an interconnect path traverses multiple nodes (e.g., a master and a
slave) and the framework applies the requested bandwidth to all nodes along
the path, summing all nodes in the provider means the same traffic is count=
ed
multiple times.

This artificially inflates the computed clock rate, which could cause
clk_set_rate() to fail or unnecessarily waste power.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603163410.2312=
712-1-github.com@herrie.org?part=3D2
