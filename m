Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC89D332EDE
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211325; cv=none; b=ZiFuic3rme6UlXByBSxNxw/R1hvrQDF+0pK9Pzee6sihFcCZghdjcmELu4NAD317JD01vQNmjc+hug37bWgamuQEK+dhvCJepT3GKbUQ3s9u9nX53DF75+AJHBdPC53U50a3EwKCGEc1d/QCZd/igq6TzOj1Joi9MZIUyyhZiqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211325; c=relaxed/simple;
	bh=M8pM+GPIuGPy5U0CrCsD+rzuXxctkeEQCRG4ScSiarg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=FRc4dga78r9XVMdGHM3DiqjjnxWBzy8UocUEwp9l7FqnF3lZ651DIe/zXEyaqDIEz3QKY/YIdrEF6h6tLm7Mi8C7DmR8mLZVYGkA8LtiauBhavDWBk9Bbm0OpuEuTQ9ykA6njuBu96CsDgYt6Z0OGqOqvuQ9wJv6qD7mlZW2CH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvEtw4Fa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvEtw4Fa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b23fcf90b2so16483545ad.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 03:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211322; x=1775816122; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=efhMbwARh0s/fyMoKyosJ1VtXtEFuu3Fxddl0+j9z2o=;
        b=HvEtw4FatUNGC2JFLGoYV5Jbawk39OMJIMc677D+jwLaPQ+tVC5H4Cgf0c5fUgip8R
         qjclDIdEAgiNvASSdEQXJIQItfUPAzLr9576GJiAL0C2upqVCuSeD7IE7jkl0YoYmvvp
         QNX8tSzw8pNkSJURPO8U7n9vfxFBgmgg8pKVjz3CS4dTramS6cegfLei+clr58XYSom2
         1ZnI83m1WDmjqiAXgkPAXSGHOGSiAnEjCrjtbWrTUxuuH8IwmoJ7OvXpfHYPlgPQFNrk
         yGS388D0hfB9M2JRz+hnudzf0XKSXRwW6e9/rDG7rZ43xjpduLAfsSnv8Drnnaw7hvSt
         bhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211322; x=1775816122;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efhMbwARh0s/fyMoKyosJ1VtXtEFuu3Fxddl0+j9z2o=;
        b=QMxm1LILPiC5Ujw3IfuykACV6Evnq/WM4rT7vrwusGk+nv3HJYHYELnLcJ3s9Mbf0O
         OUcJHVYC4dPr67vcIjB78ddRNjvZeP6EHR0Ab5yt4T5svfyL/7krfFCIeW2/8Vgc/0qY
         7TEM7KVNlIDHZw4Kbybx1KDITdJdZAHnh9FX7yUcmHQgRUfzVnMWHhGhR8UZY5QzaNvY
         EicqLE2J7pDbzEAqt87gyxSFvCaLO2zPflKfinbnf4fjc4ij8Ss03f79UHR2iKi8ZbwW
         LKJsPlNe7jNic0GLl8gtACuItZebBVWSNz63dr2JICV+qVgcd292PNcIohxjRg0UzwhG
         yX/w==
X-Forwarded-Encrypted: i=1; AJvYcCVWQgzb1lLYOljZfZVA1kSPSk8K3RVR93xAWENcvEcu62KDHwLxDXFKsB56TnVNYW07IBaaFekgMcyj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4wnjur3noWjvu8TqZheKEsEmPBH4stKwcq8b7YFi2Tt2Xzw+d
	cIK57ZL1lfIjzZuxNuiSPP0kCdVUHKWTxzgQOQz0ooOEGTf9JV3aso8n
X-Gm-Gg: AeBDieu5XI7QI0MYSQPPPN65y8Piu5x5obuqh/CecfpbFdq3gmDi3ohsU4Ef6gN6JQh
	4IgVGTHWA80xOlSKIpX7HcZOwK+HP/LonVaB0PBbMoi0/3appX4pffLVrzHwikZrSnSwzhQdAIG
	wFCEsC6vHb8eCezep0LGc9Tem+5PjfDd3t93irZBy2gftn2M7d8jn++K5l/M9CO3VQkea0EQHS0
	9IcGgzw2FkfCJD6FjQmrcDQvtRUg5m6myJRgJEpH11lAXFpWWODkfjoflmLRdi4Y5VOpvkGqorW
	l/Z60lt6m2xUxGaHvuip7kdggK/s/atdsj+NC+7LfNerIGsjvxSPvSQMOwBi8lUxvLZp2mMICsj
	qbSSwNR4mMtElVTyTpxHfHhD6ST5j6oO+lmYW8OYvXzmEpabkeCm3ET8NCPnW5gwMuaVHvSKIJU
	zPB+Cujq6yRqq0B0bAqyrnYvlccS6a1QP4y2gaqDY0VERFL+oxBV9g
X-Received: by 2002:a17:902:ebc4:b0:2b2:4697:78fa with SMTP id d9443c01a7336-2b28188a80cmr26284235ad.44.1775211320378;
        Fri, 03 Apr 2026 03:15:20 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747341a8sm54383675ad.3.2026.04.03.03.15.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:15:20 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add GXCAS Technology
Date: Fri,  3 Apr 2026 18:14:54 +0800
Message-Id: <1775211296-63722-2-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
The prefix was confirmed from the manufacturer's website:
https://www.gxcas.com/en/index.html

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..354836eb8e72 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -676,6 +676,8 @@ patternProperties:
     description: Gateworks Corporation
                  use "gateworks" vendor prefix
     deprecated: true
+  "^gxcas,.*":
+    description: Beijing Galaxy-CAS Technology Co., Ltd.
   "^hannstar,.*":
     description: HannStar Display Corporation
   "^haochuangyi,.*":
-- 
2.34.1

