Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5700E42BE8D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896805; cv=none; b=QBa4Ria/YJs/nM1HByOPeXQ+xkb52PRSxm/B6pc7OnQph+KfuDwoiTTN08Hmp0RQbMrzIIwp82QbJ6p2/EEonfBZarRYw9KLBlLYeTL0iC9Y3UvOpSJ5EzVygsZNMHu9xPApOdJpz7P5o/FFwiM4jSRdUpBkXezDc6RECCyAk84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896805; c=relaxed/simple;
	bh=grNzaIZhTarizm1uEFeEaqFDbVnPHTcu7XioeAt/FBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DgujBhuH2g+Am0QSwq4lUbDtkshyNXnSi1BcQ1szch69NSnYVAnTaGgPtl6yyETNNhS61ffmMMX10LGcWmjzoOMSX7uOfrJ5vwZj1xIZpgVMwMYeG8t1+k+rx8dKX1jv+mz7BYyCEHT/hRPrkowfWxd+sX4klIYepoIPkQLeEpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYnQaVyx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYnQaVyx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957eefd361so3517905e9.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784896801; x=1785501601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pb0xWtZMy3wb+Efco3IddiNHPbPPr5N2NAxGlPTtloA=;
        b=jYnQaVyxd1lGjUwaUfIE4HbxHoL4WKmqE7OIGWaxbH1YqZ7YxfhulU274bgmo23o9Z
         JRgJD42VND6OJnbY5tyc/YoewJAK4xAkKa2TwlyW5iOFMa9dCHdHgCQWaUAyUUKoDyj/
         X2tOIdIfyf5BpZ2NvHAtxCZ6mS1rBVWVAxwlWmyB2mJe0SLR6AsNbux291oxsbM7BFAw
         tCaESd/TaAZXEjND//XoAt+8mbD0ZPhHmTl/W0g+8d8Ungcoydc/yZd7RCQw2pMmUKnj
         MQ9OuHC86SsyA+qY1A3IFzgTgdn/xs8i+NpkAv8vbfQagsr7+QZ7YwUE6+lsZ6Wpusb9
         qsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896801; x=1785501601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pb0xWtZMy3wb+Efco3IddiNHPbPPr5N2NAxGlPTtloA=;
        b=hiRL10pS0/YAGz9a3LrWuqN/3mMGrbyiislo7fHdpSkuH0aq2b861w4Bh+VjtoAwA5
         ov237fra5GR6X93VlHsH3Zn5XCMB8i8rBnFWeN+VkapcVl/OFxPbwtNmOMWE35sVkYf2
         aQrYw0tqD59PIBvC29WOw9KiSfMHk+WtjYLl1AuUQ5wEg2bBxbrMRvtuQ5vX+l8cvPXg
         CVLeXTtMQfXTZCnhPHtSvWbVN154ACC4coi9h0QPMFIl9Pgtygs2+l1k4h2ozauwFc2W
         S1XiZYqaS9HFaeD5Bs8PJm/GhgdTeJtJldMKyIhDRFv+0oyKgH75BWCn1ipaKUZqXI0V
         Ur3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqoiKZyykHNpzbIkKGvPIbjCvUvehCgXrRKkh4Hgz1tUsKOvKyveSNtdTi3fM+JMlqOVtB5+vLs9z9w@vger.kernel.org
X-Gm-Message-State: AOJu0YzB42dtPe/t7CAXpOURLb+yNqeW8mczeXrJI24/Od/ApWGfAMa6
	ZIfEozmCX0biLtZyUt78nYJOH6fZadc1xXqhV/NqI5io8IYJ5j8OILdKy1ztm3cjpP4=
X-Gm-Gg: AR+sD10XjL17y4WSMdLTizq1ndqwIJyg/sPzELLZedEfUrx3478FMqWvJ/wEr4kW5BM
	bDjD09ri90bO2u+1FJgOjcEiizTi1gPIlCdN1+qpIxIxCi2679VEN5OTEkKq8bklkBsIw3/lAFx
	G/46vCbbwWSQLg5kGUgpU6SPpdORuVd8/npOQS9JZvz8Cjoz3ZNQgs0S26JNAviA0lm8CLAEwM5
	YKfsWKTXNuyedBqkSRLUGto0K8N30Xd5iN0PBanvygVM5cOjPV8F3cYvK5HN+Bh357lCfwgPeBp
	cSn6F3wgYZ6F4lGDyzyNeEPrf3g1bs48itdqFYw+oli0tlNKx+vI1GGHWj6v8jKY40F698PsWhU
	32bvy4Vf7bPZ62MV8AoO+iEZ0Uox75APNBhiRdnSe/NIsrC5YHa0Dq5oNmio6dinI5VZhASVu4q
	Q51weJ5sSNNu1qLDLhhnAucWZSm8nyZSACE6w=
X-Received: by 2002:a05:600c:c059:20b0:495:63e6:5fb8 with SMTP id 5b1f17b1804b1-49573c9bbdcmr62628475e9.12.1784896801561;
        Fri, 24 Jul 2026 05:40:01 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:a07c:a901:acc1:9287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af6b10esm71556795e9.5.2026.07.24.05.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:40:01 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 24 Jul 2026 13:39:42 +0100
Subject: [PATCH 1/2] dt-bindings: iommu: add arm,instdata-override property
 documentation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-arm-smmu-v3-instcfg-override-v1-1-e7acf4a8a525@linaro.org>
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
In-Reply-To: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, jyescas@google.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=grNzaIZhTarizm1uEFeEaqFDbVnPHTcu7XioeAt/FBg=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqY10eAg0RYUiLSa+cCoQ/bi2kFDEdZd0AvKhcp
 BNevQec4jCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamNdHgAKCRDO6LjWAjRy
 ujuwD/4vdtU14qtM7zY1gR4pBiw1bskRRH+U/hdF6Efn1OO0Dw9syoJjGIukFMdeUZ7ZazcigE0
 Ehf2cje464+yA/9S/eHT+2+6J992g8bI3b8A7sFNJE4nSStrgA154nK+Ns8okuYn0Uykyllx8sT
 oFOyohXlpjSkV0YXzwZIoBpXULUeiSXNdPJCb+NvM6dE0VfqD+6LCu6+qjz5q9pLnN9PFPYL+qa
 ml7zGOyKfLE/Vbw/HrWZ9n2p333/reyCw/zvIce1ZPKjqCaN8udMSLBqBRYr1GIZ2GkI2XRoDCN
 4IXAwaoUcXTqyV08728bh9c9G/kkTs56cNRWIRwaYWxFGPAxqZruRFs7GD6HnjpXr0WYGeb71lA
 u9DMtcE3AF3K3wWQ7TlymI2zAZCtwna7WdqbvGnUvgfuOt+R3Q10rZ+kcHqE0KLKL/egHYO+Ymw
 pZiQrylLK51/pxVqZK1fc5DL2LGs1XLkp1rOIYak/c7Hs/oiRgmvRXDsGjhN1y0AHmuQZKpoiXZ
 DEZmtJa00EsMsFit8+YC9WQ9JxtTj3dCY+c1t8dGdkDzc8hTymLXl2avvWuEf92eMr/Qenub7K7
 vYypUP1/G5BP2nku6FoVTv7lOz3Vu1lOZK4PNEkZi5BBbmTULXr+HLWFZ6QpFFdoYmTwn5WwR3C
 voMklnr0DyOl/Ug==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add a new arm,instdata-override DT property used to enable the incoming
attributes override feature to Data.

This is used, when the smmu can't guarantee that these attributes are
provided correctly from the client device. One such example is Google
Laguna SoC due to silicon errata on some IP instances.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
---
 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
index 82957334bea2..23ea5e8880d4 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -83,6 +83,15 @@ properties:
       register access with page 0 offsets. Set for Cavium ThunderX2 silicon that
       doesn't support SMMU page1 register space.
 
+  arm,instdata-override:
+    type: boolean
+    description:
+      Override the instruction/data attribute of incoming traffic to Data
+      by setting the INSTCFG override in all Stream Table Entries. Used
+      when the smmu can't guarantee that these attributes are provided
+      correctly from the client device. Google Laguna SoC is one such
+      example for some smmu instances.
+
 allOf:
   - if:
       not:

-- 
2.55.0.229.g6434b31f56-goog

