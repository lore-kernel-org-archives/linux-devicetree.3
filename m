Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123633932FE;
	Wed, 25 Mar 2026 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427193; cv=none; b=njE38Zlwwh+e7f0dOwnN1cy+Dof935BG6pHhfFW5/FsPPDNKcnOZKG7PyArNdGjGptL4Pd5LE/HrL4zD2Vi6jcrLwAlvAD5MfysFhxvVrNyvCVjALGTJo/HGc/fSK9LRykbQvsMONQnsu9yyXEvwdHAJzuyv+2dIQAWJyflpnEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427193; c=relaxed/simple;
	bh=W4XKIH6cy5CRmVbhyzaccefspvVv/UoMzu1VcrDaUE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pBnKvmDdyBFtKuR+/M7rcDhjsDoIrZW1nfd6z7hs2t9Hz0aUqtyE/9n8bazWuM1oxBcEzRzCdu38y6Ry9iE6sailSAtkN1o0EkrhQ6X7a8j0YaHLn4xPewSHsTzlSWTaAnZ+yU/eu5UOfgOc5DZGHBDhiCNVXjOAoFmoYAKqJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.202])
	by APP-05 (Coremail) with SMTP id zQCowAA3zRAMnMNpPvpuCw--.51434S2;
	Wed, 25 Mar 2026 16:25:49 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mateusz Koza <mateusz.koza@grinn-global.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Cristian Cozzolino <cristian_ci@protonmail.com>,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
	Max Shevchenko <wctrl@proton.me>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <uwu@icenowy.me>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: add mt8173-hana rev2
Date: Wed, 25 Mar 2026 16:25:45 +0800
Message-ID: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3zRAMnMNpPvpuCw--.51434S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFWxJF4fWr13Xw1DWF4rXwb_yoWDtFc_Ca
	97u3Wqgr1kJa4S9F4qyF4kAF1UXw4rGFZ7Arn8JF45ta47CrWUWayvq3sxCryUWF4xur13
	ZFs5CFZrXFsrCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

My Lenovo Flex 11 Chromebook contains a board with revision ID 2.

Add rev2 to the compatible list of base hana DTB to allow depthcharge to
match the DTB.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Added Conor's A-b.
- Changed mailbox to ISCAS one.

 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af6..2894c8a16c78c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -148,6 +148,7 @@ properties:
           - const: google,hana-rev5
           - const: google,hana-rev4
           - const: google,hana-rev3
+          - const: google,hana-rev2
           - const: google,hana
           - const: mediatek,mt8173
       - description: Google Hana rev7 (Poin2 Chromebook 11C)
-- 
2.52.0

