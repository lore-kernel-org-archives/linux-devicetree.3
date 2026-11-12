Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486252;
	b=rg6jt7xsGt6uD5IeLUbdTuIoxlTM0YIMxC5uobOOLzq7FXuhUfNS6P3PgOePn2XkQzgP
	 QePgiUxqUrYefaL6rwClrlBkX9Z52fzqB9Nz+Dpn7Q82o6sSRmwKp/f6ti9RgpnagAius
	 d5p0FfoA9V1oFNf4J5orJZ4+Yus/8XWw46uil5DUaExG5x4OReFa7pH0Qf4l/4gXtAGUJ
	 qcYjwy+TmfShdlqRHwev2yE2LEzIq1hr9mlpC3xnPmIaD45BEpExZrd6evcYZREPbSi61
	 DtNJmZKs8Mltxk0GSZGTvkrEpxFzonRsvy4oucvbfd9O/wAPzfyqAqR1FUJ2USHut2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
	b=lVmMHRja3Z/gV9xpv9atIOa4WU59eQDuLYEtyChv1PPEWaVkh8C8TbfNpKtWBpPqepvc
	 6xoGGcht0RPAK4L9PjKbGvDkCiA9Z33NiU/OtnH+1txy6In4cOsUi1vJgtGN7mTIbpo54
	 O3SRfB2+oMjRSw3cyDu05KIjeo2vSqcQPC5C7HPKTcnjlcyA3PO4tJfjaoFWPiQnEAGpW
	 LA+amNfQomi7B0br28hGR+JD/oYnfFR3adX9JJHL5cyXn0GV5iN7NPEnICn87LAlUiAG1
	 Vx0G4Eko+u/O3M8+kkEbxkPrd9g+V+ncQ9G7rm3rIdqtO10ml46nsd4mhFRa9nu8Zbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRCnTnlw;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84F3606A899
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84F3606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRCnTnlw
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b56221d361so4797244a12.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486250; x=1795091050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
        b=xRCnTnlwyQK/GwQHxD3U4V7068WV71muUSmVB9T+ddX6SRehGgIRfKDBahkM38wTRv
         kNZp5kkNQzsufsP7DK7ZzC+86U4LtwZ/ulFefiWzKJ8kG+5b4enkrM+5Wt3q5Dd4Cud9
         f1SW0m8Ng3vnfQD+16RQHbrBZ0rte2lorC2UhcHuZIPqevOF0tP0IE+QcVf2d2ARWXJR
         Bgw8Zi+IRfyhg15kYLr2z4JdAKyo0ZI4qiEPudMMsoXS3+HTWqJNUSbHsxXS5ideZ7JG
         dBqxoKOUg/XpiFtpkkpYfwXWYXaJBbnyVPEQZu8XpYe3BdCLBvTjtAUpMlO6WlBWvz9C
         25Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486250; x=1795091050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
        b=A08FQ3zOAAIpYekdrXEcDdtIezbpTGoPts6Q0G8jPbAUduQeKeQh2Vomqw+Za3EzEQ
         XjvtomEz3e17k0hXpiT66cJu3WuWLEP3fxOhlLuiuq2Gx3ABFbrdsodmuBimZmvEIXr9
         cQeVBPr7W7T4Ue89hfBJ+ohoiWczHKJm02nQmAOMDxRw3lYrlrKJ5vJdoQIpBLYiQW7T
         ZjnO3qTL158VCz+197vzDBUhqmlXge202ItM6UfWL1rbhpTX1DooYxhXp+L8ZdEBxRbo
         O5uSRM4mIGnxUBpi8FRxtuqvUU5FQ6ZW6/4tIjis7Xb84fs3nsm4fcsBilAvzTzclhmX
         /MSw==
X-Forwarded-Encrypted: i=1; AL+hErGQwDkDkSuaPQ2PrJIekv4JAXXQbHa+3wNLy++FW8Ig45mS9Q9aCEbsjKvSFZcXD1jt6t/kGnbh+esg@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ehfdp3f1pB7PMF7FY9ySAr8eLkXK0Toebt+pEQ4zawsxSVcuk
	eHPfJBc5/MZONnmk/c9J01LC3CGZJBG++vPV+qSN5YVvv5WcPcZmWbNN
X-Gm-Gg: AYBFou1n4dWGSp3T9Lfnz3+fyflxNpKqVtthbAqVB3zypjX2IdG7bXzq5GDEKRubpC/
	hLI3Z1a7O56c0NGrVfA81UPikBN5Vrd3l8Tw7Spp2yyThmp+5R93y4eAkT7EoBDTX3+KF+qIM7+
	wfBQ7t/B92L0hxgXjQLYC+49BEpFYzf92p9RSl0vQ+cZWO6fXWdZQtg8L4zV6vHMCHfqJQloZrx
	WJFYDS5zeaBu5Oi7SLeojWqYtVz4B9bmMbxVcv3Pflp5+tOSrkWPbzBKYqwLUb2cmSUitL+Igyw
	baQ/ZdZGEnnCwWNIVNEU4Nk2v0fI8opp2hsCwclHDXW5hhU97eFOWNczKzcg6U7QHUY+m9sEOtn
	SxndpOD7MR3vw9UoeDb8aun4XzB0ESetmS9Tnof7thXL9QdBkEJ3ico8nOu8RrnthKn7PaJB5lY
	GVfon2b4cePgY420vqoEcAVyjP8mOyYS8iW+lJGqfk1PAlN1FibobIHda3G9PAqiqzlyQnPxAqx
	bGqK3Zs6q/pY2FTNLAr2Z0Gu3fKutY3O0ZlK43ntVHCDN5RNOVw3KdoYcw6O00fn/109K0pzbJN
	BJKh57LBd66DEh7XineMkBn6kf8hYXu20noZZfev
X-Received: by 2002:a05:6402:5607:b0:6b7:b872:27b6 with SMTP id 4fb4d7f45d1cf-6b7b872305cmr250988a12.13.1794486250115;
        Thu, 12 Nov 2026 04:24:10 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:09 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 14:23:23 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sc7180: Add GPI DMA
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-sc7180-gpi-dma-v1-2-2a8eceb49563@gmail.com>
References: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
In-Reply-To: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2

From: Vitalii Skorkin <nikroksm@mail.ru>

Add support for GPI DMA on SC7180. This SoC uses the same GPI DMA as
SM6350.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 29e345a6a13f..8bf669ce9f89 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sc7180.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -881,6 +882,26 @@ opp-384000000 {
 			};
 		};
 
+		gpi_dma0: dma-controller@800000  {
+			compatible = "qcom,sc7180-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00800000 0 0x60000>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <10>;
+			dma-channel-mask = <0x1f>;
+			iommus = <&apps_smmu 0x56 0x0>;
+			#dma-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3_id_0: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x008c0000 0 0x6000>;
@@ -908,6 +929,9 @@ i2c0: i2c@880000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -928,6 +952,9 @@ spi0: spi@880000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -962,6 +989,9 @@ i2c1: i2c@884000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -982,6 +1012,9 @@ spi1: spi@884000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1016,6 +1049,9 @@ i2c2: i2c@888000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1052,6 +1088,9 @@ i2c3: i2c@88c000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1072,6 +1111,9 @@ spi3: spi@88c000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1106,6 +1148,9 @@ i2c4: i2c@890000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1142,6 +1187,9 @@ i2c5: i2c@894000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1162,6 +1210,9 @@ spi5: spi@894000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1182,6 +1233,26 @@ uart5: serial@894000 {
 			};
 		};
 
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,sc7180-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00a00000 0 0x60000>;
+			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 646 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 648 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 649 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 650 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <10>;
+			dma-channel-mask = <0x3f>;
+			iommus = <&apps_smmu 0x4d6 0x0>;
+			#dma-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3_id_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x00ac0000 0 0x6000>;
@@ -1209,6 +1280,9 @@ i2c6: i2c@a80000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1229,6 +1303,9 @@ spi6: spi@a80000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1263,6 +1340,9 @@ i2c7: i2c@a84000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1299,6 +1379,9 @@ i2c8: i2c@a88000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1319,6 +1402,9 @@ spi8: spi@a88000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1353,6 +1439,9 @@ i2c9: i2c@a8c000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1389,6 +1478,9 @@ i2c10: i2c@a90000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1409,6 +1501,9 @@ spi10: spi@a90000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1443,6 +1538,9 @@ i2c11: i2c@a94000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1463,6 +1561,9 @@ spi11: spi@a94000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 

-- 
2.56.1

