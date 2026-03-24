Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E634D3EFD13
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352632; cv=none; b=caWEKG/0cZtOjCMcp0V1eHMLrc82rgrzEi2fu4wBTd+0iBRnw8cnsoeMkQpXRSmKYovxk+5OTaJN/bJMomCdmS8QgmZegEVNRDzJInKc9lu473Mflk1hgKjRX7CKU0dPo22DmMIR/kYQ/KIz0D36yyzd772Wsg6G8DhmjDQKkyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352632; c=relaxed/simple;
	bh=mR2hItSWrC3t16vQFhBn43dO7fQNDpoPvvx1+2mjr6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emtuWr/Ps4BbcRZZ72w6UHhEivJAud8mIGDfwg27ec32LEUEetsmGuNWZbtb4sbmN19/vJw3VwWIZxv2xu6/2VmZKTl18S06WXjl5Ee+7CEYx1N0xP+3Mvx9JaRef5Twn2eptoMK3b4879Tl7RMn3k4Z7gjzrWMeJoJU4WolE18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnV6I8d2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnV6I8d2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb439299so43011625e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352624; x=1774957424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6O+qe+u4/j1RQP5lvPZzC/67zh2chDnbOC9lz0tvoJQ=;
        b=lnV6I8d2Rg4lIJROHljBNMcb4Xf8skjLw+3U2O6FS3aHvu19EOyZRkIFK3lNphlv6T
         aeIZlucc/04NN9YPh+GlrMPE1D/E8+qJKy+a/xNpG04JHWAQWP82/g14ofAJwziSjBVc
         GnMd6rc4wI4aOCTc0M/jl4VS2lrVPDWD5c1hvDUxJJBs9D6kvWkeoiiEKPJj7KqaupXc
         BI/yGLZj7V2v//+sP1onP3EjT99vQQJjjm+hihu9RLoIN46O2Oy3TiP2csVMkd0JRnz9
         05yMGA1YBgNHpgfZqu/jCdIUqdn2128BcYUIDEzxdtyoNZmwtQjMlnHgEeG2AX/9byTZ
         7BAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352624; x=1774957424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6O+qe+u4/j1RQP5lvPZzC/67zh2chDnbOC9lz0tvoJQ=;
        b=pTjK+qmdilfDfGf+sl2Xo1DYjXnFb1X7tVZ4X4pf5VVdCL7+OAf2QdfmsTierjdxBV
         E30kO8d5NoyPlmmzfLFENMm8++hplGDQPDPyMryiCnnhmQrEDm6exxM4VLtVY4Gl9m5x
         m7RkLrZUc2aoCjanRiPA/y5iRvjnnwXIX+1YEBwD43LMgsTgfL/nsVcjH5/ugBzPn+j+
         Ed67JoBl1bWlp0tHhXh2k7aD0KMKN03ATAY+nYor9tDNU72oF8Kyd58lUbr4Er3zpR/9
         +Zt/y+o5mwH6jH1T/jpKuBZhuMPCEsVFPIR5nH3JdfYwfvnKVzsZKJKk38Eoi0jsiSfJ
         37fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGldfTXszHk2FVMQLgIRrz2zL/flGsJxk8qXZqwvbwdaeSi0INN/aBEloyaUetdhqIZ5nKTqFX5SyL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqvt5loRK0BolJPY8Fgdr/PtxDWk6XJaLpR4jVgT4OkbAO2nNW
	blnAzvRTw25jHHX1wIZB3WQvo1RscK+orseDDoCLiyNoGOK6WDlBS2Uf
X-Gm-Gg: ATEYQzy48PoCAm7affT1WQuHoA78lZ27oAXhtLcAyeQu5M6/gL4Qepg3rMo8kzzQa2D
	5nGFSJ+ECVAcSC1pq3smS/dA7sXcjCavI40wqKAeWouolhwMiMUDgvWkA9RQ4vNRqxPLdHLCR5b
	+GEc1j7amgMOvrdDCZcZgqV7gyT0kmROV364rn+GaDesonoKtU2h6CEpvawtdQ33mQNqgRJxCS6
	1Xv1tLBddWdt2CA6M/QR7WQ872sCWAhpFXf5WOitYhE7s/35tla+25OXDxRGyN2Uo/2v9jk7Pbn
	5o5Bbo3mLGmyxfMEwo+e0GE0I8rJsW53KST0LQcZfmsJxx2ReDAI3AGC/lAOnoaikEJMkbeoMM0
	u8HBhr9Fl51WWwcRWy/1bGQHnQ2FxM5P0Q+Xu4hrqU1ojDkdnRqqcP2zHbNttUwYyTFKepE92lI
	fQmmMaqp9YHpyeSHjfVci6tKjgUeF7PESWaW1UQ+gVsm6e9iAO
X-Received: by 2002:a05:600c:1c0a:b0:486:fbc8:8dee with SMTP id 5b1f17b1804b1-486fee2dc56mr233497465e9.33.1774352623796;
        Tue, 24 Mar 2026 04:43:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:43 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 11/11] arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK board
Date: Tue, 24 Mar 2026 11:43:16 +0000
Message-ID: <20260324114329.268249-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the initial device tree for the Renesas RZ/G3L SMARC EVK board.

Added placeholders to avoid compilation error with the common code in
renesas-smarc2.dtsi.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No change
v6->v7:
 * No change
v5->v6:
 * No change
v4->v5:
 * No change
v3->v4:
 * Collected the tag
v2->v3:
 * No change.
v1->v2:
 * Dropped scif node as it is already included in common platform
   file.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 37 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d4dfb7fd973b..76df20d2fd29 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -179,6 +179,8 @@ dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtbo
 r9a08g045s33-smarc-pmod1-type-3a-dtbs := r9a08g045s33-smarc.dtb r9a08g045s33-smarc-pmod1-type-3a.dtbo
 dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtb
 
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
+
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
new file mode 100644
index 000000000000..86db86335d5e
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G3L SMARC EVK board
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+/* Add place holder to avoid compilation error with renesas-smarc2.dtsi */
+#define KEY_1_GPIO		1
+#define KEY_2_GPIO		2
+#define KEY_3_GPIO		3
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "r9a08g046l48.dtsi"
+#include "rzg3l-smarc-som.dtsi"
+#include "renesas-smarc2.dtsi"
+
+/ {
+	model = "Renesas SMARC EVK version 2 based on r9a08g046l48";
+	compatible = "renesas,smarc2-evk", "renesas,rzg3l-smarcm",
+		     "renesas,r9a08g046l48", "renesas,r9a08g046";
+
+	aliases {
+		serial3 = &scif0;
+	};
+};
+
+&keys {
+	status = "disabled";
+
+	/delete-node/ key-1;
+	/delete-node/ key-2;
+	/delete-node/ key-3;
+};
-- 
2.43.0

