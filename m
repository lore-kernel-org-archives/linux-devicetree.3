Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F9130E821
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527583; cv=none; b=ScpCD8bMOhDc8LUuLIJpzFPVk0z6rO5UyCbIoaFuxZhWUku2RWfiut/ee4wn+PYmYJUyI+IjmVXT3lzvwWnsnaZMZnprZ+6z4er+lDRYOP3oSPJzonvdr0REGcn1oTkXy9k6aUeiFdRLLB4EBixjBCXMPijnG3Ww3WG2iguNfVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527583; c=relaxed/simple;
	bh=Od81Ui+At/4I8Pmzjv7juLWWEVJtL/SNrnk67FIEUWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iNadDEskDO1/KPBcBz2oqcmtcvyn079IH7rlME0gzp7NLJz22Hg/XRzY3flDMcSrYcAPo7v9gRUJ4nckBd86WP4z7oIE1hH2nTKhwZ6xsChk6QMragc/da3ueQW/Ub2wkZC50RQiXe8lQFdSGJfgWH2y8CAEoeTc/pYJFGwbSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8X16+T1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8X16+T1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FB71F00A3D;
	Fri,  4 Sep 2026 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788527582;
	bh=/yHiBuhwtvQs9PtlgKoPGdZLMLmOKjP1scj7DIwBIyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N8X16+T1ojA2mWCyCkdS7Txeq2+lYXkXk40Eulb1wHcbETpHu7cct83vpqlc9jOLs
	 0U8eIBf9onA5uvZNMHhMKhs2CcWGnat3YRtlURnI0c/z0UFvxbxz+SmnJ+M0csc3hd
	 3jkSlP1KN/Uv2nrooNeXAQk90F05JL+nYa8wdBUFWhrsO55vZKNNpBr3F+LXAkb1/b
	 bteBaVVVhexCedIhT4LZStpJT0nPpZimrtqOXn8wabhFQ4inkVExo4J/ZhVf9BagSz
	 cA62kB+ObTp58q41FgEp9BFwhvXRjxveiiEhj/QH0IvkFtsuh50vV791iDU5Z430p8
	 aPIlzLDwxXsdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muzaffer Kadir" <muzafferkadir@mainlining.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:13:01 +0000
Message-Id: <20260904131301.B1FB71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between function group definitions and hardware PINGROU=
P mux configurations, causing a WARN_ON and failure in msm_pinmux_set_mux().
--

commit bc142a6010c2c544a89b4c8ddff3446518100a52
Author: Muzaffer Kadir <muzafferkadir@mainlining.org>

pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

This commit introduces the new MSM8952 pinctrl driver to support the
Qualcomm TLMM block found on the MSM8952 platform.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm8952.c b/drivers/pinctrl/qco=
m/pinctrl-msm8952.c
> new file mode 100644
> index 0000000000000..c24f75641719d
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-msm8952.c
[ ... ]
> +static const char *const qdss_tracedata_b_groups[] =3D {
> +	"gpio8",  "gpio9",  "gpio12", "gpio13", "gpio23", "gpio42",
> +	"gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio66",
> +	"gpio86", "gpio87", "gpio88", "gpio92",
> +};

[Severity: Medium]
Does the hardware configuration actually support qdss_tracedata_b on gpio8,
gpio9, gpio12, and gpio13? I noticed this array advertises support on these
pins, but their corresponding PINGROUP definitions below do not appear to
include this function.

[ ... ]
> +static const char *const atest_combodac_to_gpio_native_groups[] =3D {
> +	"gpio4",  "gpio12", "gpio13", "gpio20", "gpio21", "gpio28",  "gpio29",
> +	"gpio30", "gpio39", "gpio40", "gpio41", "gpio42", "gpio43",  "gpio44",
> +	"gpio45", "gpio46", "gpio47", "gpio48", "gpio67", "gpio115",
> +};

[Severity: Medium]
Similarly, does atest_combodac_to_gpio_native support routing to gpio12,
gpio13, gpio20, gpio21, gpio29, gpio30, and gpio41? This array lists them as
valid groups, but their PINGROUP declarations omit the function.

[ ... ]
> +static const struct msm_pingroup msm8952_groups[] =3D {
[ ... ]
> +	PINGROUP(8, blsp_spi3, blsp_uart3, sec_mi2s, pbs0, NA, NA, NA, NA, NA,
> +		 NA, NA, NA),

[Severity: Medium]
If the device tree or a built-in driver requests a function like
qdss_tracedata_b on gpio8 (which is advertised in the groups array but miss=
ing
from these PINGROUP macros), will this mismatch cause msm_pinmux_set_mux() =
to
exhaust its function list?

It looks like this would unconditionally trigger a WARN_ON during mux setup,
returning -EINVAL and aborting the device probe for the requesting device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-msm8952-pi=
nctrl-v4-0-671475ed1397@mainlining.org?part=3D2
