Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBB41990A7
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876298; cv=none; b=h0TUQV8SK2x85VcZzacWN15qACuIibIz/saltNERzMNNuV9xnujzEE49gflKw0xkIsNvCbUyBQQ88cPFQ5+KqDs8xlPIovjpiE0d0GpUzrLPgvPcwvWqoCQyfnNFCZeRAJHcpnA1/wi/mF/0chuqAETaVyYJtxilmCeePHl+d/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876298; c=relaxed/simple;
	bh=s5DoStgaRK36JwJHwxl9cmm8FLdizaRrLoCR2GTq8nA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CeFC+BNKn9MxqmCLLGF9VJz3FXcD3klGYdL7ASWMVMOnrOCVicnx/E+15YdnU07cL7xxObzs5iA8pUx1HScrIlgMBcmnqfVQ94Mr4LRKmGemQt3tu3nBj1PhjdrA2lPyP+ENQScdYXV5Gxo1dR8WVjQZVzhGt0mUl9Jrh+VLCLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvCYOh+D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvCYOh+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808791F000E9;
	Wed, 27 May 2026 10:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876296;
	bh=BN4g4Chhw+V23oimcWXc1NoWjMkuvJDXlYNG4SCPOCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MvCYOh+DNW8Li9qyqF0OUOgw/9j3oMK4+N8gLq7ACpl+R9WihmAO4aeFmSYsa5lAI
	 DDtBx9iDRZ0bEmuulWdnaEffz/pMiR1nr10tQA7UqNcGY6qneV/L26zI93aEF+Oanh
	 nTS/2QdeugUz6fMUOIXDoqCD/oty8i7w+s7T4UL63XB6bUMNhd/nFWelY7ZOt/6niu
	 /ZoctQXPfR7Z+YPNWB2zvEDCYpZbCEVB3wp15NEJIhDm0FD33YLoAt4L/Un+7td3Oz
	 +EI6cmda6Sm4zLV6+Bp1GG7LtkPxc/fI9EXEafrIWE+U9rw3Xy40wzy2pZ4WwLqNbc
	 09BYoGuY5zikg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/24] arm64: dts: qcom: sm8250: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527094333.2311731-10-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-10-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:04:56 +0000
Message-Id: <20260527100456.808791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the PDC `reg` size to 0x10000 conflicts with the qcom-p=
dc driver's hardcoded minimum size constraint, triggering a spurious boot w=
arning and failing to actually reduce the mapped memory region.
--

commit d119056e24f5f045fcb50e0c6e437fe3a3f6f22f
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sm8250: Reduce OS PDC DRV span to 0x10000

This commit reduces the register window size for the OS PDC DRV on the sm82=
50
platform from 0x30000 to 0x10000 bytes.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index 7076720413ab2..23aa483e5c439 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -5053,7 +5053,7 @@ dispcc: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sm8250-pdc", "qcom,pdc";
> -			reg =3D <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
> +			reg =3D <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;

[Severity: Medium]
Will this change cause a spurious boot warning and fail to actually reduce =
the
mapped memory region?

Looking at the driver in drivers/irqchip/qcom-pdc.c, qcom_pdc_probe() enfor=
ces
a minimum register window size of 0x30000 bytes (QCOM_PDC_SIZE):

drivers/irqchip/qcom-pdc.c:qcom_pdc_probe() {
    ...
    res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
    if (res_size > resource_size(&res))
        pr_warn("%pOF: invalid reg size, please fix DT\n", node);
    ...
}

Since the driver evaluates res_size to 0x30000 and the new DT size is 0x100=
00,
it seems this will trigger the warning and still map 0x30000 bytes at runti=
me.

Does the qcom-pdc driver also need an update to handle this smaller size?

>  			qcom,pdc-ranges =3D <0 480 94>, <94 609 31>,
>  					  <125 63 1>, <126 716 12>;
>  			#interrupt-cells =3D <2>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D9
