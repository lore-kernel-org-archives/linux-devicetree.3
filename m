Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19862E65D
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783248380; cv=none; b=UutXtui3QsEXVdjnLQo5KbNbbYODZ3RY4IRCELotf4orG7G6J5DEKHjReMiNQz07e+P3DDnDxIktFJyihRysp/YoPRiP1CApCjai+xyWJ4U+ukRRC7wEr42ha4w/4mucTc5SQUOUWttxjlZzVIAkXiusXAu4lcCFsy0sggcZesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783248380; c=relaxed/simple;
	bh=h/QQYQRd6YEM4Yo945Sf0ZEVHruemxlUjTGkZE+lJBQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WLpp7WGWixpCtywvQAhcwIpC1XHt7Ri4cR2qW6O8JtNBe9QcjBTTlHB9r/+/hqh6/BPlrwJApRCxgkYYNRvdjb4S72hK8GC0lVGWuUr/tZN3ujfXBIFZ3QBICxgmU07gWtDbK1sdrLNdfz3rpL5p9z0HXSuMeITC4t/Y83Oflj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqQwfRT4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqQwfRT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8241F000E9;
	Sun,  5 Jul 2026 10:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783248379;
	bh=o+x4Lw3GSCrutiUWGXv4a8OsGzKvjc9qQ1hjFgbEnKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oqQwfRT4FsWGxi+VUdMLLd7a55AJkddVCLoy/wKQDTpqLTR/c5Aq6kuLoGe+s20kt
	 IvmR5iKXNbi7fCVSrSW4m30b+XVr9AG6ncNJ9EcjThkFtsol8P8ZKQUOJ+SWnkTJOW
	 fo/vr7ZdNCJT0S1h5UeEFcTsAMtCZgJnmUXfSok+6UMZg5kr6+bfV+qo1GXRC0opJd
	 PHvlYPqOmDag2wC+AGx4WqLnkfSEn3v4bNHbZwkPWFf7IuMEdef0G2StwinJ3xrv09
	 rwUNaMPG5ptxIrES1uF1xBdWxIJ/b+Va2oRVB8oYvmCkCc3KwuCwBDIw49iTLPr5Yu
	 xSnAX5rODZlLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
 <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 10:46:18 +0000
Message-Id: <20260705104619.0C8241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing explicit `#include <dt-bindings/input/linux-event-codes.h>`=
 (or `input.h`), relying on fragile transitive inclusion for input macros (=
`KEY_VOLUMEUP`, `KEY_VOLUMEDOWN`, `EV_SW`, `SW_LID`).
- [Low] The `rmtfs_mem` node is defined without a unit-address but receives=
 a `reg` property in board-specific files, causing a `unit_address_vs_reg` =
DTC warning.
--

commit 50b01ca3bfe2c4df6217b51c5cea041f5fa4dfb9
Author: Erikas Bitovtas <xerikasxx@gmail.com>

arm64: dts: qcom: sm7125-samsung: add initial device tree

This patch adds the initial device tree support for the Samsung Galaxy A52
and A72 on the Qualcomm SM7125 platform.

> diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sm7125-samsung-common.dtsi
> new file mode 100644
> index 0000000000000..512a151fbff93
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
> @@ -0,0 +1,536 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SM7125 Samsung common device tree source
> + *
> + * Copyright (c) 2026, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <dt-bindings/arm/qcom,ids.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include "sm7125.dtsi"
> +#include "pm6150.dtsi"
> +#include "pm6150l.dtsi"

[Severity: Low]
Does this file need to explicitly include <dt-bindings/input/linux-event-co=
des.h>?

The gpio-keys and pm6150_resin nodes use input event macros like KEY_VOLUME=
UP,
SW_LID, and EV_SW further down in the file. Relying on transitive includes
can cause build failures if the included files are refactored in the future.

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
Does defining the base node without a unit-address here cause a warning
when board-specific files append the reg property?

For example, in sm7125-samsung-a52q.dts:

&rmtfs_mem {
	reg =3D <0x0 0xf4f00000 0x0 0x202000>;
};

Injecting a reg property into a node named "memory" (without an @address
suffix) usually triggers a unit_address_vs_reg dtc warning during compilati=
on.
Should the base node be given a unit-address placeholder to avoid this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-sm7125-sam=
sung-v2-0-d3b17005ecb3@gmail.com?part=3D3
