Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035182;
	b=risaOHxT8QbnS37l5bgU/mTgCbp0KI6r/ZCAYVTWF20DEVMpH8QzSRydYhqWT5C6kqdk
	 ewrD6NTiDxL18eTIZS//sH0g8/0soF4o3nP9zFUyhUIEmEkL2r/R/wCs8bS7w1g9h0R4x
	 8EmbYqLgdBLgQf0VyGYcsuvwXkLSI8gmuKWFSa9V8wotu9LC/1ozueeo5SZUttiemoZoo
	 2WYwWUEFn9yrJnOPrCADPHlYYYxg/Diru/KtO5IoibXD8IJmFHxHbsygkmEv2O8MZ8NxZ
	 WZbjoDrChzuIaOmonMJB+NnZgSJqpKVkhL+mWDa6kEQW2NN4/owJoRn3sjvRbwM0AOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
	b=ZLxbNcM8ooFF05Mb70WZXy5cJ9ViwuwP5OPUsszWCVmpG1vM1+z1IWrYHiWsYNeUWi/Y
	 YDBLHWSMfqd+0HBNuoBmMn/U2vyFS1UIQLyYU2xcMzM2AJOADaQXIkr09cCQ4elvwq46K
	 f8Q1pvn1402yRF4SpFeKxvXBI73jGmcdKZY3Mf8LutylcC1Zt2A/MQveSl+CAJSi2A2Qq
	 GgIMGiYA1zgwjlTaP30F7xkiDFDitOWjM48uSlq326vIQG/+mShKfcqZxjIGdA1KjhmAU
	 IAJMl0Bqa3DVSY0WiTn8GstrV1lrPhTY9TdfEROsYwDbCPG0ZD+pq5DZmi0A4o+TLEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GbO3L50W;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF60F606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF60F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GbO3L50W
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c445c95d553so212255766b.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035180; x=1795639980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=GbO3L50W3zPBCKpX4nWT/H81Rr/VofVkYHAV/6mTN0RreJa/VLJiHzdAzzbm1YNJQu
         TUxDyX7UBLBNHjz4ODRXfQhQ+Y4AaBLmgj2SD0s84sMz5dCx+13G9Rv2kPKG6rg8MrBx
         xv/nBTKlaPQRWBTcov+z4vhnapuM/VkuMFHUb33WGBC2sMX4RNCwygHORTOnvuVmFOtH
         znrtOPCXOo59JqsgjVEX0uSt1XjDdI5KFuDauxeOGs+4EsHbplhM+k6+hFSilAR2Ms0l
         JHOX7VEhB8Uala5teN610QZfolr3YbrqrtpH5QZtSfi1G/zUVse3gawlNG+8H29SEeIM
         67gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035180; x=1795639980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=hnT2hjkEA99C0no6/zn7iUtHfFoAe5+pYWrpjOFx9xa5JuTd1QiN7KbFn2Lv6vnvxt
         tETTZDzPGSG+8j3N3BxGO+LGrCVG1qFLe8qQsjESStUnEAtk6a0GMPMz3LCsdSjp7znu
         wbFIYAMbil04RbFrBPj2BLsIXG0IhQSJnOmKQvfYWuV89NXAGX96kbbYOcqhVi7y0HcB
         99GPTpa9nrOAg1xvQGBaGF8VfpYT0JPrwa9OjFQxaKpEiqE0mqAAhDnp+SKWv+/Vf1IC
         YTSCNH2c/8hR9ncK/HteUqucqiKLBKktNxUwKSqT/ar4CtSAItGBWy4W6SGqWe9OSTQq
         RY8w==
X-Forwarded-Encrypted: i=1; AL+hErHFenNUmsdi4mLwVyUYz0FAIkOj8cDW+OSGVagCvNMpVx38lQYg/FV9FwTrkunKSyU1B534BxMwcvu2@vger.kernel.org
X-Gm-Message-State: APuU4Z/wRpiKaAClQTkXLhZmOdmJL8XOK2nHTKdLdQZ5l0ZM/u+ezU73
	h8s762S8SOlCife6aNTcrXgpmsDRUyIyfzc6L8K9W/6o2P3gY+q5HrB7
X-Gm-Gg: AYBFou0ap2Bs0WtyTuvM7CUCmkcqAfbCr85D8rm6Ha8JWzBRBMRjpbdeCLy56lEYV0/
	WT2MTGmed9n1gL0AUKYWclioX0r24neH1H32DAmhxZyyI8xXOw0rSW2dShnOXWg3uSSL1qrqf0d
	tz/xRP57pPsYOrauXPa/Tv27BCWk0QPtQEUv+XFi3KZg7U/VJ5+1vvjveWjjcfDg6slvRyi4zio
	4HklzPw5KBkgfteeW2sBFj/78LKr38EWfq713/5LuNymazblHRxsrCDKUFOBjPUzz2T7gi5Iug+
	r6hCxFplo5V3vYNSJGbzxfB2GIpM2MOtL1uhRe7baP6vO7ZhB4OQPrAN3lFfZbkSfvxmFzVulHT
	t9vaQjCi9rkGw2+3zBNmHDF+fyWtc6AAHJVOKJs/In9rUFS5Q3YXRvZXCXhmjh9W/nwQiTYn/0+
	EOHju/w5Sypy4CEUPaTHzFv64HxvbjcmsAivG0aI1lqd5wqG+4zg2UUF1OZddO740fNqTLwW4b1
	SbzdZrr3PJLDUru7+QCAWM6Y+kO2VPopzOKI3UwZygMpxnB5BE7YCn9QVbn2dxk9ZcNDJKxgTch
	TTQQJ1aLbsAN5Cj32ute6LKNGjYS+6CXK1K4TtKtX0c1F8oVXTp8aS/QuxajY1+99z9tpsV9zRo
	taHJdMaQ=
X-Received: by 2002:a17:907:6d1f:b0:c46:8b87:c1f4 with SMTP id a640c23a62f3a-c510e2d4ee1mr357637066b.20.1795035180171;
        Wed, 18 Nov 2026 12:53:00 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:52:59 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/4] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Wed, 18 Nov 2026 21:52:04 +0100
Message-ID: <20261118205213.88778-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118205213.88778-1-apokusinski01@gmail.com>
References: <20261118205213.88778-1-apokusinski01@gmail.com>
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

Document the TX and RX DMA request channels featured
by the OMAP I2C controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
index 58d32ceeacfc..ff946fdfaad3 100644
--- a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -37,6 +37,16 @@ properties:
   clock-names:
     const: fck
 
+  dmas:
+    items:
+      - description: TX DMA channel phandle
+      - description: RX DMA channel phandle
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
   power-domains: true
 
   ti,hwmods:
@@ -93,4 +103,6 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         mux-states = <&i2c_mux 1>;
+        dmas = <&edma 58 0>, <&edma 59 0>;
+        dma-names = "tx", "rx";
     };
-- 
2.56.1

