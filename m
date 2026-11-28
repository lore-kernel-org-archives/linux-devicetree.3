Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850176;
	b=E8+buERK0Qgv8AXjJ8vkG9MBlbMnJg2E7ldR+WMh0Anp9tUWrp5Sa2un9rgr6ugDa1Kc
	 AXrgzb8LhqFLTo3uVH2M+pUD997MuH1njdSOHq9RWuJH5l2uI646ngmne+lPrmKomZkL0
	 3uA7Z8/mu07jEsHmIx8wFuNtGGK5wepMX3sQrsE+Rq/w1IMjFlLnh+CB3XedKMBAbV1H1
	 OqMAUagk4uV8+UJ5h023yhcp36QnFabcu6RsylZ7OnPbvD83u58gMjQh/uGqJSIv7jhFL
	 7ji87pIm4Z7sdyuGNJQck4vznHv4Sf8kLNWLeAnw2xY+VQONMi1BZ5+A9a1QMyZqvVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850176;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
	b=D2R+ESpGbSkjPM45PzH8TObL9+J/3wI7Tzu0fKgfqZh3Q/5n5yRy6GsXSOL5MhpNjyBT
	 bmDVo5x+7OvvAWUgKrYbs6z6I190Mi8JGjUMFS6Wr/DuTofXANxKSYQef4pllM0jkoPz+
	 TpwV7tALwICxYdreZhiC/+XN6JOethw70yuPKo7QVbkZkaP5rqhBfoeQNKKotHJt+PVf0
	 Fyna8G4oMiQoZOH8TeQg4988gJaCqfdFukRLXXoHwduy+OJRGrZqTRLpIAc+PxhQf59iz
	 OoR8fcyh53aB06BIS5+UMs+a0WmJx4obRmpwrkhl+pnUkOJ5og+y83rMBjFRLUk9fkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15677606A691
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15677606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so90028485e9.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 23:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850174; x=1796454974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
        b=ytGiIHcE7X4qVFwYgdJ+nbq+deyQgSAaaAcnwxU52ugocEMh1KkPHV04lQbvCIuXRO
         Ort/xxueF6tBTjMtUnpvzuGSAbjdMnmZjMNSOM2JX12B4Re7oAHDOPH18fIl0PT6kYeC
         /NhtmaeUINK51huhI4fqPkLcAD2P5ee74Hj/IggsylWAVpBXQbAlhBWZu7tpOHbcs6zt
         pPDNs9r3LctrLwu2YMWdD9xFYgry+6C3XNFr7OEFATYBwqj0ouB06ODTY6bGblEJLH1I
         hZpVgkQMEI0zDj5qwmcKeS94LihljN6x/VlNHlQDjdZQYcF3e9AxI4n/xVWkWpV02VE4
         1pOA==
X-Forwarded-Encrypted: i=1; AL+hErF9AACw0y1kFICrP/Qtovm2RBL/tAq9YBaFaui42FmVMzV6EducQMH/CAH9xgm6YyhpspneDQBm8su7@vger.kernel.org
X-Gm-Message-State: APuU4Z8tMj/kKiC0XtvZE+nuqjvM2JLa/ezFzzUQCS9Nd35GtXMBK2WH
	dFfEIZws1ed++9ZxLdG0l71JxUahxgUaMj6UiDszadQ+z3xTnJ43NhW3
X-Gm-Gg: AZFdTZejpDsJCzQsg+5hzXHF3NBumQahK4P6/b2k7Xb39s1ukzU9xWGj5LZiI/hYMGS
	Wal67bj5sSq6CFJuMdHpSj7QBfyo2d4uB5WVySqgwXQRJKFrfI7y7dsCY/tHNkVDlgnAVJUOYg6
	Mb1XoY/w6qEqLg1Vn9/lXiaYbRYahibOmswn3xcMvuvmXbiHK11GMtU1sAYpxBAQutp93MMHBzR
	ZVPfF27OohHRBMjnNO98DAObYZiz30VUqzRSZ/lsnDW70OgDOKoi4gylICeNtN65GekOr4CGLsg
	RLisg8F10pHS4TVGQBZTVohfQxiWp/uzygHsQKzc55+UWJQ8llg3UN+FZ8Cs2jw7mCFfmfiS974
	PQZPT9jE+F3B9k61teqzaTR8m/+pmxWCeNspq9RDCL8tw5pNLi0SpGN+D54cQZXyTRs2akYxVqJ
	/Di0r2DHUpE82S/S5GcrF4dRxY5YjeU9JwAuuczzDkcUMzWLbR3MClUn5LR0TN/y7405/WEIFY0
	0C/6QBf+4v9W7u3VeNO6Rck46O/OizoBLjlRQSR/GhoSOBHI2NGXAky/vS6GvJC7KFSAYjtpyBa
	u9w2C2sj4TWeh/HkwHrbGEWMep+Q2/cOkDydstykN13dbRc/XCfGYOBQklsg89OEpcYe3KHqUAl
	u7UzClUBpiqY/OX2nSzAC5mwuhpjPSFdJXbRUmPZdl623
X-Received: by 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr570429285e9.4.1795850174257;
        Fri, 27 Nov 2026 23:16:14 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:13 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
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
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/4] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 28 Nov 2026 07:16:08 +0000
Message-ID: <20261128071610.27855-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
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

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.1

