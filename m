Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315A851812D
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068512; cv=none; b=EBlB5De/f6QlRvX/SUXH3WiyCbgeYOsqeU/I/1OppsxpTXi6oNo9m78fvcmDF/EKjxlZ3UjvplJl73twOs/kWg93Js2WmfRLN95xPuomk6vl4btUXOhoqE9G1JHOA5oBDlfXrv/HUG0Rwfd3xAvwlTLRVxN/Xy2329JQfaOFIJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068512; c=relaxed/simple;
	bh=UjElcdJO3OEH0A8uMBWXbPe8hlceoldVvnaPuBCCY7M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=asvZN9kUElEF2ElHi2snVgBfIn2VEIAuA593Z6MZlwkL06/wo7nTN4WycuGC1gH3XK+RLGGKH/zXXYbzjv+j3rwT7vt+URzZvdWap8Fwe9m8cdN7DOV2VzOgmx0dqIy57+zFM3dxaOF1b0cvIWVXE/b3YWBfALI4bW9P7emKTGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YD4AADEm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YD4AADEm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904691F000C4;
	Thu, 15 Oct 2026 12:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068510;
	bh=jlX+OCuB4XBCYhq6c5UbQgIfx5D8rC3jQyWqx7t3ITI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YD4AADEmXmH03aZHKjL0nZ9pRdAJVyg0aHhJ3dv2Djm+QuciL524L7R/5L5liK48T
	 IC7//r8HriVJrl7Vt7qKFET9Rx0jozMjAVKP/n/5lhrESbRtl7n39XjbYB0Xbh9vyg
	 CcXVWPNwQUzd1/J69GF62BeYGyoomgl5XKn/N2ihHtvWfB02osVV3EfjW9LlrweWpx
	 fqeFY0UgH+LCYc6eKBcYa5xgXe2P19r21Xja3zgaJQFMlwLElX0LkOV4NOwNERWRx1
	 /8Ct5/2E35EchvEXsTWJgQVZmQM+8c0zjcs5GYe7AFxgWWXm+aQyzu/nHU+ejx+qAz
	 klXMRNDbivM7g==
Message-ID: <sashiko-outbox-172864@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 2/2] arm64: dts: altera: Add support for the Agilex27
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015123700.2137706-2-dinguyen@kernel.org>
References: <20261015123700.2137706-1-dinguyen@kernel.org>
 <20261015123700.2137706-2-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 12:48:30 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] arm64: dts: altera: Missing VGIC maintenance interrupt in GICv3 =
node
- [Low] arm64: dts: altera: Unnecessary duplication of SoC DTSI file
- [Low] dt-bindings: arm: altera: Undocumented compatible strings for Agile=
x27
--

commit ef21748becf923e3ea0b9bb9bcd2a6ea73fa866e
Author: Dinh Nguyen <dinguyen@kernel.org>

    arm64: dts: altera: Add support for the Agilex27 platform
   =20
    The Agilex72 platform is being rebranded to Agilex27. The Agilex27 is
    exactly the same as the Agilex72. Add the base DTSI and the devkit's
    DTS.

diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi b/arch/arm64/=
boot/dts/altera/socfpga_agilex27.dtsi
new file mode 100644
index 0000000000000..369981fe85e38
--- /dev/null
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+/dts-v1/;
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible =3D "altr,socfpga-agilex27";
+	#address-cells =3D <2>;
+	#size-cells =3D <2>;

[Severity: Low]
Since the commit message states that Agilex27 is exactly the same as
Agilex72, is it necessary to duplicate the entire SoC layout into a new
file? Could we include the existing socfpga_agilex72.dtsi or add this
compatible string directly to the Agilex72 device tree to avoid keeping the
two files in sync?

[Severity: Low]
Is this new compatible string documented in the corresponding devicetree
binding YAML files? Without it, running make dtbs_check will likely trigger
validation errors.

[ ... ]

> +	intc: interrupt-controller@7000000 {
> +		compatible =3D "arm,gic-v3";
> +		reg =3D <0x0 0x7000000 0x0 0x10000>,
> +		      <0x0 0x7080000 0x0 0x100000>;
> +		ranges;
> +		#interrupt-cells =3D <3>;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		interrupt-controller;
> +		#redistributor-regions =3D <1>;
> +		redistributor-stride =3D <0x0 0x40000>;

[Severity: Medium]
Does this GICv3 node need the interrupts property for the VGIC maintenance
interrupt?=20

Without it, KVM initialization via vgic_set_kvm_info() cannot proceed becau=
se
irq_of_parse_and_map() returns 0. Could this silently break KVM virtualizat=
ion
support on this platform?

[ ... ]

diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts b/arch/a=
rm64/boot/dts/altera/socfpga_agilex27_socdk.dts
new file mode 100644
index 0000000000000..15d331cdeeb47
--- /dev/null
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+#include "socfpga_agilex27.dtsi"
+
+/ {
+	model =3D "Altera SoCFPGA Agilex27 SoCDK";
+	compatible =3D "altr,socfpga-agilex27-socdk", "altr,socfpga-agilex27";

[Severity: Low]
Is the altr,socfpga-agilex27-socdk board-level compatible string documented
in the devicetree bindings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015123700.2137=
706-2-dinguyen@kernel.org?part=3D1
