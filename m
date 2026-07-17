Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AED838838A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314265; cv=none; b=WXvku3uvAozzGbkpB/7vpK7Sipur45wFPACXMW58ZWdWQ6iOe3RiZaksxyIBfKjeZzE1nmeYHeyPwU23/UyDGg15KxArpdVcHRJmhyKmrekyPzwhD3rTpv8gVQeQd8+XJWLsmZWAe+tjJ2OnuJm/KhcSDptvd+GQ4qDQFsC4920=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314265; c=relaxed/simple;
	bh=U2YoNQx/hGloZRC8McPJss1WdTnU2vgI7Fy7zmdhFok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWW+T+vxQ5GNwfX5pCAlSvDWQZPX8VA8KmtWXWlI41JSU5VcU8KvpHdtj10Uop/2MCXNNS7caT/Ll3kcbILJYIjq39fobURT6rHmEYfHHuWPPnO4hPRFmf+7vwrUV5bo6Vywi6PAqCWLC7euVwcCoU+FwykKAHaOsDqXdK3YA+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObrwbsEr; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObrwbsEr"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39eb257e9fbso7035161fa.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314260; x=1784919060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/Qd/2tRCLWffwMQFEM05180CiTbv4f9HSRyN2+W50k=;
        b=ObrwbsErDknc49bmpM7HXqhKed+3vrcqjE/PBjrXABIhBAtqvyRbdyzfp2pVf1TZOv
         FKUINj+tqViJglHjinaLOi9mEwSlXG3mJ8m52jLpTp9gMySUz0tIhF8rr2Jb20LBfuFL
         8nwaxVVfTYdIVSK8OmJltcFCUzSV9J4/q6h/b7YjlTMaASzJ+WQceSq/19CBhksOtqs2
         t26h+ZkjWEh6LyN35garmwDOHzBteiLMVM0yfDF1drPXEapNvLjJDxSmmRjk/aiH7cSr
         OfRXxsts5HWCJUbdTvmQYZeDZH5m5vsbuH5fhEUBEnVNBmI8cDLOHMXT/uWqZrCBKl+Y
         MCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314260; x=1784919060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/Qd/2tRCLWffwMQFEM05180CiTbv4f9HSRyN2+W50k=;
        b=E2guD/ItU8NmBONyLNl5/Cazx20TFHAnvlgUZyO1Czk7N8xxEvfoxJsyUxGmXqGR2h
         w4CVxNfWtGcQ9Y0E/GG/YZYfOJwyhibM2kbCadWLAhYTaPvufcARAY+8R9mp0lEBCo5C
         Z3lVP+QDR2aFz38Yy9p3KSJwX5Yl+ihVbpDwMoSkmUDY/uxwyCqSYz1Bqrdp61EgF5+5
         kf00jvtRsEs8NeuE5F2LLSYMJyDHd5pXIA1ghaAwWGWYPgE5rf3jYkDsMODM6n0qYefd
         wNOtdda7Bl9m7nApjcOpwAxscspwBTdX2TAlmhYUKAeqaqK65Wsn0EbUwuVa7ZyagHzp
         9Ugw==
X-Forwarded-Encrypted: i=1; AHgh+Rrm37iaO8W5SKRQOoY2jWOdGaGTKSddGDM/sGZGk6WhU8Qs4Swytff3nipotrtfwfjThyLIsCxG6fig@vger.kernel.org
X-Gm-Message-State: AOJu0YzIL3mwGogYLkM8QlHIIQWgKx51alRLFLmUxcusGS01/LdY0kI5
	a0Mln/dc15KT5lZXzAedeFVdTb/Z1h3np5lJGvpA5XossQxCGiiohV7K
X-Gm-Gg: AfdE7ckz/ahlM5ODzRROFB7iG1L5iCxaAe8bIL2CnSzuO3EAO1elLcYUAKHFVUNGfuD
	eSXJlkCxz2A5wlK5FBbJ9WTcPqL34GcvGR3Jb0j6KEXp1E0guux85TPU6j/JyVWech7OjRZfj4M
	3L0udtbl8tSFPBFqC5GqcLN88kRn+KhgMU5xkNZ4kQyMQKKXn8efAO/Z81Ez1THZU1jj6MGlBoT
	DjHZz62jby77rbG+fbKjKX0js3VYdm/cKRMiRO0ocJkbDZJRYIsgs/2wH4CvjYa0GNJFd0L9A3C
	FJsV3YzfadwPwXM7PMhVKoAg5tpZ5ldWjWDrmnFGscYQaiDXjATNQdxZANZNKrV+HYnBhM/ZE6L
	nBWbAplL213/8dQk0SJTeCfNpCRhvm07WzfjXpRVjWPVzWKlQSo3rHWW93xJLUPgi0/gXwNTcIm
	Nl3oVSs7az1oLrwG58Gn7YYvgn2Q8zoi2FywY7
X-Received: by 2002:a05:651c:4343:10b0:39a:cfe9:2481 with SMTP id 38308e7fff4ca-39eb2909e03mr6631871fa.30.1784314260298;
        Fri, 17 Jul 2026 11:51:00 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:9d0c:8f55:3d10:318d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eb4fd4ba2sm3431721fa.24.2026.07.17.11.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:50:58 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	marcelo.schmitt@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mike.looijmans@topic.nl,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jorge.marques@analog.com,
	antoniu.miclaus@analog.com,
	mazziesaccount@gmail.com,
	jishnu.prakash@oss.qualcomm.com,
	duje@dujemihanovic.xyz,
	wens@kernel.org,
	sakari.ailus@linux.intel.com,
	linusw@kernel.org,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 2/3] dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
Date: Fri, 17 Jul 2026 20:50:32 +0200
Message-ID: <20260717185033.246580-3-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717185033.246580-1-jakubszczudlo40@gmail.com>
References: <20260717185033.246580-1-jakubszczudlo40@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register layouts are the same as for ADS1100 but ADS1110 have different
data rates and have internal voltage reference that is always 2.048V.
Also correct order of ads so they will be sorted alphabetically.

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/adc/ti,ads1100.yaml        | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
index 970ccab15e1e..28c5e2dd0ad6 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
@@ -4,19 +4,23 @@
 $id: http://devicetree.org/schemas/iio/adc/ti,ads1100.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI ADS1100/ADS1000 single channel I2C analog to digital converter
+title: TI ADS1100 and similar single channel I2C Analog to Digital Converters
 
 maintainers:
   - Mike Looijmans <mike.looijmans@topic.nl>
 
 description: |
-  Datasheet at: https://www.ti.com/lit/gpn/ads1100
+  Datasheets:
+    - https://www.ti.com/lit/gpn/ads1000
+    - https://www.ti.com/lit/gpn/ads1100
+    - https://www.ti.com/lit/gpn/ads1110
 
 properties:
   compatible:
     enum:
-      - ti,ads1100
       - ti,ads1000
+      - ti,ads1100
+      - ti,ads1110
 
   reg:
     maxItems: 1
-- 
2.47.3

