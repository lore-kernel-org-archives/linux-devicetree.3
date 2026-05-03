Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54243AE709
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 08:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777797342; cv=none; b=H+En1t3gshpOoX44IRWRWElhYVxr920bjtdScc9vOeJUdimlLFLd1b7IYMSy0L1PF5f9aUKSWeMm4e2TqYt8pZw0sDxRaDqP0ZOV0FSJGo0QTYkA5JdV9ZROTG9s5gcR8NCPmZKaR7F5erKS1FUZFKeZ49uUSkNmHSb1kbDYgNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777797342; c=relaxed/simple;
	bh=ER0AC/Xnj+ibEkD0vpGT/fnWFxVKVDSlU3bLlFczBTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lp1AEzXgVXDGQrdTeIosAG8uDTmvo8J8iBGqIHlPQOF+hQSptsp7FRHwRI+mF0gx5TetO6ofXGVZWvCBHFiqIkpRXIS9DyynNIFiK4AMgg/3zcO/irzZOqZzmGTNRIkegQxKFXt0HzaIImuRsFydYH3OAXx+sdJ62R7OuO7W+5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c557duyU; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c557duyU"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso2368582b3a.2
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 01:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777797340; x=1778402140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=;
        b=c557duyUE3KM8aRDLMOnfvDKZnxBC6cIPOAch9v+W2os7tDz+Ut7OYp3NVNTmyfbeP
         oS9HnfsXwxvfKOE0A5OgF3Yg71iixjyWms809NhP8Z5u9erIQ8u/fHAm8NBpe7FQ001S
         Y4BI+I7+QGqdeC99of6LfXOqJmLVbkUgPrZC3hF5UHG08hL4gJ8f7X428Nt0xlKDIRgc
         HUF2DfS3nPCdgbv+i+yFBc+gkg5o5e+Gmb00aennBreDcaqMn/GCOhmqG1uhpIpz+xdE
         XWMT9kvSrjVMtPQ/tXvpH2dPCfwiIAuh9gklNQl0iNA6sOWS5r2nO4TmWZLELYsq1i6d
         3lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777797340; x=1778402140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=;
        b=qgm39MCZlaYix8NEDbPg9mAGNaHO2hQbYGFAHjmZM/2lOPoCxddkC3pH9wMAaYl/D+
         GRWDhG3DrMQlQXj+kVsVGSSRp8qqN/Uh/9zLPV6LoKLBvB9tjB/ABCVhDmskBUfkLPis
         Ogqcl+vFloZGBDInd3iRuMVL1x1g9WrKcnx6DjhGj9p7Ryy3JZjvTxE6OYNbUmGKrV9V
         UYl6J5Abn48dyYrNi9THeM3mOn49BAM8l4L3foagZoNPGePTEja619YfUUhLoaOItNJ3
         KrFZR2SoHU8xp2pr2rb3SQSV7tZ5XeAwfEWAJdyNnoEWnwZToPGBWL0AN47/Bp1NFFP4
         enyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AWpdlrYXJRQYdw59W8BDjXHMnFFfAuqqOf1b15e43w03+Z20zT7E19xO6ATcuuAju1uCwwZvihi2G@vger.kernel.org
X-Gm-Message-State: AOJu0YycRPiADg/e98140Omkl+OdjhHYB1N5B+je0MuBmcuusC1caXxl
	gI4iy3DCosd3fZpJfJ4z/REFiFKv3dJhi0O1ZLuVKNp9MgeORcUTSfss
X-Gm-Gg: AeBDietx7/lLAnKbQ/VrueJAU0O9VBA1SsxmrdMDFaz6q7Y0qSRu+IUtTujmfyNFcGt
	0G07qo6jFU3QQDMsLELZhYfLvuGwIp82IyfygSqeZw/xu9midSmECGYz0vFezm0kWXFwHtaeg5a
	Ndvk9ybi6cna6Luib7pUZvFcYGZv65ph4z8atpIKenqdQEP+AC2YQpn8LGBN78D/kamjWv/2aw5
	E/pxq/QrgdkjE7yZBtIKm+5rct9GgomRrdrB5E8SWa8OdrwKCSsBUIh+fgdwD9UyQwLKA6t9RwD
	gmu1SC7q4Pkj+w5cZvClvFavlBd2pBewlP+eLEHamthIbMuJS8Ev6CjqXkXSuXd0Tn68mPhS52U
	Y8i56tZHGYUmSZR3bsxFu7WvAtWrVxjOst1YHbTYBGFFfTrkaJcvgerFVOXXexxzuOzyMnaffJ6
	9mmUjwBRzXziowjgmD+noZ9J0QUkgHsElpBp21kSliQvfkH0OdI8ge308=
X-Received: by 2002:a05:6a00:14ca:b0:82f:721f:10ea with SMTP id d2e1a72fcca58-8352d1bf331mr5683330b3a.18.1777797340207;
        Sun, 03 May 2026 01:35:40 -0700 (PDT)
Received: from Black-Pearl.localdomain ([60.243.224.75])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-835446b1b0asm1578142b3a.8.2026.05.03.01.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 01:35:39 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 03 May 2026 08:35:29 +0000
Subject: [PATCH v2 1/2] arm: dts: st: align node patterns with established
 convention
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-st-mmc-v2-1-11ae3216d2ce@gmail.com>
References: <20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com>
In-Reply-To: <20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2

Update ST MMC DTS node patterns to match established convention.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/st/stih407-family.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 3e6a0542e3ae..08acba209c56 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -596,7 +596,7 @@ spi@9542000 {
 			status = "disabled";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09060000 0x7ff>, <0x9061008 0x20>;
@@ -611,7 +611,7 @@ mmc0: sdhci@9060000 {
 			bus-width = <8>;
 		};
 
-		mmc1: sdhci@9080000 {
+		mmc1: mmc@9080000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09080000 0x7ff>;

-- 
2.54.0

