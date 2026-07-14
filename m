Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F3B3DB31B
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010525; cv=none; b=rZhqL35sjPtUSBFzRs6oLnxrdtd8iCpzfjuFO4kVPtzVP6xyfm6ArGbgJtNUJ1BQs1fiq9sSzWbRIuD7y1j1yyOE4oG0CdbSwhv4KmNbL4xiEM5u+G/Y1qdDp7pNpYQRdtECo9ArvRys4F3/g6DQUdP7cu4RTIiaUmToymd50dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010525; c=relaxed/simple;
	bh=S7RyjJPJgk8bM8bSvDin/ELs3Q0NaOfmTEAFhGjIglA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLmJ0sXfsZxeHunLEE0h0jlBFZpAXeCRurztaaYx3FKRKTUYpBV6meUQL0v65huMy9/KsFZvDkWxVi02QaOEPaXk9Q+eh0iIcENO7TbocIU/1OtbKrWVCzwbJPtOo4+Okh2s+8uSpPvxOi0ZArW1goYK9Wh0fgvBvsajEjv5bcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBsQa5c2; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBsQa5c2"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so666559a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010523; x=1784615323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=;
        b=YBsQa5c2NOJtCeNHYSh4qtiy42/y64Ij8uGW/ixQaH6uT3zdRv6RSqT+uksaM2UTtX
         8GiBsI5hkDgac+d+PgZyNAnszJVs7CcvA9rB4VWx+U0x6dGOapin8cyqB+VxAsBCC5oq
         /sc14cg2RNWmAeBeWbnF4Cv/T3JcGPv63Px0vtmwy/zKkEdbUIWZ3j/5jX9EzEQfrvWM
         x7adFzrsHmlgpwGaxi2f9cL5UUKbwPgkwGtv77H3+RzAIZpzLfz45SArpB9fwdqujAfq
         9cIFnZpavwp+tDd/RmCUBJ/75HNtDw/G0ADYxVStNyyYAiR8B6q78T53hjUE2fkaQ12y
         9GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010523; x=1784615323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=;
        b=Vr14MutY4zlprKrIc9tZUqs/ASPLgBuVjdDj46UkbloiiaPGR1tS9gqUYOqvs7TCij
         CA5zjhJOx/d5lzaXGIgy1wTnbgDwdMTvjEIRdid8x+5lwylOQR/LvMSLoRK50N6iZPyJ
         XJrOqeceYHcXuHpNNkuk7H9NtHcj0/RsW3H/R8aaK9qAOSZozx0+sxXBfaUzg05q82Gt
         QhmuRu9Wer0twa1N5x/EtapL06dtwMVBNCe09gjMlv6IxGrgrFhtJOaxw3q9w8LislQv
         0qfVJ7RO0ZKBpcLJqEmadhvZd+Ro6Xt9WT+f7sQYUfjZRMs6kPIfc6zlO8if/rYqBBDp
         omvw==
X-Forwarded-Encrypted: i=1; AHgh+Rqs1JvLN1x7lMilua9XXEtH387GjwmiB+wdhZmkPkewQrVTtZdo791UzmaVoi8D88OT116sbGf2zhMN@vger.kernel.org
X-Gm-Message-State: AOJu0YxztjG5aMf963tqZTPdsLb8t0r+fpZvGOaXkRPhe9i5Ze1KswHN
	8eUf/MgK+oeWkOi2RZjfkQNkA9y461U1BxCWALtSg9kptJh2nJu92D6F3R/g/A==
X-Gm-Gg: AfdE7clu+7bXGFPEOStzzgiZYx7Lv1emo/hbyCYpH95eUlbtpXlQtpZLkZd2jzHUnId
	xMkOGMAw/rOaqrsut/RfXYrj1df/04trT4aHAxJQL0o1g+nZ0m+jXLpa1vOTWoJvsnWc7/IikSq
	MEMvvnARm7YLol620Owh9hMAjfTJtAAgzjD/z0RbbfNqToXq10LBB6AIsiShgW9gmpccaOfPWsI
	g1FIA3Gxd4JC2z/tTifmsOK0OFMJhTWDVZ2r/RRRZDcl5UCbLCStwLpX29ouZXv0SKvRv8vEVK4
	m/iampPlnFnPkIt2207gOZQwXCX2sDPC64TjddWZyZt45Ui8LWl5woLZ1ItNMPJC8dZbxKZQm48
	0K+nkxBODvWAYxZoUeQQ7OSYpPJkD9xP39BW+Qx4cTyrLAjgC7MziBJoJ3zPSvBUErAyXtwuRNL
	L3nG13odyLN0q7zddpgGjTi5MS5h9HBKHQm+88Vu05ygs1akbG6gHD/1+X1rq207lcy7hlz9m2l
	WmCJZnqzuCWB/Tq4H9ujm9GTTXLrMCcQghevET58s/aEmuLYMEX+Sg6PjTAbCk9
X-Received: by 2002:a17:90b:3e44:b0:38e:21da:9257 with SMTP id 98e67ed59e1d1-38e21da9302mr1670a91.37.1784010523324;
        Mon, 13 Jul 2026 23:28:43 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:43 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:12 +1000
Subject: [PATCH v2 05/12] arm64: dts: apple: Add common SMC hwmon
 infrastructure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-5-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5127;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=S7RyjJPJgk8bM8bSvDin/ELs3Q0NaOfmTEAFhGjIglA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xka6jk+65YWZOUf4s7+HZpuvFN036yOdsHm5IUWS
 W9D553tmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPWxJoZ/minvdaRu3zLs22cnV8L7I4LpiP6550ad2eafcw+pxixMZvgrFRk65dW
 D7+YBO3OeK8g/snqz4ciGi/I5F4MP/pzaoPSXEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple's System Management Controller exposes the readings
from numerous sensors scattered around the SoC and elsewhere
in the machine. Some of these sensors are reliably common
on all devices, whereas others are exposed at SMC keys
specific to either the SoC or even the particular device.

To account for this and expose the right sensors for the
right device without tedious Devicetree duplication, we
can include fragments of increasing specificity in the
per-device .dts files such that the individual keys
(of which there are potentially hundreds) do not need to
be copied in for every device.

Add the initial set of SMC hwmon sensors that are common
to multiple devices so that they can be included in
the per-device Devicetrees.

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/hwmon-common.dtsi   | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi      | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi   | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-mini.dtsi     | 16 ++++++++++++++++
 5 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 000000000000..a35c7b14fec8
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors expected on all systems
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PSTR {
+		apple,key-id = "PSTR";
+		label = "Total System Power";
+	};
+
+	power-PDTR {
+		apple,key-id = "PDTR";
+		label = "AC Input Power";
+	};
+
+	power-PMVR {
+		apple,key-id = "PMVR";
+		label = "3.8 V Rail Power";
+	};
+
+	temperature-TH0x {
+		apple,key-id = "TH0x";
+		label = "NAND Flash Temperature";
+	};
+
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "AC Input Voltage";
+	};
+
+	current-ID0R {
+		apple,key-id = "ID0R";
+		label = "AC Input Current";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 000000000000..e87997d21e22
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright The Asahi Linux Contributors
+ *
+ * Fan hwmon sensors for machines with 2 fan.
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	fan-F0Ac {
+		label = "Fan 1";
+	};
+
+	fan-F1Ac {
+		apple,key-id = "F1Ac";
+		label = "Fan 2";
+		apple,fan-minimum = "F1Mn";
+		apple,fan-maximum = "F1Mx";
+		apple,fan-target = "F1Tg";
+		apple,fan-mode = "F1Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 000000000000..180eb8d7441f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright The Asahi Linux Contributors
+ *
+ * Fan hwmon sensors for machines with a single fan.
+ */
+
+&smc_hwmon {
+	fan-F0Ac {
+		apple,key-id = "F0Ac";
+		label = "Fan";
+		apple,fan-minimum = "F0Mn";
+		apple,fan-maximum = "F0Mx";
+		apple,fan-target = "F0Tg";
+		apple,fan-mode = "F0Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 000000000000..cadffd000c76
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors expected on all laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PHPC {
+		apple,key-id = "PHPC";
+		label = "Heatpipe Power";
+	};
+
+	temperature-TB0T {
+		apple,key-id = "TB0T";
+		label = "Battery Hotspot";
+	};
+
+	temperature-TCHP {
+		apple,key-id = "TCHP";
+		label = "Charge Regulator Temp";
+	};
+
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temp";
+	};
+
+	voltage-SBAV {
+		apple,key-id = "SBAV";
+		label = "Battery Voltage";
+	};
+
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "Charger Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
new file mode 100644
index 000000000000..7fd86e911acf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors common to the Mac mini desktop
+ * models, but not the Studio or Pro.
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temp";
+	};
+};

-- 
2.55.0

