Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBCE3D4138
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507171; cv=none; b=ZX6KJtxT7gYElCcqoGl8i8dioDcBc+DZ02uvW7OhC4Z8oSt3zjyiX8KmckVPhAKx/fSZVMO7zCfTMe7Y4Tkv6TiNvhuqxvbw+ZnyQUTjywIG22UGm9QWhisq9jTydFqpAYvnp0JZh6AzS+QIeuAFRjFlpTinYlzkuYRI+t/YwPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507171; c=relaxed/simple;
	bh=XIzQxUjLoYr3fymLCCO7a7aBWHY5Crs1n4x4wtH45/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L0EHvu2wzOQErV7YrYrD7wUukmSd+9DNNP65BFgffX/KtvWHLyDH7plaTUKum+elL/eMWVV1gHg6EPMiTqAKFODbdy7k8i/JRh8j209zHV1ZDRnUJ3vQCZwza94QfSsyNa/kQBB35SbZM7hI9b1U65TXYurY02B+w/uH1aCFVVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpwX0MYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpwX0MYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470351F000E9;
	Wed,  8 Jul 2026 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507151;
	bh=TMOaDHhXOvJrWAOQG/myrYkoDv0qxtulznjZCE3SuZU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YpwX0MYs9I1RBX8esrG74pRtC7tmVmamx3kDGwj6hI0eJfxX0eglHBSmkJnCoMilt
	 6zXncNGjGo6RVZBsx5su5DevWt/uc0q6PjkMsNLSxmLcqH1s1ACfK3ApMtvUHIL/cV
	 utAYg9+D1ZxsPwFnr7Ux5vNB2X+hTRgHv4XzBZyG0LFfKoCcQIQZxlOHw3n4BET5yi
	 zkzUyD7Kd4wJjIElKqWky+q+3zkjGz05RqtmFkCAu3l33zC6ncvROSkyJrUsSaG77v
	 F4tav6zw22CL8GSHeoSDdadId4Ni20H7ZvUurQyeOyazd/Qlwr6ncZgAHGKIZnWZ12
	 A1u78qQHYf8Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF
 regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-tcsr_qref_0708-v8-5-62c42b5fa269@oss.qualcomm.com>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
 <20260708-tcsr_qref_0708-v8-5-62c42b5fa269@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 10:39:10 +0000
Message-Id: <20260708103911.470351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing QREF regulators for TCSR_USB4_1_CLKREF_EN clock in Mahua d=
escriptor table.
--

--- Patch [5]: [PATCH v8 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regu=
lator support ---
commit 1a2cccf8fe12339a5d989a6a9c397fb34f4adf6c
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator support

Mahua is based on Glymur but uses a different QREF topology, requiring
distinct regulator lists and clock descriptors for its PCIe clock
references. Add mahua-specific regulator arrays and clk descriptor table,
and use match_data to select the correct descriptor table per compatible
string at probe time.

> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-g=
lymur.c
> index e0b545258ba4c..1791e23739ed4 100644
> --- a/drivers/clk/qcom/tcsrcc-glymur.c
> +++ b/drivers/clk/qcom/tcsrcc-glymur.c

[ ... ]

> +static const struct qcom_clk_ref_desc * const tcsr_cc_mahua_clk_descs[] =
=3D {

[ ... ]

> +	[TCSR_USB3_1_CLKREF_EN] =3D &(const struct qcom_clk_ref_desc) {
> +		.name =3D "tcsr_usb3_1_clkref_en",
> +		.offset =3D 0x68,
> +		.regulator_names =3D mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators =3D ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB4_1_CLKREF_EN] =3D &(const struct qcom_clk_ref_desc) {
> +		.name =3D "tcsr_usb4_1_clkref_en",
> +		.offset =3D 0x44,
> +	},

[Severity: High]
Are regulators intentionally omitted for TCSR_USB4_1_CLKREF_EN in the Mahua
descriptor table?

If the USB PHY driver requests and enables this clock, the clock framework
will skip regulator voting because .num_regulators is 0. The clock enable
register bit will toggle, but the underlying QREF PHY block will remain
unpowered. On Qualcomm platforms, accessing unpowered PHY blocks typically
causes synchronous external aborts leading to a kernel panic.

In the Glymur configuration, this clock shared the tx0_rx5 regulators with
TCSR_PCIE_1_CLKREF_EN. In Mahua, PCIE_1 was removed but USB4_1 remains
without regulators. Should this include the appropriate regulator names and
num_regulators?

> +	[TCSR_USB4_2_CLKREF_EN] =3D &(const struct qcom_clk_ref_desc) {
> +		.name =3D "tcsr_usb4_2_clkref_en",
> +		.offset =3D 0x5c,
> +		.regulator_names =3D mahua_tcsr_tx1_rpt01_rx1_regulators,
> +		.num_regulators =3D ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-tcsr_qref_=
0708-v8-0-62c42b5fa269@oss.qualcomm.com?part=3D5
