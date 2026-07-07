Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE2C37F011
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425876; cv=none; b=O0dvoWrVLd9a/CRYWAZbazwsSaNSufxmz5cu+V9Bj+YaP4I2K+XToVkW2+VpGJSA+hUCk0bSbopchUSIKJvWwT3k2z565M5FcGSGZ8BTEZXUWT1TN8A8QhXdswWmR8X3p2+6EveNoPaJsIFol6F+DDE0aYfNmZAG1pAMlzMU2Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425876; c=relaxed/simple;
	bh=DaLt45dD36CtyeUnS/H+i4wtdj3chmaWARKMd3zB8Yc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lqXsRKHWQGPeseVyABesEAlNFPiOiRuxYsFY8hsno54a291eeoH11s4EdEAz51UbK7JsWRA08iVmxGlpZ2pZ3//zv3zWZb9zUSa/OAqWf9DT355Trjf61ra3Mo+lwZzuVqDrUEaci7pTc5J/n1hsdJzqPxeiGV5Vq8AcxEi3kVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+w4iI/B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+w4iI/B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3FA1F00A3E;
	Tue,  7 Jul 2026 12:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783425874;
	bh=o22aB8PdIjpGvGjS95cevRWIwAlR7JR/Vg4IyEVYwBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I+w4iI/B/Nf503NEdcwLLZojvslO9SCSeVH8NKLpdgdis1CkBCyfRc1pvOpm5rFhd
	 yQwrcUAL3F8EEJSycq8J5tY+D/Y60z63m1rtnf/e7NQqvALghqJwuDI9ztqbvb3mfJ
	 ZuFPhMk2IHiGfZ3Cp2vnIGr/hu9FqatLn6LiUvhpMylOOz63j0QmHRLy7tMR5SaRRl
	 Utr7Bke4j7CEkln5SGcqvA+HbswNn5Z+BZ01YBhQLm4yAGdiApGA3YxSibnb8gNnJi
	 Oy+ui2BhnpmgUzQBTkAMJSc0W+K0eqi80WwjZb0wqjRW6rr9kkNdfmaFefjycF0w6b
	 wr43TH3Zd8JWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] mtd: rawnand: qcom: Make "aon" clock optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stephan Gerhold" <stephan.gerhold@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-qcom-nandc-mdm9607-v2-2-d906f7e8b814@linaro.org>
References: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
 <20260707-qcom-nandc-mdm9607-v2-2-d906f7e8b814@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 12:04:33 +0000
Message-Id: <20260707120434.4B3FA1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free when boot partition parsing fails
- [High] Unbalanced teardown leads to Use-After-Free when a subsequent chil=
d node fails probe
--

--- Patch [2]: [PATCH v2 2/4] mtd: rawnand: qcom: Make "aon" clock optional=
 ---
commit 7ddf091d1f9f9e091fb62bfa7346955975fe9533
Author: Stephan Gerhold <stephan.gerhold@linaro.org>

mtd: rawnand: qcom: Make "aon" clock optional
   =20
This commit makes the second "aon" clock optional to avoid an error when
it is missing on certain SoCs like MDM9607 and SDX55.

> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index 4b80ce084d9ac..0251dd591d40a 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2280,7 +2280,7 @@ static int qcom_nandc_probe(struct platform_device =
*pdev)
>  	if (IS_ERR(nandc->core_clk))
>  		return PTR_ERR(nandc->core_clk);
> =20
> -	nandc->aon_clk =3D devm_clk_get(dev, "aon");
> +	nandc->aon_clk =3D devm_clk_get_optional(dev, "aon");
>  	if (IS_ERR(nandc->aon_clk))
>  		return PTR_ERR(nandc->aon_clk);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the probe
path I noticed a potential use-after-free when boot partition parsing fails.

In qcom_nand_host_init_and_register(), if mtd_device_parse_register()
succeeds but the subsequent qcom_nand_host_parse_boot_partitions() fails:

qcom_nand_host_init_and_register()
   mtd_device_parse_register()
   qcom_nand_host_parse_boot_partitions()
   goto err;

err:
   nand_cleanup(chip);
   return ret;

Since mtd_device_unregister() is not called in the error path, and the call=
er
qcom_probe_nand_devices() frees the host memory via devm_kfree(), does this
leave stale pointers in the MTD subsystem?

[Severity: High]
This is also a pre-existing issue, but there appears to be an unbalanced
teardown leading to a use-after-free if a subsequent child node fails
during probe.

In qcom_probe_nand_devices(), the driver iterates through child nodes:

qcom_probe_nand_devices() {
    for_each_available_child_of_node(...) {
        ...
        ret =3D qcom_nand_host_init_and_register();
        if (ret)
            continue;
    }
    return ret;
}

If an earlier child is successfully initialized and registered, but a later
child fails, the function eventually returns a non-zero error code. This
causes the main qcom_nandc_probe() to fail, and devres automatically frees
the memory for all children.

Since there is no error handling path to unregister previously successful
children, could this result in the MTD subsystem retaining pointers to the
implicitly freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-qcom-nandc=
-mdm9607-v2-0-d906f7e8b814@linaro.org?part=3D2
