Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA142496D24
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160766; cv=none; b=OYgvMkDVYDvINNpPSgxcdTnH+HA3a+Nn8uvps0ZiUQPqdq3gBRiTkH+vYvZplRw0pz87zVvNrtcQYMQJTJpQM7qaqh3sIjWqqj7cTJH04w8YXr2rP/r8fGRnctYznbGmwOV+Hj3oIyXLSQuHbAU6ooWPRYl/0u2T/0JKpziIr/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160766; c=relaxed/simple;
	bh=OYgwkeWjfaPzXeZYfd3LbE9wNpgo6gIQfwCz7/uINqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Az5lyJhb9eSvffVa6U3oJ0ghGPKh7tGNt2+f8Ilpo2V05FYAjfD5wiVaz+AYLISpTsYlJAQW+nMDnJepZ/uiGCKTu/t3XKoc8mwLNTXsx7SdXx/tvWcalXone/LiWDjOs9SsYINrX0BMcDWteJErASPX1q1iQcGW3z7esYfSom4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3FRo4wy; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3FRo4wy"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so641797e87.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160734; x=1790765534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jd3pD5snZnHs7zfXJzo2aSY9ZvIn735yOScE5LBtrBM=;
        b=n3FRo4wyRzm/wIbYydfCXLwlh3HhFlEZkcWABGqmiKetBDAbUmTqiEd/+LITtGTT99
         KXkakOMw844pkgrQlo2/UfUTpQhiJZUKukxsncoupQMBEasbTgfEPZ6gTJjBuHpBTvT3
         pPh556qAZ5kOb2pWpOLv87IMS5mXoza15DxqHe6xblcxjSLvgX0unO+qKIAwI6SEeuRO
         QMvIocmt1c8fl65oFQLrpNfJCsr4vl1PKUUElKfjxWMhXn80HlHlKS4pW/7AMForjNiY
         B7oFOMomAvOiMMuo1mn/hz5U80ZE/cn3ebwrVAAUaJOzohGxzp3QyY2B6DUMk9eych3u
         DL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160734; x=1790765534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jd3pD5snZnHs7zfXJzo2aSY9ZvIn735yOScE5LBtrBM=;
        b=uy19sIXtzt+0noavic0g1+pU0+HtqPJto642GQ5fl8/v4TPREMpaK3p3YohMT4FCNM
         klw6ECgFWcIOOY9586epQNDTVQTNoI2M5flp5YfQANrm5231g5QYsx4qJTwdM/txrC5g
         yzxK2Rhfo9qfc/ohwhm2a33bA3kA6FpbV6XVxCf22jMToR743KAAvkR6HBqXFEqPI6bi
         Pujh4QSCHU7eROIx5RTOKVL7aBlI8gfUg35tWR4o5Dhi0ZTpdmKJ3N8LsPmo1eDyBf7t
         95i7LYw4V7wbVTjN/R0tXy017CwH1WwtCPb9P6lnUBLG2iFaz2NjRiSsQG90StctaZvo
         NE/g==
X-Forwarded-Encrypted: i=1; AKwUvBysF2iFiiHbJiNW0XR9x/ETntzR70qj34p9V2qzPupg7q7KPEnyWKcUC09KhVLJDdoxm1YpPToXKut4@vger.kernel.org
X-Gm-Message-State: AFuF++mrHSUE4gRSvyEc97qvitBYwjB+1rAO3c8zzRPZCIrbkWjmovii
	kj0AuhNhpveNB65yMX0//cXhS356tnX1kUaM5AOkBeDjqYbAwfziG1TF
X-Gm-Gg: AYBFou0Bz08yC9K35kcNxxWLTy1M8hfRUn0MPTrapBqzwLSi9/GaYZYW67Q/im8Z4di
	u7fpSz3xm5oNzb31PPfXqfxCuIimcxFYJYIRIkRtBBaJGGJxnuHjP99ze0Tcta1IOjeCjq3YKe5
	mIIonYqJOW3NowyoELK1FsxWZ20bEvVj2nuqrqllqivLdeQS7CxEWvxVwkvXjjH/eGMjSUpekDu
	2gE4pU69E6NB0yzdFqIZOjXPMSSF4jJ2EsjV96j3idXlNsUW9Z1BdFq5nmBQ2n10NA497UkCLXk
	Wed9mbTyYGGnrmvA2i4B4I2mAAwnhBHkY7cAY9q2s20NJJbEhfq9sI6YOOzZAK1OtczqvlMutRF
	zSj5zaPUCae+6Ve9KU1pBaWaFOIKh34EtINzfcMYvOQdUk+vrOwa+6eP0X7AY6DDzaaQSiKEliQ
	yDNXkrrJ7EzV26L1WVlqBPPR4GZP6aPv7swT/BmtdL5G0Ab8ogqScgMznnhvT155I8RvLVkLgkg
	N8/6waGXZ4UICg6ItsqzDbDhtDN8SC9Rw9x6C0s
X-Received: by 2002:ac2:5696:0:b0:5b8:bc5e:b583 with SMTP id 2adb3069b0e04-5b8d89c6344mr856658e87.59.1790160733833;
        Wed, 23 Sep 2026 03:52:13 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552dafsm497428e87.7.2026.09.23.03.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:52:13 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladnwx <vladnwx@users.noreply.github.com>
Subject: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion buttons and IR
Date: Wed, 23 Sep 2026 15:52:07 +0500
Message-ID: <20260923105208.198-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladnwx <vladnwx@users.noreply.github.com>

The optional 24-pin expansion board exposes two LRADC buttons and an IR
receiver. KEY1/KEY2 are on LRADC channel 0 (measured ~1.0 V / ~1.6 V) and are
wired to KEY_1 / KEY_ENTER; the IR receiver is on the SoC ir controller (PH10).

Tested on: OrangePi Zero 2W (Allwinner H618).

Signed-off-by: Vladnwx <vladnwx@users.noreply.github.com>
---
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 / {
@@ -189,3 +190,31 @@
 	usb1_vbus-supply = <&reg_vcc5v>;
 	status = "okay";
 };
+
+/*
+ * Buttons and IR receiver on the optional 24-pin expansion board.
+ * KEY1 -> KEY_1, KEY2 -> KEY_ENTER (LRADC channel 0).
+ */
+&lradc {
+	vref-supply = <&reg_vcc3v3>;
+	status = "okay";
+	wakeup-source;
+
+	button-1000 {
+		label = "KEY_1";
+		linux,code = <KEY_1>;
+		channel = <0>;
+		voltage = <1000000>;
+	};
+
+	button-1600 {
+		label = "KEY_ENTER";
+		linux,code = <KEY_ENTER>;
+		channel = <0>;
+		voltage = <1600000>;
+	};
+};
+
+&ir {
+	status = "okay";
+};
-- 
2.45.0
