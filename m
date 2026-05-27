Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D124385D9A
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877484; cv=none; b=HHVC/mnx1CXJ1pyE3mIa3b/ZtXzoV4TNUGlGZsvZyZ3H6Qcsplqr/vZxV6+BecTkgG3wyfvbDeD0LajplkrvujMtW0otxLT5PkMZ9AAmjz3XFv5MEFHEjwUdPT8EHAn9rtr7rGTxMspNQVqR11UrAAurJwKAn9AfBhjOJ84JOkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877484; c=relaxed/simple;
	bh=orD8nofQ1PqXNetb58DRQ7zn9WTMCySu1o7rWZB/2Y4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oFTw1J124UjPEViqS0j2VIbaw2YKppC9jcyFebw7DCUKHArCtCn1AESSaL2cZXQvWSpYF9fnUt40LZ3BfiYPRfCNn4Cq1s8H5i+0xkWltUl9Gj0GfayHHl2PwM4xCpnTKXUZSb2yCGYysC0q/jm08o92BJNQMFw8CUXL4pR1YOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2W41u+2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2W41u+2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0E51F00A3A;
	Wed, 27 May 2026 10:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779877483;
	bh=f7F4KWBI6ZM6AwZbS9IdeMpb8y8scE5Jt9WMhh2eeEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L2W41u+27f+F7vz9WW+eK+iYf0piArAIuMUCOR227f5993G0E2fXR6R0qnKCSYSHl
	 bLHbZg+ixJpVQ539N1vkVBBZUc13Ca6CGQ3vh4TX5p26/OJUzWiWHvEUm8FK84kiC3
	 p1SUHR21OkzqDIla+CX4sr8cnGDB2DiET+xXh11Doc/tADj4nyAID1CVRI3/dD/6Pr
	 k6r7AP6tSM9bNKpD6C0OAWEhtlgDWIoyqezfSsHtxQCr0KkwaK7eqgNhl/MRTATZ6T
	 LKRCCItUeH1+TSe4/SdSUciX6/jqLHBDh9TavIhezZIfFjhQw2RJSfj4PQFB8z5tKt
	 HQQWx6UKlhlYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 21/24] arm64: dts: qcom: sdx75: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527094333.2311731-22-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-22-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:24:42 +0000
Message-Id: <20260527102443.3E0E51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the DT `reg` size to 0x10000 fails to reduce the actual=
 mapped region and triggers a spurious boot warning in the qcom-pdc driver.
--

commit dab6e413e3615f1cfba52619b3f47d4bdda8763b
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sdx75: Reduce OS PDC DRV span to 0x10000

This commit reduces the OS PDC DRV register window on sdx75. It changes the
size of the first reg entry for the pdc interrupt-controller from 0x30000
to 0x10000.

> diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qc=
om/sdx75.dtsi
> --- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
[ ... ]
> @@ -1100,7 +1100,7 @@ usb_1_dwc3_ss: endpoint {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sdx75-pdc", "qcom,pdc";
> -			reg =3D <0x0 0xb220000 0x0 0x30000>,
> +			reg =3D <0x0 0xb220000 0x0 0x10000>,

[Severity: Medium]
Will this change actually reduce the mapped memory window at runtime, or
does it just trigger a boot warning?

Looking at the qcom-pdc driver in drivers/irqchip/qcom-pdc.c, it appears
to enforce a minimum mapping size:

    res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);

Where QCOM_PDC_SIZE is 0x30000. If the device tree size is reduced to
0x10000, the driver forces the size back to 0x30000 and unconditionally
prints this warning:

    if (res_size > resource_size(&res))
        pr_warn("%pOF: invalid reg size, please fix DT\n", node);

Should the qcom-pdc driver be patched to accept 0x10000-sized regions
before or alongside this device tree change?

>  			      <0x0 0x174000f0 0x0 0x64>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D21
