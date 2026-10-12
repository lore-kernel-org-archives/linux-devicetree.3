Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0598147ACDF
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799798; cv=none; b=tcQ/6hoUuH7LteFIl1Efkv1svk/Eo7IA8Wf4zGM3vDt0ViaTXoNIaB/HV6Mx/hYMBRtpyFhllaGcyKeEeP0uaM276QZ9MzllU4iJh9EqM60wq46vDK/MY+x/DcWMINJfqX0z9SrjnAM4cWc457woSLkVlibYAyLs12TH5DSXsjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799798; c=relaxed/simple;
	bh=3h/9Irsh6hLdvhKk61bUEKtRVcfu/x6aEEt8IH3OiO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IakVyOi/doV1tqBgUdwxPUmmGrT/1xu4aeY8sqPUm0S046YJwZg6Wd3fPxwX1xFaKbIa/L5U0tc9sNJKBzp8UeUwSjtHbfRZFxZkuJIQA0hS92peJvHhhNbFPU9STjFSO4IndzY4aSy8Vn1T9eZvPDLCwdUcEQDqiweKhXUtyLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkhZex73; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkhZex73"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso12045235e9.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799782; x=1792404582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=EkhZex73SaknsytK3yE/eQKCBNED4ArbU8hmqkWly/Qb67CDG1h2betmYNV6k+rHqU
         jFJiPg4CryUAdMQHYYnT1mFIHHUHJvkzWxIIr4BNzZvf0xkmWCTnLQYzG0KKNtj9Wwg2
         BOldnR6I6XS9v5LGq8IAgwcsQ2GrIHTS5Xw+SYBXkvb3tvu8TJ6bbbqC5ZfMNUPaYFLI
         mwGkt+RCqPqogI+xDuB9Km70sY9xDSdx0vCN8IlOo0yUMjPlVr91F0yap7Jc4sanNros
         lYu+Xu2Y/r5Lr5zFaFVvo/x5cxqoQBIl0vahyH0VFQlIgBDm19o37X6JFrUIXnHZmczY
         N91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799782; x=1792404582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=LjxHMwNwBKwoldJs1AlEphyCRtFUiufw/so60ajkkaT1HCZi6BFon119ZUYhIucgXl
         zTkcyMPER8M0GQbz/T1pfVv08mcXirlelfC/878TppH9KBMM8BalGnQCd4xefJHUX2s9
         kItO9amphnBm9VV80JUQIGlPn3QFjgYOCU3OThS6+pWUjfdVcLi0TaVw8jdQozI/zA93
         OVhG3xWZu8ahefdxgtzb9tDDQnLcALtopvlEyoqWOpt8XZ70fIOWhO89NnnlEAy5PFPD
         a8j1wRCMb7ENb9IG0zrgbVEPtcLF0M2bmgz9A9FxyiIyKFUtTOntSq8/5rH10gUImWvq
         cHkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv92CKhgiQH2bBGQsf4bM9UkrRZAdNVpqjkGbput1ZS5UPdG9SwL6Sk4A6Bpcjv99v6YS16T4g8zi8@vger.kernel.org
X-Gm-Message-State: AFq9FYKPygjRQEvtFdvgaR577YAyPar/z7SqKF5wbcM3Kd4PhTw3ETrt
	ZgGcUIclpuBbpVBxiSnHsdsE6V+gvglUEtJdS8AO99W3Er1ytF8g7vBK
X-Gm-Gg: AYBFou35dcSKwv9bO/OnlgNaT4sQswztjE1aW3HjO6f5YSZQ24rJbP6Qmysn8mFeLgM
	ZCBYBd2c2PTu8GJFRfv0PpHmAvDF74vIwJgOKMD8CsFoGySIZNA+j63jsgxoxorfO35+ub6L4Ph
	6HOXjZeVSktbrTIo297BJl4IUN2Jmo1eJkHCVa+zewdSynvmpQPKXtfbP1U7yAaLlGLwCSPpVEZ
	8USZ2wp/DVvR8n8FDCCn3/UDI2ppQw3CeFY0LK2GLmqzV2lLKBfOdTNrth9rYdMNA+CjuD5+p0P
	4ym8JeUH5HHBYGaK8a58Gv8Nw+VMOha5I6NNS0b8+5NjWbi15FPodYXYsenA8/WKXrJ8TV/G+uR
	ILt7a9tZjUpvyq4ejg/VoHX4vWE/adN7XsaQQ9cY2L3yF5wYJ5dOGT3cNkArWWptHP6cwL5kqHC
	M+Ssekxh+yut2lYoQ2usgya1dvaQ3MQCugk7w/HIlL5IZPXFf6joHDVqhYI19rXXx05wwq2RBqC
	2XtLVvxcRmaJpH1eaTKy1h6A7MmGx5+b8qsFAzV2hM=
X-Received: by 2002:a05:600c:524a:b0:4a0:251f:a726 with SMTP id 5b1f17b1804b1-4a18e4a54f2mr179156715e9.24.1791799782124;
        Mon, 12 Oct 2026 03:09:42 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:41 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 08/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Mon, 12 Oct 2026 11:08:13 +0100
Message-ID: <20261012100816.331033-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.52.0

