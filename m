Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20C840801B
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783723914; cv=none; b=fmDsaM4V/tDbXeODrvRV72yk9PjTJryv11PFJ+4F2tIoES014TdRwvympdUwlot+NKmBLfCMSf+HVQjPXJNmuQ+LwSKpEeJXs2msyPsfxWC/vKRlwab4KZQ4ijWgHXiJF/lq8oSCM6t5ihWPRTmJ5/7H7d2ykxZ0FevkGnI6pmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783723914; c=relaxed/simple;
	bh=pXZqBPVsQAX6C4cq7oQjhumpWyE4mIYJYT8ptp1NWE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GG/hlGG1q3Y2bdOTDR5Q+V+Xyt5yIIE6JN6TK19cq5bRCsu9BU62RP+MQtXowXR/qqUdFqf7Yk1byCcMvgmjvt8z9CXotc19fy37FUI+37v4b/w7VIFd4oWK/D5RV2CLXbbPqn5j8aHFkUs4TLz2ElzuprX/9w4tHXr9OHk3kDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FKLKUeOs; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FKLKUeOs"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6b5737bb2so1202654a34.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783723912; x=1784328712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+y/9/z07LI3KgSCtNcOq+bFpEuuE+3foLILyjogZgfE=;
        b=FKLKUeOsv9jtwt2ztMBCCDPG+42VoAEdRHJb09LzOLO8LKBwXIeUh1d+OyZw7PRPZ3
         VWTH9owYV44UfzoHa0+u4aOYMn8QI9x9wO7/i5BK3QJImahoPEUzdl1iiCCyhtBeayDQ
         p+rX2Zftp7lZc+bDWpy3/jOd/PrSzWAe8eY/0nGScv57VMZ7sCY0QYLadUJJQlaMKE3v
         KdLcPqTlkDClSisKfY0nE6J/jkXRyr7Fyd0Nuoc7bsnuJlztcUHIFZ5HO62xi/vfFbxN
         KIv72UJefCpQV3nasOZF47cCnkrQyQi4xYLiTrG5QZZ30/1rLosX+ovTv5lKFHTayTJt
         GZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783723912; x=1784328712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+y/9/z07LI3KgSCtNcOq+bFpEuuE+3foLILyjogZgfE=;
        b=VyCk7F95Zod0BVHz0WoGOKoSOPaqr3zGQjG/nEhtXlYQuo361GN1cUbkaKvXvkeUpS
         3iWJ7+RFh7GWZn7NQReCajEQO4keVOYXiG2eF0qQfNfuWFQjo0BKzChNtAUddcuUj0x+
         KbqjA9zxi5NDZTbnFuJCP5aWKy5kUn59ih3cnhViRbmSE/WdurYmNBtjkE2MP/AMsBXu
         FfCSc25YOsCvwuz4zyLVMtGY4Da2ppEb2cbJqobvvCQe73hZ4LwUkGGxIbBxgKjtJbKS
         JG1ZJV5eQOZt7aru1hBDBb6cZcnm8WYS0FIBYPK9XQaS5R7ncFcyy9tGXY8LdJL+XYYd
         ePZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/48e8R9TsP+lmE6wwQf/lBu/l1CuMN6ghjstUDGwqFQLUgkvEGcVZ4ROG8mf24Hikgf6GNEW2zjVMB@vger.kernel.org
X-Gm-Message-State: AOJu0YwlYAP0zILKGzQgJaf+09IOi68KDM4itVe50czzqGtJBi/egpBE
	M6UBdF/9hciJm4+jDwCWoEfGpORVB3gRwigOjTtLHVCMf3e6IdhFh92Wgzlp0K2BarM=
X-Gm-Gg: AfdE7cmBRbR4gwid2wYxm9DG67l9fmM2Zl/ZN0JpBEgsNZ/OH94ahWQfVYRWp+n7ORH
	S8VNCodJmLv3sUPk6TKCilSgW2RGKCHUVA6M5jVHsIkoWK+linTrKkqVWhLnKYQsjZFqprSzoqK
	TYLRBBgDQhzKnPxbp5FJwaUV9X3XLGAvgkGt3DFgUbR/whdt0XSRBPinG41kRXYEFTV8i/KG14K
	oTM3mN7ZQ0GTaoio/tpGWiLzjpgiW8yXrbGAEYLI09R8IHSV2cZwTYTTXzbcZUoLXNTAsXqkgeX
	mP4Y8uCWGilS6pyo5Pd3okDkn/wtU+RvPYMUpqO3fEiUFN7l3xPgJpMk+GyeAZVikQAZDVOqiTq
	VuerKdyPy3zb3lHXK36DpzMJPT9aSr8OpXJtVw42s1zVIL2/tnM2DBfQy2CTpd0CIrgz5uP4txc
	eKGCeZYtUTc7AnRKt0
X-Received: by 2002:a05:6830:67d5:b0:7e9:d67e:b4e with SMTP id 46e09a7af769-7ec098002c7mr518197a34.17.1783723911729;
        Fri, 10 Jul 2026 15:51:51 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1b03:95c:fbd4:4d00])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae177c5sm7613512a34.5.2026.07.10.15.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:51:51 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 10 Jul 2026 17:50:35 -0500
Subject: [PATCH v3 2/8] dt-bindings: iio: adc: Add excitation current
 sources properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-iio-adc-ti-ads122c14-v3-2-746d52cbf1d0@baylibre.com>
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
In-Reply-To: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, Nguyen Minh Tien <zizuzacker@gmail.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=XmbF0ShRVUfkXXkMkY1dCuNi3Zk0osW7wZx5cZbqL0c=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqUXdSmktPX9o174RlR9Srv92fOOYbzjUQJHjwn
 oP09HbHyX2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCalF3UgAKCRDCzCAB/wGP
 wKnoB/4oK7Qo5dwfv6uHvZmJdJORaJsimtHCeoktgJ+Li1+VQ9WD2KFgCY28dCxy4EjvcWvc3t9
 9dExy2kHl/xIrrSp/6lhNh4UbMgrQZfjbwjdOb25iVlDAyJB01/VefKIjFR8Ff5vOOU0aNHxuPg
 3TVgBmfpFJpp5r0ujVH/OSMwe4o1vEBKMaP1Fu1AMfAtDDZwCBLtz5Towlg42AhWcpmYR2X7oM4
 NcD4dYFVaccilDVG2sgz8VV7h2k8d4SnhYXqwwuJfVAy306zgRv7k22RjKOihfjp75FWqUITBWR
 CINFGQ5C16OohgV3bwdBDzdm+c6Dt/qU9Jfc0RCuQInBvW48
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

From: Kurt Borja <kuurtb@gmail.com>

Some ADCs incorporate current sources that provide excitation current to
resistive temperature devices (RTDs), thermistors, diodes and other
resistive sensors that require constant current biasing.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
v2 changes (compared to Kurt's RFC v2):
* Make units nanoamps instead of microamps to fit known devices.
* Drop bit about allowing single value for multiple channels.
* Add bit about semantics of the array index.
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index 8f608bf0b24d..a21ed9ae4bab 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -80,6 +80,26 @@ properties:
       ADCs usually allow choosing between internal reference sources or a pair
       of external pins.
 
+  excitation-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Excitation current sources provide current to resistive temperature
+      devices (RTDs), thermistors, diodes and other resistive sensors that
+      require constant current biasing.
+
+      This array describes the mux configuration of the excitation current
+      sources.
+
+  excitation-current-nanoamp:
+    description:
+      Excitation current sources provide current to resistive temperature
+      devices (RTDs), thermistors, diodes and other resistive sensors that
+      require constant current biasing.
+
+      This array describes the current configuration of the excitation current
+      sources. The index in the array corresponds to the same index in the
+      excitation-channels array.
+
 anyOf:
   - oneOf:
       - required:

-- 
2.43.0

