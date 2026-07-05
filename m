Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CAC1C84DC
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 10:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247618; cv=none; b=ShUQ9B9QGk5eO3T75eBp52qPLeWTLti55R3Si+hrQUPxQGoieq9P6bljW5cOopeCEo1Eh4iJTavf5ULdtv+LUzkvpveR6RXBB8q11bR4NSs41NwHAu4NHrrEUewauuRFupwV8SCWamvNikc9lrW9WktAZVUA+fzK6PgmMvdESec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247618; c=relaxed/simple;
	bh=IH2rmdFf68e8sbNHOLcOM1yfWLZ8oytcgcEHqnHEMxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdeKOaMSg+CVDPhVakR3eUhhFq4M5AYA743XlHn+A0MXWHOcSHeVchsdXIDXwYGtBqw9KtaAJ1ylC8hSkTCEStyLMDaGwiA9E3VulWeAD2UiiwW1UHdvHlpOGXf6fr7MajPU6PTF62jvcaUKcWtzvgPctaBfalFA/3wczR2Yq2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pv9fKxqR; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pv9fKxqR"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-80c8c9ae040so20399537b3.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783247615; x=1783852415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dB/6fGjmkTqxYckhOj0WVrDKQ6UfwK7gmAtGLmYXX4o=;
        b=Pv9fKxqRb1Kl5fU8y1gnXIgL6uVEe4I+gAxOxw3+nqxKVyjSpVzJxR6GpItRJFbhpZ
         7nl0nVwQwZvDLJzzXQ+RafVfRiQ9cVNUPvsax4NaBjt6rcAEIXlnkNpoaD32mW2TEDd4
         ajafBMTW5hSdRAq7Ls2QGSsouG2/Tfs+qiKh8L7iP9H0Q8XyfDZ4vTGzIy0tslvXrHyH
         bsRTE53LvxTybQiqZFOvVkFqqSiinpt45czwKsrZtmiVeGIXinLB2YttRVTCuYRs6Mkr
         +D/6jBqVDsdfIUVplD7mX2Broowlwvh/sdVHP9BP4GaWRsDMakCg0EprNTv99Cfz//ha
         UaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247615; x=1783852415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dB/6fGjmkTqxYckhOj0WVrDKQ6UfwK7gmAtGLmYXX4o=;
        b=O9F6PBg9gyf5uOq+tSy6lQRLuDwyvmtxROwI6ZIBZhZ00Q0/BfYPs71wqgtQtlU1nH
         GndZUtznlDZU5Tn3DeJkVpADe/y0oig+45iCQ2YfsCPJM6lsJlEXn5rVIcaxc8iwfGza
         j2YTsNkx2IKzo734B5mvfXOholBgVqZrkbMS0OZTXz0Uf5Tb9waIN19fspaI0LB60eHG
         p/W20cn20af1L0wD7b33p7vZpWKGkRXhdyRuEZWsSY5d5dMV7CGOI/nIpJPkCvz0A0Ta
         KlMHFIJPYpDYQ6qsUfw5poWOvl0Iv8nRCpLPJLgdlkEdBKXny41CTxOlnZe2PB3DM8Rp
         df6A==
X-Forwarded-Encrypted: i=1; AHgh+Rqzyp1jeQ5ceAIyI2K1qkE5JdGF9wTL/W4DKfi1LJSTWc34bb1EgUu2vjdiNgrSiaPwrc7BnKEwu11r@vger.kernel.org
X-Gm-Message-State: AOJu0YzMufGnWMg/rI6kwBMz0WCGDJcufYB3TqrK05nxAC2sHguzXO1c
	RH2lVtOHS8Ej3L7PKk8IhFWK8Gj68YLC+XKC2hxgSQLa0LKK1W4tx/R/
X-Gm-Gg: AfdE7ckdqAnOHnre5zQnpz+FAYmllNrr8TiRxB7Wtpo6S5EGz2Jd9+RzKcNz5r8/x+F
	3Ruk8jTYxOtXouNuFpyQG/r+2W9LZK/WpAB1ZxvnjBAPfq+51P45jgYeO/laWETsPiLJdfuLgSF
	28AGolqo4qX0zJ3Swuw+FB6gCOkj+zi+8iptAcYOUI1nOMNnLdHAaLedzhROGzmrRbNF+e/SZ1D
	YpcTKNFje1pCiw4C8tSJXaahu1tLOWKnkKNG8m2WrPlaMrWG8Rl5g8C6X861ORLOyzgNV+EJuqr
	vM++JykbfMcWCZK9XbgWTXXBYhvtkQM+v/Dh5n6J72JYD5n6VCVtuFWDfMN5S1Ie6S3czoqlQzw
	gTq1/5g5H32NKVsYMDGupSwtEeTlJcmO9ePCjBm+VgSx77Ffc35gmPE0aNQcF4x8sTCCZRd9ppC
	ecuKZtIHASIguXpRhqj/L9X8xTJDSO
X-Received: by 2002:a05:690c:c4e7:b0:80a:9f1a:d48b with SMTP id 00721157ae682-81739bf2ec9mr69908907b3.54.1783247615583;
        Sun, 05 Jul 2026 03:33:35 -0700 (PDT)
Received: from crusty-box.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144ba2665dsm44421007b3.41.2026.07.05.03.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:33:34 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 05 Jul 2026 13:30:27 +0300
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Samsung Galaxy
 A52/A72
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-sm7125-samsung-v2-1-d3b17005ecb3@gmail.com>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
In-Reply-To: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatibles for Samsung Galaxy A52 and A72.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9df4074bb582..45f35141bd30 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1036,6 +1036,8 @@ properties:
 
       - items:
           - enum:
+              - samsung,a52q
+              - samsung,a72q
               - xiaomi,curtana
               - xiaomi,joyeuse
           - const: qcom,sm7125

-- 
2.55.0

