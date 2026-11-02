Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589831;
	b=URx+I13R7Im96ibCMdJpmx4n8Px15oxMPRHp9F12YfcrHKZRM86y1L8rd7ZZ1h754dr6
	 uzRwWKE+m5PonRCatocuhKmSLKFYb7C95xm1fW0ZrX9F40ytse4FNm8Bb0Dj7LTUdbCfI
	 H83xSNZVLWstI2SIXwUaNVAKNEHDGAWDxlJuGGJWeFPEp/+jcN6XheE340qtAWoYFLcuY
	 9diVNY3aWNwqooKbNpovZSZRV4wA9waJ6EylAIpUr0p/3trOfQkeng9uaMy5PhQq9TTl4
	 ZaRJaRXep91SAcYKVPm1+ZjHCcmzsYM0+lEHr5xgnNBkdkrJie66i7Es3BG/tJ77GKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589831;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=m8op6PwWVPH29KHkSl2bqXfs4ZxwQ7xpDqblCTtVsmw=;
	b=mT3Ng6PBmpR0DJn6JvWMJgqURPJVA33LkLClWdZe5cJJTyg1d7k7RX/HVUyzlgFb/xYs
	 Op7hOi/aSNatWcrwIreml0P7Ek1MaZHOKeYaIRPaIPXZgZ36MCnButBqX3lA3TKTqMz+I
	 47urZm5fJqionWXv2A7NjKl+rLhXYdtzzBTtIX2l5hqf3XT/SYgnin3ZElwXzy4WkhyT0
	 ApR7+dfap8lDarn4bj20vQhdts9t1OhSZ4jlCSilkwUdkOmbgrPY1kozm1mOR5xcCSFip
	 iXTUWEsWKZoU0Ds5q0c7O8IhtBQKgRXuzOdZsgJtNNWLwus82zFkedgCvB7TrGqzpJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=c12JYt3D;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3242E606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 03:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3242E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=c12JYt3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793589820;
	bh=m8op6PwWVPH29KHkSl2bqXfs4ZxwQ7xpDqblCTtVsmw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=c12JYt3DDDMcSF7OR9jdLUCPR8+1oo4qYF7KVUyDX4Jd6KWQiAiw/fNJTJnPxS1+9
	 5sr4kBU0DbeIE5wb9ZICvRyfDVJPiVfXgizN7KO8TkshnIS33E4gHUWCR2IZyDFc0k
	 0UMDWbrF7JgzWa9tw/vPv13skSPrBEQv1PVzZGi0=
X-QQ-mid: zesmtpsz7t1793589817t852c87a0
X-QQ-Originating-IP: hDYiRFVAtTnSWNivE4zi0TCTJ4Xk0j9w0TPuBfvhpwA=
Received: from mail-pl1-f170.google.com ( [209.85.214.170])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:23:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11797683002869861785
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8fe8e343fso16579305ad.2
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 19:23:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzFLxztLG3+mEjkeAVwfu/IpIdq+4+Db32JyVdW2K7IYDQrxica+UejiO+gHTyEVRhurQiLjLPdWtTf@vger.kernel.org
X-Gm-Message-State: APuU4Z8d1l+fA2ZAN7kTbyuvZPXt2CeE/JhiVkM5Z8CTow0Rh4kCVd+g
	zjDtucB0IS/TKxXJZpsMOrftpJUo08R7LOP81/EKpxN0MDw/cGx66lHi3n+DOS3dpFsCch71ZrG
	9enKz0mhTJuIhBM61O3FapNMrnYHHJ9M=
X-Received: by 2002:a17:902:cf08:b0:2e8:b5af:22e0 with SMTP id
 d9443c01a7336-2eb36465f1amr76602555ad.41.1793589814309; Sun, 01 Nov 2026
 19:23:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com> <auYxFRtKWbGAlRTL@aurel32.net>
In-Reply-To: <auYxFRtKWbGAlRTL@aurel32.net>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Mon, 2 Nov 2026 11:22:58 +0800
X-Gmail-Original-Message-ID: <EBCEB49359C4BBC0+CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
X-Gm-Features: AclHuK9_kWiUHPoaWjYOWVhMFk9nT072XgylDHIVHiujJpZKDNExi2p2MezyEo8
Message-ID: <CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mie/fUsP/l7pQtPI16CyWcBXUUM2nVl8DlMruL1OsruyjdvPsc3WXUN1
	up36QnBVwHE1gYQ0tHROJcHhtRLQs7ZHmvSe21t3yC1NNAQnLKlH03Pu0AXdPjWxjPz3fn1
	yynpRj7xeXzTmzjJmgc6RVWKmecmBXg/3ahRqT7Q+tgMNXspTjYOl8TCATI5BGkgDkScNIk
	/1E//8+lmmB0alq8FbMUENjn9O/p4uDUIhaSC3skyC1mYW4naRpalt27bNETk8BDsVwtwFB
	cufbFWBwY8bYNVbmJtgyzYYZaB35Dhnn7SXZDozcbj8HjIzPJASFmcERlCQkFA3Gu1Mq8oU
	6vBQy1rtjF9lkoWY3wO5kskl3pE4hxJKDsx1cbZ+mWjN84yuy+OaOIBuD4x9/R2t5FKjH5u
	8k1d+J45FI5BypOg5ezATRUnVtQIld8WTIZIMvZ5sIFW1bkVXG124o3/uyTa806vCIr8BIb
	lA15gUopRWLR1U+pw0Gj3X5EZv5BzFD5oyzFF4mguRN/nW1dgllGbx3gaFfHMqYOaCkPLyK
	lI14OfqTvuYAtcLWemlV+CdgbiAkL8nlitcTPp/4IRsDy2mB5bSQDcpU2Fh2JRI20LhbyoA
	LSlTSf2IOfOoolvmC6Jbuvzp1OI+88V9d17EYYp57xiedaLyO83DmNERuDX6mfTAVUUkqcA
	REb0YJpx8pZq9mgNjWfGFeSyQSl3Qrlh4ZhIwUdaViCYiNnVyM1BlaAb23wzXgEDMZGlV+l
	+UB4Da+syJCHGxynkkHi+gXSwQ+licEZJu5nLS1oFRuANBoe4fc//QVEDJ7cc/AegTaG9M3
	6LuJCOTV889kF4g3dzanjijWv/SlnJNUWaqC+hFqM06DBeqoTb7s49i9VpcIIbByYYEyubi
	PuWVIjEMCK+IVyoQAqvjIgQrfVclZIg2Huz8GWRmS+pc/kJMK2SnLrM6ekMUrb4NTm51jxa
	2szJ/Da4ws8MOB/UZ5v/5lNmVsLwCHy0LEKCiN0WmqDMSxIBjXieiRejEcgpudGA/m3AaMW
	ECeeXlXXBC7r0eIgxs5kR8ZNOZzpmOv+RQSGQpyve4iVROkqRivCf5Ugw2v9wqZKD611j1E
	BWnCaRo1QbR
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Hi Aurelien,

On Sun, 1 Nov 2026 at 02:19, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi,
>
> On 2026-10-30 17:40, Chunyan Zhang wrote:
> > Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> > of the K3 SoC.
> >
> > Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> > yet, so the port runs at high-speed (maximum-speed = "high-speed").
> >
> > Enable USB3 port A with dr_mode = "peripheral", so it can be used as
> > a USB device.
> >
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  9 ++++++
> >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 30 ++++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b084a35aa00e..74d4fdf9e405 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -323,6 +323,15 @@ &usb2_phy {
> >       status = "okay";
> >  };
> >
> > +&usb3a_u2phy {
> > +     status = "okay";
> > +};
> > +
> > +&usb3a {
> > +     dr_mode = "peripheral";
> > +     status = "okay";
> > +};
> > +
> >  &usb3d_u2phy {
> >       status = "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index c3f2dce0969c..220dfe29bb78 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -630,6 +630,36 @@ gmac2_axi_setup: stmmac-axi-config {
> >                       };
> >               };
> >
> > +             usb3a: usb@cad00000 {
>
> Please move this after the eth2 node, so that the node addresses are
> kept sorted.
>
> > +                     compatible = "spacemit,k3-dwc3";
> > +                     reg = <0x0 0xcad00000 0x0 0x10000>;
> > +                     interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-parent = <&saplic>;
> > +                     clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> > +                     clock-names = "usbdrd30";
> > +                     resets = <&syscon_apmu RESET_APMU_USB3_A_AHB>,
> > +                              <&syscon_apmu RESET_APMU_USB3_A_VCC>,
> > +                              <&syscon_apmu RESET_APMU_USB3_A_PHY>;
> > +                     reset-names = "ahb", "vcc", "phy";
> > +                     phys = <&usb3a_u2phy>;
> > +                     phy-names = "usb2-phy";
>
> Please move the PHYs definition to the board level, matching was it is
> done for the other USB3 ports, as other boards might have different PHY
> configuration.
>
> > +                     phy_type = "utmi";
> > +                     snps,dis_enblslpm_quirk;
> > +                     snps,dis_u2_susphy_quirk;
> > +                     snps,dis-del-phy-power-chg-quirk;
> > +                     snps,dis-tx-ipgap-linecheck-quirk;
> > +                     maximum-speed = "high-speed";
>
> I think the maximum-speed property should also be moved to the board
> level, as its value depends on the PHYs configuration.

Sure. I will address all the above comments.

>
> > +                     status = "disabled";
> > +             };
>
> Any reason not to define the snps,parkmode-disable-ss-quirk property? It
> is defined for the other USB3 ports, as well as for the USB3 A port in
> the vendor kernel

The original thought was that this property is SS-specific and thus unnecessary
without usb3-phy support. However, since it reflects a hardware characteristic
that applies regardless of the current PHY configuration, adding it makes sense
for consistency and forward compatibility.

>
> > +
> > +             usb3a_u2phy: phy@cad20000 {
> > +                     compatible = "spacemit,k3-usb2-phy";
> > +                     reg = <0x0 0xcad20000 0x0 0x200>;
> > +                     clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> > +                     #phy-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> >               pdma: dma-controller@d4000000 {
> >                       compatible = "spacemit,k3-pdma";
> >                       reg = <0x0 0xd4000000 0x0 0x4000>;
>
> Otherwise looks good.

Thanks for the review,
Chunyan
