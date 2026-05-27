Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502562236F2
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876380; cv=none; b=XuSnPcPpL3OLGCmDio8FnKjHdkxJjq2oVxiUefAkaIrMa0onZCCU60S7dNFAJ3CXZZJKtVFOtWFbpwYHRy9FvU/qLypZb/Ah1kZZNCPsI7CdYtN5RP7ylne29z7gqwMSN47jzZtRfH4fCWNGCrTDL+hI9Cw9zPSJglFRCDW5m/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876380; c=relaxed/simple;
	bh=s44+BZ84UhJD8dk98JPenwVhfa45JbZ9RqWRwNEE+8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hw+SrVOUgUKTianvuVeFgIWVOzaz3p8/jWPLIHkapurCn4NUxTXlo0yoShAYDZUKr93/VcGfiDui53CweafcriSOqLsV3o1YXvbQmIFj+8UsVDgzeSWGhVEppr31GaP6JcLyOUD4NyGKj5r3tWLKI/RYp9fu8v8GgjyRFoJULW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8ImtZ24; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8ImtZ24"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25CC1F000E9;
	Wed, 27 May 2026 10:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876379;
	bh=pGMXttwiKHqhTyDwbj9+lCA7ZsmI80Xd2A+XDl2T+e8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i8ImtZ24RjLAYLq9FXcNTzCfqM43maL7k1DHCDKt/ET2EyXk8Xtzt7NAvpZVxNcIY
	 GLhTTwZC65g03wB8wdbgCGnsImJI3Wy1ClPGa0JyVjg0kSQpVbxRA3ropyAAcUlNO/
	 mGWDXrGqfBQgIEsJx/LvKK+2j3/Vva+qiSUMdfSOlC9nu4STdxzaR9z4dk/wXlp56N
	 s1fam7Ttl6f6uNS7YWMmbe6tJuqYy0wrDNMTPIJRcJkZKeE0x3MXbTn5Ghi5emLGn2
	 ykgkz2zSYxUhC/pm+Cc/ra/lyXkyD6XABRIG04E4ofLYQ1LLKFFOCy7/7b+YRaHAe0
	 /wNgZM8ykMuQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/24] arm64: dts: qcom: sdm670: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527094333.2311731-4-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:06:18 +0000
Message-Id: <20260527100618.D25CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the PDC `reg` size to 0x10000 conflicts with the `qcom-=
pdc` driver, triggering a boot warning.
--

commit 91616deec930abcc3788af870cfe06cc7cfb6809
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sdm670: Reduce OS PDC DRV span to 0x10000

This commit reduces the size of the PDC register window in the sdm670 device
tree from 0x30000 to 0x10000.

> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/q=
com/sdm670.dtsi
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1618,7 +1618,7 @@ usb_1_dwc3: usb@a600000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sdm670-pdc", "qcom,pdc";
> -			reg =3D <0 0x0b220000 0 0x30000>;
> +			reg =3D <0 0x0b220000 0 0x10000>;

[Severity: Medium]
Will this change trigger a boot warning from the qcom-pdc driver?

Looking at drivers/irqchip/qcom-pdc.c, the driver enforces a minimum
mapping size of 0x30000:

drivers/irqchip/qcom-pdc.c:
#define QCOM_PDC_SIZE 0x30000

...

qcom_pdc_probe() {
	...
	res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
	if (res_size > resource_size(&res))
		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
	...
}

If the device tree size is reduced to 0x10000, won't the driver fall back
to the 0x30000 minimum anyway and log an "invalid reg size, please fix DT"
warning during boot?

>  			qcom,pdc-ranges =3D <0 480 40>, <41 521 7>, <49 529 4>,
>  					  <54 534 24>, <79 559 15>, <94 609 15>,
>  					  <115 630 7>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D3
