Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE7D517BB2
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 16:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797922; cv=none; b=YOkDS02AO8azsSta1Y6gsL+utFhoNr9pP5P8Xc0GdAPVxAk0IXlwUsHPAr+9MvxK2fSmoue1PjtTuTHDSY4Dk/so+7wWo+GjZzBPcFVQpiLsJ9HPoZe4LFjteCaNesso22vRkhhMfvfBUSRMSv75BYNE8O0Yw8+yeSDUddke0NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797922; c=relaxed/simple;
	bh=yBeYraMh5F1WPqHnOerGq6Zw2LXzzfbJRnSYM86jOtE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o/NYHgcvyQlxOdoEs4tfH0Q4iiyPeF4uGmPTWsXYckw+mSnDunL2Vc6o4UIodxq7ZDuEWG6OgbAHzQ/+AXnoYWBljTAFCXCTdIKYCg0hm9kNyR1hyyO2wUBIhc/HcSBSuKZaopL6tDrixoaO9WRJ7pvMzOQS6ts2RrAMrdrEJ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8Yi+87j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8Yi+87j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FD01F00A3A;
	Mon,  7 Sep 2026 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788797918;
	bh=4I4j/mzdg9QEdSepOZjGFYR41+jBIFChpXsPmUEv4/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V8Yi+87jCeEvRQyN5fr7bnxg+6pbtucyPQfIftnArNtxYgDMLoeH5uHFP5wP4KOBq
	 ZsApg4oH/Qnb7Ftq4i/0q3R9qTTppSrD85HsXzrplHJ31mssKO39TyUqK6nK2HdZ/K
	 G37qf/s1J9AQ467W1degj65SycKiXBOHjuC9Qscc8GvlxL2wgbcQD6AcEtp+eQkz0J
	 MAIwHSQLXRLzCj2MCVRHis+dZGKfzEJBlmXQGphTF8q+d4mP0DfbSnwVTOA6sc54fx
	 My7Uj4fmeAp9XeMUfTDpNFzzZGfdKjGVswwhnt3GNDK8z5eKXGAsqEs8dsGBP5RcYS
	 D8mP+YIfC/ezQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muzaffer Kadir" <muzafferkadir@mainlining.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907-msm8952-pinctrl-v5-2-9a2d8d72ffdb@mainlining.org>
References: <20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org>
 <20260907-msm8952-pinctrl-v5-2-9a2d8d72ffdb@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 16:18:38 +0000
Message-Id: <20260907161838.92FD01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] SDC_PINGROUP macro uses -1 for 5-bit unsigned bitfields, causing P=
IN_CONFIG_LEVEL to inadvertently modify GPIO_0_CTL.

Pre-existing issues:
- [High] Missing bounds check on ACPI/DT provided gpios array allows out-of=
-bounds heap write in msm_gpio_init_valid_mask.
--

commit 092e7798eaa385b2192fd9af71a805996d90af7c
Author: Muzaffer Kadir <muzafferkadir@mainlining.org>

pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

This commit introduces the pinctrl, pinmux, pinconf, and gpiolib driver for
the Qualcomm TLMM block found on the MSM8952 platform.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm8952.c b/drivers/pinctrl/qco=
m/pinctrl-msm8952.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-msm8952.c
[ ... ]
> +#define SDC_PINGROUP(pg_name, ctl, pull, drv)                        \
> +	{                                                            \
> +		.grp =3D PINCTRL_PINGROUP(#pg_name, pg_name##_pins,    \
> +					ARRAY_SIZE(pg_name##_pins)), \
> +		.ctl_reg =3D ctl,                                      \
> +		.io_reg =3D 0,                                         \
> +		.intr_cfg_reg =3D 0,                                   \
> +		.intr_status_reg =3D 0,                                \
> +		.intr_target_reg =3D 0,                                \
> +		.mux_bit =3D -1,                                       \
> +		.pull_bit =3D pull,                                    \
> +		.drv_bit =3D drv,                                      \
> +		.oe_bit =3D -1,                                        \
> +		.in_bit =3D -1,                                        \
> +		.out_bit =3D -1,                                       \

[Severity: High]
Does this macro lead to cross-pin corruption? It assigns -1 to 5-bit
unsigned bitfields like oe_bit, in_bit, and out_bit, which silently
truncates them to 31.

If PIN_CONFIG_LEVEL is applied to an SDC pin (for example, via a device tree
output-high property), msm_config_group_set() in pinctrl-msm.c will use
BIT(g->out_bit) (which evaluates to bit 31) to read-modify-write g->io_reg.
Since io_reg is initialized to 0 for SDC pins, won't this end up
unintentionally modifying offset 0, which corresponds to the GPIO_0_CTL
register?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the related
pinctrl-msm.c core code, I noticed a potential bounds checking issue in
msm_gpio_init_valid_mask().

When device_property_read_u16_array() populates the tmp array with values
from ACPI/DT firmware:

drivers/pinctrl/qcom/pinctrl-msm.c:msm_gpio_init_valid_mask() {
        ...
        for (i =3D 0; i < len; i++)
                set_bit(tmp[i], valid_mask);
        ...
}

Does this loop have a bounds checking issue? The code doesn't appear to
validate each tmp[i] element against ngpios. If a malformed or malicious
device tree overlay provides a value greater than or equal to ngpios, won't
set_bit(tmp[i], valid_mask) perform an out-of-bounds heap write beyond the
valid_mask array allocation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-msm8952-pi=
nctrl-v5-0-9a2d8d72ffdb@mainlining.org?part=3D2
