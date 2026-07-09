Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CD0416CFF
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596027; cv=none; b=kIDNp0nnqgViKjdMF/pN8/hBVUd3QmmBqGpvEmkS8Kk0QRVsIwRYyxaAHzFEic0EUvw01T3GqLKXxzdV0Fes+dwTbKdj0AIoVRx9wPI8Rg+hU3zZ7P93Z7bj2hIAb+KTtDuU6aOX7s/sISv8mlfnzcSIeD4q39/7tW+tga35sKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596027; c=relaxed/simple;
	bh=zJUsq8hBqUk3DkfEzxLjaBfCm9NZwOgMgh6kqisTHJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yo3oInSMN8byT9dAlirc5Izercbq7WfyZbfHMZrCdPMawypTUlKZF18E/Cz3BDwP0IDlTNw70qGBIlAbBtsMMw2rn6sYtBwZMojI6gMdm3891bqeuFwSDW40iK155N/cilv/bT8g0O+rKRIRb1x/J6BQZjtGrjFk52EWKErmeWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=smSusoIS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="smSusoIS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bab44440so5076995e9.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 04:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783596024; x=1784200824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TE/86mbnkjdeQ/eUjLcxECV2tO9a4hCqlVOp6ra577s=;
        b=smSusoISkVX+jL4XIJmaGMhWtu+f/pYeXkgC/+RAT+bnagRX4HRUz94sNmq6iouvOr
         NHp1TS1CSaQDYBvWapijcNvXVhDSOpMX/QKM0ugjvSJsPTuezeONEdyUUEfS5RxxyXDM
         J1YBDGE1EFfydirQz3pfmfGCmksGP5M0fGsD0Kf8RnWHqoPvE71eXTlDrHFNbRB2Gcr0
         atK9x91TahnvbCZl5DtrJNT2GkPTT+81YKWPFZsIM5O9veGhAQ9pncSPS9JCoeDTv8Gi
         3EiN0Nw9B14L3CM39tp3TmLGIuIGvLj2WAI/mcQL4A33Uzv+mhWckkN1yS4ag7q6aUzJ
         bxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596024; x=1784200824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TE/86mbnkjdeQ/eUjLcxECV2tO9a4hCqlVOp6ra577s=;
        b=nXV2ZwV6joANz/WI4L3yyzO3QW3v9Y3/o1pc9I9r9scrdar503MmrmYZs3RV4eB+sl
         5/w/CgpubruEmqzykyRu7jgQjfPWQLdyC9Lby0IHydETnUmDJyXD2A3PkBt6xEj95tcg
         oxPu3bx3JMIRI86Bye98B1hg4g9WNT4PSy97gBA3OSRYuJaUSyJUCCnD4x3ANyosGy0c
         39yLoB/FqDcBf7Fy4/MRsaEapFmBFqOMxLXFANk6Pn3Qn70HNLxquWPDCWVWr/h5cFVJ
         C2fVxQJmbPIOXmjI3cqGgnObPMK1aQ2uV6TCeGy8pEcqq/c2PTtjkM4P/eLDw/eOfyq2
         ks4A==
X-Forwarded-Encrypted: i=1; AHgh+Rrflco/Omn3pEhnIf845R5fDTDbMS/rC42JaIPhrfkeyXsnyPAMmCWiJDH1eC5/wQJQmK09XinMuDzr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdh+ETv2AAJcTAKGK4mdb0mZyrc9FUPtpsNk5Ci/PEZ62zZz/K
	TCFnealOKKf+C3si5T7zDKl+EoJG6W5S1erZC3kmju9EWHIBHJug/zq3jpyvmdg+7JY=
X-Gm-Gg: AfdE7cnUzRPBFsELakh5WalxrA3jFM5qG9HgEQD8URX1oBvM4+pftj9T/2rrQAtVp/h
	VJsib4YAYGML1hIjpIw9SqZJXEeDP6iEJ0qwBuPt4OAj/WcKWQYOXfSy+dpdp2wyXOjRseIYJLV
	b8yGJ7OLyIKnfm7NODQKM5jwJIHKcM/wABNFAhVwxJJXpOVh8zTtDXd0CSm9yrZ5TRdyT1XHUua
	5yy3/C75opWjfejbRnDNN6Y9RT+GNxjbO7K40tcIP4LlO8b+hG/FL4C57AkQAc7SWpAWe3rH/HB
	8PqGIJjVWWBzHOAO0A9Lp2KR+30TqMB6h4nmdFQAH3ykPaRNnA5Q/yhGOpHaEn8Vx2IjsfGLukJ
	5FThCmzjc/okxtlPSSfd+FidyF1Bqh5aX5iUaHdWHEfExWWcOzshnjiQ0SYNioIY0v23LgUjIDI
	jNez2idzydeC58JF2p69q574p6r4YKrEkZXFym0MN7Po+cUY/homSfi3c/cSy+F9vbvp7+p8sui
	sp9zFRsvYWbIXpEvjVxucSluIPCle5qwE1S1YTzHT4=
X-Received: by 2002:a05:600c:5303:b0:493:e41a:9b23 with SMTP id 5b1f17b1804b1-493ec561411mr24840465e9.1.1783596024101;
        Thu, 09 Jul 2026 04:20:24 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm53910475e9.1.2026.07.09.04.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:20:23 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 5/5] arm64: dts: microchip: lan969x: add QSPI nodes
Date: Thu,  9 Jul 2026 13:19:11 +0200
Message-ID: <20260709112006.390742-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709112006.390742-1-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the required DT nodes for both QSPI controllers.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Make it apply on top of next-20260708, as SDMMC is not yet upstream

 arch/arm64/boot/dts/microchip/lan9691.dtsi | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index ed997d87dd09..a8541c6a098d 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -396,6 +396,39 @@ clks: clock-controller@e00c00b4 {
 			clock-names = "cpu", "ddr", "sys";
 		};
 
+		qspi0: spi@e0804000 {
+			compatible = "microchip,lan9691-qspi";
+			reg = <0xe0804000 0x00000100>,
+			      <0x20000000 0x08000000>;
+			reg-names = "qspi_base", "qspi_mmap";
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_QSPI0>;
+			clock-names = "pclk", "gclk";
+			assigned-clocks = <&clks GCK_ID_QSPI0>;
+			assigned-clock-rates = <100000000>;
+			dmas = <&dma AT91_XDMAC_DT_PERID(1)>,
+			       <&dma AT91_XDMAC_DT_PERID(0)>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		qspi2: spi@e0834000 {
+			compatible = "microchip,lan9691-qspi";
+			reg = <0xe0834000 0x00000100>,
+			      <0x30000000 0x04000000>;
+			reg-names = "qspi_base", "qspi_mmap";
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_QSPI2>;
+			clock-names = "pclk", "gclk";
+			assigned-clocks = <&clks GCK_ID_QSPI2>;
+			assigned-clock-rates = <100000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		reset: reset-controller@e201000c {
 			compatible = "microchip,lan9691-switch-reset",
 				     "microchip,lan966x-switch-reset";
-- 
2.55.0

