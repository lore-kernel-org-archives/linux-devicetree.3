Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7FB427FB2
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921559; cv=none; b=AXfSbzcPtnhPRIspLHgGz1NBvE6FojluPkjNLe3/qPw4EaxmMsnC95BI/5SxstZOfRMKY2eTbYoL6hxOLqRN4L0A0YTGNic/8V7bHuj2L+8tKdpoCrYiu0ol9AalyUPq+S0nSH+B72AivDSgT1AtzNqIp7ABpMh3hCI/yn+sN2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921559; c=relaxed/simple;
	bh=YZLDsf+apEy21nh1OK3NsYmcY7ujCqI+xJScp3kxNlU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ig3cmxDQYsFqZhPjMluUpanQ+DO1Y49TIrNj/zRg+TnTCJyIsUaxDcBeLON0699CamJHTtwH28JkKe/MfX+dyhm4Oxt4Er9p4LOLzEtY/OzF+KxTooyc8fz6WPTvKbRkkD219QDdg1UDv/qt/l4O8WC/MhY+gXrujuIp6NpPmBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orhXMV2L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orhXMV2L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53C41F000E9;
	Fri, 28 Aug 2026 12:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787921555;
	bh=svjz2q3D3W8Fqw1x9ZtV6U/zXoFrBnpOn6REZq8E+0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=orhXMV2Le69Qw0PQ6ulBS+yuHVQ3POCkhmVvx8869AMlwXYHidqE5US3GjXUL+6rM
	 WBKL0x06awa4vsRRVNEzsExz7iGr95nu/f74Q5wKbHaa7dtE57ItE1De6u2t+xxzzF
	 LPAbMVJwGTh6RgGh+oLQsstONkHkKvZiYto+8hyNxbGDNMlK+DI9S1Ri7MKRVDZSNU
	 oVz+jTPF82nX7Ox7Wc26H/NTL7cWt5G3meMFRXc/y3EGZ4gRSzgwry2CCdQX3P262W
	 IE7zT1K3m3SwAxcRdQuJbBRKk9mA436Lq8Yu2B/LgphFfgjzjODi+Vz3xvb/6Z5yH+
	 v2uOzv6lb/9fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/11] arm64: dts: qcom: sm8450: Disable Inline Crypto
 Engine by default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-2-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
 <20260828-b4-dts-qcom-disable-ice-by-default-v1-2-1d6e0c2f5a69@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 12:52:35 +0000
Message-Id: <20260828125235.B53C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Setting the Inline Crypto Engine (ICE) node status to "disabled" b=
y default breaks UFS controller probing for out-of-tree boards and fails to=
 resolve the power leak for boards using ICE.
--

commit d9ad1358857797b30ecd80f68a27f70909a989e9
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8450: Disable Inline Crypto Engine by default

The Inline Crypto Engine (ICE) is attached to the UFS_PHY_GDSC, and the
driver currently lacks runtime PM support, leaving the GDSC enabled during
idle periods. This commit disables the ICE node in the SoC DTSI and re-enab=
les
it in board DTS files to avoid the power leak on boards where it is unused.

> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> index b8793482b1815..6f9d5a87f1c4c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -5370,6 +5370,8 @@ ice: crypto@1d88000 {
>  			clock-names =3D "core",
>  				      "iface";
>  			power-domains =3D <&gcc UFS_PHY_GDSC>;
> +
> +			status =3D "disabled";

[Severity: High]
Does disabling the ICE node by default create a configuration trap for
downstream boards inheriting the UFS phandle?

The ufs_mem_hc node in sm8450.dtsi retains the qcom,ice =3D <&ice>; propert=
y.
If a board enables UFS but does not explicitly enable ICE, the ICE node
remains disabled.

Because of_qcom_ice_get() doesn't check of_device_is_available(), a disabled
node results in -ENODEV instead of -EOPNOTSUPP:

drivers/soc/qcom/ice.c:of_qcom_ice_get() {
...
	pdev =3D of_find_device_by_node(node);
	if (!pdev) {
		dev_err(dev, "Cannot find device node %s\n", node->name);
		return ERR_PTR(-ENODEV);
	}
...
}

This error propagates to ufs_qcom_ice_init() where it is treated as fatal:

drivers/ufs/host/ufs-qcom.c:ufs_qcom_ice_init() {
...
	ice =3D devm_of_qcom_ice_get(dev);
	if (IS_ERR(ice)) {
		if (ice !=3D ERR_PTR(-EOPNOTSUPP))
			return PTR_ERR(ice);
...
}

Since -ENODEV is not handled like -EOPNOTSUPP, this completely aborts the U=
FS
initialization, leading to a fatal controller probe failure. Will any
downstream board utilizing this DTSI without overriding the newly introduced
ICE disablement fail to boot on this kernel?

Furthermore, for boards that do enable ICE, does the GDSC power leak persist
since the qcom-ice driver lacks runtime PM support?

>  		};
> =20
>  		cryptobam: dma-controller@1dc4000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-b4-dts-qco=
m-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com?part=3D2
