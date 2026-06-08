Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076162F39B4
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924851; cv=none; b=S9LXvhukLl5HrDubzDipaqqObhlZWzKjerhavif7BhRAvsbqFzwM5XRp7eVDZhtPphdM/ySGKYeKk0CYmIoCG6PvapElPTYIVyEYH+BeFpMZmd0zUDDkGyirdKtWiTxyLoH8F54Wpb8SKwfY+dvXGdKIHplUGumtfFzIjR1oIg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924851; c=relaxed/simple;
	bh=AkVe5DSt4bAITD9z7rfDJdmTW1lvBQDnLkxEcgwcdfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f2uJZc/fqY95p1b3OjCmyiWTVr2yKd1/uEh6q+Ay6MfNWaAg6tjJmtsC+tGAuFopygaPmghn5L/MND9LI+QF0P30DluGuqn/tiORfuZzWSYEpcHP4ZpQg0ZbVL3gnaV/8/HQ5QLlln+e0E69DS7Pf+kPwGjhlTthLTyqLg6qAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YmOhBNrB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YmOhBNrB"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2306145f8f.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924848; x=1781529648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTitixK7p5wGlkH2q+LYGHH8Q5benyrXkOJwJBLEA1g=;
        b=YmOhBNrBOIBuG/5UmPz9b77OLR5KfT7K1VTBved8s0NTm3pDXG9IoPK4lpiNs4XJje
         zys1NFG2zb2Xd4hm+i0AacGnw7ozxj80AHeqJHI9AIyk32K2Ic9a9ZqwkcCK5s3s02HD
         K3jJgzTJtHP0IHW5ZRgc+75QlrTQPuRmapHipYtl5yYFEqDy3sx7Roj+C2p3zXDlh+I4
         +Z6ZsmxQ8It40Bv+NgISpHvCrcnFsnRpHwArn4hosZ4001t/IJKBB8NBqtTvqB0jrvG0
         +PxhrKRimLIXDarHhM07mwu/4GBNyzxcQVjsQhSAVNDoQPIEuF2DkbdDKWz1INb8gwU1
         dQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924848; x=1781529648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nTitixK7p5wGlkH2q+LYGHH8Q5benyrXkOJwJBLEA1g=;
        b=ZMXZ6liCbrF6nY02oeWwKCCU+6fXSM3Euz65DRMIUSWZLtJn/s1t5B8LcEBtO9ChUK
         j/yBTnylHclnaa/iOMtbdzx8btPdxCzrTa3NDi/J0Xy/u7QvDgvEHBQg+DzHdCUrq6jy
         zchUbDg1S/Fmj4Pui5AfpgG5Ml0jMqeEFgDxf4quTAGIkP4Hf43JgaEC6EiwD1BIQUFi
         g7EZysI2uMXrOXV+jrGZDgGZoHRDFpeCphdsne04S0J14CnFqjubOKYN3qqUFikSAaYA
         5qXKGxCbFwi3KQXwwiFR2TFCzjG1IrIx6IHFXUNgU3YheqRSM5xZKdJN6Sv+Py7yZktk
         qlhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4z6VucD42LmHjqQPs6dl9WtxiuzVVYYsvPmEgRFHpBC+5t6V6hn5lIL33G4ncDxDOCBUDGhcAWS1z@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFBELDPWEV4PGwNWl5FAvmL/9L9l51pmQo35NDJdXbSMzF5sZ
	fUFC0fk5DI72pMFIqjHABbPpk9XtX3DJ6dxsNDk81uvzk90qaF9aAkc0j8FD2UcXVZ+ujLBEeES
	XUsdmezQ=
X-Gm-Gg: Acq92OHX0t1fOu61cY7o6cmOFVjWP1bHgQU2Tlew6tPxioFNaMhaC7alIJcgPXxPDnK
	C9ftOF7AJCU9uWZxvf3+sJbB+tYV2jULpbvC+O+KASsAEy36KkkBjJ83mdaUZS8zJyj/PXnloS1
	u1VOXDj4KXs6SR1nJ+1X3FQ8nyP+FsjxmO2F5CPKtmplCVVN35qMBTD4ilBajLa4Tm0Aaxy9nEA
	V12H0mCUK7ANGI9Qls3XF2t2zdZEPLQm9INAJqz49sCr8wy4gx68rY89D9uYfaOtqjRd7ceZxTs
	CZbiXxHIRxF0ItNGIvt1eoTykrjODAaeT3IgQPEluDvkrGo3P5mGub8LcOttiWzNwJEUgIOpwRt
	vPXDEFO0PSCf4L2LqPGI4+qECfKlwyYNSCO83KUeJUMdU6ytn0SSLw0tFrs4s7fAQJ7Uc7fxROH
	lS7IS77238xbG+s9NEF1gFzsHfLmO7FlsQEBztjx+yJ6lctHk=
X-Received: by 2002:a05:600c:198d:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-490c25baa0bmr261899205e9.14.1780924848315;
        Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:47 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:22 +0200
Subject: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Add the qcom,mdm9607-nand compatible for the QPIC NAND controller used
inside the MDM9607 SoC.

On MDM9607, there is only a single controllable clock for the NAND
controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
around that by assigning a dummy clock (&nand_clk_dummy) to the second
clock ("aon") that is required by the dt-bindings. This is not really
useful, so avoid doing that for new platforms by excluding the second "aon"
clock entry in the dt-bindings.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 5511389960f0..4a9ba32cbddd 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -22,17 +22,20 @@ properties:
               - qcom,ipq4019-nand
               - qcom,ipq6018-nand
               - qcom,ipq8074-nand
+              - qcom,mdm9607-nand
               - qcom,sdx55-nand
 
   reg:
     maxItems: 1
 
   clocks:
+    minItems: 1
     items:
       - description: Core Clock
       - description: Always ON Clock
 
   clock-names:
+    minItems: 1
     items:
       - const: core
       - const: aon
@@ -101,6 +104,26 @@ allOf:
           items:
             - const: rxtx
 
+  # MDM9607 has no (separately controllable) "aon" clock, only "core"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdm9607-nand
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+    else:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
   - if:
       properties:
         compatible:
@@ -121,6 +144,7 @@ allOf:
               - qcom,ipq4019-nand
               - qcom,ipq6018-nand
               - qcom,ipq8074-nand
+              - qcom,mdm9607-nand
               - qcom,sdx55-nand
 
     then:

-- 
2.54.0

