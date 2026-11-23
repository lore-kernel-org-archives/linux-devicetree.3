Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445649;
	b=Wwd5LEmT3Dn7YmS5stM7/WACA1AFkRv+xYLc8DyL2x4sI8CRfcyOog/6Pn8QDqaHIxd/
	 79LzHf0JXFUXwFi91nYTQmO5HQ4ADqZI50puSH3drxoP6Ma1KaTMRm0zDQnKJdjChExWe
	 rfxsqz+PH0JJ3lfHmOU6+YK98hnuOXJQ/WGG34RciuR98jWUiRVslXznTmv4YheTmRm0t
	 hXmbPawgG/wDgISoFfmOgYIovr2IsM2mOvu37X/XDeaw9QkQVq0KOJnhuI9VlhSiFKny9
	 90T/G8WvQF/DhlfsTgzUTk9KWD9/DimVxIk36/rMNX2QOcflHKD0z71HUSQDCyWB52Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
	b=f4R1xiTpe4QlWvpFu7Gn7LZd+zr2zRjOydnFLX5O1YadcpRnvk6Iw8ZtLhPNBn1nWOGO
	 j8Ot2Mo/b6ELD2kjz9RkKsSk3TLc+zBd4lW/RUqZ3V12mDM/GTjnquvwZ8e4rei/+7Fhw
	 LPIxRQSgxpEjMdUfKOR1cv7upDSetIG8E81Hrlqt6nXsJoZQS5qC7B3e4DyuAAfw8c8K8
	 8ZJFQdv+qxLyNhC5v+faFP6Xbj3L/6VMGdVlX1wPw1Y/HYpXSGwVfQKncZf7aESaRET0k
	 I1kULEz8AKIXybaIzd5muV0IpTLr67vS/mcZ95d39uFvuQkLrxqVBlHS9wYtVZlWfaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZHm8I3Rl;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8DD60A2637
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B8DD60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZHm8I3Rl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso33094715e9.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445648; x=1796050448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=ZHm8I3RlPULgupz8zhDeBLJOtUroOq1eF5fwGhlR/FevpHDlyFVhNHnOu1bYZWhiPf
         99n1B3FA73S5Jifn+cYwa0DOOKKCQgjKC9VVrfKUA/gnXFtOJwH5crYBb7q3bgfWCuqN
         CEXS290uLgButbzC0JcaHHDLZvZ5OjYySbC9T9bauGm65dLIcdXXSglpFk6NiW1tk+wO
         rbLXvEabhaVAQv425dgRqkf/9FM5u69Lk02l2VdzRYqTuSGj/Oeqoimhg8d1ZamyuXqr
         ziNKhyXxj9AFKGvliUYu7VlF1KVJVfCtAqmId4qmAnVaFRawB6jjZXPXNqchSLUHF8ze
         LScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445648; x=1796050448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=M/rpOJDu4ZVn0fY/Pvgof/dzXUNeG8ZCobaru4iCsFrqUvuVjfBuMoV6xqg+BOH6S9
         rcp46FYjNAkAw4AV5HSjTUZbc7pTwgCKJhpww5wYR+WeJ+1IJZ/YflO2rlGzft8ORPhj
         XjryH/R5VooQPmY797svMbhp3Hi7p0AZnmYPGP68UpxyrrJprIOUTkEZT2TM7Aq/nKk6
         PF3ZDS3EMCALwUDFLbeJcO3SKX9w+ZcW90UBddNlbXv8tBVaLMRhtjOrpAY8wD5w7yQk
         0kXtnftC1yq2A1WWi5M+WDgA+lo0aonCg6QattVzpoKlrUZqKSGlSgE/Cbf0f/CQu7Ut
         5jzw==
X-Forwarded-Encrypted: i=1; AL+hErFO2StCTIIrfcHwxv4hJO5KLX2RbPgwZS3go4sANQg3U/wu5ciyN/CC6VlK/aUsWRU9cu0qET6jIF+g@vger.kernel.org
X-Gm-Message-State: APuU4Z+msGP00bAKWbAqNQK3OR+6yKGlLpSikgmePr9UOBpNr5tMtNBx
	Ha5uB7Cc4/go7OFktXbP5BR7U8T7YBYR9H2sFbNwM6MDNdOdXDrnXXrCSl8fzLp8u9M=
X-Gm-Gg: AZFdTZccf/em3lhbIY/Z0g73XvwhUxViqGI4qeWdxPqgBlb/kLQVjLxd8Ttg9XliLM1
	QDX5Uwjffty+LnzaJX+8ReK4AGqYERqvPEyXecPgeK55E2gDZWIFGOuJTHwZjEmcDCvuqTVBv8a
	6JQUrJtGHo8GYmROUQcYaTt/V4lTrzoEggWLHFisp+iAH27G6SZuo8dINRQeFaVjlSm8Nmm56Ba
	SDpqaYNl89NOHzBLGdw16vY/UKLF/EBsxdTCdCMl5FPRuNPhjgaUQ5k0/qi7AWbswca+WkF4vmg
	5z+G4ecrDt7SKW9eNpbydaV/4nR388I90Gk1sd665MrjtKaKMENaMAX45WkutIQA2t2SIhSc74m
	Z8zkPF7gevCNXa6IheLvM3MvZmNFzFc+0mupkDv99ImxPtUEsmVE4ZW3mnejTxAqHNRFZcScP69
	HH9J0DR86gCHH7CtxjC2iJeHWToiKI3CsVRwQKlVXITNldNy1wW1/7OC6EZGF0d/kEGJnfpTDiY
	Hi8fKxJpGkeIq6IL+HjGa6TbLP5tvm1T5D8aW2BdUdWlJBiBc/RGqYlXkX1fAYV7dDh9l67KMUJ
	bGwH9ySZhurf+Dysb0abzKTSTYhXU2tltxXYbqH/VABcVDdl
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr287799025e9.12.1795445648030;
        Mon, 23 Nov 2026 06:54:08 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm422624865e9.6.2026.11.23.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:07 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 26/28] arm64: dts: broadcom: bcm2712: Add the 40-bit DMA controller
Date: Mon, 23 Nov 2026 15:57:04 +0100
Message-ID: <20261123145728.29082-27-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

BCM2712 has six DMA channels (6 to 11) with a 40-bit address range. Add a
node describing them. The axi bus already describes a 1:1 translation for
both the RAM and the peripherals in its dma-ranges.

Channel 11 is used by the VPU firmware.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index edae2f3584a8..7ba0fc540257 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -676,6 +676,26 @@ iommuc: iommuc@1000005b00 {
 			reg = <0x10 0x5b00 0x0 0x80>;
 		};
 
+		dma40: dma-controller@1000010600 {
+			compatible = "brcm,bcm2712-dma";
+			reg = <0x10 0x00010600 0x00 0x600>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma6",
+					  "dma7",
+					  "dma8",
+					  "dma9",
+					  "dma10",
+					  "dma11";
+			#dma-cells = <1>;
+			/* The VPU firmware uses DMA channel 11 for VCHIQ */
+			dma-channel-mask = <0x07c0>;
+		};
+
 		mip0: msi-controller@1000130000 {
 			compatible = "brcm,bcm2712-mip";
 			reg = <0x10 0x00130000 0x00 0xc0>,
-- 
2.51.0

