Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E8264A9D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055016; cv=none; b=YOLrh3qDjNNORjM/7E6hdaknHULTv0XF56uKOdyhenO9/4hYr4BZ1l6Jc0DyuMLW74P2Ff1EUZvWBXDdpka7zk8SGeJJkGC65GR+ByLHlvJPs4Logv/b4Q3jXwv8/tDmEYJ6bd/oc/Xowkg9I5ChauCHVxJzuk51NtnQbgbw/04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055016; c=relaxed/simple;
	bh=8HRdO40GBJZlsE8xL1LHiW4N40f17BWO4Il0MheFkBk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k/qpG3sUxjVqorh5cwrKFL6HU8247WjGvyiRqHaJRatYHqnTHwLqKpQ6IC5MbuwQmFcb+9uOKLKfoB3eSd9zk9gbfSyK9ykYSo6ruoYdHRKFRzKykVb9FY/filr4RsaAafu9OwHymwUq4SNl5lROj+yD60hmR7DqmznwpPxRFbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XusIAKiX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XusIAKiX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D481F00893;
	Wed, 10 Jun 2026 01:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781055015;
	bh=SKd2qGF1ZJA/t1JzsOHnzC37DlOVjcdQafz4remRMug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XusIAKiXOBwu1KZTZ3D4JWpvHErMhOa7Ll1D/obGVuD5sABEwWIIrsv2iKUkm6pvD
	 Hfnwx2Hln+SAy9lzeVR9XM/jeoTXEIcWguO2uJwAreiR1598ADSPr1UPV2OcyOVEdm
	 d2IDE22mSlX9Hx4CvBCKnhdLV66My466jXeZ6yqsa/PiaVwf8nN3KR4gHKhuf5jTGn
	 77My3bQWwEDL1NWSf5zqNUbJkEvwF+n1zp+/kV8jTwwciOeGLqTYQRsW9bRkrDpTHY
	 W2CiD6oJfWo85gkjU3zKI3dKTkzEysK8i/NtOVz9Hhbh1jcPyrh6Q4+pwqrKaGuanl
	 bh6Ca9Z1fB/Mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2
 BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610-ventura2_initial_dts-v6-2-375d8e9d7ebf@gmail.com>
References: <20260610-ventura2_initial_dts-v6-2-375d8e9d7ebf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 01:30:14 +0000
Message-Id: <20260610013015.10D481F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing `idle-state =3D <6>;` on the PCA9548 I2C mux on `i2c4` bre=
aks asynchronous MCTP traffic.
- [Low] The new board compatible string `facebook,ventura2-rmc` is not docu=
mented in the device tree bindings.
--

commit 5d6ee3a97cd79459755cb6b05c8802e4c5d63cab
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

Add linux device tree entry related to the Meta(Facebook) rmc-node.
The system uses an AT2600 BMC. This node is named "ventura2".

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> new file mode 100644
> index 0000000000000..1111daa22f73e
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> @@ -0,0 +1,2891 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2023 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model =3D "Facebook Ventura2 RMC";
> +	compatible =3D "facebook,ventura2-rmc", "aspeed,ast2600";

[Severity: Low]
Is this new board compatible string documented in the device tree bindings?
Without documentation (e.g., in
Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml), dtbs_check might
fail to validate the device tree.

[ ... ]

> +&i2c4 {
> +	status =3D "okay";
> +	multi-master;
> +	mctp-controller;
> +	mctp0: mctp@10 {
> +		compatible =3D "mctp-i2c-controller";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +	};
> +
> +	i2c-mux@77 {
> +		compatible =3D "nxp,pca9548";
> +		reg =3D <0x77>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

[Severity: High]
Does this PCA9548 multiplexer require an idle-state property?

Channel 1 connects to polled temperature sensors, while channel 6 is marked
with mctp-controller to receive asynchronous MCTP packets. If the mux is le=
ft
without an idle-state =3D <6>; configuration, will it remain physically par=
ked
on channel 1 after routine temperature polling?

If so, could this cause any subsequent asynchronous MCTP traffic arriving on
channel 6 to hit the disabled mux channel and be permanently dropped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-ventura2_i=
nitial_dts-v6-0-375d8e9d7ebf@gmail.com?part=3D2
