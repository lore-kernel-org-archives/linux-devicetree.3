Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C344FDE7F
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794593; cv=none; b=jzinaX/+ZLKhYPElh9gC5H06LEpPeV4VKRQ+STLTVXKWgDnE1BKHUO+Ho9190KGrCmv9NuZ7JLxu8HYPxHx3Au/4BGZuDCzxLojk0f/UXOTv7FjxTivDnML0SFixrn1oIfhjAZPcjCRDR+DRSHVmbfjb3WqSMk2oJ1CYM60eE5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794593; c=relaxed/simple;
	bh=rRqt2DkRwkgR8tWQwQ/ymaqvmLFKJ2cuYcMhprDy/xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDFUP66nCi+AehrXxysUdPTNFgcz8YweAfhIb/Mr54Em3uCEre/kbWBSvGeeG2bEyBof9ocMGjZ5nzlFjpKBOejtdgKhbFrM7vdf5B2HnEJDjnDTkXLK7JhzsiqJz78/ERn25XzJIEyGTIxQDyel1jPG76tl0esgR5kIG0hQGjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6QjMjbR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6QjMjbR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso55571735e9.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788794590; x=1789399390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LGXRLOWBLjDeRkzuVxlsTvsrgZVPRLz7bQm8bEcHaDA=;
        b=D6QjMjbRdcBVAavHOtnn8BrmBzuj7cJXHuTatURtV7qyXHGgecRMEUELQnaJR5SE+3
         ckmQUo+otiY6YfzQjb56m/tc3Ysi6WFVII8eedNuibGMrf+0If+AwJPhoOKaJjCG0vMF
         mRDFkQ2llRF7e2JJ/r53ZqpmnW/ABsU8TFhPYgu/8kGt/yj0vCIT69mPDrYgAPIN3d3l
         UL0CgmTgZSxQzpnJwYldm+dxa/rptcncuqPn8zkUa5QxbSBLTeZLACugsndGwehUgIuc
         olwzvnwJfpJ18Q34Grf42Q/bOvLttQwKeLfvRZI3te8L3Q/ugpgDHyQErE58bAmPlrMH
         D8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794590; x=1789399390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGXRLOWBLjDeRkzuVxlsTvsrgZVPRLz7bQm8bEcHaDA=;
        b=QA9H2kVq573j+wO0UuqNt6jD7qeEWlevXdQqGZO1raQ+C0gdW8I6APYYaX3PVCjtGb
         FMAm9IevaMfX8OpotlI9jH0wHo16FmaW3KatuHyG536j7lDgl2OMPeX641ADn7YEZozC
         xmfD0wpgSV8GENVtO/7Qz699QW2BNzI6w1WTtU0ElV6UfXV7ZKOBJIgkyhxOUUcP1k86
         DubDlONMztH0Df7RvThdKEqhHojmm9TrHrjjvsit9WltrmC29SJmqqY+ZPYDddBdWu6H
         YF6HTUu0a6oIVt5+J+576up4yukAxaMMqDRn0ZRQ6wgwtSSMQdPF/bH0srhz17ocW9uP
         1pBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbV/Zk73SvkDiKvfN8Inb6FmG5X+mK/lxHMNOoQi6konHuwh83Znr9fvwUkvkeM6i1g3k8J6B2aoli@vger.kernel.org
X-Gm-Message-State: AFuF++naWth0h7ynKaydBCkexgfm4NR/FwIIrPpcnJnqAzT+km0wvSrF
	7Ks1GEv6bHmEP5Vz0OCAMLt5g4e2v2sJH2s1fxGQ68tPJ/Lze2RoQZ+u
X-Gm-Gg: AYBFou0elj/4Gn0KVr4dku7oXH1g5j/R9nYoxHjPEuM6eLW1Xq4xT4yDOVUjvfIu7qI
	RyO8k5KJJR0rLajcAx+hWOSIZQXsxDNK+n7mjnu0BWwvJOjvWdX+Z/MEkchlJONcCjzYqkv1qxc
	x5ppKj5wQFiJnW3+vRqYeoWorXK4kX7Oa/u+PIQkT1jT3t128hgyKFGuZmplV7+Tb4GaS4Bxk0P
	u2hcdDxeQQb1evMBj/X67DTCAh33J8hz6omUJS3x5Y9lv5MUBwbUKTAw5gEjSzXYzQ4hc6MdkCL
	oB75CKFCgpMk+MjWaZ2rXrnEUr4VxQSGSHXpU1t2Q0zdSm7FaTPsF8S4FhnRmxtaLEccGnGwpp8
	pXFwUovFrkqrVSurqOK/KInBy5JudQjiJX0b2MPncpLHX4CICNRhX+buv/1v1o1viLG0FfPWrRG
	rpKnILc4VqMWa5dkovP7W4rwqjcAhmA28aY+cW03JRZAaF9+QUIywyYNnjURTNk9waDPqb2iHsU
	wJecBYhwMnkj749+EQy4xYQ4G1zpsG19PEwkqWoTQ==
X-Received: by 2002:a05:600c:4e89:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-49cfa211d6bmr203694125e9.22.1788794589574;
        Mon, 07 Sep 2026 08:23:09 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm413785375e9.4.2026.09.07.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:23:08 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: ti,ads1015: Add label property
Date: Mon,  7 Sep 2026 18:23:03 +0300
Message-ID: <20260907152304.4992-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for an optional label property per channel similar to other adc
chips. This allows assigning distinct names for each channel which can
match the schematic signal name.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
index 718f633c6e04..777a75c21d7f 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
@@ -66,6 +66,11 @@ patternProperties:
           - minimum: 0
             maximum: 7
 
+      label:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          A descriptive name for this channel, like "vcc_ram" or "CH3".
+
       ti,gain:
         $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
@@ -125,6 +130,7 @@ examples:
                 reg = <4>;
                 ti,gain = <3>;
                 ti,datarate = <5>;
+                label = "CH3";
             };
         };
     };
-- 
2.34.1

