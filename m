Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D31B1A9F97;
	Tue, 28 Jul 2026 00:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198014; cv=none; b=oIJSyoNxaUAwMDJ6nsGpWWYHhEcS5zZGiDpzZhC9k5X9bvsDvBz3ZeccYMFQIrCF1irtKgjNfNU4qtOC/2iwSXOocqkn6yyNy4/S8cJVfVwTJVk5iyeYOv/f/QWJdoq1cUjWF9oedAoicl7OPAq160x1Q0n1dvqs0Nc2yBAUvTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198014; c=relaxed/simple;
	bh=z0z9HKkt5xJWKVxY9wNFgJA9NoEeFQtZiIWpZ1gdyak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OnMOAMLoZh1sTZJdhioKDbMe6xNkeeV8bH0MTH1q7cA4gT53SKExQlk+K9haAeTu1ul7x55IQkXdPWt/8bGgu507tPOQNfgGF2bMOLlEp6rbiC6elVzVE0DZ/jkK2Q91hzwyAXgMngpLP42UJE2/TvRkfsIhfh7fpdln0hSsNjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4PmGLhB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4PmGLhB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3549C2BD04;
	Tue, 28 Jul 2026 00:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785198014;
	bh=z0z9HKkt5xJWKVxY9wNFgJA9NoEeFQtZiIWpZ1gdyak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V4PmGLhBTI9dABIfjGdlssBLrrjI4B8u29VuaIwMxKBPeHh0ec7Gw4nxlngVEMX2v
	 uws3hx625x2xojgCS0h3LVC0oQGkcICMPzW3Irv5BU6FLXVbEjEmqvKtpTPXMyBZWy
	 ur5ev7oAGDdF/XcKBLDbRvaliDTrzt2ySVLJEKJyBbr+6wS5cGMIufo+DK/7e7yz+u
	 BcePcMQ3wGMTIS0+Byn/KQBQiqfI+jSorRVMZWyionOLOmBYEE1C47wgLx1cVil3RY
	 /7L3m9dmM/INpBC9lys7FvuWrybI3oe+b3kM7bKIdwnIzXuShUXbmwWuI6Sgul788c
	 S9hGmJEazPKRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB10C53219;
	Tue, 28 Jul 2026 00:20:13 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 27 Jul 2026 19:20:12 -0500
Subject: [PATCH v9 4/6] arm64: dts: qcom: Add AYN Odin 2 Mini
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ayn-qcs8550-v9-4-e3db456e10e5@gmail.com>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
In-Reply-To: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785198012; l=2527;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=Nat69cvy0A5zbtXd19yXFsqxMJnYkxoq/kSke8/u9u8=;
 b=+wyXywkygS4Z1SANGlBTHvjsu05xAFHG3soFDu7QJ5HqqHyzBEsapNk1E2ld9D/mayYQpVyIM
 B0WqJvjFW2/B3/Hn1FygG7kX3IFeo7aEKytuJCX7mpJEq5a2dCHWYq8
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Teguh Sobirin <teguh@sobir.in>

The AYN Odin 2 Mini is a high-performance Android-based handheld gaming
console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
5-inch mini-led touchscreen.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  1 +
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e5..006d5ce1af17b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -192,6 +192,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-rb5gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dts
new file mode 100644
index 0000000000000..cc894bdd0c902
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Teguh Sobirin.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "qcs8550-ayntec-common.dtsi"
+
+&{/} {
+	model = "AYN Odin 2 Mini";
+	compatible = "ayntec,odin2mini", "qcom,qcs8550", "qcom,sm8550";
+
+	vdd_disp_2v8: vdd-disp-2v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_disp_2v8";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+/* There is an hdmi bridge on i2c_hub_0@48, but it is not currently supported */
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/ayntec/odin2mini/adsp.mbn",
+			"qcom/sm8550/ayntec/odin2mini/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&spk_amp_l {
+	firmware-name = "qcom/sm8550/ayntec/odin2mini/aw883xx_acf.bin";
+};
+
+&spk_amp_r {
+	firmware-name = "qcom/sm8550/ayntec/odin2mini/aw883xx_acf.bin";
+};
+

-- 
2.54.0


