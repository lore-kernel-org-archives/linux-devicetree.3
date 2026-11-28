Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850174;
	b=EKmzSx/OsfHwyEpfAaYT6HnPqP4TILod8ESq8VzuryeigXQlxeWtBzUqkOZA0dzxQ5Ld
	 TQP0REPb+fdGfXMkWnHfpmJyEGGb+R8KeH014bl8lEII3QpNBGQtqVVo7yot+LeMCe8nF
	 jU3eGALGuI6wn0DVZz1rTCbd8qfmYYQWtIxuzcCkrgSY+gdiVAQM7ouYbdU096iDH0nC3
	 BlQTttAaWJp7fM2f4/EZ8oO5A54HeaK+6XO4y0dwmWXynQtoL2twz6xN24RVu1W48jwWY
	 Bgi7iwrrKjcqeLTRUXvSMJdtmyQwQ51yee/dK5tZrjuSZmqzb4EmCmEBHSeel8M0bMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850174;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ERr2QC7rdG7HmI8A9Z/kyJLwr/9Pp1mSeDB8spKj1IQ=;
	b=vCxvyKGjaQVibFtXYzWOb+ybMWTCzj6fG4zKalemgZvW+UmwXu8/zFNVX9yfrMWxAUDh
	 SYE9n8K2l3dzh2VbWZS860qopV1Qur5Qsg+CxmQw1TfsX97S+mFChan8gUIH0VwdyPirf
	 ds7dn7XZeo+oUbowUQTKnAffdySXGfWVNBHKi+W4crTGXqHPoh86h9M7LeLynEhbthnCP
	 OFDI8a8MQYJtUEbZpdTIWBiEifHgqiKSAIgAM81da8YOO5ETibPaso3kYyFokVD910aS1
	 /agcM2S5GHb7YeyldmbJRa2UFW6jXy2x2o7QE3uuWnCxN/I4zyRYVkul0w4g+XJDqRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EE3606A321
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7EE3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so72033735e9.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 23:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850172; x=1796454972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERr2QC7rdG7HmI8A9Z/kyJLwr/9Pp1mSeDB8spKj1IQ=;
        b=A5eX5T8civ+Z2MO4tpvNbu0ddo2uVBKdv4vPlSx0HzTuyfMiowvIwsnKBpVfD0GS3G
         xcO8OCKJ4pYfp7ys4fe1cEqZWbqHCxVFuHIdAewDTw1y31itXOg2p9oQUwmV/Q5wKpeI
         PkSxTlFNLSGRuXTozM4JHEeVEY27+uHm88dPFdjo93PY2MMJFdRB1J6lZNZCZrXAMaP9
         3Tn8Ud8tJj9rVzUfQcMyAxpz48zxBiBYcJwCDhUEM0fwau6/t/oZpUru6vUWdXXeIgay
         tsywTpUpiJ6mnkdlPd4E7h85Kwtj0RZkhgKZZdHhnYxZi6heh07YQTksf8/gtWooE+Q5
         xAwg==
X-Forwarded-Encrypted: i=1; AL+hErEdbuod0xcbcDwaJEMk74OWqb0TjEXJ1YSlcfnpvgPut3DHbH2i0jKJZoHpms+NgjlCtfqBTS58/89h@vger.kernel.org
X-Gm-Message-State: APuU4Z+BmUebQIP/XtvThDSQjOchhVCecj4ORH9RXS9qyOeAQaB4k6Or
	MTGvHcL2z7F01+ejcenLMGpStTrhMQDTv08J03D4z3++IH9msiJfq2hp
X-Gm-Gg: AZFdTZf6L79MFpkiPwYOWWF2azJnRRJSJGYjupbNRsX8FMXiTuhuigvwwSiMnTdpqNY
	Jhr8r4x8H63bjvuJ9qzQmP25ueBtLgg2kuUURPAVDHJVSHlZqo+PPKRB+3JqXyA7QCEcAZsqwnJ
	zHC/YtKC+rnl0nGv0f+sZ0z932B3cfbqpZkn4K6pJPdveGc55bvrQ6XDJzyzLpiw8agX4R3l2jd
	HBdQUK8S0E0gyZoqUZN2x6aVASoWtSdbrwN1tRMYbTfzo16uPcvPNV00FqFX6VY/Z1i6ZYKNvEa
	/S6e9SVS0vAt7ld4mECFnOIYp9fS7RBVYofGx3pPoepg92xJ3TkfKh1ue1/n+mLr1y5odO6lePT
	s51aMYLh9s2EyXIIlrIOdae74ec8YszmhJ70aKcpfCqp/iEXUGMn7UW+OsOn4UEL1BNsbl5WlCD
	aDUr2u9YYKi/QndScAFcTxNG4SX0GHDFH6ytaBmS+o0vn6OclKuVFScsiGyT+SAMeFfcbuicjD6
	XhUA+qkxT+WBTP8yjXCtky/O+T1NAEtjIfCav+QzOMabKIFZ9QNzokB0wBvIlo8tlbYEI5COWY8
	hwywbWNDyruCjKyQGz49y3Qvc731uFFPs+2J7+uy0JdztkvNYpzx59ko+h17/oXNHZTpxVsmif8
	AdiZlRPZLBu24fP9FR9JzrGRjqJe8wKKv0okQAVHStymU
X-Received: by 2002:a05:600c:4f48:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4bb8893ab9cmr572089445e9.29.1795850171873;
        Fri, 27 Nov 2026 23:16:11 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:11 -0800 (PST)
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
Subject: [PATCH v9 0/4] Add ethernet support for the Amlogic T7
Date: Sat, 28 Nov 2026 07:16:06 +0000
Message-ID: <20261128071610.27855-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
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

Patches 1 to 4 of v7, the bindings and the driver, are in net-next:

  2297f88ce0b8 dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
  18029931478b dt-bindings: net: add amlogic,t7-dwmac
  c4c851a3325e net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  4fdc7da7e13d net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7

This version carries the rest: a binding patch for the MDIO
multiplexer, and the three device tree patches. Patch 1 is for netdev,
patches 2 to 4 for the Amlogic tree; the device tree patches build
without the driver part.

The T7 has the same ethernet glue as the G12A. The glue registers sit
in a block gated by sys_ethphy, so the controller node lists that
clock as "pclk", and the pipeline stage between the controller and the
DRAM has a gate of its own, listed as well. The MDIO multiplexer gets a
T7 compatible with the G12A one as fallback. The VIM4 is plain
rgmii-id, with the PHY at the address its pins strap.

Tested on v7.4-rc2 on the Khadas VIM4 with the PHY at address 1:
941/944Mbit/s with iperf3, no error. A scan of the bus shows the
PHY at 0 and at 1 and nothing else. On top of linux-next, with the
on-chip PHY bus enabled, Igor Velkov's multiplexer fix keeps the
external data path across an access to the on-chip PHY: 942Mbit/s
without a dip (details in the v8 thread).

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

Changes since v8:
 - patch 1: commit message cut to the fact (Krzysztof); Krzysztof's
   Acked-by and Martin's Reviewed-by
 - patches 3 and 4: Martin's Reviewed-by, no change
 - patch 3: the on-chip PHY bus still starts disabled, a board enables
   only the bus it uses; the line can go if preferred

Changes since v7:
 - patches 1 to 4 of v7 are in net-next and are not resent; the
   numbers below are the new ones
 - new patch 1: the MDIO multiplexer binding gets "amlogic,t7-mdio-mux"
   with the G12A compatible as fallback, and patch 3 uses it in the
   multiplexer node (Martin)
 - patch 4: the VIM4 PHY node uses address 1, where the PHY is strapped;
   address 0 only worked through the RTL8211F broadcast address (Martin)
 - patch 2: Martin's Reviewed-by

Changes since v6:
 - no Assisted-by trailer (Krzysztof)
 - patch 2: the T7 gets a binding file of its own (Rob, Sashiko); the
   pclk description names the glue registers (Krzysztof);
   rx-internal-delay-ps as constraints, default 0, maximum 3000,
   multipleOf 200 (Rob); tx-internal-delay-ps stays false, the
   meta-schema refuses "not" on a top-level property, so the reason is
   a comment above it (Rob); "snps,dwmac" dropped from the compatible
   list (Rob)
 - patch 6: "snps,dwmac" dropped from the node (Rob)
 - patch 4: Andrew's Reviewed-by

Changes since v5:
 - patch 2: the T7 block follows the Meson8b..G12A block instead of
   splitting it in two; default: 0 for rx-internal-delay-ps on the T7
   (Sashiko). The explicit false lines stay, as asked in review.

Changes since v4:
 - patch 4: the old delay code is left untouched; the T7 only gets a
   callback of its own, and the probe parsing it shares validates the
   RX value (Andrew); no NULL check on the callback (Martin)
 - 0 accepted for rx-internal-delay-ps, the T7 joins the G12A list
   (Andrew)
 - comment on the deprecated vendor delay properties (Andrew)
 - the MDIO mux and the on-chip PHY bus start disabled in the dtsi; the
   VIM4 enables the mux (Sashiko)

Changes since v3:
 - phy-mode untouched, the PHY adds the 2ns, rx-internal-delay-ps is
   tuning only, tx-internal-delay-ps not valid for the T7 (Andrew)
 - 0 dropped from rx-internal-delay-ps (Martin); vendor delay
   properties explicitly false for the T7 (Andrew)
 - init_delays callback; patch 4 renamed (Martin, Andrew)
 - VIM4 without tx-internal-delay-ps, the PHY TX delay works (Martin)
 - Meson8m2 moved to the dwmac-3.70a list; its boards warn in
   dtbs_check until Martin's dtsi patch lands (Martin, Conor)
 - the delay table in ethernet-controller.yaml dropped
 - Martin's Reviewed-by on patch 3

Changes since v2:
 - T7-only delay path (Andrew), PHY mode from
   phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps checked against the hardware values (Sashiko)
 - vendor delay properties not valid for the T7 (Neil, Andrew)
 - no max-speed on either PHY (Andrew); VIM4 PHY interrupt on GPIOH_6
   (Sashiko)
 - the T7 node owns sys_ethphy as "pclk"
 - no longer RFC; Conor's Ack dropped from patch 2 and Neil's R-b from
   patch 6

Changes since v1:
 - the driver honours the generic delay properties; VIM4 moved to
   rgmii-id with tx-internal-delay-ps = <2000>, Neil's R-b dropped

Lucas Tanure (4):
  dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,g12a-mdio-mux.yaml   |  6 +-
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 88 +++++++++++++++++++
 3 files changed, 116 insertions(+), 1 deletion(-)


base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1

