Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559A32D97BB;
	Sun, 12 Apr 2026 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775985830; cv=none; b=ffUwhC5PEh9Mm39A6xLeuwh5F29BwnCu395hDCe3umzgsrgd3Zwz1HPZeIY66uGGBnZ0i5FEukHwtqGH36JkvBLoW+oeV4G848G/R53IkRQapg0BCKi5tRD6R+3JFPO6GYeJRHoFncuJt2+VCO2oHi1jat+q97+X00mileeABmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775985830; c=relaxed/simple;
	bh=qmWlWYgdADl5OcefcP3gCkw/Ojgpid+d0MQlfTey8iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3lmEXJk/ygvwb8qpRmhQFR4sm+ItTLFkITcxzgAqc6/4/vE6Zqa+22TSg8Ef775QtE/ZkSTfiVEBcW543RWDgWvv76CkXJd9GknJLTvmYMcmZjIWQm9H27rjOUV0LwYXHaj4a29rFoaSISKCus8WSQYpSBgZPExgB5YALzjHtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=BhALq0GL; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="BhALq0GL"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id A0DAB100501;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775985819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HT1LmTE+wyO1hbqhpbnpGgkpi6vYm7hFobdw7gJUxz4=;
	b=BhALq0GLxllLVKbwbzl8x7kH5PUqeVVAHiZuXhvdJll5yG/N+MCTT5L5kEmcAeI9mdcRdE
	fEOwxd7M5UOD6rIsbe1CBAft5afYXJ1EE0mdtrN18l6SmPa6NJcr9TnNsdbONEa5osy7C+
	PdZ+MUwrwMrxf9sUyJRWC3X2wWvk/tM=
Received: from frank-u24.. (fttx-pool-80.245.78.225.bambit.de [80.245.78.225])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 7145B1226F8;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
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
Subject: [PATCH v2 2/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
Date: Sun, 12 Apr 2026 11:23:30 +0200
Message-ID: <20260412092333.6371-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412092333.6371-1-linux@fw-web.de>
References: <20260412092333.6371-1-linux@fw-web.de>
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

