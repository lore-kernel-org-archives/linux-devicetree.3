Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805433F9F22
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550860; cv=none; b=DSAe1KZEn9uP3fF8NSaUuBdocI3ePSSAq5cBum7nKyv5BAqDi/nTop0Jzy3cP8WFyIHZ82Hb/iZFeJYMocI4Mjd/7jF68y2gy7WPuSxCxI2PNfFB1LIcLCRZOaQaVhgMQCxloLL2cWI150caBCn//lN/goWGXyFsZFqrYlpun0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550860; c=relaxed/simple;
	bh=kHSx7yrPSSx3XTLSrVOWkmHE6zs/oVtW4EX/xl4K9+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDQ9AWMRzkRUNi3Pz+py2x7a7t5IZiVZ8jGSJ8EDjMUNIxePQ1SPSBPQXv0uP31Qe+PlJazb0GtchR93Ae0/1LCb2gAcf9jsVUEo+LeCr+vY2fW4qxVjdjHLolCxy+MUkKAf3PM5aQmH+DfFp9Uc7UY2v5kdiCwKnah257n1IS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ru5i/AKO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ru5i/AKO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b24fdac394so6525985ad.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777550857; x=1778155657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CKv4W/JoMnGa2IT1tfwDfZQZp49D12KO1oxnjPxBw3Q=;
        b=Ru5i/AKOCZKSkDYbIyhtAiwNzdeLsjl8IF7IH0XfJQhM9QtGSSERWn+KAZMPlgLRDm
         e+Nd1i9AHzPrPPeGrPxXy/tP8+6UdFTNHC0NmpTlg8882HKwGeZZADyNJS3QyTheaWCS
         gfQnqpA1Dhwovoj0MYr/S9gizSoegIxZPAXrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550857; x=1778155657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKv4W/JoMnGa2IT1tfwDfZQZp49D12KO1oxnjPxBw3Q=;
        b=fN4IwuRmaKVfLv9Sx12B0GaS4WueHuyZEwmx3YsBhoymm1VE/MgathN4o1/JVhYyWR
         G6yau99RMLbDELIGUvte8Tg05U3XfRzuaOhxHhm+c4eEfwI99Y2rtjqU6nHsDxGqzDRg
         stGomDAH2cY9ZMPjW5gvebW9BE1nb1GWBq15XwdruRO7bnbw1HnhR5mzAw9Ecm5+IONH
         HaUgutvphcBjdd/w48yBpXx/nPOR1H3feWC1mtdLHkpPgq+4gr+BK6zYCc/QLTIYTYnW
         sPKAC2Imh7KGIn+8flho1iBdF6h8S68QJFV+64alr8AjM454b1BrkfdjfDc6GgXfraEf
         xeOg==
X-Forwarded-Encrypted: i=1; AFNElJ8QAgXjDOswG4ZxrOQcAScY4yk8FIzDN+5JaO7HlbAbfFRkWtBcjrHQN5S1Om8IjqgANtq/tD3SfbKl@vger.kernel.org
X-Gm-Message-State: AOJu0YwNc8bqp2DNc8aZkEcS7YMyE6GfA1qYpZifvH3PLIt+LAacTDno
	Hr+NmXxjfpoZVH2oYWKxHD48VgWWQGJ2o8g1RQHxiCOSXENvavIyhQgu0OkdPTcjkA==
X-Gm-Gg: AeBDieuwtN5sI9XldPEFymlZ8L22iqJlTaEfwRYfTsjBvfHhqFPgGCKdafDoZcZNVmV
	fXcbAWCr5/3iG4afWrvcyt5X4blvfi1jgDo6kb/c9+S1AeWDaNyZvqVfLCWwOYXJ6aUV0sVUj9w
	Lbezu5Dbf3JMm+zcNyRusxfO/XuN+yUDL/aJlOwyxa/RZhY6eRtSL/ojB+a+l3p6y6NF8cz9eGR
	r38rxW7zS26SuHRNQOsaX+RXyEThttW7KSmcPPk2IUHi9a13kiifB5LmzrX3PZv+1CnvIGAugN+
	hTKfwex4SUTpgzkR4i4pkzQuYYY1LTcWPzgbnie4zdvG8J8z6RW1+WDxnDhpk8dtNhco6XfgEU4
	otIdPyGJfS0jL2Nu/zuYHcXmS4yW/xL6GCeE8P9MEfiqiXPIoF70l8wdYA+yi3xDfMUfm/YCkA3
	1fAEd58pmbk90ulAgSbN0Cm457eISbyJnehoL2YEcz8OztaLc7ft2SnDGn77Fid2/8A2CprnPoi
	UTcAWKO29Orv4DEtAc=
X-Received: by 2002:a17:902:ebc2:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b9a234e8c0mr28352745ad.16.1777550856708;
        Thu, 30 Apr 2026 05:07:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7c53:8aef:3f8c:bb04])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b99835a796sm34576285ad.59.2026.04.30.05.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:07:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer to host
Date: Thu, 30 Apr 2026 20:07:24 +0800
Message-ID: <20260430120725.241779-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA bounce buffer is attached to the PCIe host controller, i.e. all
PCIe DMA transfers should use it.

Move it from the PCIe (WiFi) device node down to the PCIe host
controller node.

Fixes: 0dca9f0b3e63 ("arm64: dts: mediatek: asurada: Enable PCIe and add WiFi")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 217c9bd5e9a1..eebcc4068e28 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -645,6 +645,7 @@ flash@0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
+	memory-region = <&wifi_restricted_dma_region>;
 
 	pcie0: pcie@0,0 {
 		device_type = "pci";
@@ -659,7 +660,6 @@ pcie0: pcie@0,0 {
 		wifi: wifi@0,0 {
 			reg = <0x10000 0 0 0 0x100000>,
 			      <0x10000 0 0x100000 0 0x100000>;
-			memory-region = <&wifi_restricted_dma_region>;
 		};
 	};
 };
-- 
2.54.0.545.g6539524ca2-goog

