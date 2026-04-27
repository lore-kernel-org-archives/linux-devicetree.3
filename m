Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9283D411A
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300179; cv=none; b=oyNsozB8k/czXcW/SsJiny/tX9KLJKegAS99KKHWGNYAjlZYZU7zu0hLiCZGdIQmeZg5hg+U2oMxxCJ56238xvXfRraB/HDZX4mB6tlHrPSMez1b4UegcX0JXslv6P/gLH5ylBCH0WMRSMv2tQaD1gdWc6BM/HWmAA+Xg1TJET4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300179; c=relaxed/simple;
	bh=CE3L7UT9Dl66mTLL4kN6XoGftovug+bLETY+5ZdFT3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qKI0Cq6ezh8D06ERX8c0XyiQTzcfhd2x+Vko9WGJ5YqO0ObrexGMOSTN7FEc02PwriE9ezWoQSrz678EqjPNhdf5hWVNrUAhu0MumuY2I2JJCB75fBfGV14IAWbF3E3yQvlJ88VYFnOAAWwPmnB2iH3206dQ+pD471xym/lm4NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2lrwh2x4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2lrwh2x4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 91C084E42B35;
	Mon, 27 Apr 2026 14:29:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63C0A600D1;
	Mon, 27 Apr 2026 14:29:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D9B91072823B;
	Mon, 27 Apr 2026 16:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777300175; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uBTPwmmRps7fixb46EdJWX5fjWrgSn5Qg9Xm/D96I/c=;
	b=2lrwh2x4A+veKBbp314CyZrZFUh7SwMrooMH9r8mdbNXJ7IetEblPJYYRjxJMMcDEx8Q5G
	Di0UR5iVf/kNA9cOjCXPWMfr6V/5gpka8ww8CaRRl/frKf7SRKbzQbdfwbunlCmIZvCkup
	EQ1N6u8dS/TzV/BYWpgwPAMpm9IrT25OOxaZHC2kQQBsnYrJkWbs9BdgkAqyCwtk288MBl
	/25Q1SNqGm7wrEzbcnT6on0MPEdKE0wAzQv8ZDVUexfoEFMk7MZJmWYu9Ss4D2kxImN/fY
	Cw7biZJiOWRk6qSG85lsxcXHpR47jErqCMilu6URegB4ah/e6I3EWD3x59IHww==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Richard Genoud (TI)" <richard.genoud@bootlin.com>
Subject: [PATCH v2 1/3] arm64: dts: ti: k3-j722s: Use ti,j7200-padconf compatible
Date: Mon, 27 Apr 2026 16:28:59 +0200
Message-ID: <20260427142901.341861-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427142901.341861-1-richard.genoud@bootlin.com>
References: <20260427142901.341861-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Abhash Kumar Jha <a-kumar2@ti.com>

The pinctrl contexts for j722s should be saved and restored during
suspend-to-ram, just like it is done for j7200 and j784s4 SoCs.

Use ti,j7200-padconf compatible to save and restore pinctrl contexts during
suspend-to-ram.

Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index ddf20e44f0ea..d14caa9d8619 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -432,6 +432,10 @@ &main_bcdma_csi {
 
 /* MCU domain overrides */
 
+&mcu_pmx0 {
+	compatible = "ti,j7200-padconf", "pinctrl-single";
+};
+
 &mcu_r5fss0_core0 {
 	firmware-name = "j722s-mcu-r5f0_0-fw";
 };
@@ -473,6 +477,10 @@ &inta_main_dmss {
 	ti,interrupt-ranges = <7 71 21>;
 };
 
+&main_pmx0 {
+	compatible = "ti,j7200-padconf", "pinctrl-single";
+};
+
 &main_gpio0 {
 	gpio-ranges = <&main_pmx0 0 0 32>, <&main_pmx0 32 33 38>,
 			<&main_pmx0 70 72 17>;
