Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5B93DD852
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876716; cv=none; b=Ni7dxktaEuTGGjfd9otcBlF1RJroutg9UZpPJQ9gT5YtCwMAcoC8K1TRMWU2TGQXODMwhvI7qO0sA3+NMQ32AuUG7ApO3/ZWqYjscVLA0VSrw5EU0WKUbWr2DA/kDD2SYGcCVGzv1oQD68c+vi7AVwbPBLFE7dxl5dAcDOIbhgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876716; c=relaxed/simple;
	bh=eJ7sOUusvlxHsM2ZjtiIZRUVbaIZZ3aWzMD3WcmY+g8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cn3aN6OAe5zFSNwAEg1x8XyPecx/GQhLZIzhc8kzYd/o2lGrAZKNa5sJjiBeri6dKWtb3MBJvD5tXO6qVVlo3yCrd4oUDv5K6A4431mAJjLiPe0w7ZvORhWdlnY9PTwb1Ngx0JWeqFs3tqhf/NfUpFl4TOyQc24PcAWFBsitsjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0Nk1x6K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0Nk1x6K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB561F00A3A;
	Wed, 27 May 2026 10:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876703;
	bh=Hl3EHspcxaYqsy9H9UwIAMvKNepZxGJ+SfuNXlxZ6hc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A0Nk1x6KiIlocOqpocrg/mpNIAePkNjsT8vvIxAl2PBBruxlpbfV9GfqZgMB9vd5A
	 Dm2rtwGTof5iTbKXACr6JM90+vMg2tCvizUH53tTInSx8paL9o/X50EuOTrIDJpvrX
	 I4WqKDzW8v5d4TmdL9RF8OxbAVZBYfTcLN4gInsa8mY8cy07tmFvVoVVpahFDR10uE
	 1LYRuTj7Lu68DDPu3o8rRNzkzdTMA0pmJLc9u2FOKa4JOdlMEzl9m1Xj1IDGaKhAa5
	 UpBR//W+ywDcQ8I+tY9YRsm8WZckmO841R8kabMV7buAVsfp8ynWeVKOFeXAUb0D8+
	 uLeiK1d11Pomg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/24] arm64: dts: qcom: x1e80100: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527094333.2311731-16-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-16-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:11:42 +0000
Message-Id: <20260527101143.ABB561F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the `reg` size in the Device Tree without updating the =
`qcom-pdc` driver causes a boot warning and fails to actually reduce the ma=
pped memory region.
--

commit 905355b7e18725670918048d9deb9a052ae4824e
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: x1e80100: Reduce OS PDC DRV span to 0x10000

This commit reduces the OS PDC DRV register window on x1e80100 from
0x30000 to 0x10000 bytes.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 051dee0764167..5056d1f7a6d31 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6100,7 +6100,7 @@ dispcc: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,x1e80100-pdc", "qcom,pdc";
> -			reg =3D <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> +			reg =3D <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;

[Severity: Medium]
Will this change trigger a boot warning and still map 0x30000 bytes?

Looking at the qcom-pdc driver (drivers/irqchip/qcom-pdc.c), it appears to
hardcode a minimum size:

#define QCOM_PDC_SIZE 0x30000

And in qcom_pdc_probe(), it checks the size against this minimum:

    res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
    if (res_size > resource_size(&res))
        pr_warn("%pOF: invalid reg size, please fix DT\n", np);

If this device tree patch is applied without a corresponding driver change =
to
relax the 0x30000 requirement, it looks like it will unconditionally warn
during boot and force the mapped size back to 0x30000 anyway.

> =20
>  			qcom,pdc-ranges =3D <0 480 42>, <42 251 5>,
>  					  <47 522 52>, <99 609 32>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D15
