Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295603;
	b=bEXn9JHgGAT8tb6Kl2A5sn0oGkkPi60LMfL/i8vDtHGU638PL/SGfsEAzLYiHfp0dHRN
	 SavryLHOpK8tPWLa5poNZN72VwlkIHBiYGApjdJ+o7hRcI+OiIcm9OlJfFAlw3doBvBdM
	 xT+F7mcQu1vmK+5XGv3dBSZSk/N6ptmgG6DvbC/6mkrGZcrEgAbDJm59lKd5MQL2oTGiC
	 wVsn8m6dEwf3sczERX02zti7iR+Rwmau2lUpwP7o8i587DbFrcJ6H9RqoTQSSQpn8Kd1/
	 XQ9AeMjk1fRwugXMUnmPCh5ALVXuO1lIyXgcEBj+TVamuQCLR1ookI0fYahGfAiN8nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295603;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=p2kg3JeBZpmgQXqbxQbHiOPCOpd0Trotz2Z5D+/Gm2w=;
	b=Hcn37qQTT2wQahkxQsbKmoDvU4QlQhnumqNzFi+eqBiLPML19j7atQOubhczBDyv+6t3
	 QEP+xQRNNqjdtTAjfkRgsDb4LZOieqCxw9skEeRCDAIuBvg7HtpeKhBc7IZWCTxkawTnO
	 yPQvtcDn2sexox5lSgsIOcIW0revNeBvmCnPutk4a6F7ykZhB2T1qK310MmU55d8jTajh
	 CVDnpP8IgH+7Oz/bdNty3dIRRBHTIHuVtyYVCPsEzCz4csh1OhfLvXhHHh5ZoOxNpsxmE
	 TepGWi8DvheS2YAqhUDyP3CVh6jt+e2lby82Sq0A6w2AGVKnhxk/HOjs+LEh/3QLQvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R9KH1FRp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA1A606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R9KH1FRp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CFB1F0089F;
	Tue, 10 Nov 2026 07:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295602;
	bh=p2kg3JeBZpmgQXqbxQbHiOPCOpd0Trotz2Z5D+/Gm2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R9KH1FRpYIK/gM0AQoey0mnOcZTXAcfCC4kJqTM8F5BrDwRPkNDLb8kPDHwTeXeOL
	 eW0OWkqqF15lvdK21F+w/dlvuAomk7Ep+e0xCQVHZyKN/AjPYIAFK2I3s8ej6HAufp
	 PNSnTRAIo4GOAR650W7TgT7c4fJLMi+Yff8SJgEjQP5iSX8xXBwkNpTiG6Chz3AgJq
	 697KYOfqNQKN8gi+TRxn9J9DzYGMlTiwgZCfJ0ZEoQc4GtZ+MqDVkFy6q6yqtFzQbk
	 s2NZIF38GbAD2RhlgDzuf4SYSGN3VCgy4Gj2tafAJE/pEMXdzmh+LHzpd3t7/ap9+V
	 +fnm0J9EvBMPw==
Message-ID: <sashiko-outbox-206486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] iommu/arm-smmu-v3: enable optional clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-smmu-v3-pcie-pd-v1-3-628819ca44b9@gmail.com>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <20261110-smmu-v3-pcie-pd-v1-3-628819ca44b9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:26:42 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] iommu/arm-smmu-v3: device refcount leak in
  arm_smmu_device_probe()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] iommu/arm-smmu-v3: device reference leak in
  arm_smmu_device_dt_probe() [1]
--

commit 30c1e41e25870c67f127c773eba01cc753f1ae3f
Author: Arun Iyengar <aiyengar1990@gmail.com>

iommu/arm-smmu-v3: enable optional clocks

This commit acquires and enables all optional clocks described in the
firmware node during arm_smmu_device_probe() using
devm_clk_bulk_get_all_enabled().

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/=
arm/arm-smmu-v3/arm-smmu-v3.c
> index 6d4520c473086..cce66db932197 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

[ ... ]

> @@ -5800,6 +5802,11 @@ static int arm_smmu_device_probe(struct platform_d=
evice *pdev)
>  	if (ret)
>  		return ret;

[Severity: Medium]
This problem wasn't introduced by this patch, but can
arm_smmu_device_dt_probe() leak a reference on smmu->impl_dev [1] when
"#iommu-cells" is missing or invalid?

If "#iommu-cells" validation fails, arm_smmu_device_dt_probe() leaves ret as
-EINVAL and continues instead of returning early.  On "nvidia,tegra264-smmu"
it still calls tegra_cmdqv_dt_probe(), which acquires smmu->impl_dev via
of_find_device_by_node(), and then returns -EINVAL here before
arm_smmu_impl_probe() can take ownership of that reference:

drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:arm_smmu_device_dt_probe() {
	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
		dev_err(dev, "missing #iommu-cells property\n");
	else if (cells !=3D 1)
		dev_err(dev, "invalid #iommu-cells value (%d)\n", cells);
	else
		ret =3D 0;
	...
	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu")) {
		tegra_cmdqv_dt_probe(dev->of_node, smmu);
		static_branch_enable(&arm_smmu_erratum_repeat_tlbi_cfgi_key);
	}

	return ret;
}

> =20
> +	/* Optional clocks: keep them running for as long as we are bound */
> +	ret =3D devm_clk_bulk_get_all_enabled(dev, &clks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to enable clocks\n");
> +
>  	smmu =3D arm_smmu_impl_probe(smmu);

[Severity: Medium]
Does returning here when devm_clk_bulk_get_all_enabled() fails leak the
device reference on smmu->impl_dev?

Earlier in arm_smmu_device_probe(), arm_smmu_device_dt_probe() (via
tegra_cmdqv_dt_probe()) and arm_smmu_device_acpi_probe() (via
acpi_smmu_dsdt_probe_tegra241_cmdqv()) acquire a reference on smmu->impl_dev
and rely on arm_smmu_impl_probe() -> tegra241_cmdqv_probe() to release it.
If devm_clk_bulk_get_all_enabled() fails, such as with -EPROBE_DEFER,
returning before arm_smmu_impl_probe() leaks that reference on each probe
attempt.

[1] https://sashiko.dev/#/bug/linux-084125c9-12e1-45a7-ad09-6882ddb42c3c

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-smmu-v3-pc=
ie-pd-v1-0-628819ca44b9@gmail.com?part=3D3
