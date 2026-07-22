Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63002336896
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700494; cv=none; b=tVii+6Y3fNdGOE7kQ87iziGZzNL8DVRZqM8NlpdZ5UprRANdx+wRVe2zXFpi5sKtMTE1J1oeQyYEc5I14m9G6LVIVVTD/B2FnSV7k2a8fYmbHrK7u+yAa/b6CvbhfxzdT24LAD2XvQb3vwqOGC3bPoazI6p/O4f2gPNAAp+2jmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700494; c=relaxed/simple;
	bh=rghLjy1q5h0k3BtBYHobWSiRQIgw7OVtzMUqFYmDx5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BmsBXT8o+EnrVEgq6Sb+3bA21WpBG8KvurFVnHK16Y/YnS2Q4d/7ncWdzkjHXAgR/YzzBnZVsuHi+CeuGkHwPIfsPWyksS470vZFAzlfb770eUx6L08btJ9Gqoag6u5Tcys9SIe5nB6RZb7Nj8BcCPw0NkXTln1NieDRSxPk1Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNYQMWF9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNYQMWF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC961F000E9;
	Wed, 22 Jul 2026 06:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784700493;
	bh=a2G5Hw6EJBTRUDP+gMpp8vhi3Li1t0bZC30pXtZCzNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YNYQMWF9azhMjX2NhBOR1Jz09wPTrgE+/W8UNr38Ffb1n9EFyMRGy4ZIkdGN7ndOR
	 7FzHDMf3+xAIZgFJdBkgLuvBmZc1u0mc11LkDqmBuDn9d8LAjh/QMSPs3XXHLEkM0L
	 E1PBeFmnr2zabNqAN4aj3H1C5N5tJmVXo+YFiani3yPEalf71uY8QvyQTO//oA99o+
	 sXIY1BkVVY/9SNdOyzCa2VVP8erGA2ed/T6KInGxTFCwYAG/+HoZLFsNMa7vdjU1Ah
	 kv2mf9JQQMbUqdFnBbA7roQbedU9teiECEdBVZpoUAlTgRjkueUrCuYQbbzgdJCDFP
	 XvPF0hq6aKyng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/7] clk: qcom: Add generic clkref_en support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-tcsr_qre_0721-v10-3-d2fa68c63b78@oss.qualcomm.com>
References: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
 <20260721-tcsr_qre_0721-v10-3-d2fa68c63b78@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 06:08:12 +0000
Message-Id: <20260722060812.EFC961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Bootloader-enabled clocks will cause unbalanced regulator disabl=
es when turned off by CCF's `clk_disable_unused()`.
- [Medium] qcom_clk_ref_probe forces exclusive memory region request, preve=
nting the advertised reuse for embedded registers like TLMM.
--

--- Patch [3]: [PATCH v10 3/7] clk: qcom: Add generic clkref_en support ---
commit 82b6746d145024db7b23e0d4f2834d4c7856b275
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

clk: qcom: Add generic clkref_en support

This patch introduces a generic clock driver for QREF clkref_en controls,
replacing branch clock semantics with a dedicated clock type. It adds
support for voting on regulators during prepare/unprepare and aims to
provide a common probe API reusable across different blocks like TCSR
and TLMM.

> diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
> new file mode 100644
> index 0000000000000..3efdf6749770d
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-ref.c
[ ... ]
> +static void qcom_clk_ref_unprepare(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk =3D to_qcom_clk_ref(hw);
> +
> +	if (rclk->desc.num_regulators)
> +		regulator_bulk_disable(rclk->desc.num_regulators, rclk->regulators);
> +}

[Severity: Medium]
Will this cause an unbalanced regulator disable if the clock was left on
by the bootloader?

During late init, the common clock framework's clk_disable_unused() routine
turns off unused clocks. If the clock is enabled in hardware (i.e. is_enabl=
ed()
returns true) but has no software users, CCF sets the prepare count to 1 and
then calls unprepare() to shut it down.

Since the software consumer never called prepare(), regulator_bulk_enable()
was never called during probe. When regulator_bulk_disable() executes with
a use count of 0, it triggers an unbalanced disable kernel warning and abor=
ts
the disable.

Should the driver check the hardware state during probe in
qcom_clk_ref_register() and enable the regulators if the clock is already
running?

[ ... ]
> +static int qcom_clk_ref_register(struct device *dev, struct regmap *regm=
ap,
> +				 struct qcom_clk_ref *clk_refs,
> +				 const struct qcom_clk_ref_desc * const *descs,
> +				 size_t num_clk_refs)
> +{
[ ... ]
> +int qcom_clk_ref_probe(struct platform_device *pdev,
> +		       const struct regmap_config *config,
> +		       const struct qcom_clk_ref_desc * const *descs,
> +		       size_t num_clk_refs)
> +{
> +	struct qcom_clk_ref_provider *provider;
> +	struct device *dev =3D &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);

[Severity: Medium]
The commit message explicitly states the intent to reuse this model for
clkref_en registers placed in the TLMM on SM8750. However, does this probe
function allow for that reuse?

devm_platform_ioremap_resource() claims exclusive ownership of the I/O
memory region. The QCOM TLMM pinctrl driver already explicitly requests its
memory region during probe. Any attempt to use qcom_clk_ref_probe() for
TLMM will fail with -EBUSY because Linux strictly forbids overlapping
top-level memory region requests.

Since qcom_clk_ref_register() is static, other drivers cannot bypass
qcom_clk_ref_probe() to pass their already-mapped regmap. Would it make
sense to export qcom_clk_ref_register(), or allow qcom_clk_ref_probe()
to accept a pre-initialized regmap so it can genuinely support embedded
registers like TLMM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-tcsr_qre_0=
721-v10-0-d2fa68c63b78@oss.qualcomm.com?part=3D3
