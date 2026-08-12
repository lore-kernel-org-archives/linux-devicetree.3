Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B608D3905EC
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524386; cv=none; b=irZzG5LASKu2NogK5h5Xwd1Fr0EsdxsOw2Qe3vEzQ4xsje5Id5v/79LCLxY0pAPOKbV6iLHKDLAaGLBL4Q6A8+prfEo30bH0ymUa9wYmw1P+KFnV15ebSLAUm/H7fxyISWuDuGeEvJaLoUOAwBmIs65iwsxejeYrcfJsfSyRUt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524386; c=relaxed/simple;
	bh=R2HzQYA4HivJOBrZ3ZKQFnEHkCR9UvID0smOs+++u50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BFfvcEuySuT0BXrxbJdAaoEbV8AjCyVZ6H1XbsohibcYrRjiV+2OnT6Q75MI21Myk3MKQ78dJ6b31TveulOcxG76n1EME86Of9h43DCqlU8L1RKTztT+i3p4zy/oRNAeFFe3Lpv9nx3q0ISpPn+O5DyLwpTvskGmCKhZRMZE/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jeT7K7ds; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeT7K7ds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159AD1F000E9;
	Wed, 12 Aug 2026 08:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786524385;
	bh=JAjuz0Ehz+atJ8Jk89iLsOa/c2khXoFnRQBnu562w/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jeT7K7dsCK+La/XpccGb8kkVm4MttvMhN+bGBEvQGthp09rGvmuj28oj0Oiw9O/uc
	 wKnvExJ9qp/oswYUxMmXFqJ2AxKV8zFKME5P6yYdN/1E/j8ZeYf4x/WDEFyZmNKO3b
	 xkcDVuTC68r+B5o2Tx+KsmaXFcngP75uQv82e0aKxbcWY8MGqqhokA3quPTdbGAuhH
	 /uSyE9JqNSKaeiFu9UAE0K2TEflzRBXIcBAKlbQDb7cmRyq22VRZFxytBZ36bHM5QU
	 T9DJC/ZbumA5Rg5bTYDQ0FX22XK1TS3BiKWiPTP6xHQeYZTSsRPpz+PEu8WOHnz9Xw
	 /LJCJTAqsdDdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add missing USB clock, power
 and bandwidth votes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Ociepka" <greg@ferrisoft.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812083522.774711-1-greg@ferrisoft.com>
References: <20260812083522.774711-1-greg@ferrisoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 08:46:24 +0000
Message-Id: <20260812084625.159AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Early return in `dwc3_qcom_remove()` on `pm_runtime_resume_and_get=
()` failure bypasses device teardown, leaking interconnect paths and causin=
g a Use-After-Free.
--

--- Patch [1]: [PATCH] arm64: dts: qcom: glymur: Add missing USB clock, pow=
er and bandwidth votes ---
commit e8a88eddb13f0c6c7f86603fb6358155107b782d
Author: Greg Ociepka <greg@ferrisoft.com>

arm64: dts: qcom: glymur: Add missing USB clock, power and bandwidth votes
   =20
This patch adds missing assigned-clocks, required-opps, and interconnects
properties to the four USB3 controller nodes on Glymur. These changes ensure
the controllers properly vote for performance state, configure the master
clock, and request USB-DDR bandwidth.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index f04058d2e0891..fbbc82550c442 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4584,9 +4588,18 @@ usb_0: usb@a600000 {
>  					  "ss_phy_irq";
> =20
>  			power-domains =3D <&gcc GCC_USB30_PRIM_GDSC>;
> +			required-opps =3D <&rpmhpd_opp_nom>;
>  			resets =3D <&gcc GCC_USB30_PRIM_BCR>;
> =20
>  			iommus =3D <&apps_smmu 0x1420 0x0>;
> +
> +			interconnects =3D <&aggre4_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;

[Severity: High]
This isn't a bug introduced by this patch, but adding these interconnect=20
properties exposes a resource leak and use-after-free in the driver's remov=
e=20
path during unbind.

In drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_remove(), if
pm_runtime_resume_and_get() fails, the function returns early:

	if (pm_runtime_resume_and_get(qcom->dev) < 0)
		return;

	dwc3_core_remove(&qcom->dwc);
	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
	dwc3_qcom_interconnect_exit(qcom);

This early return skips dwc3_core_remove() and dwc3_qcom_interconnect_exit(=
).

Because the qcom structure is allocated with devm_kzalloc(), it is freed=20
immediately after remove() completes, leaving the active dwc3 core operatin=
g=20
on freed memory. It also leaks the newly populated interconnect paths that=
=20
this patch enables.

Could the driver's error handling in dwc3_qcom_remove() be updated to ensur=
e=20
cleanup happens even if runtime resume fails?

> +			interconnect-names =3D "usb-ddr",
> +					     "apps-usb";
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812083522.7747=
11-1-greg@ferrisoft.com?part=3D1
