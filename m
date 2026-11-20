Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146437;
	b=N0HCTisGWuAeErCbfFv1WdRnVrevlnj+sXncQX8ljY+jIgt7uhB6wgHmsux5dtyGFuS4
	 jZbhu9CwuV3+7DXjKL4e3NQDs6ItOYNjfBmtWAiLUZfqP0WPx1wgzdBqqAxjiRhy+mKcW
	 NgiWwU/1oHX5g23GSqLfQQaWUGNVoIpjaKEWvtQ/TWoJgbNrPr4Jcy4l/5/HAZF1i02Na
	 CgvXUWG4htyv0PGAxoC/avzmSYPSj3zarTZY7/cajIF9af9abC1G79HHeLOlturETOZCK
	 e9IVJDvLzq9PVYJmicAEjqwsXkdLlCMd0klgrjbqmQAXZL5QlpxKDe6Ht/MK7EDcTng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
	b=LLNppjww2gkAjoIHsOFztZwwRT2g7cMYbO+GRoPeQwQJKC0GvMJrJhpjvxD1glMsYdZK
	 9sxPYYy73UZJkE2TBFuMr6T60ansBEEkmD4Wc7tWT7WtiJQ4sm+fxDa8KRND5T87tl/oU
	 EiRIbDMH6fnDdF/x6iBfyHyZNj24Wax63xF50jMnB4oVfnaVPsKvGq7zrFByCjGwYP8BS
	 ijlkXS7mF6IO2gYWwffOYiKHBbYpv+MCSEXACaVrdGJRyHkHqLFC0pi3A4ZX8DvATgldz
	 cTfUsLNh7NR9RAiZsbb1xgn+GJEREgLpNvSKyIz7Wr6vNloQTIVrYorx3CpNnmzgNyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VkkUn9It;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63032606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63032606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VkkUn9It
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f04244c3d0so3603405ad.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795146436; x=1795751236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=VkkUn9ItkidKYbXcfHSlfPBZudP9K2xImqcc9RRLJHf7WAOg6qYPjqgDmSdxSksIm5
         +OwMgPNqm/QwLeG8YjbbxUdXwf0xJRFWI/oeecvV1io7KyYaQgHIPFkZ1bU44YvykqtP
         oG+p7kWShpr0Tv3iHYxetTFDk1pkcBedBccFf94dCWx7GujcNp902VE/NmNK8rUHIVUr
         VoKwrnxzAYjddxn3hpqTSogjJV3jSCmAKS118ZasXUSQJlxJCyC5yqWnJj6tQ+7Mcpad
         pMyY+iom0k4upp3/oMlFrhp5AVzjtkELU2ceDglZ0kevpjn3UCpIqQiqFSXis09w3Dqh
         nnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146436; x=1795751236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=bS3Tg9FsG0mAUIX0AP+rYCGJ59MP0Rcwm37QVA4Kp1kzC1yxLfBFPLOxNjP50FOy3V
         RIYXHHzqfcjSUgYUZOkB0vwPadOKiJj0qRC5MWbl5deCD480pCGyyD9UTH8n/g88l33W
         Qcahjj5xVcgYwaNWZE8htDaRpsV1LTcVDlJ3ZXWeM9+To8I6zz4A7zASG1rPn20PjnD4
         2ycIfgJwWm+WiOdEChEBSaN3Or6bf4YR+rWQHFkC0aoOKgDljGHUC1gMX+dbMt+g0+nl
         yNn+dP2ECVT2aXsJzL357GnVNYRJc2LjhlC8zFt/5zlPkYAq8STZqIto4dZ8KJjqO025
         rhog==
X-Forwarded-Encrypted: i=1; AL+hErHihTQvpopeGRuPa2uhzlDwc4PE6x3hMQrkgQ+AFqGtF/uK8J7P3PM49lDCc9y8gk7rhYoHW9KObObw@vger.kernel.org
X-Gm-Message-State: APuU4Z8BgnABZ2al9E009tL9dVtjPH6Id0vxTQjl6HbBSA/CHQrecMHt
	547M35r6dhrKTKJL9BBqFjQs1JVLaKXGY+ntJJytxEMdbS2VFtwQXQz97TADZ5B8qQ==
X-Gm-Gg: AZFdTZcyvyLwY2WkOkW3gOxaUM1pYYfyr7MD8e5Fb1AJ7hKEZ3CpBYAZHDzH+V00ISY
	8utSBtS9I68lNkcDlhsszNL0LTUZ2yeAtU3mw0LR7J+fklP+bCqgcAV+2Nlt5YFT+iZ6EuT+1T2
	ThQly7ErLxonTtX7jCevGdjHRYWjrFngNCJx9qO52LPomDDiBGzFl5HlIvKII0QTWeafyeIrFgy
	+7Dw1iJvdMB4THRP0mNkWzbzYIuxze2X9H8ug/Ao3KXRMcEOjlRc6XsZEQedz1EnLER96zhnFH/
	Zqi59J/SlChiJrMr2SnBbAtOQM0WamcZqoWT6PnUGcoAyLu75x4235V1PIrHh1ZcIe+iATlR7bi
	Y8LF6F5pzzzXzucmMVd8UR9vGbnMg7kYcEutvg7eP9Di36rFfU+F9ZYADvMzzhxs0JuQKa70D8P
	bLK3Aonz0FJQH5UPwcof+VVtWeI5sjgxaoUU3rJrPyeNtoIa2GQVMbhYyIK8R4RZ0oC1kF/dT9q
	kxRpjIw0BCK3EPTYukODoya75MLqOdIeKKoghZeXU0KAjymuCIiLmyPrTbKFOKRGKV48C0YI5cY
	q8W5rPSFU25zvnK15LQuhpUuvmSgn2SgCxixUs2wY0tRJfCdS0zuiL8U1O0Pd8eeYCbNGDCKnpG
	qZIt/7yXIwEYM2Hre
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr1557473a91.52.1795146435786;
        Thu, 19 Nov 2026 19:47:15 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm3854582a91.3.2026.11.19.19.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:47:15 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 1/2] dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
Date: Fri, 20 Nov 2026 10:47:00 +0700
Message-ID: <753a575720fa88245d12b19081741687271f6c2c.1795143925.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795143925.git.jjc@jclark.com>
References: <cover.1795143925.git.jjc@jclark.com>
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

The Global Timebase Counter (GTC) of TI K3 SoCs is the system counter,
the one the Arm cores read as the architected counter. It can export one
of its counter bits, selected by GTC_CFG0_PUSHEVT, as a push event
output, and the Time Sync Router can route that output to one of the
CPTS hardware timestamp push inputs (HWx_TS_PUSH). The CPTS then
timestamps edges that fall at known counter values, which gives pairs of
CPTS and system counter values.

Add an optional ti,gtc-push property giving the GTC CFG0 syscon and the
HWx_TS_PUSH input the push event is routed to. The CPTS driver uses this
to write GTC_CFG0_PUSHEVT. The router itself is configured separately, as
it is for ti,pps.

Signed-off-by: James Clark <jjc@jclark.com>
---
 .../bindings/net/ti,k3-am654-cpts.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
index 3572749147fb..7bf5bedc2b9c 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
@@ -101,6 +101,23 @@ properties:
       The pair of HWx_TS_PUSH input and TS_GENFy output indexes used for
       PPS events generation. Platform/board specific.
 
+  ti,gtc-push:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the Global Timebase Counter (GTC) CFG0
+              syscon
+          - description: HWx_TS_PUSH input index (0-based) the GTC push event
+              is routed to
+            maximum: 7
+    description: |
+      The GTC is the SoC's system counter (the Arm architected counter). Its
+      push event output, one counter bit selected by GTC_CFG0_PUSHEVT, reaches
+      a CPTS hardware timestamp push input through the Time Sync Router. With
+      this property the CPTS timestamps that signal to provide hardware
+      cross-timestamps of the CPTS and the system counter. The router is
+      configured separately. Platform/board specific.
+
   refclk-mux:
     type: object
     additionalProperties: false
-- 
2.56.0

