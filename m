Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF2B3515C5
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 20:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157303; cv=none; b=gTGtF3hoS/PyM8CY9Z1UHh67I6gJIxpZQt5Qxt5cKa7tJYTJT+f3Xac+OckKZx4DWAuz0PohY5vPe0Wy88DvDxoLd/1cNwo03CR3DZ8JYjDt/hwC2UgpWxXRlFXqMFya4VtQXMmdaKkwtM5Xkme19OrZMP2l1q6kG7SVWjzhhDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157303; c=relaxed/simple;
	bh=8ktE6biTdL8LudMZbtJD1lA2s6w/PCCgBDZ3+t5cHPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GUWDFbtL4dS4LtN1gjkVjAYH7ACudsjDFAwBe1IxdOnRKQ6pHpaO3JEAXV+QeOtOpunRjOt15ij20gfvy8DXJKy9hZy9LfoH/5kUvCt3Y0aptwF6LXAaHy838KDiuvMDizusiMSTQ+W60bFLqrY+/MxVPz/KJmyVhMJWhkGaTGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZfEZ5h6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZfEZ5h6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347B91F00893;
	Fri, 11 Sep 2026 20:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789157298;
	bh=LGoVZqMYPQl9tsL4ik4Si/s+xsTKVeyUXcHs05BzzxM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iZfEZ5h6LDO7cAnbFu8RV9K80F7T7PtqQcz+sLKAVgc1sfu7Cadh9tJgQQnIT6eo9
	 U7xHzWgrT1dHy7Op9ZOluo8e9G3QUdK745a2j0Gj6AOZGBZjzVdIKVTX3NMJGVta6n
	 71J8VJFOPL1KKrs5GEwcY//+A/Be67K1s/0AWCsTfSuWN1MBucOLaLUlRcekjAtr5o
	 F7EPABLX4Wd7hIXQ19urJ+EyttfIoVyHshWEmRKlx0FSm7Sj8qt3OViVeL3+KdcM/3
	 JqETdoxyVUPubRVuyPuWjZTEDwQumXWCUGrXeHVWZyyvEHDBPhpVCDsf+Pt4QId93j
	 zNTL0i4RDSGiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on CM3588-NAS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Pardini" <ricardo@pardini.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-4-c1b9e5f10cd6@pardini.net>
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-4-c1b9e5f10cd6@pardini.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 20:08:17 +0000
Message-Id: <20260911200818.347B91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree Topology Error: Conflicting PCI bus assignment for Root=
 Port and its child device
--

commit 8bfbba94d98cec905dbfa4da80cf6195fd8103fa
Author: Ricardo Pardini <ricardo@pardini.net>

arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on CM3588-NAS

This commit adds the fixed function node for the on-board Realtek RTL8125 N=
IC
and attaches an ethernet0 alias so that U-Boot can inject a MAC address.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.=
dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
> index f4c34da61c4df..96b3b245e0866 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts

[ ... ]

> @@ -512,6 +516,23 @@ &pcie2x1l1 {
>  	status =3D "okay";
>  };
> =20
> +&pcie2x1l2 {
> +	/* on-board RTL8125 2.5GbE NIC */
> +	pcie@0,0 {
> +		reg =3D <0x400000 0 0 0 0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		device_type =3D "pci";
> +		bus-range =3D <0x40 0x4f>;

[Severity: Low]
Does this create a conflicting PCI bus assignment? The PCI-to-PCI bridge
pcie@0,0 resides on primary bus 0x40 but also claims a secondary bus of 0x40
via this bus-range declaration.

A bridge cannot have the same primary and secondary bus. Furthermore, its
downstream child device ethernet@0,0 is explicitly placed on bus 0x41 below,
which contradicts the bridge's claimed secondary bus 0x40.

While the Linux PCI subsystem typically ignores this DT property on bridges=
 and
dynamically re-enumerates the bus topology correctly, could this cause issu=
es
for static DT parsers like U-Boot that this patch relies on for MAC address
injection?

> +
> +		rtl_eth0: ethernet@0,0 {
> +			compatible =3D "pci10ec,8125";
> +			reg =3D <0x410000 0 0 0 0>;
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-rk3588-dts=
-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net?part=3D4
