Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591746;
	b=oqCZys89aHbD0S4x/mPbXghidrqV24F3fH7XJEsaAmdBkx2fkxubbtle6RPrN1XXN46D
	 I5qHnwaGLJde4U5sB2PxL99aeskEJ4YBZoM02wLS915Y3kI6hIyVCwFRbDTJH/kKzBoFO
	 Rf8pbEIVTn4oHLfz4t/DusPjtPx07W84Gkm8wKzLvO4Js7cx78bN3b5ccm12KLn7cTOy6
	 /dEaTLT0QJUwbUC7SZzAtmWvlp0F1Sr2CQK+Y6hNM+akSk6iy49zKo7Ba/5DtIyt3GHz/
	 +jJweN1MZ4DOcS4En7xf5/n2UyFVYNzYM0zaQiUR9VAYR/KtnpXkVoR7zBARio7It9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591746;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Virus-Scanned;
	bh=mj7+G99LA7e4zUW42qehLIiqdM2GwAM6CwjSVjZpYlE=;
	b=jVEFf5eMsNpd4EqyVEfRHtA6VndSJ3X3Qpnr5IfBd7drd9MDNI57wGQC6gs0xvX3CUFh
	 zqkSTeKLUdp1z5CbZ/3ZPJc8RVGQupoajTpHa052IbwVjy+KxdlNxHmrPYaltIyXIvSZK
	 D68BTfYihdEC7xSHwOz0EetHajVZ3MpJWvHhW+uNZoVeH+iFx7SMeZZRMH/8wp/9BLz5R
	 1Z2gy/lqY5gZPA1uMTFkltS4nNuVDVFh+q5etExNhcmLGv3prhIeRTZ052moyLaEOx8QK
	 x6ke9nnUAR0u+kBZ9gWQrQzkwB4Vgta9A/8XwN9el8rfNscOPWiU3tsQPJRnxHuAX3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=KUT6HRTJ;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68650606A32D;
	Wed, 25 Nov 2026 07:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68650606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=KUT6HRTJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mj7+G99LA7e4zUW42qehLIiqdM2GwAM6CwjSVjZpYlE=; b=KUT6HRTJgiBB4rmg6EPfonP5SR
	y5+EyVXVsbt7GQ1IHq5MkNaihIPyXJJhSHCrF5P54o78Feg0+LWX4D1TD8hNRaaCaRmvXUATYde28
	7UlzlZ4cAnNJOSXdD5P3buLY4tKeBQvDfXVTF1kFnhf5jzS/GmeNICHhK0vlkMuJsrHmBnIPqg6hg
	QzuLtCHXsb3vrR1ppWV9AQqVY+7A9ND6tTofKSAhIk0zq6i5Z7Zr+AzJytiaWenn6JJjsCQOyOE63
	H5rL/DorwNaCsxnARIV4Zhzg2h9NLyWkKq3eKHivIUIQbTVghg21GDVdg4hWeXyKdM3l6CA7O16te
	QgaQ6cDg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R4-000Fhz-0m;
	Wed, 25 Nov 2026 08:28:58 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R4-0007YA-0y;
	Wed, 25 Nov 2026 08:28:57 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: add various GPIO hogs
Date: Wed, 25 Nov 2026 08:28:47 +0100
Message-ID: <20261125072851.3379079-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
References: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
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
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)

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
2.55.0

