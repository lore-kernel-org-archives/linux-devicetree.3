Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB37175A89
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782675852; cv=none; b=S7e8L9pyz1Z7SdNK9amSSF0MyT5V+v3aF6BR3guWFv2cB3atZZ6UUPZ4nMkd5wXxOY2nepIykp33PFGJ8iC4Gr8i/6pm1TDIWGXYkYfX3pZzaqVl6ONm0RmbYOUQojZMYNxtXFPyhS5++/e1qJI5rALlQCbqlfI2lun5S+zriI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782675852; c=relaxed/simple;
	bh=U2YoNQx/hGloZRC8McPJss1WdTnU2vgI7Fy7zmdhFok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIGATXMMlLGgYD7y9VxVI8T9vumDvJ0zb239E2oZ67RFuO2K+3OGnyFbiTc/LV01TfBXnZsc9chSGx0coOQs9cW9eNsfF7ftdW+/7qc12jArzNESufOl30im9bgvYMhxL12UpsoonfgfHXTm6iIiefyKIJZHkJYJqXFL7aa23zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/EKyjr8; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/EKyjr8"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so473313e87.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782675849; x=1783280649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/Qd/2tRCLWffwMQFEM05180CiTbv4f9HSRyN2+W50k=;
        b=s/EKyjr8VjPC2KnnfUaz0m5WdyNjpg4JtdMaKOwY1v8pWTkpDMb62NLTd6T1Jx5Iv8
         Cd0jQxT6f+PUpA1hthzVVfmKOwOINfecKywDHIzh/Z8Po2YW9EgfhLJOeNm8HoRIHbjD
         jKnTG0jbyhUbUJNlBpBK+ayvNARGUUOf3MSr+nUsQ1gIdWWK3vur5VmyHO0is/klJkYD
         iEuduo6Pm0k3z8P87Tutz+m3GNqL2Kp4fgSkpxCHhv3IcE004s6THMrwfTLJQ3eHvWda
         Dzlryju/YwoWQvxAnjf9J+e0h6BHU45pFxnzdokFhOe08hggYDgfLXXSf8vjWnfVjgDc
         n0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782675849; x=1783280649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/Qd/2tRCLWffwMQFEM05180CiTbv4f9HSRyN2+W50k=;
        b=OqvjAGqk3PMvapCOsEFT5ZlFryRnMzWvFHnyDaatbeHWrJlYtVgggtAh64o9EoBqcW
         B3fm/lIoq2HW3VvU4g4Xv35tCgQd9CixDv+1fizy6NBv2ZELZGAs3BrTy3E9qk8Fq2A0
         c/YWri1uLZiCVWe+QKeO0wnhJdHHXWF0sgfJHUAHNy08K02tkE5laT+VJ9qW4b3Yf6WU
         l37OJoR+OjBBThsW2vUBVRWw+Mcrh330l1Yy1GSGEYpG3kOGs9YXDwCoXrKs5AIRTFhS
         hR8pDbExL3CvcxI3Hgp34AGtrmYmtj6WIgUKoanboO3rRqur6JHzy+C3JC7wqEdir8uP
         GSEA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0+f1GM6c92D89HPUgSq+ctlLblElrV0ZHjyUE5YQqbE2GPGfSKIp96Gyk7Vu3+3jlX6uOzZNc0MtJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm1Cq/uD51V2v/oGOuXvTxtcNLKBUkLgUTv83YAOaSrAWBoE7n
	qaV3j+fs8YKldqUr5YXnABEDNYZl7roT4M3k6qHAaWIjFll5Bwd+31/b
X-Gm-Gg: AfdE7ckVU3NeXh4dbm3Ke6miVB4ELmz0T9NAXod8VmVTKJRw0UhO46HEmcexUYu/tJs
	Co2amx7duDLFsav7yLYGpEBKE3TnyYH54/PiHbW1IpfHNXiBwwuCukjzisETYTrdExXMvq/CMSp
	axrjw0WuwGFNkSqbQTlaZFK87Wc2d2Tt590cvOdXI5bJRsE7IelN5SlT2mzaeIgk9uBBOYtiips
	CViZeqal1R3T1OG+JHr1QV+FzNAJvBUemsW2sF3K9frsmCZrAYyCHvQ82kPqj9lOMS4iktsXASE
	Ux6PdOXfTP7q+E3nJ4im4sL70Z5+dY4mVCl4FzgGPgvZQteLGTIY+w/znycrwXg57r0mhJiS+sb
	NXttmQJTMaR/uHpiC2Z0ZvvPsbKlI26caGY9HcvpP6iLFQGdzpE4dSgBfQ/jdQFNgWDMQt9rqM5
	/ixJug01VxFHD5+kPiJMrVk9RA32KK
X-Received: by 2002:a05:6512:1410:b0:5ae:ba27:ee61 with SMTP id 2adb3069b0e04-5aeba27efa9mr26577e87.51.1782675849135;
        Sun, 28 Jun 2026 12:44:09 -0700 (PDT)
Received: from Nitro5-JS.kielce.vectranet.pl ([2a02:2a40:27ec:2900::3ab6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69551002sm5221688e87.24.2026.06.28.12.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:44:07 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	antoniu.miclaus@analog.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	duje@dujemihanovic.xyz,
	jic23@kernel.org,
	jishnu.prakash@oss.qualcomm.com,
	jorge.marques@analog.com,
	joshua.crofts1@gmail.com,
	krzk+dt@kernel.org,
	linusw@kernel.org,
	jakubszczudlo40@gmail.com,
	linux-kernel@vger.kernel.org,
	marcelo.schmitt@analog.com,
	mazziesaccount@gmail.com,
	mike.looijmans@topic.nl,
	nuno.sa@analog.com,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	wens@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/3] dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
Date: Sun, 28 Jun 2026 21:43:40 +0200
Message-ID: <20260628194341.66752-3-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260628194341.66752-1-jakubszczudlo40@gmail.com>
References: <20260628194341.66752-1-jakubszczudlo40@gmail.com>
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

