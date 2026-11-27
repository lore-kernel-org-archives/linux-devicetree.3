Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780934;
	b=DHlw4oztoy2Fob+Z34D8i8QaPgNRuB2H6Z9mP4v1LStmpVIIi5bha+btwlo6fcRYIDvx
	 fOy9TatosRmvztglj/YwfYlQZUDuKT1U5ZItJT4MXAtZZ58RCk776f6DnhrJd55QtPIUU
	 q/GZVufaN0lxjglrro+ES22+tbgU9rbfUQ84yO1bd76BvyjyqBGMwb3bnEAAVS1Lf22xk
	 4EStypFjrIqlk97bSsDw60B7ZoXLes6xvwUCFyOTc2+hIUQeKXd1fmjAo/VgVAO9EMghS
	 Bol8y1uN/L8Bfy2Mq0PRndfElAL5L0+mIywqNSvBs6PtkjioNJzpAOTyJD6xNDafmCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gs/a4DDZkULpkfxaE5kGJ7kgjNQPkZBpTJ4KeEOsPSI=;
	b=QgrtHSE43OQHZXX3eagYtpnOHgY/UV5xDAv8DmjLYfo3VBDQmSB5n17nAs4F5s2mtvls
	 kINNOk7XAFhyl2pgru3cXXGzQQMukA58HpbOGdlHse0q0qj/deXGqqW3UxsY5Ptqb6MBz
	 Vhb0FYLiwMQ5UQpwkmQeqhwqEDg4olx9l2NJxMeBprVd5rvMlbMhJLpbyCGg3Pkav/+YH
	 om/wdTQYNHaxF1rjoj0E+lNWE2Y7yNfRR/rzHPfdX7RDYSngBA56oOVs+FzrW5K19IL9A
	 qjqmfA4tt/LYQBAUzPcQIHJlRBGrNgncKdQh/xs7tO0sh9nFvX3nbXLNsywgCyxCgeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEeSDaBO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5463C606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5463C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEeSDaBO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so25921925e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780933; x=1796385733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gs/a4DDZkULpkfxaE5kGJ7kgjNQPkZBpTJ4KeEOsPSI=;
        b=TEeSDaBOuKB7e8yLbfTESsaV7uZ329NFIgBiFqGf8GEVWnaNCCJ3QyAPmqvm7pJfHX
         qSvwSkmG9yl6ntyMUIKHGEA6lxF/z4uRIF09gY8/faM5Cg9BRRfmUF/JR2ldh41oBMW/
         8HtHwPvpGkcEPWRShgdSDrjfKkXcsnZGtUFEZj8jNuVwu6GDKLNzzXLSJ7su7ClOqp6Y
         rZ+LdwZijz0cFxXL+kMlcUtsgpNKZb94je+OCcYqGRXrzSI/POxxUqyaSUsw5n0AZ9eK
         3SFXIqrhJMg9aGTjlOXjjSRynPaq6vh5lvQMofShwVSSVmEhj/51kkCwRo5a51Jz9xCl
         xrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780933; x=1796385733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gs/a4DDZkULpkfxaE5kGJ7kgjNQPkZBpTJ4KeEOsPSI=;
        b=si5IFZkK9JiouSZfVbEoP/TmP0eBq5f5pIc3P2KCWbNP3fWWYeYCEJ2KhSulRRV2Yc
         MIEnlR2XBdeAL9umfanT95UfBFuIgAEHDfxuvkDmDdgW5bFMO0XK6eUyiUKaQHOH/xqu
         QdSCQ5Tge5jPn9zIqqmqEwDO0hhgwLyDDaftXO9m2f31NXNu86MDL1Dt3OsvnlQ1O8dR
         +TLE+76oQAtumjmYR+c7w6I4u0CpiChmfJBdLgjdX4CDiESzAocPVN7kVNFO2IJB/pjW
         5j1O/m2fnJv5Lcv99g/cy7PmBQIBbV44pGYeK4Qjrnu84kTFI+y20yGReMarVOQ5G6T2
         5LNw==
X-Forwarded-Encrypted: i=1; AL+hErEqojOTtgIBtsTZR2+WRdQWnOMXFeZMDHCYSNiIf2ZVT04FDYjoMvIwN6EWPnOmK1S5hN97Vjk7A3Up@vger.kernel.org
X-Gm-Message-State: APuU4Z+aR6QIgvXWetGFJ82BrNsdXip8O2DPsMkil3pq/6UyVnp2yauQ
	sWiC7PEK48yQp/ZFoomHu1xRVpqEvoVpOtBLPLTKDN/t6/YLky0oRtd1
X-Gm-Gg: AZFdTZfFC07UsrrKsNJmL3RfFck4GyHCRK9mZL35gvKxDx0spnBfOMHpDvnrzX/rBfm
	h3iju9XYAVn5VFJOWhKxtQrtp0tHChbznt2DfL+XQo7DxSbVtOHStOcT4+biubZefUBCnCZzD5K
	zkdw6nHaXbcE38aOK3OCq3j52dwLAbHnxiEtLo2nnlPFOKhoWoLRskV2vWYD8EpMwfpjN8qUvIz
	GCIgkfyFK41+fyfDtNOZr+9oNwJwMCbkgdQYMrqn2YWy0aNocHFKDAhzL7Ln0sO0beE9GpJCZQY
	KF0SfVJyq6y9Mx34hlR3yMa7KElOg8CckvHuebajXfJskmdB7HlxFec2PLyx76xiSD+0TMlMCPr
	lK/i5o+AV8Y7iug+eS+9GBMilA0DM9mW3Opsdx2yZIeEsXlI+LAUYT0nYOcFz5KxpkGIn948O0I
	2ehHMrm4p5646nuofVtViT70lmuLwjRcs+6b9OpUjutYrNaFzaIMEoTX+kGH7vgahCEXbPr5Zu6
	CNGLYVTKq5Bcm3cHRp8jlxms1nh7pIZB1Y6D/BHmiJaXxcKJlXyFM1+yar4+1HiQTO5AGyyglX/
	jyrltYjBG5y5gsbiKwQVhvVwdc0QZZ0ed5zRlSj8gKZhdM8/
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr486388005e9.22.1795780932698;
        Fri, 27 Nov 2026 04:02:12 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:12 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 30/30] arm64: dts: amlogic: use the system clock for A1/S4 crypto
Date: Fri, 27 Nov 2026 13:01:03 +0100
Message-ID: <20261127120103.1532882-31-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
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

The A1 and S4 crypto engines are clocked by the SoC system bus clock
provided
by the peripheral clock controller.  Use <&clkc_periphs CLKID_SYS> and drop
the synthetic 64/166 MHz clk81 fixed-clock nodes.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 8 +-------
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 396260b7b398..1b064c556c68 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -691,7 +691,7 @@ crypto: crypto@6000 {
 				compatible = "amlogic,a1-crypto";
 				reg = <0x0 0x6000 0x0 0x48>;
 				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&clk81>;
+				clocks = <&clkc_periphs CLKID_SYS>;
 				power-domains = <&pwrc PWRC_DMA_ID>;
 			};
 		};
@@ -775,10 +775,4 @@ xtal: xtal-clk {
 		clock-output-names = "xtal";
 		#clock-cells = <0>;
 	};
-
-	clk81: clk81 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <64000000>;
-	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index de173f40e15e..c004ab7bbdfd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -71,12 +71,6 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
-	clk81: clk81 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <166000000>;
-	};
-
 	firmware {
 		sm: secure-monitor {
 			compatible = "amlogic,meson-gxbb-sm";
@@ -631,7 +625,7 @@ crypto: crypto@440400 {
 				compatible = "amlogic,s4-crypto", "amlogic,a1-crypto";
 				reg = <0x0 0x440400 0x0 0x48>;
 				interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&clk81>;
+				clocks = <&clkc_periphs CLKID_SYS>;
 			};
 
 			gpio_intc: interrupt-controller@4080 {
-- 
2.47.3

