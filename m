Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793584376;
	b=08k9cEk2KdE13Lu0mbqnYPwPqDQrFieQZEc4YatpFMJQz1mYK6Laz1jh6wkDCqU/Cugg
	 kUuPWTa5ZS4nNv2IKsJGLMxc1tnRkskLYUm/ngL4qwWznx6rHK8+rYdrWDD7OMoEDlE3L
	 mAohXC3nb9e7GxBs3PjQFttBM0z2GcOBzNmUxfmJW1Dc4lsss2WohHRa+0iSIuY4iVQJZ
	 4CKx8xKwOxYxQjyLQMjW4mSVghz7nFuz67EXAy87yklOjBLitXSSlFNEcpglWcgCqbF6a
	 PL9RJXoEf/PuaaqBsHzzb7dxE3a7tFjJRS/P6LuwuWbOoOJr7mjYkFaY1AYf95Q51pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793584376;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=pphSVbsbL3wxoChVAcOfl/UqwgbVrcjoDmaxQ4c3ZBg=;
	b=hrHDc9LDsEguftoNcbY+s9961ixWVjlQS03jOtrAffz0WFPs7pl9T2X93zifNUHhyiY/
	 bwkhBwaB6W7bM9Hq6wJj0qQ8vZJAF792ob53/AJ3bf0iEkjPCrZ6HLccBcoUtGx5z1pcH
	 WN9VOEeTbrlIZ3Ppg4Qx50ECo1+EnSiQ3VkG6dgZDgmKZr20vc1ng4XUoO0yDy+NiyGEh
	 WZas/iK+Na3he4YapKqgXNmf598NrfrWtFhRRXwpnSLhJp9LaGn3ZtMeLYt7GbyHkBXni
	 5JFL3bjv6grC7BxIIh5ozM+yGRNqlx3COQzvaPrUlGbQf/mrxvO7yBzGchPA7zL6+tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=B7XHB1dV;
	arc=none smtp.remote-ip=103.209.128.40
Received: from mail-m12840.netease.com (mail-m12840.netease.com [103.209.128.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8929D606A32F
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 01:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8929D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=B7XHB1dV
Received: from localhost.localdomain (unknown [61.154.14.87])
	by smtp.qiye.163.com (Hmail) with ESMTP id 531ad2667;
	Mon, 2 Nov 2026 09:52:44 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Vinod Koul <vkoul@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Coia Prant <coiaprant@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: phy: rockchip,pcie3-phy: Document firmware-name
Date: Mon,  2 Nov 2026 09:52:35 +0800
Message-Id: <20261102015236.3844843-2-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102015236.3844843-1-shawn.lin@rock-chips.com>
References: <20261102015236.3844843-1-shawn.lin@rock-chips.com>
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
X-HM-Tid: 0aa199f57d7a03a4kunm2334e46e3a72da
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHR5MVkxMGEIZSB9DSEweS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ0xZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=B7XHB1dVDyP/H3e7n2GcYIs2RVAlhNC8ZCq/N5H/nsFbXDj3Nv+4ejLB15C+V6fMTpbL4FXjch7FqAIO/7BBMDB0AbxAl9VpBOYDkF0aCyVAT6QORKcLQUmThqtZ+LvK6nmeyHEXnXDptX0Yzv1KGwJD6um3m0taDfIYqy8abeE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=pphSVbsbL3wxoChVAcOfl/UqwgbVrcjoDmaxQ4c3ZBg=;
	h=date:mime-version:subject:message-id:from;

RK3568 can load an updated PHY firmware into its internal SRAM. The
firmware file is named by the optional firmware-name property; when it
is not described the microcode already present in the PHY is used.

Document the property and add it to the RK3568 example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

Changes in v3:
- add maxItems (Krzysztof)
- add Krzysztof's Reviewed-by

 .../devicetree/bindings/phy/rockchip,pcie3-phy.yaml        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
index d7de8b527c5c..554211d22077 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
@@ -67,6 +67,12 @@ properties:
       minimum: 0
       maximum: 1
 
+  firmware-name:
+    description:
+      Name of the PHY firmware loaded into the internal SRAM on RK3568.
+      If omitted, the firmware already present in the PHY is used.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -113,4 +119,5 @@ examples:
       resets = <&cru SRST_PCIE30PHY>;
       reset-names = "phy";
       rockchip,phy-grf = <&pcie30_phy_grf>;
+      firmware-name = "rockchip/pcie3-t22-c8g2-1.6.3-202a-p7.fw";
     };
-- 
2.25.1

