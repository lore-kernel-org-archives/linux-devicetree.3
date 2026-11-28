Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886127;
	b=NBORbKw//KYRHfWAhocmbXSO3IA9qg5iXWmm6je5KQtizPSDBAMvO4jPvL78Y5eL6ACp
	 CGAO1qQOb4aXyZ5TbPOMhROO6U1gYHqy2ymI1ghte/aRufWq7PkDNKpoztlth4sSM1XuO
	 F7yVurk7i5LPknKRYmb8Ti29Hk6vZCTWdY+4igJxVeyWaFQdZBTMKjTXQ3Lg1bB/NtgML
	 yZ65a94qgh7hW9tjyXJuZrWHhWPqL6lsas7paom8ZGDKyNxUBNUBH0vjIeeDUjXD0e53y
	 jSEUZCLBAS1lCxtb/4F+WoffZVXjqS8dIsjLXKkAIYnoC7PW1cr8oOXCcvcZ630ABaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886127;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ZohoMailClient;
	bh=mxLdkY6vzsVozs32pWOO6o78TSdG6gnBKlks6tfg/FI=;
	b=Ifd1+2LXEcEQL2QQkWLYc6oBm3oOC+EgIYhUUhW+7PClXWynxhz7XzpVhvD3NPB2k4N/
	 hTVpwKWus3AWMnovC9LOnxYkaVQFTQAqgBcQ95D2nBkQ3SGQMB1NcXygBIW2Wn38z4kuW
	 oC51BZr67UKII1OKx2XBWjdxJLuSWQDdC9OEC8sDZAfguRQOvnNWZKjFPqNmFvFjIaVRW
	 9YLdaM2myozQm97wdcsdqlkqqdIAQFv3DqcwxTuPTGHlX5EriwxtYpMWY9L0tVdoiW5E8
	 cEunsLOQVzEgKJmQ2i9JVeBf4JgtId6BkTjSlaWX1HibCyrqMlzFGgUNOPZpOHfhLuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pigmoral.tech;
	spf=pass smtp.mailfrom=pigmoral.tech;
	dkim=pass header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=n3Rb+4u3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5ED606A31C;
	Sat, 28 Nov 2026 17:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=n3Rb+4u3
ARC-Seal: i=1; a=rsa-sha256; t=1795886097; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NC2klko8jRLoHNet+utc/pJ7VOTIikmUThVKPCUUuw6VYSVBbkSoD2U8+g6yycJG7U/kJJle6/fxSJgDeZkYL9/dGA2IswgWPyx5F9qC0WSUPX/pz3EE27Kw4l6p2vX2bH42F76mGTurJKHFzcEDTTbJcj6GAVw8Wfe6+cMjWzY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795886097; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mxLdkY6vzsVozs32pWOO6o78TSdG6gnBKlks6tfg/FI=; 
	b=CdzcEpIsN5Wcwn1sL9gd/2PaWYgHaN9KfgWfk+oeQMgptXJFLomRR//ae8XWfXuqAo+gHsaJN98HKoH5YIQhHL5zPgygoigurKV0COuZQgdS/iYhrWpR7MsxG1a2gWRwbNRAVc26FXIFxHCohT8PInGztY2RrYa8AlTLiufl9e0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=n3Rb+4u3lNvXBbhrd3qnrekDgZyf9P/MtXD68fbi3LkmFsf3lo9Gd08NARHFbxSdjFDdMG8kQKzEOlR5kBxPzIBJv0F28l1s1P+z8ZxMT7S8d9wwshrqL6PIocf+YQdtv35Bf29709IE8kmsSTGVDDnt9ZH2Rm1lbgJObUof+fk=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=mxLdkY6vzsVozs32pWOO6o78TSdG6gnBKlks6tfg/FI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795886094973517.1431723157222;
	Sat, 28 Nov 2026 09:14:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Nov 2026 01:14:37 +0800
Message-Id: <DN70HEN4EFL9.RHMQ0H4T77RG@pigmoral.tech>
Cc: <spacemit@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, "Chunyan Zhang" <zhang.lyra@gmail.com>,
 "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] riscv: dts: spacemit: k3: add USB3 port A (DRD)
 nodes
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Chunyan Zhang" <chunyan.zhang@linux.spacemit.com>, "Yixun Lan"
 <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.22.0
References: <20261105103125.2727341-1-chunyan.zhang@linux.spacemit.com>
In-Reply-To: <20261105103125.2727341-1-chunyan.zhang@linux.spacemit.com>
X-ZohoMailClient: External

Hi Chunyan,

Thanks for your work, but I found an issue when testing this patch...

On Thu Nov 5, 2026 at 6:31 PM CST, Chunyan Zhang wrote:
> Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> of the K3 SoC.
>
> Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> yet, so the port runs at high-speed (maximum-speed =3D "high-speed").
>
> On the K3 Pico-ITX, Port A is a Type-C connector behind a FUSB301 CC
> controller, which is not described yet. Nothing configures the
> FUSB301, so the port relies on its power-on CC mode. Enable Port A
> with dr_mode =3D "peripheral"; it is device-only until the CC
> controller is described.

In my testing, this patch alone does not make the USB gadget work unless
I manually run the following command after the kernel has booted:

  devmem2 0xcad30040 w 0xA4080401

0xCAD30040 is a register in Port A's USB3 PHY. It seems that even when
using only USB2, the USB3 PHY registers still need to be configured,
so USB3 PHY driver support appears to be needed first for the gadget
to work properly.

>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
> ---
> Changes in v2:
> - Rebase onto v7.4-rc1.
> - Move phys/phy-names to the board dts, matching usb3b/c/d.
> - Add snps,dis_u3_susphy_quirk and snps,parkmode-disable-ss-quirk.
> - Note in the commit message that Port A is a Type-C port behind a
>   FUSB301 and is device-only until the CC controller is described.
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 12 ++++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 29 ++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/bo=
ot/dts/spacemit/k3-pico-itx.dts
> index dda420900aa2..d0fbed23ccca 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -337,6 +337,18 @@ &usb2_phy {
>  	status =3D "okay";
>  };
> =20
> +&usb3a {
> +	phys =3D <&usb3a_u2phy>;
> +	phy-names =3D "usb2-phy";
> +	maximum-speed =3D "high-speed";
> +	dr_mode =3D "peripheral";
> +	status =3D "okay";
> +};
> +
> +&usb3a_u2phy {
> +	status =3D "okay";
> +};
> +
>  &usb3b {
>  	phys =3D <&usb3b_u2phy>;
>  	phy-names =3D "usb2-phy";
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index e89d2cc5ca8c..2d2569cfe676 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -687,6 +687,35 @@ gmac2_axi_setup: stmmac-axi-config {
>  			};
>  		};
> =20
> +		usb3a: usb@cad00000 {
> +			compatible =3D "spacemit,k3-dwc3";
> +			reg =3D <0x0 0xcad00000 0x0 0x10000>;
> +			interrupts =3D <118 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent =3D <&saplic>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> +			clock-names =3D "usbdrd30";
> +			resets =3D <&syscon_apmu RESET_APMU_USB3_A_AHB>,
> +				 <&syscon_apmu RESET_APMU_USB3_A_VCC>,
> +				 <&syscon_apmu RESET_APMU_USB3_A_PHY>;
> +			reset-names =3D "ahb", "vcc", "phy";

I also tried booting through the BootROM's USB download mode (fastboot,
with USB worked as a gadget), so that the BootROM would initialize the
PHY registers needed for USB gadget operation. However, I found that
asserting RESET_APMU_USB3_A_AHB during the kernel driver's probe resets
the PHY register state, losing the configuration left by the BootROM.

Am I missing something? How did you test this?

Best regards,
Junhui Liu

> +			phy_type =3D "utmi";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis-tx-ipgap-linecheck-quirk;
> +			snps,parkmode-disable-ss-quirk;
> +			status =3D "disabled";
> +		};
> +
> +		usb3a_u2phy: phy@cad20000 {
> +			compatible =3D "spacemit,k3-usb2-phy";
> +			reg =3D <0x0 0xcad20000 0x0 0x200>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> +			#phy-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
>  		pdma: dma-controller@d4000000 {
>  			compatible =3D "spacemit,k3-pdma";
>  			reg =3D <0x0 0xd4000000 0x0 0x4000>;

