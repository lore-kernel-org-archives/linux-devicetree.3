Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834586;
	b=VhUWo0nX7FXpqXJhnuuS3Vx0YvTNbdHyyGqMCMn3KTeQNaceHxmTsokEVYwRrYY4Eisw
	 8l+dXEVPDbL6Y5/vHIa78Iza20vMN74r4MaZR66FEgpiWrfNSRlB0YeLfr5kyCTl78ZGg
	 Uu3xykO72IdbI2liCN1/ffGbsaEZDIr582AqmP3Qe/X8MEXmNOxKH9WQl8DJNz4YfB573
	 33FrsRQQGTxwph770iYsnAnOzvBA/jWKwXib9o3+0T5RxoGUCn8DRXmz1oa8nbqxDk+gZ
	 JvfW1wDYmVudEo4LIHoWHzN39ouRumiQ4AD/gOs3tOqb8njglyIbW7FOMTVE7D6UuwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834586;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gMyE/bwNHNvJtVtft6/NTSea/d4Id6yYWiO5x03MIPU=;
	b=QgbSnVXhMyK/iiyC1fxwl2yQNrxxaUgZyfW77O6TDCtV6w6ab1EwHkWfYCIAAZtJ7MIs
	 fWg+cCHfVkWnIcKp6WC5Us8dm5R0BIfnQPD2X+sTqLUlPWMyXWX55KxP1p0cI3GRbwCGn
	 nDm+oHv5GyGolvU0Q6jFwzIgZm/R/5DaUrAgvrh5mYm/449slXl1gZyH63xIjt2ZnP+sq
	 coZcqZlJQKRsjh9MU2pNvPQlyT4IdxGLakzXGnR2PTZGzu7Durc7epS2oG2du6nIdA9Yo
	 Glf0oByPOMZqJJh3d9zC3JWLY1Vf171iy4olFt5sLgdPFrvWQUbZ8V+kSrsiQTYF0Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gf2rqR+s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E1F606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gf2rqR+s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E355F1F01825;
	Sat, 24 Oct 2026 09:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792834586;
	bh=gMyE/bwNHNvJtVtft6/NTSea/d4Id6yYWiO5x03MIPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gf2rqR+sQ2pRf/tXhR1gZwubb0kE3RYu2sOF7kAGjvE59LyCHYnuIPGKlzBCgMEzv
	 nGmk3JNTDQ3zpXWO+UnKi9P6upN/wsZ2D34RsIx8tmiF3XddMMoBE5b4bjIy1Pupzl
	 2ka64P76roMiCPkcK9G91jaNmclRoNAFveWLEnUV4/ss5rmXBGt7oND3teK0cYiUf9
	 JXGF4A9YOYWQfttF17qFqz8S2vrU356BU6gTNueMuC8hLp/oyIiXqliJGL2gm0AfLQ
	 DkeVhiTb+4xzhDfzwkHBWohDgZztRtEntGBhawhQRSWiGuYXTgQQwJI45y1vnDMnF+
	 tlCIKNHBgX7GA==
Message-ID: <sashiko-outbox-183622@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com>
References: <20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 09:36:25 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: sm7125-samsung: missing unit-address on rmtfs_mem=
 node
- [Low] arm64: dts: qcom: sm7125-samsung: unit-address without reg on frame=
buffer
--

commit 0db97bf83930cb651c62d03dfabe385a7334be7f
Author: Erikas Bitovtas <xerikasxx@gmail.com>

arm64: dts: qcom: sm7125-samsung: add initial device tree

This commit adds the initial device trees for the Samsung Galaxy A52 (a52q)
and Galaxy A72 (a72q) based on the Qualcomm SM7125 platform, along with
their shared common device tree include file.

> diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sm7125-samsung-common.dtsi
> new file mode 100644
> index 0000000000000..3a8339395d6cb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
> @@ -0,0 +1,583 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SM7125 Samsung common device tree source
> + *
> + * Copyright (c) 2026, Erikas Bitovtas. All rights reserved.
> + */
> +
> +#include <dt-bindings/arm/qcom,ids.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include "sm7125.dtsi"
> +#include "pm6150.dtsi"
> +#include "pm6150l.dtsi"
> +
> +/delete-node/ &rmtfs_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &tz_mem;
> +
> +/ {
> +	chassis-type =3D "handset";
> +
> +	qcom,msm-id =3D <QCOM_ID_SM7125 0x0>;
> +
> +	chosen {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		framebuffer@9c000000 {
> +			compatible =3D "simple-framebuffer";
> +			memory-region =3D <&cont_splash_mem>;
> +			width =3D <1080>;
> +			height =3D <2400>;
> +			stride =3D <(1080 * 4)>;
> +			format =3D "a8r8g8b8";
> +			clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>;
> +		};
> +	};

[Severity: Low]
Since the simple-framebuffer node under chosen uses memory-region =3D
<&cont_splash_mem> instead of a reg property, does naming it
framebuffer@9c000000 trigger a dtc unit_address_vs_reg warning during W=3D1
DTB builds?

In scripts/dtc/checks.c, check_unit_address_vs_reg() warns when a node has
a unit name without a reg or ranges property:

scripts/dtc/checks.c:check_unit_address_vs_reg() {
	...
	} else {
		if (unitname[0])
			FAIL(c, dti, node, "node has a unit name, but no reg or ranges property"=
);
	}
}

Should this node be named framebuffer without the @9c000000 unit-address
(and without #address-cells, #size-cells, and ranges in chosen)?

[ ... ]

> +		pstore_mem: ramoops@b4600000 {
> +			compatible =3D "ramoops";
> +			reg =3D <0x0 0xb4600000 0x0 0x100000>;
> +			record-size =3D <0x40000>;
> +			console-size =3D <0x40000>;
> +			ftrace-size =3D <0x40000>;
> +			pmsg-size =3D <0x40000>;
> +		};
> +
> +		rmtfs_mem: memory {
> +			compatible =3D "qcom,rmtfs-mem";
> +			qcom,use-guard-pages;
> +			no-map;
> +
> +			qcom,client-id =3D <1>;
> +			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
> +		};
> +	};

[Severity: Low]
Here rmtfs_mem is defined under reserved-memory with the node name memory
and no unit-address, while sm7125-samsung-a52q.dts and
sm7125-samsung-a72q.dts override &rmtfs_mem by label to add a reg property:

arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts:
&rmtfs_mem {
	reg =3D <0x0 0xf4f00000 0x0 0x202000>;
};

arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts:
&rmtfs_mem {
	reg =3D <0x0 0xf3700000 0x0 0x202000>;
};

Because referencing &rmtfs_mem merges reg into /reserved-memory/memory
without adding a unit-address to the node name, won't this trigger a dtc
warning in check_unit_address_vs_reg() under W=3D1 and a dtbs_check schema
violation?

scripts/dtc/checks.c:check_unit_address_vs_reg() {
	...
	if (prop) {
		if (!unitname[0])
			FAIL(c, dti, node, "node has a reg or ranges property, but no unit name"=
);
	} else {
	...
}

Since the two boards use different base addresses for rmtfs_mem, should the
rmtfs_mem node be defined with its respective unit-address (memory@f4f00000
and memory@f3700000) in each board's .dts file instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-sm7125-sam=
sung-v5-1-5a602ab00626@gmail.com?part=3D1
