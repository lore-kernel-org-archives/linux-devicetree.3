Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31355373C00
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782424571; cv=none; b=HmCbvABGdSmIX0gbEBc8Y4a1VlqEyK3/rToX2niUk7l7YH1EnlMsyw5/zXMNCeRDCHUQuAUv88eJ14FyYAWlEzx89Pv9+WvNHXi0ga2tkWYBR437sgtRuASNoYvRk2DwLl8VF4DmKCBAuwoYW2GYPWAMI+cGa09u/9CKyqEpx1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782424571; c=relaxed/simple;
	bh=lukM+Wf3ULNqjeyOPZiPJXnxhdqiCx8ZwaqvGu1DSUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bv4smuV/cgtojlzuyPmbgi4jDQG2rwPM8tePfxXeUyDdiqo309W4tHqh4cK6NwHANbhXCH84/8RXk3uimZUpihMjYZWFqygUKcyowID0ByPZFeLdiykUGZga7a+ijcx/VGdqaUeLLCy9V0W3rWbhd/NAaW254MZoC6ZpsZhm1xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Q8wNSTkD; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Q8wNSTkD"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e6d37b7098so329730a34.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782424569; x=1783029369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyOiPMSqrkJp0SvXAGsNdlFr3/6yaTMdBW/g1Kb1HrM=;
        b=Q8wNSTkD7eY3IhECfr7tNk8OSp4qD1Y3fh4h0jxz59NiaAg0H6Hmk6+9kYDlDnortC
         fZ7Olrd43mWov+PmNOhsHCFq/qxXShLiGvqEU1VRnvFd10KeLK4/pPzW0NbnB+vQDDSz
         OlCr6Asgix24zQgn3XH/q8dJ9zizqVQsBlJQ+jynWAXuDB7qG9Z/SdO3Mlms+I83AKDc
         EaeWLPMjvLqZUUeIPnvh13ehQiHfsoPToj4GSB8qkanU6icMzA1/dJDG5wqpWmgeMz17
         yRn4QzMZ5cNaStom3IHkpgqSr5T+s09wH6Kc4oNzdlqLgKt51rEhZdYQ4f46Fdj8lNCh
         U5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424569; x=1783029369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PyOiPMSqrkJp0SvXAGsNdlFr3/6yaTMdBW/g1Kb1HrM=;
        b=cO3DhbJdsDa3lMl5Ki1JLGaT9hXEx/srp9mxBdERKgkoj+2Vxl9H+nFp+TPMlJug4I
         YGc+XSujfEdzXFevwB5Idz6s3gbgDEaEjNDqSk/uVicWRtu9a+sgRwcH87T6NEVJzXxD
         BXd+Ge39bt6cNhkvHMmxRbcLfVAWodeHTwv7WundKVMIk4sG7o3yh/SW2RzZSO095WDb
         /ee06rS6Ly4JxRITdkvvfypgXQGdV3m2HsJwRAtlyLMnS71MPHqeIVX0QF9sLTl0SjEm
         qyyfGi4l1U9vOjbkqVpTnOyYvOPWC6XBEdjvvWWHdLO6Tiqr2R9+/CsI+ep7lH7i3p5P
         mN9w==
X-Forwarded-Encrypted: i=1; AFNElJ888qt5gUAF6b0jGqHK0rolElS+6AhOUqkFNNFRIzSLcJjlJ+ES65mEarrcnaSZ/KVw066y9oxfbodi@vger.kernel.org
X-Gm-Message-State: AOJu0YzgX8r880MGVSPHERYAA+uVjstFRWxyM2xbpzskS2hE9/8AUml7
	IiYdcApfHotgi41MMiXXwIJSdweK/DL6/cB0bs6O/P7T5FHLInWUfXqf7XNSTQm9Gk32P4d/rrB
	QPXxt
X-Gm-Gg: AfdE7cmoHxKKhoPxsKxPQf/szUvfq2xQeBSsvuLSMb2zUFrbHhyU2873j2DWyq27y7p
	Yuz4sk+Tl0lmkOlVKJAu8dOEJTmN7+Hm96bxV820THrmNF0aqof1dsMRLlkHTaQdNraq0VFLjAN
	E0RIHQI6EJRahhYCmqv8V+jNtA37DWpR5K0nDDoaBzwALdQVwvyyKsdB3ZA0A8BUdzvyYTsTaFt
	EImBqKbyY3WeJwlnZjJaC4xE9xL17HlMlIUHNPqSLaiImVx+XoT7RDeUGW7FukXUvR6gMRqQi1E
	Y9aUY7U8I3hPmG18cF04X59m/5hLO+S3OVYq0Ea6n/tZnfyuHw6gWSbYxWC9+jux0jlUS1/JtuN
	OvIvwK67iIANcaHjPuXYIRRiuxnXcFmQj+5iFbu5LG2Y510fSIN7xpcYpU1HKOkDpgIKxsyGUfX
	knbStQa5jjOumqzFulWw==
X-Received: by 2002:a05:6830:d8d:b0:7e6:e022:4b44 with SMTP id 46e09a7af769-7e99c35cd63mr4393078a34.15.1782424568999;
        Thu, 25 Jun 2026 14:56:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:f1f0:2d9f:2f31:3426])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5e575csm206058a34.11.2026.06.25.14.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:56:08 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 25 Jun 2026 16:55:03 -0500
Subject: [PATCH v2 1/8] dt-bindings: iio: adc: Add reference-sources
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-iio-adc-ti-ads122c14-v2-1-ceb9b0b561cb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=wmC3rJ2+hVY+xkwcr3Oj3oblZhpD5wKRDtYOppYjMJk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqPaPBVwHC9uxAfS3Z9dlUYFpH2YcG8vzKsueZx
 jLB7NBYd0+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaj2jwQAKCRDCzCAB/wGP
 wHauB/9QYJzzP5Uw60OzbEFeRNEc/q/Yt005k2r/vFHeoHV2LEoa/WO+bS7mgOLjusSpLZUAh5R
 gGPQxZ7xQwNY223kbuPEAk+jjZTaf2XvFNbBw4dmSe1JqnHtLKrqYuQoAVEa4L4eWmM/WJC9d5j
 T4S3s3oXyP+537D6CYSPsSfC+RPuFOJf0vkVUZmZZsdOrKPnYpjBt7nP1iAh9oK+uK4MYDei5vP
 1FLavbpRqeensxKBf3GcRFmX0u2+e8l6VjyTwg9FcmDR/jYEmEmJQOG/l+OF/bhaVizCoIriRE5
 OwBalPtB8t1qNCaxrY+04aUPrUfMWYujBzpo3N3oqJbe7j7U
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

From: Kurt Borja <kuurtb@gmail.com>

Some ADCs have configurable voltage reference sources for each channel.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
v2 changes (compared to Kurt's RFC v2):
* Drop maxItems.
* Drop 2nd paragraph of description.
* Make reference-sources plural since it is an array.
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index b9bc02b5b07a..12800737d4fb 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -73,6 +73,14 @@ properties:
       device design and can interact with other characteristics such as
       settling time.
 
+  reference-sources:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    minItems: 1
+    description:
+      Indicates the voltage reference source or sources for this channel. Some
+      ADCs usually allow choosing between internal reference sources or a pair
+      of external pins.
+
 anyOf:
   - oneOf:
       - required:

-- 
2.43.0

