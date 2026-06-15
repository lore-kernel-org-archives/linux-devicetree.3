Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556A12F12A5
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508049; cv=none; b=K7AaCdL+zF58BRQp3WH99/5ZyHy+4+Sm3J1v4cevcr2SP0D900/U/rnalgamteB4WLAwOFCOIuli7uoK8AXDiSoijd77WCcNnT0WAWnoRMn6JudyzZOkCMuIzMtl3cAaMVx3fx5DCvSJLrpfCyoiEtXqtmV+Haw5YUcFFkq1lzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508049; c=relaxed/simple;
	bh=kGmpVfTZ832WuX3ZqwMNMjsCMUl5EXCJ/u5hwQq9Xe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IjxPH1wOy3LBowhHAm7WRGfzFx8gKBpLTQ40HzQQ99pA5XYOxFtlj67p8iv2dHYi2J6mOGrcK72M9pu7wqyvEiTWI/j/gQC8hqYzPv/zjQKoJgcg1QZxLoMUBt4SUKqpjzDnSwoHayyJ1HzNdoyruGvpQaSGuWexX+OBmQVbMOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F20N/0hE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F20N/0hE"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so22707705e9.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508047; x=1782112847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxNDmIjOo02FnryXUeGSfIeICYAKAZhZUNgYnH1QQ5E=;
        b=F20N/0hEdBTpEiOYTkOOfZiDiJchVwr7kHHw8JB1VM5/Zo9tbonake9uZAWDFbWG0E
         8ksnaFM8Nyc1jrmwL+2HvGSBPxb1+jM9s2s7nUUMWSv3qOroCRqdJ64XPeUxM985tCV5
         cIH08uZX492/9jZo2XS5OSAzDV+VJ1HeM5K08aWKAbyIUL3YffHNCXga5KVN/95aU0vt
         W+yHltUtEUk8syozPWpkFWrbJsznwSWSyQ3utpfOVMU/87tqfR88+ckWuCtQYhcYRdfc
         ZS/YeQ6Dse+XWfZPlptJT/dOrbs5d/h8xppgE+wbaNYiEXErlQabiw7qQgbVj3Pz/ev7
         DwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508047; x=1782112847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XxNDmIjOo02FnryXUeGSfIeICYAKAZhZUNgYnH1QQ5E=;
        b=q5iOUVxdEyEJDflQLMrX/G7S55rADlV7bsa5Xf3LXy+eR6e9T1yITVh08XQ0/syvsr
         1vjJ/jo9PA0Ea/eIcr5lTUXu07bKDi5wLD4pHdrJepXjcJn/ifXAH3QIisUPJECUifZt
         zYM5D3U90ECV11xnQcKYK/eczZLmCa5AQqbzKRE+vk9bWYTQJ15WFVpekvIJlRWLMTZ8
         4HrlvIEUvkguwpyM0oEF7EUFuGvpoDbYp3w967tpNSZUWb+cprKuGfjMmIIaKhxGIe8F
         NEg6rMaO30sQU76ZlTefwfNdXJr8fwm9veh6FMElzHyByg1gr7NrQ66BhKmJSaXlh9/T
         FJZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ymXsH2agsoYWc9gDcO1e8EcZd/Tt3glNh6qDx9bitapvoZpm4mCnpCcf4ED4BSM75ixbXkvaYcDmo@vger.kernel.org
X-Gm-Message-State: AOJu0YxNFzkpirwV2NWOkULeGKExw8KcKoV5QJg0sBD4ljLnQSJR0DSq
	U3D4i6t0CTWbdeJC1Rv0IvdOPyIRRR02MuDupMjA0xey1PRaOeyUEENB
X-Gm-Gg: Acq92OEoy3GVCjLB2sAyHODXLGLpTdYtvrUtLwwnBqN8t4gYh5mDJFkMVmO1iarNsZ2
	jUo/x4UYmf+3Bida/ppC/j94iTlJrGyFry+dTLVs9IEHcIrQCa2slpDSpHWz+pWg5jM+VdCmys0
	Ut/PCVsZAYkZoe30hQQlf1MDhojO+TnIAp4Z+Pcs5aIiHYLfp/znbXnZkX1p6n8pOLRguSmbs1q
	Duv6ttDFETsSuuuD6YH4/o5rLBq7Z4hQlV0WM9S5a3Jm8Cv7mB9W3XaQgsF/8siAsG7ddhLphdq
	tcIpn7VEboNUVKqE8RkpI6683/JhAGeX87eNxVorkwaEqLggUk5cNlzpQU+ULunMbnorlytZQ3c
	7Nhj/oHpL5aHTPtyhabTtnsUlYetn2No7LHc87yJKfUrhiQkDeXV3owL5vKaLrCaXZX00qzqB1J
	JslQ4qOD4w5fng1A1i
X-Received: by 2002:a05:600c:138e:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-490ec507db7mr173245075e9.25.1781508046667;
        Mon, 15 Jun 2026 00:20:46 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:20:46 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
Subject: [PATCH v7 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Mon, 15 Jun 2026 09:16:15 +0200
Message-ID: <20260615071836.362883-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC,
providing support for regulator, keys, pinctrl and RTC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 75 ++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..81f15d76a05a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ * Copyright (c) 2026 Luca Leonardo Scorcia <l.scorcia@gmail.com>
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
+			compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+		};
+
+		mt6392regulators: regulators {
+			compatible = "mediatek,mt6392-regulator";
+
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

