Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C718B3EC2F6
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569489; cv=none; b=CE22zZctvxGWtRM3QnoX7upBbUkAaGy7mCw4Q6eQ6FABFht/6fMGLQV9/jAQWVSI1D2f81gUBjXwvCzdrg/RW5dOV6tGBfS+QYeKpExtvGJZOVbWUNx6aRpy4SsxJpJfTkXDqteDXJYYY8nj/t2ByObsS+h0zBGUZGCApraOj7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569489; c=relaxed/simple;
	bh=vkWv8VZf5KbzWdhWzOUZe19ad0YI1y8OxFn+suLRD68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKtkhkBOxYQmVAXxRwVxNF+yCRyT4xgxWsWM7TqA7oTgVqJ8H4L6sqz8IaVx3ZoTNzlz5VpanMTHcRtVmHWt3f6I1mHzB+qUUAydu5VbYu9dsZ6lO3wCvpZJYKZ/2cuowgXK/5wfkegy0LWNquQ2D1tTqnYAIiJKY+4u9ovjzOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=wgUq1iuc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="wgUq1iuc"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1670dad7a8so577876266b.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1787569486; x=1788174286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuCDKY9mXTrdYYrt4yEzUU2rfGaRGeNzZjabp91Amlo=;
        b=wgUq1iucYzxLPzLyhYAprZsGm0vZRRQsqYBvGCWad3z0YZ6/8upz/kbUz2MESE0NyM
         wcLpPV3d/cqXqEgOqpytsXjXJ1y9JFUELW9ILpezdNRXuGQZzDPvAxiPxpwg54N2sR02
         1Vm+930NOxyq0qOViD95cVl+npvFAOBXTKl2o7QAv2rJtozHmOtHmJwuwKWKfwCbYTt1
         F1zsXt973ZpP9UYmUk6JGeJ94x+t6l3YusXyDGtBTV+XSSKHbK40b+E2RWrGR8/DgEBf
         HTneZmD7c2H7ay61KCLdFwi9alq5VHrgAwpz5fNoHJCNNTtuCjc4ebrCyStu8+F+3A+n
         escA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787569486; x=1788174286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YuCDKY9mXTrdYYrt4yEzUU2rfGaRGeNzZjabp91Amlo=;
        b=ixJgSUlZzmmFMP1zNvj1Bh/NzMJZ1Erbf+1QLt8OqCrW3jjkZf1HOIliABp4txGFxf
         A0+4T8i03vNYsXz3sCSKfN3rxX1OnX1iwwBJaEw3mZJPSoRgVXpdSBG15DC6zN4hFD/P
         Wr0a52foDSCmrsez/dVyMGPO5HskFVS7WYbm5+plthABNjIYtSyk1CUZjIN21NZhXdZg
         KQ1JZ10cw91rKOjOmB+tNJyI9ek1LI+X010ibEtFgflg2Mh+RJYyCKBcBm8QMiL7ag04
         OAIuUZeZRjWqIoSkTI0nH0AupzsCdGMfk4PIT6Yvba0yE29VeN4sgx3fY0BS1joojU7u
         soUw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/nYrjZXsajCRHRJFT+tnasdVmTrif0ajc3gXHr1ohfXLt6eOi76QCo1AYS4gPz30Kq/drCUPvFZqJ@vger.kernel.org
X-Gm-Message-State: AFuF++m53WeUalYHv2/+Sn3PTdHYkqbeIBmWgxMdvhMw6YGOYwRxC9fp
	o4XDEFJMyJpdVhIC7fI9lauVB5HynhX0rA59r6/DbdZjMbkb1+ESsWw+vL/ip91J6Ho=
X-Gm-Gg: AR+sD13yIFByT43tsJIlBoWZTFx7QYbdTx8UfU8YNcsbvprNYu5nWvzckOX0L0Xj45y
	o2vU7slDgGDg9gIESHj8Xft7+EdTqcBAQZY8Kk0+/MiZqpm/Sab3A5R7iIPPdpCAsqYo2OLMzNx
	forQ9Q0tV0HDJ3fStIFYP/m7CyPayYWpVDudG2W8yanwts5GhIKpQacI0pguHrvc42FxiNIfjSy
	OSN3Kvg50XXTsBSyFHE+eTND/xKg0jKQiV07X4tfpXQ8OMQ2IhP0FfHJjih3QveRDqMMDyTHVJt
	w0L9rnCkaOed9UFyAO0myH6pO/D4prxEzFpg+DQqCwZyqMPmga6DDvcUTUveIGmfKDFsYRuBsTu
	+LpElyAI38hZYEO6DqFl67gDFmVFIRAZ2mRnLHKzVaiZIVuaEppO3O/feCUBtj1hHvQr1GrBtsa
	UZJAE3oLI/P22ALw/2JY0i/pOaiGIfnEGzgT+hH+h5a96TCcNAk6hscS/yKc+9aMhzYVuTqfrcC
	6PJZdzd18GQ/7XSboEUOmTVSFgnHBnFPM7sVscrZbCe1N4CBfuoE3BxKVsIVmCuKHHczaijpA13
	in8k2g7dWMbU+zFE+qMl+p8rQlXVUk0ErBb9ag==
X-Received: by 2002:a17:907:7252:b0:c16:8adf:f183 with SMTP id a640c23a62f3a-c246a683ff5mr2769437566b.14.1787569486011;
        Mon, 24 Aug 2026 04:04:46 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-103.zg3.cable.xnet.hr. [109.60.82.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1331954166b.46.2026.08.24.04.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:04:45 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	aubin.constans@microchip.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/4] arm64: dts: microchip: lan969x: add SDMMC nodes
Date: Mon, 24 Aug 2026 12:56:50 +0200
Message-ID: <20260824110432.1074136-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824110432.1074136-1-robert.marko@sartura.hr>
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for both SDMMC controllers.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index a8541c6a098d..2d943ea75768 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -414,6 +414,30 @@ qspi0: spi@e0804000 {
 			status = "disabled";
 		};
 
+		sdmmc0: mmc@e0830000 {
+			compatible = "microchip,lan9691-sdhci",
+				     "microchip,sam9x60-sdhci";
+			reg = <0xe0830000 0x00000300>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks GCK_ID_SDMMC0>, <&clks GCK_ID_SDMMC0>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&clks GCK_ID_SDMMC0>;
+			assigned-clock-rates = <100000000>;
+			status = "disabled";
+		};
+
+		sdmmc1: mmc@e0838000 {
+			compatible = "microchip,lan9691-sdhci",
+				     "microchip,sam9x60-sdhci";
+			reg = <0xe0838000 0x00000300>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks GCK_ID_SDMMC1>, <&clks GCK_ID_SDMMC1>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&clks GCK_ID_SDMMC1>;
+			assigned-clock-rates = <45000000>;
+			status = "disabled";
+		};
+
 		qspi2: spi@e0834000 {
 			compatible = "microchip,lan9691-qspi";
 			reg = <0xe0834000 0x00000100>,
-- 
2.55.0

