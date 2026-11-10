Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298707;
	b=o9K+W1rNq4dpajCkK7BoF10WBxKgNiAUNn/UpJvkQjIhDlRszd1k7j8nePUH3XOhYhcB
	 mtmmFGm57oMZKpw+8UXLAc2M2QYuimbbSQ/ePmFiS+ojAN+REz5pUJx0RSey/GWgQO7sV
	 2rZugfUlyfY96JkzQ61ANXih+LcJr9GkFlvFI4EqsStS/lgO1vFMHgxXQ8tig4PayJ7Gb
	 yvOqnoxxKDRV8TXJdt7ekjpq9rLZB3sCBvUz/eU6lzPwlfkyiwMPBa0D4PB0RH7Yb/KYW
	 WV5xOGUjhkff9zBXu6RTJJ/U289gQiTGQi+rSZykeu2cuhdGF4VqhiN8ZC8VAhAoeBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yl3B8wwACC0gEnAcEi/cuKG4GHHYZ1RZckwVjmBrJlc=;
	b=tpHmiPFePCdTz1Kwn8fMUYz1x8t176jREW+eEkTHcJwK5SiopEEUhxS0KIlJznGpRS6q
	 Kv8d2ZnYjuniyq1cw3sGj19UAGkUbBCTFOSOUbXnPkMNliee23/NHXRSsFc5GKg17EXWq
	 1Iz9/6e3pzh3rBVWEpBEOi8xIEGGKNjqUc7K85QhZZ2lcEVnmx5nlPQoMT/zp+SUlbj1k
	 oeAcAQfpCJbMvLlegpoLkMxvPTtZw8L7E+kL9AEx4L95A1Zyyh4NDkGghoUROjdV3uqeZ
	 ThRGVAI0612OFjJAI+xcNU0jvka5/7eyQp8GF38gAh+aup5S/CHDZ4TIpQ0xYEbFBGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJOQ7Km0;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047FF606A336
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 047FF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJOQ7Km0
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35159e0092aso171584eec.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298706; x=1794903506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl3B8wwACC0gEnAcEi/cuKG4GHHYZ1RZckwVjmBrJlc=;
        b=YJOQ7Km0RCGP9pnzQVA3gniSw8R+GHAtcaa4xPtdpeb7I01ZBqMiMcefo/DeXr7bha
         SjWhGU4mr9XJMgclhj2GuhqKq2n59NqGCEH+N9yBkaesnm1M6DkuYxIgYz1xws8CCP8J
         5Ee8Q/AfU4RolkViabUd/wUATZ/frtsGIBuJJVOmgJWJFDYaN7LeVYwwnvYgbnzaVElx
         BojWDoz0hEiEEw0L2N2uII8vtHzUaJfGoAvvrdpwuQowzPChvn/0JyCg0IY4Z4/YMLl4
         Zq++sXUFlBmit+mslp3AKp7GhRpcUlmeZHtFcZJja8oBHkRx5dfIfUH6I8vCgDhX78af
         UPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298706; x=1794903506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yl3B8wwACC0gEnAcEi/cuKG4GHHYZ1RZckwVjmBrJlc=;
        b=1OVgezfVfS3nBhSQz5lL0S0Kid8P1afXBCLgf+4fflN/0ROII+k3g54RiXgVYZ4Anp
         NJ7Uk3nyAOmJJN4d0xgUkF6Pr3O9Tsh55Lx+aBFQDFee7Jf4CH7D/hydlAxkzNPQnUvZ
         HY4t/uFATSEqpHl8pguYElFS063A1m19vyBIK/14fND0OQ33G4bxcLWhRYoN68k05r82
         IhlaY2ReQiLbvRKAY3Go+1uriyEKEUZHKTTeufEyhzWxLH+7N6BXnJkp1BdC1M83MWqb
         EdeonqUsNFkg+tj8ZypSAIenaS9IF8G2Ij8SZt32gpaXJjZkX+yImigUzuznYPaoiVcn
         R+QA==
X-Forwarded-Encrypted: i=1; AL+hErFginBS3f2Fs9DZ8IsYu17vMxxPWR5k07881GukXlT4xDwsdLG0LZax/29+cvyXd84xEXP0ugZwwGDX@vger.kernel.org
X-Gm-Message-State: APuU4Z/wIYmRVCT7hwJmhMHkHNym5wzmgiw9BCvhjrn6a9Iqq+9nOKHe
	N4L31OcXEqgKg8Aiq1cRhE7smw9FCnVqIfOT0b3RCNs2TymQ51l7Ccv1wFSqNX528rw=
X-Gm-Gg: AYBFou1bc/V1pDJYl2J99B/koCp53OzfjdlgP5PGxA7tRZn1obh0ow88LU6D998b6Hr
	itJuJMgUMyUbE0n0qXgz19gYTqeDT7rug+PzkOgeVDyS6FN7ufufRtP/MWpwMIROf0Vwv2cAfX+
	LpnCJ/ebF4CxVwO4yRyNMwBbF9/DrGqpzBPvvwCvZZF90HVxpnRmM7DsYUbX4U/3/BE+qfV4uQT
	/dXJ7IRCzJJxBGp8gZ5TxhnM93eohQ8VUHZXYpvv7MhkYdbQW6xA6JVGdN1SqAVBlItwlFhpaL2
	FK3aBccnMGc25p6QM0b7JFC2FyFqqF4G8FxhCEmf6m1I5BSUf/l8bNgBTNDrDDiCHpMaCE/a4PN
	UZ+llVzgmr8NIqcGGyUAQclhm5L2/mwDz6j8NmHvFABoxlcW931Wihg94P2i45HKChkHNDqhwbG
	P30jkzxVgQC30S1lk352j0WuVVuCv+dqRnOJ1b3jbh0AgUTR891b8CtxyaGew6fiYX12D/vovx6
	t4FGwCTg52aGU4qIUT83CFPq/tRv6wqrPDs1y6MryFRVBH99KkF3EBN7zg0nw7BNFm/pL/XMtsp
	Ks75E0qT/2Se6Z0jlDF+2fQXBkRQrLTl3Sm0y44ZWNNAXQuilmZcZNp6y8+J
X-Received: by 2002:a05:701b:4594:20b0:1a1:9106:cfff with SMTP id a92af1059eb24-1b3ba7b302emr828418c88.2.1794298705356;
        Tue, 10 Nov 2026 00:18:25 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:24 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:05 +0800
Subject: [PATCH v6 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dcphy-rx-v1-v6-2-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=2929;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=xQ6WaPuBjE54d5cF8BexwENmzZIHniJK629BNNCMNF4=;
 b=X7MYhiVj8tskEvqzZbwBYXtP4KTQ0kMGiYW4eHf31wARRGAJfwayNHMoayBu8o+H23PJZRJTA
 7Suk9JEi68TAzp65I59DtI/ekqH0WZiIvBnu9ESCzffERUmKEIgD32g
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
for DSI and a receiver for CSI-2, and the DSI host and the CSI-2 host
can use the transmitter and the receiver at the same time. The single
cell of this binding selects the mode and refers to the transmitter, so
the receiver cannot be described.

Change the cell to select the transmitter or the receiver. The
transmitter and the receiver cannot operate in different modes [1], so
the optional phy-type property of the PHY node sets the mode for the
whole block, D-PHY by default:

	/* the MIPI DSI host, driving the transmitter */
	phys = <&mipidcphy0 PHY_DIRECTION_TX>;

	/* the MIPI CSI-2 host, driving the receiver */
	phys = <&mipidcphy0 PHY_DIRECTION_RX>;

For C-PHY the consumers stay the same and the PHY node gets:

	phy-type = <PHY_TYPE_CPHY>;

Existing DTs on a newer kernel: PHY_TYPE_DPHY and PHY_TYPE_CPHY remain
valid as deprecated values. They select the transmitter and imply
phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY> respectively, so nothing
changes for them.

New DTs on an older kernel: an ABI break. The older kernel ignores
phy-type and takes any cell value as the mode of the block. A DSI node
with PHY_DIRECTION_TX therefore gets no display, and a CSI-2 node with
PHY_DIRECTION_RX gets no camera.

[1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
    operate in the same PHY mode."

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml       | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..1ea21ab203ba 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -22,11 +22,23 @@ properties:
   "#phy-cells":
     const: 1
     description: |
-      Argument is mode to operate in. Supported modes are:
-        - PHY_TYPE_DPHY
-        - PHY_TYPE_CPHY
+      Argument defines whether receiver or transmitter PHY is used.
+        - PHY_DIRECTION_TX
+        - PHY_DIRECTION_RX
+
+      PHY_TYPE_DPHY and PHY_TYPE_CPHY are deprecated. They select the
+      transmitter and imply phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY>
+      respectively. Use PHY_DIRECTION_TX and phy-type instead.
+
       See include/dt-bindings/phy/phy.h for constants.
 
+  phy-type:
+    description: D-PHY (default) or C-PHY mode
+    enum:
+      - 10 # PHY_TYPE_DPHY
+      - 11 # PHY_TYPE_CPHY
+    default: 10
+
   clocks:
     maxItems: 2
 

-- 
2.43.0

