Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43322E1F06
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454207; cv=none; b=GCaUiklFBIT10QqfFy2GTCvdJQtQw9ijex6XA34a1dHoGVhX57uJioCr2TEXusiG2xA+V46rWJBATlTDCK35ACuKazmQS3M3/OEIdwx096RszJ8lIV5drVj2RFSkJ59Fv/8MACcWoeLJEB4pdL57GVOiv16d+EBhhdxFufxWEmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454207; c=relaxed/simple;
	bh=Cu3x9eXcBF5aTqGhRrit1YlpEazlGSQcR7PvO9XKWas=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Tgu1nlOL1Toith+zKBDHutAT9FmdmJU7y/vy+sCtxL425PpQQO7g+Mip3YEjqXd5KVn2j8j6edemzZn/jiuGYUFLpknEoIHkxQiJOJlNayUIJSr0Eo2VpYWbV0jpxdH7C2G/UbBFbVE98rpKp8q5HAmvdoat2EVvd59FI6I3V98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kt9LxcFA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kt9LxcFA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so11834405e9.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786454204; x=1787059004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gitYuIgMAmJ0oQcU7iG8TZn7YufiftcwyUkdvrQmLDk=;
        b=Kt9LxcFAm57xhT6QpdgnYTTzEVQtOQjRljgeGXHBDWyqT6X+UUkU2ujXIuDFQGQCZI
         UqSjIetIfxNFYH1GaGp2KZDqINq92hsp03A/lb7L7wrqBh7IM+YMGYMINzSf45aDrCCK
         sdxN+tv0//YpoAMpT18tsmRJHQ0SpXDrl5Ia+RTc45/nlloUKZx5DtSt4EMPgmPDOjp/
         fRWwYArqrOyZxTchr44kRPgyHAqc+ZEw9cCwmR2ZJCRKxFyIMLrP2tflws/BjbZ3nX8H
         2oPM32V6k9hhdBmJmNuD/uz7/GhIH7fD9YozoiR/GDGCqJRiXqLVuvr1wmPKIxa+mwdx
         MB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786454204; x=1787059004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gitYuIgMAmJ0oQcU7iG8TZn7YufiftcwyUkdvrQmLDk=;
        b=azMQeV8g9uxNt1lME1PqdIdpgFok3KxAbFsMnxTJP+46IG1DQb1emBAweEY3g5osiw
         NS1OKipWv12RNvDdnJf4jVh2tCXa3QifX0/I7jpgDhMgncttgKFSi6YiIduS/7DkZmvR
         CyrSfauWJRXhO+9Dj+V2rOqaKMf3QfJ2o3+9XEI0YZyFSEbu6G9QDrW5cqII+dEMN4n6
         MKzNEfZ7SkcpwfkLgMSbv1Yf586LODm8cH5Aaga4fcGJRP/UB9f7Gn61NxnOB5VwaV8S
         7TGRFbYg0eMqC0/GmVKnDXSxVdS1+CvdOPpacdS2VxTbW8oB2qcx2IQ8M+NsdxvBgNEx
         Jn8g==
X-Forwarded-Encrypted: i=1; AHgh+RqRhFXPka238W6LMXHy1pqr2fZysafDTWKjworrce+YFKwoQRQieImJ2Z+GK0oJfIa5YjUHgN8CMlA/@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ/w3TnkpFFj0xEIPH2Nds6Q/ulRGlAZk24OPy6bdIlLi8BrS4
	wR2pUJ7NG9xzTOEHFBB13EwiU+Ak3Lj1pzMV5f6RlsxMIB4s+9z1dj+B
X-Gm-Gg: AR+sD13eK28pTtSbCwQfKOYsfbJd42pxFmTBHTXgtnNrDNLrjC4HRrXfnt8SkvqpQ/6
	uBbQwxTRRLuPI4E4pk4v5hj03kSDzlbo24JluKlYpeRFnbpz1a2MOnDjIc7mDnl9n5I924D7hcx
	iyIiULvbZ1KgMZrXfFeS98ST3hJFS/E4Mo2adLmmMtwjsbd7bp/pBFG7rfu6zSarenAaqtz9ReZ
	5qaz+a1pK4yk6p02seHLI6W3IApNLYsFY1oDuAahpF8mbaKkshvxh1TKDA0FrfJU1T/dIIy9k/5
	7OYSt8ibG43tndSatssOYiUHzSelF4mPmnqfII+y2rP1Vi6iWFZ3Mp6q6otfBpnPGhMNOsaBC+2
	PpE+DPWJJRXBrKZa4/wfUvXqwJtOdDGCN8MS6/qy5YX4S3q/eLkp3cbPMd+skMWm3+Yi9Ge+AQQ
	SwBTJiwql0oIhl2oPGULeAIVTzgNQxmO1Ox4t3/v5tubFxWQiQisqP563BLbY1Gd3LT1fFi2rox
	se7bHfyyETEs6HN091QdFd4JuaS3SiUI+H7RNFawk6yKf6B
X-Received: by 2002:a05:600c:3b0e:b0:496:c361:fb96 with SMTP id 5b1f17b1804b1-4997a578481mr2356495e9.0.1786454203704;
        Tue, 11 Aug 2026 06:16:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-499788fd908sm47639145e9.13.2026.08.11.06.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:16:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] arm64: dts: airoha: en7581: Enable spi nand controller for EN7581 EVB
Date: Tue, 11 Aug 2026 15:16:30 +0200
Message-ID: <20260811131634.703225-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lorenzo Bianconi <lorenzo@kernel.org>

Enable spi controller used for snand memory device for EN7581 evaluation
board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index 886e2e4b5f64..3dc68dbf1be7 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -25,6 +25,10 @@ memory@80000000 {
 	};
 };
 
+&snfi {
+	status = "okay";
+};
+
 &spi_nand {
 	partitions {
 		compatible = "fixed-partitions";
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8e..0964cd783013 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -150,7 +150,7 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
-		spi@1fa10000 {
+		snfi: spi@1fa10000 {
 			compatible = "airoha,en7581-snand";
 			reg = <0x0 0x1fa10000 0x0 0x140>,
 			      <0x0 0x1fa11000 0x0 0x160>;
-- 
2.53.0

