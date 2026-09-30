Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A746A3F58E5
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750420; cv=none; b=JHGskCe15A2Eu/x799V207cBR0QmSoOcGobkkxglqWaD3+UalGkBaZUnYBmIWwB15vDN6K+Yaqe+9YFwqlhZzRGyBN0zHrt1aNBS6J88buZCV6D/5NIxI6XpWPNEhlXG/CGXvP9RaW8/VVh+olg9cLTqxTIsDnDnKXfWmBuIJHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750420; c=relaxed/simple;
	bh=rm4z/xRdS0JuAtlmB8mtm4bDEzVLNztc9OtoKQgKYXg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BI1fGW57xixY12vMt0gLR8jKggbQvB9IcvjLMbCb7BGKkz7KvvQ9k9S8YYhxkoAD4+6wZH78e0Kqm1FYdgmDM4H+duA08crJ+VxZKrXVs/t39GR+9XkT2kX75cMVgLKq+P/1p03UwPgAJ4ds2F1t8raYfStTG4bSiGCaLQBahEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJfb1UUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJfb1UUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FE61F000FF;
	Wed, 30 Sep 2026 06:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790750418;
	bh=7st9MSySEWbkKedhU/BUDSWnxrHG3z/6EzWPmMzFiv4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJfb1UUCzXTPJc6h8WOBf415dZ5/13Zobvh1GBBYFOYgo5pLw1nurNwaeeeLnYOnn
	 bjeq+iLBATww6puEaNsZzo/LYLHkDaiE24fmW7sHXOqSj8cXoHaPWiAVXRzrOXMYHQ
	 KN8fthjQzJiRdDR4Bivajchu/k6fDrBaGhOPr3XE0KGhx4IUDEbFmiJIimFgzUOJ4z
	 sXF0NkxpylqmF7Z+rBTJMdiZwEZ9NoZz+qV/ifD+x2eC+42gKdtwtpGcR2vOqW7z37
	 nZ1puy0sD4eEYhSHNAigVzYxDqc/ECCXEf/TZSuJRylQ7EGICS/nLSSvJotw95zVSR
	 8qOR4O+s6Daqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: maili: Add base MTP board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929-maili-dts-v2-5-965688646c4b@oss.qualcomm.com>
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
 <20260929-maili-dts-v2-5-965688646c4b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 06:40:17 +0000
Message-Id: <20260930064017.E5FE61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: qcom: maili: Swapped vdda-phy and vdda-pll supplies for usb_d=
p_qmpphy
--

commit 52dffe9df955d99886bd7c5b77879c715dff5003
Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

arm64: dts: qcom: maili: Add base MTP board

This commit adds initial device tree support for the Qualcomm Maili MTP boa=
rd.=20
It enables booting to shell with UART console and configures features such =
as=20
UFS, remoteprocs, USB, PCIe, SD Card, and PMICs.

> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts=
/qcom/maili-mtp.dts
> new file mode 100644
> index 0000000000000..1fdc91e03271c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts

[ ... ]

> +&usb_dp_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l3g_1p2>;
> +	vdda-pll-supply =3D <&vreg_l3i_0p9>;

[Severity: High]
Are the regulator assignments for vdda-phy-supply and vdda-pll-supply inver=
ted
here?

The vdda-phy-supply is assigned a 1.2V regulator (vreg_l3g_1p2), and the
vdda-pll-supply is assigned a 0.9V regulator (vreg_l3i_0p9). Providing 1.2V
to the core PHY logic might cause over-voltage hardware stress or damage.
Conversely, providing 0.9V to the PLL could result in an under-voltage
condition that prevents the PLL from locking during initialization.

Could you confirm if these regulators should be swapped to supply 0.9V to t=
he
PHY and 1.2V to the PLL?

> +
> +	status =3D "okay";
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-maili-dts-=
v2-0-965688646c4b@oss.qualcomm.com?part=3D5
