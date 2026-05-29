Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFECE3EE1E9
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780069950; cv=none; b=B7Q6OLrDHekUNMFQtXTtisS2dUpb8FIuMq+QjpLuV3VaZmRR96ZuSJEfSO8PqsKEXvp3B1Aiz4rYAdsIZVTCAIvlLlM2ld8bRO0LWfna/z9vP7ALZuf8id6N+ujWLDvSxlBZOJtVHOBWum43faYDf9rQ/fJKTI5LUUmUvkmn+70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780069950; c=relaxed/simple;
	bh=o0P29fqS0b0s7Z9mIFY6VxV1lE9JYqy58psQNaOVMO0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H1dP86oExXvxpXrGGfLUFiI4eHQXXNYpgW0FpQNIAyBNglPSfNRtpasTMhQEPb78BhC715Nm+/tHboPBFsEewtFKJYUdbijOQI6SnBnQfFaiC+zC6PazErdc0FHQpjS0q9kSY/kzkYEaGLa81vibzmB5KmBObuzOkQsIZdE1DBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEMa1tdz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEMa1tdz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACDA1F00893;
	Fri, 29 May 2026 15:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780069948;
	bh=DPlF+8TnC7VhDred1c+sbQ6uEIyAoeh80BqzBLjM7zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mEMa1tdz+AG7RPqviSYTTVaWmG7uNTETpubOJb9lIYUuqgTrY/cZVb3r61AYx8fjH
	 JVTmqIe2obX1PVJDqaAoVwPAd0xfTVbKDdLz+CynRtCRQpM3oGCpSCNDMfFNGXApXH
	 ab4b2oQS/dPSLnimTF3pBubUmsrbv2F1EeZLxBkWVJYpsT5s9z1V8KxnJrkPumHXQp
	 s7NZ3bTLAYC6oV5BoNAUynnJm+Hl34h54h5g4uU7X4kN+Bij3AkRlvYch2dLRriBLD
	 iyHOsIQVhZh6uf1tFu22LFPgL8BWXgYXBBkCy6rU1XJKqfV8b+mylRNooX0bWgp0wT
	 2Dur8vpYuMGvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: describe PCIe Ethernet
 controllers on NanoPC-T6
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Pardini via B4 Relay" <devnull+ricardo.pardini.net@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-1-49700248143f@pardini.net>
References: <20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-1-49700248143f@pardini.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 15:52:27 +0000
Message-Id: <20260529155228.5ACDA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardcoded and incorrectly bounded PCI bus numbers in device tree=
 for dynamically enumerable PCI devices.
--

commit 79c9b71b546cb8ecf96eb0ea66c76b17346368b3
Author: Ricardo Pardini <ricardo@pardini.net>

arm64: dts: rockchip: describe PCIe Ethernet controllers on NanoPC-T6

This commit adds device tree nodes describing the two on-board Realtek
RTL8125BG NICs on the NanoPC-T6. It attaches ethernet0 and ethernet1
aliases to these fixed PCI function nodes.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> index 84b6b53f016ab..04c4479f08170 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
[ ... ]
> @@ -635,6 +637,20 @@ &pcie2x1l0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pcie2_0_rst>;
>  	status =3D "okay";
> +
> +	pcie@0,0 {
> +		reg =3D <0x200000 0 0 0 0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		device_type =3D "pci";
> +		bus-range =3D <0x20 0x2f>;

[Severity: Medium]
Is this bus-range declaration correct for a bridge?

The first value of a bridge's bus-range is its secondary bus. If the Root
Port is on primary bus 0x20 (as defined by the host bridge), setting the
secondary bus to 0x20 sets it equal to the primary bus, which violates PCI
topology rules. Furthermore, the child device is declared below on bus
0x21, which contradicts this declaration.

> +
> +		rtl_eth0: ethernet@0,0 {
> +			compatible =3D "pci10ec,8125";
> +			reg =3D <0x210000 0 0 0 0>;

[Severity: Medium]
Does this hardcode a dynamic PCI bus number?

Using a specific bus number like 0x210000 instead of a relative address like
<0 0 0 0 0> can cause problems with strict parsers or bootloaders (such as
U-Boot) that perform dynamic enumeration. They might fail to match the node=
s,
which could prevent device tree aliases from resolving correctly and break
MAC address injection.

> +		};
> +	};
>  };
> =20
[ ... ]
> @@ -651,6 +667,20 @@ &pcie2x1l2 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pcie2_2_rst>;
>  	status =3D "okay";
> +
> +	pcie@0,0 {
> +		reg =3D <0x400000 0 0 0 0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		device_type =3D "pci";
> +		bus-range =3D <0x40 0x4f>;

[Severity: Medium]
Is this bus-range declaration correct for a bridge?

The first value of a bridge's bus-range is its secondary bus. If the Root
Port is on primary bus 0x40 (as defined by the host bridge), setting the
secondary bus to 0x40 sets it equal to the primary bus, which violates PCI
topology rules. Furthermore, the child device is declared below on bus
0x41, which contradicts this declaration.

> +
> +		rtl_eth1: ethernet@0,0 {
> +			compatible =3D "pci10ec,8125";
> +			reg =3D <0x410000 0 0 0 0>;

[Severity: Medium]
Does this hardcode a dynamic PCI bus number?

Using a specific bus number like 0x410000 instead of a relative address like
<0 0 0 0 0> can cause problems with strict parsers or bootloaders (such as
U-Boot) that perform dynamic enumeration. They might fail to match the node=
s,
which could prevent device tree aliases from resolving correctly and break
MAC address injection.

> +		};
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-rk3588-dts=
-rtl-eth-describe-dt-alias-v2-0-49700248143f@pardini.net?part=3D1
