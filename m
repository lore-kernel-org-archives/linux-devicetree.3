Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B42E371CE0
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925446; cv=none; b=G6JWv5cKift3AZtqf3VQJZST/m5CRpHXlljGvRM3dAUJUv3j4UM6RJTLGXm/0xGw4BWvLdB76LWppJpG5PLr/XaBQYy1Lcof2wTof7EBeL8B3RNWxJ+VMdrDCLwOgLLhA33a9vGfl2PwypJ21Us2C3WGzNq6THfMEhCy4ScUhS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925446; c=relaxed/simple;
	bh=fISUvZ+pfyrBk8ORixpCTfoPyAko9Bcj9QU1VtI6Wp0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GVwUJo7wz58gSyJS3XytldJ+uuS6r1HQTV9Y1Yg7JfRHMOfNIt0p7tC81d5MyclCS7JFskyBEVSD5l6YlnK+K7HCQUOYCK4iYb5FiqZBuqCoSLepcq+2FEKP98sW9F7wjiqiRGp3k08fn6k+/8DwSs75k+hGWwnL4+HmtjbAkC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpJbmKVM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpJbmKVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7481F00898;
	Mon,  8 Jun 2026 13:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780925445;
	bh=Vzzzby5EHlhrJdSsXOhj3i7/yr1bt6BNcfPT94n+6zk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QpJbmKVMW5RxuGVFsdxld5ybod8XUEGT1gaFdGxdmSWAPN71TeBJtcku7kBLQdPON
	 TxV3cw7BnCJiwcUZN41gBT2ERUZpvHRsNMR6NO5ZeJdJzq+RpaxbEu5mjNNdgTtmBT
	 a3/MYPoravdpDDqcIz9eLOYXI63dNvyto4Gublpr3plqTerSNv3xgCaUjiJdtqz+RC
	 phxBDIdiSwQBfjWLglS7N2rj0u4MbkYmNh5AokEPaCrVhBzKtUM5xSjAJTivX/Qy8a
	 ShNLqIOEUdCzzvZMB2chNGiL8Uod80MMvfzmT6GDydG7ll4DWseWv4NDuLmICL0EG2
	 3LCmJiYwosfag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] mtd: rawnand: qcom: Make "aon" clock optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stephan Gerhold" <stephan.gerhold@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-2-4639a0492274@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-2-4639a0492274@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 13:30:44 +0000
Message-Id: <20260608133044.DE7481F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free due to missing MTD device unregistration on boot pa=
rtition parsing failure.
- [High] Use-After-Free due to missing MTD unregistration for successful ch=
ild nodes on probe failure.
--

commit 36076ea85a481eb0cc14bb0f987501c4cc6b4d63
Author: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: mtd: rawnand: qcom: Make "aon" clock optional

Some SoCs (e.g. MDM9607, SDX55) have only a single separately controllable
clock for the NAND controller. The actual clocks in the hardware are
managed by the firmware and turned on all together when needed. In this
case, there is no separate "aon" clock that can be described in the device
tree. Make the second "aon" clock optional to avoid an error when it is
missing.

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

[Severity: High]
This is a pre-existing issue, but I noticed a potential use-after-free in
qcom_probe_nand_devices() that could occur during probe failure.

If an earlier child node is successfully registered, but a later one fails
to allocate memory, the function returns directly:

drivers/mtd/nand/raw/qcom_nandc.c:qcom_probe_nand_devices() {
	...
	for_each_available_child_of_node_scoped(dn, child) {
		host =3D devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
		if (!host)
			return -ENOMEM;
	...
}

Are the previously successful children left registered with the MTD
subsystem? Since they are never unregistered before the error is returned,
the driver core will automatically free their memory via devres, which
might leave dangling pointers in the MTD lists.

[Severity: High]
This isn't a bug introduced by this patch, but there appears to be another
missing unregistration path in qcom_nand_host_init_and_register().

If mtd_device_parse_register() succeeds, the device is fully registered:

drivers/mtd/nand/raw/qcom_nandc.c:qcom_nand_host_init_and_register() {
	...
	ret =3D mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
	if (ret)
		goto err;

	if (nandc->props->use_codeword_fixup) {
		ret =3D qcom_nand_host_parse_boot_partitions(nandc, host, dn);
		if (ret)
			goto err;
	...
err:
	nand_cleanup(chip);
	return ret;
}

If qcom_nand_host_parse_boot_partitions() fails, the code jumps to the err
label and performs nand_cleanup(), but doesn't call mtd_device_unregister().

When qcom_probe_nand_devices() subsequently frees the host memory via
devm_kfree(), could this leave the MTD device registered while freeing
its backing memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-qcom-nandc=
-mdm9607-v1-0-4639a0492274@linaro.org?part=3D2
