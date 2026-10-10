Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D73F8246
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629955; cv=none; b=Tuc4fsrMLPYiytJA/Ae87vndaDLOWHJM/J3SLjt9h45NcfH7tGEdcfxdaa0vzfx8v41fLR0Pn6fZGSG2qYoZRplkcMC+FomCd6qFNRahaQTgkkGJtkTT1gr2QfeFaSCtspaKIjhTMsHHauftyYlFVRrvbzf7FQE4u5BMPTPyQCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629955; c=relaxed/simple;
	bh=qqF/9hNJkZvz5igwPUH17BMZnyUc6DBPLiCg9tn2gMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pp/95kiQdFV3txHIDORRNznLtcXc0YrYvoqNl3y5tX3/4j8x9WOELHP4m9H8Wzo5jPEu9JfKGE5roN3tQQhYpEZFvi9zcaypxq8rYcuC7zF3FqRG/PQYUML/EOjmOHn03cn+pg04b2msogZc9U4fioZhJCuo+yIhL/0WbJVaZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b02a2359aso467780f8f.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 03:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629952; x=1792234752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQBX2EsGilW7uIgdk0tYqFZ4ZqmuLdnOK0NA9yKXMRg=;
        b=uXLoyqP0HJQKro3AhgaT00NGLpwTEQsr95CYdT5GWPXPUd4uQj4t311zZENBU0ndYf
         8wYMSrcX3rCxOkLGOHIAuK7678LYrYDCTQ+xuk+g1s+SOGC6qjswHyPVpNRpYWd16D9/
         Y0Z7SFqsBbzCPUw7a5+CO3am7BhVsdcGNaWj8GZ7PUhfGjV1ZUSKWue6S09eh4/j0MUW
         XFoulgLrc7pRYGkESofQnwQYOq4xqzil1x44o2NqLvT0Nzj3X4y1eWQ1j+aT9y1IwQkO
         U0AiXVBIBUjx9cJH758mxJa163xyXDPcwC3VtlXnlc98btFOgkn2tWH/EZz/Ihvyfi7k
         QW1A==
X-Forwarded-Encrypted: i=1; AKwUvBxpiJYIkEexzR5grp9rIIDthO3V28UvHyVVvDvUngWLpFBtXR52se39ap9Fekaol2GqW4G9q+9Ulkta@vger.kernel.org
X-Gm-Message-State: AFq9FYJlChhM8K6U4dXUUMiYFvmN9atbQ2xJzwdmIjbbJIdwUsILNzH3
	Il7RBJHkY4ikOr3a68lA/L8F7CumeMgHk5XfUmZ6duk8/wSPuhgFwg6t
X-Gm-Gg: AYBFou1CHelmUT98d3oRaGdsHfVjpPFKM8kVeOg6JmsFiV6OYC9tjcaiLywgro2tGv9
	McYOK04S0upg4TWyJ/vhtsCpfXon2pY/llHwCVk4LRIMK6VxIUCqeqLGrOZcn+YwY8qYHSAk2or
	VDXeeDawLOp8H0xkPz0M0hOW8cSX+M3bHDQbrT/cnCpxRKX7fjRrY+qB+ss6rZh3Mn7cgB98f8B
	eHLSrF6jDBpdyga+/lAQVHw4lBEtTsYeZsbWdSgveZMfwCvE2WLXJsCm846msgJDL4WI4r3ZoQr
	DYso9B+1KpLXpzK4A7n+0mogpDNf4i1mjSG1Cx1RJDHjR3A0Y05nWp/G+A/giZYJ8H9qsE1v+L6
	4f+xdQp4lefHaSpNc/ISeZWTHIdpNui8nzPJs8U4XE0hTSFK66EOwXVgy/IgdvumqBnnAQ2slWU
	jx0Xt6W0nHTlzUEhgKhQZ2waqpJhdIQGuDMrQwEpKIS4kRxEnxDKlMjZrp0tYnLHOn2vPeGir8k
	Lijl+1n64A2jTlTNGMb/bm1IBwZ10S/0CM=
X-Received: by 2002:a05:6000:2306:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48dba9e6163mr7697023f8f.7.1791629951651;
        Sat, 10 Oct 2026 03:59:11 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:10 -0700 (PDT)
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
Subject: [PATCH v3 7/8] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 10 Oct 2026 11:58:59 +0100
Message-ID: <20261010105900.247342-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
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
both come from inside the chips, not from the board traces. The PHY
adds the one on receive. Its transmit delay does not work here, so the
controller adds that one.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..c18bde02ac40 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,25 @@ xtal: xtal-clk {
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
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.0

