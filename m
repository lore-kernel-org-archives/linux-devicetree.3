Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC53EFD3C
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352631; cv=none; b=sIyoE1nD6Rg4360Gl0oQck5Uh0Imc1ZDk1RMmWYYxGqARwZB/wCG54Z0rxLiATRUrnOQ8XGHmWPpdhGIuF2BUaX/FjR6Bm06sFH0pd2nbSzZaEYNkasDV3C/UeYI9ziEzu6Dx2tIjI76OIiTPLxuyCvU95lOOcGv8+dHCMbIE54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352631; c=relaxed/simple;
	bh=zTHSvgauhk1fL2rH+ZBSq/RVMv1G8G+YQUAc1AEK3Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1t8jhNviVEEqhDyQ3zFm5X5u+OCFmqQ7iYkXyFBA3P1XY4tmompjzC3ehyAwclFGUP2A4aDBsVZ4+wtgpFMc2okDnXRhHGDR3kk9aW6c1dSbxE7k2Y1TXdTS/eIq7GgXuhXqLUxduoxlfPQqNVw/4f1fsBICxPSiOs5wQaotgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYsOMKGP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYsOMKGP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so40749815e9.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352622; x=1774957422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QInh7f+kJYLhky42CpiKQ2Xvp48u5QVAak/vIZ1XsNA=;
        b=nYsOMKGPq2hh/RqEhR/un45pNIVYcjayw38CnagGfapsAi2WNtCrgxMlMmjIf2oMDq
         yTJRvG7UJ0/02OZ4E8TDBKnmcO72mjsK/mIMmlFp3nK941ynnVncEHg4wUSUJacD8bRH
         AbtFOvEh6zbTW+6Fo9JtISTA0nXO16BmpIy817WyFuMnQkTyMXziRGjtqLSeGSqC6JFg
         d1UMZ76/31aUem0Xyp/HnSRS4bF4iCkOeICmsCle1TtTVJ12SbR2sn8NhQaCQi5w5CFV
         YhNQgzClJwjQyf70iZXGA/eM4lVQHs9CoV+LbRxf95Fx2eHB7t0+XCXBWfFS7E4VVrGw
         Y+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352622; x=1774957422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QInh7f+kJYLhky42CpiKQ2Xvp48u5QVAak/vIZ1XsNA=;
        b=A2nkCsx1NF0cWLWgMzImngXfNsT0hnGIs2ck+ieoEnBKA5pXc0V6GwQDDS2duwABdp
         dK6C9pMg/ZOoOY41IFOaSxr8RxHTBO4fmID9fP4ryDSml+IhMtjXkHTUqQphh8ErcUe+
         u2t/6myDioxthKqUZNoskrm5QF7TGW5f9o5kFk0H23BUQGN/QyNFEVB+KM8mMavGfrO/
         +snA2eX2I4nRwrP2sJgQ3zFlCvVRWw0PvkJz1GVMYA3sD2I7ZU9a/HIp08Bqxbw9uAwV
         LQfvepRh7i8WAl2b+kWb4SF1UQnpN02VMmvfqVI73joFv+qn6V4UEwLJuCKF+2FDRodW
         Xyvg==
X-Forwarded-Encrypted: i=1; AJvYcCVA1bSICWO8AoOTmb6BZAoJZlnB1lYWPYDPWgnEeOHoZ7/k1dZ0ux1SjY64EhFnhIOdcLBiGdTrgW43@vger.kernel.org
X-Gm-Message-State: AOJu0YyplTeemI6gn2pB863vqBtT0klTDw6LHVxb21MPNgJh9DN6Ge+y
	vG61pbLIlv6S9BP3Yej7JapAgARSvuExutsEONyACBUxKcNuy8mGsjyM
X-Gm-Gg: ATEYQzxV49g14pHhbinhA+wbTkzdezuzgEdT1uKMMi/bZaVI8FQMOo6ipElWvM7KH6W
	Or2LSTVw5ikcMsoc5voQNQB5OjjlELzTzGLWy2rW7B66cwZnK4YPgK+E7mA7MQtv3C2HPZ+QeaT
	ObEbRwhoiFc3CJxsbuBmhOKlvImOY27HqgLxOz5xfQuEcu22vLvFWGeuakHtp4K/YOp5sO7MMyn
	PG+zi0u0Rta+3M8tVPVUQKrkwMjuRKaQCryMv818anDC04SOcBQmuaoE61UzJ8IgQ6mRfjt/dlV
	fT7KySDTmstixLti4fbmZEP1GIMuLo9pjR7qTeYuEGuhglkpSYGiiVIH5f6SbEZbqZsJXkH/bi+
	05gW9AoKNm/+We05F6gBLnSmuMAFOYUUxiwaoTzRyN/IcwW9Eye93AwGmWwsNIyOKLU0HHmpf1D
	S+wd15yVNrn91Xr5LSn0c7ktC5JTX8MLXhu4qF7GeFIKwMz2Gy
X-Received: by 2002:a05:600c:5291:b0:485:4278:24fb with SMTP id 5b1f17b1804b1-486ff04d6afmr219757615e9.32.1774352622090;
        Tue, 24 Mar 2026 04:43:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:41 -0700 (PDT)
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
Subject: [PATCH v8 09/11] arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
Date: Tue, 24 Mar 2026 11:43:14 +0000
Message-ID: <20260324114329.268249-10-biju.das.jz@bp.renesas.com>
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

Add initial support for the RZ/G3L SMARC SoM with 2GB memory and
extal clk.

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
 * Collected the tag.
v2->v3:
 * No change.
v1->v2:
 * Dropped gpio.h header file.
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
new file mode 100644
index 000000000000..7c21afaee9bc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for R9A08G046L48 SMARC SoM board.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/ {
+	compatible = "renesas,rzg3l-smarcm", "renesas,r9a08g046l48", "renesas,r9a08g046";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* First 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
-- 
2.43.0

