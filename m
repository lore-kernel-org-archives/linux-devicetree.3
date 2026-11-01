Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559476;
	b=SGwCLaNpZ05ZolpzXa9n7O9SYN9TtBP0cYNeU0otW2+kkjYwiXlj7koP74cnGQhJVP3M
	 BIMhaJjdraq/65Q6EouhHwvq8xPfcuzfjC/YpQ4qGro+nWYczg8/rj1KNRIMotAkPMaIJ
	 4rdHoTwsFUfYpJzD2tMFvzN3/3XI20Ue6t7C7hAFf+GCaNeSvlxztZ9vdkmfErMprdLO8
	 GncTMOXK9JnKb1xYxSMYBGQW3McNWM10E1gIBZY57kku+99Oq51WYLai4OcBYEE+6+PSS
	 5VqTtwOjarQX0JRIE3YblvLBLFcSPXp+ztp/p/c327wkvQFhhVKG4HJ8YQkD0rUx7uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
	b=k7CEizEUeLuyuT9zrGbAdNlKI2auC1JhUz2a7sqV3DDLXbGgEJdL+Yse27b70j1sX6uT
	 gGDLrK9McgpXlKiqrCWi1ymUdqTrgFbaNHdAHTWAa5/nObbjMvS6sZ9/jkXgrowGDtqc6
	 6WLYkY+Li7UVdx0/Omy7lKmN1lMbTmsDsyt2oElHWVFbwewjOEe/yjPadlSOAQxffk/07
	 h8NynzkAJ/aqZBG3eKdbPEbWiDC/Oji5NC4D7x81ivtpjgixpBH5XVTr6m+jbdphrKz/1
	 VkzfAkxU+pfnAgTw58ratEmHICBA4wN1i8v2wkGfuQv5FC/TiuqrH+fv9hfs3dYMy2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNJjLIim;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4ED60A260A
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 18:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F4ED60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNJjLIim
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b118bea471so10547727b3.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 10:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559475; x=1794164275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
        b=tNJjLIimv8wm7BuHs9s98fHWfd1IWCG/jbL677FOjvS8ts+D+tHUYpli7nfChRtowP
         3s9jbQDyWZBOYMsGXU7Kx44dS2j9QS9xCx2lS/ietnJCv0AsuU6hsAx7uBRPLPwBki5p
         9pQ9oNvfj6mk373axzydN6pPZn7f6Hrrgx08ODC2GpRK0kpD274ICfBw8WvIfvc3sfIu
         dZWdwITRSNZWceEzlehtVPs4tnLb/7NaM8lgxuBFXxwEtjUYrgscOycL6nPsZumuUWXY
         zhDqGyVncstuxq8HUJpFK/qJJNOCjzQXtun6C5DVhE01V+x5zjwIkItm/SsfApOgis0F
         osPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559475; x=1794164275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
        b=b1Kb6HKAn16rngmTrhKcDhEpEKJFp6ovCRtD1ullkhd0GUSRPmu1wc4gBIMdUkZicS
         683857jOUmgra9o4wTlkEqLqNGgVaUUCIX7rx1nZIWx+rwbMaZhH3oDBGw/J4FjAlS5J
         R7BfUVgO6YrsyOVycLbBxgJijdUc9iHbLz9DY3fLkFuh8KHk65N4lfMvJSGIQAHohTES
         7KSBdgV+o5vsZUUDFPSTW+Ofh1ALddLh779tKo+I+cP6k2AD6x1jCk4lQPC8HlNgUU2O
         PUp+knmByuvi85IzFi4Dyck5TnU6wYPNPR4sfUkzLJ/35usgP9Ab+LP4/pU3KqVeWMzV
         +zgg==
X-Forwarded-Encrypted: i=1; AKwUvBzEPyWgz3KACSfbNiDL11LwZRWDLaLZEiYOrjQI3H/8RXDG0JEncOIZaocF6gZ6f+Bt09r8BYNgBNiI@vger.kernel.org
X-Gm-Message-State: APuU4Z/rYJfdJWQ5UTRn0WHJkXYxVmDZS7FR2JCmScz6MVkkPxowKwL/
	wZWgg9+uE30Jet+z/yupo1Ms92RP+qshrINccCIzTEH7EiqLfdVkEG6L
X-Gm-Gg: AYBFou02lcgYhiikMT3KkLA5DaSimCQyc4jszCANW5gEySKJVY4RDqEgTvc44OcA3e1
	F2l2lkC1l8jSI8U+d513ZDyBg79ODSLoFbbNbs/kuR+4FyoYkhWymd+nUbse2uTjtBNhaERfzz0
	oBQ4b5Hm9QSef0y/leu2X8PMM8EuzYhW+AMapA4F0FsTRuFNLOZC7dthimg2M5cAAwTcwrHQiKD
	9tpUAfhj6d8LRIPy/djBCnRtrwwslqonk3AVaNWBOz05YnHkwGHApg1mDxp8FAxoioSGSmQ+d+5
	sjZLrX7G6FHLSMTk3EFF+k8SpT6UIvlpf3BMxcBB7TA43zvVQiYHkDUvc9EKCcEBpzh1EzdBvS2
	oqj1zs7uqFRn7DWlmv5KORjDYnYHkT9/3/okgdEb6gOhot3uVCwaPzaeW1NVOKAKrKIIgkfU5fl
	YI3kYXzYYRK3wr7bda4EeKXk9cVaDWFEWvcJcF9LxyUxp4shFSqjroqv+CUw4FQ5nA2KfCiEyio
	uoednutTsm7Y+keXd8eBDZNzDO8+U4mwT0Tgn7hfNSo8O+CPU7ncgFeJPiEb54MHKR9YaOwUL+d
	Z0SBDNeOOmW2/vnM8E0Tq8zoweN0sMAuwy08EXxRMKBiuQZNqcy1gjyEcz9ssG/jiJ4=
X-Received: by 2002:a05:690c:1b:b0:8b0:dc77:6b29 with SMTP id 00721157ae682-8b2b6790179mr69509227b3.55.1793559475269;
        Sun, 01 Nov 2026 10:57:55 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:54 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 5/7] arm64: dts: allwinner: a523: Add message box and remoteproc nodes
Date: Sun,  1 Nov 2026 12:57:33 -0600
Message-ID: <20261101185735.762559-6-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101185735.762559-1-tcmichals@gmail.com>
References: <20261101185735.762559-1-tcmichals@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the message box node, with its four register banks, bank clocks
and resets, bank interrupts, and the XuanTie E906 remoteproc node,
with the MCU CCU clocks and resets, the RISC-V and SRAM power domains
and message box channel 9.

The remoteproc node is disabled; a board enables it together with its
firmware name and reserved memory regions.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- Message box: all four banks with their clocks and resets; the DSP and
  CPUS bank addresses were swapped in v2; remote bank interrupts
  corrected to SPI 181/174/205
- Message box: interrupt-names
- Remoteproc: debug reset, RISC-V and SRAM power domains, one message
  box channel; the message box clock and reset moved to the message box
  node; reg-names sram-a3-0 and sram-a3-1
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..316698b999c6 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -605,6 +605,31 @@ dma: dma-controller@3002000 {
 			#dma-cells = <1>;
 		};
 
+		msgbox: mailbox@3003000 {
+			compatible = "allwinner,sun55i-a523-msgbox";
+			reg = <0x03003000 0x1000>,
+			      <0x07120000 0x1000>,
+			      <0x07094000 0x1000>,
+			      <0x07136000 0x1000>;
+			reg-names = "arm", "dsp", "cpus", "rv";
+			clocks = <&ccu CLK_BUS_MSGBOX>,
+				 <&mcu_ccu CLK_BUS_MCU_DSP_MSGBOX>,
+				 <&r_ccu CLK_BUS_R_MSGBOX>,
+				 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+			clock-names = "arm", "dsp", "cpus", "rv";
+			resets = <&ccu RST_BUS_MSGBOX>,
+				 <&mcu_ccu RST_BUS_MCU_DSP_MSGBOX>,
+				 <&r_ccu RST_BUS_R_MSGBOX>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+			reset-names = "arm", "dsp", "cpus", "rv";
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "arm", "dsp", "cpus", "rv";
+			#mbox-cells = <1>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun55i-a523-sid",
 				     "allwinner,sun50i-a64-sid";
@@ -1144,5 +1169,27 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		rproc: remoteproc@7130000 {
+			compatible = "allwinner,sun55i-a523-rproc";
+			reg = <0x07130000 0x1000>,
+			      <0x07280000 0x40000>,
+			      <0x072c0000 0x40000>,
+			      <0x07010364 0x4>;
+			reg-names = "cfg", "sram-a3-0", "sram-a3-1", "remap";
+			clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu CLK_MCU_RISCV>,
+				 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>;
+			clock-names = "bus", "core", "sram";
+			resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+				 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_DEBUG>;
+			reset-names = "cfg", "core", "sram", "debug";
+			power-domains = <&ppu PD_RISCV>, <&ppu PD_SRAM>;
+			power-domain-names = "riscv", "sram";
+			mboxes = <&msgbox 9>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

