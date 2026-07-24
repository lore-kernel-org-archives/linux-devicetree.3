Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84924453497
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784921417; cv=none; b=nkGxK9DXvof+5KqRyFX2GvNiDgTrSfNEf3V6OrLPGqboH6HHZBWuK4qsev9VNFc7mtW1sWZUHLncKSwvver05zyK6GNP7oOnfPtSq8d23c3DFlw9pJ55ZbpQuMKwgUiSjxGtey5nnMdr9QFplvNh2xMrMEqy4W44FA/zqVhXMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784921417; c=relaxed/simple;
	bh=LjeWGr1mKSAToTNfp2avz0FOizHKh8Z6yXcbz7L/7ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R5/7WBy0B6CcB2Hg5WVVc1oWPG0r35OzVNzTxFS9O7S+O2RYsfxEoQ7V+DqwmxTBbsNqHODMjiNaRWfAuCTtiHZFDFBGIDXCm+vRtZPuuJ7jquwGVnZJS/bYNL4q8LPd6fjj3oGIQ3+GWb5arUFzxNgxLVkmXhMJ+YmFJ7Hi4Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4P0Tvtn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4P0Tvtn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f6de72faso6900685e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784921408; x=1785526208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aq1R2dvrAm+XGL+g1ljGd3Sujd6kX0QwLMm997FFPa4=;
        b=E4P0Tvtn/YeZ2Zb7WH5rTzz9B4I+RX+1MY6qjcR+VOmB3GRltWvqIxlCFqBFgysd9s
         HK8K/dIZzB25XaelgEN76FJBF5GQB4VCvwOsx4c3zhDpiFuboCG0Nyb6QhBV6FhQjlZ6
         475CjZOu/AHmvUpeVMIwW0pQctrfj8cLqGh61iDTvhxlD9wyYhoxsKQXlhuHfyx7mYzf
         w0TVvRfZxAgM5jCNfsGLlj8iLneVAva1WEUFHRPAl8iK0R8fReLVrZcI+W6/zu4wVY2I
         CmjefbsbsloGjZeg/ff2ESviNtwEKgx+Mg9xXc2bVnl8FxyMvWkGtJxtMy81EdJY/hGG
         0jbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921408; x=1785526208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aq1R2dvrAm+XGL+g1ljGd3Sujd6kX0QwLMm997FFPa4=;
        b=DX7PH7bPT9MeTZ8LDcP8KO3ZzT7BpmgWb0ZaGpIWxNRotSbwJPZjTVxPvp9Qm2+G/C
         lKoPVNJMBHfTn2wPbKER9yaia5uH0c5FbCSxqwzgq9z5qwwOqds9aUsW3aWekiStebpM
         auQkCYeswCPYLg1H3GZ9H6HtZRsuLUX9Y7rO4vFyXcPD1WrIw727jV5G8kqzFqrsxw1l
         LNKrwEcLLPvZEMftiiSSl26yhpAY/k5IQnDPvwp5Qeh4RFfw6kd1XtHR9pWO9pNImXoc
         PVLNKADdizCGvH/H1hnNrfdO2kaLJRP8WZdu/zranGw4gwx3JGPkHgXE0P3rWyttzwv1
         +kGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqT7lIbi9LESz3GxSoCv7C5cfhcL/Q/pyDrkFzhEvQi/XkW9nUrBdqu2gexBG2rxydshsl5JvPbm536@vger.kernel.org
X-Gm-Message-State: AOJu0YzoV3HwSjqQ/+zLI1dMrZkLOAYzqq/wWMn1LRtqyn5WX29aVuCV
	tECRZPPKzzF1WLDbhSJyw79FIZWKnSgkKri05ntSdkNi4Y7x4LsM0f4H
X-Gm-Gg: AR+sD11JemUgUDzK3gJQym3rUtzpsnnFKkZpYflyLHdi8pXZBWgK2x3c6dsn8EOMZ4o
	Hjj+V5ZOcb6ACZYA4Q22qAvtU5YqdvXc2Ptkpynl/H8/tsg2qt9XoHsAHw6eX1qQ1KKDvAAciyS
	viXxFyEBo19GG65os7LCB+N9QhSXF4C98cGMsyqDWLt/+Rb3N7TkI4+XPa4NdwKduie8qNGXNMa
	nQEsqOniedoUCZfTFwTawIsDN0Pxxv288yyY0fMU83fD5/Py34WaoS87eIORxtws4YleNOAS0TZ
	cZPIUQN0pmRm9A/UyHQ9RWtOdtDCQqZMz5yUyfbNaSr7APsa8tgJOoTs9+uL/HUrW3ehQdfi1s+
	nNZ8jCGZw5j/LwClRLPhQWKhbOjF23gg8Y7PWTHdieARpTSKld33mC4N/ioYDrn/C4SFu1mc7WY
	gkBdLzqHSnFXAPWMNnhyMUaMjRb3G7kU+JZbA4E1tdqFJiHgAcFuMykcmq4Q==
X-Received: by 2002:a05:600c:8714:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-496997235cemr24469835e9.7.1784921407744;
        Fri, 24 Jul 2026 12:30:07 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b49a8547sm11733195e9.14.2026.07.24.12.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:30:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/1] arm64: dts: imx95-var-dart-sonata: enable in-band status for SFP
Date: Fri, 24 Jul 2026 21:30:04 +0200
Message-ID: <20260724193004.51978-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The 10GBASE-R port is connected to an SFP cage and requires in-band
status handling for link state reporting.

Set managed to "in-band-status" so phylink can manage the SFP link
through the PCS.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Removed Tested-by

 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index ccf7e77016e4..3479abc25df2 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -157,6 +157,7 @@ &enetc_port1 {
 };
 
 &enetc_port2 {
+	managed = "in-band-status";
 	phy-mode = "10gbase-r";
 	sfp = <&sfp0>;
 	status = "okay";
-- 
2.47.3

