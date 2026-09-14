Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04544229A6
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377955; cv=none; b=Ge2paUhVCJXvCMoCCWtNlWPW+AuXcGK5H0uTGKGtLfk9IiCCjnErGQcKgnYydUbIvSmkX1hqd58oRkOZAsrrQNIGNGEbfZrb9VwtsYCYUVsfDhU0/+oFPv8oML1+JT7/ncyazjDxUvXw1mchNuQ7HmHPPdbU+4eyGGVPAfDfiQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377955; c=relaxed/simple;
	bh=zYysEAIabisNzW63F1hfHbV1u7t0rX30oFi1bu3s7wA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=feqT2aoFVZx9CiqkEICtFCHdv1tdaRz3DFYZ9N9RA3rQoaxJJVDB2Ex/NsURm603T2r7n6xV9J/tng4gkjGQJuAcLob4vJGLG3siNhyPKBmtBEDa99+h856MImYi78kegPmR3MzqeCB3z2X7JotgkzZTsGVSdaiaqg4kAUCmWB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8W0WubE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8W0WubE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2A01F000FF;
	Mon, 14 Sep 2026 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377950;
	bh=GA04dEedMPTkcWN2DQCP3LVqe/3q83/unAIHu/YEwE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z8W0WubEbUHELfmkySumRIBV/FaAR+b6FF2hZMPI4WFvLDAWQBwnnnfPRqN5hmW5M
	 kpjQSG/PHCZ71cDQ7Ykm/jFUN40C5e8kqwRkeyQW+wVmrEn2+Gg7YDJp+/Zyr79G2t
	 YL/Ir++DTbxZ/f203UeM5zKdORF9pHkh/cy/0P2uH0YXjcF7UAse1uy6DnFlkziGdw
	 HASzAcemauYRcdu4J2e3xwLo5G2t1zKyrvohqytI0LX5pHA50Dq9mOXwAzAQJjOOdj
	 EZo2SE6Fsis0Fxbk0En3/96zphfpNLO9FKmJHER6EEuFiE5+GFkD8lDk+m4I8ZB85l
	 XVdYWDcfxxTkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: monaco: Add compatible to the
 PCIe Root Port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Deng" <wei.deng@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914-b4-monaco-evk-m2-v1-v4-1-dab83b048d03@oss.qualcomm.com>
References: <20260914-b4-monaco-evk-m2-v1-v4-0-dab83b048d03@oss.qualcomm.com>
 <20260914-b4-monaco-evk-m2-v1-v4-1-dab83b048d03@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:25:49 +0000
Message-Id: <20260914092549.EA2A01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch introduces an inconsistency in the SoC device tree by =
adding the `compatible =3D "pciclass,0604";` string only to `pcieport0` and=
 omitting it for the identical secondary root port `pcieport1`.
--

commit af4d1e90e3b54337cb2c17a523874c97e4e2e7af
Author: Wei Deng <wei.deng@oss.qualcomm.com>

arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port

This commit adds the compatible string pciclass,0604 to the pcieport0 node =
in
monaco.dtsi. This allows the PCI subsystem to associate the DT node with the
PCI-to-PCI bridge device, enabling downstream DT nodes to be matched to PCI
devices.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index cfe39f923224f..e18b3ed54cd9e 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2394,6 +2394,7 @@ opp-32000000 {
>  			};
> =20
>  			pcieport0: pcie@0 {
> +				compatible =3D "pciclass,0604";

[Severity: Medium]
Should this compatible string also be added to pcieport1?

Looking at the device tree in arch/arm64/boot/dts/qcom/monaco.dtsi, there i=
s an
identical secondary root port that misses this update:

			pcieport1: pcie@0 {
				device_type =3D "pci";
				reg =3D <0x0 0x0 0x0 0x0 0x0>;
				bus-range =3D <0x01 0xff>;

If a board design utilizes pcieport1 and adds a downstream endpoint, wouldn=
't it
fail to associate the DT node with the PCI-to-PCI bridge device in the same=
 way?

>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-b4-monaco-=
evk-m2-v1-v4-0-dab83b048d03@oss.qualcomm.com?part=3D1
