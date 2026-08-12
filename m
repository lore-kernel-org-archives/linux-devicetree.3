Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B52241CB2D
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528290; cv=none; b=FyY+VbI54pwbSjX55wJ9rXZr1brg0HgIBF+jFaPIw8Ekh90cmHe+7PENNADUTcVQ0FlOApJ56q+9CDFsORXvzIgY3dm17xab0swW0Ao21FwfJHmHFgVJJp2teQYuUthuAcZDFFm2L+k2ieXqekjSj6OPI0EqRSL78tBhucn5gr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528290; c=relaxed/simple;
	bh=Ok2P5u3VLVuXDJytbpEfz7gXL1msoLVk7YSN2VJ+NDM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aKZ+AxaijTU7G/p7XfSciKqxOR7L04TQsHHB883JEbQNUbwPiE8eUUW1+qnbgIqlPm5+GecQFC0vFISa9pjMJlzftUqiKmb5oS7nHIYX2j+ShFXF5ZyrsV2uZIOLbOWiXt6ivVs+90TrNQk2iNEBRIMBnhGxMRD0rBl0R7n39Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPqwsWT8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPqwsWT8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAF81F00A3A;
	Wed, 12 Aug 2026 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528289;
	bh=oWEmWW1YZMTrNMc3U1MVLvb/3jVAQjIk/02+RtGI4L0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XPqwsWT85Pw+ol9ilY93zTT672EV5maFgrRBbRaCusx4+8+jZMqnghq1gfo4Nhwzy
	 +DFSVtYvYbyRm7JxeXGuLTQWIKh/dWMgvy6WQdl1ajXMcPOMMPqJlLSDU0VSDpgnZm
	 zNTTOdKhOUcTYSq0w/Ph3ra3gmuAeGByjza8NYDJri38DnM9aTaqSFd5qmWIzDaSQX
	 IWNZt8VzT/cmdSZ+zLxtPyn8XjD/oVp2Tx72EENQRAzt1y5oqREDrLtVhsLdVKyYgy
	 yWeNeibjTByeIJ7MQvx2a2u5vTB/CzDETCJUIcHn53rneccZkjG6pAdOYl5Qj1/a88
	 VzYBInsYHBw0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] riscv: dts: spacemit: add USB2.0 controller nodes
 for K1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-4-f28cf29e522b@linux.spacemit.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-4-f28cf29e522b@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:51:28 +0000
Message-Id: <20260812095128.BFAF81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The newly added `usb2_0` and `usb2_1` controllers are instantiated=
 under the `storage-bus` node, which has a restrictive `dma-ranges` propert=
y that excludes system RAM, preventing DMA operations for these controllers.
--

--- Patch [4]: [PATCH 4/6] riscv: dts: spacemit: add USB2.0 controller node=
s for K1 ---
commit 574278a69410138bf5c5e246489a12433bf57db8
Author: Junzhong Pan <panjunzhong@linux.spacemit.com>

riscv: dts: spacemit: add USB2.0 controller nodes for K1

This commit adds two ChipIdea USB2.0 controllers to the SpacemiT K1
SoC device tree. One controller is configured for Dual-Role (OTG)
and the other is Host Only.

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
> index 08a0f28d011fe..aa35a34892503 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi

[ ... ]

> @@ -1291,6 +1307,30 @@ storage-bus {
>  			#size-cells =3D <2>;
>  			dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
> =20
> +			usb2_0: usb@c0900000 {
> +				compatible =3D "spacemit,k1-usb2";
> +				reg =3D <0x0 0xc0900000 0x0 0x4100>;
> +				interrupts =3D <105>;
> +				clocks =3D <&syscon_apmu CLK_USB_AXI>;
> +				resets =3D <&syscon_apmu RESET_USB_AXI>;
> +				phys =3D <&usbphy0>;
> +				phy-names =3D "usb-phy";
> +				dr_mode =3D "otg";
> +				status =3D "disabled";
> +			};
> +
> +			usb2_1: usb@c0980000 {

[Severity: High]
This isn't a bug introduced by this patch, but will these new USB controlle=
rs
fail to perform DMA operations because of the storage-bus node's dma-ranges
property?

The parent storage-bus node defines:
dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;

This restricts DMA accesses to physical addresses between 0x0 and 0x7FFFFFF=
F.
Since the system RAM on this SoC starts at 0x100000000 (above the 4GB
boundary), will the kernel's DMA subsystem reject mappings for data buffers
or descriptors located in RAM?

Placing these new DMA-capable USB nodes under storage-bus seems to guarantee
they will fail to map memory.

> +				compatible =3D "spacemit,k1-usb2";
> +				reg =3D <0x0 0xc0980000 0x0 0x4100>;
> +				interrupts =3D <118>;
> +				clocks =3D <&syscon_apmu CLK_USB_P1>;
> +				resets =3D <&syscon_apmu RESET_USBP1_AXI>;
> +				phys =3D <&usbphy1>;
> +				phy-names =3D "usb-phy";
> +				dr_mode =3D "host";
> +				status =3D "disabled";
> +			};
> +
>  			usb_dwc3: usb@c0a00000 {
>  				compatible =3D "spacemit,k1-dwc3";
>  				reg =3D <0x0 0xc0a00000 0x0 0x10000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-b4-spacemi=
t-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com?part=3D4
