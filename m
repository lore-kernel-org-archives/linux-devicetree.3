Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BB443E4B0
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361604; cv=none; b=ksjRGAGWGITtz9S9uXo6O6hY64jzJGiTnClk7dJSNCBcWTuLQyj7CVZbFAvBAHFkLIyQUvmqJkX0z4dXmdFAec2RPWoxCCfRZku2jqHLAXPYUoxf7/E2v3ag1gJoyfXARlwEdnyznaVVM3Yv/yRZ48fXqNdZJ78te2z1c1pNaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361604; c=relaxed/simple;
	bh=5tlL+2agJ2s9km+DZ2KGJFImg/1CkMbVGilWBDkZMNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBdGUuYTkM0V/U0YxEdbCKBvgG3OX/v64blmO8b9Lvac2Uw16hs6UD0xFx+HiUUSL94IU9SQb+8aQ/m0Z6TTk4Mw+kbCE1E5J0mw6NdxH/UG5EZei5Em4EFQ7VybWPeOzc+RoM6PDakjcXfSgNbvmzs4Uj+6y5QC2/uWxGXLdbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b02a2359aso1442211f8f.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361595; x=1791966395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rz1uNP1/6zGDpEzl8JcWI5dNkU1Wh/FOy/3g1YXciIM=;
        b=S8iebtTlagiUCpg6dPOEWlOIsSizI66Ik1sA8v8ehQCw++TQ/CgdhAci9B4TT4Cx/y
         F6bQWvQNoVDz1A6Lf8yQ9ATHPJrzijxTHL6VySdd/wCJIeqHPlc8AMvd1HJgTibDUhGp
         TyQudPdD1wcGWNitit7Js2fDa4ZEXIM8KO/MH1KH0jqRkYUpxQ7ognROIoCPVOAVt/OP
         IoMOIdISmXZQgC41zcd6hFyejQsBdC+7EDYSLo3mAM8LfxxxCGvCzR50V7QzKBaapW+3
         0r6W3J4M59lfz6VNl72bHZkMNPla27sO1Z96O0mGeA+ZmQW0NMcbO12lBDOJ8z0V3CPh
         M0fw==
X-Forwarded-Encrypted: i=1; AKwUvBzFvKgkQgfTloj4ytkOd3ug31anKrjOWY2HDx/epaI3BgKjNwnUPYb0IWFr4hVR4175EAoolBwrZQVa@vger.kernel.org
X-Gm-Message-State: AFq9FYLTkluB63lfzt96+sZ0Q1y35fD3LvY019tyEl+gpWlojo2eG+TX
	ZRMn2qcb1graHktdZMx2J5pcEVhed9dKsOrbE1E/Lswb5SXokTo4MQ2L
X-Gm-Gg: AYBFou2+aF2HNiXgtQtC0kJXCNcY+5Glj904Ih5oxr4QAscasi6D2zrj8yh5j8DL/gf
	oQVMzn4PcD0v/LAPSQyVzbx0/etSz6a6O1CBjYmpTOzphqcqsPDkTANKuS+dZ5c8U1krkBg+Zz6
	fRS/BOYrG2yfKm2yIJplXU2SN6BKvhkWH5dKil6s9Qpu81PsIVSbe1LZ/y0vAkEmdPbYwr1TG1F
	2WUpDWhyj2eQIVH8P7lDD9VSH3My5tQRT+m8VgmI+2nm6BU1WL84mb0p3Z5XJuqwnyxU9W75rX9
	ryoeY2hpXhU4aCdJtKWUGDEgJDI5uDPg2cJbivg7gloZbtWCOmO5ZLpPKdrtj5tHpYOmODHxXI8
	WZGX9jUkJ6Tfjam8ypjiRahbH4lXL6ykmXVSJmaCdRA9aZpMVqSL+qsTvHJG1q1+YEE64Oj8ZD2
	40WQdCwL5wu0W52vrGaMOO1k4p/erEtLrjlqwBi3NdhDylIlSwL4Bna+74SEi5U1tjWcZ+x1PlX
	QpeGm0T+YPY5HL6b+zonE2J1eL27LtFL3U=
X-Received: by 2002:a05:6000:454f:b0:488:7892:1932 with SMTP id ffacd0b85a97d-48c7256fa0bmr2028288f8f.0.1791361594943;
        Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Wed,  7 Oct 2026 09:26:27 +0100
Message-ID: <20261007082627.63807-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller, hand it the ethernet pins and point it at the
PHY. RGMII needs a delay on each of its two clocks, and on this board
both come from inside the chips, not from the board tracks. The PHY
adds the one on receive. Its transmit delay does not work here, so the
controller adds that one.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..4a2b0b563655 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,27 @@ xtal: xtal-clk {
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+	tx-internal-delay-ps = <2000>;
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211FD-CG */
+		reg = <0>;
+		max-speed = <1000>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* RGMII_INT on GPIOH_6 */
+		interrupts = <154 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.0

