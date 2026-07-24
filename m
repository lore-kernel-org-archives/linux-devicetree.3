Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372563385B6
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889141; cv=none; b=lgGDz7VnUl0s2av85UCdZaaqJcrM2DMS1O5yhN+3aUYBB1qgY5213s5F4ttZA6SDpauZrnF1Ptb5906IJC6TZJSZQ83GcIaXNw4MGKcXX16Cj4kaASaPC0/Kmm4Q682BdKPkXtnokQzLkaCQpE2w5Au/OqXjKCkNX+vPaRUxZzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889141; c=relaxed/simple;
	bh=km7ZBcz7tXWZnSNktgEBnUlaoi606YmDd2gft3d5PUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HLndtqIUSywh1JN86+lAYfzsys2u4JNnIPC4X6Tvod5avc9C1zJX7H7W1CY1oXOviWnwWInXbSjit0VuLooERsDyF1aLPUEJ4kikokRAL93/0+ltQTQrdtkW0ctjWiRbWLRovxcd6/dHj+IyI3Cj0b2MJLtIOFXnnSR0D3x5glA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmYYYRRd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmYYYRRd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so2425985e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784889137; x=1785493937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnUCr2DU/JXR6L4o56f6TURuvVsK2OuxGdTmuEiQLYE=;
        b=KmYYYRRdZiQXNO5KOplPdvynohaIc/T4L6IwlP7ZzZlajUZkI90KvUJsvQJI+8ES0Z
         r3gNAOaeOwwlqY9w8muvptCGI0PKeXhPuJdwwPWx43aTy50JkSqujxtVvHRZSnXQaadJ
         zpLJq9pXsT5NrJbbW0WyxPgaaOl98Dr2wqUI/t6gWr7dU08VLTN+jk3bigYHHNYqw3f7
         dmzp3+P3vJUbYBHWJfB7167q6bQ7FpyVET3JkhXLcYycFP1wUDJUFgDjEvSom8JuXm9c
         f7P6ygkfpx0V2yZwoj9MIHOkGW9+TJaHO0ASeSMi1t+0tqe2nB4OtaeRlX7cK8wykenX
         hncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889137; x=1785493937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnUCr2DU/JXR6L4o56f6TURuvVsK2OuxGdTmuEiQLYE=;
        b=MjSsFaQSvwxkCg9B73Ff86CLexg5G4Xyk84uEAQoSAcihauYRZBJlGyewLI1nZp5WJ
         yybMzhetywy8cHuaIxWCE8l5ekvP3hLtT+xdnOVAeXXFfIedQCtxIt513kDkRKXlLyhn
         4fgR3Y+AJLxa39bEwtcypUv7U6ZpWrQV36sTRUcxN7fYPgVzK6Je/+pC0ToY41cmLSD8
         0ToUqHwaS9EJkmb47Rwqk5oXnn5TynMBE6k6ALVagYfK5e+HT1QaxFBJnCaKjAWYj6o7
         zlw7sCLia+Hg5T8eq/b35+F/kw2LHUPT7/aH0Av4dndbn9BBd1QuA6yVlGbLhkc2ZeJa
         pS6w==
X-Forwarded-Encrypted: i=1; AHgh+RpsaNLzHp71ItN3MQ6Zn9uwkh850hbxnFbPNLEjJWmVm8fML96t7tacCMB3ulhtXbBbD6ICMgIbJrSa@vger.kernel.org
X-Gm-Message-State: AOJu0YzlE69CcPbEvVGzKxfpLKxtNDj+lHtY/SSqyWPwiL5uTHLKNTHX
	DNngFqjrOlT8XycDsMok1t6/+2q4OQj2XakocE+h1PvQMqU9J0K66vGv
X-Gm-Gg: AR+sD10RPMbT4DuJ9iRnfiHAwLNsNvt3fPqCK3trZ+1NYjTzSZHBWGYVFT/qXY+5vnt
	fWFj9HfiGiMcOqUu/ZbqkiXbESSvbU7LL86meTesbf3Mvicr0N9kkxfv+jCkS8tL1lOMASoT9HD
	qv3TQOZBRS4rExXfqYkiOPE0x1OA5Hc8ORvVywyIAQ0tSgrE6XBOcCVc8oXlgg9Wwz2+I1tCu1L
	nY+FDT/0FPwMeiIsUAziRja9c6B+Vxu09H4dOWAwEcPmpkN30k+G7RjScVsvTrJYi3Njrx+oVJC
	BqJKv/1hQX5k4SBFgxyBCy15n9Lv4lIa3hTolEuRtMlNg7VzSvrlmG9jjdyiYi/sPC9nMe/tf18
	FErqA252H5XxkrjQfn/nDVi4O70tcUVc41tGc83pUVVCKX7feCYM7YqGKsg7LiYWJc2uhDrLlLW
	vp/ZSQcv/RPK88Vqx4xDlKHJ17fEqtBr+RsSO2TBbEzn86F9vpGEMFuLqic3gu8ezY5LaKjI2UP
	L65NAtmgpM3hh8cm5xIE3+0jg==
X-Received: by 2002:a05:600c:35d5:b0:493:c601:3e23 with SMTP id 5b1f17b1804b1-49573c8c8c4mr71266265e9.5.1784889136179;
        Fri, 24 Jul 2026 03:32:16 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957afac1cbsm55709885e9.10.2026.07.24.03.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:32:15 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: enable in-band status for SFP
Date: Fri, 24 Jul 2026 12:32:12 +0200
Message-ID: <20260724103212.41821-1-stefano.r@variscite.com>
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

Tested-by: Stefano Radaelli <stefano.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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

