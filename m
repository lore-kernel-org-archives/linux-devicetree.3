Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC56402B8A
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218978; cv=none; b=c6ItCNyYfpsGNsK2RZqZ8ii6WwQaJTYfsO+AWobJ5B86uasBqEokfJTJM2DfUoowxYht4PFXr4TKZIp5kcFWRzVy1UDQHNb8OLUfSpsQJRhuYerp4IVv95jgojAUbZDHsO4I+rJfnmTgoCghViQQFy8Sc4OuJ7XwWDJORTcyMMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218978; c=relaxed/simple;
	bh=GtU3BwmWr5r04fdNMr2P/dLekVQQQO6qKHal+CTJ5SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTk4aqQHr0LfOHRVw9Gd7L72Hr1+8WuGNbNI3zEZvD74oqbsGJnUF0W40Eo7/DwT2Szs+tStyvkn0L60R8E6iTTzSNr6jMGkTQgPy3UpMPsyPnuA+azqOLhVHLBXwdCf3f2YjrDDcKuceMHTOw4WQ2AT8xM+jFz+fe+K8o0U6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CM5d9LGB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CM5d9LGB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f71156e1aso931715f8f.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218962; x=1787823762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=CM5d9LGBNnoOLGIelkhbE8DCaEqrbzoXekzeZNmuovnTSzU5eKGG7fU1QrnLyQx8RF
         6awIQQ6L0ly1N7czyIKur5Q/L9Y167uNPqaUVaNHWHtf8as/t47eYRo+cgr6y45jzBn7
         PUCocDwP6bUX92vluTph7926eCdXTSeh/qApGimNuf51TnuVqJ3I07QJYQKActhQfO4T
         1+oT9B26cPpgD42k/CDymak8f2SebW8rKapUtvJOrbP08i8e/B0MvXCHdR+tSkgDiPYA
         cKMxjDJeGlEYdx/xfu93JharKI1I6lMz34qmO3JtpeJTNaxssz+yBTT0T2Sr9pQAYPI7
         Jnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218962; x=1787823762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=su+in7Ow5ic7VZ9jUd+EmA83skcsprZtjBnVznkT+TVIWMZQ5mWyLMJyxA++G6qLMa
         xuqBGHiIvB2NfNOzrAfNt9TmRgGUJDfYaR+tZfkHOPg4hAQaiWq2l26AfBV2wjNzKcb4
         +lz8z72PQtPFYNRgD6SH9GFHXKdT2YQmkuOlN4JTDREr7K/LSeim0Qo/BxZm/w5r51r1
         sswxy2lJ8tXRZQhg1ClllFl4dBx8tNXe6A4/oab0jZ5QRpG6ubpxFsTvb4GUVRul7n+n
         CdaHPaJYmgylfSm8m0OVH5vVH8eSZrxPaLiICPciiD6pZ5Dh45EhbXG4noZXf7QYk0l+
         ceqw==
X-Forwarded-Encrypted: i=1; AHgh+RobtSVX11CYrq4ZEMCMCrDZocZHS7GFX5KClAZxZIn5uT6u8HYM+JwPdPdvWbbnOiEsO4muJikq5E25@vger.kernel.org
X-Gm-Message-State: AFuF++neNWlexVv7tQCX6siYatsy0gWY0dqXYIHXEABsxxMVVtfzAOLq
	Xq116AwIUUbap4fj+5Q7F5GeNYA+Vbb6F61wxDOCE58HTn0IUcZQvImT
X-Gm-Gg: AR+sD139PF19SabilizLU3cY6bKgcbE1qrSGZhQ2n3TiTwW//PmXU34R84uq9bu+obL
	p+iIUck7wFB2lBh+IlAdQHK7AJZvo4dM8pZdwCQfR6hBOkpB3bkQKce2pUAF7BAbEAapF5AZZlK
	G5g8yG4CGeiEJ4F/VUEXoZypzitTJa8d8pHJBPLDR1EOU2eWn2bN9/l+FAx48mI2uL5guMvwHL5
	RdUG/MMr2YXUSn3l6Oo2TB0XRX3FAJHJnfyExiS0j79uGSD1zkpG09cC0JPSmo1spa1UXaezxph
	Z4UBWrRgqoPZBJLp1UCLXOwVdOqL2j61vToZipss2fC/IsV61fQjNC6zyy6+DoSiwLAVf9VrBOb
	Ma0Nu4vr7j0BeSsw+zptT64//UwEFlsvOxmqvCJUr+kfL0wyESNJNLztCiMJOKGu7uXFMKc092S
	zBQPxfIPQ1HtNnXWz9vC55aKyX6NRa9qD0Txu63zB3DctBSu6smk5KqwZ51z8LPN3e/MnZ/MhWI
	w7YXs9V/CYlD2KmM2ZyQXIk7dgX/QQO8Zo=
X-Received: by 2002:a05:6000:4610:b0:481:5276:e4e3 with SMTP id ffacd0b85a97d-482b1fe2fc1mr21405564f8f.19.1787218962119;
        Thu, 20 Aug 2026 02:42:42 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm11788090f8f.6.2026.08.20.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:42:41 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Thu, 20 Aug 2026 11:42:25 +0200
Subject: [PATCH v2 2/7] dt-bindings: arm: qcom: Document Motorola Moto One
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-next-patches-v2-2-7130d68183d9@gmail.com>
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
In-Reply-To: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for Motorola Moto One(deen) based on Snapdragon 625 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..289a3de1d24b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -292,6 +292,7 @@ properties:
       - items:
           - enum:
               - flipkart,rimob
+              - motorola,deen
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido

-- 
2.55.0

