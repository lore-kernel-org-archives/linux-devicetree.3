Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA7377A84
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048661; cv=none; b=Q2LIQrVpuX72mCuWuEnb5EeuOPxYc8iMhR16srW3MEM3saTSJcAWfD2env6OZ0Q2BygytD/jHI7RcXnkdZE2+9OuOjYU7xi3m+CwoJRuy/p2CzV1fGB9gfsHwPa0cxGw9iaQrW+Pcb/5yx0OUVh2WWaiDvDcpfMKP/1GAg1XX/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048661; c=relaxed/simple;
	bh=7pzS66mW6e3ALZNDynhB6cB41mv4jlT4ksSfm1l/Pu8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aijBC4JG7Vf8vzdtUFk2zo/fsWPUgE+wRSgjuVIcCJe+JwJwSK0/bzEySP8uOlZxy9NQ64SD855CA1ESEM2O+YPLddqWqVfUzzHjLcXoSJttbVIYAOB/V7z2frm1me19KUuXyBgu2tGyGHa79GtBDSZ1wYWfUT3z4l5q6LTpGo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgJdYZxs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgJdYZxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CA21F000FF;
	Thu, 10 Sep 2026 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048659;
	bh=WtVaw91JUmsf/WwTVF4TiXTMNSlQfX3sXEJl6ot7ZSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QgJdYZxswdvQ4gdAO//CVCP1QXka1+w1+8hywHARqWMrKihn3aEMr3WgtkJ7+D0gq
	 UqX6esDwF0bXfiMA47y1x3jqw+luj1xcn9/OuRa8rZeSfQ3Qpu3BMZANZ1c8AWhE5C
	 WlVrSOcz9jCALEYrxXlpR93EI7tF77kEBXfiQC1iaXadGFg8LKA4EE6o3hjtZzlpxg
	 QZGZ7ESPdtHXaFT2cOYw2LzN3Eg4sk3qESR4aDKU5JRfktVG5MV0XS28LrnPjbyfgQ
	 fJgN+ELD7GYe1OJ1XZkQfIF6woQfxybobsw5AGrEAVOL5aB6U0/wNNyXPgAdxtx0W4
	 02Hy+SXethwug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 30/34] arm64: dts: qcom: talos: Move PCIe phy and GPIOs
 to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910-root_port-v1-30-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-30-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:57:38 +0000
Message-Id: <20260910135739.76CA21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Moving `phys` and `reset-gpios` into the root port child node acti=
vates a pre-existing PHY initialization resource leak in `qcom_pcie_parse_p=
ort()` on probe deferral.
--

commit 97d4c74a5631a23e99d2209733340334556228ea
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: talos: Move PCIe phy and GPIOs to root port node

This commit moves PCIe PHY and GPIO properties (perst/wake) from the RC
controller node to the root port node (pcie@0) in device tree files for
QCS615 and Talos.

> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/d=
ts/qcom/qcs615-ride.dts
> index 43f110ba3a7c5..4edd2b1bb03af 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
[ ... ]
> @@ -444,15 +444,17 @@ &mdss_dsi0_phy {
>  };
> =20
>  &pcie {
> -	perst-gpios =3D <&tlmm 101 GPIO_ACTIVE_LOW>;
> -	wake-gpios =3D <&tlmm 100 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 =3D <&pcie_default_state>;
>  	pinctrl-names =3D "default";
> =20
>  	status =3D "okay";
>  };
> =20
> +&pcie_port0 {
> +	reset-gpios =3D <&tlmm 101 GPIO_ACTIVE_LOW>;

[Severity: High]
This isn't a bug introduced by this patch, but does moving reset-gpios into
the root port node activate a PHY resource leak during probe deferral?

In drivers/pci/controller/dwc/pcie-qcom.c, qcom_pcie_parse_port()
successfully gets the PHY and calls phy_init(), which increments the
init_count and enables clocks and regulators. Immediately afterward, it
calls qcom_pcie_parse_perst(), which requests reset-gpios.

If the GPIO controller probes later, this returns -EPROBE_DEFER:

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_port() {
    ...
	ret =3D qcom_pcie_parse_perst(pcie, port, node);
	if (ret)
		return ret;
    ...
}

This error path returns without calling phy_exit() and without adding the
port to the pcie->ports list. As a result, the cleanup path in
qcom_pcie_parse_ports() also fails to invoke phy_exit().

This permanently leaks the phy_init() call on each probe deferral, meaning
the underlying clocks and regulators will never be disabled, even on system
suspend or driver unbind.

> +	wake-gpios =3D <&tlmm 100 GPIO_ACTIVE_LOW>;
> +};
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D30
