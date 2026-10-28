Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203590;
	b=S6jwdpZh1ofqc16NjYql6aWCbbVUL3U3kkRmZvHoFrIfiEpb5PKlKPmmh/qFoQva3aBB
	 i1hkJ8/sSj1FZl100UaCA/CydFg4Z2Z2l/IFdbhrn+AyRp5+cUYfUwXfroNHzSZgjkzYQ
	 Y/BSpn89biGm9mrxzNyyLXiRxitGTW7MgS1Ks/JSRmP3e9cjXOZFerXbtzR8stKbOrP0D
	 UI6exuyZOfT9Ht/XY8kxp+nGaXKb9Voqb1QTS1w3Ze0vedCzOVnyIPMCx/UVj0Rm5Yk2m
	 WGMOTGmx+njpsdwu8uV7ykCanegY8rRAdcsAZkKHQZM5QaOIdHYxAkzFN5NbJ9eXsBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bmYk/QrXu3XKmbnsirtQOZn7qp9VLhyQk3cehRblGvc=;
	b=4jsGG5VLRVrO0oI01ddOKhtn3YAuFiwf1Mv07mHCtfCNyqf4Dyze2+DX9axyPOErJNGS
	 kH+9Ryqb9Td+yhiRXW9TiLj8iB11YhZWi7w1orMOkL9DBe++oeINlQCqOyFbKjCuEDy7B
	 K67JD5PXe0eu1ntjmsOPYOKh9CN15T/Ktnri/Q8EktLV+QQJAvNwPrjbcieom9iL/E/wM
	 x9vpCMIk8vmBX3RPBrEh1X68AG4XyvTFuZ1SFOLLTC3xG6Rb0cVg+rSXaFxUSOuK/6QTU
	 4+Nyo4XWGCYRBRhBm9WOP1jUSHEPEbZLaa0F3ZolG0JkLaeB3XUJsX22t/Q3JPECrXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="kJZHcB/5";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313B860A2610
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 313B860A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kJZHcB/5
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1468101f8f.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203589; x=1793808389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmYk/QrXu3XKmbnsirtQOZn7qp9VLhyQk3cehRblGvc=;
        b=kJZHcB/5WTqXVb1DvnmzR+CCnNkmEnR16lX9PHOvHguc8qaZsc/8rxdpfiB0j3/U9p
         kSJs2nBhLQnX4YbxVSdBgiv/vvZFj59os9lw+pm03L7/s2IV+ZqLG8AHx01OQjHjnSFh
         AiNYNqYp8I29RCDYTC9YOpPdZYORwfWRzNfH84uaT8yjcNPVIJwVAXMcBKP+lF6E/ONT
         X5fNtFcavNsgFa+0nkjZibrXfl6E7DmNvX4rbLTQJWuVFRZdGDvmzbfVzQtbMUevPJFA
         VYAZ6utGhLxvNvVlSxVLgOC2brMCiCAeDcoX9rd94x1XnlnS0rq/mlylrhUJL2uvuVm5
         OGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203589; x=1793808389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmYk/QrXu3XKmbnsirtQOZn7qp9VLhyQk3cehRblGvc=;
        b=yApmorqU84QBisXhinIbyOXQdgu+F3cnu7RoIREtfxKRKZ0NXiLHBn9frPz2pq9ci6
         VbPaY9az9hAtKiU0WWGBrcOH5QP9cSQTzTPqszF2VhyAd3y49Cw3/MA2ZHrSXwVAvbP4
         Ws1M3q9769RP/mV/OYQFaar9b2LG0avJ6gWqDjXfZN6uxAQzvJFiP2axtWhulMWnCbFr
         aemAVUh9QM9H85Cp8jNWAeXoL8fUXTsFfbA8RDAGt8zhNKLI224yOIcso4dTXGwiOF70
         yzGvpTmrizxvkb43uzLT2Ec1KuN9eu+ccuX4ret+Hr8QdLERBxcFx4lIC5Uk9sxogYDo
         BzcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLr8X/8PQOLTOxE/sZQyvNYoWI8R74Rlqyh964DskKkdreOxQZ4ThOqh80ZGB7gkCNBHmW1NzazQ6s@vger.kernel.org
X-Gm-Message-State: AFq9FYLrIkBfoq8Cco6jlC2y0OSLJEBECwv0xjXAtPpFNNUHt6vTH/WF
	wCATtxmT4o593olTjsXQyaTdZ+UwhTfzc1n0D/rfgLgd5x9hvjj59hlrRJ3FHM/aRTYJbUmwFFl
	z08HXjMDHmw==
X-Gm-Gg: AYBFou24dzyF7UJ/SarfXyQ1HBWd2ZXdonJONNgBEfW0PYyeVxwkHdrJeR2ZwnX2zaM
	RkgHRW5+dWNSYIDgU9q+PIfhfVpxG0/b0AQsTmY84Y/CCRBUoMg71nvlNeQbXmtv+fBbdgyiZwm
	IFqrFTBoucTBAguKgWNmm0kYy9LDI5si8nZIp9DXb0l7WzNa/73T4+c59HkncNJT18KhDuyQw49
	FUYCIfjmt8XHmzrovwZjAcPfZLD/2lI84ZAit1LD24rnCVqfzydtFv7s4oDIi+792kPUT2bEzK/
	fk107QCrFanMI/baSkYAu4Wcc3+NtGGjtl1klP1uqSwDUUbGtI+cEH1VcExa5fa/EGeDK0lvQrR
	H46K+QNluzOsySjAKGNoRIncvVKRWDCEIy9q/hC2a77KTA5eqb2mxyV4czOu3s9C1WSIUgJKRQ0
	hU0Yi/cHsN+M69Asd2O4/ImGQRIso5Igd06R9wqYi6k+c+fK9eUiZX4XatzeCmu0vg46843x++j
	KDOz15tUoRZN5c3AZgkG2rimVdVCyyudUda8FioOw9DPJIgKJDs+TziClfPwfkcawexgf59he6B
	QqeDblRf34wiI9PCwqjOvMgt4WV4OyHba9iowYKj5SlWnRYD2ON/W2AS1KZ3GRwtiOxhtdfPOFq
	ABwcwPFeDbVPDNYxRqe7pWefqBg==
X-Received: by 2002:a05:600c:1546:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4aa86a42518mr551525e9.2.1793203588489;
        Wed, 28 Oct 2026 09:06:28 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:28 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:05 +0100
Subject: [PATCH v2 4/9] ARM: dts: omap: dm816x: refactor and align MMC node
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-4-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1896;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=IkyleFnGyybE4VzcWEWPfLI1Efue7Bk+OPR7RvuZIO0=;
 b=lIHp8XwSVWwwtqhg9KXgnsjTTPwk8NehLG81Fs5GcnUmU5x9Wem4sQ65vOXY3nTuDNjdInMfh
 QOUq/2ATOCpCsaCVOLmbWdkcluBE4eJ9hNEUFz9+CeuBmsqCH/yq6iJ
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Update the MMC node in the TI Sitara DM816x device tree to align with
the structure used in other similar SoCs. The changes include
refactoring the node to better describe the target module and its
sub-nodes.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index fc124f9ecfa1..e3d49651b44e 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -423,13 +423,34 @@ &edma 20 0 &edma 21 0
 				    "tx2", "rx2", "tx3", "rx3";
 		};
 
-		mmc1: mmc@48060000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x48060000 0x11000>;
+		mmc1_target: target-module@48060000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "mmc1";
-			interrupts = <64>;
-			dmas = <&edma 24 0 &edma 25 0>;
-			dma-names = "tx", "rx";
+			reg = <0x48060000 0x4>,
+			      <0x48060110 0x4>,
+			      <0x48060114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&alwon_clkctrl DM816_MMC1_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x48060000 0x11000>;
+
+			mmc1: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x11000>;
+				interrupts = <64>;
+				dmas = <&edma 24 0 &edma 25 0>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		timer1_target: target-module@4802e000 {

-- 
2.56.0

