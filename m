Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0DC247280
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785046007; cv=none; b=G37WNDr4T0k6BKX6kSq7OT4OV+wSLR4GTHHL3ZZeq1aZw27j1w81iKvsTmQkjhN9KPFNbBlE4oYI9ai272VpswZlZDhVlN3c9T13+zo5jM5HsGYtkxgS1YhuQRtR4l8bfeM+ZO1FYVkGnnwtpWFJbTD1JlBtlCTLKA6RO2rFW4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785046007; c=relaxed/simple;
	bh=kGdQSujpsiiifHsaVUlkBEHoyFe6PWGCLejtsszHFqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E01b6Yh1oj3pGFDh6VSjJ5VPETwxsYMMeYBVBhMjth4htIGUkOOTeV5vs2nRnIzc95PgAkUZKO/Ty86XBTlH2yD/+I0VcarGgTsrApfmfhlOETd3q1EaozA04npBq0K5+SNPNX/DFYZ0G3GvUzE20RaFn0uqZruMDBG02v66Nd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEBpDJ72; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEBpDJ72"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so21513815ad.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 23:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785046006; x=1785650806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ag23eXBLMTCliH7FTzPeD+zjIZTX/IBTKJOhk5SVu5k=;
        b=DEBpDJ72hWzo/wKR4uLVX5Qx6Ix3UVDJXGjAskIDl/uxlY10oltV2n33pb5l0OlXSC
         50rAHK+a3N+pPQQdIMC4j5tQOAbb22cMIL5dfdQUblAmoJeJW/jXMDZYJiIiwpsLonw0
         jYFpTUB3mogJ9gNQkmXdGKOdXLYnjbHUa9aP1Ay4pvDPFqNFQLEnpFC3Uql7mgJEGYlN
         FNB3XTHvKHa3x8pcJk2wglcCSI6WRF1ysg64ym70Z7mlHkm3NN5ZKdQZ1VHPHOJcXW++
         3vD0BDU3D/zMaYg/rAQqKKgVDzZKH3lG5ZmbrGkpLDB9HUaEfixD2K/hoJvXBX8bUKul
         8Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785046006; x=1785650806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ag23eXBLMTCliH7FTzPeD+zjIZTX/IBTKJOhk5SVu5k=;
        b=Rnuw4yPnH90Tzk+Mi4+zXTfJZQtd+FbLJA2/Qyknkrz9vPugSnh7gtyjp4Wg8I+l/3
         Jm5Fg/cCjqEblX/jTMLUgdXJf2iGL+V2nn04aRzTJXITLeiDuepmaRMl/pkwvyD0KGug
         O2x8kPMj/A9nukYU3F/qEVaViuLvVuBo/jJH4kfGoY65p7IQYaZOv8s4lAJhsYhhLF8j
         JC93if+5pnyIi+WogsgLDegF4WDutRaTW7T6opSqYHbT89/nN3GuPl5ilDyuaKVkiVqj
         DHoRGvEp+RjmmLaapwvnJfj3nLcBkmyCPb8LjwVefwELyV/shm+D79BuUxtvauWU8Cpf
         PIdA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1QRKB+4bc8G1QSBNejeNcPn08c+cn5cSAiicdj4M/6+7ASbCmqYg1tDMK+MKIlIxUAH6WR+PXG1U3@vger.kernel.org
X-Gm-Message-State: AOJu0YzH1CjxPCbPJW+kG5tfcCBb+EPtAYuhwUxkqdrxasKYCb3hviIA
	ODPGpPTNlxxovqt5hX8aDCZhY2+4pa1jKNDc6jMr89V/A0yL/c9hROZH
X-Gm-Gg: AR+sD11weFlFb8fIeYXPPcM4c+Xu6y8284Fpd60+L9hyRxy2FbLfXQ3Tel9mvTsdTp6
	TQXrw3qSM9dIwn+G020d88Ed1PLt9IJHsJZSjU58FhFncpt1dUp1TuYjVdDKHYBwmMzbUSZGnaf
	f2S3j2m4mZ9voAF7gJJzv1ga1W5FxA/xmKN0uVKZ+ou7nxfAl+vi2MGUtLdvRbtH6hrJYtlCABg
	+H+zqjTE39hEa3mlGXeuiWi/PJmTrVs2MTGM5CsWPlftZqAvaDO/ZE8F1JxePaO/EC1WJIXDH5Y
	qypjvuQs+uNbHbuqFemK9FG7gc5NHKcDtQv/Ue8gqY828zKP++TVaVt25FESFbtSmlAljkelDd1
	1+VeBYDyj2READA3K28URo1mk0h1YbXO31ubkQ2wrXffOkIYyQDOVxlG2if/AbwCDceEXgki70W
	JekjOTsLlsTJyjqbDmN6/SfqfKpSkRROs=
X-Received: by 2002:a17:903:944:b0:2ce:d5e4:2fcf with SMTP id d9443c01a7336-2cfde8a2236mr40642175ad.42.1785046005911;
        Sat, 25 Jul 2026 23:06:45 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b5b6sm16901225ad.14.2026.07.25.23.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:06:44 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: dma: ti-edma: fix 'tansfer' spelling
Date: Sun, 26 Jul 2026 11:36:34 +0530
Message-ID: <20260726060634.18908-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: tansfer -> transfer.
No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/devicetree/bindings/dma/ti-edma.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/ti-edma.txt b/Documentation/devicetree/bindings/dma/ti-edma.txt
index f719e1612b0a..d69264110e3a 100644
--- a/Documentation/devicetree/bindings/dma/ti-edma.txt
+++ b/Documentation/devicetree/bindings/dma/ti-edma.txt
@@ -3,7 +3,7 @@ Texas Instruments eDMA
 The eDMA3 consists of two components: Channel controller (CC) and Transfer
 Controller(s) (TC). The CC is the main entry for DMA users since it is
 responsible for the DMA channel handling, while the TCs are responsible to
-execute the actual DMA tansfer.
+execute the actual DMA transfer.
 
 ------------------------------------------------------------------------------
 eDMA3 Channel Controller
-- 
2.43.0

