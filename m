Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4552EA172
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 03:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779937541; cv=none; b=YyuvE01lURYbDlr77T+Mh1g472eZR/zCTfVBOMyPKZV7eeTPg6QnqFbb+Yct5h9BP7Nbrsuxr1Bq1CG0K+k95pKXVWbf7WDkyd9ifBtVGKXnzLDv66zBVCr48WTP6EXctBMwaVs3LjDwhXiQPTvWPMyJa3q3EbXW0C886trb5DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779937541; c=relaxed/simple;
	bh=wUAgDcA79XpaI7TfoBSVJfV6vpqvmzDxXtJ2DwcAbEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HfdAYUM+fZFuDYLbr+xm1hs3TFWlD423XI0pbx3kdTSM9sANskuDM8aHaTgK76OZ17qVsWM9m4YABese8AbU8BqjEZEY3MwuTGuNDRB9G4iAhI8LBSZAjMQ7c2zCvlSIuQP/dZ8bT0JzE6iiAtR0Xf9vOIBpYd6SAoJVyp8bQjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIo/GmTn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIo/GmTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FB31F00A3D;
	Thu, 28 May 2026 03:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779937539;
	bh=rj4qDmMCYpszHHeRg8aGd5/W+DuhRJarQpl7lAITGVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EIo/GmTnwwOfG/QGIUXUZ9wSsqnjpTixnGwPUgkIT+byR9/QaL+glr6GqCMwEOGDE
	 lj35smxEM8jy7GDbziqaHW6Qy7s2NTa5bkBdAd6t93RdUHwPBZg0/TmWLB4f6WqobK
	 xQo/TxqYAGgZs7apogn7n4cdguGItHSBSaqO2NcliCI8tox6dTtcJnKHdPy3rvqOQ6
	 49en/5WGJg3B6gqDdEc8OAZkwIcUYkqNWLpu78mk7qV8tODLGIbkPtRbfyw50DK+4U
	 qbcE2Hg/6hpfj6vfClScmm+7rEztUYeMQO+PjirarLI8sMG5C2+j5RIdbMz229KOmP
	 sQWquJucPadiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 03:05:38 +0000
Message-Id: <20260528030538.F0FB31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unbalanced regulator disable during late init for clocks left enab=
led by the bootloader.
- [Medium] Hardcoded resource mapping and OF provider registration prevent =
API reuse in multi-functional drivers.
- [Medium] `qcom_clk_ref_is_enabled` returns a negative error code on failu=
re, which CCF interprets as true.
--

commit 958034c0adafc3f72b4d7e46df81935d74404f7a
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

clk: qcom: Add generic clkref_en support

This commit introduces a new clk_ref clock type with custom clk_ops for
QREF blocks. It provides a common registration and probe API intended to
be reused across different placements like TCSR and TLMM.

> diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
> new file mode 100644
> index 0000000000000..213c0f58bb36e
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

[Severity: High]
If the bootloader leaves this clock enabled, the common clock framework
will call unprepare() during late init to turn off unused clocks. Since
prepare() was never called by the kernel, won't this
regulator_bulk_disable() call trigger an unbalanced disable warning and
permanently leak power?

Does the driver need to sync the hardware state during probe by enabling
the regulators if the clock is already on?

[ ... ]

> +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk =3D to_qcom_clk_ref(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(rclk->regmap, rclk->desc.offset, &val);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If regmap_read() fails, this returns a negative error code (e.g., -EINVAL).
Since the common clock framework evaluates the is_enabled callback as a
boolean, won't it treat this negative error code as true and incorrectly
assume the clock is enabled?

> +
> +	return !!(val & QCOM_CLK_REF_EN_MASK);
> +}

[ ... ]

> +int qcom_clk_ref_probe(struct platform_device *pdev,
> +		       const struct regmap_config *config,
> +		       const struct qcom_clk_ref_desc *descs,
> +		       size_t num_clk_refs)
> +{
> +	struct qcom_clk_ref_provider *provider;
> +	struct device *dev =3D &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);

[Severity: Medium]
The commit message mentions reusing this model for blocks like TLMM on SM87=
50.
If a multi-functional driver like TLMM tries to use this helper, won't
devm_platform_ioremap_resource() fail with -EBUSY because the parent driver
already maps the register region?

Since qcom_clk_ref_register() is static and callers are forced to use
qcom_clk_ref_probe(), does this hardcoded resource mapping prevent the
intended integration with multi-functional drivers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-tcsr_qref_=
0527-v4-0-ded83866c9d9@oss.qualcomm.com?part=3D2
