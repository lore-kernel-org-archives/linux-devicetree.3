Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721619;
	b=YVbl7pd3vWVYok9DP/XS6ch3ZdcFQO21zjdWQqzK1GDcCRdtRZDJcaC3mw+cXzJj2n/S
	 c6sQ2PLHMAhtO0pkyRhaon6gy0HHszeTpJKoJGRQCy0XXxP5kdnsWCNVP3swa+K6UJyO6
	 0oy4M4JfCdaiG+pfYNwZDI/d2F6Ih2XwzQa8+NsY7/GvVtvhr9gZAxsD2abNtwXBcoihx
	 6Pc/LbIimx+6EfToSo4ad0aLCVwdfBU1KGWtPC5UtctgRH9bY42kqAIeoKeXDJckbXnAM
	 lAhAV8vXcaGmWEuVchOeZDib7LPfo4dGSy3Wt0a+TjtjiVEDLQEt9gMBDdU3/vNyc7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
	b=Rgll2Dk9WDIji6FsvZgI4euajo3ov4pXhlK+SDyj4lknwHYGKE81ktpBLmuCwE2XuNt6
	 7bOkCDiS6om+QbBEl1O4l/oZxy2rjJUtf8XswQj1aPPKdFQc83e1ib7IvUDzlG0+2mn/c
	 p9JYZp/P8cOybXid74AfOdNZPUaqeylAKwqQuaWuKF/uvdA4sBCleZ41wzh/Fo4U2kP7V
	 51o+3tO+A5tbZu+peW2+hoFROc4T/NmPU3TRI/KimOzajwEAp9CM8N42xbiThIZDHj5H2
	 JXgT8C8a75CLwCTnZBzWDkvm/wuaqr2GRzWLxwete1QuU+agynGLd4pHTl1n72Zoyug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ES1hNiPr;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DAF606A330
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5DAF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ES1hNiPr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb606491faso39213065e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721617; x=1796326417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=ES1hNiPrfToNYalQi4c40LaWthhVZxy4scVR2l63wZtJKIxdY1D5M2KwHrF6oKtmlH
         V3TjvbVd1mkB4xh6yQJm42Q/wPpNbD2ZSuFuphz4Z7N0PavXu45QmBQdcqkhsbT2oYQg
         KbPVIOpPlESEvKFctcY6zUq2SrbReABpBKBy/qfxfLrStYRCc7Vzj2An/B1ufQWq3m5n
         cnqy8uxI9D81An3FC3C6f5dgLibR+tzjapX7CvUAZUQV4N8yoXlQK0+cWIhmnZmnfGo2
         2y0D5xEGF0F+7UXrb5Vh6FkXv1aTKLAWkFKPZSTwbgUx2aAXGZ7DxfxKfbe4ycSJ+9ho
         OAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721617; x=1796326417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=bWphQjGzbjQ0pLNcWcCAF7PcJqdcw3JcQmbT8BvUFuXrJhYQcTrpcqAQFiBqHFK+tj
         kwEb3Rg4oNo1p46i128iPs7Q/bRC5kNm1CYzo0BY4/MLW5s3/B3PDJ3azTw1znCQH/p1
         3+C+ftIn9hYpGSnskxyTQOST/9kvzWuIlc977oIuxzNfgke8QGeinpZmCp6EwslFdh/m
         g/VM7RlV5KoK0dfMngZ8UplUCoQqb30ZVd/hXTZ5RAuPVjgKGKIu7sxbWmlS3JojNOwA
         Qvca9ky06ts2xqAiXJYXEggfXzth56GawAZMB11kc9xwW2Ad0LNn5J5qbPrFBldtcpyO
         jegA==
X-Forwarded-Encrypted: i=1; AL+hErGS5DZhBZ1f2MxbGLnNOtE21y3VUEJ/KpCyH5LZFUYqZB9KJNjhcbjlPFCadtVilws1kt5uyDtdZH5q@vger.kernel.org
X-Gm-Message-State: APuU4Z8/tlROf7+Ux/dl4eDAAVQlN5bmYlxHegtIGg+Kg6JMkwiOOvNZ
	uZzTAE25UvcDpmRCP2/zW9tWIkYD3QaGiCqZ0iO16Z7s26PWzTz9BQlt
X-Gm-Gg: AZFdTZcNYegDuyNY6fyRAprLn3f0HOUPnjKqxVHLzvBOY1ApyuDAi8ggjeJomM/osXX
	JTD4Pr+X/rNtpRN+NEYVf760wOCw8Us3LOr6oJ8R8wYhAtOX8cJk7CoEyzb16dJNZWaxLvHdS0b
	DSeLBf7jlfaii4XWHNDmRf2CzvQdCrJPrz4pMlkLdAYUaVwy7SQeQsPXwvsZfKVaYPhymqXtkJ/
	SBJaCaNRkX4zVdjORMRQFxmGCIftrk2isy/nveh3/8AEWrfVGIqbC8QaRBP8Wv1MAGQHpjYr9KL
	rgFdP7C/UuYwThA2AwZLYXbpWfgSvqssVo7m9jN/PhmzVxAOFk8HwEgfCvmB80g3k/SdoeUl+mJ
	QRtRc1jWmgEZTpr8dOApoRYiFOBWALJfdicHkXhSCP3XiaploeYP5cen1Nr1d0Bjub/IG93dm0s
	eDWGHiRkGug1h+9HiJbqa5JdHV7H8/WfElnyKKR80vJU6AROYW7DhDBsnsE2D1OFPsJ3Laj93BN
	I3ZmUUOmJ6twem3UCTIFxmSzsBTyR2ACxOeK+h9H6qFGgDisVEIx5qS4PYHr/tmCBb1VyIvywY7
	m2fO6drUQGEfBQmOBS7NzavGNfNbndM7C9G+E4ELIi2Riw==
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr459950635e9.19.1795721617102;
        Thu, 26 Nov 2026 11:33:37 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:35 -0800 (PST)
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
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 22/25] arm64: dts: amlogic: a1: add crypto node
Date: Thu, 26 Nov 2026 20:32:38 +0100
Message-ID: <20261126193241.1471372-23-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 6f6a6145cba1..396260b7b398 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -686,6 +686,14 @@ sd_emmc: mmc@10000 {
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC>;
 				assigned-clock-rates = <24000000>;
 			};
+
+			crypto: crypto@6000 {
+				compatible = "amlogic,a1-crypto";
+				reg = <0x0 0x6000 0x0 0x48>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+				power-domains = <&pwrc PWRC_DMA_ID>;
+			};
 		};
 
 		usb: usb@fe004400 {
@@ -767,4 +775,10 @@ xtal: xtal-clk {
 		clock-output-names = "xtal";
 		#clock-cells = <0>;
 	};
+
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <64000000>;
+	};
 };
-- 
2.47.3

