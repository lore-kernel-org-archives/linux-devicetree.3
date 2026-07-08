Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F73437123
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529542; cv=none; b=CJjq6HuKVgSZplKLhACwqSimJ7BAWW8kwInNzrjyOlSlD9eOR7luZEH9Ei+K/104xxg4xzxfQkF81s3e6R+SbzCDEtGbSo9ULcpyv0g4ZUc5DJvwdEOkmwUgleq7Osdpg6e//8URQpEhmYbYMaML9DAZuzlPWt6B/J+R8j22xuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529542; c=relaxed/simple;
	bh=Jphq79UqSiQC6Nc93rtj7TlLiIjWLIsmlAdNMsXhYfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbXvpAnOEDjRUtwxIkJIcagvaPYwLdfkUvpwz6y3gYNQhZ/xnXOD6HwMGpmrT0640xYNnkDTJnO5+hb9QKngBASlmBa8aK7P3eEDY4ql52/hcgCEzUKMIjOZGO6Bf3TdY2+Oljz9VElMb8EzOlZ/z/Rk/G6eIbL6kwe4fMwJrDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=NCVGjFGL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="NCVGjFGL"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so869468f8f.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783529536; x=1784134336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxEnLEysA0x6qP1GhzE2jlVqsDd0b1OoIx2vxLPTsw8=;
        b=NCVGjFGLvDUL/z/AsApBNfqHl/gIwDafa4BtI1kp6YIlFwnm7YYTmA4IBZ1fihZaIF
         i9t6rIVMa8/jmfGgGL0NBBTJB970wRTnFEbA+mv316d9vEqjmoUv1Lk6EVmxUaRtCjF+
         NwSMFK8AYcM27XDYDSYZNQQnKOIOh5TTCFSrz0L73XHXEP5ocYxhke+DZnt45bf/KCPG
         uk9kkMhRiiHMXBFcYABURzUxSTwwuwaosA+umBvCYfbOoES95apFxLrV/w3lnnzUFsXO
         dd+cnj+ehOCRXsEr125XK/o5IyE6fvrtkdLvhKonJRCxv+IOqvL4Kr4U/4FVwvFu7qnz
         ONow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529536; x=1784134336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxEnLEysA0x6qP1GhzE2jlVqsDd0b1OoIx2vxLPTsw8=;
        b=oV2jmpm9iFlxpwE6tsg0f4ftrIxclwzQdPXqjx+yWj4zF2d5o4jGFLrgM7ITMUk0As
         t/7mU1lEIAwyVmV3ylJFEkAwtpfTp0OQW1Q7mCpE4uLUxxyzluJ3dbyiTNQySIEy6rRS
         hcNKPso99T7QfKbDv9zk5EwyOab1JOBwTO11/W0q+b7nteEIOqQHMXVaBVMYjtcDY+VL
         0L0QMhJmd3O2GLbEw/BBaUUYZtXfF1JJdLBAznjWoq83wHZxQNY+im3MMbKR4zE/JcFi
         1uK0cBY/z/IGf9iRYdtkkwDDeBHLqxKX9ZZP2C9Y4tlWQ8DWvXLloBeX1gRGTwmEtgwF
         Ynkw==
X-Forwarded-Encrypted: i=1; AHgh+RrBOJHoxnW0alczQ8x9Ost9+2K3xRx474Wk7Uf33Vl2fyEuYbB687TW74S55zCnqHqbYILzAToTUIk5@vger.kernel.org
X-Gm-Message-State: AOJu0YwIK9lH2aSBk13+sOr0ir9Z1kUXim/mjYsu/7DXg5ogHofJRkVO
	f7B3FbNm+235B4yANkvWwbuzOzojgjuX5PBx6nkqNK1WFrmDht7EwryMmrSrdHr96YU=
X-Gm-Gg: AfdE7cmQlSITMiv42QK9hFr4wLOpNMnjwH/739wugB/j4+zZKToI22QQU2oYwlMhyuU
	lXsdarM96wnOmm3aOwZXSLVLCoXoeLuEqfiOQa+GRKp0gpdmjosAi/U+gQ3e5KKUqsFABfME5PZ
	U7/rIa00jBXzh36F+4kRcUIbw1+P4+I41qE2gtjEv7QwxvwWy09MGC6z0Mn7mtRe4TJNYl3+KEp
	uvYyh0g0fDqWFJGPBVYz4AqELooffEi6Chz0cx7sWn0IcnO5V2U9IfJHcC0Cp7494hfv2llsyPH
	OquSOoLepv57veTB04hyMtUMhN3MHlz7yRZnPYUgNhgDRWG9/YW24W1Zb9FBVzUxv5tlezpzbnv
	Kp3/kcaDbJ5DpRtP9bdQwd5koIJJvla080QOzoV1SaL+ThKyDRY9IuYutKSNk5fPfv8TcrNwkvO
	ro7VkXOzWUA3uA9DwMvyovqEspVv/qgMauwfSU28u9W04N6mgrNx40VFuxFs/bCAK/FGpB9Nd8k
	PjmMIkWoio+LFYov2kG/7TsIsEtXqB5UXWxD7a0oug=
X-Received: by 2002:a05:6000:40cb:b0:475:a05c:c63e with SMTP id ffacd0b85a97d-47df075c7f8mr3562703f8f.31.1783529535977;
        Wed, 08 Jul 2026 09:52:15 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm42902679f8f.33.2026.07.08.09.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:52:15 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 4/4] arm64: dts: microchip: lan969x: add QSPI nodes
Date: Wed,  8 Jul 2026 18:51:11 +0200
Message-ID: <20260708165201.624271-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708165201.624271-1-robert.marko@sartura.hr>
References: <20260708165201.624271-1-robert.marko@sartura.hr>
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
 arch/arm64/boot/dts/microchip/lan9691.dtsi | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index a8679ee6da13..7db9378c60a3 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -396,6 +396,24 @@ clks: clock-controller@e00c00b4 {
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
 		sdmmc0: mmc@e0830000 {
 			compatible = "microchip,lan9691-sdhci";
 			reg = <0xe0830000 0x00000300>;
@@ -418,6 +436,21 @@ sdmmc1: mmc@e0838000 {
 			status = "disabled";
 		};
 
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

