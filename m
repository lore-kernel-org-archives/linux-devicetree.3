Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96CB486BA9
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525040; cv=none; b=V/Y55fA3Xd17zvYdO7gE3B6425ENDg/2xh9JhxJrhTub3pr4stBxLhUJZetFokubOndVAIcXsauImEp5RN9ylFq8pztYOqZ2u+GndWPniTYTDlFM9fbOgOXHiCzNJU8HAIh6WySmMXV2sqGULoC2Dackk05MWxhlTfV3yYxo8Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525040; c=relaxed/simple;
	bh=tIRQgyR7OY/Rx4lFJ5wmlxCqK7zA/XipJOmqFTm+HwY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fxJT8oiQwk3e67SSKlEwE972jo6WBknFQRgZZbBCiRcVV2K09ygckNLHG5xurDU+5bEzQMaPXXYA3234gmp83Dr8A/hjW/bvTnf72l7inqyFG2sJ34WVXKcl/L1OubAMLoLr3nZea1z2SnHbuqaq9iBZzyF3DJcCmKT4SDOSyEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/jD3ryb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/jD3ryb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BAC1F00A3D;
	Fri,  4 Sep 2026 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788525039;
	bh=0KLpUt6RBSt6HA1K32+nlER+g0eEEjUJpF5Z7xGqzWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k/jD3rybtoOvZYhiJOw37mZ56J39YK90LBwaTlc6xkQSk4yaDo9FPO+Hq/bTKF6Zx
	 5LmVpL50bvPLP0rT2VBc8ijNf+cxqglsiRNk8QBfTd/5QkAjJprEqeVhRcLXYmZGl/
	 ybADYniR4ac7U4EDiI+yf9UPon5jgS6itE6MuzCw71D6nijswr5PzDzPsOe2zDIdGD
	 gfduBWk2yfLV170JUFcO7+pkVR5FnUcehHAoICP/mzpephf/ust3qN8Tq+qpM49vkh
	 eb2Ufh285HgY9Y586RsdXD+F60LEYwpGm/df2wig+0yKewrbep5SYSVKvU5nmrYtEj
	 uof2iex1VdKRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muzaffer Kadir" <muzafferkadir@mainlining.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-msm8952-pinctrl-v3-2-110515fff513@mainlining.org>
References: <20260904-msm8952-pinctrl-v3-0-110515fff513@mainlining.org>
 <20260904-msm8952-pinctrl-v3-2-110515fff513@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:30:38 +0000
Message-Id: <20260904123039.00BAC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The `_groups` arrays for `qdss_tracedata_b` and `atest_combodac_=
to_gpio_native` list several GPIO pins that do not actually include these f=
unctions in their corresponding `PINGROUP` macro definitions.

Pre-existing issues:
- [High] Use-After-Free on pin function memory during driver unbind due to =
devres LIFO ordering.
--

commit e99bbcf6f4490c02c597eff9b2155619cf4f3564
Author: Muzaffer Kadir <muzafferkadir@mainlining.org>

pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

This commit adds the pinctrl, pinmux, pinconf, and gpiolib driver for the
Qualcomm TLMM block found on the MSM8952 platform. It defines the available
pins, their functions, and the pingroups for the SoC.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm8952.c b/drivers/pinctrl/qco=
m/pinctrl-msm8952.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-msm8952.c
[ ... ]
> +static const char *const qdss_tracedata_b_groups[] =3D {
> +	"gpio8",  "gpio9",  "gpio12", "gpio13", "gpio23", "gpio42",
> +	"gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio66",
> +	"gpio86", "gpio87", "gpio88", "gpio92",
> +};
[ ... ]
> +static const char *const atest_combodac_to_gpio_native_groups[] =3D {
> +	"gpio4",  "gpio12", "gpio13", "gpio20", "gpio21", "gpio28",  "gpio29",
> +	"gpio30", "gpio39", "gpio40", "gpio41", "gpio42", "gpio43",  "gpio44",
> +	"gpio45", "gpio46", "gpio47", "gpio48", "gpio67", "gpio115",
> +};
[ ... ]
> +static const struct msm_pingroup msm8952_groups[] =3D {
[ ... ]
> +	PINGROUP(8, blsp_spi3, blsp_uart3, sec_mi2s, pbs0, NA, NA, NA, NA, NA,
> +		 NA, NA, NA),

[Severity: Medium]
Will attempting to mux qdss_tracedata_b or atest_combodac_to_gpio_native on
some of these advertised pins fail at runtime?

The qdss_tracedata_b_groups array claims that qdss_tracedata_b can be
muxed on gpio8, gpio9, gpio12, and gpio13. Similarly,
atest_combodac_to_gpio_native_groups claims gpio12, gpio13, etc., support
it. However, looking at the hardware group definitions in msm8952_groups
(such as for gpio8), these functions appear to be missing.

If a device tree configuration requests these mux mappings, will it cause
msm_pinmux_set_mux to return -EINVAL because the requested function isn't
actually in the pin's function list?

[ ... ]
> +static int msm8952_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return msm_pinctrl_probe(pdev, &msm8952_pinctrl);
> +}

[Severity: High]
This is a pre-existing issue, but does calling msm_pinctrl_probe expose a
use-after-free regression during driver unbind?

Looking at msm_pinctrl_probe in drivers/pinctrl/qcom/pinctrl-msm.c:

msm_pinctrl_probe() {
    ...
    ret =3D devm_pinctrl_register_and_init(&pdev->dev, &pctrl->desc,
                                         pctrl, &pctrl->pctrl);
    ...
    for (i =3D 0; i < soc_data->nfunctions; i++) {
        func =3D &soc_data->functions[i];
        ret =3D pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
    ...
}

Because devm_kzalloc is used inside pinmux_generic_add_pinfunction, and
it is called after the pinctrl device is registered with devm, the devres L=
IFO
ordering means this memory will be freed before the pinctrl unregister acti=
on
runs.

If the device is unbound, and a user concurrently reads the debugfs
pinmux-functions file, could pinmux_generic_get_function_name dereference
the freed memory while the radix tree still holds pointers to it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-msm8952-pi=
nctrl-v3-0-110515fff513@mainlining.org?part=3D2
