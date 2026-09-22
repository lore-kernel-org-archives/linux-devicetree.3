Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EBF388E69
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048863; cv=none; b=mihXcnyOvueVg+ZgRBJ39NZM+YGvKVfT5kfSP5gPG+7/uiojHon//5ri6AdJdsY17FB+GdgSr+WIn0/rE1OYA+h9P2PtGZoPPJULxolJOgZsMoJI6aRxpWweJvQiA+bN+HfW44ja1IyzdoAFeEyZoVHIDB/e1dz24n9qBI6xvqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048863; c=relaxed/simple;
	bh=vs0p7aKfRjm32/JARKxXOJKs9GaInGuJp6lBcXmuJBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+7ov2MbmYmV4ZfHxxw9S50N953SfTIEOp2MtsVdY9eNcV/4oQuYL76o1TJ4NWKP9vpL3mrr0GXCU5SyHeLbiHogSF49GN2Qm7iPcQY2+Gs2CKzV5o+e811NM+/9g6PJOZ3jtwIMfVdFNVhjVsEvWtKmWGUkTkCATZvPWR8hoiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVUVX5ft; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVUVX5ft"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d440939f0so28618997b3.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048861; x=1790653661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/zsDmJePgaslWzMD95723Em6EJMVLj62D0M57SSna4=;
        b=qVUVX5ftJF5fLwjFoK8H2BnPZh1XrTMfdJbkP7eptBkB6j0sjxxVjtZqAI3VG3nJxe
         Cnv2UvCVqaUC3NFw+aLiYrQciOLwrcYCR+MX/DKAZcF5SelXUeVzEes77wbbaIROLqje
         /YKb8leEVc96mruQmgKrfZeipo0sx/lO1FYoRiWJEqPJWzzfHD6WkZafRdjLQgCbsKDS
         5z/wyQOIn8F1GedCzQTvkLgKGpksXR5nORvgwWYX/nQEOL/PokZ+EHB/sAorALEFEL7+
         DBPbnqbLq5V6Jma0iVtux+NTrZim5QLMruXPp1sGxjuME4TMu7GUhx9h4cPbRCejo7ED
         vzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048861; x=1790653661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/zsDmJePgaslWzMD95723Em6EJMVLj62D0M57SSna4=;
        b=NOLPuz0mLQlQO9n7+YNA/TAKBhr/WsA+l/bKR3c9tFdcrYFlsvTYloV0fMAFcQazdL
         ZVXpp8+yISET+W6c5pPIIEqudxVw/iRbatENUEeirShjAjaMT9yX8Ug7rVzGL/ALl1/o
         cjI1RYV3QhefrSHg8cBtv8BsLMu6mut0rDSMxPAtYkW5c+sdFoSkdt2sloX+gGBwVGtn
         ypc7/k8o/46ZJfVK0CP7RRIcV8EVoSa5rrFC65PCMJWWOikgLRAFuF88OHKSdBQwbHFI
         AyVb35vvOcGSDlYePcZOTcxxDOLP8k9y0Iey3Kjl5bUMXIdDr30SXGMvgn+h4e3kg73J
         WmfA==
X-Forwarded-Encrypted: i=1; AKwUvBzY9mkm2fDZX2CV5nq48JB7V9dNxkGNs8cQ1kxhLbHQdmW8Cp8GUEb9uoK7P6sntEci+JKvuLkJ6zg3@vger.kernel.org
X-Gm-Message-State: AFuF++k4Rg8PYyVmG6m8ELEf8CszdF05xCWP6fzM1QXqBJrvJPggS37r
	7mEkCRW9e+yFNGa4GE+Yaf1mPRSCU5zfY9qRAnsSA9QSGJPWzy6kONuU
X-Gm-Gg: AYBFou3u/IiokTeaiyS/Tv0heKNrW01d+AfBk9+RiFRKl6NzxNROB3DbTP+6ZMaXB79
	j+3z2lfMFUbxNa0WkNT/mR3Kcvwy7iEt2ECxZ/m5bVQ0Cz8R5+lsm40PKDxGLH5Kxn+0HVl3mSp
	gez+KmYgb1H6/OwCb+0K6fUyAWZ4d3I9Sv1J0q15/d2yJd+ETJll7d74FgqrhmirebzHkmVM5rU
	hqnVMk9gZV4YcX7UMYyIDPE3lpEe6/HBTncYerqDvH28XgIRskTwiEIh1Xx6lpMh2FpdHTvgO+b
	KQfaoDruqwsSR1XvQbm8yLudN5T1A0otmmtyM+4W3t96xr/4Cg/WkbhpIJUZ2fNcPcjzBH4oeON
	9mFw0C9+ajFt7JPXn3GRhHX0LBNZRQPHWpM43Bt0d0P+f25dOf062GZEbRbhAma1R7UfgXCKMcG
	Uiap42BV9u/oPhIC037s4+g/F0pr0TfPHB/AnUDXIFRZvN4Hrniu0W1Mmr1W6cxhPtBg==
X-Received: by 2002:a05:690c:e3cf:b0:88a:4770:c2e9 with SMTP id 00721157ae682-897308f88c2mr50874537b3.14.1790048861342;
        Mon, 21 Sep 2026 20:47:41 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:41 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/7] arm64: dts: allwinner: add a523 msgbox and remoteproc nodes
Date: Mon, 21 Sep 2026 22:47:11 -0500
Message-ID: <20260922034711.190253-8-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the hardware mailbox (CPUX_MSGBOX) node and the XuanTie RISC-V
remoteproc node for Allwinner A523/A527 SoCs. Connect the remoteproc
node to the MCU CCU clocks (bus, core) and resets (cfg, core) to
support remote processor lifecycle management and RPMsg IPC.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..7c5c39c56858 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -1144,5 +1144,44 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		msgbox: mailbox@3003000 {
+			compatible = "allwinner,sun55i-a523-msgbox";
+			reg = <0x03003000 0x1000>,
+			      <0x07094000 0x1000>,
+			      <0x07120000 0x1000>,
+			      <0x07136000 0x1000>;
+			reg-names = "arm", "dsp", "cpus", "rv";
+			clocks = <&ccu CLK_BUS_MSGBOX>;
+			resets = <&ccu RST_BUS_MSGBOX>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
+		rproc: remoteproc@7130000 {
+			compatible = "allwinner,sun55i-a523-rproc",
+				     "allwinner,sun55i-a527-rproc";
+			reg = <0x07130000 0x1000>,
+			      <0x07280000 0x40000>,
+			      <0x072c0000 0x40000>,
+			      <0x07010364 0x4>;
+			reg-names = "cfg", "r_sram", "r_sram1", "remap";
+			clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu CLK_MCU_RISCV>,
+				 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+			clock-names = "bus", "core", "sram", "msgbox";
+			resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+				 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+			reset-names = "cfg", "core", "sram", "msgbox";
+			mboxes = <&msgbox 8>, <&msgbox 9>;
+			mbox-names = "rx", "tx";
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

