Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBFD64AA4
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 04:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780202057; cv=none; b=b8FPzVMCBVkODhtFsJMDFbuJCUbeWRw+JkqjV+Ov/3gUsoafYiIp9nmvWSx8XAB6aR+6W73O3sHDm4DKcRV6ajTyt0XH/YuN7Z+PGR4XeSkDiJE6V9PKLZXcuaRfclYyZPsUEQ5L5JZaAPNQVnpxkauL2JmLwLWv5j+PYSlPzkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780202057; c=relaxed/simple;
	bh=zmzz9w1dRqtP+qyHxy8LfxVTUiMlKTgn0R48emIT8A0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RBE/GhRKzPWNX1veXwzVCp45bMdywWC8p7a5VIaEYwEo+uwBW845vT3FWtvBbbRZQHqP296Vfnn9zgs9BQbs4gaR/LU/VIRDenkXZ+XxF0pUOYGCI2wH2P1dp77wBom5r1FBsiWe1QwuoPm1yRgbel1Y1UtXr/zg4l+PSdJTYmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDd8ZpGF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDd8ZpGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604C41F00893;
	Sun, 31 May 2026 04:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780202056;
	bh=f4VLf7TLy6GIGM+FkiahPqnYbuuC2e2CIgt0XoZ4p94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nDd8ZpGFltpgubt7siqguCa8xEbyKLuoq4ufu3XNEA3iqsQpMVKWLmlkL1dZAh3vM
	 jwksaZ54YJVoGYUy4l3iso4FLAPYs5+fRtn8352Eq0kMLUAgeJno13z77ZC20BHWqt
	 8zejEipaXxfvYrhk4ro0T13f9NR3ADT/Wzgvkq2gjuTRVqIKwKp8Hy5Ud+/lxZ9xok
	 PLRRlFvjWZ3WTfv41kkpohmfZmfzU3+FqEB+5J4X/KIUhCU21Ij4jqzY08fYqvoX5b
	 M3CL82cCLRGLsjzXo9ETtEbdE9tT82+NjK7Kq7z1O3F5rkilYzBc5qczAn/106K7rd
	 Dc+OzyxtTNhNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add MSM8x60 NoC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <314e71d651e4bbe9eedc904d3b94cf306ce5aab5.1780197411.git.github.com@herrie.org>
References: <314e71d651e4bbe9eedc904d3b94cf306ce5aab5.1780197411.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 04:34:15 +0000
Message-Id: <20260531043416.604C41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Clock prepare/enable reference leak on probe deferral when RPM dev=
ice lookup fails.
- [High] Time-of-check to time-of-use (TOCTOU) race condition in `msm8660_g=
et_rpm` leading to Use-After-Free.
- [High] Integer truncation in the fabric clock rate calculation allows unp=
rivileged processes to freeze the interconnect bus.
- [Low] `COUNT_ARGS(__VA_ARGS__)` evaluates to 1 when no arguments are pass=
ed, creating bogus links to node ID 0.
--

commit 3b79422423710904c503ef7d19429d69c2f02d18
Author: Herman van Hazendonk <github.com@herrie.org>

interconnect: qcom: add MSM8x60 NoC driver

Add a Qualcomm interconnect driver for the MSM8x60 family, modelling the
four fabrics that connect masters and slaves on these Scorpion-class SoCs.
The driver implements the interconnect-provider API to manage bandwidth
between specific masters and slaves.

> diff --git a/drivers/interconnect/qcom/msm8660.c b/drivers/interconnect/q=
com/msm8660.c
> new file mode 100644
> index 0000000000000..174bc59da74f7
> --- /dev/null
> +++ b/drivers/interconnect/qcom/msm8660.c
> @@ -0,0 +1,1069 @@
[ ... ]
> +#define DEFINE_QNODE(_name, _id, _buswidth, _mas, _slv, _tier, ...)	\
> +	static struct msm8660_icc_node _name =3D {			\
> +		.name =3D #_name,						\
> +		.id =3D _id,						\
> +		.buswidth =3D _buswidth,					\
> +		.num_links =3D COUNT_ARGS(__VA_ARGS__),			\

[Severity: Low]
Does COUNT_ARGS(__VA_ARGS__) evaluate to 1 when invoked with no links?

When DEFINE_QNODE is invoked with an empty variadic argument list, this
might receive a single empty token and initialize .links to { 0 },
causing a phantom node with ID 0 to be created.

[ ... ]
> +static int msm8660_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
[ ... ]
> +	/* Apply minimum floor to prevent bus starvation */
> +	rate =3D max_t(u64, rate, MSM8660_FABRIC_MIN_RATE);
> +	rate =3D min_t(u32, rate, INT_MAX);

[Severity: High]
Can this truncation bypass the minimum floor limit?

If rate exceeds the 32-bit maximum (for example, during very high
bandwidth requests), the cast to u32 in min_t() will truncate the upper
bits. This could result in a near-zero clock rate instead of capping it,
potentially freezing the interconnect bus.

[ ... ]
> +static struct qcom_rpm *msm8660_get_rpm(struct device *dev)
> +{
[ ... ]
> +	rpm_pdev =3D of_find_device_by_node(rpm_np);
> +	of_node_put(rpm_np);
> +	if (!rpm_pdev) {
> +		dev_dbg(dev, "RPM device not found yet, deferring probe\n");
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	rpm =3D dev_get_drvdata(&rpm_pdev->dev);

[Severity: High]
Could this lead to a race condition between retrieving the pointer and
pinning the device?

Because dev_get_drvdata() retrieves the pointer before device_link_add()
pins the supplier, a concurrent unbind and rebind of the supplier in this
window could cause the original pointer to be freed, even though the link
might succeed on the rebound instance, leading to a use-after-free.

[ ... ]
> +static int msm8660_icc_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	if (qp->num_clks) {
> +		ret =3D clk_bulk_prepare_enable(qp->num_clks, qp->bus_clks);
> +		if (ret) {
> +			dev_warn(dev, "Failed to enable bus clocks: %d\n", ret);
> +			qp->num_clks =3D 0;
> +		}
> +	}
> +
> +	/* Set up RPM fabric arbitration */
> +	qp->desc =3D desc;
> +	if (desc->rpm_resource >=3D 0) {
> +		qp->rpm =3D msm8660_get_rpm(dev);
> +		if (IS_ERR(qp->rpm))
> +			return PTR_ERR(qp->rpm);

[Severity: High]
Does returning directly here leak the clock prepare/enable reference?

When msm8660_get_rpm() returns -EPROBE_DEFER, returning directly skips
the rollback for the clk_bulk_prepare_enable() call made earlier. This
will leak the clock reference on every probe retry.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780197411.gi=
t.github.com@herrie.org?part=3D2
