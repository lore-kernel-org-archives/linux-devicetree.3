Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724561;
	b=Nlq25Wh3Eaj+O/Db6wFk9UHahTETX20OM6B1A+t1edb1jxnE6iyi4xwWjO/BtuuMsWp5
	 tyOJqrdYg094naOHv6FJrgT2rBNNumub+OQQcJi3ra7L6CLuiouEFyXbypd985/9JFD8p
	 ZAUODIxJ8/CTlFgWbjRgNmXNyZX3YR5B1/kjD5SfoXu8jeUdzkdgL8nfeJroQ3VwnZ51c
	 CXYW/9iJ43yeKlwVD9ufPvFnal0Y3tsbJlOY0uOXydt+DTBF7yL2tGoqoQEtz8VGCfhl1
	 EpVR2ZLURidU9dROatij4IuAUmtpB/G4URZt4XJHBnn22/M6bmaikipiYr/gqiDufKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eu/jciqpUTlRe4UepQQoT19Cl8pPa4jSIfjdhVO2wYA=;
	b=ubLcJMmi9lOkvgWN7NDwDimAxpEAr/Bh2yF1vIZQSy5L5i95wnArkqkw6XPGedrbEkP8
	 OU5TGYterTZsnqLCTx158qaXDiIdIWBytZRnCU00ft+6d6RGRwbQsx7XiB6xu/DJHEe9Y
	 KCpJd+WSQuDErMA9Tj4FxHu+J66yXgsylEdQzYpcmCaNVTb73ZGfaly6lM4zhY/gn7nmv
	 KW8U+p6ULW+I9t5FhqcqJLiHbiItjOsjIcKEnnIDnGjDhHeJxI1xBaPkCBq+Ofn/ymkEJ
	 f2nzU/RE0gbcQsHjuan6ygOKbVPuQvqC9hHN2KJeH/hDwxo5XEQIUQj4GYb+F0X27Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3KXAmT9;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC75C606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC75C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3KXAmT9
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386cf1041cdso3959059eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795724560; x=1796329360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eu/jciqpUTlRe4UepQQoT19Cl8pPa4jSIfjdhVO2wYA=;
        b=R3KXAmT9MsktSm5oNUEI4ygpv5v1XVS/vi9lc8iHNhY4ZI1ic5crzZvzIQfgCZMVjH
         SVH4oZoYzmUCLkiYFRpDtzHKUuYLa7KGYLlDsb81PguIWL2tXypudSIzDgdcREB6q75I
         ygHHGMS0ShlgT4gZglPyOfmTBGxx3wf5lqP5BZdIaPcMYeKTtOZmIbEknjZxKCXHIT98
         QvtnX8MPuZ4hM2LOI0m/V4D0IKphG6eYbZNxcp6a3HtizQTxzceuXktUkGcUuM6Qq0RE
         eTudZ7gq01uKpWKdMAskvMKT1CxDWBO0eTIyctI6cBjT1o0KJuHAD32g60ILy8UOhT3P
         TGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795724560; x=1796329360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eu/jciqpUTlRe4UepQQoT19Cl8pPa4jSIfjdhVO2wYA=;
        b=PxBko+6W+Y8hxaQSvjj8lDRKrXEWaFZQMyNMOptH1xI/DmTJP5vecgGBtJSl3GIOvW
         QcHLBjJ2QMndmKJsV3OmuODePXl7GVVMEtv6cy9DOvZ/NcF5nlVcTQREj12Wg+bqM9NW
         344oUEDvvI27ecGtC5TNnIqp1Df9jLEK/jp0DpkdRrohVSR7yRlgROFCLBHd1hA9SvTy
         0gMS2sBPwjVHUlS+eEraCYHW4vxbH+dwXcrtsROcU+8OrcShefc1+YWJhPRCliwX2j11
         +lFV8A+KLKWCVhWq8oDkZJOZObhssOtsgTNkeaRVOJdRMRKeS15Nl683iskwVjc81zIK
         suYQ==
X-Forwarded-Encrypted: i=1; AL+hErHFQ40Rp5ImKGQ4wPrl1No7qwKH811i/gTIZw28p4VXDQgQPVXsHg9AqXVpanvYIL5u0sO0IjsExuCd@vger.kernel.org
X-Gm-Message-State: APuU4Z+XVpclRdV2ZYkyfv5q0unGsu3o7he8Ag6rWGdPx/eugcNXfYIN
	357EPM9Mdt+vt/1uk7cWOqXYLAll9pX4GLl1Lj7+dAIUzKvVim5miVHZ
X-Gm-Gg: AZFdTZd0k6RvN074aOUejVTxwJNS3pp8jBBbkpQLuElL/7zTXI2A3WEsRiuIWR+FYvN
	4lHfJa9Gf+JNBlSOuvGPZ2Ki0DrAhnJxS9jo9hO2FvzQX6QAherMVZX+w0xIf09qrUzJOybCzCP
	Vv6fF432xbbl1C2j9ezuuYsWZ22m6vk3RQLw9QR5InrO2uPJSchFtNH2jRVjD473QVj3Xxqr9O9
	PVG2R/YMhlxznFbF+mSqGbx6hV63Yl/EL0QWRG5GZWz/FtF1+l2eEjihO2aDyZDcOI+cA+NeY1X
	O1Df1Baodg/ChxtoF1U++wkIK/NXYi1fJlS/bQTVbG04ElQDVN51W8GI0qg1qKdoe73bU6n0uB5
	432IHC9u7Y5vnZk0EJd8SmHjARg+gq7CM5VAmz44uo/OU+kFH6bpmfKiKxMCny6vQlTCP3aSvg8
	ahDYJIoXNAJU94szGlJJXFGLk1G1jc9Jt6qsjELTXLHzu61cCzEWveGJayQHknPdHAirvOwFqyP
	uXAU8snKS9apD8AXeHfVdzGH03bq54DLiR7/swIDh4vc456tqShjlqP9a0OOYm4M+iJAiwbU9PQ
	4BoUtHLGnv8Bh4tYUCXBhck7L8Ba2ExF1bd2570QUZvPrFLkzfFOtulkAbT5sCtDcEvg/Q==
X-Received: by 2002:a05:693c:880e:20b0:386:b26b:d67a with SMTP id 5a478bee46e88-386b26be80fmr13019351eec.12.1795724559778;
        Thu, 26 Nov 2026 12:22:39 -0800 (PST)
Received: from mrprachoday.bbrouter ([2402:a00:402:9f97:e752:d178:849f:9d04])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm73987372eec.24.2026.11.26.12.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:22:39 -0800 (PST)
From: Prachoday Sutar <prachodaysutar7@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pali@kernel.org,
	afd@ti.com
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prachoday Sutar <prachodaysutar7@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: power: supply: bq27xxx: Add BQ27Z558
Date: Fri, 27 Nov 2026 01:49:58 +0530
Message-ID: <20261126201959.28743-2-prachodaysutar7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126201959.28743-1-prachodaysutar7@gmail.com>
References: <20261126201959.28743-1-prachodaysutar7@gmail.com>
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

The TI BQ27Z558 is a single-cell fuel gauge documented in the same
Technical Reference Manual as the BQ27Z561-R2 (SLUUC54). It uses the
same standard command set and register layout as the BQ27Z561.

Add a compatible for the BQ27Z558 with "ti,bq27z561" as the fallback.

Signed-off-by: Prachoday Sutar <prachodaysutar7@gmail.com>
---
 .../bindings/power/supply/bq27xxx.yaml        | 72 ++++++++++---------
 1 file changed, 38 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
index be0f1f729..28b04732e 100644
--- a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
@@ -18,40 +18,44 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - ti,bq27200
-      - ti,bq27210
-      - ti,bq27500 # deprecated, use revision specific property below
-      - ti,bq27510 # deprecated, use revision specific property below
-      - ti,bq27520 # deprecated, use revision specific property below
-      - ti,bq27500-1
-      - ti,bq27510g1
-      - ti,bq27510g2
-      - ti,bq27510g3
-      - ti,bq27520g1
-      - ti,bq27520g2
-      - ti,bq27520g3
-      - ti,bq27520g4
-      - ti,bq27521
-      - ti,bq27530
-      - ti,bq27531
-      - ti,bq27541
-      - ti,bq27542
-      - ti,bq27546
-      - ti,bq27742
-      - ti,bq27545
-      - ti,bq27411
-      - ti,bq27421
-      - ti,bq27425
-      - ti,bq27426
-      - ti,bq27441
-      - ti,bq27621
-      - ti,bq27z561
-      - ti,bq27z746
-      - ti,bq28z610
-      - ti,bq28z620
-      - ti,bq34z100
-      - ti,bq78z100
+    oneOf:
+      - enum:
+          - ti,bq27200
+          - ti,bq27210
+          - ti,bq27500 # deprecated, use revision specific property below
+          - ti,bq27510 # deprecated, use revision specific property below
+          - ti,bq27520 # deprecated, use revision specific property below
+          - ti,bq27500-1
+          - ti,bq27510g1
+          - ti,bq27510g2
+          - ti,bq27510g3
+          - ti,bq27520g1
+          - ti,bq27520g2
+          - ti,bq27520g3
+          - ti,bq27520g4
+          - ti,bq27521
+          - ti,bq27530
+          - ti,bq27531
+          - ti,bq27541
+          - ti,bq27542
+          - ti,bq27546
+          - ti,bq27742
+          - ti,bq27545
+          - ti,bq27411
+          - ti,bq27421
+          - ti,bq27425
+          - ti,bq27426
+          - ti,bq27441
+          - ti,bq27621
+          - ti,bq27z561
+          - ti,bq27z746
+          - ti,bq28z610
+          - ti,bq28z620
+          - ti,bq34z100
+          - ti,bq78z100
+      - items:
+          - const: ti,bq27z558
+          - const: ti,bq27z561
 
   reg:
     maxItems: 1
-- 
2.53.0

