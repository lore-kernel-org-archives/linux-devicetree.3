Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445641;
	b=frR/P3buO63mjlLumo1fg2jdquGEUKcFiZRxuN2BqqJtGb7v4UlLiXV75yzSuENenv9W
	 x771zID5rDk/DG1swzipSIJhnjtsAgVFZhvS1T020o5rSx03DVv0FWjdFng4QdRcQP4Bj
	 nsYRpzFfClV9vI0jkriZ+kwa39uq5PSQSR389HalWl1o018nulfE9RQzmvdDLaaZhaQy7
	 cNsqtKeXvfmfkGnd2Akv0zKMQN3mRNRMBIjV1yiPSmn3Ez7V4y71oDsCGz9Vo3WJrYYlz
	 8EZRLI1TNAOfAD10t0KBLOp3JxmWdsiyJMDgN32wqgR7aaRDIh5D7/ZyvZo9HicVrHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=;
	b=NHmE51AQhlel6HeVu/cfEr2ghxcmb2dqB4zkhLNHyjsJohQFL2j36rGrr55DTr50ZAiw
	 JSWWUx/lE+s9idJGjuYIbBjhNojgN0CsvFPZImn8wZJLLuJDXidcfCC+oTw3m4bbBnmuX
	 nZliVZWF/BwFlmNdZV2lfkr0vY1I3FJk2kgk4k+hdxIa4yYrS+mXeeItJ67Vkh8rZhjEE
	 wOVlCamZ2yHLCPEOWXKPEBB95hxB7fhBP12T3CZe6047ioTgcAhT/CyWKT1U2Xyxj2sOy
	 MGcrssm09/TrBlvm6InbCY38xAJIdCoQKgiKNVaMeJNnRjG20d4Wq0dlWcYIFhWTNfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VZvSaB9t;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD7860A261D
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD7860A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VZvSaB9t
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so33675425e9.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445639; x=1796050439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=;
        b=VZvSaB9tF6Ty5DLiTMl2c9D0Ccghyv1P7rffdqVNLDtRDzfGPX7k8Eyx0dZFmcuouf
         2dY3ybu/aq1EISw8yaRXEhTd+UR5AxRdCuoxZQ7V96cWkMTZIwgZfxTt62IS7DqK6K+U
         xICre3QevZeTBW7W90i1HAVVGJXMDkUKlzY8JytG/Phu2WkGXrSdrt229K7ovkFKcVHc
         7xzq59ImKS//GC94ZtOGtN/6VY0F8InOJm47Iw2ajaEvyPqVoerHJwktxPmB3pLFAbRP
         nFJjHrGkW6Jw9bdMs5wA8mEyC2L0xOu+/IkPEtGSVTc9GGCs+ZjScW/FSKFP4MGiO4TX
         N/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445639; x=1796050439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=;
        b=yzdqMHMnfpvDg+rq8NQcZaLkCdjxZK/UawcQJiTduh7YOtxT/d7Z4Bk3eWjctXoK9A
         G/QcktRuTAwrEy50629XKLQ25me5+JKjF1M+Tq1IT7cBtaldeJVb15HDn51GYp37mk9y
         awy6VVg/NGg0iYiagZ/ARSWRHES/YtKqHHAAawvl3rL22H5PZTNUUHw8D+mFhfWQQEHh
         QGY0ETJSt3cOz7DQZTKlZu047QM5XJJhG812PfpdxOLJOGiF5DvwXu9LB5zYOivsoEPK
         t5/x20BtdnmeJFqcZkwFSlm2jRlXpy6zPMYki1CkrM5NqPu99aCmFufvFouk6uh2hXSK
         8Fbw==
X-Forwarded-Encrypted: i=1; AL+hErHRXu2w0VXo/ZRFZCZK7rjOVo3Vl9LbuR1H0w7zzOLKzE96KSLlBVidyhEYZHgnYg/WbGfGJJlQE/AR@vger.kernel.org
X-Gm-Message-State: APuU4Z98kxxlF1QRIUsrbFBhxj3Rn/mHg/vMNOdM4BK95r2A7UzXP3XZ
	YCd/kfu9oMK44iHqz5lwpdPpjSjAkObGXCHww35CoUrsOnGDZZMhb0ntJXhsQmX4R1M=
X-Gm-Gg: AZFdTZfR8M3mkR85XyBnNdErWn0fpodN3z275hgdYSK1CaYj33/chQiW4uFiFN0XNzS
	3rJmm57UlEHqdreFgBflYgBDlI7aE2aJTUcBrKVIEvcjinRh4tT22qUiadv+R80qwDxbcxsZ0cc
	LjM7Tr6p8OD/lJmvefyrdoKqAnkyX7gAe9IIPHkSpMlsCpx3INBJ9FFcLlM9UKNZ+lOJatwZ46J
	WBWmlS+CYFhLIZ3V0RoXv40TAhJPqoqf9cSL56qNnofnrlZWlu/TOwLWr3gmrUPyF75pI6xIC7K
	ZsbK7OtdB/8fmT6vmYxf/bvPIXHP2u8E7V4OLkPcsRauNy7qWVKH4jUY7L8rBq/6f1kmywB67QT
	CvMXwKAVhcEblbmr2Bp/XTCBD8XpSz0kRGJbqGzLutcgNeYCfImlNRBMGR8NTiG+zut+dPoHKgp
	iW+HdPjcUjTQJA4LvBWI56alZOwt2CphAkgcJTdRjMdOrJxF7cnehoBnXM/mMaTINJ1itceQX3g
	Pwk9EJp5fGR7OQG941qwofih+2nqLTtco9411YJ7zfSNgdygi0gT8L8kmWBGyi2ut1bRmIv9cJg
	SHN45VCSYaugZdMCPWVnC/3ypM8r
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr237377065e9.32.1795445639349;
        Mon, 23 Nov 2026 06:53:59 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm280462825e9.2.2026.11.23.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:59 -0800 (PST)
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
Subject: [PATCH v3 19/28] ARM: dts: broadcom: Describe the peripheral window in dma-ranges
Date: Mon, 23 Nov 2026 15:56:57 +0100
Message-ID: <20261123145728.29082-20-andrea.porta@suse.com>
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

The DMA controllers of the BCM283x family and of BCM2711 see the
peripherals at their VideoCore bus addresses, i.e. at the child
addresses of the soc bus. This translation is not described by the
dma-ranges property, which only covers the RAM, so that the DMA engine
driver cannot translate the CPU physical addresses of the peripheral
FIFOs and had to rely on its clients providing bus addresses instead.

Add the peripheral window to dma-ranges, mirroring the ranges property
(minus the ARM local peripherals, which are not reachable by the DMA
controllers), so that dma_map_resource() can do the translation.

This does not change the bus DMA limit of the devices on these buses,
which is still given by the RAM window except on BCM2835, where it is
raised from 0x5fffffff to 0x7fffffff without affecting the DMA mask
derived from it.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 8 ++++++--
 arch/arm/boot/dts/broadcom/bcm2835.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2836.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2837.dtsi | 3 ++-
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb39396..f475422796d8 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -41,8 +41,12 @@ soc {
 		ranges = <0x7e000000  0x0 0xfe000000  0x01800000>,
 			 <0x7c000000  0x0 0xfc000000  0x02000000>,
 			 <0x40000000  0x0 0xff800000  0x00800000>;
-		/* Emulate a contiguous 30-bit address range for DMA */
-		dma-ranges = <0xc0000000  0x0 0x00000000  0x40000000>;
+		/*
+		 * Emulate a contiguous 30-bit address range for DMA, and
+		 * let the DMA controllers reach the peripherals
+		 */
+		dma-ranges = <0xc0000000  0x0 0x00000000  0x40000000>,
+			     <0x7c000000  0x0 0xfc000000  0x03800000>;
 
 		/*
 		 * This node is the provider for the enable-method for
diff --git a/arch/arm/boot/dts/broadcom/bcm2835.dtsi b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
index 15cb331febbb..3a9719e2fadc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
@@ -35,7 +35,8 @@ cpu@0 {
 
 	soc {
 		ranges = <0x7e000000 0x20000000 0x02000000>;
-		dma-ranges = <0x40000000 0x00000000 0x20000000>;
+		dma-ranges = <0x40000000 0x00000000 0x20000000>,
+			     <0x7e000000 0x20000000 0x02000000>;
 	};
 
 	arm-pmu {
diff --git a/arch/arm/boot/dts/broadcom/bcm2836.dtsi b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
index 783fe624ba68..4ab7769c056a 100644
--- a/arch/arm/boot/dts/broadcom/bcm2836.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
@@ -8,7 +8,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
diff --git a/arch/arm/boot/dts/broadcom/bcm2837.dtsi b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
index c281697142b1..ba44cfb07668 100644
--- a/arch/arm/boot/dts/broadcom/bcm2837.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
@@ -7,7 +7,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
-- 
2.51.0

