Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2250F391E7F
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876911; cv=none; b=f8H+RchT+NA35fIXTztAbJDcvSilg64qO9Fv9J/yq+Yqo1ZU5krM0miICUDZYsyTJ2vJa3dVELDoY2FjKACpMWmeFH+IZGLoFQq420w/tGQux1JmIX17n5Q1/dFALaILl5QEN/7DXNhG6qB6wbqDEP8I70cEK7+/5Oq3dTfexHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876911; c=relaxed/simple;
	bh=ygK/GTOtWf9v+G6I3gHgju2eILj+WRl+tz1jdeEyHXw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r6RhhJmunR0oOzC1yzltrs8YGZ6rkV96+m4YBAteZUjLK0BTdFUyIGH4FvrPE2CgJvj4N7gMy7N+k9sWJCV9i81MTsyljDMZoi5wFgnlEtud7xRXF3xrC8OM7Fvq3ZDEcIrFb/DL49oJON4C8qq9isIBtmuSAQk2akCMoGt67R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ec1i91hN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ec1i91hN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C321F00A3A;
	Wed, 27 May 2026 10:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876906;
	bh=9UwS/7RrJIe0WXNArHdZBQeq4mWEziA9weTgoJTJMJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ec1i91hNobBKW5tXjRwKj69x1i4Gm5pTsfpSdscMBFQSkqox71Ta345b+O47jmznT
	 8OTyJ4lu3v6VMtWgFZco4x8e/I/XqIqW2VjO4VXYYFPzIEhoyiJ7zF89Ym5n+RbdMK
	 gD2B8gjtNlwhTNWVwVXADyZoKrxD79OzUNoqHGrDhVnQrROKYDw16HtZq3LBi505hu
	 HFJ4I/InJM9LOQmjrtMZ/+IbK1bFW8/HMlwwzDQfrHZlWMiPTwLh2AxcIXvzhLqikH
	 EsVhgkBInK0HsOluLkz1w8p5hvW3+P6A+VjcBMEFjrhjtsB7TqD26UzvkYMRlJJckE
	 69emzhq6en9ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/24] arm64: dts: qcom: sc8280xp: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527094333.2311731-9-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-9-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:15:06 +0000
Message-Id: <20260527101506.A1C321F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the PDC `reg` size in the Device Tree to 0x10000 confli=
cts with a hardcoded minimum size in the `qcom-pdc` driver, triggering a bo=
ot warning and failing to actually reduce the mapped memory region.
--

commit f287ceb4ab3c87315be7a295204872af77c4b75d
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sc8280xp: Reduce OS PDC DRV span to 0x10000

This commit reduces the size of the first reg entry in the OS PDC DRV
register window from 0x30000 to 0x10000.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -5299,7 +5299,7 @@ dispcc0: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sc8280xp-pdc", "qcom,pdc";
> -			reg =3D <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
> +			reg =3D <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;

[Severity: Medium]
Does this change trigger a boot warning?

Looking at qcom_pdc_probe() in drivers/irqchip/qcom-pdc.c, the driver
enforces a minimum size of QCOM_PDC_SIZE (0x30000) for backward
compatibility:

drivers/irqchip/qcom-pdc.c:qcom_pdc_probe() {
    ...
    res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
    if (res_size > resource_size(&res))
        pr_warn("%pOF: invalid reg size, please fix DT\n", np);
    ...
    pdc_base =3D ioremap(res.start, res_size);
    ...
}

Since 0x10000 is smaller than 0x30000, it seems this will cause the
driver to print the warning on every boot.

Also, because of the max_t() operation, the driver still maps 0x30000
bytes, meaning the mapped region size is not actually reduced at runtime.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D8
