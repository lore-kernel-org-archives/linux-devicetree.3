Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123E7396581
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425527; cv=none; b=cxTQecSSxoavUw2k8A4PXgOQw+mTAdBYrshMnkEQwy4Q9vemVRimjswwGz3Do1t0xjIdLqpUwAFAhwRKIRcLaXKMBQiAZncvBnWcxSQt2ejQvz1pl2tEU9YQHbJMzATrdWZRk1+Pmnm2GyEeVGWliK/LHETGAalPMomuaMczq1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425527; c=relaxed/simple;
	bh=N0dkvlUzarRPk1AZnWmDt9ZTQWZc9fkf1MFuZOlscIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFjA1XLvU2TVs/b0u48jw0vmBu8y3xz85kWHHl+PDwcGGJZl55D+iouVndwErGv5lhkn2TbCViSTlaG/XAKj6umx7fD2s0YmAjSGVH559ohsb+2U2CkB204rzYZBpNIF6vpWkn97CjwMqJO9dzV+YaNkBYo0kZXRqQgyRPJyUN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JFblFXLl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JFblFXLl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so20127635ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425522; x=1775030322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylCJHL4jz4SMJERGBRhfgz5hmf9BV/IyctYJz76/DdA=;
        b=JFblFXLlr8G1OfqsDdZXR4R0Z8SmViUiePpDc4L3vVRTd7e3a0z7dn2y/Qjwx0+DOJ
         Y48F5QSWPezQv0Q/s80Yl/9n132Q6S6RGKiUIIuCp75OGP6JLxbzV0LwukgbYT16RFe+
         iUGpkLgyyZalaJ3CQdDb58hj9X0MJ/HVdigDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425522; x=1775030322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ylCJHL4jz4SMJERGBRhfgz5hmf9BV/IyctYJz76/DdA=;
        b=pdMDQDTg0pBJbjUeXobDK74SaIj/KOT47D5FlUejNBXr+AXFZqgpYk6cd2JnjWJinn
         BcpRL9uTt+4zshATgM/7IGQRK3kffOz/WQoXHjdo6exqOjAcBX6GabJFzmvM6FSSZGG7
         6wV8po6b0aTjp2euutOL3GCvCcjUNpyciHjdVLpq8VZgky6wq5K4c1KBS8D5C255H39X
         WP5Bu4xwojE6P6jEp7gxrX+p1IpIHa1jQIObo/PIpX4Fc81nsfT7iW9LvpTBK03IIsCp
         9A7K3TgXCGQ/kRil1+PKCwS1qUN5nYPqRrER/8BXyDS4g8YS4pxDkMtTjM0spBrnp3+m
         HlyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL4ZjNIkmXEmsHi/E+xmZvCqwFdmDozfko67wyy98VtWhWbIdxDWTDvcMXY6h2VbN4Q67bRZCnjRQV@vger.kernel.org
X-Gm-Message-State: AOJu0YyFI1IfoTiPLj1UBvzA/JLyLbEp4XzkPn23G96gBTr7dCrDlwKz
	FpVbTyJ7Ke4jHntrN+cUb2xfQoouR+eIxWPaJnPSLQrSwti591yEcvDYGIDhpMQywA==
X-Gm-Gg: ATEYQzwXPJa/FfqbF9XqDHEYvjXXOR+5LR0i3mH9Pp6eQZl61mh9sTU17osW79RFAtx
	rH+VKOQNJ/EDSE+buPoI6QGYKMdVMsZeyiaUmuFZIqLCy1qQgL5OYrvNQJz5+avt8ee7sm++pon
	+lu2C+oT082+vqIN00+BZi4mxwjjT0E0PgMovKSo+UJELQAuiKsB3pDA8M7oDaiwgeU8bmqr/fs
	G8fQHQQd+UZPFT5mOweFg84II5HMRg2AqCaLf1LKbkP5mVJGCFNpHCw5frI1YkrPeryZd/l/c8E
	+iNVL7Nox+lNjcF0g+ThsKifBavjbGODApd9EPrqO9qOh867MjjDJ1DsArfodS86IWQy2h87cXy
	QYZCsGZmFTiVhiMzORWEGGlHeVEN7GqYtlv2ogxXIae6m9CAN4jRwugt0aHNN26N/Yc7ldCSlWE
	REUWyt4p7jDkXOfsYL9YK36eCKk76wtNfPu5oL8A+lbk1Ib7X1fM51mMajFFScKoaPXeo3y9xWX
	QxrBHY=
X-Received: by 2002:a17:903:3843:b0:2b0:9a61:916 with SMTP id d9443c01a7336-2b0b0a7f831mr28028415ad.31.1774425521733;
        Wed, 25 Mar 2026 00:58:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Wed, 25 Mar 2026 15:19:49 +0800
Message-ID: <20260325071951.544031-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260325071951.544031-1-wenst@chromium.org>
References: <20260325071951.544031-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both. While there is supposed to be two different
power domains to the GPU, MediaTek does not have any information on how
this is integrated internally. Assign the same GPU power domain to both.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 556e806b7787..169ba4fd183e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1002,6 +1002,37 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			/*
+			 * Binding and GPU core HW have two power domain
+			 * inputs, but MediaTek does not have information
+			 * on how this is done internally.
+			 */
+			power-domains = <&mfgtop>, <&mfgtop>;
+			power-domain-names = "a", "b";
+		};
+
+		mfgtop: clock-controller@13fff000 {
+			compatible = "mediatek,mt8173-mfgtop";
+			reg = <0 0x13fff000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&clk26m>;
+			clock-names = "sys", "mem", "core", "clk26m";
+			power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.53.0.1018.g2bb0e51243-goog

