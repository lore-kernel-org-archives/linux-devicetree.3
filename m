Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780875;
	b=wpSLUPC6Mbvib8sKwF//WmLH4XwVmJZkTEFXy/uSbbnwVajEw0k2pvSxJgu0xaH/97Xy
	 HTmo9a8F6acde1kshlMDIDLmv0hYeG3YY8mK35JzZ3Pn7q1UNXEXuFPzxbniOZp7NmgiS
	 FCnUfI9OlEXFLF3Gd65CFmXNcv5v32xH8tXtbHGKpftMJ50xuX5D1cyRUZERYsjCH3ZAc
	 odWBgtmb5rSgs60WzdVDM1viPM67E214yVLHi2yoMhERSA/k02Wj39fmDMaLtAN8d/pxC
	 fsv4FrpdZa1/0VZDimUtX359rH9wNbNlFR7Z5s5c+JVOwC3iv2K9V1SjqQ75JYdy7HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
	b=U21jiua7bYzX5ihMF7/WvSheKni3rJP4MHNBmJsxpb5Avbtl4ODX9yDOvwt4pbliojTV
	 NcM/eJ74pwpKy+xF1LyHq0vmrZEXwmZGd4EXByG9ZmvtLsQpWOiU01KYVBJaCeeieaqr6
	 TEicNW6GaYQ/aENxX32gGF9sHqjnM3WWFJ5XXy7RHovsr8blvQJ5bgBHKH3odSXCKlpHR
	 lp9k8TLSWZi1W0WiJKmFF2qJ0iPpIlJIko2AQqBArxFSEaoJ7hET3qHpWCfaPXsU64taF
	 XCuHxn/eoytADEtC1gYPk1iPdg19s03DuLbJLfmS6SQiH2+S6z7wTtpZlOimIL1T1uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=foK5S8ED;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82999606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82999606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=foK5S8ED
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso98367755e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780874; x=1796385674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=foK5S8EDypCGyYz7Ln78+2iClqhaLe/Na41jXLaL7NmCrKavI8avv37Nrx4FXbMZgW
         RzJ3QWsNgv8Jw+6L1+A5BEyRcPirg+/vM6/vA0TK8FolAnaRNKaJ7WILBmteUPQ1QOHP
         wnf9J6Dk9kXRpsULzWw1ewxN73D3Wcs4nbzSEiqeA8Oif2n03z3HRL/xGKkD2MLjynZ/
         aGoN4GaHw1T+DFC0gNut7hUKgWtJTyACFb1UcVhaTsO1xVwnV3/hb58PeJfkjBGM9vsK
         uo7EHLquiqguELo683LllLtZQxlw1+WkminR/amubTC2/QSXcOq/WWpenf50pbfIb7xV
         W51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780874; x=1796385674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=nlI07nV3bJ/QQq1Em5Xcm2Kk6SU7GGGLqGW2f6x7krI25PRkwd5M/TULqYKw9EF/3U
         Oz0at6RrG2mN1Py6LTQ7oKPmKJWJCXCRFUngrZtR2hpwukmn0ymMd+ujHIQ6hZfN+pl1
         PHfck8ZpKprONt2QESsnlFxUdEV7FY1HjDjfA3/SbLaH8UYgf5sRolXFBiY/mPcqAsRU
         9JEtVlAfPbOnp9veGrpPmREWDYrdf7sssFK4k3oYZTI3zpO9/WySoUBFxFARv/fnyGan
         Pc4zEV/CwlwW0/YJjOpS6ju9IXfdGm/i727deq6VL2ilcE2YP48YenzS02+vYCNSrVAN
         P4Hw==
X-Forwarded-Encrypted: i=1; AL+hErEBlGYXnrmp37mWliCTEILEZr7C6gjl4LworAM3Gty4s5Ls3OcL623Kuh+KuvPO5vKyNPTOPs/gRvIH@vger.kernel.org
X-Gm-Message-State: APuU4Z9DV0zOyStDFUkFmZH6R6R+I7fXnIA4lYTfuPs1LogWku+RXnyB
	IPUZ6WEs6GODG180E3hWdPg7jrk9DSnI8WILx6GAX930q+1CDEJM4V43
X-Gm-Gg: AZFdTZdvQYYbajITdsk4+JG9H9p30o3VT6yaci1wgGnXDSXmFICrfcIp1dwUhxGTida
	VVfvvSLSyiCuZeKRkU97CUjmEexKb9kS8D6DnTkSPzYXwCjlxNt2iqGSWmS9JGx1Uq8QPjXHr45
	4D42K+Hbm9SC2WRdXg8+B+6uUdWCrKI/kMc+pwgCl7zBvA0rBWAkA6Q3gGVBE/V3JwcG3O38phl
	Dl0EDAVHWTUxdt2CwdLmG9QQoOcMl03GLkJZOvEFBVzeVs4rzY3CHkQZTPpMQf6zY2elVBdgCmt
	veJhCs7TO9FAW5ImilXa/SrFNAFMj7uR4OT04CT6/HKTHKIDLduko2J5BBerioy7UFsRzYEFn3f
	AEYo6GW/vI/ZXfhg4yuwdl4oGci4xdI5Q/uMtujN68hCuvBpgBrpn+rX9LDi6XmrtSLgqjhNtnk
	8EFOID+dUm32bHp01zHxcdjBSe9XCp8gBiiRPU2GwNAfWPUJlDymzecTIq4E8cpeA8jaM02z4VW
	nMEhtNYR2LjJ8214n5Z6TDamd5sCkhImP/aPZE5k/unVHMy4B5kMSBUdAdL70uxRWTajaI+TKBk
	bfReMluMdx5QZS3W1ZXqka3N5Rfj90xdIwA4BkcNfWP9rWQ=
X-Received: by 2002:a05:600c:8486:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4bb8880606fmr497694375e9.12.1795780873562;
        Fri, 27 Nov 2026 04:01:13 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:11 -0800 (PST)
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
Subject: [PATCH v14 01/30] dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt lines
Date: Fri, 27 Nov 2026 13:00:34 +0100
Message-ID: <20261127120103.1532882-2-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard-wired to a clk81 (CLKID_CLK81). Drop clock-names
field from schema: name "blkmv" is invalid and "clk81" is confusing
and sounds like something global.

Also, GXL crypto IP isn't connected to the second interrupt line.
This binding is useless, there are no users of this line.
We must remove it from dt-bindings.

Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings documentation for amlogic-crypto")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index 948e11ebe4ee..fdc39797a2a9 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -20,20 +20,15 @@ properties:
   interrupts:
     items:
       - description: Interrupt for flow 0
-      - description: Interrupt for flow 1
 
   clocks:
     maxItems: 1
 
-  clock-names:
-    const: blkmv
-
 required:
   - compatible
   - reg
   - interrupts
   - clocks
-  - clock-names
 
 additionalProperties: false
 
@@ -46,7 +41,6 @@ examples:
     crypto: crypto-engine@c883e000 {
         compatible = "amlogic,gxl-crypto";
         reg = <0xc883e000 0x36>;
-        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-        clocks = <&clkc CLKID_BLKMV>;
-        clock-names = "blkmv";
+        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkc CLKID_CLK81>;
     };
-- 
2.47.3

