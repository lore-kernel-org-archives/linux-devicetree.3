Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19801459AD7
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124863; cv=none; b=Kq6APpRNCZ1PcUr/Eo4W5Eyr7cnGnikgSrw8GPywgS7NlzSNzRy1B5wpZXVaciyCYvlRimf6b4NdTuspPa3XqSRy9N+nsuWAa743Lnm2m/zHsKGLerUOr1ldWEFoARBRhEk0TE6J1ThVou5hHNmB+hNg7pK6Iw6qF/YCTC2hzS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124863; c=relaxed/simple;
	bh=GmvhDuHgpMxF2f93Qq0ERl8r8HiaQxqlwog46212BSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoVds2kzsWabkk3i0F3o3qFJVaGt8chMU15KCGf9Ulxyx1v6PAy55jb+M+0OAizDlJI7zjWBX4ahd+VMZ7lEV85ZXHjvmbfR+msZt85H5POt/xL4PIsTAWndYaFj0JOPhCzdvXC+Ziw+k4HUuhZ/CZVi19janLowkATsvArKJhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0280d4f56so6063125e9.2
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 07:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124854; x=1791729654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZRgdojaRbZiMOWyCy78Vo+uAB8tMtaxuR0FMlqF6Sc=;
        b=Lt1dgFApd6R2pOetwdEBbMbTgkpRoeqB0juJ7t8du57boAZmfGjpnhwFdLJ7ehpEiB
         e55y1II8d49uIq6k+SJN0XDL5qoR/U69Tg5uihmmJgT6yGTEZY8hDSgl+fjNNLFmRWt0
         cq2aUtolX07DBOCjIVgkfIiNaVmSpIwCXiWI1i3cbN4P+s1hJtd8zr0E2l1q+cgWI+Tr
         WROzFcReJuUmh73sEKMgN0fobeF2bgKeEut9heInLek4ZeScm0tSMUZ6x+S+4FyI48ek
         01WDhQDicsiNQIJXuUUofvcVjdrxN6iuenVCBtcgM2nXXgdMe34XgfT37PGHnice438u
         9Rdw==
X-Forwarded-Encrypted: i=1; AKwUvByMHTfRsf7Wjqp0UGmFu9GsTBPBD+9gNGDsaaeXnkkDK8VuC/K9Qmit0Uqmpwlz0QOkBdrcCTlUy7+A@vger.kernel.org
X-Gm-Message-State: AFuF++kQkESNa+qy6xGarZXiIo3v7C8CfisPgFyRTW7ZkQyLI/uR3aDp
	QQrmZzznQ+YcnipWAvtpvcRRmFN5gZ4la3KelNC8tzV9ffZlNhgUkiIt
X-Gm-Gg: AYBFou279gwRRDSp6+6RUr8d1yJ7wqmfsCCCZk79APCQqOUjfWlit03ty+LzrKqBm+V
	IAvgZgxQKFmo1OvHKpQu9eSni3GfZ1bIB4VxL9KcjMhxMvq8nc561Cpkb4FH26AK7GtLhcf6Apk
	fz63KImObgmTKt7JkFrEbCE6VExruku8b53n/gdFZNwg9ZMYzFCTREqyxoue6LDB9Wzck5XuXxW
	Rju8nWY8r+QqrxZNYceSh4drpPbNlKuHbaHvJzXEKL3ysEM3JlNMQ6NYGB/ouUtOlxyO+6pqaAE
	lhRbYmaB36N4IDUrN/Qi5t6V9TdA7VzIu5e11sivFhoQ49GNYcRIO7dPksRkmnWqUQWKCifWkHw
	/duGIIn90wr7QnsYDPzLFP5bX5a5SiuoXUhrZVrwYmC05TO5QWcjHDLkr7DDi5/WkO8kpZ9SbhA
	NdIgGC+ozmY9z8R+E1T5fDhno37YFk05/1m7PssZarQA25k9L7HaNM1m4auVeH46smTFG0UOdZY
	4KXOnsLzqhl5BSXCCvLnI54sbBcL2dufQ==
X-Received: by 2002:a05:600c:8b30:b0:4a0:2644:80db with SMTP id 5b1f17b1804b1-4a0276c0b12mr117321955e9.35.1791124854357;
        Sun, 04 Oct 2026 07:40:54 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:53 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 5/6] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sun,  4 Oct 2026 15:40:45 +0100
Message-ID: <20261004144046.391444-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoC pairs a Synopsys gigabit MAC with a small block of glue
registers that selects the interface type and trims the clock timing,
and with a multiplexer that points the management bus at either the
on-chip 100M PHY or the external pins. None of it was described, so the
port could not be used at all.

Add the controller and the multiplexer. The MAC reports a 5.10a core.
The path the controller reaches memory over runs through a pipeline
stage with a gate of its own, so hand that to the controller as well;
nothing else claims it and it would otherwise be switched off as unused,
leaving the port unable to complete a transfer.

The on-chip PHY behind the second port of the multiplexer is described
the way the G12A does it. No board in tree uses it and that path is
untested.

The controller is left disabled for boards to enable.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 57 +++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..140f1836f3dd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac",
+				     "snps,dwmac-5.10a",
+				     "snps,dwmac";
+			reg = <0x0 0xfdc00000 0x0 0x10000>,
+			      <0x0 0xfe024000 0x0 0x8>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clkc_periphs CLKID_SYS_ETH>,
+				 <&scmi_clk CLKID_FCLK_DIV2>,
+				 <&mpll CLKID_MPLL2>,
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline";
+			power-domains = <&pwrc PWRC_T7_ETH_ID>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		apb4: bus@fe000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xfe000000 0x0 0x480000>;
@@ -645,6 +670,38 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x28000 0x0 0xa4>;
+				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "pclk", "clkin0", "clkin1";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ext_mdio: mdio@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				int_mdio: mdio@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					internal_ephy: ethernet-phy@8 {
+						compatible = "ethernet-phy-id0180.3301",
+							     "ethernet-phy-ieee802.3-c22";
+						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+						reg = <8>;
+						max-speed = <100>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.0

