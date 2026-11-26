Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711335;
	b=sccvS5vYYdBvIT9avfj8ftsdHTrbAM3374ntFTgF4XBoFpubbAOMCYy2SMm09ZQo4J02
	 jeT/woGp8zNCG3IH44M1m8OcAnJl1ny84pEJS/arovTnDO0MoxV6pji+JRRUkmHExzZbm
	 tZiXTCexOQgvH5DFG4OFOHW0MwljxPZCt4Xplpmx1hGhMSFnpIKVvXNFwvkDo7bUq3GmT
	 pU76l5LIfUIrQ0+xO9BBlwpYMaFOOvoLCmcS9jHxLjEqvp+tN1fpCRMtl2DXLd/XSvQ8K
	 1u5QuVzLJWxW3svn0+/wh9YWJPkMgLfGT4hvbZ9/NKB4lAN2/9W35knPZv78+2HdlDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711335;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7UrMtHKhG9WiunQX3UGq7pmIGz/YdEOXfWy7Oy8Bdys=;
	b=KMgkDa3WLnxIvEMFehxUgL2VcmDfoPmGo9O624kYj0B7G6LNPpxGV2W1Dcl2uSgnVpDP
	 uOZGEdYRkSqzO9+uGBb4Fyyt97USPUp6NLfRHJSJYSiDBgAemRdoaXfUQwBecyeX4tV7z
	 gAYhgDeoshGGpgn/rDvpFdu8BzTjrMWsYLkCC/IoLCvHEyZzbfgx2V1qjMVmyT5UwNFSL
	 AaNYkCY8Juss6yytGi6JB+Qeo+f2mH8ZKesJKGtkY/WVfVqmBFFQzgAptnBvJVemE+wIt
	 L3cCnleFHvRX6LAcvcF1r9c4k5L03pmmRRNQr9arR0uqGKAKRhjhYiS5fGNuSjELN3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAVTV6nC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5788B606A6B6
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAVTV6nC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DBA1F01576;
	Thu, 26 Nov 2026 16:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795711334;
	bh=7UrMtHKhG9WiunQX3UGq7pmIGz/YdEOXfWy7Oy8Bdys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KAVTV6nC/DpYtb7DgHjfHVdF2BF7rWmBhcMX6BU1rQhBPoXyiDWxoGOyVIqaRbFIF
	 rf3rMG9BnKEJOJ0zevRZCgsRx8/sRiDbV6rd4d9RzhGWzM67NukJUVYZhTJoHFiunv
	 0V2uXJ7oxMb+REXr3sIv3DS61KCjH9ojK8fSPd0edy1deVLA+8W19OF0knJY1BbaI+
	 SaKm2LbO6DO+HKxj7aEORUEwxv/ZeGd3J23UAmn1mv5H7pZhl1eoGBTcykK0B3kyK7
	 +gv0KsoSCNz/SV4CXeNJh+qr5dDTs5Yu4veWNESsNa20DkxbGtLpa/W9XbplXJWB2u
	 6Q19XRifcctNw==
Message-ID: <sashiko-outbox-235936@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] riscv: dts: openhwgroup: add CVA6 APU on
 Digilent Genesys 2
Reply-To: sashiko-reviews@lists.linux.dev
To: marouene.boubakri@oss.nxp.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126164632.978624-8-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
 <20261126164632.978624-8-marouene.boubakri@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 16:42:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] riscv: dts: openhwgroup: non-generic clint@2000000 node name in
  cva6-genesys2.dtsi
--

commit adbdf5a21a3fd9e811bbed4cf8fcf50bd3e5e617
Author: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

riscv: dts: openhwgroup: add CVA6 APU on Digilent Genesys 2

This commit adds a shared SoC devicetree include for the OpenHW Group CVA6
APU on the Digilent Genesys 2 FPGA board along with board devicetrees for
its 32-bit (cv32a6) and 64-bit (cv64a6) configurations.

> diff --git a/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi b/arch/ri=
scv/boot/dts/openhwgroup/cva6-genesys2.dtsi
> new file mode 100644
> index 0000000000000..910b2f96ba6c8
> --- /dev/null
> +++ b/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi
> @@ -0,0 +1,134 @@

[ ... ]

> +	soc {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		compatible =3D "simple-bus";
> +		ranges;
> +
> +		clint: clint@2000000 {
> +			compatible =3D "openhwgroup,cva6-clint", "sifive,clint0";
> +			reg =3D <0x0 0x2000000 0x0 0xc0000>;
> +			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};

[Severity: Low]
Should this node be named timer@2000000 instead of clint@2000000 to follow
the generic Devicetree node-naming convention (matching
Documentation/devicetree/bindings/timer/sifive,clint.yaml)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126164632.9786=
24-1-marouene.boubakri@oss.nxp.com?part=3D7
