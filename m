Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE311443A86
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921533; cv=none; b=VLhTvJ/IUmhCx6RiHS86Wh/NQZd3oRFac7HLk/cysA9EXL7ODbgSN/WqwN7CPnJn9romkE4YRcpC91UGzYkRW54153Uf3Soe3+H57O6ErPs+K7TscdHivsj0z77xlcVHOf7vVJcbQhuO3pRQz4cHwXm+fcdJUSvTisghz8pXqug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921533; c=relaxed/simple;
	bh=FA2QJoc+3FuL2ez39jvV6zWfWj1iMqNTA2oheLvEZMo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AoAv26ptzO/DKr5xzssR+Q/Z8scZhxeNPE9btYJFe4JTiVGEv2ddKeHfXfMRxiSMDlxig1yJoFambbn3ISy4Ik6cVpbiHJ5kuf4LefY1yrPUYzQpOqcqanoBiqcPXAo2S2IeK4NC2p7DU0Hr8RsxGcCa6IOZX+sgborbfdjpKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HaB8gZb4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HaB8gZb4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1184A1F000E9;
	Fri, 28 Aug 2026 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787921530;
	bh=JmUXarfBbiGit6NuNdtYrEtsYF6NB+6zULcQIpHqLLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HaB8gZb4jQ23vUYjEkfXErpGKo4r+mX7BzrHeS56Qc6j9V7+D3pl1c4OlllIYPXrk
	 6jA0std90uHHTrliEgZ1I7prr9cG2fDO4wW9TuNSkum6ttwqyY921m4fR44v6naQeP
	 ilaQNZZqNUnsq7afYdqDgCT3sTgoz6tN0QlWEv+kUNXsyamqFHFnW8d4t6J9W/KAYb
	 seO0vnMiNi/w5LWXwgJ5MvjdE6mPyA/qEqBmx79zZ/bNrzd20ny7rkjVZ2H3/xxzU5
	 P3UHAh+spVN9op4iUQxRYNKWR93PZglJ9T6GzGB2sUFfo+KPYBu4YEQjQ3WKD3PT47
	 ZLKsbr6h6N3ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/11] arm64: dts: qcom: sm8650: Disable Inline Crypto
 Engine by default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-3-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
 <20260828-b4-dts-qcom-disable-ice-by-default-v1-3-1d6e0c2f5a69@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 12:52:09 +0000
Message-Id: <20260828125210.1184A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Disabling the Inline Crypto Engine (ICE) node by default in `sm865=
0.dtsi` breaks the UFS controller probe on any board that does not explicit=
ly re-enable it. The `ufs_mem_hc` node retains the `qcom,ice =3D <&ice>;` p=
roperty, so `of_parse_phandle()` successfully finds the disabled node. Howe=
ver, because the node is disabled, no platform device is created for it, ca=
using `of_find_device_by_node()` to return NULL. As a result, `of_qcom_ice_=
get()` returns `-ENODEV` instead of the graceful fallback `-EOPNOTSUPP`. Th=
e UFS driver treats `-ENODEV` as a fatal error, completely failing the UFS =
probe.
--

commit 9f42720f6440c4701f3e9fd798297a81e20c12ba
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Disable Inline Crypto Engine by default

This commit disables the Inline Crypto Engine (ICE) by default in the SoC
DTSI to prevent the UFS_PHY_GDSC from remaining enabled while the device is
idle. The ICE node is then explicitly enabled in the board-specific DTS
files that use it.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index b679fd8afb7d5..384aa2203dfa3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4142,6 +4142,8 @@ ice: crypto@1d88000 {
>  			clock-names =3D "core",
>  				      "iface";
>  			power-domains =3D <&gcc UFS_PHY_GDSC>;
> +
> +			status =3D "disabled";

[Severity: High]
Does disabling the ICE node by default break the UFS controller probe on bo=
ards
that do not explicitly re-enable it?

The ufs_mem_hc node retains the qcom,ice =3D <&ice>; property, so
of_parse_phandle() still finds the node. However, since the node is now dis=
abled
by default, no platform device is created for it.=20

When the UFS driver probes, of_qcom_ice_get() fails to find the platform de=
vice:

drivers/soc/qcom/ice.c:of_qcom_ice_get() {
    ...
	if (!pdev) {
		dev_err(dev, "Cannot find device node %s\n", node->name);
		return ERR_PTR(-ENODEV);
	}
    ...
}

This returns -ENODEV, which is then treated as a fatal error by the UFS dri=
ver
instead of a graceful fallback:

drivers/ufs/host/ufs-qcom.c:ufs_qcom_ice_init() {
    ...
	if (IS_ERR(ice)) {
		if (ice !=3D ERR_PTR(-EOPNOTSUPP))
			return PTR_ERR(ice);

		dev_warn(dev, "Disabling inline encryption support\n");
		return 0;
	}
    ...
}

Because the driver only falls back gracefully on -EOPNOTSUPP, receiving -EN=
ODEV
causes the entire UFS probe to fail. Could this lead to an unbootable syste=
m for
downstream or future boards that rely on the default DTSI configuration if =
their
root filesystem is on UFS?

>  		};
> =20
>  		cryptobam: dma-controller@1dc4000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-b4-dts-qco=
m-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com?part=3D3
