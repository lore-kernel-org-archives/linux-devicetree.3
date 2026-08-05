Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D2F3E5598
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920657; cv=none; b=be4ke3HDV2wNvQsc0CtUjgQ+6746qdhYnJSdjJ1w+H2I89b5QLbqMIVMt9G1BYqH89nnQqQnvW6JHLJkRL3zbiNwUbvds3xFbNag1+VnVKY/FRD0Wu9p8ngunWF40tF097Yw9lrHUzD2gUCy8hWJf4Ec/jDX4Fp3n0/Y6TX9jfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920657; c=relaxed/simple;
	bh=3DzBepA5OaBxS3rEqzaa//JlAmU/tnAvZdNl+JJosYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pjhRzC8hXqnFgEsZjnpxnHRUEBvP7LXaFT039rgKp0Z3WkCjiq2TUW3oetAbqCQGxX3KktucQU5wHbvnWwoFRJgYdHU+ZWxPSr17As4bHE65M2eydP1kCmQPRq824BEL+y3Y3pQFZP9AsJWlxOQvQyf/uqYaPgXKhIN78e9UwTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EtsLWIxm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EtsLWIxm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954df200ddso4860365e9.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785920651; x=1786525451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=EtsLWIxm90bqO0pNwLeOvny9TOKms0H7hvq1lu3sCTDQrNN+6zn8FAxJKxvvIlhPIP
         5O5QXsakOEdFJxL1gd2z1ytNTKD4Ar1k3oXVzOOjoOGjvp2EfaZyioD928DMa52xfNO5
         yOBhIVShmHuK1ioSNmnaKxP8SAj9DDFAHq0L+AhPqPThjD309BcLpJcQbT+3e4ZQo/Kk
         mUWPxHo5JfirnW4ssQ9DdlWaAouXGryAkqng+9FzQzdmR2t7xGYjmo37c4mpoxce6/lV
         0vabw0bE8+L1ec7Y1vlGSLkwk8twkwhu+3pjj+YD81iTFBTxTW7EH7XNoFIvOLPdAuPU
         BSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920651; x=1786525451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=VDV/S1S3FFgCyjdyPgsn8P7Y63B5mloG59CXRD2PeYFHQGpXrxyxb4JXmZHnqh5KbY
         e8FLaLLySjYD7nz9xegfBRgJqFMEGPaKPfBXEtQqtwF6QSNE0z+dL1Ly10fW5IA7kHPZ
         N3xUFwGZzTC0e0OyK9H7zN672RRpRc8wIyZ7T8VOjehBQdOIiiwoZqoaRDcXAo12XBU5
         AZR6W9q+PVJIgPS+VFy91UoQErwZ8v5xtkHs+yj8YFnuyj3IHHPU8NrwRL3GNYEhsjjh
         1PZ357aWZS4KfCvtRiiBK3s3NpEp/AVI9P5iiP7v8yLYFYsItQjX4tTyz6Y68aNsb48L
         dzDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqB9u8ygM7iB/VOdJZOd4Ocpq03pIKCHQT9dYpg4pRthoXIWjNGPC2+mMkME+waJYAatj9Ipu19Tw8E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+nYk0GDsvNw3xv47rzA2rooFMnIxJpxhwoPrOX9mHJ6bZedra
	KA+WAY06p6Xk9IPaSmGGyJVzofiXAcWcLq4tCFAhlRtY0UgKDDg1orDfLBupYk9espo=
X-Gm-Gg: AR+sD12HROXyBoXTnFKoKcLkjGnTwKpYJzZzGzYQELk9Tmg3ffVM9Wx8LAyF11JRetg
	7Eh+KJMaveSBbWd3VXqyG4rcQH6hUGrPPObxVzVrn5MfoDgDVBCNR+8kidu22+1AdIxRk8yy2vP
	+qNDu8Xu2YYLGeBVgkbZDOYiHuaiRj7BbS6jADMfEUxZDjtqA+H0vdkGotlsE8SpE14Bq5lXRAj
	VdWuKwScg5FTeU6YSm5PQGz7JdnqqQ3b5Qztk/r49163EwiG0MZCdWDwEwET8JM98bYFXnpqJAm
	OQKDiuYT9BqN1RI45HoPTowo6xzlxf99QH5p7pIIyqrG4RrRloBfgWBXmU+zwN1aeWamjRGDdrd
	L66DpStqs7XYjWBTsIL+ToHu836uDCiWF6NPZgcuwUhL19HH7jt5C5OgYaZvFZiywANwZajbkF+
	HCz0ek07OgPZklYCkqWC/Dy4Bk8uX3M/DSh7rJMbXkxcuKt8NcqlUNUBJebUQDjNiAO6lJfjqHA
	6WdFDMssifeoLSv/LMT9CnQyN55elSojqO4WBMHBPrv2h5uE6EoJrKTm5QchT9xKb5Hpdu/7aB5
	p0rbG4Va+XactNU9Sz5ZMf5wGF+B5w==
X-Received: by 2002:a05:600d:8483:b0:498:1371:6612 with SMTP id 5b1f17b1804b1-4994e7a70aemr44104035e9.6.1785920650758;
        Wed, 05 Aug 2026 02:04:10 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e99319bsm34082105e9.3.2026.08.05.02.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:04:10 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Date: Wed,  5 Aug 2026 12:03:56 +0300
Message-ID: <20260805090400.2059006-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805090400.2059006-1-sbogdanov@baylibre.com>
References: <20260805090400.2059006-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device compatible support for TPS1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
index f4115870e450..63ccb67576df 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -5,18 +5,20 @@
 $id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Texas Instruments TPS25990 Stackable eFuse
+title: Texas Instruments Stackable eFuses
 
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
 description:
-  The TI TPS25990 is an integrated, high-current circuit
+  The TI TPS25990 and TPS1689 are integrated, high-current circuit
   protection and power management device with PMBUS interface
 
 properties:
   compatible:
-    const: ti,tps25990
+    enum:
+      - ti,tps1689
+      - ti,tps25990
 
   reg:
     maxItems: 1
-- 
2.43.0

