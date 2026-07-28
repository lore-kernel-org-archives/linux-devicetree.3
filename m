Received: from mail-yx1-f97.google.com (mail-yx1-f97.google.com [74.125.224.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E305047141F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785265410; cv=none; b=bzUreWApRkFf+ewDmffU5l+ccIlEfiouRSnWBLCqg9jtdm+pRmff5bpv3EYngZ8MqpTaSsKfTx5vXj9UInbKkE3wfb+M9Yt4740R92pi/x6B5XVkBlSKSBDX7eDxQ97rHPQZHWKJq3+7OWpUPjyWMJrUVURySDcg9sbnLrDWPPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785265410; c=relaxed/simple;
	bh=1xzrBy33KLcUh2Fo6WOjQjNp66pfa5jlZtfDWhLzcYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fYiPb4IUKNqx5G8c5JyC5I6UzBy+O4Bbiil7JsxYupx2sBoVwJ5q+/AOK7zl639NLTgF94HUWLvTaLc3w/W7kIjrtaghTIH3X8ltVnuXL30TKZJUd3qRKRCOOFPWuZxXLdd1gYkD4UqwU+tlANU82/u7ZLwRvHgT7EBMvzU4N+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dzPSgiRm; arc=none smtp.client-ip=74.125.224.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dzPSgiRm"
Received: by mail-yx1-f97.google.com with SMTP id 956f58d0204a3-66899c7b57bso66311d50.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785265406; x=1785870206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jD5hBY+xcEEWI+IDnVzAov300+ilRU3clyqXwW86j6Q=;
        b=qhEgqALTRAB4RCINH1BHmLpSl4kL8/xhb8rA+30/FbLvNpF/7oSeYAXSopNtJNWf+h
         qkZ7iCZ5mqfxFYwFOZftsoDrv6ySchuaQDkswassXwVghD8+or4GpJ5O+snz1OhGvEiI
         G/OfP7VYiZ/sYKvjWtSWvaTx8fOholNSgVgRxmExDhAdaGo46Ukk4scIfpb4YnjktOpq
         FpZzRH2glZfbrIoEfQRY4pENPkql8ymR2MRPHW4ajzOxm5vtrPYEAGaZ+RTKZCSZrAwP
         j/DNx12t1TeSoZo3kybsbicUPgOTe3AUnuyzRxxiVWubmXOnZPJE4iUbGV4hV9WbRdVU
         KrSA==
X-Forwarded-Encrypted: i=1; AHgh+RrxyCQyFde56d/51nAIpSwm6R1a91XJwJatfOy5M3e1pY97gLDXx0Y7rdzc7GJGb/IkkAPWeMFPpkHT@vger.kernel.org
X-Gm-Message-State: AOJu0YxjaCuyyvw4hhABARkd98knDqv6t3Is7bhPFzhI8KmVtdFOcltI
	fU6AA/LjkNuQmiylBLaYcP98K//E6lRCh9lC7YiE+uXK9EW7BpXg7FjsF7u8j3mwBI4ph7d4Qsw
	D1smNf8TYidVj4BobWn1KGJLp1PMqLG2tjQ8M4pzUfFCsgTAvSEi7JqyTlniBJbRc6y6eX9ZjXi
	m789epIpzyM4UNTBgyG/vL0qW9P/q4SHDAFU1xLyMRVKwHmmz567k93RxUM56rAHxzvkyZLIKV+
	Lm1Obh2B3RQ1A==
X-Gm-Gg: AR+sD13Df+E1UXjWQABP65GSQIsWNBDPxoZ7t+6dmlbbILYqAc2Oy5qdNNwrTaMQZW0
	ys0/NGpgNIpTwOisrN4qx/BRK0kfE73qGrtBU53kHaFoxq1ThesDnwVHyQUJ7pbka4LDm0EHTM+
	c6xWIcAi4SKBxjWIYRH7aImgpZD75zbJNGq31QU17jnn/EZMjDwmWXNIBmZsAXyVY8I8jpyFYRr
	k/RCUjIC9IeOTDoIWuzX1GR0kna/Uhnwc7fhm1Tl72MUMywkWR+XOppc1xko0WelBfie3g6FUmg
	kmMQo67WwJ03Kh0Cl2oV8bIuN80K20IzwZcWZBulBUjhG33a30YsouAmYx7/Kww21nU90OZX/eX
	Y4aSju9VHI1HT5AafM2pxKEGr6JLpxxehlu+pEpmTw+4XJCcMAxWWoQYa8Pm7T9xUF23gyuwzmX
	AfEZEV8TUfz1t5Ra9ePTHWnjJxo9kTZ0vY
X-Received: by 2002:a05:690e:14c9:b0:664:d0ac:7c8f with SMTP id 956f58d0204a3-669056e6cf8mr1123457d50.30.1785265406466;
        Tue, 28 Jul 2026 12:03:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6691218c659sm37987d50.2.2026.07.28.12.03.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 12:03:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e934385db1so2153296d6.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785265406; x=1785870206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jD5hBY+xcEEWI+IDnVzAov300+ilRU3clyqXwW86j6Q=;
        b=dzPSgiRmqkAgeTmTqSz0DecmcIpYd6d9JrXmRzKAihVooNtzoQb6vfy/Y5ffRbaN8e
         tfTtPPTxZyePPvrjoubddih9zh7JPjUYcS5HXm69DnpQYhzdZ5RT1/lNGyQ8D+LCPNvB
         Wr++hmAzi/YCCBlxJS5FDhOrk9e0quzovFP/k=
X-Forwarded-Encrypted: i=1; AHgh+RoJYts0C6vWlongM0HN+2SkMs008YUiYJRiURBKf5nzgDLKPrQm83+b40f7laASnUmUqKm4ZZuziajN@vger.kernel.org
X-Received: by 2002:a05:6214:29c4:b0:907:5a5e:ead1 with SMTP id 6a1803df08f44-908173340f0mr42102086d6.61.1785265405548;
        Tue, 28 Jul 2026 12:03:25 -0700 (PDT)
X-Received: by 2002:a05:6214:29c4:b0:907:5a5e:ead1 with SMTP id 6a1803df08f44-908173340f0mr42101076d6.61.1785265404954;
        Tue, 28 Jul 2026 12:03:24 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd8b21esm5502856d6.46.2026.07.28.12.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:03:24 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Avri Altman <avri.altman@sandisk.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Erick Shepherd <erick.shepherd@ni.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Tue, 28 Jul 2026 15:03:13 -0400
Message-Id: <20260728190314.2325906-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728190314.2325906-1-kamal.dasu@broadcom.com>
References: <20260728190314.2325906-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

keep-power-in-suspend already documents exactly the requirement
needed on (e)MMC platforms where firmware accesses the card directly
during resume. Rather than add a separate property describing the
same contract, drop its "SDIO only" restriction and document the
(e)MMC use case alongside the existing SDIO one.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
Changes in v4:
  - Dropped no-mmc-poweroff-suspend entirely and extended
    keep-power-in-suspend instead, per Krzysztof: the two properties
    described the same "don't power off across suspend/resume"
    contract.

Changes in v3:
  - Renamed from no-mmc-sleep; dropped S_A_TIMEOUT framing per Ulf.

Changes in v2:
  - New patch, replacing v1's card-level quirk, per Ulf.

 Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 3d7195e9461c..f4663b318435 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -291,7 +291,12 @@ properties:
   keep-power-in-suspend:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
+      Preserves card power during a suspend/resume cycle. For SDIO,
+      this is a request an individual function driver can make at
+      runtime via sdio_set_host_pm_flags(). For (e)MMC, it is instead
+      a fixed platform characteristic, needed on boards where firmware
+      accesses the card directly during system resume, before the
+      kernel's own resume path runs.
 
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.34.1

