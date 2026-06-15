Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EE1307AF4
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517109; cv=none; b=WZFJOj8vyRr2lxbDnBzEydsjnQBNZMuD0dBXQrMIu9DjOyEqvS9iUDaUh/7K83uamDnHqQmt16BJdw2W8lL/AdGrbXV5OOBxfAmh9d8jGFEYN45HWqNO6u6qxuZaxqT/tpQVzocCePBTM7uZdHun0Bsh6dyiY7ZJMnyQUxJGGWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517109; c=relaxed/simple;
	bh=HODmTcXqpkVz8upSr1TfFa4wg8vBwZE/zjgJ/idrByE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rGqKWaxW3tPmDpYbYh6468dWwgxHizNPiQ3jZye+de7yl7zqg8PxAIz8kYoSjn+tma/OZmYskZAVD7iG7WxDF1E7wxo5D2G2GYuTHz/pu9hLoOmDjmaCxv+9XIw+o68iYPqVV4Jw3fuotvMNGfypKBdwNFvQNKoZW8MVo/FeeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOEMvekZ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOEMvekZ"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8584e80bd9so1126235a12.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781517107; x=1782121907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/rIphLJeoUl7R3ABdw1JOIvV3ARmALyt+fJc+YgD7k=;
        b=rOEMvekZW+VYyyHeTkvaS4nbH9OZY663o6EfAms1hfRmJ9K8pVACcsRXU7CyfaSPGB
         0o7fDFSKAxpFHnY5ifBwLlQ571E0kK6eVoAEwunlBrz2bE3Q58Wtx1xBjWEK7P1vtXf3
         w0+q+UH7SohXOrKfFRuOICSpmks36IdoPT57hTK1XQ5/zAyauP/3JDrIu3hxLb1yh6DV
         Povi3WzLMjjNIwVGTVs1SXjFbb+q89HWQCeEZl6o66/KsC6mK7hn9ik8vPxl0PN1MQdG
         WwyZts9YDfJYz0qapUALIjnZ4yJ8Dmqnjc4OddsFG8QaGgPDUIY8TLp7YkG7zOC4S/4b
         52Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517107; x=1782121907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d/rIphLJeoUl7R3ABdw1JOIvV3ARmALyt+fJc+YgD7k=;
        b=fS9BSGsSUt+8c6G2EJDIokecrdvlMZFqGD1IJJ3ZSR0mclkm5g/xEXGjHZsULi91Qp
         /M8M+MaC/ZCHcjy1FNUsiFg8fNO0MIoZbZy6q2RWLIJIuAl/Euyu4rEigINbKuF59aJ/
         pdUOqjf7VMT6IgbSd5oeH5rL8AAmhc84fpPzIwP6zXpv1fCrbGkj/pioW3ERtgOAJqZx
         5BI0ylfZ1z8ZJJlz+oWrBLNNn1GVM2hIYUoVC30a35tuZMrJUPiYXpI0USEcAjWnI5Nu
         wLOxdlfBOOmDNj6mVQlhAyZo5DN8zh/wPDspDvhcBaWcXCdgEiShBFJ8wAsW/WK1b0ZP
         M9Ng==
X-Forwarded-Encrypted: i=1; AFNElJ+h13/WdZ0fBGTojyD78bjy8BVDrL8FnuOGnLJlsBl3RQ/k0O4B6Y6i2k9z3Qa8q5Zeu443HJHtH47F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/5KP6cx+Ksg1lhjbKceCy0CBcnDR97uxCKuA1cTlmZGctAJu4
	s79nJV56P6sbM7v1H2mopMGBtB/GcS9qERSzC3x6ylSQ6a2NM3DEmtq65ruRgQ==
X-Gm-Gg: Acq92OFS1j9AueZ3coSD7RxHzYA/gZ0Bm+Up2UESStvHppkOr9kjQXhZSQ6QhWf6do8
	Vh9EWlVmeUUGXoe1zm5O++VbQdoB6WDg1jgt8PCCsfAv1AaZzfHgsd1U269JvAwQY0z63SCHIpS
	CC1PHv89CIUXQCGnxHplrUGlQfUOc5yYKZN4cJcmvvljqdyUGuBfbf0eONMvd03vxTUYOiix30K
	/QsUS6f4p/2XdVwGc51PN7/6VKHAcs6FpjOblde/LCz73fy4JIVHqVhWoIPiAsDMst9UVKdvdLV
	sEG+ZhO0mW+rUOp7Gbs2hgCX67PxubTaURVSHFVzQpXgpq8CGKvvZsPbM/ANg6XbFM5CCeSxuPA
	12z4kDAUwQZZUgQ0JfRteCqrWfdbkVB15L5YTX98PSf0M6Xe7QXBLbuJh1ppR8qIJx+l7IkhR3l
	A2BCYqPaJbe+IE2jjeKJiuOHBlypbhpgj5srssUvCGgqa7xk64/1Ue4VByQP/dia/zRA==
X-Received: by 2002:a05:6a00:1993:b0:842:6004:3fd9 with SMTP id d2e1a72fcca58-8434cf1590fmr14616990b3a.29.1781517107309;
        Mon, 15 Jun 2026 02:51:47 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a5bsm9922207b3a.33.2026.06.15.02.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:51:46 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 15 Jun 2026 17:49:16 +0800
Subject: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-lm25066-cl-config-v3-1-decb4f5b0b77@gmail.com>
References: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
In-Reply-To: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781517101; l=1952;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=HODmTcXqpkVz8upSr1TfFa4wg8vBwZE/zjgJ/idrByE=;
 b=7z8rPmUZMwcSfoOqG62nxNjTgm+lFLygOWMSLDLYp7uz6FWBBNI8fe3xR7e8erPbPoOuq2g3+
 fdhumYCR2VFCTdegyQSO0MRCny+XZ/g7K6Vwn8b3J0nPAkg9383HH6N
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Add a 'ti,current-range' string property to configure the device's Current
Limit (CL) behavior to "high" or "low" via the register, overriding the
physical CL pin setting.

This configuration is supported on LM25066, LM5064, LM5066, and LM5066i.
LM25056 is excluded because it does not support configuring the current
limit via the DEVICE_SETUP register (bit 2 of DEVICE_SETUP is reserved).

The values "low" and "high" map to the respective low/high threshold
voltages of the chips:
- LM25066: low = 25 mV, high = 46 mV
- LM5064, LM5066, LM5066i: low = 26 mV, high = 50 mV

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
index a20f140dc79a..fe42daabaaa8 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
@@ -46,12 +46,32 @@ properties:
 
     additionalProperties: false
 
+  ti,current-range:
+    description: |
+      Configure the current limit setting. When present, this property
+      overrides the hardware setting of the physical CL pin by configuring
+      the DEVICE_SETUP register.
+      - "low": maps to 25 mV (LM25066) or 26 mV (LM5064, LM5066, LM5066i)
+      - "high": maps to 46 mV (LM25066) or 50 mV (LM5064, LM5066, LM5066i)
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - low
+      - high
+
 required:
   - compatible
   - reg
 
 allOf:
   - $ref: /schemas/hwmon/hwmon-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lm25056
+    then:
+      properties:
+        ti,current-range: false
 
 unevaluatedProperties: false
 

-- 
2.52.0

