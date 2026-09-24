Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3714046AA97
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268607; cv=none; b=aOGn3SSsJacz2n+XODa8mvEgylb3Xi+0NbXgmO8n2+CwPhbivg4uo2Z3dgW9e1aSkKdeSNe+ZCaNRCnjQs6exUpkAjZuVlrfZzEuc6XTg/JqyP5TX8yBnx1LeA2GuHLuCGL0lHARrRitaCreToLaaG6aa84d54g1q+vkjehP4dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268607; c=relaxed/simple;
	bh=Hrw9uVCkuJ+RImHrQgLm4rRhEErnOvCmxCULmx+qlwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxIJ3w5/fo07rvsbSEeCfy2Kr7mg/xvBVk1IEqFw3WW5SAz9sR3JaYUr1ziBAoa4QjcezQs/LSnq/AYNzS+YkBydLXC+1W5as7Vw3iZOXITh8+t1NcDg5UyH//bfqGm49SiYVp1VHk6hYAzgSb65i++e/sJcHKk+ZC++SRsbTh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=fip3wO/x; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="fip3wO/x"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so252475e9.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268603; x=1790873403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=fip3wO/xASy6rYAJgPGSZciY8v/iOz/qbTVy/4CxLna6mNsN8rf/tob3ifdtadzgao
         R21PtRs7IOxRl6V/uRKsdDY5jbZF408XNRPh2ExW493mg68SRkQY4fB78/3SmOl13C5I
         YoYiRALrURnkYYxuuNla9FK9Bq/Abk1Dk+JT08Qgx+hbQRcajoghqjvq7YnCJKabOxjA
         3RlWolxVD4/qiCC+es7kON5CK1MNGMVdIrVCsNr+ZS5qaNePkZYnBfrX9u2lS9j78hBi
         ca6SC4q1aI3PCSWkz4Cbtzm5DSiNbXOKYZmL9rjaE7/k7cGBr6feTW8TeI59W2hZVul2
         ufxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268603; x=1790873403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=V4DFvhTpVIzjymzx1dU1HLzve6zZl1Gg5SXOPUIDlJpv+AbaiIHl8DsBYp6h5xLuu7
         eG4sz8U41k/olJGNEpxakTzD+xXtwAGAIxY1wmF/rYHhvViDoN48LN7mjl9T/KG0Jhox
         9udasR9nXD0RyBqzrlid9PLl1OEB6UYhuBEPGmp3frlm87XUaYxwBfrTnW3X8go3sMMH
         XpIKx4RsP1w8P6xJrK/Duy4APU1E/MKTytvGcJtDV7y0SSBngtJ6bm35BJskBlG2SNN9
         888JqycdCH/sLWfvVwIxH50wd4i7PXQ8ataVl+FFaH4Ab6INrNUBcw6HAKiOXgPOlwYt
         xbmA==
X-Gm-Message-State: AFuF++mOG3doID7LxB6Ex/pDrXUGXbX6FsN3Mma56gbm1/6GzQix/uqw
	653VTeSQK3tkhEgR59PqawJ/Xpt8GRSkX56YAM0FGZSUiTrEkMNIj1LG+wBfe4G/8lY=
X-Gm-Gg: AYBFou1i9FJGVcBWseDm6YPL7wdyX7AuiYRMRztA2nP+KvFyyK1NDU2KSdjKO/2acbD
	JwK5iQ3Ttv7vgGLeuaWNz7nZ2nSTmhqUBWzoNENSEByYGcHIakupkTTj5Ghwa4Z8WMs4a6vsUou
	wW/NWpPdd5iHa7I2JwU7R3YPFsA2q7gq+mE8W5/aOVZJMSkYssDOLVwdBW+OqiQoLankneT35vb
	f4amOue6TnuQ7d4nlyCT4j+l04alrZRsM562opMEK0GWOnKMXU9I1I7Y+kM7MvDnYiX8pfpMw//
	5D1esEQ88hEcqou7k9cNMfXja1MQ6QDMiwIObvqD1nQ5zTywLhQJOkzb2gkuxh2p5bTujgbpT9t
	3GDRGaVaYxyH/7mAGsrqgYMmLieFgcLHQewIbRSdo8XIHOxyt4sH+MaLha6nu+otYHucDNPCvUy
	um8xIpenbkn4xYmeKc0jbQVvTyMu+3RbOoHny1ihzKuQ+RsF9pptNmT/iX5gDvhYXI3UfsWMb7g
	KNDtfZ4NcA46S0lgsvKjb5iH0P4p71PDY5p
X-Received: by 2002:a05:600c:8b22:b0:49e:6ca6:d40f with SMTP id 5b1f17b1804b1-49fe66f1534mr57247685e9.9.1790268603421;
        Thu, 24 Sep 2026 09:50:03 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:50:02 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 2/6] dt-bindings: arm: sunplus: add Tibbo LTPP3G2 board compatible string
Date: Thu, 24 Sep 2026 18:49:18 +0200
Message-ID: <20260924164922.117236-3-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za>
References: <20260924164922.117236-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tibbo,ltpp3g2 to the list of compatible boards for the Sunplus
SP7021 SoC binding.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
index def7d0cfeb31..8ec006576f74 100644
--- a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
+++ b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
@@ -9,6 +9,7 @@ title: Sunplus SP7021 Boards
 
 maintainers:
   - qinjian <qinjian@cqplus1.com>
+  - Andrew Gaylard <ag@ffroot.co.za>
 
 description: |
   ARM platforms using Sunplus SP7021, an ARM Cortex A7 (4-cores) based SoC.
@@ -22,6 +23,7 @@ properties:
       - enum:
           - sunplus,sp7021-achip
           - sunplus,sp7021-demo-v3
+          - tibbo,ltpp3g2
       - const: sunplus,sp7021
 
 additionalProperties: true
-- 
2.53.0

