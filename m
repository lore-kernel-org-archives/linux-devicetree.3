Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FE032D0FC
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 21:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785016648; cv=none; b=TPCx6eChmBYtEdBeQi8z6+oFO1vL/0eCzYOcz0HcXOK6193a1cq1OlDQUUURs/VlbtR+DqKwMdmkUJojr+1dgUJxwvfgmYTX3IP7u62y5AE9TZpRyiqYkXeSZSpGXk1t89AVPYOnnOr2NoxDF9XBH8dfk6N/MH7aVvcs7qZijhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785016648; c=relaxed/simple;
	bh=TVxHPjq53tofgmS1gszzoWKBF93eb8+ysVS+NZQtRvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W/Zrf1QWDj960tzyxgfKThv3p196yAFNWfmadPCG8OSGVrCbzx1t+lyZlHHaX/v30JIa6ZogAfZMQjgZrP6K5Xqtbzq9r/3J8I7rGgF3EC2/ekPa38UtE1//bAmY2+NWdNPm+I4Yu/cCXxmdAgRHEEhwmVl5VXF6ClZaSLBCRk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzbYUoU2; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzbYUoU2"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84e507b079dso765871b3a.0
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785016646; x=1785621446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tWxVEjNz8W1QtsXPhyFLrXWEYYl+6GsNRRe6Xr3SuC0=;
        b=RzbYUoU2DsV7RHZfPcxIhbYZ9Eypczw2c/dxhgPJ2g1IkBc/Dl6QDuZ38uyPnjl21Y
         hdJBpzGmPubtvxWqkMj2O3PWaLus2HMnIY0XH7RVqabEtc7S3gVNg5vD9CY8BuFT1od8
         nOg6evz2x90yckZG/xjdv0PUc82edkRgNYyEeea7UgIohyxNB1fvTFiUz5ul7aqB1Pih
         qkTaCUsd3B8h6IYYE0Q0Ii4b5DxUJ2I0sZc3VEyQIRA8ZkBrViXjSTOffe0AO0RVE80g
         ZE1KNKsBX5QvXozA/EKznh717qyXr4Yu9xOyPV0kZTc6JuPmjxP4fyNvKgOY41VjKI09
         p3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785016646; x=1785621446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWxVEjNz8W1QtsXPhyFLrXWEYYl+6GsNRRe6Xr3SuC0=;
        b=EtkIeMnX4m3AhNLFx0/VRvzCAboDpjUaAuNaUmqgTpsqjQRjI8Pk32LNIZrwJpj3+7
         6To21XYZzDgVL/V4waqhOl+TqtStx6yV/M45unKKreemA+z9lZC06KIoj5skFecyB95S
         bF0pehxvzNbmOt3X/yPnXpL4PI/FJxpQW+A6rKg3qnj2vznYC1vNjKzvy/rcYZe3CwUl
         SJ3JG1JHZk43c8R8Cfe29/l+EOIr6cEjQFv1vgNGV8qwuQ3RKUR8uELViz/QAi++5oIA
         z73sZjn6V2pJ+PPwqMAPwCgnIwBXT0+vyiO82vP2Dhul2m4VVIUQsbqiYKCt8ujBqUKu
         eYcg==
X-Gm-Message-State: AOJu0YxffoRKB0e684jUm4EPzemUI+icQ98oA8Etqq6mNK6peQJ8ATPY
	eHye5YXzumMwGkD2jlttghvNNvA5Q1KLKVLm3EDZK8DxTtONedCx3P6JysN+ZA==
X-Gm-Gg: AR+sD12bXMdQ3oWLPUI4A7WMhZ4Y8TNvpdxV0oOiiBjuTCKxHzLCbDtAEPF+Yk+Z3up
	w+nxv0yfK1i38WmNcJqzogpBjju+gT3D4VvqlrZrqKM0vxcbWxgURbF7LJAhzROf/DTig0cPbTQ
	WnacLU3ElfMxD69IhnMkCg2NWh0PI7Xsn+tz6fKjrg15nJXLBMrmy2Sua8BWZr+9EkgFeotwH7m
	54tFk+Fe4yg/UUfGT4f2/S9OAf7W1HwRFgGUvdjrRS+s9Yp+BEeU+HIj7ScovnrvVY2KZuV9iGi
	UhrDlrzeixE1NofHdeC+yNmlOflECTy5+GneTkHmjKJ6k+bV66/aPv3j5fUQUCrF4E0tWVIs1Xo
	Yl/rfrwiYrGvTqEnmkRwOQjs90dHZvvpedZWegOnDht9ToEQxKFXpHSfkCvhrKZ6lN91z5anuFA
	iYExSL01UVp9r3sTApVDgQQpzLAYUrn5t/lpR8D5E9JlFX1ScGnQPCPRObDpVc19uQI2vleHm7Y
	dUEID7KvWijsjpH7MLL4BTwMTULLG7bqOlllUupZEjcpXHZ6DA7OiI=
X-Received: by 2002:a05:6a00:99a:b0:84e:223b:98c2 with SMTP id d2e1a72fcca58-84e595f20b5mr2442186b3a.77.1785016646058;
        Sat, 25 Jul 2026 14:57:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e532acee2sm1322290b3a.27.2026.07.25.14.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 14:57:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
Date: Sat, 25 Jul 2026 14:57:22 -0700
Message-ID: <20260725215722.9323-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCIe controller 2 has interrupts 0-4 mapping to GIC SPI 138-142. The
mapping for interrupt 1 was incorrectly set to 138 due to a copy-paste
error. Fix it to 139.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
index 392a25713669..bd52de0faa3e 100644
--- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
@@ -141,7 +141,7 @@ axi@18000000 {
 
 			/* PCIe Controller 2 */
 			<0x00014000 0 &gic GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00014000 1 &gic GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00014000 1 &gic GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
 			<0x00014000 2 &gic GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
 			<0x00014000 3 &gic GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
 			<0x00014000 4 &gic GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.55.0

