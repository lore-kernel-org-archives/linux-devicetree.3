Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A81381B0F
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789249262; cv=none; b=dYHE24BRvsfsVedr9lP/81E5AMrMzsgtbAUBvd2+dvMOlLDliRwUG5Fl5QkI5c85QowIeQl3iKt3gyWc6MO3hnINoeu1IulG6QtHt06/M7kMCigPM0Xnd7++bvZ76GfVHAHyJzo2P26FxYDIrMgrXHWfLV7tUwLRNkEtl0kB2KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789249262; c=relaxed/simple;
	bh=s4mc/XBtHKUuBa7Jv2LsHf83I92wP3RmtQLYOnYPMQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IffdVnVy1R1z2fne7/1ErntiPJ2VPXyAKFfssk31j2QWuqX6ZVPZSVEvFia6QvutB+Mzg9t0HQha+4g4XvtxlRNSWQ7UsGhz+UvgWVrsRv/4HlaunHoEKeDebpBhL1OMZ62eC2MuO6nOa3SL+SOonQHo8cPkTbZQUmLnXRVpD2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqsYac7p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqsYac7p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD961F000FF;
	Sat, 12 Sep 2026 21:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789249260;
	bh=8zypxg5yHu9FCx2uedFNS1x1Wfux1Bbpb5imfjXsaxM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WqsYac7pq+mlg7KTd5QGemIdkxvMXm+p4iGt5JFLyKId9+5NZrYRC7kJwK0cSxE9L
	 PGpWH/uYMI/hCVdyw/i2H0/XFRK9EJmLlVrSweA1nnmH1G9fpYVuCcV/KNO45CI2hW
	 g0jUJELAEp4Do8jpKSwZFE9fq58dTcPFEvx5LJ/8GP4NgBOz+R09M+sfCjav0l5OuY
	 tA0QLQW3HXjbCum+6aELDBMQKQFldpQQQlqMpgstUC7GHnPp7Y4yBAxeCyqdIfMfHS
	 xAseP1zTMe7g9dABk/xOstQZBrZmAbpt8Yx0VD5PJz2eW3rYVkInW4d6bFvoMFEKKu
	 s/4SIVVRn9ukA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: ti: k3-am62a: use ti,am62-mcan
 compatible for m_can devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kendall Willis" <k-willis@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260912-smth-v3-2-6fa661ae5a4c@ti.com>
References: <20260912-smth-v3-0-6fa661ae5a4c@ti.com>
 <20260912-smth-v3-2-6fa661ae5a4c@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 21:40:59 +0000
Message-Id: <20260912214059.ECD961F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added devicetree compatible string 'ti,am62-mcan' is undo=
cumented in the DT bindings, causing schema validation violations.
--

commit 92a95f8fe8cc6fc6551c41c8019698e288ff900b
Author: Kendall Willis <k-willis@ti.com>

arm64: dts: ti: k3-am62a: use ti,am62-mcan compatible for m_can devices

Prepends the "ti,am62-mcan" compatible to the m_can devices in the
k3-am62a-main and k3-am62a-mcu device trees to support out-of-band wakeup.
This enables the m_can pins to serve as wakeup sources even when power
domains are off during deep low power states.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/=
dts/ti/k3-am62a-main.dtsi
> index 9e5b75a4e88e2..1552029fe4d49 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> @@ -848,7 +848,7 @@ mailbox0_cluster3: mailbox@29030000 {
>  	};
> =20
>  	main_mcan0: can@20701000 {
> -		compatible =3D "bosch,m_can";
> +		compatible =3D "ti,am62-mcan", "bosch,m_can";

[Severity: Low]
Does this new compatible string cause schema validation regressions during
dtbs_check? It appears that "ti,am62-mcan" has not been added to the DT
bindings documentation.

>  		reg =3D <0x00 0x20701000 0x00 0x200>,
>  		      <0x00 0x20708000 0x00 0x8000>;

[ ... ]

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/d=
ts/ti/k3-am62a-mcu.dtsi
> index d22caa7c346b3..b9a66e8844341 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> @@ -152,7 +152,7 @@ mcu_rti0: watchdog@4880000 {
>  	};
> =20
>  	mcu_mcan0: can@4e08000 {
> -		compatible =3D "bosch,m_can";
> +		compatible =3D "ti,am62-mcan", "bosch,m_can";

[Severity: Low]
Are we missing a corresponding update to the bosch,m_can.yaml binding file
to document this new string for mcu_mcan0 and mcu_mcan1 as well?

>  		reg =3D <0x00 0x4e08000 0x00 0x200>,
>  		      <0x00 0x4e00000 0x00 0x8000>;
>  		reg-names =3D "m_can", "message_ram";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-smth-v3-0-=
6fa661ae5a4c@ti.com?part=3D2
