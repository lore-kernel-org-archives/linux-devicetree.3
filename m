Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895565;
	b=aYakuSEK8dnWCa0Kl88S+iBIrZO8XgGBwWAWYcA8E27pF7IxrMt6UTDmYIdCZM/vsgP8
	 R6VYJpe1ZDuB672b+EXMbwAO7zhJKh/oL8+BZumViSbAc9UApOJa4p3n4gSSgpHNVX6A/
	 y9J5lk0AFJQUEdyk9azdC8xQTTMKvHQciP817IzA9J+G+Qlkrt5jHQjCnbetmxWpU3Cj0
	 VY1IKp3Nt3ITSzF1T7tOUnGH16qo2dTjHcV4Hcn9X3Ktgev3tIa1wYxFMiPPMwArAUXy3
	 +XjPHkdADSxkJFVB9k3tT2GMgk5yoVbU2FW9ke04HS6F71tS6sdhP8QKVJIyIjbVMJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fn/7Nz6sEtWAi655Kzihh8bKMNCzwwsZZnavj9Q/a3U=;
	b=MP9nPFSn7zi81Xv9IlwXoujiGROETLiob+mcDDkm2QCdR622OIOCft7makdKO0ODiD38
	 MduORy12WYh+SuuAPy6etnHLXWz3nyIYIOfLBBucsK4pBOWvyzbnlh8VvgEMrcF8Bmam+
	 MrlKiB/8GbnJ3ZklZ+Sh+3oEHg8I137LmqERw7k0YH+VSP4Z+6DGCdQn8ahDcSkJW97kC
	 vYnt9rNIuqfwilqgOSqGY7iaRw7syaKYeSGeF7Q+gV3He4qzSFONa0nC3S9GencLJ+AKb
	 plplyrgWMiPxDS0TY3PqLnIVvBOa/Ty/mtDJTwCpUlXTdqPVxabRASetiR+2p6BBI+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tWi7/q6v";
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C6606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWi7/q6v
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so4007823b3a.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895565; x=1795500365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fn/7Nz6sEtWAi655Kzihh8bKMNCzwwsZZnavj9Q/a3U=;
        b=tWi7/q6vl+7+X0c8AHeIlPtB1P3zi9lys0vDqtm9cI0df1oFwj0GGruQmuxMfwEKiP
         Xvq26YKyWHF3hcJy0fdM2hrqpYAtw2jBCV/+R/03nHhKia8DmFmUExRQTkCcNIlt36f0
         tI1Dbny3jBaV/TPAa+EbI3wAFvTMVwiDOekDX38XhGHGuzkqD0/gBiK40ack13/ItbA0
         /0E19o6ShnYSdNojBqucpQEnp1QKszf6c899p7rLSCSqyuSo5Q34M7iCc7lrZsD/pcop
         maoUBTLffKO95rskK6Jn7FMhYvVuh/4oMUe5mmN83E5da2u34m9NRrSMZT4vmXJIhKKA
         QaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895565; x=1795500365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fn/7Nz6sEtWAi655Kzihh8bKMNCzwwsZZnavj9Q/a3U=;
        b=itr30AzN3U1q8sToe86NWr/e20fAFVtYGpe+rWmX8g6M4wORpugu1HF3Ho9NBS7ykV
         O2mjQzvL5SPEiHVOEJKmzwGtkthmDwOcHWRookz+6UxBcpGTRrWui5iCNjsbAqC1x4Pe
         1jBy8xlkxLB5Dsu/SnSIVsOj1bxhvp4+lNJ+V6Naac7MVxh6SHO0KdIWAtXn3uGBFrXW
         KVtbpx6/b2MSLlt7kU2iq3gR0HzfX2+sA+S01idPEM8JWwZxMKkJaBP9M8vyMWG4Aea1
         +Sv9vvPttFXXEACElVzeFdKnysiK5OEROsFpKrPP92ayg5ij0BGPYEKLUpXX7CHGge0F
         UzkQ==
X-Forwarded-Encrypted: i=1; AL+hErFXmm4A96+OWlnuM5y2XzN8Nes6W7VgNqutIAJuXEQo2lmd7ITsnGimivMLhIbtsvJKcps3w7mBboCL@vger.kernel.org
X-Gm-Message-State: APuU4Z+1zBX3L25uaXK68Zfs7D3D3FbmIZ4CfmlXfzhCEh1bge0tuINn
	q5UgkzNBiA0AsAKJe5J/aZjaMMG4vTRc6b9A1yCQi0L88/W50DcanW1u
X-Gm-Gg: AYBFou0qPVrUraKR8sHJhXTFGz1K1IvuGP0xjbn6hhWhEtss9Lth1u6QHOrlXL72HVL
	iRV23tvP5FdGG3yY93VYg6UJ8f/AtjGLsdKFHVFbc41HWlITrI74TsknUyk1H0f0o11BLGTdlSo
	9YmAN2LyUywNrmP+SgJ1YowgITScH9J3+milSrZZr/7pzxqPsPBMiNCPamucXux9gMcjKrKf+5w
	u11GgBjbx1u/gOAM3XonxvbPpb1o+vCl4ZMDjgi5kv1nCju75JvTVuhOOfQgiIIP9H0lHxKf+ez
	WZtgaqPoD7T7ueedZPiqMl5UPrdhi7wVmRgXqDBCnMdJZw+Q7ejHk+/gO0FR5+WD1wsl4GK6FbA
	8enFTRIda3s6qjwfuD6NpSUmgoGLFuF3NXGGB8rFNDzvlOv5tPHHW+l1+yH/rvetF5foX8GG6hK
	SJJiF/YEQgoYFCm1C5qScSosN+m70AElMk8Zcy05ZlGhM0b76Mv+dakK419e4BsDKd/ybq+7NdT
	nEXWd9Rhn7hQmbj2DzhFYUx2MWJjiY1fmLBpqu5VxXbvv9zaUCne/pbuqG408KVVUhFmA26UlfS
	WEeFBcNMdWTf3iW5BIlnARymZ4lY21gkf8N57Hy2eQEWSzzupsT8uGPE72PzpGGpDROqT7aWc6B
	Qmo4SKkq0IHA=
X-Received: by 2002:a05:6a00:1990:b0:8b5:efad:d088 with SMTP id d2e1a72fcca58-8beb609d4bbmr11260989b3a.9.1794895564913;
        Mon, 16 Nov 2026 22:06:04 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:04 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 1/4] dt-bindings: reset: nuvoton,ma35d1-reset: Add #thermal-sensor-cells
Date: Tue, 17 Nov 2026 14:04:58 +0800
Message-Id: <20261117060501.2611071-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117060501.2611071-1-zychennvt@gmail.com>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
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

The system management (SYS) block of the MA35D1 SoC also hosts the
on-chip temperature sensor. The sensor is controlled through a single
SYS register and has no resources of its own.

Allow the SYS node to act as a thermal sensor provider instead of
adding a child node that would only exist to instantiate a driver.

Reference the common thermal-sensor schema and update the title to
reflect that the node describes the whole SYS block. This makes
#thermal-sensor-cells a required property, which is fine as the sensor
is always present in the SoC and no driver depends on the property.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/reset/nuvoton,ma35d1-reset.yaml        | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
index 3ce7dcecd87a..a0cb0f98c1b1 100644
--- a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Nuvoton MA35D1 Reset Controller
+title: Nuvoton MA35D1 System Management (SYS) Block
 
 maintainers:
   - Chi-Fang Li <cfli0@nuvoton.com>
@@ -12,7 +12,10 @@ maintainers:
 
 description:
   The system reset controller can be used to reset various peripheral
-  controllers in MA35D1 SoC.
+  controllers in MA35D1 SoC. It also hosts the on-chip temperature sensor.
+
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
 
 properties:
   compatible:
@@ -26,12 +29,15 @@ properties:
   '#reset-cells':
     const: 1
 
+  '#thermal-sensor-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - '#reset-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   # system reset controller node:
@@ -41,6 +47,7 @@ examples:
         compatible = "nuvoton,ma35d1-reset", "syscon";
         reg = <0x40460000 0x200>;
         #reset-cells = <1>;
+        #thermal-sensor-cells = <0>;
     };
 ...
 
-- 
2.34.1

