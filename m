Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779336;
	b=mZoxOe6njX0pVFnjx1PoR5ghBFMGjlrlut5Tz/wnwYW7zW86yIeNDZGNlGBgzS1Ummns
	 qGvW1tJyzbSSRMVG0cz+jJM09Dac8XwuR2qQqDwE07ZD3VOhlnTDZRiqXrrMmoT4hQd+R
	 53HIpxgEEvu1WZid4555qRAWifO8DkKDAIorKUAY7tXdL0U6We7SF3yj2Xv8MxpfVMpjf
	 ixJjpcCU4xecTLpDFzySaK/W9Oj/jfZO3q5PM7E6rDoLidE7FYkxujgxKRrchMJv9JNb1
	 nVL7ALHWD3jwfm1vJWqN5/rm9xRoj1RUlHjoD0N7/i2rILkZTdulcOLpQxwK5pRx9+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779336;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lLRxe+WRL5Tt1qmEfe063UHbl97ZvSjHDmgU7Zlb114=;
	b=m+rz8p7cFCP7rl5T71WCXa+cddMhVkqsfHZhBmhpsrVnBGkhMgIPU2Bx+11VcagGrK7e
	 cc7TeV4IvxpshC+Y71Xco+ZLRm7AOXOSFD5MA0vt5H4wHmo8ZSYmIeyybJq4yBNT7eShw
	 vGdFpAMdDoCZpqmx/vuJqRYKHhqmjvVGkaQfcs/xEbL7eFqdlyUzBtApG5bov3tpWzgfm
	 AwxyUAto33A9HfA/2EilkYKkNfLgS+drWOhlLiBbcj/S8QsCk/V7lD3wZ4dR1umVbV8vh
	 ukPPKDXv8BOnksQ6i0wlJhaNDwHJKMZLeBSAjArrXXFuX9nt3X/E6RtetAf4KDqp4mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=q4tf6nTD;
	arc=none smtp.remote-ip=95.215.58.52
Received: from mta1.migadu.com (out-52.mta1.migadu.com [95.215.58.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2786606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2786606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=q4tf6nTD
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yrO/dcuuSf7cIbw7Ajuoa3PoxR9KFe3FZf8RGEdAbUk=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793779333; v=1; x=1794384133;
 b=q4tf6nTDwvOMi1q8W5irOS7aG7pQt+D3kqMFhHq++M/a6PbT3SIPIFvjZ8G7XVzO8LbJ8vZI
 E+BtEhFcHoWYgQW62cC9jyQk6GdS0+jpp3OCEhAQFV8SldxSixueETdOch1P5oH1ODxKvH5Shn2
 yllLRFo9NdBks7MLEt1M283uAS+Fuvzhz7oSMZYCNJULn8dybnPwatbC/Qmyhi7g6XJBBftkTt6
 4CTMH2Okt+ejsvdWphRO0vHp1oLKb9qdUBbuIp/RDDJ2swcHzIlH8mfnbz5baB49Stcn5X4gIac
 IRZpTbz2Jr4D893RKbsrrO+720PmZAE0mnl8VZjC6/lnA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9f16b7435e8cfdb5;
	Wed, 04 Nov 2026 08:02:12 +0000
X-Mizu-Trace-ID: 9f16b7435e8cfdb5
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: sc8180x: Add SLPI remoteproc node
Date: Wed,  4 Nov 2026 05:01:40 -0300
Message-ID: <20261104080200.135431-1-val@packett.cool>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sensors Low-Power Island remoteproc hosts the Sensor Hub firmware
that Linux userspace (hexagonrpcd) can talk to.

Describe the SLPI node for the SC8180X SoC.

Signed-off-by: Val Packett <val@packett.cool>
---
v2: use single compatible and add it to the driver to match bindings
v1: https://lore.kernel.org/all/20261104074200.123842-1-val@packett.cool/

Forgor about committing and sending this while submitting the Surface
Pro X series v1..

Since this is independent and simple while that series is waiting for
comments about the multi-PCIe situation, let's get this in first?

Thanks,
~val
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 61 +++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index a85e3211958d..ee1a83a58997 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2259,6 +2259,67 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		remoteproc_slpi: remoteproc@2400000 {
+			compatible = "qcom,sc8180x-slpi-pas";
+			reg = <0x0 0x02400000 0x0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 494 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC8180X_LCX>,
+					<&rpmhpd SC8180X_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&slpi_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+				label = "dsps";
+				qcom,remote-pid = <3>;
+				mboxes = <&apss_shared 24>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "sdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x05a1 0x0>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x05a2 0x0>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x05a3 0x0>;
+					};
+				};
+			};
+		};
+
 		gpu: gpu@2c00000 {
 			compatible = "qcom,adreno-680.1", "qcom,adreno";
 
-- 
2.56.0

