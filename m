Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795702228;
	b=LQHggGqEFtJy8ZNmlPjzLJKV3UwtnRb2JSU8hZl04QrvqCygDwbuEAdt93lxuwQwU/BP
	 OeVzq1NJMYJd2wwC/UNFRx75ZpAmAtiF6fgiL3nZM8E3c+kykHFWSSXq+TFdgUiPvndMZ
	 OcFx590rdEE0jyZblVuaTB350LRDuEmwc8jtERDmNajVuRRw7YXVmXvFJ5krdrS9esLB6
	 BYJNU9J1zEZlPKyJApfLO+eCk95FMbPIZxwj1VTM8UTv0rJa6MlkDUPP27s0KS1bfKEcK
	 Vr9AJS4pT+w0YtVxfWntoDDb1nJrePh2+COESB1Fpy7gp8qa+wgek1w9aEJ2+eVYKKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702228;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l13PAy8Lt7be/rzmRTHnTIpDeflZg/IlI/nLuuZsGbc=;
	b=SYeSuVrWC5xonGx5Cy3hYnv76OAUwhZlHG0SbXe7lliGQ6a/PZeeT/zPZ+X6oX/6mqoa
	 X81E526wiAluLU9bqAo4ZmQvSBPnl08du2++VO/qlEfcLeXMaVrZAbBDaWEEYMgfoXwtZ
	 4tommUMJJFmltsKpKF7RrudHKo7YLn3FmiGYdOq5Aj15q9v4qYUE+wXcjJy6QzsMVT0wi
	 Zd4A0MUuj9WNFR0nfFU4VYhzTPfprrD8Tbnu+e0ErxsIkku04Lkcgry3BspL21wf8zwwz
	 pMMhFbOrS0ER4splv+Tjl8/+nbwm44W2Rq03GNcg123Vny5kim9CXgeR+kVD5DaXFJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXdG1OIV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38D5606A323;
	Thu, 26 Nov 2026 14:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXdG1OIV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795702227;
	b=yX+8P9gSbepL/o9JD2JUa6dWkse2RPRCJu5unbzsUFZmcEaKQZtfVQcyVKmZUcY14sit
	 zWGCkZEEUBqbLOGgrEVHI4q9xJSi6jhPxIXt+R7aNEBmjGge9ghleHSENed3GUQVwMqSQ
	 xxQBmb2NBZKcmTK4AdSDH+7D8MryCjSyqSG2bA7oYzS169Qz8Imo8t2jwYOkCY6mRKPtx
	 aZXkmxahtQuXNNUQjT0aqfX0+sEkqAhumWe8MMxQIdTkBr6m2KvKEiG1vs+6EN45uijq0
	 bFsgcRsMNd0btzzcYLm8Fs79hlgKantM0Z+SfEItWA798J/WyFhDAXTXYfDPeC9Zhbg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795702227;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l13PAy8Lt7be/rzmRTHnTIpDeflZg/IlI/nLuuZsGbc=;
	b=euIGG/n0nLLkTwkdjQrJimUlvd30XIMKOREeDavp2kRGrh27RGlHBhxYlP5Uk83KgDQ7
	 rsLONv5ra7ditGdkdWELDEM/aKBIws90TVRInIcrYAnQycMo4DL9MrjPb1ezT4Aaes4gM
	 ymAk3wr/t24aShjom3J9cGT8b+kc0AaUCiXGzNKJKCtI2sTRu6q1ywU/FtRT1fXIAWcYY
	 9X+D/68g6YPtRU30EcCC84B8gfdFsLrSWpJounupN5RfEt3J20G6WHqx5TGn0pw93ioZc
	 dWbZSOpIgfWpzCNKgbhR8wFzS3x4UxySFeGYI68eO/Me9lTLJPH2gjmHtTDAb2MfrcQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50C521F000CA;
	Thu, 26 Nov 2026 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702227;
	bh=l13PAy8Lt7be/rzmRTHnTIpDeflZg/IlI/nLuuZsGbc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QXdG1OIVHhtxGBQlapNmCp0RI92lL1zj2RkMPTyVVMQ1oBIWVpIRzm0ukx7KgWIcW
	 nqyVWGeTf87EbfYnntKRxl3J8T+kMe85rAyhTJpWuJL9VN9JR4tu815/eUglMAoYZi
	 GrsT+E+jdClPvp3lcL4o3oxc4cihnPL51pDR4GdbK004Oq1fUEjUsC17/fH82shgtu
	 OLqkABQMg1/49UQ4UTOvnbwmbrWaAHh8Zmu8FmqkC0G5+N7Pwx1y422Cyiwp7ASrcU
	 wTYYlezJ6PW4swH0FeUqU689iOdjih4ZkrFn1tWrCY2EkJ1WTHtUqNsVNKUz+uqgFa
	 qSzkPgcG/ah7A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CEA164D585;
	Thu, 26 Nov 2026 14:10:16 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 15:10:18 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sc8180x: add IPA node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-sc8180x-dts-ipa-v2-3-e919ed1643c1@gmail.com>
References: <20261126-sc8180x-dts-ipa-v2-0-e919ed1643c1@gmail.com>
In-Reply-To: <20261126-sc8180x-dts-ipa-v2-0-e919ed1643c1@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795702215; l=2437;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=6rP+6epRG7aDWDFkrRhxq3T1T9kA81d5s9trFI8/GvQ=;
 b=2jY8GawJF80ipXEPC19qYmeEVJT/5PX9LStRTWIu/BrEmADS+JZ9kqUBn/8c+9iY6SoeUAhOF
 0Rso25u9e+sDxQ0V8K2dS8tB+NuF+e74qwvEMoVWaelX+Respr4NQIa
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

Add the disabled IPA v4.1 (ipa@1e40000) SoC node to sc8180x.dtsi with
its register regions, GIC and SMP2P interrupts, RPMh core clock,
interconnects, SMMU streams, AOSS QMP handle, SMP2P SMEM states, and
IMEM sram reference so board devicetrees can enable IPA with their
board-specific firmware and reserved memory region.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 45 +++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 7865054a3fafb85e34daa31b985e3c66f8d7e03f..149d8062551b0d940006a8fc4c7f3235f468d6a2 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2261,6 +2261,51 @@ ufs_mem_phy: phy-wrapper@1d87000 {
 			status = "disabled";
 		};
 
+		ipa: ipa@1e40000 {
+			compatible = "qcom,sc8180x-ipa";
+			reg = <0x0 0x01e40000 0x0 0x7000>,
+			      <0x0 0x01e47000 0x0 0x4000>,
+			      <0x0 0x01e04000 0x0 0x2c000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc GIC_SPI 311 IRQ_TYPE_EDGE_RISING>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
+					      <&modem_smp2p_ipa_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_ipa_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
+					 &system_noc SLAVE_OCIMEM QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_IPA_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory",
+					     "imem",
+					     "config";
+
+			iommus = <&apps_smmu 0x520 0x0>,
+				 <&apps_smmu 0x522 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+			qcom,smem-states = <&modem_smp2p_ipa_out 0>,
+					   <&modem_smp2p_ipa_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			sram = <&ipa_modem_tables>;
+
+			status = "disabled";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;

-- 
2.47.3


