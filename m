Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277F63EE1F2
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976087; cv=none; b=sxfAYCvTUOHCSYVvW3M7SmfBEPJQcN7qGR51ZGxUVoLHOfehsrDUPpFK3AavVnCsXgKCK+wSV/U2pKcM1wD4T2Aj3EEWchkBYpCG/4Dhv/GKLWVlG+KB4w/safilNOwZ6qWtj4K2aEQN7nvLXj/1A+id+bflsPZY8zaOelgSceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976087; c=relaxed/simple;
	bh=eezztA9v+rSOklQCE/FfyjtBlHaxBC0vn9qkEasd9OY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DIgJ9cRje2dwHG0eoZ3ifHoetEvYTj2Z7hKCp+KVqPg/KJmeBRgTwclq9cCCODXlEhQCA/z6U8J7yimqAEA93DYKBHdBOt+8ZRKJA4W7EN0LJ43GP5D2GQoYk1lA9PXzj+TqY7WHO+tBogWF4rz/LA52EnY9j9A5wkDR5HPrifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LYiRbjgP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LYiRbjgP"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-83975e992e1so208156b3a.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976085; x=1778580885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiZn9yahVCKfivdy6D+vGj6i1ru0Ro/xrrS9779vU3o=;
        b=LYiRbjgPsiRKxPMt32BCgm0PKQ0/hrtmM3VZ7Ya7azgyDHwfiO5l/8g28DqUXJhH43
         j6Wkdoe/s/TPgo+tkuMxV2A9jvoSw/ha9BDfgEHGqfMA7BgEwrTd7vmvAl7Z9umDdXlP
         oGVfyLWwoXBo6lmYHVGCYMlJzvnvURIfK1z0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976085; x=1778580885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KiZn9yahVCKfivdy6D+vGj6i1ru0Ro/xrrS9779vU3o=;
        b=PZZqGP8t7KW+Y7x/Rggll/2dU9la6pmCJfJC0Y37zUXlSODY56QF4LOYzYuun78+D1
         xBy1+lEiTuzWKwD11umPbreVqZ/3OtqGzSYJEtWtdlLzEn9YhxeCZU5YV7M3fp+1/XDU
         t3yQqt9cybXdPoBxs2NehbZ06LB97hY1QKY75mx/+/UMwRp+F7sNwpMxYqM7VcRRhtmt
         XDiwCGr78y4uD/6HbvjH+aK8d026wVeIDahjSqGJp0nIPG5SnQd9dok79ICvCM35Sz5b
         o/zD4oi80LV4aNRjZ04FRD6WIE7x3IURn+REvITStNUnWuKXZr3ZLpoM8+mYyUQnJITU
         S8Iw==
X-Forwarded-Encrypted: i=1; AFNElJ+R+V5OdkWct1ExGdXXJU4XPCwNXWAMyauArMIICu6+O8pQfz7O56dnkGqN/AjeDiyM5dp64ALKqpi6@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqwHW7BixrLJxWBGsSL8WYrRqyBsOyAPW40xQ7MAkE5o42BAS
	FdwlPFgKQRk5b07dkwFO9F2aMbeRxtY5NQUXMcFRtpDujSafU4kdWZt5vwfh9SP2kw==
X-Gm-Gg: AeBDievVRuzZNgwlj0bCUxZhOnpYlbbW2hISZqKHMFcFpzBiyM6+BUJ4hBb2/gxpqBw
	MW7rDS7u9AxikMKwMWkrehmymGxK+EYGOQbxjwlChnrdwLpFSY66Lo378cp4A2h36sqTifR9hmx
	O2PC0AdKwvH8aKBctnIdCgbzp4aqLZ4y1f/yMZlSfa20p+6dhTlABo2DC3eWiCDlmaTEGQgjDMQ
	wkOXJffHEp43hsAgju0msS/GcDIGHpCCRP4Jk8W+DIMxOD+S1ujmshgahrXSxExXs6YpyvxjGey
	THlQXP5cr3DOQQ+Y+UNIYZPARCRwKPnIuKVTIo6ON3qpIDM9K1Zw/WBZRduo2JoKWuEmLc5P/H8
	6Bb9myHFEi7NpZ1SI0T4evMg7FfQYM41lEbmtTCq1olFqLMDIenY4s53pFIlqlGnHotblsx3hdN
	dI0WzBH9Bf5l7o8cXGm2cb6i8D73FquJob+caAugpfjnnP8nh7MpPB9PcbuI5cDGzotnyt2sb0K
	lXDheKiLNC97tOLrlxvpLwRY5BF4w==
X-Received: by 2002:a05:6a00:391a:b0:838:a46:ce96 with SMTP id d2e1a72fcca58-83923d96a0emr2448390b3a.27.1777976085583;
        Tue, 05 May 2026 03:14:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/16] arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
Date: Tue,  5 May 2026 18:13:59 +0800
Message-ID: <20260505101408.1796563-10-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to top level PMIC node
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f1ff64a84267..0b9fedac842c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1312,6 +1312,23 @@ pins-report-sw {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&pp4200_z2>;
+	vsys-vcore-supply = <&pp4200_z2>;
+	vsys-vgpu11-supply = <&pp4200_z2>;
+	vsys-vgpu12-supply = <&pp4200_z2>;
+	vsys-vpa-supply = <&pp4200_z2>;
+	vsys-vproc1-supply = <&pp4200_z2>;
+	vsys-vproc2-supply = <&pp4200_z2>;
+	vsys-vpu-supply = <&pp4200_z2>;
+	vsys-vs1-supply = <&pp4200_z2>;
+	vsys-vs2-supply = <&pp4200_z2>;
+	vsys-vmodem-supply = <&pp4200_z2>;
+	vsys-ldo1-supply = <&pp4200_z2>;
+	vsys-ldo2-supply = <&pp4200_z2>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 };
 
 &scp {
-- 
2.54.0.545.g6539524ca2-goog

