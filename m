Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90DC2BFC60
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477014; cv=none; b=eoa/+IhacrViMafrghJVw/VYtqzpohm3Af80Hg8/8kPc65Or9LZP29nq+NpKG3Ssi/R/rwI0lO6vELbY9mCPk/o1nhp+cQM98UIvgo3EYJy3yqEX8MEMeddPMUcfQ3Sz/L/eeb6sOX8dFPsxW6Hmj0zAYANGv4evikqPlt+eKcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477014; c=relaxed/simple;
	bh=isAN5nKx3wYrYeprEHbLJBY4eHWrL1nJkCyPuEKrF2E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IWxqeRGpX9OzsdZQ24DRTbUcv6ttMIKsKit4sWwee/REIAAhyiaRxOSwnnc8ulB+iQ1gTIFnVFdzSiPgrbf/rLOUYOi06ODGoALknalBuDmAar8bWIxmXHT1SPnSzOtnzoQEKvBkuDq3a2ZbZh/b6ZRuBPO1xS85FysYW2pBi5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRWIruui; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRWIruui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B0C1F000E9;
	Fri, 22 May 2026 19:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779477013;
	bh=mFAcp27og0cjzpa1aXmWe2jJV1nm7DfxIJJcZgl/iQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hRWIruuiPRUVodyQp//b7nVCnHYHtDUYW3grShxVHbfWoP9yQzbqWz7sLiUX2ZWbE
	 wPnAe5f7RUU7mRCIDarYPrzFi6p66RrwvX9hN6+bOxtHD/JICjjkdas0kS0OsPhqNg
	 E+4LJt5+ISwaheTnxLxK8DhAaA7QSmBS9zASRQ0wQmDBw7ZtWYdixeAT2wa9M96wOy
	 caWQL6HKkmLRtP/0CpGD4Hrycwbc4NmfU4VDA6XLo86HxN8vbGexBtODi6yMKXXfLs
	 a7Px1iaZHP+YvAXD2cMeDeRRoWKeo1xk+m4prS/FDGBsfHcn+uEjhw3YoQUgAo38kd
	 yXBRTquv3Ka2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 19:10:12 +0000
Message-Id: <20260522191013.23B0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to add PM8005 PMIC regulator definitio=
ns, but the patch explicitly disables the PM8005 regulators and provides no=
 configuration.
--

commit b8207cdfd80924e291ee52448a105708aa7b6a09
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: Add Shikra CQ2390M SoM platform

This commit adds the device tree include for the CQ2390M variant of the
Shikra System-on-Module. It integrates the Shikra SoC and includes PMIC
regulator configurations for the retail SoM.

> The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
> regulator definitions specific to this variant.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-cqm-som.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi

[ ... ]

> +&pm8005_regulators {
> +	status =3D "disabled";
> +};

[Severity: Medium]
Is the commit message inaccurate, or are the definitions for the PM8005
regulators missing from this patch?

The commit message states that PM8005 PMIC regulator definitions are
added, but the code explicitly disables them without providing any
configuration. If the SoM variant requires the PM8005 regulators to power
hardware components, will leaving them disabled result in runtime failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-shikra-dt-=
v3-0-80ffde8a3dc4@oss.qualcomm.com?part=3D3
