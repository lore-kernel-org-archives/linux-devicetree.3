Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426282;
	b=CB2WtJ4F6gLAEq7I+mU//9MZbhc7OftP/O855M+apkN8EnCkviN3udi9j/89lVrFuC03
	 VU/q4fJJP28UXmbgzlM+L2J2uo0H5LTS0/YZ0Ym7WVi3z5Ofzowc/ETqM2KIoTa1dlugG
	 1Z52kttzCEOV+E42PIyJ1RL/wkYX1RLQlaAaR/RgcRFswX1gtLSjrNXdNAPTy2kXCLmyF
	 m7TzevoBLXiTnhvWCe4JTaN5zBVuH0MSb1YRCSMBmpUo2bjteIV4kFkCTtbnLyT4jVBQA
	 uEuK6393km+A8NJ/JRU9nz8VGrl33A2bs/ky4vFoiuj12kj6xoHOFiZnKHLpZLncO3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426282;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
	b=r976kUorcH8U26hWN7+FS9AAKyLpwrUKYMyuZ4ExsyNeXITvjpPAcJtCOB9IbFDpRAH5
	 WrVgrtnVpuv5Wrmw2c/bWnpv4rRYHFwn6iq/ePR/HP2T2XULk8PZcCmLTFtPBaSBwvjnl
	 AbAYRgSFON49RqMoxhPqHMCNprIKj2xIpyo4DfWFgchrOetms4ihhSWClwxx5APDkyDRU
	 CVtl4dZAT7TN5p6ZRRUiyP2m3I5jez+o5Q4xst/Xa5+1wIvMS3B9c0QmbNfFinCOFPEdC
	 i/rCn7dZUCuKvGhG3njcvBBM0XBspg+DFiWATCIE4Paq1xwkUIhRE3hPUDsdjqR/jSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=guxa27zZ;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FA5606A337
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60FA5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=guxa27zZ
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2633142a91.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426282; x=1795031082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
        b=kol+YgW/7o7QzkbxPUh8Q8+co18jCRkXYjfEjjPmQQ8Ttnj6BoR9ZJc0NSMKbC81aB
         pmR9tORP/8dEtDG+culBfKbzkGKWGV5e2rUaB9y5mklTUf+PHMGPuqOkiCP7Vi8RILWv
         /GZW9EsprEY9A+0WZdbE7B/Emtnk2PD/61im9Dbsrkeaxs6zrCVK9nAKNpeWa0TsA4HB
         CPCfbV2iq/AzTJEwN8XrFp3VK3AZTAhCW3tAEDiKO6TYrE18IH2DMnXVj108bT+pHFvD
         GxtedoFj8NJZCFF0jCxU2OUTLt1zjge8vL0n29ONvaj12M2X9ZrWcEaEXC+MjsgnhyfT
         XPFg==
X-Forwarded-Encrypted: i=1; AL+hErH6XVUK8pd1DquKn9l56OyKpE9PSBpZsXp5i/EhPGPFAoi3A8PVpZhAXUBjajhf3FUAEkT7G+wiREUM@vger.kernel.org
X-Gm-Message-State: APuU4Z/NL9taeCMBtX+E9DGCBf5gmQsvQfYiCbAVHrjJPEN7NvU4XEa4
	5Qy9Sk/HEzczTsbn8DuF6VdLLYeYjhajJEyK4IstauuclsaodcS8/kdlhsVmQCn4PdBlXHPg50t
	1+7gGFYqfqNbZEJIEQGLk+qSI+sNpJK17OWCQJkqVGcK7j2hALRj6LZzqMtiX2R+9snh4JuuNd1
	chKRjMoHAN94wQh+ppeq4B9/OUswTDDlHF6HrhPYAqGXzQVlTkMRmIi/pjZG3S/Ec0UCqLmmkaU
	q6euvFNHApXIw==
X-Gm-Gg: AYBFou1FfXZ3mXY9uyDbM9ZRGML7+5ec0ufSSBux1FHbawjVlL2CqWLHq343QHP5Ave
	NGyIlg1HydLH21dRxmB+83hpSS2dbZWpQDvqi9T+3uCek5HeoeGYRfVzdNb6zBc6anxTP3+QfLe
	sojyjtLLQWai6iLO7oOt4P6O786hJ1cdNbpb32UUWHqh9roYJhwPpeHqTJNroLyssRdSqUK4vLR
	8+OXW7MOpeajVW10a6TQu7PaQv/AFzlgcL40RpM2cPkvSZdXL78fCjGZ+KoJ7cGij8y16A5x+jJ
	DluxSKqHPQOTHe5ZZQr2HZHItQQsaJmYNJBQjeEB0K3ipYWUYXsl81oKqu/TA08alfBGau78ZGD
	j1FtHKWkgGSjZ5U1FJlxr6YHgRLyTLguvEnyX+BcG3a35nbQ6J7v5Fas3jaQVGxTmQFMxKzufo+
	9t4sSPgzWeigBa0Iplb9Zj11AQ7KO/zr5O
X-Received: by 2002:a17:90b:55c3:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3b182f0ab74mr3049315a91.47.1794426281704;
        Wed, 11 Nov 2026 11:44:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cdc76asm257943a91.7.2026.11.11.11.44.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5733106eec.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426280; x=1795031080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
        b=guxa27zZRfTWtWfW1S/JEPoAe7KOwlowtFR/DkAOtesHHpBVawfWXxsq71ZQxihrlK
         PAoSAOJajUeRNgmwNGBLjmkvzr5WcLLpub1a2o6PE57Rc8gD0iAjILcDcsgje1yNQA7o
         oNIrKV4AIdOaDFiiHFxF3F+uO6XFQsHVjniL4=
X-Forwarded-Encrypted: i=1; AL+hErFzhN+iZTa4WJlAgY19ZwYHAht9IkDgZn1di7HNnuB7oHeyrfd2r3n5lSDsEXBkUiBOPYEfQxEZjIKa@vger.kernel.org
X-Received: by 2002:a05:7300:5621:b0:36d:7feb:8bd3 with SMTP id 5a478bee46e88-376850d00demr3734265eec.11.1794426279625;
        Wed, 11 Nov 2026 11:44:39 -0800 (PST)
X-Received: by 2002:a05:7300:5621:b0:36d:7feb:8bd3 with SMTP id 5a478bee46e88-376850d00demr3734228eec.11.1794426278882;
        Wed, 11 Nov 2026 11:44:38 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:38 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v12 2/6] dt-bindings: mmc: Add reset-card-at-resume property
Date: Wed, 11 Nov 2026 14:44:22 -0500
Message-Id: <20261111194426.1652644-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
References: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On some platforms, firmware or other hardware accesses the card
during suspend/resume, before the kernel's own resume path has run,
leaving the card in a state the kernel can no longer assume it knows.
Add a flag property so such boards can tell the mmc core the card
needs to be reset before it can be used again.

This is expected to be paired with keep-power-in-suspend on boards
whose firmware needs the card to stay powered and live throughout
suspend: since the card is never power-cycled, nothing else would
force it back to a known state on resume.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 2fc8e06d5ec9..c824b95f2ae2 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -303,6 +303,13 @@ properties:
     description:
       Preserves card power during a suspend/resume cycle.
 
+  reset-card-at-resume:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The HW/FW may have accessed the card during suspend/resume,
+      leaving it in an unknown state. Hence, before the card can be
+      used, it must be reset.
+
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -371,5 +378,6 @@ patternProperties:
 dependencies:
   cd-debounce-delay-ms: [ cd-gpios ]
   fixed-emmc-driver-type: [ non-removable ]
+  reset-card-at-resume: [ keep-power-in-suspend ]
 
 additionalProperties: true
