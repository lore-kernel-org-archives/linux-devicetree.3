Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D761D3CFF79;
	Thu,  9 Apr 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741008; cv=none; b=uiEgrqpr0LmLeOSxyyxS5p62vRaAEnNC1a34q7jgZ66tTMWghjpPKWSB4f6qiP6+nDDHKeceKCnDieN2wZRUPqUDeggGgTWR7CIt3nGBloYnjTujCDQTyXkv2q/iPt1B1SEB2myAc+PcyanzNdJYuOWAl+fuauT8ujjIFtY+Iwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741008; c=relaxed/simple;
	bh=qmWlWYgdADl5OcefcP3gCkw/Ojgpid+d0MQlfTey8iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyzWBu4bi5E+Kp3SoHmBrDbtUTk6ZRN5UdElPTNND3nFZT6wtPwApXyd2Tql5pp4TUPo9kniWZ0Pub4oqkpAFvwHxg7pl1H+bJkAbYvx28GHNkS0+N0Og616Ll1x+L3ux+7e6z3firRE+MnZj1MjCm1ml2xY+jSyNCzVbDxkSkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=NGFizDXq; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="NGFizDXq"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 6E125607C1;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775740684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HT1LmTE+wyO1hbqhpbnpGgkpi6vYm7hFobdw7gJUxz4=;
	b=NGFizDXqCXx/8o6Igf3d4G8luJ8Xw1XF7H44eCzZsRR+D9kIeKLMIvbVa6YNnvTK1ZssX1
	k58FXnY0U+DmOZLJQCY4GIjTDCP8dVFRkZhfyfOooW2AHGLt8Pits7RgWm//rbq9bA2/6n
	Gywv9vXcXe1J6Fcf18AiR6irdqazTYA=
Received: from frank-u24.. (fttx-pool-217.61.155.21.bambit.de [217.61.155.21])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 3FE7B122701;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew LaMarche <andrewjlamarche@gmail.com>
Subject: [PATCH v1 1/3] arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
Date: Thu,  9 Apr 2026 15:17:49 +0200
Message-ID: <20260409131754.121737-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409131754.121737-1-linux@fw-web.de>
References: <20260409131754.121737-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

These properties are already set in the original node and do not need
to be defined again.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi     | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index 1175ee156cb3..759f608d1081 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -185,13 +185,6 @@ &eth {
 	status = "okay";
 };
 
-&fan {
-	pinctrl-0 = <&pwm0_pins>;
-	pinctrl-names = "default";
-	pwms = <&pwm 0 50000>;
-	status = "okay";
-};
-
 &gmac0 {
 	status = "okay";
 };
-- 
2.43.0

