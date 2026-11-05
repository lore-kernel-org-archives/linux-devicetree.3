Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873013;
	b=CgJGGJh/l1rQgd1ad6rBSi3KCA6BLgCl+mPvCGF/OVhQ0jxI0KpoalS+c09CwRHmy4Up
	 9AXoPYTWK5mE6SkhSyvc1ZmCnqkaUlUoTsRW49/YsQQSU4L5LIMukQGQrNos6a9BCURt3
	 XvmMCcrvDrRZdQPR7ANXf3B+7oHsF506eVfIH/nw9Ekgfrba2LBvyiv3c+3HNJVhPrXig
	 Attdnh717ce8HKd1Hu9/KfIAto1shXK8OxMCRhG3A5qqlGqmvys9GhhpRuj3bJNamiphm
	 iNyqHyIRdaR7kEejgTkWtJNvL5NDS6YwgMWYd6W688T2TBUczYv85GqqJJ6rdPR7TPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873013;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
	b=tfyoH7OMe/cixooWbPfUQGc0c6jAm5QI8hgRaAhOmb2S8HJRDCddYl2/3qXVwLwWlRvy
	 SKsF6B5p8t9LupCuLMRhPCOYS8uPvg43yho1hzAuPKDTV0Cs10uETbUXuPNUAYgXqySWt
	 eSAEfVGejLekcljjT0T2Z3h6y2mRi56H/+aUpswendDXv2uYCsCsRa2qTaJFEOed9mDfq
	 Ndu9rLC0F7CWKCrHqz4AJmPJ2czXnlLYjPQVopM8+LFLv4SbpbDJet+OJPjqBedbnAnEC
	 LM9Zd0RAunSfjxQpOxR9w0TPzwICBDuy3C3i23YmqI3zJacYTo+P4MYbD/ld6x+H/8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305BC606EE83
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305BC606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so12826945e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873011; x=1794477811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=zYB3g2251U5xCTpOuWfRMClHsAdtGuDH9/2Xw+H17Okwp3WUAeZqhLlXwV3O0EtbSj
         Q0AUHGe+GlLmWWSuzroap88j0YCH0UiFX4c/lTLrNa0PzowMzz3EmMzVMlyy90Wc8c/V
         p+qkKHZ44Cqmf5rDFWn5EThpmnNCyjtm+41piNrpGNvoY+9ktRgBXoKjNG8+oI8puE3L
         jvcOUcDAxxDknrPTQNBGA8FSqyzoGQxxOg9Dg8XCj42EOcUOb6qa5qooNloe5LVDZ5IB
         j24PeVb8yol6XcZVkgh4xr6m8vqiwK4qD/F1ETgWOQbprNextm9G9QWXloGaHT+E+OMe
         H1Gg==
X-Forwarded-Encrypted: i=1; AKwUvBxtZDID9/MdEZt5MrR/W2ud3icCpEaDWoCqKJWxZNSUcxuABjZPiZx3LGZZXOvJSgn+6ekHQ+3OgjIM@vger.kernel.org
X-Gm-Message-State: APuU4Z+o008Rw8ucktdg1TSdArqlhOfDe7NE1S21Bv7QMnvvPtFC3Rqc
	m+fy0lKVYKCSx7wmkQ8f5l1Dz/e2rZyDeCBsnUs3c+OFZ6Fxd5U7MlB6
X-Gm-Gg: AYBFou1pPdM/rXRCL+haScwOlmuQBwZBEAeqU8Q/6mxgN7+6kI0PZP9d+/ySwf8RGhK
	H/nV4O5wEsRw3XGbl2dNcjaYybBJMNU9P76mZA/mfGVrkc3W+nvy/4Jc55VbRtcI8Hic54t4K7k
	X7ZmiuWrd0hCF3eLRSTJUh7YB7536Vel3i86/rZiNxnHYs4EjYHNnsoxHwWMR78lH93m3uA3lIC
	yV7pQXCUlkZxlCTU5xMMd2VE0AENcoGdqPh//SbL0suKRt0dG7xLYnTimFTqvF+bjNlM3Id2O7E
	co7OqVkn54aBGkLT0YvGZp5VKJEgr716BcKsKk5rhYBMhtNqaIXKh6oQcGA8eADRuJwaqKsjduE
	LStOTuqU7IZ+pH2i0fcWqN61ZGB1eWhfBuS0uz2cobLuN0xtb7L++ljFvHRvRV0a7T9ZxMNxdSF
	4lmTLiokRManFnVUXONH6EeYI8wWMEwcNggwYUyLI+YvnqEghAz4PzQ9EPQuAGOr8j+3Ms5CbqA
	VwkjgyJHgHvJZYea6jUb2xxLLtTF01e7ah6/jmwV6eca9/gDlTMVx1bOUYUy80LJtC69FX/iqui
	PKXi/sdOitRKjbd2DgjBPwH+KM4jOuRBWPNLe/J7+nvPbSeRc0UB++KIYuzmCSxDJ40XQZ8Etrh
	IRmSRVIMQVn9V0yvRZuVQflW4rQ==
X-Received: by 2002:a05:600c:1f93:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ac180f1ec7mr430949735e9.13.1793873011464;
        Thu, 05 Nov 2026 02:03:31 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:31 -0800 (PST)
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
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Thu,  5 Nov 2026 10:03:20 +0000
Message-ID: <20261105100322.37816-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@ mux {
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
2.56.0

