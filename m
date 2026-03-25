Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F230EF64;
	Wed, 25 Mar 2026 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427206; cv=none; b=bJABaJyJbP9sTVx0SvzJPkJhpBQyoM6xPyC29moC4C/8X31NviPxyMcb3I9RFKi7EPGfAt4MmxqhBmUNCpRkgj/TpIJ6zSo7PeThIqULRvDggqAAkEpJiKLlI6Ec5DZTzZtOd49hOAXoWIsrPLtecam1EnuJdp4TTI8IdP8SvuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427206; c=relaxed/simple;
	bh=M+kKx1ylIubT0nQl1WSNvE9WYN5Vezbi3u80ScBEv7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egQqcZ+6FxvIAfDHMEl4w1vkxqYnor7iNdXLDOS6Zxr6SsSW2ChCWOYcsV9HRX4lFeXs/FiRz8KwngyBElsX/So+hamAgDk1NNs9QFYZXrcytZUrS9ix7M5FrL9BiDjbi7dJt3qfz1fB4jdNTDuAVvrUX2pAooiir3kRFS6cKL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.202])
	by APP-05 (Coremail) with SMTP id zQCowAA3zRAMnMNpPvpuCw--.51434S3;
	Wed, 25 Mar 2026 16:25:51 +0800 (CST)
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
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8173: add hana revision 2
Date: Wed, 25 Mar 2026 16:25:46 +0800
Message-ID: <20260325082546.1572405-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
References: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3zRAMnMNpPvpuCw--.51434S3
X-Coremail-Antispam: 1UD129KBjvdXoWruw1kArWrXF1UuFyUur1kGrg_yoWkZFc_JF
	n29Fn8XF4kJas8Zw1YqFsYvr12q3y8ZrWrGFs8Jr1Dt3W5XryUG3y0v345Gr4Uu39agF45
	ZFZ8ZFW8JrnIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbPxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
	1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
	xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCa
	FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI4
	02YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pEnYFtUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The current mt8173-elm-hana.dts file only contains compatible strings
for revision 3~6, makes boards with revision 0~2 to fail to match a
revision-specific DTS and may fall back to the rev7 one (which lacks
some gpio-keys).

As I've got a Lenovo Flex 11 Chromebook with board revision 2, add it to
the base hana DTB file.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v2:
- Changed mailbox to ISCAS one.

 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
index fcf0cb76a87c3..84638a07587f3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
@@ -11,5 +11,5 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,hana-rev6", "google,hana-rev5",
 		     "google,hana-rev4", "google,hana-rev3",
-		     "google,hana", "mediatek,mt8173";
+		     "google,hana-rev2", "google,hana", "mediatek,mt8173";
 };
-- 
2.52.0

