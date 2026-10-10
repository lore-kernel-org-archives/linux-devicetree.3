Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7F83EC83F
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637244; cv=none; b=C2mZQoFbXEk/ttvSEugxB+YcB5rpEvSd7kUjIDhzzrfH89KPmQDNandaRNS5DeqUReZNqUyLGFq9llJf4lcebFq4lQPG7M2IkNJmIoGSXja8eMh2ZGBU0jB/qFW4F6VO6X1NVhFbqyz4CXtV/zON5DqfXVMcP41lktH5C1kc4Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637244; c=relaxed/simple;
	bh=aSzofgXGUWGqY7Jc9QNW0/KhtCCefpAtdN330qA2Gf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4SkWX4K1+sOQitVM4Yrt93Gcpb4LJbehcduOqHEShK4RS8Jcwd6PisA43NyLKZZ8bKUimsNdiZlZC0rf6HBIUSWwL6ggCgrOEe2jrO8PITKpOotV4TnRHE/td2xjpCOU+fIUBRvN2GpwF9zjcOXtbvB5mNfG2dwg+Of08QYuWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fxss9k4E; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fxss9k4E"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1923f15afso1453745e9.3
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637234; x=1792242034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHO7lW8dXTEw8No+XY9Ehk8i1Df2SHzGS4HhV6BQdcU=;
        b=Fxss9k4ElVmv24+mmREOO6opmUZEGkhWnuG5EJSu7QC2s2uJkoOc0qwRzHjSxmAySL
         zciE1rnLjhJU7leagND1WFihA8o0xryci9Ik5hwVy7Sw7aAv87DdOfYvHZKXP6hbEfA8
         mjN8peEz4Rx22ExO80iZo1b6caAndtek3ff3hOQLXdcq6mZseXwJiRxDZmJFKnI8p1J8
         S01T6D8XXrewugzFmsUGFK7BCk/Fq4A4kanQwV96wbcFbz8QpP7/rAc4zN/AiIzpaHQv
         aggB6SSqEUBpK5Byfy8wJ+UCreyBBjM2e7CxsG3ZXSvhvw3OFuMUNKVhHE7bVjfRZkaf
         Cu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637234; x=1792242034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHO7lW8dXTEw8No+XY9Ehk8i1Df2SHzGS4HhV6BQdcU=;
        b=r9MczyrcesDBbOdXL475e+Gm65MC2wpQmfMYQeW5LSmexXpaXL0jG6Z7mlHdUomgjz
         zPw4F3zGoYetkHIRDtZ8nKc58eNttOiSW84irLiXeSPhwXYK5iKnwFx6rDjbSgffP1Sd
         +fXkfFaRMxmddxZXQnuYK8sBzc3ESogBiwl3saLNb3hAaRm8UZo30qn1I/7ZHCR6UC5a
         X0eqCS4XcPWkcr3aC/2p4u6iWZ35Y0EiEoEPuCFiq2oD2yR1eMKIPstBf70qvIz+rBEw
         6seUdCKhsySnnpXU5yi/wuqQhygZBI2RUhAZ4WGh1AsFnPHqXucx5H8Fbt/9nFGtmd+k
         3qVw==
X-Gm-Message-State: AFq9FYKoISgQKs3NAvsGK30CIsOH5DclbbV5OQOuMmNEvLhXBslJ2rZ9
	H+urP6njuDjPtxHG9JyL6f8csD4p/bGDAk0vI/boDovVv/UByj5GVUkv
X-Gm-Gg: AYBFou1BqHG2ENkJfKt+gU2Q8MgvSySuvn5M0zZLeDoz2lTjWl3HUCCMgSb3rDoE+LL
	pMNXZwSfFCF9qlFHKH6alY8E2RHVrilPaTSwm+f26eYvLUhFAbJknlastVk2RJjeX/2ZYiTM6yB
	vOUwVpJtd9EWMHRYjVd9vqLyTciDlj9w0vp1FXSuOoDbxqS58m29eNQgJFnoPLmyW6OBHkK7ue9
	EWqDBdor1GOvrrHdsiQYghtfZnSszdhNVETnUoX2o9imJkEcTmfF7E9eaHlyPgc/4Bo2q0I+cZw
	9iMrb+gZwHGeatpcsR71QaNB2LCxwtkDCk26YUKKvig5wylKCamhIQxaMHwRUNAN9IWxjByhXaO
	IAa4UhxrLr+p0dICmSwJCjbB7siecmQDG/ASjLN8uEmYLMgrUu+qmkooYOkUBK/y6Pws8yaCl1q
	R7RBz/llZJhj9LH98xe8fZ1dhszGnVMM/RX06UoqToiW/A8cg8TAx0FOIqShMrX7764XIVLkuIl
	RCcRHKSfD0ro+Gezb31go8mphfOO6idN7546vMKQODmiRVtduU/3BFfzheMwXv1NqMCtQI5G+ya
	bZsOu+pkqZTPbEuZJ6URE12wv6eGTOFc7udU0TcFa3yrM0VdOZldXXlljfr7rC4CSJIsAOAI
X-Received: by 2002:a05:600c:4594:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a18e4d6ac3mr87355405e9.26.1791637233643;
        Sat, 10 Oct 2026 06:00:33 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:33 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 04/24] dt-bindings: arm: Add ZTE ZX279128S platform descriptions
Date: Sat, 10 Oct 2026 13:59:42 +0100
Message-ID: <20261010130024.177503-5-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SoC board compatibility, SRAM used by the parked second CPU
and the SMP enable method.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml  | 1 +
 Documentation/devicetree/bindings/arm/zte.yaml   | 8 +++++++-
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c5840..25a141f80b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -284,6 +284,7 @@ properties:
           - ste,dbx500-smp
           - ti,am3352
           - ti,am4372
+          - zte,zx279128s-smp
 
   cpu-release-addr:
     oneOf:
diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
index f028d2cec7..a1a3742219 100644
--- a/Documentation/devicetree/bindings/arm/zte.yaml
+++ b/Documentation/devicetree/bindings/arm/zte.yaml
@@ -11,7 +11,8 @@ maintainers:
 
 description: |
   ARM platforms using SoCs designed by ZTE. Currently this supports devices
-  based on the zx297520v3 SoC which is found in LTE routers.
+  based on the zx297520v3 SoC which is found in LTE routers, and on the
+  zx279128s SoC which is found in home gateways.
 
 properties:
   $nodename:
@@ -23,4 +24,9 @@ properties:
               - dlink,dwr932m
           - const: zte,zx297520v3
 
+      - items:
+          - enum:
+              - zte,zxhn-h3600
+          - const: zte,zx279128s
+
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc68319..d1389156c1 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -104,6 +104,7 @@ patternProperties:
             - samsung,exynos4210-sysram-ns
             - socionext,milbeaut-smp-sram
             - stericsson,u8500-esram
+            - zte,zx279128s-smp-sram
 
       reg:
         description:
-- 
2.55.0

