Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10222E36F8
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005124; cv=none; b=c3QK3apbi9yDT2ElMOhRHfJtl2wQbdoUl+MnsV1ORZjc6ZKfRECFyh9GfbKN4ahB60syINDa1OlxVEvyxOSFvJY/q1LM52JulY0uJjq3Zo+i7PsnOc0ami7CteR9PCDjkEciFyO+7Er0EPdErVrLBB4dUITqgYfRu/IvlahZINk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005124; c=relaxed/simple;
	bh=If9Ci2Z4+VVhHu4ohujPOv6EhM9Xxc6Q0kFET/yLWWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taE7nMV8a0R3CVFHc4USIms36RYADx5EGSyuNcKw1rhWNAMwD3kGSU4vZR4igarhM3nFjPlEVmL5ukXl4m6Vn7L2eIe4tyqkPreQhBE7UBNA44FYKJSNFGBD2loDzDaD+2BPYL30FRdeXlR/6iDVie+ddOBmWLfMD8BTSjqWFpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfaJUfEx; arc=none smtp.client-ip=74.125.231.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfaJUfEx"
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-443e4074a7fso725727fac.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 08:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783005122; x=1783609922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=kfaJUfExW276QNeSpG16l5RAtTICGaWj5I+o/PZiP1mYT5jbY2sUgci7pdAIO2pKQ9
         I3Vr0cUI9CXuvcVwXGiq7xJsH/gWqhgsSsqodpKlVQTD5/cgyapmgHS2YmczBFCQJttP
         hxvhm+IKKWiwBnMJ6GkoGG+gHJ3yMLc0bPKlLRBh/4dWYJCwtJAF2/yP++DvJ1YXhMWQ
         wmZ8q90R2P7bNaviXQplKGylaXY5rKBORgZnMqoz39ozsr7gldIX7mVqjFQIsZH5uHrr
         xaaL+vb3I/M/HR7baT+tCJiBL6Rd7QMGICR0mnnQmDoRl8lkmSPSIUnWW+B6rBB9EB77
         9Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005122; x=1783609922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=LqfKLQR17bwbgQQ7XJ0mbNhHFWfuDKK88ufIki3E5Kgv4Vgzel9/lG90gHMW0tEIQI
         0Q2wkMksStT7pmhJov3YjPgY80UydOVMhFUPyOu3W4rfOgQWXQPJY0GPFuedM91F/QsT
         VzceRoTRdtQHMHokozZp9Oc5UXg1nU7KNlf1H0ctEhEcUx/ECkzust0rkGEo+Zr+F8jd
         umipaXyR99JlT8ItzF/uQLQcpOtLOu2laXJHciWW1mczbziLoEzmz3TyOiERYm0iaI8d
         pIsh4pExZjCQDMOR8QKuUwtL3PZSs2hdE6fL6RHQLolMrIqgerJxuin28h7m0yRgGxxx
         xnFA==
X-Forwarded-Encrypted: i=1; AHgh+RoTMNA9PR6txwGz+2NuUIlynhRi0Z8pcj3uugSz1keA8d/Y72t3wOhqn32nJpGTrZqcn5SYIrrg7rna@vger.kernel.org
X-Gm-Message-State: AOJu0YwYl9m5uzuSJcbVsZ9GrkGm+tybLgkTtjNnJ35UZ+trym3MJR+F
	IlNlrQYsOZ0SJYlDuxemGVW4ANVrZZSJLwF45xzPQAU0Gnk4K+tDWiG7
X-Gm-Gg: AfdE7cm9z7WkmnajmBDKYX3YsIarN7odrS4BgIES+MpnLsYFO8KfYGL3CJn0B6XEawP
	NA5ztIFBEJ7ZNI+sWf3MXP3Qnk4wNXhmUsih4Tdq6GkX7weNfCN+YxMMKRiIa0gquItHj6X6zKT
	qiwE7r5RG94rGIwxfMebMFs8COriFeGsxYghhlFNxD1ppMPuLYzCshk602Qqk9pEO+i2c+qRsxK
	ysKjSLMCjJ6TWA0zgxTPIfB9ooAml4jjqRxpAJjecnzLPDy1PXmzJBsZpCFkjCzpsj4aA+VuErF
	9eokG8JZx5sGpbL+FheV1k2En1aKXMYnEm2vpEu35sFaa/rqjBYchY3U9OkUaZuVdmhe+uOfUZP
	9VT9NIKwjXOyS5GtsnV8baPW3g0FGVfUeTLoY0+BB3Je2HbgzqJhmZEUpv3ZNA8pmu7qDkRYsKa
	b7OQnASz2tQF4zmd0SVUBbTOFXDi1+cEO0J9BiqAPG3raGaTbbz/gscJw=
X-Received: by 2002:a05:6870:7055:20b0:43d:31dc:a6e2 with SMTP id 586e51a60fabf-44cad5682a5mr3142542fac.24.1783005121718;
        Thu, 02 Jul 2026 08:12:01 -0700 (PDT)
Received: from ubuntu24.. (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cbec9a113sm3094561fac.9.2026.07.02.08.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:12:01 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jenswi@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add mbedtee
Date: Thu,  2 Jul 2026 23:11:13 +0800
Message-ID: <20260702151115.544016-2-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702151115.544016-1-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
 <20260702151115.544016-1-xing.xl.loong@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the "mbedtee" vendor prefix for the MbedTEE Trusted
Execution Environment project (https://github.com/mbedtee).

Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d6..fd032a3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1011,6 +1011,8 @@ patternProperties:
     description: Maxtor Corporation
   "^mayqueen,.*":
     description: Mayqueen Technologies Ltd.
+  "^mbedtee,.*":
+    description: MbedTEE Trusted Execution Environment project
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":
-- 
2.43.0

