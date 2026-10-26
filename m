Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000428;
	b=lvLRjUBtuKEUzwB2tEhdzUXUnLWvS/kOMg1KxKxsoAHp3Geci7P581J03fj35I9+W4k2
	 in/MYrnvekL+gzwkR12Mt0nd2pc9aRJG2aPnUdp6ZU5Qt9Qh0ST96tpwTwkJfT2dn5AU3
	 s7g4e2MDJqPbCSImDyaHe/HUcSChX8Ky0RY2mqfE5fjkGPjplZwb7nHXc9qeCpjY89WWz
	 fSMTTWzOfNExPm1xf1+RmhDFyZs6JD6p3Wt4fhDo1l3PiMcmSxIZLy/HjS0VKPcxs/F6T
	 g9JqJxkRm92/0UElSD0Y+Sipn8MjZdSQ7J5XuhC/4sZcizY8clhpfVSfBkRdlFxcStQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000428;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=TZbUPCuy84nV2Kh77bXLhwqW03pLNsaaPfcXY1Y//TM=;
	b=LBO5XEU4jqAGMSH1RYqgHGcqu6v4Ek2jCreWaA5FQ6htwGz7LRZJmJfFGoNK3xpn3liE
	 Yw81LaD5TEo1TwQLSMGmtatiFw68IwdyuPFpmvGJSo92KH0NmtmY10PbofpDodSVqR6AD
	 Oi9to340dY0NQURn32CCrCYXWijKq6S09wsMbu7sbb9aNFgx/TUJXVeOf+l9m2SvzblLk
	 /eSJGMia4FQIrujXQ1LSuQtK+6wjIxWVPfP9O3TLeu7O41yPuh++glJY8/t480AxmyJ4n
	 rtvyk6wPLhxpeKFatkJlOiBS1ZYK+r5YZ/jRNIdUoEPGu9PTysz/3DsYUZ04f/Ym9mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=DQqF7jJ7;
	arc=none smtp.remote-ip=103.209.128.206
Received: from mail-m128206.netease.com (mail-m128206.netease.com [103.209.128.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF55606A329
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF55606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=DQqF7jJ7
Received: from localhost.localdomain (unknown [61.154.14.87])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5257abbbc;
	Mon, 26 Oct 2026 15:40:16 +0800 (GMT+08:00)
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
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: rockchip,pcie3-phy: Document firmware-name
Date: Mon, 26 Oct 2026 15:40:02 +0800
Message-Id: <20261026074003.1169669-2-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261026074003.1169669-1-shawn.lin@rock-chips.com>
References: <20261026074003.1169669-1-shawn.lin@rock-chips.com>
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
X-HM-Tid: 0aa1772726d903aakunmbf670e0d2f0045
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSUtDVh9DQhlOGk1ISk8ZHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ0xZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=DQqF7jJ74tLw+j4JB3u/dwW1tIY1lR9x63ooGRCLNVhDNUGPbwa6gqJ2s9BltXmM9ScBXKYUKIx8ji/OXfCkNqzKjZYsJBHicJ2XwGxLYGIlyitW2F0MZdFpVNeXB2fNb3eNXW3kwWcu9wqGwaWDC9jaifw/pd9uJxiC2qIEPtY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=TZbUPCuy84nV2Kh77bXLhwqW03pLNsaaPfcXY1Y//TM=;
	h=date:mime-version:subject:message-id:from;

RK3568 can load an updated PHY firmware into its internal SRAM. The
firmware file is named by the optional firmware-name property; when it
is not described the microcode already present in the PHY is used.

Document the property and add it to the RK3568 example.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---
Changes-in-v2:
- Add maxItems: 1 for firmware-name (Krzysztof)

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
