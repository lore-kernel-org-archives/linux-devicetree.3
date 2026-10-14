Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D10C3CFF65
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962577; cv=none; b=L4akglnms7b1+ytc89JnVn5fG3fJBl0PNpF2JfLTxIyw0MQ8AuZ2e47tsU3FHVsqGuo5WSswVN4HQO7NAr4ONnnSq0zEnBFRizub/h/M+LrEwuiuf0A25SETQEc+hDoBUq0TncJcshTrMguh1KTQASm/msPrd/SKccoJvd5OvAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962577; c=relaxed/simple;
	bh=RxMFHdBPhcbQk/XvMD1Q3LpCKXSlp3PhA0DJPF9bQmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZB2FobtUNgiW68FCZdt0O/enAcSVsD0FfDAO2M5FhwMUBJ04S1ozWC4PHTJPq4wkdsNo5JFidRB0Arj210zJqZ6FvFDZlomyvuwh85WxMjzwzlgd12aw6dU04MLjPWx0bp+dVXNsKjdjtD0AHljExzHGFUD2juzNA+yForohvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUOPZto9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUOPZto9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so10935645e9.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962571; x=1792567371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cCpO3mm93VdvLC92oeje7VMfvdRi9PpFQzlDPGKJXc=;
        b=XUOPZto9HVavWhNdje7Bnj2cew0P3CDLzcyXrHqfN71VoloamOYcTZDBDwALbhRzqh
         hrrPQOK+WlLqrClgziWR/Pqhi0Qi/nNIlGM9YKzSNyTGElvkoamrKJUv/r7T9jsglU5q
         n+FJoliXJdDkjDvO5Nm9uTtJmD/Md49QXWX7icBcen4j2CWPCXDmfdb+CN3bJJ7L7muU
         EK1Ype2ePtPDxnWhLt+d7imf/kzXpZarucUUM+nLLcBe7Cg5bkXOYuyCTj9/uQGx5v2l
         mJWzqCr0Zdzodp3KKX0rbBlpwvgjXWdHYhMTAym1UjKsRUzWYigY9OvqkC9oSzC0vayO
         CUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962571; x=1792567371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cCpO3mm93VdvLC92oeje7VMfvdRi9PpFQzlDPGKJXc=;
        b=DdHRWE8Q+rDNl134eNZrG5RpeMe21ztsDZDiKfxwQtrkzo35qQDqYWkoXqHBReaRSe
         gwF9Lk+YJaqwndxuWPV3GvR2WXIcvVEI1cXDlxMerGmeRfXnjo0eLhtH9uDK0xiuJtHy
         Vj7yp4Lf9KbZP5PJmJmU3q19nWs7WeEAfeF67YzQbmlBPg9QysmXzXTJbamyPvV4Kse+
         sFbqIbM+bMhhrqJ26/QqLiTWIoeoqtQ336ErH15McmOYGjRU+LR2Yfw8e1e8PZH5JInV
         3qL1xe5M3qFJFz5WXZ1f/VbQHjSegyTPq2yMS0Ze+sOxDmbFMLa8pwveoEoXEVPL7Lse
         sXHg==
X-Forwarded-Encrypted: i=1; AKwUvByjVbjqAA26rEUfPGmhebESVSfr0FNG90WYJq9RSQ6P7ABesGdRrYLMvuAuzQjJrTOZzdP/ZOSFyrZS@vger.kernel.org
X-Gm-Message-State: AFq9FYKll3MHvbv/O7krVT6DGJZZ95a4bo5hFI9sK5AAw7WYQ8oZNOKt
	5XfU09oGuXUn7St2naq0pDEy9jaO3rYmVpeFIpSWI1IHE8Rh3rUG+DVi
X-Gm-Gg: AYBFou2kqQ0zA3T/8xsLUse2+fjbvaNbuLrLnlKxyujIM4hdvLBl8IyAkcFN8s5LM80
	0yTEo7zVit5VC3MHieppkwJr3ipzjjCwcazk1/Eypx37THLycAR0UrHHe7d11YL/4xpdYO1jRbw
	xqZHYdaA4/KeI8gvAg6gl4Ikc/iwUS2/fIqr7mkADBUfZ/8f+H4g3B/TKBhhnIwmn+Jz/2MdJ3W
	GretR8T6pr8mByKoNEvqPjU/FMhkKO4+NfOBHVVnK1pVvlz88Zp42QkfzWMnFRZRrk3z2o9ZtwY
	EUHCkfQjjNg48cJwnRubBmDB2bJlVT2y9y/dQMpPzr5razGqyz4+9+AoiBq8IMufg0aL0zH+BRo
	7Axi0ylcuk1jffOo7iqtRC6RlsPytKZjwxguBk2PjfGINgzJ/l64/ceVWukiUIICDf5yfarFDMp
	6styTg8CEwXFJYQ3od2aJMlNZGjotA+yRDOZhKn+xNhIzwwWhT2cjZrZgN1vAgyvj0hUF0Jmhyd
	2ZQLMdaGKLoD68oGs2KCf5R5hjE26RxE7msxAWd110Sr/hbaxAWrIPtsSt2Omt1dZyeLe1fqQAS
	6Hovh263prUrQemasywJXMDBXysDmZ3TmrET8lM4NVSBfqt6NQS+tPrG7P8WZg==
X-Received: by 2002:a05:600c:350b:b0:4a1:ad01:f8dc with SMTP id 5b1f17b1804b1-4a1ad01f924mr86376325e9.21.1791962571262;
        Wed, 14 Oct 2026 00:22:51 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:50 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/24] dt-bindings: arm: Add ZTE ZX279128S platform descriptions
Date: Wed, 14 Oct 2026 08:20:42 +0100
Message-ID: <20261014072109.1759502-3-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SoC board compatibility, SRAM used by the parked second CPU
and the SMP enable method.

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

