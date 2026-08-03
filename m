Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354E930F92E
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742969; cv=none; b=jTr3h8mfcFf6/+lQkWvHu3eRvDlpEUDFp6bXAnZGgJNxLNTZbEIbuWH+Dn3SEjLXAF3adn2dDWqUdPr1drasYislvtNUgDGdWN8RniAdWY64/wfH+shS8ChUAYBtHR2JZuNmEV3G0DX8SJjIcOP6jGReEj+RldMsDYfr7LUDVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742969; c=relaxed/simple;
	bh=9IgDtyv6yAMUkWsg7RNaWcItxtFHo8kakpm/KHcWfnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EM2QQcXPxJUuPUOBRdFloNAYHz0ORdsuwbPxCf22yzbZwlx0WEI1lxeat5kLJk7/jxDxIkCiW7DIQgZ6cL4TpPRceRFZ5aRyNHlRRijQn1/rkR4DRMiKnsCEijBp33ZkCY3BY57DI0tUNmt4az+Y7atZ0WZzJZ03WvjJwxR0BDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=SY6XxHU1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="SY6XxHU1"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47de0093c42so2084476f8f.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742966; x=1786347766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=SY6XxHU13k2yacG6QigOPqX8rtLedxyNeOwEZAS2kvXdkAnVpaSk4tXNIDrQ5zYoqM
         3oq/zxUUhUenwRZGmDxk1weoG6M3Q7Saa62ymioGhGr9k/mlxHTi55B7TmOiBQx6XRY5
         abprX505V4lyFbJkPI0x4koTqYIaDsz9m3kOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742966; x=1786347766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=guAgUPfmc5K0ISDrmPSwI2lXPlSMrLpUJ3wnM0VTNJwgEifMz6as1MVOJL+WEsPr9l
         KZnUeTvUnT1wzmM+LBcSbfVYD+/WDKPSqhAM490CnlbY8bNT4vb1u+JSrsJ43uDi1yQv
         PeG3FggHb1hc1VWQLoKmFTeGUhCuOjG/KRDbGSSrb7yTeOhe7ovUwGMzLctti+ZWzkjr
         p33oH5NSRrAYaKNV9y6Or/tjFgBsIGzjPg9iehnO9AUahtKlwhD14WYWeoS8nECfjTmj
         XG4vbR12ae0B2M5Kc10nJwU3WSw4Ffml93vQMowKJO+kfTmPfwM0UASkOe19OXA1GjkV
         Rh9g==
X-Forwarded-Encrypted: i=1; AHgh+RpcalbQkp+AXPshwcZ1mBRAzJtMCYxK0mfftFsvcYYoAWVWvEPbvGYXx1N3XNACWm/LUla488Lg78JC@vger.kernel.org
X-Gm-Message-State: AOJu0YyiI/faEUjjYP2H58p4uZ7Oo6T3YSzCc/neT2ITf61gAMtIHZzJ
	Vq7gb4l59okRT/bMjL8Qf0R/pXoI2h+PaCjTZ2xUE7y5bYCN/4qWl7Zq+QphTws1a6A=
X-Gm-Gg: AR+sD11sZEZc8rxhSx2b+7z8mlsE3/tuSOjVRGOH8otnv13Od/H5ler5maqBzFxSuLf
	QlPl1LtMcfnXw3t7bnsl5GnoHitjMkTyy9/umwWqdiNMn1C3YEonUykI8G3+d3NhGTJ2qHXKZSi
	f96tHlytiT+DL+npU3y/L3TG00LasHTNoUbqZVvNMxKmL8JIz2cZ5YlYAKnU/Ygzt+jzg8Jxfzu
	Gg813xxLPTsBxsJVg7iCgsuSyO4CN8CmQEPkCDFyVdmWU7RaujIVj7egl6rg0zLEImhyDacTbY2
	ZcSKEHW5KZeHkUdw7TkdmtYJPlKSNPQQkP+6Ns8ovwhLQqF2DixLvyo6t8d4vIvTCDpqOgoB/NV
	ksvOTX4eztOUzgOL8PR2P7nRvG8GoWlzkaEE4gvmzCOGczFi+uS8fUHIjV2BrGa4X2TR9aG9dKD
	jEpq06ciORqehJvLaD1fdp5hOM6z/GfL8R7IQ1emVOczc4x2BXqI6om2QZiktQ9MnJhgXUO1xR3
	htdtMu+lRLuqyJFNXfatgQIFWM6Coo8Y7LKNXnZqh+NbJIgLwHbg9qfYo4wC0Cey4+AoXQxBypp
	epa19LlynuDNX7o0MNm50mYL8SIUAa5MnL/lxp2A1+SmEc2oTn+sCkapmDV+QrWn
X-Received: by 2002:a05:6000:22c2:b0:47f:c648:e265 with SMTP id ffacd0b85a97d-47fd9cf7670mr21118173f8f.17.1785742966560;
        Mon, 03 Aug 2026 00:42:46 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 04/16] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Mon,  3 Aug 2026 09:25:59 +0200
Message-ID: <20260803074224.3821911-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add power-domains property. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index ae36d703532c..44938c036e30 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1668,6 +1668,22 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0

