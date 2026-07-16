Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B4339E18E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218803; cv=none; b=EYlW28poXtySfv7/Fninel7tEF+9eQH11etUHEauAUXU2n0IjapQmDCYyJ4er8C8/bTlzCcNoLbIHliNGhzHhlm6r8UgA08h7fgFSxvCgXdOKTRYkKxYFaWai6Sj3EeNwtgLDVyyaDsAdKILg1FM6RF/L+RWD1mEfqexcTbUUfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218803; c=relaxed/simple;
	bh=uFiZx7lwOslWSHJWY4z9JU3G9Kk7vQ6mMem0n1bGoYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNDkWzNAWiUxsgRlhpwANE6pbeFNMAFAlF0+Q9HDH/AQqKS+4vEiu/J4xtfsHSjriDOhfc17CHYc6idkbcma4nm4CCVyvfQ/VGDd260B1Pq5FxHX0kglPTszjW+wrQ8uVGnQ2aJygAhlq+8AfsB6/pRfVNas0aDqimTjvUYe5AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dl4kuD2F; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dl4kuD2F"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84847482584so654200b3a.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218797; x=1784823597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KAndNulGWhi7VX32166S+y+iqFsKuw1F9eHZj/FgoU=;
        b=dl4kuD2FqtBbKkKkh4vxNbkh+rW4Akj3KDBCrPOnUw8BNc7qXKc9iyvBUkHPnWRHYZ
         khb0/4e5uwfyOk0kdPhPRZdOMr6cmSpvHmW0AspELsike/IR3ei43ObhTUcNSMuu6zi8
         LdX8Lycvp7GYr8rnh01WpgjbbhvYllHiAYEaymaOmJoVZ41gyanMv/VWhtBH9W2X0TCG
         tjLK/Bv7O2GxsN1W13cSaXHXDnb09ZB7/89gs6JWQcZaDMk7mHckFGrGTG0GHxbB8dYZ
         Z5bnhYtoXczbwG2GfQE/vY1SvrJumbtC2oAqFFJMEotldOeXzvlWP9R2YI/y7eYIWNho
         q0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218797; x=1784823597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7KAndNulGWhi7VX32166S+y+iqFsKuw1F9eHZj/FgoU=;
        b=GVACticQEGBLbwjnwdZriMplWLxSVf1hO4i6GavPDSoW/8GReac2ExQDqUayS9MGd+
         Tr4ttCbhy4DXm2Y4f7OlNViH9vB3N6RAwhsCUlDHPkXCaeHWaFAKfv1JalHLaWG7dedc
         OOWwWxBx83BO1X26VpflqUflJNTwXBANIxh5Upk6LbOSPZ4ZT7+85tPHmxivpjw4zKgM
         xbOPccBpY+Ni0z5r+UYGO8Go6TePQE0QR+JuJY9a+7PvcCQ7NdcHSWiQC9s+4Z2mPtaO
         5MeqvGjUdz2srBDkpwvbH/Ffa5itwJxA5FdcCYau1IFBqj2RWJ0DYaJZheCohWlCznoC
         F3Ng==
X-Forwarded-Encrypted: i=1; AHgh+RrsUNt2yFPd8YyBIpmmmz16wtmBI+JqrHbxOq4yYFFriLIzhtsSOLVXuI0pXreYCMuF9jtlArc2ewrN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7EBl3WrLklg4uP5P3DHO6++GsTIstvhzmRRC2Tnxl6D7PnxGV
	xqIho7LpVQ7EqUYCrmxvwvX9l3TvD6mg28hDGSUsYVAYh1BwYJHuick5
X-Gm-Gg: AfdE7cnvOOSiz20UbJR7vHAB2r4BvOjmUXszlRyWbmA9aoAZOHsx5uUOC8KRBDpRKA1
	hmbFN8TUcEttmtQsP8wrsAg3VFHdcgB2D+JxVF13PfcBQaahMOCunBvmI3tMN2bKZ5JTZN8zQJt
	dDaZcDeHB1l99Cqz1gmeAKMctW4cpPRcnZ+G6vKINBcrJqOexIq5mpAl51HsJsNAo/Vr0Uj5etM
	kfKUIsR3SIBCT+CSEPA+rBF/NZW6kBsSSIG8sVjKgvH6uXwwtIhB+vJSxzgaJCkvFAuuwx6nqCW
	IZOaC8Mkswv9KN0glYMeHLnsWF+dzxXwbX7QiX7gBaBn7/zptbgcW0vHdzxNKYKKi3r6NPSplin
	337t6DtMNZ7upFH70/cGpNFqGLlUl2Y1OfECxtVTzrzT5UM1k+pFMk89Y4iA7CVUQPM8JmHKpPU
	XaaYut4bmCvghCc0hADOwshawV5l/p5uxB3A==
X-Received: by 2002:a05:6a00:3c8d:b0:848:2a69:97be with SMTP id d2e1a72fcca58-84beb1a539bmr3230781b3a.10.1784218797312;
        Thu, 16 Jul 2026 09:19:57 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:57 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 5/7] dt-bindings: reset: Add bindings for MediaTek MT6589 reset controller
Date: Fri, 17 Jul 2026 01:19:21 +0900
Message-ID: <20260716161923.266315-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MT6589 reset controller bindings.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 include/dt-bindings/reset/mt6589-resets.h | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt6589-resets.h

diff --git a/include/dt-bindings/reset/mt6589-resets.h b/include/dt-bindings/reset/mt6589-resets.h
new file mode 100644
index 000000000000..18ef729022a9
--- /dev/null
+++ b/include/dt-bindings/reset/mt6589-resets.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_MT6589_RESETS_H
+#define _DT_BINDINGS_RESET_MT6589_RESETS_H
+
+/* TOPRGU */
+#define MT6589_TOPRGU_INFRA_RST		0
+#define MT6589_TOPRGU_DISP_RST		1
+#define MT6589_TOPRGU_MFG_RST		2
+#define MT6589_TOPRGU_VENC_RST		3
+#define MT6589_TOPRGU_VDEC_RST		4
+#define MT6589_TOPRGU_IMG_RST		5
+#define MT6589_TOPRGU_DDRPHY_RST	6
+#define MT6589_TOPRGU_MD_RST		7
+#define MT6589_TOPRGU_INFRA_AO_RST	8
+#define MT6589_TOPRGU_MD_LITE_RST	9
+#define MT6589_TOPRGU_APMIXED_RST	10
+#define MT6589_TOPRGU_PWRAP_SPICTL_RST	11
+
+#define MT6589_TOPRGU_RST_NUM		12
+
+#endif  /* _DT_BINDINGS_RESET_MT6589_RESETS_H */
-- 
2.54.0

