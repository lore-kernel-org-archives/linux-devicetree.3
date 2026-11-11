Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417025;
	b=KIkmh+dOvHCQnR6HGa01q7ZHuoylf6sErwfa2hF4+bxu/hILffLJczr8/glUtUgV+8Ae
	 Rs83bYg+XCP7pvX3cbw/IQXOUGbNOjqfnkhOoj54xXMv4GFDR8lipxG1zha0uq0zElb5D
	 coIqjjOu/55hl4mLVFR0xFuKg8tVjuUBfTajAIq1Yv8/l3i3fDCb7M5RiSkfb4P1Q3Yms
	 JfnmDZvb9wjCCEmIWpI8VEbSbXwxduPS/BdVP8eJATdf2DAjkINdqk8FuSzeiN6lBCnMR
	 7DjSX1i1XZbsRhsRZziH5Kkp5T/fa5Sos8y2lk+5Vcq+NQ3zVcgEpXqNJBy7t2z7ixA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417025;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y7ij57NuwX8Ftb+4EjSLorQrBLofQzj0MU9Iha/PVcs=;
	b=0IarwkfpD39ebp3OYu7WTVNiie0TjK2mU115N+u+h7xk+F/yry9PwLUdOKcnpSV5jw3D
	 7mI1x3PqCp2UQYKOa/CNX+V62cjWXmyvn/0rzJRD5Ok9h4XF8wtzvVmQh91cOAkSZnjJC
	 qociPZYWCGXYjGoPA9GqzHFDf1+usZ8ab3Uw9gK66el08xzUZwOjCSdmbod+Vbz8zHR9x
	 60ywze7JU3hvjp3LPWkYRKXCmBtA3/evX232gL1tKea2hOirpjpj4zvqqecPAfYIreJ6w
	 AIVJU+GQ4D/XlzsyvB5MFLNcy/VN5qN2TYdtjhthWRGVpmGYjd7leQNB/7TVbfNswJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4O3ODJN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F58606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4O3ODJN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08681F00A0C;
	Wed, 11 Nov 2026 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417025;
	bh=Y7ij57NuwX8Ftb+4EjSLorQrBLofQzj0MU9Iha/PVcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y4O3ODJNHMTP1fkYTqhrxKc2krie1Ptev2VoGnphEqrWu6M8BxB7UsVabwgtioyA6
	 bJvbXWbjV/l6nwL6LC+KlfueDoWnD1xerikDSgnmj+7QPjwDs6zatTX6S2kq+a6mu9
	 fzOf2DABMgqz6aVwrlJCo7fXrCJ9bI55HM4H1x23r7HnvtXyHrohvfZTcuENjxd8uH
	 qx7ssWEjGVaui7pUnvPJ5BieqiG32B5glfoQjZ2Gb92nJzUAo3Knns6kIvZWyXDMUm
	 pFgZTIeZUExxacK648XzWLFl/MKAcGpbggVOoipgQ3oszkcI1+VlDmnonubXZ7H2By
	 g+WR0InTeWAQw==
Message-ID: <sashiko-outbox-209381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pufan Jin" <cyan2254650260@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111162917.97532-3-cyan2254650260@gmail.com>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
 <20261111162917.97532-3-cyan2254650260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:10:24 +0000
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
- [Low] ARM: dts: zynq: unaddressed mdio child in gem0 triggers dtc W=3D1
  warning
--

commit 3898a396db65d191993e3c2e496f86fb25c55e4f
Author: Pufan Jin <cyan2254650260@gmail.com>

ARM: dts: zynq: Add ALINX AX7Z020B development board

This commit adds devicetree support for the ALINX AC7Z020 system on module
and the ALINX AX7Z020B development board.

Link: https://www.alinx.com/

> diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts b/arch/arm/=
boot/dts/xilinx/zynq-alinx-ax7z020b.dts
> new file mode 100644
> index 0000000000000..472d9fcaafa69
> --- /dev/null
> +++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

[ ... ]

> +&gem0 {
> +	status =3D "okay";
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ethernet_phy>;
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ethernet_phy: ethernet-phy@1 {
> +			reg =3D <1>;

[Severity: Low]
Does wrapping ethernet-phy@1 in an unaddressed mdio node trigger a dtc
avoid_unnecessary_addr_size warning when building with W=3D1?

gem0 in zynq-7000.dtsi defines #address-cells and #size-cells, so dtc warns
when its only direct child has no reg or ranges property.  Placing
ethernet-phy@1 directly under &gem0, as other Zynq-7000 boards do, or
deleting #address-cells and #size-cells on &gem0 avoids the warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111162917.9753=
2-1-cyan2254650260@gmail.com?part=3D2
