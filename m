Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185746;
	b=OdWiy8gYqjW/OYR47wgxY/v8U0kXbnUVM0svuelFzW0aopHPv2m9jfNhEtU6COlAshh8
	 YuKpYkp10foswQ5TQKjtHvgvEKa1MarX5V9o7mPcJwajMpv3Q0MuYUXJZb+mItct3Hgcc
	 /BpTdAsrEvxckGmtfbFkupVzhNDtWVvvssX5tmDNMk7yxF4s0iQmDbdxULFojSaDVor2o
	 IM2ZHv02abYCLVhD5k4C8XMmvYSholzZum+uZvjRlyTjHVghmqYgaH21S4Wr/7XgharEm
	 8VEliuNkgZlvJ8oIDXf1Xf4i8wfqDoa/IgkL3s5sUHDrjx0VQmV+CNs9O+CbNYLneNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
	b=s3eKPay+PaLaXNOBkuUOzaPittqnTy8UFZWuBIj6nKbomLedSenm3a0um2NjlB4VR5vS
	 cZoMqA307FfYfGAZ0s8a5mZ8A5tGIX8WaCfFfG37qVJVB0Wcyv1nSQ92kRZybiE+4xODy
	 P1bNhywPhudceXn9H8l8/dC0oyi8I+dGNI8Gz71KyOGhCF7rznCvNRcAUejgkjRagb2rY
	 286XN0IuwTAnKGDll+CnqUzDkR7D3i8dRPXBJ2DeV0qY9Ga/hvy5dO4BA5OYczZHULXAL
	 JC0AwfQrOMPFwtRJzPorVzA8vaHz54/MlNUSmQ4WkclKUn454aUTbc/70FfUKAzgGGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XN53hXGb;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED3606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 14:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82ED3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XN53hXGb
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso512524a91.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185746; x=1795790546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
        b=XN53hXGb74WaRLq1kF8RHZti2Bc64/RJ8lMSPet0uZ4CKd0AhsBtFeOUG8R4JKXqmS
         cM2nnvUvD9lcpDvR4digveTQnii3t8CnO7d35a/Vsx7BuJABaDwrAI3LTcFIToZ6o9Aj
         mOwDdSXe4wps2aCp80kubl+LEGqMSZNZ+KrXR3LIVxV5JZRr9iQ3tLTzg2VHt3zre+Dg
         9nAOGZCHGOfuZH17EWv+QVLS9QMryB5/tFmiDCsGQXEPKRRhzy2Sk4lLxLyx9k2vrbC3
         YYi9LKvue4avVyO0vrcwUDhPBWuwyzUL4BbGZVexDfwm6qrm2isnewcjEoI/zk1j8hhs
         nj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185746; x=1795790546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
        b=Ckdea4xVxN7bwF2LV4vuPIZTGvpSDuegn4dnZ77U2hG4c8qWiHXBxcmIiKEpuB/A6I
         vRVI2qLep9hSHvRnJfqQM/rVV7hYNt6o/onVvGhJDpVonORfdM9fJ2UrnMNIq1W5TD3Q
         l7fVIQ7fvBwCPceTIPbXRf04Z04xuN25W5uXz638zwjyfeLkuIriuFKqPS/6aQKIlghh
         a2P/9771WCVtN7S6cP3CX9JWogDZa2Tjghdv6XyCsVH6qLdZGItGlK6HQIxIeYX3z9uU
         LwtZ0NQzHP4Tdx3Lmd7REhMTBU6UfjPi8Q19Kh8YRlsf2zsBAOJLMXuttGtjiU7zkLaF
         jaFw==
X-Forwarded-Encrypted: i=1; AL+hErEK/7Fe8VeTfLIa5baS/7qKpc0rQeXvo4iR02ozkmcjZF4Depotr3dbkNje1gkuf8qbxUjzdlfG71PA@vger.kernel.org
X-Gm-Message-State: APuU4Z+TZ5qOjjsBZ1x725RYWHa794LjPCye3yCADbhbA80rhO7j8CYh
	tI6DB2vkyRitHuV4RooMm9CNuSdmta8jwwCiNiPZDIBJDEkM78vp7uRh
X-Gm-Gg: AZFdTZcTM43/9xuOJmzWr1xH163gG4VJSsOa8Mg73q+03evDQPmKE6QgLMMKqyAvqip
	BA+YFd3+thm0ZXxijoN7ZOetZXQQyPLSIRhSNkdSHEMIzJWuGCjoHlCN3fqqgljY6cpFiffkG4z
	a1Z8SqKeMwuzvMCve/NucWsHv+e0gEJr5NEqYJ4r9F/+mVo8kUNCbyUE+yDoD5Z4kv+nhaOc6gd
	Ef3k1Ai/xbdVuNQBpXMSjUvBZ3u4fMmXkTrhbbLL+XCwJva+vuzQ+BRPi8nE01KrFtSKEDRfBwS
	VC4WBruU7mg5yCugLBQNeKRj8Px3g4wof6c+vHoO9apHEEhZar/pmd1EetJOoIxJJatTK839hnr
	zl+xuiUHnC8u/Ek4UiHaong0PEhgSgh1veIrAC8GiNJ/Ci6Bt13/KTJiPAusBrBw9RcJV+5/ywC
	WrZG2oBYx9sGTK/jSXIObAuV5n6Ye3YOvj93RitY1sp9l8RkO1iZ6KLaHVTDtKUnPwyppUF0pIK
	D71tv/Q4TMNAiyluMMoZIRUAAUPYQaaxq/und0WnfYZG3rnP3bj8i0GyNQ3PipKQ4L9Mgvr/ZAv
	p6XarTQj5S+ZqlQ3ZEO6YedJA/1Ok+QtyrAFgQ==
X-Received: by 2002:a17:90b:1802:b0:3b0:c11a:9026 with SMTP id 98e67ed59e1d1-3b41c95fa0cmr3172758a91.55.1795185745681;
        Fri, 20 Nov 2026 06:42:25 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:25 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:46 +0800
Subject: [PATCH v2 3/3] clk: mediatek: mt7629: add RTC clock selection
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-mt7629-rtc-v2-3-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

CLK_MODE bits 3:2 select the RTC clock source. Selector 0 uses the
40 MHz crystal divided by 1024, while selector 3 divides it by 1221
to provide approximately 32.76 kHz. The integrated Wi-Fi needs this
/1221 source.

Add the /1221 fixed-factor clock and the RTC mux so device trees can
select this source through assigned-clock-parents. Keep CLK_TOP_RTC
for the existing /1024 source.

Selector 1 is reserved. Selector 2 is documented as an approximately
25 kHz PMU bandgap clock, but its source and control are not sufficiently
described to model it here. Leave these entries unmodelled while
preserving the hardware selector values.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index 517c43b19f18..4843bc55dc7c 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -17,7 +17,7 @@
 
 #include <dt-bindings/clock/mt7629-clk.h>
 
-#define CLK_TOP_NR_CLK		108
+#define CLK_TOP_NR_CLK		110
 #define CLK_INFRA_NR_CLK		6
 #define CLK_PERI_NR_CLK		22
 #define CLK_APMIXED_NR_CLK		7
@@ -290,6 +290,10 @@ static const char * const infra_mux1_parents[] = {
 	"armpll"
 };
 
+static const char * const rtc_parents[] = {
+	"rtc", "clk_null", "clk_null", "rtc_32k"
+};
+
 static const struct mtk_gate_regs apmixed_cg_regs = {
 	.set_ofs = 0x8,
 	.clr_ofs = 0x8,
@@ -372,6 +376,7 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_ETH_500M, "eth_500m", "eth1pll", 1, 1),
 	FACTOR(CLK_TOP_TXCLK_SRC_PRE, "txclk_src_pre", "sgmiipll_d2", 1, 1),
 	FACTOR(CLK_TOP_RTC, "rtc", "clkxtal", 1, 1024),
+	FACTOR(CLK_TOP_RTC_32K, "rtc_32k", "clkxtal", 1, 1221),
 	FACTOR(CLK_TOP_PWM_QTR_26M, "pwm_qtr_26m", "clkxtal", 1, 1),
 	FACTOR(CLK_TOP_CPUM_TCK_IN, "cpum_tck_in", "cpum_tck", 1, 1),
 	FACTOR(CLK_TOP_TO_USB3_DA_TOP, "to_usb3_da_top", "clkxtal", 1, 1),
@@ -463,6 +468,8 @@ static struct mtk_composite infra_muxes[] = {
 };
 
 static struct mtk_composite top_muxes[] = {
+	/* CLK_MODE */
+	MUX(CLK_TOP_RTC_SEL, "rtc_sel", rtc_parents, 0x000, 2, 2),
 	/* CLK_CFG_0 */
 	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
 		 0x040, 0, 3, 7),

-- 
2.56.1

