Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB4D414DEE
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158628; cv=none; b=AGCP/TcFGRL+uYksDhpSU1XhIbu4Dy1WSMRKJsq5PmoGNGHWmch/o6knlFJPZqICiGci4ibwMYJw/lqz3H6tNqC6fwvWLFb/Hwke6L39mHsYA4KXm8DgWnp+pOJ0ITp6vUKQ470PzBP8oNb4rxiNppIE2Iq5VSJikLpkc8PaFWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158628; c=relaxed/simple;
	bh=safVrVPbQKLrg2veq/edFMGfd2XqNn19RiZeXHcKIrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6lJ/yTQDXMvkFy2a7CiCs1DPo+nkCpGUGJ0bZ6xXpHrDjGteKP7dTmeFgXaR/ZlbmYraT1mYcM5JajzGz5IJHQ16BJxuFC+m0hrTcPdV4Jdj7csBjsl0qzNV/l59KEN/gJ9xRrHs7fso6aBcCKJc2760Sgm6CTIN8FgDswGjgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tBcsItL+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tBcsItL+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso20129045e9.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785158624; x=1785763424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KbIu2gZIapFLsXF2JAM5/C4wzKnu+IiYoG89ZkGUQTk=;
        b=tBcsItL+yQp9qt6xpOgUHL21xKjts7UiGTmnNeAEffp7nrIZ+xgAZfPU2Bjq+pExC7
         ZlFQSRtdJK4Cl1/ZxDLdLR5OQ4DGqXod2Bxb0tv4n0TQIUuPINGBwn2eRuDpUFsptXgM
         Iw73/seMIVxe+BB0bNipjm65cH1m/lR6jb/hliC7T31+8WxduEmqgh8BGuIaRK783F09
         0l3AMojt7xgH9v6PWcsTURVWzSd1h6DicWFo8lYU9GCrx7MrKr2T1axPZHUZHbCh+fZR
         F+tMdXZCD6L/bxtFqONm3t3ZFBBOEjxZO+oCufzPVAQBedcs7oacva1D2jcmdIHhQXVf
         757A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785158624; x=1785763424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbIu2gZIapFLsXF2JAM5/C4wzKnu+IiYoG89ZkGUQTk=;
        b=p9tEtvjcA+GqecEIbgIebHBfjvYbK+qmTQ9uVS3NnfYpKfXMDGCc0ih3p1dISEznJx
         9yj6eXW5tHGyMsHAbdQ62eDIA/X21/AGNFeSW+1XhyV9fquAHUwe9rQegzWT8CCy8H8n
         aGPi5Sj2ojmV56wkgWr73SzRWH34eL3ddEjhAdiGpwdCh2cWFb3+BQ88tZ9vgO3fCmgd
         1DfYdZ1dCtWQBGGxRERqm25+TNUPOgzP3edsRxy1jUrt2B6xepNPEEWfxraqjSSf6mAp
         Oga3DgajMtuCXMq0RKhWpb/LD0OtOzsW8mYXOLlBXS0OQ+d6Xs6Yal61kVin3El1v5JO
         CfQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqh7EzpOwiof4DX1lskn6GSWgq8kyg0qCbGlv/oct9M3GnsblVFFj6AOHarDy1P2Q3lFxLLFRzFo5ME@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5MYhZ0WIqb5da7wuKkJj0HRGZbehU+XZ0EJG/7y7QWDdwnZa
	jPmjNPuAEinSebOPlCSny+rOjIBkQEyHji20IOQMBNWS0FOExRYcIjcS0JOIqKUIqdw=
X-Gm-Gg: AR+sD12Jaajw9MhELkPuIfdiE4a/LpfTpOD2g63T8iahSFIwk5Q8OfBzT4eq5BlFlQ1
	ilmA5vRRaLq0Ucpg4xTdqcWaf31RkL6O5X8GPoD4Mg4qkAmJHQbDEl1RlbC1rn0YUYWJwsmralS
	/u4qb8wtB4O1yu/0XEDA8aOKqrwsG8iJrN7NCUqmk0Z31ZdT+eVPATozG4vKkwoAdGwkylsEDxv
	j4/SOIn354Db9d6g9hdz5p4gZ9TACf3Ewxy46AWOvQrb0MhssX3EAAJAdBQqRvw+GwxZPZUJYwQ
	4d3hWkgUZCABDOs69x0n8JB1RpLhkB6kP+igIO8qGGkYcnBvSRzHp/6XZ2jr1W0ygconAj+yfsK
	ihQmDfNcBZjGb79CJjKARRE9WkKWTtuIRFUTuaqf9yTVG/VBHo9oYN83lKgDABwP6mScRdh1yXk
	Wg128SDEurs57RCRTLUFzM8BRS24ZbR85HGmm3fTrwJmQqg1p7lx1b+azJw4xTq9cUsQ==
X-Received: by 2002:a05:600c:4ed0:b0:493:f6f0:d66b with SMTP id 5b1f17b1804b1-496b56e6f19mr106760005e9.1.1785158624502;
        Mon, 27 Jul 2026 06:23:44 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm224730055e9.6.2026.07.27.06.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:23:44 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 27 Jul 2026 14:23:26 +0100
Subject: [PATCH v3 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
for ACPM communication on Samsung-based SoCs.

The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc6831947..b9c4d4f3199b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -43,6 +43,7 @@ properties:
         - qcom,rpm-msg-ram
         - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
+        - samsung,exynos850-acpm-sram
 
   reg:
     maxItems: 1
@@ -159,6 +160,7 @@ if:
           enum:
             - qcom,rpm-msg-ram
             - rockchip,rk3288-pmu-sram
+            - samsung,exynos850-acpm-sram
 then:
   required:
     - "#address-cells"

-- 
2.51.0

