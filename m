Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B526374E66
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782424572; cv=none; b=befElwTClcwWKvUw23Wnj7pwNhFIwUts9lqfNbK3BdcsNYOC3Fyg5isuLz7PPLrzr7ioxJlwJK1SXRJfQm/+UZZptgopJXwzqXbTUZD0dXPhdC6oZgujGtYReZLA7HAMCRlf0qA7RrrCAAbQlx+es7SSgjHpqmLUHzQCrm3kATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782424572; c=relaxed/simple;
	bh=oT7d6Nij5xBJ0GhxOmbCXfPhv8G03zGfAYJpoiI7Gpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXViZlvsCCDwFT7hNbcBIG4kxEe4fqq9+K7FvhecnJfE4msQcS6GA8uU6pNcu03hCy3vp/hFvFcggpam93DTk+HBsWcLfuhlTvxwP1ptKTQkbdwd6uIDyEzT9MGA8qj0sXgRw6U62f2/e16ddZMMjUPm1P7itXuReKB5GX5Iigc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=F291xIRi; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="F291xIRi"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e6128bd9b3so151568a34.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782424570; x=1783029370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsHIhdRuiUrZeov8w2Nm806VX3ukPZRV2odhXBkDNHc=;
        b=F291xIRiLPw3WbQmg9qYGV9E8XW0yOIKjwJGAP5TmowmvU9ugLmeKYzDvadbM0A45j
         fvU64+t3KpzsTPfBc5pMKCpQ9QhYEF5npyou3hLC36uCF/EqhXd2KNQJmeirDFkQ70Ch
         QUQ5ZdTkj5kdej5sw1HeifT8XwqVkshynjMdmgb9WQW1lYU1GuCL2VhUbXg056Gaz2Yx
         13dzCtuu5k7LdBIJQNcNt/IlKoZCmB6aGgL1hI0InMk1JT/yNeLxtjJj0OJUzXhMBc1A
         PSxvD3wBvmN1yjjmagSuioyQWO9svl3xvSQ05D+IpSJjPZiSQS98IekJ1HQ0D36hZ3O4
         rT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424570; x=1783029370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VsHIhdRuiUrZeov8w2Nm806VX3ukPZRV2odhXBkDNHc=;
        b=B1Wlnrlx+Ce6OUGHB4zyEe38/3ztkrC6DnHsB7EX7k0Y6UpyORuZywkyn3eQ/kPOFu
         mw1qIuaT1QdxLcFYZZFZn9TLGsM/ewLMm3qGjACgBNjprukwy8eO2AQcOoJf7gKxXLZg
         prY5UkSJQTjAV9/OD9xgNN/B/I9VkKBiB3qCDNUrGKt5SVQTW/Nr8g96xH6OO5Lu7+lC
         rRT6RQZfw29+YQttFMvkSpZh36OJDc9dzTNFD3w8eP7c6SH8U8lxaRn6fO68oFDv8F1f
         71quh7e4Md0wYeFBqrbOduY/tDDMIiGGKA/HR/9b5BKQ7Xz/pbdIiHfp+mZUqBVzBGqo
         yIsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pkyuueaCpKgmdvdk2aQedoNDJbXYgDXawR2SHbQDzPPNHLOCSJpiHplrqjq5gITc/xO4xFzxq3X4m@vger.kernel.org
X-Gm-Message-State: AOJu0YxK2BUGqwMKj2Nu37GcTDqI6R0sK9z+2OHJuAE2fTuMXv4YZ5UQ
	mJSO773LpdEggJPLIuwsoF+Ff4cr7cecZ/dulN6ucbOn19b7/A/CTK8u21eegXN8b+s=
X-Gm-Gg: AfdE7clA+QNIg3nRRF/IsDGzQED9oLODhgsHUG9vJGidi2ilQsAqAZ9xmc5RUEwno3E
	le0mj0levnc/D2y1OSJaq4/GBgFgHFPV2DCS8Xf5DJtd+iAa6IPrMSw4CQO2tJFidRknIbkDyBM
	hUE4uzpZZRYhtxdF3ZRxsoB3XcVl7GUr1rcr4Wf4ikgQ2TIkmkU0LLcznRCVZQj7sTAjSshLqy/
	j4um+D6L631rXICdBKC+5NXwisGH3o+/aQgCD+XdtNnDaO7Woj0URmxZ4ZiRgQ0NHtV7lAV+7PY
	6epMoi0B6lFuuZaSeHPAMonDRAJ0fHpUIbGNR9TTjDzV+qRqyJp5zVO+w+FOoB0b0on/fjeLnoG
	sQB3niHrVbXONx3Uwjn4nsRn6pPuvOOxzaYGJYJmgS6aS9OqsuSeTHkmiND2zgA9vMlJLLyEy+k
	Vf5Bz2WuauF/pqQ0jSXQ==
X-Received: by 2002:a05:6830:8295:b0:7dc:c7aa:22d4 with SMTP id 46e09a7af769-7e99bf3fdfdmr4319532a34.1.1782424570353;
        Thu, 25 Jun 2026 14:56:10 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:f1f0:2d9f:2f31:3426])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5e575csm206058a34.11.2026.06.25.14.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:56:10 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 25 Jun 2026 16:55:05 -0500
Subject: [PATCH v2 3/8] dt-bindings: iio: adc: Add burn-out current
 properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-iio-adc-ti-ads122c14-v2-3-ceb9b0b561cb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=KXYgI9rKSrwXDaiih3yLVG5FeAxJstEB+wScOVS9eEA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqPaPPx+i+G+uvga2coWlwkMuoYqCJY0yLabfU0
 fTBlhjLzN6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaj2jzwAKCRDCzCAB/wGP
 wIg/B/9uZ0SQ+KLcG4GRJLXEY5ggN0MPW/UZXZhajU4RMuWtwsCyzVysCRq4IVRp8gZimrF4i9m
 sOIRSk2+E2jlRw7UJzQlRIw1jZqLMLwqjWI0/1Oy9j6X+K+kTOp/94bq4KyvuEeM23HR9urKctg
 7h+z+ms20MPVSd0waZXOO9S5pxt5CQoKvQWnSzDTQGUwbw/Q1osaScWNEvxwFaIw8Is6zOXn1Ga
 OSqZO8VAxY3CvZ8tHK7a0yICHRWI9+upPWrDhQnhGfYnbkcqck6z+X6ZeJ70Ngf21sA5IyvGRu6
 NjCq/PjD7NZ030P8+bJMQsWp9VhGGLBnceFl4V6nMTF8Lwgq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

From: Kurt Borja <kuurtb@gmail.com>

Some ADCs incorporate burn-out current sources that provide current to
the channel's input pins for open-circuit or short-circuit detection.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
v2 changes (compared to Kurt's RFC v2):
* Changed units from microamps to nanoamps to fit known devices.
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index 860601ec5334..9ec1f447b565 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -101,6 +101,12 @@ properties:
       sources. The index in the array corresponds to the same index in the
       excitation-channels array.
 
+  burn-out-current-nanoamp:
+    maxItems: 1
+    description:
+      Burn-out current sources provide current to the channel's input pins for
+      open-circuit or short-circuit detection.
+
 anyOf:
   - oneOf:
       - required:

-- 
2.43.0

