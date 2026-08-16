Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B01F2B88
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 13:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786888731; cv=none; b=TXxi/3hHJ0B1i29VViLUXk1/v82EI/Y/AHvqGYoIbNQlKglu+1vMUCsF+3yU7E9RRqlgf8Z3SQz5jQ2O40EhKPYyWDWHzT6rUULfk8CDtEujyqQdvJJXlkO16G7CrdbyKMO9KDtW6DqfExobyWcTumsBDFPDzQHFCzs07V8d8hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786888731; c=relaxed/simple;
	bh=XRaM0HsN5gEL590SzG4FKa4qCk7XTIXVzBPW+Y2Qha8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=miRuNZwdjqTsSbIz9Y7AzeM6hun1lO2/EY7BzqPKMjmNEGocRvP79wEoTHvZo/IvPmkkjpL7YAzmUdEaFaqowntkCfHt7j38UQKCOUoK1jtlL9tjbS1EjH+H0sN3MG0AQSMW/TEddoX8XA/wJRLMwOJJ6C1nxRSu4BE+pKw4Lr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuJKZ1Oh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuJKZ1Oh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784FB1F000E9;
	Sun, 16 Aug 2026 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786888729;
	bh=0rEiAVgrd+pV1Kad7lGMkfaXPfaH49nIvWIbU+boBNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LuJKZ1OhURodKw6OwFc1ET0QCWbKM3c6NiX3JfOSYWZNUaKofGzipkkpdHApbbqfS
	 JleseqSm7fhi52xCC2nPOcCTLhA2v4e6qkO6/c2jzxxfqkrjap2/YP5See+a6DBVcf
	 ngpEPvoHRhlj95OjgnWV6fJ/c0fM4BPv35m3S327RrD7K2aihlOmLcwN8NP57WMgXX
	 9ZNIzY8uEAV2wBInXJdlOxlNnEzXPRAvV23vhPvQ3jSSChhduqY/1Bqz2m7QneiBrA
	 ZAT1TeV+VB5GkWdg9csPDyyGIaGfyrhrv8MYY3TaBKpV6+gxJ9ggiyY7oR4/K+i7k4
	 y8Da0E/Zqf8ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muzaffer Kadir" <muzafferkadir@mainlining.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816-msm8952-pinctrl-v1-2-a7272bcd2187@mainlining.org>
References: <20260816-msm8952-pinctrl-v1-0-a7272bcd2187@mainlining.org>
 <20260816-msm8952-pinctrl-v1-2-a7272bcd2187@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 13:58:49 +0000
Message-Id: <20260816135849.784FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Mismatch between pin group function lists (`*_groups`) and `PING=
ROUP` definitions.
- [Low] The Kconfig symbol PINCTRL_MSM8952 lacks `depends on ARM64 || COMPI=
LE_TEST`.
- [Low] The macro expansion for `MSM_PIN_FUNCTION(NA)` relies on an undecla=
red `NA_groups` array.
--

--- Patch [2]: [PATCH 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver -=
--
commit 58f7f872112151d63645301862bbc088eef619bb
Author: Muzaffer Kadir <muzafferkadir@mainlining.org>
pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

This commit adds the pinctrl, pinmux, pinconf, and gpiolib driver for
the Qualcomm TLMM block found on the Qualcomm MSM8952 platform.

> diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kcon=
fig.msm
> index 9409e678ec6dc..8b631e641e161 100644
> --- a/drivers/pinctrl/qcom/Kconfig.msm
> +++ b/drivers/pinctrl/qcom/Kconfig.msm
> @@ -222,6 +222,12 @@ config PINCTRL_MSM8917
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found on the Qualcomm MSM8917, MSM8937 platform.
> =20
> +config PINCTRL_MSM8952
> +	tristate "Qualcomm 8952 pin controller driver"

[Severity: Low]
Should this Kconfig entry include a dependency on ARM64 || COMPILE_TEST?

Omitting it might expose the driver to build systems for unsupported
architectures.

> +	help
> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> +	  Qualcomm TLMM block found on the Qualcomm MSM8952 platform.
> +

[ ... ]

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm8952.c b/drivers/pinctrl/qco=
m/pinctrl-msm8952.c
> new file mode 100644
> index 0000000000000..b21d035fc5042
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-msm8952.c

[ ... ]

> +static const char *const qdss_tracedata_b_groups[] =3D {
> +	"gpio8",  "gpio9",  "gpio12", "gpio13", "gpio23", "gpio42",
> +	"gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio66",
> +	"gpio86", "gpio87", "gpio88", "gpio92",
> +};

[Severity: Medium]
Are some of these GPIOs disconnected from the actual PINGROUP function
assignments?

If a device tree requests a function listed in a group array like this one
but the function is not supported by the actual PINGROUP definition, could
msm_pinmux_set_mux() fail to find the function, trigger a WARN_ON, and fail
with -EINVAL?

[ ... ]

> +static const char *const atest_combodac_to_gpio_native_groups[] =3D {
> +	"gpio4",  "gpio12", "gpio13", "gpio20", "gpio21", "gpio28",  "gpio29",
> +	"gpio30", "gpio39", "gpio40", "gpio41", "gpio42", "gpio43",  "gpio44",
> +	"gpio45", "gpio46", "gpio47", "gpio48", "gpio67", "gpio115",
> +};

[Severity: Medium]
Similarly, is there a mismatch between this function list and the PINGROUP
definitions?

[ ... ]

> +static const struct pinfunction msm8952_functions[] =3D {

[ ... ]

> +	MSM_PIN_FUNCTION(atest_char),
> +	MSM_PIN_FUNCTION(atest_tsens),
> +	MSM_PIN_FUNCTION(bimc_dte1),
> +	MSM_PIN_FUNCTION(NA),

[Severity: Low]
Will this fail to compile?

The macro expansion for MSM_PIN_FUNCTION(NA) appears to rely on an NA_groups
array, which does not seem to be declared anywhere in the file.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-msm8952-pi=
nctrl-v1-0-a7272bcd2187@mainlining.org?part=3D2
