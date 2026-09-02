Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C1E4AA576
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 21:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383601; cv=none; b=dA8LxVpCQzaAiBVwFXY02wcqDSzD4ogwehR+ISAtJpNh08PBA1M61P11ePkFZlZJKehr+7VvCvJHYlO2zZVOItgMwsGsXBemTqmFJAtekQZX0JRvS2T+JIgVzRWYo/wwjNd3KCP972RRR9LQ9XV1AYZ5aLN9uGFcnaumPTHXEtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383601; c=relaxed/simple;
	bh=/+CcR8ZM34WnmQ7I8ZcjruYVsDkcIGA2QpS3E9fCjxk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PwgNwmgHb9FLCuCpXy+tpaPjO2wUlBlSqeTkYbQVV4dbY+aimSo2ptfEpDEnVgfV1ouv+Hyx+ngeRk7aTEezkEkxwH63kZ/lH8nr4ZfdicE3ZBNQ2IdE8lWEV4wu3GLe+FF8GV6dwGd+VwIxi0ZOmbxY2ai4a85oAbaxLSqjQjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXG8ppFM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXG8ppFM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F361F000E9;
	Wed,  2 Sep 2026 21:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788383593;
	bh=kyt5WozopPFoJvS4Z5phSglYWiS0yF9RdDI+adzbRqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gXG8ppFMKDlTRaDYKhE6/VH9BeiaY0QwcH/CnKFMzMdXfgjTrVzBcfHZ8YfBJom5F
	 As8jKrO9KSB0zbN62lzhPJ/qr3egQOHPga0m12H1vYnqTUzAsC87/B/wRzrb+Y9SfB
	 ctYqeFvQAbgP2LQdvAQFZTqrr6XMR9C6PRoUI2ee/pGdZ7eW6aItd1zClJeQ6Yr7Df
	 NblZ/kvcPdURtXxnBfRKYbNdC5E9FLDU6T7ewkoJQY5rxKiWXk4WkTq4gfuNRpyMQ/
	 cWuGEVSoOKovb92n+VZI16cAcDmE3wIUv7/vpWUsAQwgRwYm9HI/l2gCSTubbW1def
	 JTJjnjvWP/knQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-am62p: use ti,am62-m_can
 compatible for m_can devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kendall Willis" <k-willis@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260902-smth-v2-3-b3678ca44c7b@ti.com>
References: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
 <20260902-smth-v2-3-b3678ca44c7b@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 21:13:12 +0000
Message-Id: <20260902211313.50F361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch introduces an undocumented device tree compatible stri=
ng "ti,am62-m_can", which violates DT schema and will fail dtbs_check. Addi=
tionally, the patch lacks corresponding driver support and 'wakeup-source' =
properties to fulfill the claimed out-of-band wakeup functionality.
--

commit cef42e3b48831e21d6aea546d64d5e3a76c6a43c
Author: Kendall Willis <k-willis@ti.com>

arm64: dts: ti: k3-am62p: use ti,am62-m_can compatible for m_can devices

This commit prepends the "ti,am62-m_can" compatible string to the m_can
devices in the k3-am62p-j722s-common-mcu device tree. The commit message
states this allows the pins to act as a wakeup source in deep low-power
states via out-of-band wakeup capability.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch=
/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> index 5288c959f3c1a..d26d6b6d0cf46 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
[ ... ]
> @@ -154,7 +154,7 @@ mcu_rti0: watchdog@4880000 {
>  	};
> =20
>  	mcu_mcan0: can@4e08000 {
> -		compatible =3D "bosch,m_can";
> +		compatible =3D "ti,am62-m_can", "bosch,m_can";

[Severity: Medium]
Is this new compatible string documented in the device tree bindings?

Using an undocumented compatible string will cause make dtbs_check to fail
against the bosch,m_can schema.

Additionally, the commit message mentions this enables out-of-band wakeup
functionality, but the standard wakeup-source property doesn't seem to be
added to this node. Without the wakeup-source property or driver-side
configuration for this specific compatible, will the Linux PM framework
actually arm the device for wakeup during system suspend?

>  		reg =3D <0x00 0x4e08000 0x00 0x200>,
>  		      <0x00 0x4e00000 0x00 0x8000>;
[ ... ]
> @@ -169,7 +169,7 @@ mcu_mcan0: can@4e08000 {
>  	};
> =20
>  	mcu_mcan1: can@4e18000 {
> -		compatible =3D "bosch,m_can";
> +		compatible =3D "ti,am62-m_can", "bosch,m_can";

[Severity: Medium]
Similar to mcu_mcan0 above, does this node also need the wakeup-source
property to function as a wakeup source, and does the driver currently
support the ti,am62-m_can compatible string?

>  		reg =3D <0x00 0x4e18000 0x00 0x200>,
>  		      <0x00 0x4e10000 0x00 0x8000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-smth-v2-0-=
b3678ca44c7b@ti.com?part=3D3
