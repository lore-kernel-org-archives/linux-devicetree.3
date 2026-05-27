Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63C73D79FE
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876853; cv=none; b=rsLO/0UAwVYXfbq+lNgfB7/1OoSMveDOBQSMqVmPW2U2mWPa14++Y7+D7w0lncwZu2u0BkKyI2ldGPOYiuwRvMr7ePP8GOq2g6kHjNx0a4cYu5o7Ax1AM4YygPmGUPk3mxSwxuRwnEIkd9lB7i6PhiWi5RUuFg9r8VIYsNlpWF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876853; c=relaxed/simple;
	bh=mDj2scZ/ZUQOjXeY307OiLEqKCTuacbXRGWRPJyS5B0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pLwZiev2lHD0nYUsUsEtzFm7bI8/WkUnxT9+nbFZ/aRkARJhCPbs4Vr4L9Wh1FMogD5fJj728hlNZZiZaDEifUyjCw0Y7OOWUod6IteD7DI2irA2RxgjyuPvWvZ2BQKqbmrhb9wKFWFNNhEe8z/szD0BAVctYV79l3v9kj7t0NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFhv9mES; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFhv9mES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4D71F000E9;
	Wed, 27 May 2026 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876846;
	bh=iWYQSmDZkX69EcoEUEOzPSSsjJI9G9cLHAZX+ls7nVw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cFhv9mESCgCttrLtJCw4R47GRtWQ/XTeHsg3lQZc5GiWB+aKnCMjIh49UG2KFIufY
	 rNBIf4FmOgvPx0ExTh08+ZkCi+USeq4UoggMJ5Z/1urKlHeBvkkgHveXmBeOLk+gFF
	 haIpfbjXf0r6Z1l/VTMDfKpy6u5uiSvkg04lTggjRVEK+VkLS5dQvZjcmzb7tgK9En
	 hhXg5hMnd574mzalIl2Axag1RaVdcBYowxU1adCowYnVfyha8I9XaMDM+9rXWeQPwc
	 muWnXTBjNu38GcJ2fEZCbMDY3EXFNIG2LiKvbdLnd+ZVCeg1QZgkEwbJAL6xnyg0ck
	 K99X725RLA2EQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/24] arm64: dts: qcom: sar2130p: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527094333.2311731-18-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-18-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:14:05 +0000
Message-Id: <20260527101406.0D4D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the DT `reg` size to 0x10000 triggers a spurious warnin=
g in the `qcom-pdc` driver and fails to reduce the actual memory-mapped siz=
e.
--

commit 8b2158db7b47bcc229b63f723441f15fd882711f
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sar2130p: Reduce OS PDC DRV span to 0x10000

This commit reduces the first reg entry size of the PDC interrupt controller
on the sar2130p platform from 0x30000 to 0x10000.

> diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts=
/qcom/sar2130p.dtsi
> --- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> @@ -2417,7 +2417,7 @@ dispcc: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sar2130p-pdc", "qcom,pdc";
> -			reg =3D <0x0 0x0b220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
> +			reg =3D <0x0 0x0b220000 0x0 0x10000>, <0x0 0x174000f0 0x0 0x64>;

[Severity: Medium]
Will this reduction trigger a boot warning in the qcom-pdc driver and fail
to reduce the actual memory-mapped size?

The qcom-pdc driver in drivers/irqchip/qcom-pdc.c enforces a minimum mapped
memory region size of QCOM_PDC_SIZE (0x30000). During probe, if the device
tree specifies a region smaller than 0x30000, it overrides it back to 0x300=
00
and logs a warning:

drivers/irqchip/qcom-pdc.c:qcom_pdc_init() {
    ...
    res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
    if (res_size > resource_size(&res))
        pr_warn("%pOF: invalid reg size, please fix DT\n", np);
    ...
}

Should the qcom-pdc driver be updated to allow smaller mappings alongside
this device tree change to avoid a permanent boot warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D17
