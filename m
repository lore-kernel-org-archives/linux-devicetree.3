Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011DD373C00
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782424573; cv=none; b=AIFITZbu7vv6l1zT3adaf0rqFCdPZSl+qtO8eoOr8hzkzHrM+GfzavqAY1rx6B3GKkIV7NqsGf8IAXpUScCCg0GW5lxPikUQZ+9SdjxCAwtWDdS0IErA68UEZi3nssVQwBWbe1IFAxONfWLo6DuBla7cCO+iqYEiN8egXkghAW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782424573; c=relaxed/simple;
	bh=TggGjnLxLvD14T0dE0NblmYQWNN9rL+6hvRLSO3FnI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oXulS6m0A+K85kCDLfBMBzES/SoeL9ihP8OtqWJDI/skYh7zEashxw0mfDpFZ9bWI2VM4t5KUqLVER6LSwYZMyEGrA9FNQjUaOOKzgVmqb+Xi7sQwS2LJmJKY0eXuhY0TgPU2XAX91yd2D1OecVmu9M2iFBsGStb/XODGzCkA6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=h3+R8ohF; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="h3+R8ohF"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e943356247so208513a34.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782424571; x=1783029371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFRQSgiksqu8Ptbyiz0jkzAbOI3VqHolla6r9XqaMjo=;
        b=h3+R8ohFO8aVkaXxcpPhMeB2TBmXyL2RK4rkpwCut2m5Eftog5guZoqwu/24aNF5SL
         VxTDmvXLQWQtXeMF5lJNeD2lmZAhNHBobH/dICG2D7Mz2KZvqUhXxKaaGK8pyG/ore3n
         qSHm8yv/g98u7FoZv8b2hZ+01jzK8ASksdCm3CGyMpZRmpsk5cTlwakfpOPDe3ZVj/jO
         Thz6159/H884L6CreUbrU7tkenVXIIwZY/uFPlY+yLKFCxEAeHZsGO/hw0n5yaJqUDVG
         Qovn9OwH5/ImCW0RgfSaMgRePqBJaElv/fGstpVVLbo74yKVHjEAn4c4m8bYq9jqY0AD
         BptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424571; x=1783029371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pFRQSgiksqu8Ptbyiz0jkzAbOI3VqHolla6r9XqaMjo=;
        b=XQF6p13oJhmKggOLOLJaon7Nnz2HHMCcdgssnzkNytLrQ7kgWoKOUhpbrkHX0bWTQd
         3gIMJLA9jeW0ygoOqUOfRnv8k+2AGrRF5ZmOMZE07M0cAsk1iMxTSnFuO5fQ+I3vyp7/
         sa6Fc9vQZiVOI0gU3IdahpB2CEZrtDdDqErRN998qxWeoe1bYcsT2XK1C/spgF+1BtHN
         UtqEG4g7HO3+ZBnoyC4yXz1JvQzrDgR/2E5I0yHmfBCqd21SkOI4AP5iHcwajgQPTrGj
         qwHEFmZE/gGoF/q05yhfRQRFRbF4uiVd/GAmZMWcH2f3iQiItPt6TEiwIkVZ4OsG+vAY
         sTKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ysUR02zznjo/wGIHiovVXewgEyRur/pRIkr/9eZ7b8HYasLZC8+3RIG9hcDUu99VFK7sSJCQkEpqS@vger.kernel.org
X-Gm-Message-State: AOJu0YyLwWnZoUJ00Bw9o1s5mV23cQjcS+CvoFhhppsS3jmYnzZsqVsE
	YxPoP95vKWI4etnjRstQad+3YbvCJSnAfIA+NZZQ1/pVLZxO1R9Fe9pV+Sg2L8hSQ9M=
X-Gm-Gg: AfdE7ck7QdBdoGc7TderDekiSbHf/MKcaAgMY1Fjt1zwhKRbChz+BdYc2Bi1XD56xb8
	GQ7b9Phy5p8S3vP5cCQgVOsnyvjTTWwoU5u4+EiuEUZ+gGEtnu/A2Ln0Shoy+8jsqSbvoBd2qY/
	88t3elAf2oZtPdlST5JefDciN6Il8PFoB40U5JPNJGXnqeJouPbTdpmfzUNW0+3kXmTXYFAtmbe
	vB6ucAmPc2msauXXFEcIknNXdLezeJ0+Xn61oKWiisPadiT0b2HYPAECfn22WbbROmhShQ+XFZP
	jC/1datMrRmWm+ceIY6qLSRGoPJr43/XeVRXsww/sRVKeuEGr7oxgIX5238PXtjMpYIVaE3Cj6L
	VF1BnFKjKGUz+EqeehyqdgTvnYO0L/WZyYSSI7Dc/NPIY8kTsGF+Ls7ThASboA2RiEYuPIXvoxV
	A64XVjHqsoUMbLrw34wQ==
X-Received: by 2002:a05:6830:2b07:b0:7dc:d2ad:fb17 with SMTP id 46e09a7af769-7e99c57017bmr3818338a34.20.1782424571038;
        Thu, 25 Jun 2026 14:56:11 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:f1f0:2d9f:2f31:3426])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5e575csm206058a34.11.2026.06.25.14.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:56:10 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Thu, 25 Jun 2026 16:55:06 -0500
Subject: [PATCH v2 4/8] dt-bindings: iio: adc: add input-channel-rotation
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-iio-adc-ti-ads122c14-v2-4-ceb9b0b561cb@baylibre.com>
References: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
In-Reply-To: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, Nguyen Minh Tien <zizuzacker@gmail.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=TggGjnLxLvD14T0dE0NblmYQWNN9rL+6hvRLSO3FnI4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqPaPWCVNA0rxmcXktKM0PGtTn+pdVqtBMYuRlM
 Udd+W51bJqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaj2j1gAKCRDCzCAB/wGP
 wD3gB/9lt0x/nOh6e7AbvkQJq55VfyX/e66L/x606I1yr4sGXxZ+JrfkPu2iY08Z4+vMt5nabyT
 2uhkWtVjPX5HZ60Ti8/YL+X9GzP2xBU7x9ACN6+u1Ezx7YyWaF6zxFvOLoWIWtlq1MzmeUtBeCp
 2/83dD4Jy/HFDnq4chwnnoKz3ndcrsrBWYZzVigXSuTolcP7x/BiXdgXU52TmadiOFUOz5e9JR+
 kR6PA9THJQfE+dRVDAoqi3wqti2Q0z2shhp30bNeUU51QnGmN8g4h2yMKuGS8arEsuXvHVHA/wI
 cEKqsYHJ2/2gbUwJwbYS72Ek8kzuVvAtDGqR1BNuemt/ECk0
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add a generic input-channel-rotation property to adc.yaml. This is a
feature seen frequently in ADCs that are designed to measure resistive
loads, such as RTDs and strain gauges. Enabling this can reduce offset
errors by swapping the positive and negative input channels on every
other conversion. This can have side-effects in timing and filter
response, so it is not always desirable to enable this feature in some
applications. Therefore, it is best to make this a property that can be
enabled or disabled in the device tree.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
v2 changes:
* New patch.
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index 9ec1f447b565..3d52c00922c9 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -81,6 +81,13 @@ properties:
       ADCs usually allow choosing between internal reference sources or a pair
       of external pins.
 
+  input-channel-rotation:
+    type: boolean
+    description:
+      If set, the positive and negative input channels are allowed to be swapped
+      on every other conversion to reduce offset errors. This is also referred
+      to as "chop" in some datasheets.
+
   excitation-channels:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description:

-- 
2.43.0

