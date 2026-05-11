Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4D04D8D8D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533975; cv=none; b=iYvdu0+6Iic/t9IJAlHJCMKFb8Tr61Dw4UIMKvrISCAVzWDdFh4dmOP7Z/BOpT+vNev4++2Mlh9tleGNKq+QmmOMgmwy3QRJ/kBDpXmIB1H79QU9nCgq+zG4aPMZ0HAYz3NQ4qzvKHW05DoSwJr5jSTjteGHEEMLujCsfpNmgfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533975; c=relaxed/simple;
	bh=Ml8+WIXJmSGrbqib0u5ulf7PiZ8NZS12P3rO01gEh/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=haYewP5001d13tYZHfh2W+AyX1d0CJBNEmPOuJBC9e0VfcY3DUUabQNAjX69VSX/+3Ez8R9h1P3+b03oDMJKEdZ6fF3OE0tn7yAqhDKJP7NICfX7BV0LOsQ01kMVOj1ZFHgnx3cKHYAwK+Wqfyutz0WqCl14LC1zge6GVXfM2NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKt73Ppn; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKt73Ppn"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7bf02533706so43607827b3.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778533972; x=1779138772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwF/HhmYwf5QBeLN9SEfEOEh9juP5SjaaFwH3isu8iY=;
        b=BKt73PpncZ0dVhQJNqKIj8j95R39VSikmdRMcpVd6wIimAgVysHkXCYnGsFIFeKks+
         CyHBeuY4U8UI8Nw2EHXSMd2GnVD760ZO1n1Xo6y4gy4t7rsAn+OT4pjknLKBxfHFAPq4
         NcaF8xAJJmR7YOY6sdvZ86Km2hsm6Fb/7OgY9WOcwaWrdL/3GoCCm4GbeqQtzhjFBC6X
         fPFJwGitV/AH1XC1BszVgQArX/ueT/bX0LPa5FnPfIjQJOaLCAZdtf9JXAkXLE5ky7WD
         5iDlnKTkcmkqh1M7rd7RgwbE37wSNR+nCOJ6tLfnCM0LfCQx3DA7P71vqOo3tI/FsVdo
         7fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778533972; x=1779138772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwF/HhmYwf5QBeLN9SEfEOEh9juP5SjaaFwH3isu8iY=;
        b=cfrNLRfXT4BYgucC8QZy6rq0VjNt5fifFVmFEcbo0xx536IUVLIqLMDyiRza/m7MqD
         o8BITC2Cc2wKbdtfOWz/9wO5X1ecGQ6E4byUNKvXshW49ESTiZpbGSWzaA50BwgdkUvG
         4f8RYZmYdrYYsqN48THFZNtRnB3XTmb4EficF+wC/8orWA3mYIWe6iE1GnRRDjYJw+sM
         jYnItaKngboeV/w2yNNgi480QUnls/AEEC/xpmA6ZJtzR35K+P+FKNNSB6n5V8MWkzz+
         C82qrDrkW1uCSeaXT8THFAd9GDsOpYKCP1nlasQ9ULEkXRJzEY0WhXqJBQwPKvyv0K0v
         +rVw==
X-Forwarded-Encrypted: i=1; AFNElJ9eVwqTeEJUuiL3UVG7eMZXayEHTBaqBNzl7IhL14IDcPLW5qusF1fJJsGPDvG/s2o8M1KLUfsEbTDo@vger.kernel.org
X-Gm-Message-State: AOJu0YyrQoV4jIz8GKcPAGS+iKPXP/g7VIXxIuEJbq4fTKb3KiH2qlBw
	5ewGR3xJ2Q5LwMvw49aICYVTrab5ni20WjptzzKPb2NQoU4EZrz8YVk=
X-Gm-Gg: Acq92OHMZjn7W3P4adM690I9s4SsYnmitUH0PsYZtrC5Kd1T0rrY5bxW72BJ/7tiND3
	wYJTD6qmUoyyZkJ59EPQ6I/sdOrM6chIqCYd2o2bqnX+R6yEATmMfKi59f+s+Aa0HLlmt82gUKo
	jvNxu9EemJ5SDqJSaCvDB3cHum4PjHUHGnroojK2ZEYrpE+xi2KjsKn+lv44iQ4qsAbKQt4p/R2
	kWn03myzMNZNSgnOE29NVKumw6U1OG8pE69sBYpgMBczKURHa7mzqOKsONDejet4JkiC9eSqJuN
	V+tC0MLCcpDbG7P4Of2iiXh+39vF7fy9hkqpWi9f8l+zIkYW+K93yctrnVdQnm2nU8GblbU/qiL
	uYFAlpj08LYAo2D1tmTUz8QjlDD/a0KWs5osuKqkpJ+BY/9+tRFJ5Wp77L2u6z/FRA3iE3KOxtp
	et8/sMX9d6XIUYxLM6eQGdDd/BAR0c6MWi1Rx/bx2IT2DsEg==
X-Received: by 2002:a05:690c:ed5:b0:7b8:5f91:65b8 with SMTP id 00721157ae682-7bdf5d99133mr270835987b3.9.1778533972346;
        Mon, 11 May 2026 14:12:52 -0700 (PDT)
Received: from alir-mac.sitimecorp.com ([12.1.37.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd976fd09asm114553617b3.41.2026.05.11.14.12.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 May 2026 14:12:51 -0700 (PDT)
From: Ali Rouhi <rouhi.ali@gmail.com>
X-Google-Original-From: Ali Rouhi <arouhi@sitime.com>
To: jiri@resnulli.us
Cc: vadim.fedorenko@linux.dev,
	arkadiusz.kubalewski@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjubran@nvidia.com,
	Oleg.Zadorozhnyi@devoxsoftware.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Rouhi <arouhi@sitime.com>
Subject: [PATCH net-next 1/3] dt-bindings: vendor-prefixes: add SiTime Corporation
Date: Mon, 11 May 2026 14:11:41 -0700
Message-Id: <20260511211143.19792-2-arouhi@sitime.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260511211143.19792-1-arouhi@sitime.com>
References: <20260511211143.19792-1-arouhi@sitime.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for SiTime Corporation, manufacturer of
programmable clock generators and MEMS oscillators.

Signed-off-by: Ali Rouhi <arouhi@sitime.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..5e81b9bfa3d0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1527,6 +1527,8 @@ patternProperties:
     description: SiRF Technology, Inc.
   "^sis,.*":
     description: Silicon Integrated Systems Corp.
+  "^sitime,.*":
+    description: SiTime Corporation
   "^sitronix,.*":
     description: Sitronix Technology Corporation
   "^skov,.*":
-- 
2.43.0

