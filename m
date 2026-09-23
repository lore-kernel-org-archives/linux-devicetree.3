Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BDB45C70B
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161084; cv=none; b=tA9+1HnWr5G5eVbHF2aO+rdXUGJNId/DwY7+2WNtOxZjMatjJ2bITALijsXB4M6KfMInGFMle0Mtkw0D9qZQv1tlSUNS2AbDpelJQ/vI/U+EORekHWCo70RkcVC9zMcw3iHaHRzT7r1y8YcTiPKLYypZNRRE/OoWl/PWmO9GFdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161084; c=relaxed/simple;
	bh=f74eJB9/Nuxhr40IU0wotj41meeuQyj2wg3FsczjbNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kFuxUDmcuaWvfs4tr6TYYmecwusThHEL5LVpK8v83VuAGgBvy+FnAqiQPJlu/4xrOKgd6mlthCJTVlJrbdbv6pBzxcDsqTPj4LeLZIc5s/uxCAyIY/j+Nz6BkCjYZ9ENbNVJ/x/OxgkGDVMcim7DgMy7dQbo/v0rVhcYIYnU/Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0KymCvM; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0KymCvM"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff00b8d8so6322271fa.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161076; x=1790765876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wU3cdglOMO4fNUbFU6VE7Bg9T8/+Nhjntbc1rLwcCxk=;
        b=G0KymCvMjOmemWwdZ+w11iZlfUa3KrxUzJO6fPuHYv4qJFohE8rLhCI+XRWuRyTpYE
         sRhLRdKXd7g49xqAkaJ7DVgSby3PEDqiPgAyFDTUxhUU0HlEM6YCUxuBe/11k1FEqDqN
         3rmEEviXYp5C+1/F3N7vDP2JIQvOfPJPDosqz1tpoQShQ7TYpt2QfmP1yv4B6Ijrzj85
         zlddjVjZxNDgBwqv4FErvaZwMx03XbmockfWcBzBEicMmX+zzTGppwh0daB9KvJYak8+
         1shwO/VHgjDrKoBetfrJ6hqwyj9nj5CfXe8OhpfxiFwJ97rfkLN7y8WgSkCB3O4X/auU
         VUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161076; x=1790765876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wU3cdglOMO4fNUbFU6VE7Bg9T8/+Nhjntbc1rLwcCxk=;
        b=kfuovuRei43sb+CL05lJA2azrXE1hrPLKoU/XkvQyk+HFTcGKoW2kos5xmUDo656SR
         gIIg97gEA4CKyJ9x97h7oz0agFZrf9GC+6E5B/lbpmCVtCJUVSbRLtMQDfu2DUJJIUyD
         QV2oYxT05toqBva7SPdHWR4X9wcFi5h56WiBjz/oVA9WoyIewBTz1MshmTsaMw+7WOp5
         1OWGiAJ4I+5iDQ450qWxHJSeBaetjH2QuDO4TZQJXfTAR7NWoz6a5zLkjbYjHI39Z0qp
         Z4uODZ2C3jCjBVK5XPrRcNKcUCKeNgy1MmFwonbkqHEqkln9dzsyoH4wJFGKlEWY9oxr
         1j8g==
X-Forwarded-Encrypted: i=1; AKwUvBxIQAl7HE7W4EFFl+kECA+1h/GZQIzXQ3tWhoEjPRFvOCGH9zSzzW57tTlqsi9T2P4Maxrc9jwnV2Eo@vger.kernel.org
X-Gm-Message-State: AFuF++nI+/bGIeL+e3dJbzLigVATbfLUNyH9LPVF40i03J9OyIG2/y8N
	fp5BkYDQpwDsyaRTj4CtGvvkjzysnBUEFjmo/A5sxM6QvKxrYuqaxxMN
X-Gm-Gg: AYBFou0GWxCF11F+jt4DWs2jWCnqzNMGPlyBMO4gsYLxYp7XVXb4cD3CiU7rXgoThYB
	UyOc5Gj/e62eZr5zI+xEWsrTC5a7ur+RChXbJ4aB9lwXB35Nh5oCIWcJyIpeCwJCro5BP7khPUs
	sAUpbHexEZzY52OGmsL9MjWYc3Zyt/3eAxEbHedEOZD41A5Ewspk7Ys4kmS+Fmizx7Cn2AMxr0A
	b7Ur826tA5ZnpPabLfoH6LyC7vW1Mq/ijYb0jGEdA2iOB/WwFGbE86IgpmL8oEETZ4ABmiyr+3S
	6ob4Sk4Z8IapUCL7pogx0r1zCdng4dQpo3+WewFvU0pwB/8s2MNrOvcTojmQxuIIP8ArI/y2nCr
	gyhahkB5WtF76116xQp41SuCeCWg2/ZsMDeXU4jiuP8Sn+HckdmojEJFNdrzs75HLrEpphGoO9C
	iNoP2LpQi1mIpPvW3xc19G2oaGiIGShv1zeLqPGP8VOiLEcUescm95QZZCF9ayJGepHDEDoUHlS
	ZLnHhLale7OCKydqIGMP7M55gDHEA==
X-Received: by 2002:a2e:be9f:0:b0:3a3:368:fb9f with SMTP id 38308e7fff4ca-3a63069666bmr5961811fa.13.1790161075789;
        Wed, 23 Sep 2026 03:57:55 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857873asm506392e87.17.2026.09.23.03.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:57:55 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir <anykey196@gmail.com>
Subject: [PATCH 2/3] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion buttons and IR
Date: Wed, 23 Sep 2026 15:57:50 +0500
Message-ID: <20260923105751.435-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The optional 24-pin expansion board exposes two LRADC buttons and an IR
receiver. KEY1/KEY2 are on LRADC channel 0 (measured ~1.0 V / ~1.6 V) and are
wired to KEY_1 / KEY_ENTER; the IR receiver is on the SoC ir controller (PH10).

Tested on: OrangePi Zero 2W (Allwinner H618).

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 .../allwinner/sun50i-h618-orangepi-zero2w.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index ff9b40352..1b690e3cd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 / {
@@ -189,3 +190,31 @@ &usbphy {
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
2.53.0

