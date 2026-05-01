Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3153E2772
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650911; cv=none; b=NSurohr+7O6eD6P9/uCJTl8JZij7k2CF5JMNZE2lvFW8i5uhmxPuBu1wMT3CPG5WszdY7hoZ1z3ZpzKpseu7O6rXNpHhaip4BFNKq8IMeHp9nVlQzHwwYYHPB47BxV110r2ONbIL60Z4Gq/dVro+uJqMrv4NR5nPJNYAllcD5WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650911; c=relaxed/simple;
	bh=Z3xqXDkBWFDdyrtPSGEDjKxF9Td/NrtBzEpnN319gkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjA9RebMQ0kyNB0SuIX6tE2ZMfgYsgpiDn7638uFCRqTNuv2Dlgsv53K823njOXfqKw1bBbKftk5LAu0zhatnNCkSl1FXyQOCqgNZ3vniDfEqd1D6qNG6YJOdbbjwVTWQWreNiX5bKFFt2ldM2z5MoQEpAP6OVkvip75EJjOlAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=DzA+Q4su; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="DzA+Q4su"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8f984bddf4eso196909085a.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650908; x=1778255708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK9EvvjSLddFpBQK0gJ5r1hHzJCQAPB+JE9l90vZOLA=;
        b=DzA+Q4su2yvvRRfMmG+pvSbNjFjSOXqlTNDv2P1wKy3VqX3Giec9uHfh6wKNN3xBMT
         s0nTgTX8lQduq6gsuReitPP84qqxFS87Bn9ISaQn145+5vwCWvKfZEMTNkXLFuWk82Qt
         Ut+pbrkg+w2cEFS464mPqZ1oZLowayqXHYJiSYrlJEjhRjXzkdKX9J4eo4V77MHXYKb8
         6HJM05xWbO0itdNawm2D6cpUtXHhR99PT3HW9h1EG7dRH7ceqRgiL/bvOy67WOKZqGIo
         wvfBNR2JzFzWucDFOm+Arni3unStcelYJP/vUdY3m3TEBf8ji3ag5NbqOr4nwHy8XJ1F
         40Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650908; x=1778255708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sK9EvvjSLddFpBQK0gJ5r1hHzJCQAPB+JE9l90vZOLA=;
        b=dksXVFOW+k9/tSWNUlwalKnxUdw0JXMRBVWDj/LnZVJHPKVpF989i+gulLptG1+JBz
         ApB730PQig0l3Uk4dDAAm4BgoULSSvOpcg9NqBrIhBrejcWKR1HMofHrQX2CVn9kklbQ
         uC0QxJTkdkEPmN0qW33o666CLY8OG8FrwvSmFVmLZdAjK5Fx+pPgYeDlcfhcBzuwlQo0
         CP/XpbVklh5FIXg8i9aLrNc/A1JAmzCt1eVz/G8+7pW8msBqzJttFoxianQGsMRjg3lv
         86U/JOa3nQreQBzVNjcPYYgXkqVCEdAFEaex2ubt7EOvK+caDqaU1j+D86VK8L1mSEdh
         U3DA==
X-Forwarded-Encrypted: i=1; AFNElJ98ldaCCyfcSED9heglyaiDnK4Aa/srO8FEu8+iFISEXEnrzU2lfuWC1Kl7o+gPRWTfNXrojPNDYPeX@vger.kernel.org
X-Gm-Message-State: AOJu0YzIdEYKOsvyTjEUuBl87cnhtOo7DnUCAs3CD3b4GPE3VtxH3y+n
	btoVMTGlp/yzQIbeL8DjDAotH0Et79YjfKCZ835lZcbbO7cLmN6uxRDF76skxrTKcnE=
X-Gm-Gg: AeBDievCTnQufT2um29chxtvlz/4yAan4/XzeZKGWZZF+KyNXUhYoHodde/cfRTGGjG
	EtBWfyXGddHNeMOFNpA/jV6+1ytaIodHDnjzQGiCMmQb8mxZ9ynfpALLEVszVzf8B8klhbh/djw
	AcuIBjhxTdYypYfmQDPv7hDylkIUyZS0czTFt4Jrigfvc3YpHaIbA0ETCAwPd/GkOTF6BuGl0om
	7REur8fQjRhhXqx968iLBcqcg3H/upaldGVfOxR/PbAtK8M/4ZgW8PRGC20T/0ZPEjHtAHCD3LI
	ZNaPFfzfVJBgSccftrtXOVgUxyz1gEJ1JgiTQggm5mxMbLHrHfhh3akANx8pCef1m9DbSWaGOvI
	vNPH3ae+mcvlbToLiJhk31AMnqhnA1l/SZ8CR2BP1z0hzaZ9dhJl0dEPo8Y0cBAOymxZbd0+/0h
	wW1YTzY+mHvhytMhGgt/WLUP2HJ+KqysjgjfYDgwRpf6sRZHaWt2XeDBQayxi65tVQ3Hjuejz9i
	PEQdg==
X-Received: by 2002:a05:620a:171e:b0:8cf:f215:24c6 with SMTP id af79cd13be357-8fa86db71dcmr1150937585a.21.1777650908306;
        Fri, 01 May 2026 08:55:08 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:55:07 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	matthew.gerlach@altera.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9564 with a single QCS8081 phy
Date: Fri,  1 May 2026 10:54:20 -0500
Message-ID: <20260501155421.3329862-13-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.

There are multiple builds of RB3Gen2 with components included/excluded.
That means whether or not there is a phy attached to eMAC0 depends on
the exact board. However all versions include a TC9564 combined with a
single QCS8081 attached to eMAC1.

Add properties to the existing PCI nodes to describe how the TC9564 and
QCS8081 are connected to each other (and to the host SoC).

(Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
binding, but checkpatch.pl doesn't recognize that.)

Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 45 +++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884af..72c89aa7a2e43 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -308,6 +308,16 @@ vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
 		regulator-enable-ramp-delay = <10000>;
 	};
 
+	qep_1p8: regulator-qep-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "qep_1p8";
+		gpio = <&pm7325_gpios 8 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
@@ -937,20 +947,46 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pci@0,0 {
+			tc956x_emac0: pci@0,0 {
+				compatible = "pci1179,0220";
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				device_type = "pci";
 				ranges;
+
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 
 			pci@0,1 {
+				compatible = "pci1179,0220";
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				device_type = "pci";
 				ranges;
+
+				phy-mode = "sgmii";
+				phy-handle = <&tc956x_emac1_phy>;
+
+				mdio {
+					compatible = "snps,dwmac-mdio";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					tc956x_emac1_phy: ethernet-phy@1c {
+						compatible = "ethernet-phy-id004d.d101";
+						reg = <0x1c>;
+						reset-gpios = <&tc956x_emac0 1 GPIO_ACTIVE_LOW>;
+						reset-assert-us = <20>;
+						reset-deassert-us = <20>;
+
+						pinctrl-names = "default";
+						pinctrl-0 = <&qep_irq_pin>;
+						interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
+					};
+				};
 			};
 		};
 	};
@@ -1524,6 +1560,13 @@ usb_hub_reset_state: usb-hub-reset-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	qep_irq_pin: qep-irq-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &lpass_audiocc {
-- 
2.51.0

