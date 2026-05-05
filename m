Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E64B439009
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984636; cv=none; b=EQ6rDCwKLZzopF/13ZkCLDiv/0ksoJ1SYfSJLq7JN8DmN2W12YXYcg8NNFG3QAGxyH2RiJgyDLk11mKKQkC52QflZ+UuCAFCj3WamvvSAL2WZ3APWHkTZFrR8LtMK38mHz5gM/w1L13qWBImzqOJFHCx9PI5NCSiw5/oa+6PMTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984636; c=relaxed/simple;
	bh=l+YxGbh0vYESNoONWJAuffS4F0yLNJmoeqbW59wLkjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejhbk3TIrAVH3shgWd+rjxwWvn2dKfOZSlXBRL/Qva+WMvnFNSArSJrmaZYKKKvj7+DOBby33uk37mnHqm4zykNYY/ZfO002aQOmHhEgTqL0OIJL4kRzvRGsa+7h+NkOJsoKskuqf05zztn3pOS+7lR859cfFacxZEOX4jahO24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcOpWS0W; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcOpWS0W"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2336538f8f.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984633; x=1778589433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jYwAveFBg+VqPkY5Yc+/WN3dPnzXPR6td9wQJZBOYI=;
        b=jcOpWS0WFZZwH8yYdtM3ZCHgdt3IodEZs+VY6cW5CjHzxN5jmpTp4ydfh/p8TTl6RY
         WdpACG2KAUbJWpKx3FhDUMcSQ7qVIm8ArxuUaTLanmyk3ook7w6kLOUD+zmUVNI4H5gh
         d+iDH15gp4TI8xS4R51LUaG4dpcVpV58KTY5lliUIIqORWf1xBwgh+OoUxleY+sLQSO9
         7TOIlx3FvMgXHaMrHL+A8GQYixOXJSW6VifSIaXO2X6JzNaZCLEDK6kjhiUIuQdPjEWk
         IE8X7WfRhWiuSpu1jXksac5zy0OZTGiu1qvwsHdxTIREEyykCYPMlb/tjjWYqLrB8W+U
         LSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984633; x=1778589433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2jYwAveFBg+VqPkY5Yc+/WN3dPnzXPR6td9wQJZBOYI=;
        b=YClT47aQpGJACMEXYKQq6Iwce9Rl88qh5515rGuv+rJn2PxgeADSa/xUaSS4anohYQ
         47ja1ZE5sBh/k9+XYTmo7Pvb8t9bexMnzY8LR5cRCORZ1pWQunSrHHDlqi8PzD1TcNVs
         HtBAOj78FF02gVaaz0yQBGJRj64Xdy3IUG9/6weL3XqQfB9S+qqBwju6XAyCtI7zbR6m
         EulwhrEDYhA+3v6F0hbZmndRqRd6WFOPD6RvfnDo8kVy1hFBlnTeUrXSRWS135fpG1gN
         0OgElD8Kb+gbjs7BR/2tjaGzzkoYaeMWdFI9voJyxmTi5mX0hsuJTWj6BKUjMlddKZ3S
         fz5A==
X-Forwarded-Encrypted: i=1; AFNElJ/fyH8kTkI61QoHW9KQoYM68Sj5TMqFhPqLaT8okOutTiD3ZH/HQ54ZfeDIB4/4vem1S37xwF+/QLDW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2TgQimF2nbYqW4ETRJ0J+O1ZuEtkbtsG0k+JaL4aLa6MmBQhY
	gWtZjXPrY+Av2zJeJNwCtSVGvFo0JEBPOfx67kMZu2oU8HEOSLtvJUtO
X-Gm-Gg: AeBDieul4f2sWvmvs7xITBaJnudbWuXRIE/EG8AzTRdbZsIK4VhtW3UusHe0LQ6G/Tm
	8gjhU3C/sd0oBlfw5jXyNwnWfXHtvPm9X9Xf82lZm3YJXtbM76QmzB0+0zZgPU9GZO60IACAReX
	cn3KKhFb9NnG7nzBS62fwCX4BJZRUNPUVlkYT2w8H5ldVROymFGfD6x7fbEAqMy4ti1Mx4j8Ngf
	dVyDS9gK983rvhic8xIP7Kf8RiSbdkmejYOBEvxPEROp8SyLc89dg3WJIKWcIogKkmp7AZpoLTZ
	/qCFKrmb0EdbWKNuS9ePSLBcSQVPHf8phPlboSbOhjT0B9xi6VVs4AOu5EJIS6ko06y56zSzQh3
	8C626uDF5Fn1k4ovUppUXdSjE6Yu/PDkZg/rYz3sPbglDwwxBcmBGn1fwQuLM2+1PAdtVQC84uh
	QIE8YuhtZfXjDcrPd0Q9NE7n+GbAZasi/rwZGPzdGfl6skYyd+90duQu42NZuSE7eOl09DDA==
X-Received: by 2002:a05:6000:2283:b0:44f:db87:8919 with SMTP id ffacd0b85a97d-44fdb87893fmr6505204f8f.4.1777984632440;
        Tue, 05 May 2026 05:37:12 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm4703780f8f.28.2026.05.05.05.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:37:11 -0700 (PDT)
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
Subject: [PATCH 1/5] arm64: dts: renesas: r9a08g046: Add DMAC node
Date: Tue,  5 May 2026 13:36:59 +0100
Message-ID: <20260505123708.134069-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the DMA controller device tree node for the RZ/G3L (r9a08g046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 8abf4ec28df1..fa15e2ebc87c 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -482,6 +482,43 @@ icu: interrupt-controller@11050000 {
 			resets = <&cpg R9A08G046_IA55_RESETN>;
 		};
 
+		dmac: dma-controller@11820000 {
+			compatible = "renesas,r9a08g046-dmac", "renesas,rz-dmac";
+			reg = <0 0x11820000 0 0x10000>,
+			      <0 0x11830000 0 0x10000>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 155 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 160 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 161 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 163 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 164 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 165 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD R9A08G046_DMAC_ACLK>,
+				 <&cpg CPG_MOD R9A08G046_DMAC_PCLK>;
+			clock-names = "main", "register";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_DMAC_ARESETN>,
+				 <&cpg R9A08G046_DMAC_RST_ASYNC>;
+			reset-names = "arst", "rst_async";
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
 		sdhi1: mmc@11c10000 {
 			reg = <0x0 0x11c10000 0 0x10000>;
 			/* placeholder */
-- 
2.43.0

