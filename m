Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2C63B2FFD
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859800; cv=none; b=DWzNrSIu7scPcjGnxHThQnk4Mo6KsBmDJf5azKOkznMRj6yeJLD/mCWOLsF9vOJhGZke7+0UU6A7oJM+YIYPu2huH58BygdEF8t+arocOnWWyoc5xjjCs7HIc3QsG0qgvuIJbfYuzNz2zgxFIX9M+7L7v4c/00u4N6C4KUM5YRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859800; c=relaxed/simple;
	bh=ferQ/I0Y9PK2QH16FMGnGF2+/wylIAM94hfiAZxJn5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQFhyr8eYrzegNTbcDkh2yYsuimxl6iraAWeuKJfrHftZ1c2HSbomfffZinJhxXNzMWXLadDrjIZ/2bLEL/Fw54GR6gXb2o+DU3L0FWtFcMX7YARx5PvP272UHtVPKt0IqJChOIYUk+MBBfnkmuONeHZqTEVAlNIWahifl1PpDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOBYvrff; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOBYvrff"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d02a71526so165472f8f.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859794; x=1775464594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=sOBYvrffy2quhHrgmrX4S3D/PvEsXUo8xNIRXw+Aj86DYHf2h9JTjgOKT5kb0wqiSy
         eTHeH43yjOuIUqTm6BrDXqf6Ijy7Qtq9CvH6WxvOfoxBc15VA/Qm8r9uCMbPGDmn9RVu
         g7Jup+tI8g0Kw7mMEJ6tygU9FAwJtOPsF9LwS4e5UL0S6FySGV7lV2wmBHfw7Gzfpqzf
         M2ubKh84t+++qOAzWWjOUNTqpSwujRko7UN0+6yAPMe4qqEfHG/PW6gUwmGvS1eNrWIr
         X6wOrX129451gISarVPylOe89PJ01C/hYhV7yHP3LyR0UeWva0splGXJHiTJwjTx2sWb
         nZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859794; x=1775464594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=r8oVe9Aa6fFRelZB4Fg0RxUpeX1/4uJD47tr/zP3W5JW8ZX1EVNcKQFaKD+t2xVpK3
         zdDJT4UuJDknw9Lwo7zdvO3O5++/BZP2uiqenG+/8hPQn7J4o7vjt14N1HDvItCTQmBy
         zMsmP2DP76OS+DUtOWW4lVzxJwKn4jLARS6hdQ8n4VCXjYk+A2chMPbrXo+03Bn2K63r
         c+2msp/iurRl742e+6WJ4EZMiENLye+2+S3MuYBj26tAKUt+WakhyKsxEIe6wJCnJweN
         HXrN11wbJ5P0WAKq/TksxjA/8jdiZ6qYrVfLT/RJJr/Ltp97s1WX//qgjkB3Ssih1PtO
         I36g==
X-Forwarded-Encrypted: i=1; AJvYcCWBwFw8kgT/rYwHTJNE30TjgDfWPvsc66IvqWciglAGHqctK1BDJ5jA5pKjn+LNaDino09vDSiu43J5@vger.kernel.org
X-Gm-Message-State: AOJu0YwXgh6qbkSsDBy0TmWRcAcRsUcmluBiTobEcpccf1xTn7KxGlU4
	TCerqox8703thk7JQgNpWGWTiDdqzNl4gkSrt/pJ8Q3djqlqRpGTkS3y
X-Gm-Gg: ATEYQzyxcDOnNAwwV5aoX5nDMRSuo65+UFfF4tk/ix7IgB58yBAWJt2XmdFQuVe47qA
	dgrPMdNqmgoCJrfkDZ4olfifCVwF46A526H2NGZKxEb3B0JblWQly+rQ9D4zr7YPuI11fCyQmrt
	u6XlHTgyVIk1Fc1N7M6fogkfyGrkWgsHQJPJc1jT6jW9sII/SoBjuQKyX23ItPOm8MyISJkZwF8
	5G7Pi6dRAtEMNf2un1xTX6XGUUb+67GswI51xn6lmDkdQq+Qm3uZRhlpktT8hfqNBuLBWJsIRuf
	8xg5tSCae5bFJku/dOk14rOPWN9M5fNiK1T9HwFqrMiJrUV/UZP+ndKegeHhl5bLiqOSYCIgp6g
	T71he2CrTSm/cDc9Vkwc3762Kcf+q+pqlOsP4LIKvJHjhr8+rwEtgHZigF3yMsUaiOJhVECii8x
	5qJv1viXZMoBZtjnMaB1VW5VXeEKb2tw==
X-Received: by 2002:a05:600c:6386:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-48727ee5720mr183078015e9.1.1774859794164;
        Mon, 30 Mar 2026 01:36:34 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:36:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Mon, 30 Mar 2026 09:29:43 +0100
Message-ID: <20260330083429.359819-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 73 ++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..750ee9b2856f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		pio6392: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		rtc {
+			compatible = "mediatek,mt6392-rtc",
+				"mediatek,mt6323-rtc";
+		};
+
+		mt6392regulators: regulators {
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore { };
+			mt6392_vproc_reg: vproc { };
+			mt6392_vsys_reg: vsys { };
+			mt6392_vaud28_reg: vaud28 { };
+			mt6392_vxo22_reg: vxo22 { };
+			mt6392_vaud22_reg: vaud22 { };
+			mt6392_vadc18_reg: vadc18 { };
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 { };
+			mt6392_vio28_reg: vio28 { };
+			mt6392_vusb_reg: vusb { };
+			mt6392_vmc_reg: vmc { };
+			mt6392_vmch_reg: vmch { };
+			mt6392_vemc3v3_reg: vemc3v3 { };
+			mt6392_vcamaf_reg: vcamaf { };
+			mt6392_vgp1_reg: vgp1 { };
+			mt6392_vgp2_reg: vgp2 { };
+			mt6392_vefuse_reg: vefuse { };
+			mt6392_vm25_reg: vm25 { };
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm { };
+			mt6392_vio18_reg: vio18 { };
+			mt6392_vcn18_reg: vcn18 { };
+			mt6392_vcamd_reg: vcamd { };
+			mt6392_vcamio_reg: vcamio { };
+			mt6392_vrtc_reg: vrtc {	};
+		};
+	};
+};
-- 
2.43.0

