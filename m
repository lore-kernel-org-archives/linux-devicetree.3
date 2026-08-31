Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D11408611
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219371; cv=none; b=oljhZdjt9AGq4LV0BHYPZESB2O63+W2I8+QWPBJxkKtavAGbzMAOtsRhZ3bo67MTQdRKVwk+KDRU3ek1bL6xU7ydsOlUWqKPj4huyZCfCWyZP1tvvwJ5m8aWd/TwAd4EKRNovIosI7RrdRzj9GWXYpfB+YewjLbOD2omAdlDUcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219371; c=relaxed/simple;
	bh=G9OBNeNLKj+d4+MpvACIFUsr3cu8iGhmiCN/G4h/vVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YI1B7FmZoJC2AIwxDR+uLLQ9b9/HCqfefc4kj4SNoxFTTLZ3Q/U61LvL/81/vHKgcGvuUK2zQmm9vzlJVVLun2sv6jISPVGG4b7LOouMft9ne8FJY/nEjfLf/iZrWs4PV1sZTv/FQ4pMgY0nZ3pt4UnC0IGKiG4lYAbVR2T68NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hL/Feo+N; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hL/Feo+N"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4030544a91.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219370; x=1788824170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wR8+vVM1L2fpbFVOZYNJRkYYqPhCGHqA1jwt2SE8NKQ=;
        b=hL/Feo+NrsLDxva0v9CWrXa1HyvYxsy2fQ58v895XUMmOTDK4MSMNqxIwPgQQqI9Pu
         2rFDg35ckHJGuRnnr0gsjsxI0cIyvmlmqL/CwDsMFjFtT01mfGxNBUERajNAjWVZS6AK
         qfuVs7URsSgxxE2IMkGCl3h+1w5smQd5upj0FQuE+4yI2bgKgZIAQUNWYoSY1shGU7gt
         MA+QmQ9+niDM5K9D5RfxL/MD4gOTUilNT3OHo5hR/2fiziY50NTs0IQIS86GM4+EjQ+9
         HMjntnFE8AMLcU+fK8o2Fjbl9cuP2Sp/kl+YQXgT2ohhudJ9jfGkBG5XDpl0U9bpB0lr
         E/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219370; x=1788824170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wR8+vVM1L2fpbFVOZYNJRkYYqPhCGHqA1jwt2SE8NKQ=;
        b=sCslv36EGjIUCfSL33/3YOobFq2mED7TjN8yFlLMVnDUXFexYQFQkQ+YCO19d7PhEI
         rvkvg8+k0Po4jh8Cv73B23pHC51Ps1YZnDAlrcDOULrOa7VDGgXpjkrl+EAusqjUPv0J
         d3L1/wendY5qXYUHQeZ+Th9v+Bq5h2C3rJw2wPmnyRtHa5EHMx7Wj0VNN83uMtPvsOVd
         uisUXMk55qE2L70kYu9AQbZ9D40aO3GGqMJSH4NIlM2uzkyAWX0AzWsYsj8oMoxxFApc
         KnmnQYGdPicAdgEEVbfgBMLaMRwR4Nu7JUwoZYiv8zZcKPAsC5W7dSW1QExy+BRSFXmL
         ufHg==
X-Gm-Message-State: AFuF++kZ0EnuuijBsjuOC1W15p5pO8vukcr0NHw1/PL4UV146WCepRFA
	+VD1ukgB/zko/ClUyPo75V4LUzNid2pyP55gxSD8PyF/b9mpPSVKQ0efe9gTOw==
X-Gm-Gg: AYBFou3PusbJMLJvEF7/+0bh8sD7cV30lty0uGZGgbIs9I/HXdWJU7H9bSb+ZoVoeRT
	koUHTv7CD3cRHE3T6YUzgb/2eisEKVrfL744KShSwPG5tkypyWJHGugoeG3qXfdLbrK4LF5s1QQ
	XSfc2upQRQdI9F+es/yHEqM9v2p2KLXLQSMUX8AvyafKOiiPJJfDBviaE6Hmcp9uvoE5obAeHrc
	tJTPAzxm+7z1i6VxTSQlnbNtHTb3/+ZQaRy/K3Q3Bv0oYq1cc1jpDthORNzRCcjhOiu/SO0kt1C
	Cvj5rvavkajjpcKaL+6LBe3KTH8rgKGu+xEXCQjQDE2ttEISLl1LqLndusz6W8BwN9+0kpntmdX
	dxyOvygwM1AmkTNN09NvwBzlPIhrZ+ejTmLlZPHbt9d8+hKg4wMym3X9wGCPfeSral9ds2mJwsD
	Mhv7fjsTqBlgszOyBcKtSqmMnmJpEDzuYZFd3s2PSYfTtaGukHeVI/v0xkpNS2Sf1mZS0e60FbN
	7e2QA53SInwwdery0lAgERF9to221wsUBDc7xdD43QzkUsD/Za3qWcqoVAFMTPsLov5VO2DM5VJ
	3B09pNIZfVLNODc9VLAO/+TygPu7DTl7P49AjkxvZf0plM9I
X-Received: by 2002:a17:90b:54c5:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-396d0e5ccc7mr47398358a91.3.1788219369668;
        Mon, 31 Aug 2026 16:36:09 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4a1732sm1992599a91.7.2026.08.31.16.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:36:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: use national,lm75 compatible
Date: Mon, 31 Aug 2026 16:36:07 -0700
Message-ID: <20260831233607.13729-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The temp@4c node uses "ti,lm75", which no binding covers and which
dtbs_check rejects:

  temp@4c: failed to match any schema with compatible: ['ti,lm75']

The LM75 was originally a National Semiconductor part (now owned by
TI) and the lm75 driver binds it via the matching "national,lm75"
entry. Use the documented compatible; no functional change. The i2c name
fallback ends up binding it.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 548fb92ca811..39b2d4fa742c 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -200,7 +200,7 @@ usb3-ilimit-hog {
 				};
 
 				temp_sensor: temp@4c {
-					compatible = "ti,lm75";
+					compatible = "national,lm75";
 					reg = <0x4c>;
 					vs-supply = <&reg_3p3v>;
 				};
-- 
2.55.0

