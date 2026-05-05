Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D81481ABE
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976103; cv=none; b=VrWk6UKHvqZCd3SdzZrDmtLVTlHe0Yl9z1oFWqAS/5r1Dxe3B45483hgcf6qHXuzfKFnYDc1dcVq/tzB2AZ7E2OmC9EKevCUegv2s5T9h3d7IWK2tV7YBpqBJdYwrc+eGtRR+PANwsKC3WucgHkPS19LSsDEUx9K6uxctwDwfkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976103; c=relaxed/simple;
	bh=VLShPyQkLfv+DyhLp5xbBcKXslCTljhs5BOn8rHMq6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=us4frKtYUAjwlIcv5QocvDXeDV6zC9e1xYx2TPd5sRigT6sUyThWW07IGRTefEQ0KB/auvKdZ//KdQtu4IKLLqFlxag8IVnTLz+g29lySKLfQT1ts4dfqvWAG11yN6GKLJKhOp18qJC8g8x0Dakn7sm2b28H1mPYqCOXCG1Q/zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dm+KQ4Vg; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dm+KQ4Vg"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c7b9f54d3deso3152261a12.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976102; x=1778580902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCkbLWM0T7ihDsfGf8HM6rffZAvlpjoVa/cZRXt588I=;
        b=Dm+KQ4VgcuWkxGV9WNGKV81CC4rq5ykdDS0oCBCNidHqhplv2jcqM4TckSYTcxhP0u
         SmUdoSLmuOh5OkAM1Wgi+lNDIhtA78p+2zEg8MGhzocEjQdIZwcLOqKJ/hoaIVTRcLUN
         ljOCctQB6NVrtaHUmX5+vGHzZTtp/gLpmPdzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976102; x=1778580902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OCkbLWM0T7ihDsfGf8HM6rffZAvlpjoVa/cZRXt588I=;
        b=TGHBTcPBvGPunodgbFCv8PzU/cWASBlNA1eUiWThPYnmZ1VHUNWrjaLYDyGRtZh6pL
         1j9HUD320RTJGYsDZ+WcPx4ci5Ugp2tjyv5bFJo6XrCDsEe/r73+G4bn8/L3pH37Igry
         p0Pu286is8lsnL3w57fsdRP/Z+0x5lT3whMzR9fUPYq0KHEa3wUIY7WMHWCUaNsNb0N/
         sHII6qCv6JWSZVyXs4+8V1WxWQRa/Dot071w+5+1vB9FHt9WX5F1jAr3G3Sd5b1KgZ83
         Wav9nFC9fl2d/mD0vJ6cVReKrHTzW2yTFqXIfJCIM7QvR2J+FGqiQqG9nbOSZ8DFsAAU
         55RQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ReZi4wpCDgIbasKwa1Vu5eB6ho2NZ7JktV8+NNsflSrB70USE1QvbgGegH87MB8CjR4Ht32WRvMdU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq+rR42yOINLgrO4mb+b4AfI4UWUJagCFtW0pAv8cCAptcUnIm
	k2o6CWLx0lPH4txTzbYmyUIN6WvADTQIjFnRl2OjvN24IuFe6jEVKK0XyuHH2ctkPg==
X-Gm-Gg: AeBDiese6lpQ4EfloqP1FGpaflHJsgtniuBmY00FsQRMv2ThbjHABZ2DSVFXuU0bFuP
	L/dVW1fz29d0Cmz7l4TW6C4UQzKZjzmy0IaBp2cgvJIXGviMCkZSMEUi6fHb8k0U5ZwaF6ifC2v
	Vd3/8qaQEepJTjHTy61QWIs+OkxaHjA19LJzJNqL/asRJx8lmGAB/SWH8Nu4+Kaw3K6jQOfB8e7
	Ep+OVGNLBWvZxmdF5vD2QEx/14MSFKyt6LOPCp+B5vWyWMKlHiLdz/C77YZ2hwpnwti+6RBbu6z
	xipjdl7++g7F+OrwetLyvUC6s95FU+XzorxomLEkFz3BZpScLM8RHMWBf8mKn1sYJYnxMiy0O+l
	q+DoMLqSFq/PglRiFc1p12F9zaYH9IW70W1xco6ouF/8+F/see1cl8ZHarIalPRPP5912mcfvZ2
	KYSwvDrxTMFsxxxsD2mCLJhMls9OTlQiyBA3w4RLg8aVWur5ijMMsHhTTk6KaRUpjRF3hR3chd7
	vWDQyqzrQbjBxpvpSQ=
X-Received: by 2002:a05:6a20:a122:b0:3a3:3d95:507e with SMTP id adf61e73a8af0-3aa3b6279a1mr2621746637.28.1777976101728;
        Tue, 05 May 2026 03:15:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:15:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fei Shao <fshao@chromium.org>
Subject: [PATCH v2 15/16] arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
Date: Tue,  5 May 2026 18:14:05 +0800
Message-ID: <20260505101408.1796563-16-wenst@chromium.org>
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

Reviewed-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to top level PMIC node
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 8e423504ec05..d57e0eec676a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -1149,6 +1149,23 @@ pins-en-pp3300-wlan {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&pp4200_s5>;
+	vsys-vcore-supply = <&pp4200_s5>;
+	vsys-vgpu11-supply = <&pp4200_s5>;
+	vsys-vgpu12-supply = <&pp4200_s5>;
+	vsys-vpa-supply = <&pp4200_s5>;
+	vsys-vproc1-supply = <&pp4200_s5>;
+	vsys-vproc2-supply = <&pp4200_s5>;
+	vsys-vpu-supply = <&pp4200_s5>;
+	vsys-vs1-supply = <&pp4200_s5>;
+	vsys-vs2-supply = <&pp4200_s5>;
+	vsys-vmodem-supply = <&pp4200_s5>;
+	vsys-ldo1-supply = <&pp4200_s5>;
+	vsys-ldo2-supply = <&pp4200_s5>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 };
 
 &postmask0_in {
-- 
2.54.0.545.g6539524ca2-goog

