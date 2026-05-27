Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804FB2494FE
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877947; cv=none; b=bx8lHllZh6FDoMf7Ardqdi8I2HkswiSskNU/T/X5JtCoVQlw1KaH2ZWBG0kN5qu4mJw5J7+U3VswAXt0dYElAqr62mBTU6ULNYtHNfAIwRdzsWSsuXXmJ1dxuUhhS60bwIZCxhjZLKxEnbOMzhUWyh6qX3XU87EE18ot6O55STE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877947; c=relaxed/simple;
	bh=vX7c60COT57BsfY3e6nDCA3g5XS5AeBueVoaDuiQ6wA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XbSLlG/1uWmIRILx1BRrF4MbTjyZ4sPVEa+n3GD66rQM/QLWY2UpJJFvdbKqTwgU7wQ2GkzPSfnMkH4Z91unk2GRjz58dNkp8B0ixuunj0z78U8FVzi2r8AKFlssvuHFFY4E5y5FAeI1g62PYbc3MP9TnRqst8djXM69uQXxXGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXUlicUL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXUlicUL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC511F00A3A;
	Wed, 27 May 2026 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779877946;
	bh=NrDNQpmxYrUazLTJwbtpm927GCR2w4MliM7PF3s2g2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EXUlicULirGQRj4JzQagO3PdXbP6+8MhSKU1m8B9ZyzRLXWQwPWUnjXjkUAACgCiy
	 RhAnxSPxpNdVDmxrcphFloYJkr3AUxSbLf2WOdcEdDsQSSvfy2+JYUo9Jdcsf5nFIa
	 qBNu/1X3j9d6a2vqdHcLY6AmlaEZ3neosPytUMHJtTDBOr3cC6z21j5es+FY+1OAFv
	 9kzmOjSgxHYNvAeHkT1W0roFl2hbLdzqt2dsQ4zaNPdEwGHqyeNLKxf0J/gltAa2ag
	 7NNbQ6FCJTR36R0EwYmYRfQcPoERx1jGmsQRJy+0+UKFUD3TYKpn0kY9YgQs/yGuMU
	 O5I6R7N+tO3ZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 20/24] arm64: dts: qcom: lemans: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527094333.2311731-21-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-21-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:32:25 +0000
Message-Id: <20260527103226.0BC511F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the DT `reg` size to `0x10000` triggers a kernel boot w=
arning and mapping override in the `qcom-pdc` driver.
--

commit 35903595a207aeb5cc83a80438e763bb0fb48abe
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: lemans: Reduce OS PDC DRV span to 0x10000

This commit reduces the OS PDC DRV register window from 0x30000 to
0x10000 bytes for the pdc node on the Lemans platform.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index fe6e763518230..603d98002b405 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -5543,7 +5543,7 @@ dispcc0: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sa8775p-pdc", "qcom,pdc";
> -			reg =3D <0x0 0x0b220000 0x0 0x30000>,
> +			reg =3D <0x0 0x0b220000 0x0 0x10000>,
[Severity: Medium]
Will this reduction in the reg size trigger a boot warning from the qcom-pdc
driver?

Looking at drivers/irqchip/qcom-pdc.c:qcom_pdc_probe(), the driver hardcode=
s a
minimum resource size of 0x30000 (QCOM_PDC_SIZE):

drivers/irqchip/qcom-pdc.c:qcom_pdc_probe() {
	...
	res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
	if (res_size > resource_size(&res))
		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
	...
}

If the device tree size is less than 0x30000, the driver forcibly expands t=
he
mapped size back to 0x30000 and unconditionally prints a warning.

Is there a companion patch to update the driver, or does this need to be fi=
xed
to avoid the warning and actually reduce the mapped size in the kernel?

>  			      <0x0 0x17c000f0 0x0 0x64>;
>  			qcom,pdc-ranges =3D <0 480 40>,
>  					  <40 140 14>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D20
