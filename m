Received: from va-2-30.ptr.blmpb.com (va-2-30.ptr.blmpb.com [209.127.231.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CA836CDFA
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775630358; cv=none; b=RxZDkhPsL/gYFfwkKAX0d60CUvH0YvVTUDlAgkUVODgRk2b3KO1PwcUy2HcsZVxBAYKpX8saKpq+mWo5cT8DwUOxmboxF2e6ZlA7/3qpV3eRqVgCQthI644saXnOx4DwctaXW7Ul0eg3E4SF8OneyYbPvjiGNxqXVmHHUkkvKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775630358; c=relaxed/simple;
	bh=+Wl8ztU+KWJc9pMYZYC0Q+NmCmeBduZJ6O6bkOxAMkE=;
	h=Content-Type:Date:To:Cc:Subject:References:Message-Id:From:
	 Mime-Version:In-Reply-To; b=jZxREiDiMpyu7so8y+PG9HlF3rcCdDbdPu0YuEG0a1TYym4/AbUHOFdNiuE71yIVDFo62f25VqM3Vg8/mO+Z7eW2WaDtu6ZVHprjS6hyhNNozJbius1kplPVHIgYoOTiKvSOb73p/lofYgSulhOLREf1wXEa6f2QBl9x3SdVRZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=Czy2tEPU; arc=none smtp.client-ip=209.127.231.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="Czy2tEPU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775630346;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=+Wl8ztU+KWJc9pMYZYC0Q+NmCmeBduZJ6O6bkOxAMkE=;
 b=Czy2tEPU89TqFWAGmDJ6iUuMjL1Vk+EbsC+KDPzM5Y3McA3YGtA6xh8H0rfG2ODKpAvETF
 RwwUfghUtH+rm4ywRmvkExM2Gv+q6LC0wUongX2DPe11kCDZolEeuPVKazgynySUWbmcW9
 IWLYaZ/diKmFtR4XlqOl97iNoEoqx8MbcipzmMxN6HrSYb5joSp7eAPHLxRC89DrUhz84g
 nObrnlvnzM9R1rfADQeYAKVTZYrxKWST4YmabxOwW9rJhzJ61jSWL5pgpdBR7oh5Og87NS
 BhjjqEjqmn8LlIJXI1NhZrrttCfbvEBwJgnZXHoOLXv9n2LmkCHKZoN7ZR52PA==
X-Lms-Return-Path: <lba+169d5f807+0bca83+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 14:39:02 +0800
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
References: <20260407055557.1202713-1-sandie.cao@deepcomputing.io> <20260407055738.1202750-1-sandie.cao@deepcomputing.io>
	<DHNJQN4PPTH8.MEVXM2TL2MT7@linux.spacemit.com>
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.ed857e60.6785.4e2b.abec.e19fd3b96e68@feishu.cn>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <DHNJQN4PPTH8.MEVXM2TL2MT7@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable

Hi, Troy:

> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
> Date:=C2=A0 Wed, Apr 8, 2026, 14:07

> On Tue Apr 7, 2026 at 1:57 PM CST, Sandie Cao wrote:
> > The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RISC-V
> > SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
> > which has (Framework) SKU FRANHQ0001.
> >
> > The FML13V05 board features:
> > - SpacemiT K3 RISC-V SoC
> > - LPDDR5 16GB or 32GB
> > - eMMC 32GB ~128GB (Optional)
> > - UFS 3.1 256G (Optional)
> > - QSPI Flash
> > - MicroSD Slot
> > - PCIe-based Wi-Fi
> > - 4 USB-C Ports
> > =C2=A0- Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
> > =C2=A0- Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
> > =C2=A0- Port 3 & 4: USB 3.2 Gen 1
> >
> > This minimal device tree enables booting into a serial console with UAR=
T
> > output.
> >
> > Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> > ---
> > =C2=A0arch/riscv/boot/dts/spacemit/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A01 +
> > =C2=A0.../spacemit/k3-deepcomputing-fml13v05.dts =C2=A0 =C2=A0| 31 ++++=
+++++++++++++++
> > =C2=A02 files changed, 32 insertions(+)
> > =C2=A0create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-=
fml13v05.dts
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dt=
s/spacemit/Makefile
> > index 7e2b87702571..acb993c452ba 100644
> > --- a/arch/riscv/boot/dts/spacemit/Makefile
> > +++ b/arch/riscv/boot/dts/spacemit/Makefile
> > @@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-milkv-jupiter.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-musepi-pro.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-r2s.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-rv2.dtb
> > +dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k3-deepcomputing-fml13v05.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k3-pico-itx.dtb
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts=
 b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > new file mode 100644
> > index 000000000000..783066fc7ad7
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > @@ -0,0 +1,31 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2024 DeepComputing (HK) Limited
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^=
^
> Just like Yixun said, it needs to cover this year.
>=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - Troy
>=C2=A0

Got it. Will change to 2026.
Sandie
