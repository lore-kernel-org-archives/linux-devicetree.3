Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EE92EC090
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785203949; cv=none; b=c7KtbSEyGDl9Rq1MC3qC5bSKJKrSP26GgErSQSZnDhoxARa3hTVJS97aixh7WuDwdIQetqjG3/OO+jx4lDLum7PPT0Ws/X7iRTvvCEQJQVoWdaFWDJF/e438ji8asppkdcLBR/+6i9WGURaVDLXRmXRskJEfjPpYhNmunJNFefo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785203949; c=relaxed/simple;
	bh=3DzBepA5OaBxS3rEqzaa//JlAmU/tnAvZdNl+JJosYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHq7S8GZvm6H5idAOneUkz/y0+IekQwT4uBdqR23v7HdDD4r95SbApUVh9BfStXc6jE4hYM5cvmNtrjJUhuK5Pszbqwo3v2BykVvG9TGftWeexHJbhyFgLhujh2Rr1+f7VFzXmGkpNFl/WNWpFAnAa27z0OCtRncFKtIjFKMGGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kchdpqwQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kchdpqwQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so17343485e9.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785203945; x=1785808745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=kchdpqwQzA5vSfU4UdgVgYg8cWB726+J/57Qs44+OhrLjbAftpGX5XJn7uiv8YsMNP
         1MxkqAnxanMm4/L2NlhG4M4ir0ZAo72Q717+X2+1XNX5UxwIkwPb9DXzTY6IRewxpaKH
         GcISDVOMh8aNvo0DtpAUloT7F6JJkcq57L5t8ponNTYfE1niNfE/q+/pwRR1X1tcWlod
         hU2hY4mrvUJ16tVkDf/oMxP1yeyX9ZFlU8E0Y8G4c1XfR9/YQK6joXZYBlyIsM9NRZiC
         oOpbHlIbK5EvHxp1qoIXfSawdIcye10fCcsRsNP8S0KaSNrkac81CXY2AusiXMG1W6Pk
         esxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785203945; x=1785808745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=ZA+KxEJRBRJhpHjkVshN+jvmWRUcsSWpQFEjWS9OgUUpsHT6eek74jTJbg2UiLfoJS
         +tmSXo/qOaU07fi/PlMRsg67b0rgneX9uXLKvwR3xIpoo0sAPVakdWCunTeKgGIYpdZI
         ugy47RtEnnvs+d5wGfycUp69TsQ8nISjQ4A1zGlouw2NkMOyCj5wlBY9CxWH5buO2po3
         YGjQYgfhdEPajapZwwycaPs0+9oY33m8TkQf6QrOgo2w2VaMkVXpRsKkVT4BU3jz5+su
         JW2I38YZCw64N2v9lZs/pfs/9u0248cUibBr29wX5CsB472rBsGxB+JOarHk0NEp8FtA
         vWqg==
X-Forwarded-Encrypted: i=1; AHgh+RpV7AdDWWgQjTGhQINxF/o07NXkvxerusxsNmvoanQTCTkftW6Ow+eZpJVeXW4RyIP4t2tu1IaJBgbL@vger.kernel.org
X-Gm-Message-State: AOJu0YxUfVIP2JZsq+YE006IX8gD/dAPTmGQE//vw05wHTY6cpqtkNH2
	sibRM82KnZtYTOSRZT4D8T3SS1cswIIVRjVIxY6ECpSc/luzNgRmvhlRS7/lFlDEBsk=
X-Gm-Gg: AR+sD10Ieqb74v5XGYKI4mGb1OJYr9FtZynMh2ULRC1Dg+qj+jPYXgHWtVajwV0mOll
	AVNYrUDevxO/S3oob4j6D7D2HPKlDGpZqK6+S9cYU/C3A8sxhu0OnGrXP7CwI8Gbx+GzrAwbz/1
	zuP72G/5u42vCl39OWZTKSNKQjh/dvAJdsno7cqtdgNJGbvIgnnLktIjPtFHbr0kyQglLuNoGnV
	H8VW28Y3LFxPDqamQJMeDyN5A23xuXZNDv02K6Rs8wQYZ0g8mYEoJF87GFRE/gKA01q/zbCsJD8
	Fcrbe+b6KKQWcm6CmOP8CyRiU3JVns5shx24YLnz/iAkW8N/lobAuYQRU236xifJoqTzcXTWQLo
	1Htsbe9cSuE9u0VeMnXpkQuH0K9Fxla4+t27m+Bwy6Ki+sBuf467DvwZEQ/FJiIwm+0DT9N3tgw
	QDFKH5OmAPvQpRF8vBRzU81NH+WsQRHD5QDOOs9vg8/rtty+2BFLiZJU/O3183xw1VSyDGePmQe
	r9+U04Qs6CE0S3nEYejSdpdCPFwaAazfPx6fGr7yixYYK/8jjAM+yuh+Q==
X-Received: by 2002:a5d:59c8:0:b0:47f:9d0e:f94 with SMTP id ffacd0b85a97d-47fb1f107d7mr198973f8f.36.1785203945484;
        Mon, 27 Jul 2026 18:59:05 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm52380930f8f.16.2026.07.27.18.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 18:59:05 -0700 (PDT)
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
Subject: [PATCH v5 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Date: Tue, 28 Jul 2026 04:58:47 +0300
Message-ID: <20260728015857.193890-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728015857.193890-1-sbogdanov@baylibre.com>
References: <20260728015857.193890-1-sbogdanov@baylibre.com>
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

