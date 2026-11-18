Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981353;
	b=M6A5QtTnhLl1WFb0yz8MzJGsz/ejtxHA+yhYLcvS0aPPfAtiVvMtsaoGY1QWajUZvyPk
	 2DTkYcZ9j0zh/uixrtTZJ4iowEKHr894fpJDcC7b8+I0P3zyWiDHj4YERyBN0TNyaL4CT
	 myOkYwPJ1K1lwgXpaU/Yb6yNCQZqlTicfLTSdqjtmY6RJVsCIeKfHnbkS9mVDAUTaxO+7
	 ZQQ9jkkxAp1vm/gw0J/f8gERGrEB7EDsg/OL14c/dIKXxbTD+Y4pLsmh6cScoK+d3sg1W
	 Vfe4sF1K1Y4f+1C4+KYqzmJgMnXuh9GazerQ+3heTXxEVgnGOuInY7ROsFGZIuqZa3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3ObCFUaPSZTRyf028wzpjWfhsH1G2ASH7OVZC8zOIUE=;
	b=oEah/qnOXnLpeStNPP6/SePEyczVGbsW5m7AH9yhrcCmFHeblZrUviCuSnH8bfsfbRzq
	 YhhGHszlXKrdlcKAX5vP0w9rx956HvFFLurtHG66PK77ylzj88ZVlbzbLNy6Eq+ptw9of
	 /S2TnHagYFE7wkljgnoPUVhVmXdqPaAKm2tIyGfSo+c2SruTS7kTcl4IqLhYHCRBgtxZQ
	 /OUDd0ZW+AHZLFRqoSYbA1juTn5N0eQzEktvlOqdee4SyzeoCmVYNhsPn/3gKsVuS/4ha
	 HA/CRVtqOHbQyaPubj5PmEAHWUn5OuJjTIq+Jl6TmXnNgWoI4QRG+v3MUaYIDCmTnUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgFYPzW4;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB43F606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB43F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgFYPzW4
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8bef8d4fb90so6323b3a.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981352; x=1795586152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ObCFUaPSZTRyf028wzpjWfhsH1G2ASH7OVZC8zOIUE=;
        b=XgFYPzW45fnWRS3o50AJ5vyDYd6X1usUpKtiWNBBuTGx8rw6o3FWzLY8vfPVFOfNIX
         PrSgLm+kShEx5S5uGEPFn7rVFuXtI9bag1Tr0mHjalHnrM6fAgMymexxaZ3O26KSVFM/
         nEVdzcSXHbC8On3SvviV2xjmu8EGbe/HH1lElypWf32NZ31wf12vHqq7JYzWfJnOPOOz
         VWJ9uSsW5yEfOuvGcYhLUEVrCCWJKxO4m1hXunBqf4NTnSOWlgTX86jUtD/jBzH9yb1c
         WB9JArjSbdQLzsAYJY6CQAsG53G7EUGMPmbHfy+4NI9NvEE78T05uquiCoIV4qPzNxK4
         YvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981352; x=1795586152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ObCFUaPSZTRyf028wzpjWfhsH1G2ASH7OVZC8zOIUE=;
        b=DFNFfDPPslUnby1kJHHhDzYb3gXf3oH7APLvxridaDwgTMEg6wfWbVWjHBhwnSoZoq
         /Oa5shu3OYsVIo3vOnV3Hxx+LirjV/C8IQrB/J9CYEjExLZJ0VFpLY1keFXkMstFXC/n
         7YrzHS+aL8mRWyuwmXesX0TCtf/smzhgEL0eJEFtPXSclGtG06yDcat7BwpqIsnipL2u
         vkeWDvWopgcBYfsYOSM7fGAenyAJ3HfXTrs0F+NqAjNG0pNKcN9T1297RQuOdfhQb/+J
         0FOQNTiqZqy8TEKG8huIJCUUroMju3RxSrPjxgib43tmvnu4yg+kCEE8wMBpNlwZTd5d
         ajAA==
X-Forwarded-Encrypted: i=1; AL+hErG18jAcCCi/JnnOv8PuEhmAY0e5a79rlrNBVDQRIvVmcaj3gsXS9O0/NPWTqlUIPAinGH/JAUl7lErJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8xTPioIcneMe78yQ1YZKK/CH6bQPOaZGy3smLqcSNDN2bRwTOm
	8sJ43xQBEiFM2qlIgPIVWz9LHB9dowP8lbSoT7rqgWEf+xdaRpHWjT8q
X-Gm-Gg: AYBFou14DFhXsF6ErB8LZ2jlJbsPVoRa+fvv+N8xaWdoECAA+7otwgBr4oY4tYLj0gm
	iANzJyo2QkpX75VMlmcIOOl9g8gyqFjWUYahctIyV6FXEmo6QoqVxjszmTxx63pT8UoE2ZU0dKs
	s+g0EsYmMe3UHwR/vEBJiMET5J5eV7AaDNE/tvZMIyeKJqhpqTHTJmzsYM3VwSyxgAXD5klN7oR
	+BLnMJ52tms50VOt2abLVV8ERNgHyX7vrqgpchV0Rw1DV9I7ERkwpzkWDLAkw05ZZ9UyIXKPee1
	+/ojLDSq8/kXkUHx/0pO/GRUUe+YvKr+08BOmsIcYwLeJtQUXVOgoyoUDcWH1AjpD/jakiLm2X/
	D4Ff+9QbOXlJXrUmmpF58zW+5k8Ii0/ZwHdNHD698SWhrXUDKEpahR4ElEOQZwlcOLWy1JMrgTs
	y8+pDGLRQq6GUd0utJRz5F2Vg8DSjH6ea8EueC82+UxChDKxK/umgj9YaTsv/+WzFklKRuYXfYH
	lsDUov2flm5L2pdGnmQFXONu/KGQac017gWWF3yqWAd/BqNcJFknXRxTlzf0wJ7wXlSxvIndh12
	J5b4+/N9XIgdY6hxYhhSqZMy+UsD5Sz0pmproCtW6FNw8LbAo5rK4V/tmd93uLFgkuavGTVl6/f
	wzNwvGK/TxIjtxa6wbecqZ6/UnuzK1UcS6qFWmJ2DRA==
X-Received: by 2002:a05:6a00:a603:b0:8a0:8822:e6b1 with SMTP id d2e1a72fcca58-8c5d2e60c9fmr1601116b3a.3.1794981351549;
        Tue, 17 Nov 2026 21:55:51 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:55:51 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:15 +0800
Subject: [PATCH v7 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
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
Message-Id: <20261118-dcphy-rx-v1-v7-2-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
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
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=3151;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=4LpfXZ3K6xdqCmT0IpRxZdhbTlUKsH209mqyN39qYpE=;
 b=lBTRLbvf8g7lFsWQAbxZKLjxuc/2yXGEWDu1UJGcBC5a/HMuX/Btm1Jo9VvetaGhtS3KECTo5
 ezqJngNtDq9Cd+GGb6mB2i2L89PSeZdSEkBXCM3f/ahZf6JJcL71/8y
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
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

