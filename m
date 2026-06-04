Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF93D0927
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 20:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604377; cv=none; b=LRB2uYedznFkoUYKHI+PmdWLFa4PwXLzLshknmtmdm9yvQV0FltJh2r3NDFqAs2hvYfukP7M8q9o19T8uYaZEOThHLJ1hdwDuyAfudF5aLhsHELJKNCtckP8rTbmlkF26SPWQYOjdfzMJlrNvF1ncVmkuavBARmxUlvGMvn3aSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604377; c=relaxed/simple;
	bh=yWzPcHOx9Y0l0sp44ZHSshHjrd7t8NWvm/wcwRs+4y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SM9L+LCXPHHU2ub+mdSYg+2BeewQp1tWKMEC5ktf1IE5Ma9EuY1yD6D4Bsqkk1+VOWkwlDg/IwH22CcFzX9F/wMnoKNnkshyi3n66SKQ/67ahOKT3rbPx0u79M+Ul5SMrz7z6GFCFTjcgxyd7jALm68gtr9fYKYHo5lBMhjV3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlG4kX3H; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlG4kX3H"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso10294075e9.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 13:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780604375; x=1781209175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=QlG4kX3HDQtzP6R87peAQ21KOr993NxCKGVCpGVHz/k/W+cjj9OU6xyybsL8jdgd/f
         ZC8ooygv2/aHWQ3A1o+i4Dqgb6WJGQUbboSV6NQU5YvoPdYMPxDnw9e659GuxuW8vgXD
         ioiMvivzpl9AUVE3sBnejtnBkQXqgg/v92mT18uZX1hTKJwBM6FkUySfMv/gjdzhHFeQ
         LrrjVK3oz6bfjASBKVy7M3fl+3CtJISOT9MUHAYS2VDDy/dHjDnTHjIWLNoVDeVljYU6
         /1U02SAM1eT8USoScBbVddnb/EufZ6LvVTjBi/W6XjU81cfZRd5SlpGc0eeDIjJ4XfqD
         841A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604375; x=1781209175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=ZbTubU6uoaMf64LmVZ0Shc6Y7zdL98gj8VVj1LZ9sGfTP3FjFAOdbBVzB9gSVeVkeS
         2oY7SxxAy1wyJESHT+RbbmeXZpbydEuit5zh3g0Fw+e8OkhqrVnoGeEgEM4U8Dp1fHXQ
         K/8i0Bau5t2kHEj3xQp/B/6MdzuHm7dPnPIUmaydipEEF11ilAgFY09xFaiOK3EFP0yd
         wBBZA48OaxGs6Tn8nfMFJ5rF9oZQKHxghj/yNmc9B0oXevnMM27vuqTKufzYw75XavfG
         N7FzgoJtrwfjMNVWky5gxJddAGL6YC2XMbI0RZD1ajp7e+GavC3VvFV61tKERLdsoS82
         eGGQ==
X-Forwarded-Encrypted: i=1; AFNElJ85QZ/3rnv9ZrJmVtfeMarC133aawBHZL8gGPxd4tvJw9FY9mu28236wF1YxwSzubhAiG32qK7sKmJb@vger.kernel.org
X-Gm-Message-State: AOJu0YxSqLoNvl1h+4A78aWbZls8kwihyI86yYWLXJr2LL3LRr0pmUmf
	HCC/MJRbPH4mmKXYBZzysHcg1l8ZdtbucyhYY5OGTna/SZiIFbc9NAIo
X-Gm-Gg: Acq92OFb5CZH1l1191fvYQgcUfYd4VG+wn3QI+ZbIJ6YkNM6CdO9g6luD9piB6VabI5
	rkBveTTQuwH7tLyUrF1bwkN+FKkcG/RB5cHBOjNXdS+LZE1y80heTor+JT1duLiASfBgMj9dQoy
	c731o7WAdU6YFsBZVO6C+vguVitdgWGlya5gAkjJj6QsO7//VOZvldwUnfjNLC5B7V/bFlx+u3m
	WfwoRhhbI7q4zc9BGm1YDZsaLDiPhCgAs8R9iNllGB7cYaYxsD7e943PP3Lxt3JAIoGd1ji9bJc
	B9zfrAmB3jgu1tmQGvxiJ593oPMnb5rP1Enf2UgxftgIsv3r/mEiGaThtrBSF3bGS7YWfXovali
	+D9RKksVZZjfVt1R32eB1SxbS0H6pE2qyUI2d/XdyZZHULJUuI/qt5ix9TADRLJ2nGsrhQqePVq
	I47CXv2Ipm0ZsIMj5p7896iDd2MS+0JBwszRgUGA==
X-Received: by 2002:a05:600c:1c1f:b0:490:b724:dbd6 with SMTP id 5b1f17b1804b1-490c2598382mr2038805e9.6.1780604374641;
        Thu, 04 Jun 2026 13:19:34 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:43ff:9a39:ef13:72e0:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm18999748f8f.18.2026.06.04.13.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:19:34 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 04 Jun 2026 23:19:27 +0300
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-yukon-eagle-v3-1-9e3b57d306a8@gmail.com>
References: <20260604-yukon-eagle-v3-0-9e3b57d306a8@gmail.com>
In-Reply-To: <20260604-yukon-eagle-v3-0-9e3b57d306a8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Document the Sony Xperia M2, which is a smartphone based on the
Qualcomm MSM8926 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..851d1b4d74eb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -99,6 +99,7 @@ properties:
               - microsoft,tesla
               - motorola,peregrine
               - samsung,matisselte
+              - sony,eagle
           - const: qcom,msm8926
           - const: qcom,msm8226
 

-- 
2.54.0

