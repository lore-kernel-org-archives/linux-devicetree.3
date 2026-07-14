Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2B433052
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058948; cv=none; b=WHtejo40MRTJVeQBZVPqBXwMrUyudNzmsIGuOoycv9mkqDGaGLG3TuehkxDmodhMIQ4n8BpVyA8WJcLV07z0PxEinmGT3+XWgjKXZVrqFQ4gpr3ZN3IyFPK80lnNir4tiqH34/9r5TFA2scR2eJsDYYlK+Q2ARor6pm6TLuhZfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058948; c=relaxed/simple;
	bh=U2YoNQx/hGloZRC8McPJss1WdTnU2vgI7Fy7zmdhFok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLeCG26SRgvObO7qL7MBgK90NocgH6FWqQ/1zCbmeT4kjm/gLPyow8rVZgFdqqd/OakdQiH5CvSzyOV9YxDhPGU7lZI3uWrZMGD/FotPRFKy2IIbKIheXR/Oyx+KCc7vXlflbSsGhMs1LLiOvtsGZhK1t/OubdJfh7imU5Jt1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty514sjy; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty514sjy"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b0117dda13so1215021e87.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784058945; x=1784663745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/Qd/2tRCLWffwMQFEM05180CiTbv4f9HSRyN2+W50k=;
        b=Ty514sjyAxemmdnG/rAqA9VgP6J/sgMb0NPHTUKzv6q10aqdjZRpJEfu4qSWhJqPvt
         3Rkf+x5ZUMOv4VeVgQJwVi3ZDVoWS1WT7yNajMGTbyrZ0FOEoFQxHQ0oET3Ytccg55iD
         ZOyIbBPN2fZiPRLxVXaTzO3WFVE+mIPQqH56BHsF8hAtIx7HDbNWuLrXR5mGuVuQMNJf
         8SFVX8LHA8e5mvZOHvsCQ0IKhdifWqgBaa29bEeSIhn1fcYCwRguu4yE2qESG8PJ5wvd
         7IQ7H6E93DuYyY23MeBqyYkClWV1cDKmYxvxWHAse5fPPK2tmsgsDHC8qaLTet80PL7Z
         bUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784058945; x=1784663745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/Qd/2tRCLWffwMQFEM05180CiTbv4f9HSRyN2+W50k=;
        b=nYYmNRLPZ3cfa8tMY9Dd5R7MtYN3MCRBBWft/RxorMcIdzKDlsYBc3T5L3lKRtxu8Z
         cKIOq1n+0/xfmP2xIN/7R7OfbZiormrZ5FHjnXzn4bXBpYWubuNa/qFoI7p5h+y6W7x8
         TqlNZeB/3Hq8SsIPrO/I7KeBF1zWYzlNSvGSr+0crbER2L+MjvMdMLN49AozEW1B6Nlg
         BP8AaS+r9p/NEojMrjgzj2JGoQBNeMJYlZJxefQVrCF3VDpq6bO174oYF1sRF289EPby
         uMTPQkOb8sU9ozp3kdI4vrbFpt0naOyCzg5Q+NDPJnwkqJ3oC3nw5o3DzRdNWAG+XODm
         V09w==
X-Forwarded-Encrypted: i=1; AHgh+RrCcAWe3ftyMkvwJqdOoYe0cUGGjhJAL7NvlXfvbYHhMDRt5mnpae5z6MKbRS2z02i/azQZ6G/SF1LJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyO9vEVrZGEeyNVXZuOtoYX0u1IO7O6zU8jv58uks+lmDH2Iml9
	rCQaiT9zLynjiWjg3RRBCnTVT3Mk+7rHg8pl8Tojppsj5Tb1w03wrOfq
X-Gm-Gg: AfdE7clc/8V7Jx49BFsOaOj+ute+nx9dHG7b9yTLqhmZw13zBK7Kk2JPkOeX2BQB+pJ
	KflAgbMbvgJbK/na1OJpDsxajk+7l/k12H5MQV71ZgqV2ljqe4RsNhQSkePkCnvX2kHObKGxqt3
	btF6+sD6jqdpe5+KUEgNxmmuzctBQRLjsng/3xf3Uaxw5iq4DWKkJOTkU/0TVLsELr6nsBwXtqG
	vOc1G5/3Xxhmt1LwNkjNy/9IPhVk1dd6lTpSCR0Ya3a1nl8M3KKKKkl2a/YqnWWPto+GTt2djh9
	x7KCoGb5MZCqkWgJNv6kyE60vbbd/WSPOCvyp+8EqTJIAGkNCLjD6c7XvcvRbTborNscZ1cqXjv
	/+ioCEzPxdKpxKkTbmW+XWmtUt8NBOe4Yy7dH7U0gMbT59ZhWIP7ZH+9vbc0CjfTpVVH1U8HNdW
	vlsW1rD+PqTu8YmVmX+ptv5m9g/jgTzVQ3qSf2upa2pXljeuT+ykYAZ0Szkw==
X-Received: by 2002:ac2:457a:0:b0:5b0:1c19:2cf8 with SMTP id 2adb3069b0e04-5b023566565mr2278061e87.11.1784058945333;
        Tue, 14 Jul 2026 12:55:45 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:822e:374d:22e8:16cf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca501bfsm3693490e87.26.2026.07.14.12.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:55:44 -0700 (PDT)
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
Subject: [PATCH v7 2/3] dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
Date: Tue, 14 Jul 2026 21:55:27 +0200
Message-ID: <20260714195528.597753-3-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714195528.597753-1-jakubszczudlo40@gmail.com>
References: <20260714195528.597753-1-jakubszczudlo40@gmail.com>
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

