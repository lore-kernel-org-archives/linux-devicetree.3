Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4011B30F7FA
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268142; cv=none; b=b+w0OlFcNI789IvynvrFxUcvV/Y8lf32fadaS9w7adTYp8Appn2uxuRol8ZFnbSCin7rnVvSF1XWwKWBJMGCO1wojOv0b18ceq1WunwHMhc94Tbb2ugE2f/nRIzkJ4CtcJB8zWQ3I5TAm3DsEKdImZPDbH/v9PLoU+J3HMAs7M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268142; c=relaxed/simple;
	bh=5QmgDOjt0W8J9PQWnsiReD3DtzcZt0NsHc32/SEWaao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fJQlSS+lucwkVUFfFRqXRDCKbJrQkRBCHGmdD2wpBuGItDDXteP07AJu96wmAhm8lx5UqHrkPbIrQhj/m/qqC8eOZDjp7v4xZEfD2eScUBulzsDaEUmsCC78ssTOdtEoa0CXkL/qHNFo7UIC41D4JjjvRe3rM4cN2+f2NCtC9L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWKllZA6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWKllZA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518CE1F000E9;
	Tue,  1 Sep 2026 13:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788268140;
	bh=hLB59ftGD/a4RqFi34kI2/JqViOgZ9cZOPwFrRH1I/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NWKllZA6cgQ7jTec+RuYETca+xEw5ycsV+5ospIwzfBNk8L0OODTBCGPWYeMnVIw/
	 5bg+Q0J6rIY0VHDb5jVQ6O97m1iXTnzlwwp0C7LmwUsydUXE9aThFHIaxiyq7JWT25
	 hgKn62h7tAbwH1fsrwPzmICos1Ljx3sTDpvXK1+YdLH2mJ+SB5mFQWAMExrSor89XM
	 kHL94/+V0Lq5FFrTuQU2brVbi/zzPnYM01slgHUpscTLJAiig0zaNSmm0jAU8f/p+m
	 9b7tpkk1dmYKMzqUaEVJbwuKurrgip0+ruCMTSu8FAEQ64/2ZrtvQhO1TLwngE14O4
	 +/6+RjJKU+CtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] phy: airoha: add support for AN7583 Gen3 PCIe
 PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260901125819.20378-3-ansuelsmth@gmail.com>
References: <20260901125819.20378-1-ansuelsmth@gmail.com>
 <20260901125819.20378-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 13:08:59 +0000
Message-Id: <20260901130900.518CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect teardown order and potential resource leak in an7583_pci=
e_phy_exit().
- [Medium] Calling phy_init() and phy_exit() on a child PHY from within the=
 parent's init/exit callbacks triggers a lockdep recursive locking warning.
- [Low] Missing 'select REGMAP_MMIO' causes build failures.
--

commit d7a329b5d2d570ebb31f2d95a8c4c781915cf2bd
Author: Christian Marangi <ansuelsmth@gmail.com>

phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

This commit adds support for the AN7583 PCIe PHY driver. It introduces the
initialization callback for the PCIe Gen3 port present on the Airoha AN7583
SoC, which requires a different calibration process and register setup
compared to the EN7581.

> diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
> new file mode 100644
> index 0000000000000..55fd20f29da65
> --- /dev/null
> +++ b/drivers/phy/airoha/Kconfig
> @@ -0,0 +1,13 @@
[ ... ]
> +config PHY_AIROHA_AN7583_PCIE
> +	tristate "Airoha AN7583 PCIe-PHY Driver"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY

[Severity: Low]
Since the driver uses devm_regmap_init_mmio(), should this Kconfig
entry also select REGMAP_MMIO to prevent build failures? If this driver
is built with COMPILE_TEST on architectures that do not select REGMAP_MMIO
by default, it will cause an undefined reference link error for
__devm_regmap_init_mmio_clk.

> diff --git a/drivers/phy/airoha/phy-an7583-pcie.c b/drivers/phy/airoha/ph=
y-an7583-pcie.c
> new file mode 100644
> index 0000000000000..8aaca3f50713c
> --- /dev/null
> +++ b/drivers/phy/airoha/phy-an7583-pcie.c
[ ... ]
> +static int an7583_pcie_phy_init(struct phy *phy)
> +{
> +	struct an7583_pcie_phy *pcie_phy =3D phy_get_drvdata(phy);
> +	u32 val;
> +	int ret;
[ ... ]
> +	regmap_set_bits(pcie_phy->g3_pma, REG_SS_DA_XPON_PWDB_0,
> +			G3_PMA_DA_XPON_CDR_PR_PWDB);
> +
> +	usleep_range(100, 200);
> +
> +	ret =3D phy_init(pcie_phy->qp_phy);

[Severity: Medium]
Will calling phy_init() on the child PHY from within the parent's init
callback trigger a lockdep recursive locking warning? The PHY core already
holds the parent's phy->mutex when executing this callback. Since all PHY
mutexes are initialized to the same lock class in phy_create(), acquiring
the child's mutex here is seen by lockdep as recursive locking on the
same class, which will emit a warning splat and disable lockdep.

> +	if (ret) {
> +		an7583_pcie_phy_deinit(pcie_phy);
> +
> +		return dev_err_probe(pcie_phy->dev, ret, "failed to initialize QP phy\=
n");
> +	}
> +
> +	/* Wait for the PCIe PHY to complete initialization before returning */
> +	msleep(PHY_HW_INIT_TIME_MS);
> +
> +	return 0;
> +}
> +
> +static int an7583_pcie_phy_exit(struct phy *phy)
> +{
> +	struct an7583_pcie_phy *pcie_phy =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret =3D an7583_pcie_phy_deinit(pcie_phy);
> +	if (ret)
> +		return ret;
> +
> +	return phy_exit(pcie_phy->qp_phy);

[Severity: High]
Does this teardown order safely handle the child PHY? This sequence shuts
down the parent PHY hardware and clocks before calling phy_exit() on the
child PHY. If the child PHY attempts to access parent-provided clocks or
registers during its exit routine, could this cause a bus hang or system
crash?

Additionally, if an7583_pcie_phy_deinit() returns an error, the child PHY
resource will be leaked due to the early return. Should phy_exit() be called
first to exactly reverse the initialization order?

[Severity: Medium]
Similar to the init path, will calling phy_exit() on the child PHY from
within the parent's exit callback trigger a lockdep recursive locking warni=
ng
on phy->mutex?

> +}
> +
> +static const struct phy_ops an7583_pcie_phy_ops =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901125819.2037=
8-1-ansuelsmth@gmail.com?part=3D2
