Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B369A3EE1F8
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876961; cv=none; b=aQk1aAYY4Nmqa4fX/4SQjdZoj4JD5fv07DWmlO/h9FA5UL09hq0AXgAmVFRTupXavVHs5Q7L9BB10z5QH5JghQhojRi5Y/UOATzhK/r/tRFzSDM8WwiMKAIbJUKiwla4ZYR99bRvf/Lh0ypo0ngd323hnse0TG+MBjN0uVZs+zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876961; c=relaxed/simple;
	bh=sfEn9zZ7T6pRS1cEdHcS0ri+04EWy3AE9ZFbMcwmIyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o87hipPYAkzF7GVglbgEBibgegtynLqDL3NPoaP+K1u+8G1Oqad6LQIVgNueGb+yTt4/zUtyLb/hFgTcGsC83aA5ulDBHOoFw1RuAY5iEDt+4W0WlsmEz5rE5w0QI8TK+sL9XsdGwNCwjEBqiuY7zxrobyEOlNc8CEqpN4uXEl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mz0wF+ER; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mz0wF+ER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CC61F000E9;
	Wed, 27 May 2026 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876957;
	bh=DQZJgCJrJtezWm2j0byDOSZExmbYqOO4kG95/p3UkY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mz0wF+ERcz3Sz1KsFJ20oOohLbqF7kqa3hhJ7pNiCVGWGu0k5ivJjAtbQ5j7/LQaU
	 iQsO9HzIOq0Bi4HXhLvpsjI9ze8hrFOfoCBNrvKLbtOpY68G5o2tO59HjYumLVBc8t
	 eAVAoU5WdsIzLhdqK9f0wy0xaxTNfRoTsxiN1p9kjpAk5EG6ZJJRRWVKR0Kz7nVqPk
	 GwnizSD7uvHs5mm2Dbw7rMGc1qCelCgy+ah+T4DApIjeBYIn6xCqa3jjVyP55dE0y4
	 WMCCVtp8VQ1tkwYh7sTa5A3PWL/PoNfbEbz1s/0F+6anOPo3XxV2pjdYhUrZjqxI5e
	 OtQlIhAOkJCVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 24/24] arm64: dts: qcom: eliza: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527094333.2311731-25-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-25-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:15:56 +0000
Message-Id: <20260527101556.B3CC61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the PDC `reg` size to 0x10000 triggers a hardcoded warn=
ing in `drivers/irqchip/qcom-pdc.c` and fails to actually reduce the mapped=
 region size.
--

commit 5004f072e69f0ca2826142cbc32ed05f15a06f65
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: eliza: Reduce OS PDC DRV span to 0x10000

This commit reduces the size of the first reg entry in the OS PDC DRV
register window on eliza from 0x40000 to 0x10000.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 4a7a0ac40ce62..24f92ca9f9ef4 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -885,7 +885,7 @@ lpass_lpicx_noc: interconnect@7420000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,eliza-pdc", "qcom,pdc";
> -			reg =3D <0x0 0x0b220000 0x0 0x40000>,
> +			reg =3D <0x0 0x0b220000 0x0 0x10000>,

[Severity: Medium]
Does this introduce a regression by triggering an invalid reg size warning
during boot?

Looking at drivers/irqchip/qcom-pdc.c, qcom_pdc_probe() calculates the
mapping size like this:

    res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);

where QCOM_PDC_SIZE is defined as 0x30000. If the resource size from the
device tree is smaller than QCOM_PDC_SIZE, the driver issues a warning:

    pr_warn("%pOF: invalid reg size, please fix DT\n", node);

Since this reduces the size to 0x10000, res_size evaluates to max(0x10000,
0x30000) =3D 0x30000. Will the driver still ioremap 0x30000 bytes despite
this change, and emit the warning on every boot?

>  			      <0x0 0x174000f0 0x0 0x64>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D24
