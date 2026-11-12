Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449419;
	b=OEYSSp+R4ijvB/soqukTWfEbzbTXTIB/J2jqBIDbV6aKpGs96vIwIr/FUDiZJ/duFFtW
	 5ui0gI59mq+D7HkWwM3AyNkl4MaFzgtvpEd10p4xqUec0FW/OVok/DbhbtIWhzecMWr3z
	 /dgZHsSWDabTHHmWIiSDj/UGlt+rX+NZLjuGtWnwjI5+QGnUEZ162HHYWJc18zzLxPg4t
	 e4m5ZOgeMz88Y9YG7SwrsFjvL1MzbG8qzEtSD3PshG2Q/ke8p3aWk6Sd1gt9f1dARTUwf
	 WtdcCKZ3XVqJXN/cwTqGaJnSzsJWh0mCZWIy5bhvU25K1EZsQrNXNglKDengqaQTDHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449419;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XfFPLXCWvqhDfIvJapjmB6/FOr8sxw4ppmvMfUsLAyM=;
	b=zDkoTPMd9lCmAL75sfYCdYwTShM8503ORBd2iOJK34v0LZVU7mmeX/xGNwIW3bm/b/1M
	 X5fs07tHrbstYw7uT574jASRerwn4Mle27cG/kxuyJ9rI+lYrfhT3OiiP7N5pj1oWople
	 MT6/jWF7EFswURCq/ft26M2BYL0aDAg8dkHDbFwnw1IW3MK4kxp6SxI4Wh3b9kRL7KUfw
	 5l5h64eL++CGlPa5m2cPCuZ5yoYnnKMiYxmYOIC/l/f3OqSptdeRBTCpFpk7w4K/01z4T
	 l6z23UqakU9RCgDT2BHtQ8toLARZNKQb70kH2q3cz3/Y3Iim5k90Go7L7A9Y8OObzww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WaWtdPmC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B588B606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 02:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WaWtdPmC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056231F00A05;
	Thu, 12 Nov 2026 02:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794449419;
	bh=XfFPLXCWvqhDfIvJapjmB6/FOr8sxw4ppmvMfUsLAyM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WaWtdPmCggu4Rbv8+lzttqT4gW3D2vGy1ipUT0LYYhkPZfNaWz0mcXqjyxJRE2YPh
	 MNREUw5WVmF9dV4E39t/3wOXpeCWS6Y8fBUhQgtakLcKb4kW72VxP6R5gGHwvVbGHs
	 OLjVL41i/MYRd4x0YdRjVLtoLB3UnSp6/h3YyL4I6yqCwaqO3yPZBPVYFcJOgU6HpL
	 yLhpxCKhZ/eZhDDwRr2Aq+9X0gFzbWBRrFlSzxyTpCGKNQ9LhZGEfow6GqUxj/ygrq
	 GsLRYJ6aMkErlXLIgvQ/8gNvgBhgzNKa8cm7yXwZjLl+6AqEtI3BvdxsyaGWVk7Htd
	 RQd+Gv8p1tK3Q==
Message-ID: <sashiko-outbox-210157@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/8] dt-bindings: riscv: Add UltraRISC DP1000 board
 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xincheng Ji" <jixincheng@ultrarisc.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-ultrarisc-dts-v8-3-14fa0834cac4@ultrarisc.com>
References: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
 <20261112-ultrarisc-dts-v8-3-14fa0834cac4@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 02:10:18 +0000
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
- [Low] dt-bindings: riscv: ultrarisc lists departed maintainer and
  stale git tree
--

commit 12ea55f6c9205d92a219a92f47c317d3c2daaad7
Author: Jia Wang <wangjia@ultrarisc.com>

dt-bindings: riscv: Add UltraRISC DP1000 board compatibles

This commit adds the device tree binding schema and MAINTAINERS entry for
UltraRISC DP1000 SoC-based boards (Shenzhen Rongda M0 and Milk-V Titan).

> diff --git a/Documentation/devicetree/bindings/riscv/ultrarisc.yaml b/Doc=
umentation/devicetree/bindings/riscv/ultrarisc.yaml
> new file mode 100644
> index 0000000000000..a51e63dbeca33
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/ultrarisc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UltraRISC SoC-based boards
> +
> +maintainers:
> +  - Jia Wang <wangjia@ultrarisc.com>

[ ... ]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index ff1c1aea9a989..7eb1b2971bead 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23639,6 +23639,13 @@ F:	include/dt-bindings/power/thead,th1520-power.h
>  F:	include/dt-bindings/reset/thead,th1520-reset.h
>  F:	include/linux/firmware/thead/thead,th1520-aon.h
> =20
> +RISC-V ULTRARISC SoC SUPPORT
> +M:	Jia Wang <wangjia@ultrarisc.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Supported
> +T:	git https://github.com/ultrarisc/linux.git
> +F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml

[Severity: Low]
As reported by Conor Dooley on v7 [1], should both the new binding schema a=
nd
the MAINTAINERS entry list Xincheng Ji as maintainer and
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ as the git
tree instead of Jia Wang and the github.com/ultrarisc/linux.git tree?

Later in the series, commit "MAINTAINERS: Update UltraRISC platform
maintainer and tree" overwrites the MAINTAINERS entry added here, while
Documentation/devicetree/bindings/riscv/ultrarisc.yaml is left listing Jia
Wang, who has left UltraRISC.

[1] https://lore.kernel.org/r/20261110-amused-strobe-d6cf2bf24861@spud

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-ultrarisc-=
dts-v8-0-14fa0834cac4@ultrarisc.com?part=3D3
