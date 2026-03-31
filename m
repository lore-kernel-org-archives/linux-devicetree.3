Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E88632D7F8;
	Tue, 31 Mar 2026 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966768; cv=none; b=C7A/a9NZh6dX9HNgDBxzkTNX0Iz8SQcuXNCl1xs1QcTRyWxb5ESgqCrg54KWknCfFP8O2XsAz+A2b9kB+AdZy3iO20VSU4/AU36rMZ8owZm+bnMb9GfOQMU6Ge2UxWOQdjULKGuXU4kSDm5MIJOuI6bCcl19ElHmskesFwkma8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966768; c=relaxed/simple;
	bh=Z6h9bnAgtRDtxosaSxVkWHxCl99Fzyq/xqzZMKeZfTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CiiT3FqbR7fLmI4gKS30MxG0iNMzc8DZl2nuo3z6SKrpPL7o9rljx2kfQdGVQvGBNwvfBoIejEyfzpazR4KOjt9dfxbms5J97dp2GWhImK0/qm3W7rZ7GstmwFZRoT0Bl88Wnp0KE7XYYUxjx/i+resQEhYWs93gzbgutDdOmZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OkjGd52S; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OkjGd52S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=z54YPT1u3ZASk3/Tz/L2Y2ShGoBPllbzwmEBKa6bz9k=; b=OkjGd52SvMVJezagwXgcDYTIvL
	/6/JdyvazMk2wnuuXM2j6cVss3vceo0s4K1BOGe7Vmy1lzjZZLMnp5oaqEMYzyAhqzo6pCu8aii6/
	h6GwdCvIAgcCnICeibgDz2wqttg/sGO8S8n6f6G48/HipN8SQCEYCAxSrz+JMCRsJAS2QlZhYIBRa
	Uw/FMO5k52zPF5tt42Hf/66e/BjX+KI/8Ku+enJWniPBsGDC42LgaR+4slywO4eEUsVPkef44Rn2U
	FsLjvLB6jCw58CFSq/60iIDr5uuazt64aO0b46GasgByRX0rQ32HPrC0Xbi4BH1wpdtLR83AhK4Ay
	sjW+/rlA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwD-000Jsb-2C;
	Tue, 31 Mar 2026 16:19:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwC-000Mdz-3A;
	Tue, 31 Mar 2026 16:19:25 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: add various GPIO hogs
Date: Tue, 31 Mar 2026 16:19:05 +0200
Message-ID: <20260331141915.2918927-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
References: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27957/Tue Mar 31 08:24:30 2026)

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Add GPIO hogs for various signals:

- Reset signals not assiciated with a device described in the Device
  Tree (SATA, PCIe, ...)
- Inputs that must never be driven to avoid hardware damage

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../fsl-lx2160a-tqmlx2160a-mblx2160a.dts      | 259 ++++++++++++++++++
 1 file changed, 259 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
index a79290401551e..431e4ed2a8b86 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
@@ -187,6 +187,118 @@ gpioex3: gpio@20 {
 		#gpio-cells = <2>;
 		gpio-controller;
 		vcc-supply = <&reg_vcc3v3>;
+
+		line0-hog {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "NOR_SWAP#";
+		};
+
+		line1-hog {
+			gpio-hog;
+			gpios = <1 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "BOOT_SRC2";
+		};
+
+		line2-hog {
+			gpio-hog;
+			gpios = <2 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "BOOT_SRC1";
+		};
+
+		line3-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "BOOT_SRC0";
+		};
+
+		line4-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "EMMC_SEL1";
+		};
+
+		line5-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "EMMC_SEL0";
+		};
+
+		line6-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD2_4_MUX_SEL";
+		};
+
+		line7-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD2_3_MUX_SEL";
+		};
+
+		line8-hog {
+			gpio-hog;
+			gpios = <8 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD2_2_MUX_SEL";
+		};
+
+		line9-hog {
+			gpio-hog;
+			gpios = <9 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD1_MUX_SEL";
+		};
+
+		line10-hog {
+			gpio-hog;
+			gpios = <10 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "ENABLE_FAN";
+		};
+
+		line11-hog {
+			gpio-hog;
+			gpios = <11 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD3_MUX_SEL";
+		};
+
+		line12-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD2_7_MUX_SEL";
+		};
+
+		line13-hog {
+			gpio-hog;
+			gpios = <13 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD2_6_MUX_SEL";
+		};
+
+		line14-hog {
+			gpio-hog;
+			gpios = <14 GPIO_ACTIVE_HIGH>;
+			input;
+			/* Reserved */
+		};
+
+		line15-hog {
+			gpio-hog;
+			gpios = <15 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "EC2_SEL";
+		};
 	};
 };
 
@@ -223,6 +335,83 @@ gpioex0: gpio@20 {
 				#gpio-cells = <2>;
 				gpio-controller;
 				vcc-supply = <&reg_vcc3v3>;
+
+				line2-hog {
+					gpio-hog;
+					gpios = <2 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "QSFP_MODPRS#";
+				};
+
+				line3-hog {
+					gpio-hog;
+					gpios = <3 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "QSFP_INT#";
+				};
+
+				line5-hog {
+					gpio-hog;
+					gpios = <5 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "IRQ_RETIMER_1#";
+				};
+
+				line6-hog {
+					gpio-hog;
+					gpios = <6 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "IRQ_RETIMER_2#";
+				};
+
+				line7-hog {
+					gpio-hog;
+					gpios = <7 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "MPCIE_1_WAKE#";
+				};
+
+				line8-hog {
+					gpio-hog;
+					gpios = <8 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "MPCIE_1_DISABLE#";
+				};
+
+				line9-hog {
+					gpio-hog;
+					gpios = <9 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "MPCIE_1_RESET#";
+				};
+
+				line10-hog {
+					gpio-hog;
+					gpios = <10 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "MPCIE_2_WAKE#";
+				};
+
+				line11-hog {
+					gpio-hog;
+					gpios = <11 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "MPCIE_2_DISABLE#";
+				};
+
+				line12-hog {
+					gpio-hog;
+					gpios = <12 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "MPCIE_2_RESET#";
+				};
+
+				line15-hog {
+					gpio-hog;
+					gpios = <15 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "SIM_CARD_DETECT";
+				};
 			};
 
 			gpioex1: gpio@21 {
@@ -231,6 +420,20 @@ gpioex1: gpio@21 {
 				#gpio-cells = <2>;
 				gpio-controller;
 				vcc-supply = <&reg_vcc3v3>;
+
+				line13-hog {
+					gpio-hog;
+					gpios = <13 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "RST_M2_SATA_1#";
+				};
+
+				line14-hog {
+					gpio-hog;
+					gpios = <14 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "RST_M2_SATA_2#";
+				};
 			};
 
 			gpioex2: gpio@22 {
@@ -239,6 +442,62 @@ gpioex2: gpio@22 {
 				#gpio-cells = <2>;
 				gpio-controller;
 				vcc-supply = <&reg_vcc3v3>;
+
+				line8-hog {
+					gpio-hog;
+					gpios = <8 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "XFI1_RET_LOSS";
+				};
+
+				line9-hog {
+					gpio-hog;
+					gpios = <9 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "XFI2_RET_LOSS";
+				};
+
+				line10-hog {
+					gpio-hog;
+					gpios = <10 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "PCIE_1_PERST#";
+				};
+
+				line11-hog {
+					gpio-hog;
+					gpios = <11 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "PCIE_2_PERST#";
+				};
+
+				line12-hog {
+					gpio-hog;
+					gpios = <12 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "PCIE_WAKE#";
+				};
+
+				line13-hog {
+					gpio-hog;
+					gpios = <13 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "X8_PRSNT1#";
+				};
+
+				line14-hog {
+					gpio-hog;
+					gpios = <14 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "X4_1_PRSNT1#";
+				};
+
+				line15-hog {
+					gpio-hog;
+					gpios = <15 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "X4_2_PRSNT1#";
+				};
 			};
 		};
 
-- 
2.43.0

