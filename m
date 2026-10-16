Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5939545199D
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141023; cv=none; b=gTWA91kpFsBid1G1xHKm1W7RGZkTUeTBmZ5rDzgIXhKRXXXD73iaFFz2NFP2q9I001PO82UglfvBg3dXyzux3Gm8Ipvn8ceqmWSeFn0DFHDf5rHN1kLvSSFra/ByCbLzItpJl/9U2uWJPMVdrpyBQgrFHzHxmlrUXjeXMpL54/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141023; c=relaxed/simple;
	bh=ce8JdNOJs5zvcQeCguszU9j59LCLfLXe7OkJrHqM/YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lhmm0bxFTXKpdmz7xVl5o1Cza0x9bqpTlAbnApC7B+M5c8XukysU7a3hoqqZQ0asB22/c3lNpwOTxWc2XrdjOkiQk4P5BhS5PodNKfGIKUEh6ehj8AXE3n2MmhyB4i5wNIIFoAqqOFa+h6K1AVdq/VVf2wllPur7ooORyBbOgeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSqy1MPw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSqy1MPw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db3728f0c4so5183315ad.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141015; x=1792745815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtLGyN+PdzUpUTcE98Aumqo/hwiyHlck/gS/TT4kqGo=;
        b=BSqy1MPwa4RaYyL+SyGyVe0CXoIXk+ad5qtV/seW+o7mxvy/4/+tcZl7tIQvmnC1Gg
         Wr95on/WLC6pK9itHJh+0ppVk4LJ6/x0ihESuILlBXH/hTlApz0jvOi+LDMC/m8WP5Eu
         KKNvg2itCRuh1W1UpWAN7pX8L/8DE4M64F750DzpPP2QaFEv9sROQG1g1MjSXhTUUyMs
         Ok355RO1COGBihoSW8DmHyzasGxhLFSBIZPloRm8qEVOiKR4WwV67f3kUVIigwrPC9I9
         tyNXIsua1m22UW44baPGyRLB3oskzZh2LzVHpJvR3UYzE2V2qpSQo0jECT5KITuQec0+
         kaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141015; x=1792745815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtLGyN+PdzUpUTcE98Aumqo/hwiyHlck/gS/TT4kqGo=;
        b=GD9LlVvPUHKbvYZ3/0H7u6aIUFHxMpxyE0TTgL7QzBmW8rr3yARrlOyuLVIsx7Fwkv
         7k/XH6J12g1opY2u99NZhFVTx24xQeplV40N371rP1P0aPKqDMSYllUVTWsnULGM0r7+
         hZXqSeglLosczVrgin6OcjSiZHABV+i9Gy9RjVT0mqcjGayJSCur3rwrHiwPq2YtZfMG
         rSfay0g3Yd0gw1PghicfvFvXei3aJ4zB6XvCJWjSJGwhVaYwx6+YlUW1ljgUjUHpKrmM
         Vvbur/TH/MJ1kYu3mpVZklYnEtDB/jRSUEDDN6+hHisGnxSu70OZYHi3EkgPnrJJiojs
         sfsw==
X-Forwarded-Encrypted: i=1; AKwUvBypmegREoZq4IJgigMlRdcjQ1vhMdFeOl4sMzwhLtgtaJsWT0I03ls0QCMUcLktvB0//kaNwuUE859w@vger.kernel.org
X-Gm-Message-State: AFq9FYKoHvY5HocuqC/iY8jvdqm4qsyoXihjLbmocLJrZbyFkKcUjYLz
	lFAA1fStrIqCtkms07+xaLCBMkzoiI9kNR024n4lzkkohUTN+WCXN20m
X-Gm-Gg: AYBFou3UDDmqUZLbe1DmbVmQtqUrlE39liyAz3SOCCd/za34DTciZxy2KgwbXLbFs10
	B/n8nZwn5sQ+bTr364U4qbv7Ng0fjtQzOkQOXp5FUByKH8YsO81Sskqjt4eO3Ir3srZnIjCcOw+
	7tu+VPDLuptCIbVI9wxb/mC71Nv1038RU5sELzx/b0RA7KLN9NtW2RPGDcoHW5co22lBs/vCGtX
	3PmBkkujLLoZw//MV2pEdJCkGiL98bwoRlQQz9NpGONcqV7hMgldkckdlHCIF48nOyw7BnlsHEv
	fve97kmDVapCItvnxUWksUvLH8DIrMp0+81kFjzszcm7H33chOEu571R8Fy7EONivXf3PGR7AfG
	3MeVcVqIItHMxtG9GifIRN1xH6uU+inQKNK4Ih/+iZY1KeFsVqiVK5BbEqc5/+jMyzibQHR1a1P
	jeDsPD2tZBZwuekYJnkuP2Wdvzvb2dpPWDMrJYiBjbnbA16b1EpKHgQPqOfYOt9hqC1XG/zCZOf
	RLdUzBWelycW3AR4kqSFKBG7hrQig0=
X-Received: by 2002:a17:902:cf0b:b0:2e9:6788:937d with SMTP id d9443c01a7336-2e967889666mr61137945ad.4.1792141014917;
        Fri, 16 Oct 2026 01:56:54 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:56:54 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:36 +0800
Subject: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add a
 cell to select TX or RX
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=2767;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=ce8JdNOJs5zvcQeCguszU9j59LCLfLXe7OkJrHqM/YE=;
 b=xGmXf0uJmuCFnGX4LXl2EMMZ1WvsxT2sntwv+hZwzx8NB5XgYmF4wB3TO71KHkIhWamdIBqA9
 3a8QSp0sv7LDJnLqs4+VROT8Z2H8vmMinUmvM0gz379mPKwncWtik5A
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
for DSI and a receiver for CSI-2, and two consumers can use them at the
same time. The single cell of this binding selects the mode and refers
to the transmitter, so the receiver cannot be described.

Allow a second cell that selects the transmitter or the receiver. With
D-PHY:

	/* the MIPI DSI host, driving the transmitter */
	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;

	/* the MIPI CSI-2 host, driving the receiver */
	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;

and with C-PHY:

	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_TX>;
	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_RX>;

The transmitter and the receiver cannot operate in different modes [1],
so the first cell must match in both consumers.

Two cells describe the receiver as well. A single cell keeps referring
to the transmitter, so existing device trees are unaffected.

[1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
    operate in the same PHY mode."

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml     | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..6e8cc56e4986 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -20,11 +20,25 @@ properties:
     maxItems: 1
 
   "#phy-cells":
-    const: 1
+    enum: [1, 2]
     description: |
-      Argument is mode to operate in. Supported modes are:
+      The first cell selects the mode to operate in:
         - PHY_TYPE_DPHY
         - PHY_TYPE_CPHY
+
+      A single cell refers to the transmitter and is kept for existing
+      device trees.
+
+      The second cell selects the transmitter or the receiver, so that a
+      MIPI DSI host and a MIPI CSI-2 host can be described as independent
+      consumers of the same PHY node:
+        - PHY_DIRECTION_TX
+        - PHY_DIRECTION_RX
+
+      The transmitter and the receiver cannot operate in different modes,
+      so when both are described, the first cell must match in both
+      consumers.
+
       See include/dt-bindings/phy/phy.h for constants.
 
   clocks:
@@ -82,6 +96,6 @@ examples:
                  <&cru SRST_S_MIPI_DCPHY0>;
         reset-names = "m_phy", "apb", "grf", "s_phy";
         rockchip,grf = <&mipidcphy0_grf>;
-        #phy-cells = <1>;
+        #phy-cells = <2>;
       };
     };

-- 
2.43.0

