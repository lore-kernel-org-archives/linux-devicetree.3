Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A993A16AB
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296055; cv=none; b=T5+NEeiVuf3+fubF55OM1RBzAxt8IdYcR5izxnLSMZCQ66KaIv3UAh23lITGeCCtfr7svsqlUYWtdNRvuUWh2sY73pF4Jjuu5KFl7mMvmtD9T0GEY8BGZi2bNgdARNnV3JMI1mEDpYtxSL/zOQ41DFK1woVX4pe3pCrWUMXhRDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296055; c=relaxed/simple;
	bh=CR0Lbo3n/3oeNiXmZXBO+NYu4WLlnQ0plwOZWYPDaYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRQt3YNUmKwby/leTx/dXKF0GknDn/C2mlg1CrcMxuyHg5OOzRDq/6QvxhDUwipf/WrJIYpTD9pUf+r/IqMNOHOIDWz7dLw5oj1fZvv8d7Hla6tfhmRMtrvHW4GncrQybL+Fa7uPaN3Nyl1IDEX65E66k8gxwx2pgYRFaECxKbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FX3X4XwD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FX3X4XwD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4908b92904fso14631565e9.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296053; x=1781900853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uiu84fLHByfY8NkkF/LaIKJoh0XbICVZ1vVfqMiiSs=;
        b=FX3X4XwDidk+/aBHU4zOsuu8EexfnnSbElbBLzbr5DlEHYw8iAEGatYAm1PK+VQov2
         GET0WP1+3RjZN2XqIWln8ct0z1Bh+1oiXP7isYi7mB7+YrNR/D7Z0fk2JJrZf6S6hdj1
         N29LOQmumTxN07mnPsukXeTdFt5XAZ5uUVM4MYWlx3Mh9jHhxvbyRMLURbjcrhhJrxf6
         mfuU4VQL1RA1rr+y7FhOzn/6bg7yMWnacPLhDS3+Yhj+IITX60JG/oXRykNbQ8bkp8FX
         vLFepW0ZrjEx6o/zMWcz0VGyTM7LD8Pg81Hi8Enbnf/majjfw18Yt7z+wlEdlnGoU1qD
         6eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296053; x=1781900853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2uiu84fLHByfY8NkkF/LaIKJoh0XbICVZ1vVfqMiiSs=;
        b=cVFbfoiuY4KdZO7gLh+5As8cICVDmaqjLDD6VOX02/CQd8zxGyfe5uXNQr1JT9nMMb
         RaKcngcVdhijATKCY4dc7YHNlz89rxIF9N/XLWD+CuJAffy+zDRdGqu7bXoos07euEzJ
         yltVyPhzsShMAlNCeqGR61wipq1XfWqw0tNMdRtRCmDYTGI5JgxS9c8WkmL1/5HHpP/d
         WrvvvLjVYZV4hkg20YRyb4Jo8L4ZLFk2qByka2FcwNIhOoVwmBN68M21ynebizLjOB4d
         C7EnsmRLd5rRQovueDlH2tJzFokEbGrqF9cTIdj4tlO+G1yIHaTMzdY62RDKy7QdHmdw
         /HQw==
X-Forwarded-Encrypted: i=1; AFNElJ9E0mRQcLCElrBBiMZ4An3/kFKup7JhWryuATTclPbDuV8Bm1nMVNhRIK2FQcrR0DPHKEY8EQgRKAJl@vger.kernel.org
X-Gm-Message-State: AOJu0YxOCGXa9YKKiQmG5lzJt4HLxWOfsae5MbSZxU7r//v2gdOg7iaZ
	LKf3IUnkAs4lv5+vwEQpG7lVt98xIU4DS7J3IiIjQSE4bbhQm4WNCpez
X-Gm-Gg: Acq92OH0A2mqXFX5F0hSd/JjnegK/2VcaIkVWwV7vgtUB6Vy1W1HzmszBxDZ0Hw58NR
	DnWA6hFBlvfd1kJOOA7oSZuPlfbe5aU8vdGKnuM8hXyeoyRMyrYcbYHIQ0Ib2aHtb4LCFcfxMCp
	kPa8flqei9hOlaCwtzwb19eu8knf3cJ0QhNtJg/m2g53IYaQji+79jdTGnDtlf2Lnbu+dWsAtFW
	srCspgjucltutV18Oi7cEPdTh+nE+S9AJUWfRbxD/+Dyfxu7Upo+w5BWx4d67GWO+U+5gbJ/hzq
	8NDlAA1ugPai2/JW6sFmUbt5juzX3x5zeF5rGjmTaJxmR0RjX/djHS3Mji/qavRW2AVAJ4e6JY/
	6Xv6QUe2uP7OOsOhvblNPXZ70L9oyoT80BzxC+4EgBqVsJABqYK7UTzAPSgvxvar+lXqrSf6po3
	5+ry+Jw8W96/hFDkzz
X-Received: by 2002:a05:6000:428a:b0:45e:edcc:f6dc with SMTP id ffacd0b85a97d-4606db9667amr6456265f8f.6.1781296052923;
        Fri, 12 Jun 2026 13:27:32 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:27:32 -0700 (PDT)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 7/7] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Fri, 12 Jun 2026 22:04:12 +0200
Message-ID: <20260612200717.361018-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC,
providing support for keys, pinctrl and RTC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..b8d943e47816
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,41 @@
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
+		mt6392keys: keys {
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
+		mt6392pio: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc",
+				"mediatek,mt6323-rtc";
+		};
+	};
+};
-- 
2.43.0

