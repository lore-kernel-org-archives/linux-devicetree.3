Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B918378D85
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 21:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776721209; cv=none; b=fM5WSz/DfOeMgfnnBSUJhifj+EyWSzuod5GGh/eAo8MGjCgeGkbjXV4BGdF+Iw6/7X8LCFOqUY8X3bUpI8DGEipzXq0cr6o9BAqmVgNO8G2e9yIbSITqH+qSQyUQ4lhb53IHZgowv8DkrRz40PVghlDKSL+lu0WznqVBHcg5NKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776721209; c=relaxed/simple;
	bh=ferQ/I0Y9PK2QH16FMGnGF2+/wylIAM94hfiAZxJn5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBHed8toa7L3udomw3JtiJ0sA0BB59GqzJ9arZkbCHMq+1eZV3TG+A8NAvZTH3wd8FheIdNtFLwvpOkGfN7AtHc0emBp7W7bKPi32YCGO9Ri3BHZAEDfx6+NieWwdJLtzR1byqfByw/CtVGLnXovSff/01azr21ETdQ9/tXJznQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+CW/Lj2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+CW/Lj2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so55438895e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721207; x=1777326007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=D+CW/Lj2bp/pRhTxkcG1ElQEfkOoYApPZZy4Hgr6JE5O6u9V+srlWfdxt9wvyZ9J0T
         ib26Ydk7vFOPGUyQ0PxECO3r6IBdpw20M4zJfHHNkom9cD/ixuTaNMt/Enmm0MSaSey5
         qGunbsz6+msQaLfSTIkDN2IvaODGl9COscsVWV0eqVjT7ilDVqFelIt1eqtDeR6cCDND
         qTrtX4brYm41oQbEciQQ/oNISA4sI1C/7pBCcCBVXdkuj7N7bEOqFMON4u1ns9PUrsao
         CJxdXWi53xqe25TukBQwZhm0QR3Rb2J+Q/MvFHX24BOuIraDHQBIxXC1Rpb9BltmLAvW
         nwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721207; x=1777326007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=MtI1QO2wqhycyJrSnvew3lxHup/ure5FX4P1jxHikjS+19Fk9MzT0gJ8H9E+Mc4C/j
         K7iZa+sxFfVisOUtnJLRrt2aQklnfG5hsAgkOZpSPCW3XbP5wIL/yAI//a5Rv6+4zg7b
         FhEhJFMKcjYgkwH5A41jjJ1LZMEYZ2A7vUZCEBBikPF3fdG5z5Z2JecG9/cEcPPM/Urr
         0FgiDywX5VUV9OvSwoNUKvXwN8E/FIAqwfc1BIyOEDQSkJr11It0fqKeG0CO3iJLUmtC
         UW4Jp5TlXOZXFaOLvDtn9CQ4tdsfSMifE4UKoUyxOfgawspbe+lsU39h8R43KD9FCTP3
         wAvw==
X-Forwarded-Encrypted: i=1; AFNElJ9W9bxeePAPsJTsG8wcifwtPR6+Sml1ehX/LCQ2gBjusl9lixYI7IYKDXjqggxj9pT6FcpS+5GgDtST@vger.kernel.org
X-Gm-Message-State: AOJu0YwvVbfQQ0R+1NL8dR2Y0ZLhljfAd53ecl6HIf63sEOGu+hrA7r1
	ij0vU0jr/AaJTS9XyTVeIyFbL0BmjvsID4Ejb/qil2k0WY9hX71iY7Zs
X-Gm-Gg: AeBDietnKqCJYqsosFJN8WwelYY9MayRz2xw6OY7fBwDAvE3wp0rS/jzmjcFY70Gi3/
	Txs2YJ3IqDL7v4GOLsVOzSFB50+z9UI4IZRTWK7dU7mO4Wtj8B2ItGNfCyfsCUSFKxZL+BczUbz
	a+K1/8gcYmoL64JFsJuF41MLEuv9lvnu/Z6sKjAwl9xbFttZb9RzzfyEcm/Ekuk9FIfYcnKnSHp
	GBebcH6/n/4jyLq4lxs8Tfdbry94uxhut+1X+pJptk5QMe8BaRGCoDoxkgv7e0UotQJE6E+vUBf
	2d/MQwDe5FYf7pPF3F/XCCtss7cCs5MZs1TJIWZU/8tlNI0u5KRgaXCA+7ny4qgl1eTmqq0j2Nb
	WW6nGCjxg4LuNX39Qe8fsltIltZ9f0b/NroEN619xvy4IU/VBzLM3vBNMzd5xWtiJbhqmqwm8cJ
	mOU349xJHoeXvNX0isny+8BB7q2fRfEQ==
X-Received: by 2002:a05:600c:4f13:b0:489:1a65:dd6e with SMTP id 5b1f17b1804b1-4891a65de3emr105875175e9.8.1776721206634;
        Mon, 20 Apr 2026 14:40:06 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:40:06 -0700 (PDT)
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
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Mon, 20 Apr 2026 22:30:08 +0100
Message-ID: <20260420213529.1645560-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
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

