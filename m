Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1AD305690
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662011; cv=none; b=OFZjwhCASDpq+HtB21t4utkNkaovxZJ1HhqJEMhfhNfaKDiRgGPOpB8jgUFZjxZcu0OTdpUX9vPrAEKNF2QpeBzGK2juA5kA4wDTzF4xWQjz0EyCTr9FTj7SyBtpsVqU7/32G+HnbcGKwAL1TR2x2m33hqMIpKMpe1/1pU+dSLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662011; c=relaxed/simple;
	bh=5Uzl29QTCrj5VKD83cW4UxcKrN9I1xXI5DXz829aub8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8YO2YaR/44OeDtc75SXHTZUmF41/aFu0hSKkVPVlPIIZrOStShLbBNCaVlfv07VER6SmbJptd411FlQq8FrBiPHwTgqegrsk1YghrTvpdFi+p8nzGfKxdi8jNWz0MmNXintaL91lu1Tpr6POWLTrtnC5Rbh0/zmjCDC+jrX5RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Slpd2c3M; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Slpd2c3M"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b9318997so13770505e9.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662006; x=1781266806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=Slpd2c3MF0kBMnAcI2Kd7IZvFXVW1drIh8TjhvVPA9mRGPLKVvLY0m5NKGdWh2DgMr
         rU50HEi5JFYHVC3YeIjzuoE3w1nXt9riMROx1H1PEJjXDIx9SlgPJgbwyuo21p9dDCoX
         DmaT+BVaKARCnER1WQ4s1s9LPsJPNW6UUBe/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662006; x=1781266806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=Ddot0oMbbUkL1Sq5TG5FMYo16oYwCXFmIXUskg3o4HjrqMclNsUEoypA1mVRN/2211
         5FjEdxwkRUmezmkqa4PEmx6IgQgq6cDrxUFQaJF9/+aV/CvN2JFZ9yQXX4ukw4H5hlt5
         eb5QKkRWwT8DQ1H9M80o7QQFZ7bazMZN2dZItHRDx8tRV2iMmXVVzEFrMnR8vj+ludy7
         WWAnP9cylicm1j52LQqzLeda3odV2w/anOofryhQW1pleWw73aQdiEZB8JVLiH7spz0y
         JLyIQ+DiReDTJClahP8ZEmuIInYj64zIcR02Ltugd4St1aa7khHaOA2VLUInBd4i5gM4
         LKjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gRo0pnsxwLqomrCYGHdmdzYAO97Ds/XubdqkEMBZuHfz7bj07JkyO8lyO5LKCRnzhRMjpdnteoHNf@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpP4o/geLWdECjxUKHaAGVS4CWym7VYQLufKsZn1dZSjxUimB
	VTSa/NS+6cknCpw2enWJV2TUTh16l+/wqRWxVQKEQ+GfiHA/tsNpQj29nBBk+reDguA=
X-Gm-Gg: Acq92OFkEefceZ6jKMCawZDEzAuCVmYF+fMlO0tyi60nTLg/HLJSBBurwb+v43WOpui
	KiW5ZS1jBoo1LGtxtob41aaMZLbG8xt89FVzWoAP5wj59X3nUKgYbuNrcxIUWwwCLk31yIvYZ/v
	cIoe+kgFuUj14eg0FYMvup0YB+P6NJTfH0KynpRDX9q2q1f25vPCPJuwCKW96Q6At6j90auFD9W
	wAyfaHUcjPK36kxWwGVCoYV9i536xyn6HtGdZ0esV3BDRnK147gJ0/sLXcHtTu6YCuN6WqtLden
	XiGIjzh1o6fGGeUcrQzGxlsQuX7oH3S/2XcRcwIU9XQymMxaMvhjnuh5TXZgTz0n1+h7qNtSpm7
	L13lH/sp/7GXbjA56UgFj9fInlIog98aoQ2rXTEWQZkVZqaNy45SOIBpgCGUwKJgeqAi95W7McI
	OVBozEUOumHhJt3NFXcvKcFpe3aknW8jqZiElzjMhVej2sZ8yl2CQ3LxmanOA2YO2EkykBLKl5I
	oFTpZZpyUqz9atKeVUdr+VQZj3JWYBk7WR8sv9epDTvs+jkaAFiWGXJBuLXa3WFJxvJo56HuoUq
	nB8I+AD1G0Xl/sKhOME/5jW4VjJg+r65pWk=
X-Received: by 2002:a05:600c:4708:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-490c2602987mr50837865e9.25.1780662006287;
        Fri, 05 Jun 2026 05:20:06 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 01/14] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  5 Jun 2026 14:18:12 +0200
Message-ID: <20260605121957.78409-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Engicam MicroGEA-STM32MP257-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v2)

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..c5ce81e3ce45 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0

