Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5940F3E3C76
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628180; cv=none; b=ELavEJsWb/Rr+bqUWCawCnS4JEifbdXAYnY/6ZiXBXiu1ePW3331ABvBAXhZ3c47f/pPI5EMBRbOsivTfUS/liPj5MGqYhXoPihOn/UZ51mtyBe6f8qm8fMQJEtzdb8ON8WJJyZakLd1aT59uRymvwheNaaMNQwbH51cFXVj3pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628180; c=relaxed/simple;
	bh=Z2XgFOuSe6nXicDn76xwkYeEVl4JseJ5RFl+2NV5sf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KV2Akjc058kAGN80YHX2rG8iNMNeJPWpPGQOEF2EFl2B/jQ1c5H9pCvnmO76Ouy2AZZEGeLF0eG6l3OMBjbsfKUKzRH2XgefoD/Xi6pnTHDtWJmM/o96GIcmJXKDi7E/pdmSmDLNV97B5StQw/aT62IxAzAyOaPmNKpMtUbwMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlmkkP/j; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlmkkP/j"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495590ba856so19750575e9.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628177; x=1785232977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJYiS34CQ51FOLak9/lGd3NwJDvhA6ajR0EHYyZG81w=;
        b=AlmkkP/jxLFnagSyz22Nw3ncApVwkd0ejEYyVyaIBGfcJMt0Ls4CNOWQ4lEFRwZEUu
         pqkVoe8v4EzWlLXyA1EoCM7MJWOiD02v2bHlyONrMNftWiPiaky4xJElhoBqNRqj6yCy
         qAGxzzqrceCwGcfJfSHp4i1/1k+KQ/IhuwLJII8n2lbTvvsYNmWlp21Ij/jnHN1FFvdQ
         r943xVx9Uc7W1bPCFF/j+AbWppozjDZJTOQdRaJjxW7e4g3ieUMQUv8IuNouajun1DEC
         KmvnW4cZRAJSFncqfqIs94Wdzw2MPhA3thEXfkN3y7K0FFy2Oovf4Gid6s3XxHTQmvw8
         YlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628177; x=1785232977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJYiS34CQ51FOLak9/lGd3NwJDvhA6ajR0EHYyZG81w=;
        b=icdXIb/DyPVkYXKpdncpuOMGp+y7rjxn/D8V6KO6O+ncGuTQH9Yv5SUBR7JhtIOXoz
         xf/QR9ER1tSvj0ftX3HfYvQRAkDFSAyAhBVzhqng27cckdUJaPQNKT929xUBuGyHMic+
         qaMcij6S1L8arbDFZicdMbKb/LMRJRTESzqU+AzkHxVXNhlCeoXXiN65nj60HHCqvRcf
         JTPoXdBvnFeL6K4bOFe2QX/X9RFNArxz4YpG4+bEB0jl2wVUPZZu0q3S7mlr0WjeTW43
         7Op08LUWyYaejAiGMfa4vqv7tRWw8E9QzXyDGTNHBjF8ZYfVBVKSAAxSWL6qe+feU5Bd
         d27w==
X-Gm-Message-State: AOJu0YyiVQ2tZcN3Ffl++Q/4JbVWVtP1hoQ2vkFYlF2fgo1B8jzlor5p
	F6RHcgiU0ztPi327clrEFjkSmJgX5DrL73mc0w3FZ59rqUTP1M3nn42L
X-Gm-Gg: AfdE7cnIq3wWhkR4VBxfHVG/6rsVoh6quCaKgZP7PWsNWcZ1eFNBU36NKYGSw1IEOzQ
	4/8t1aEb+SwD26JrkWeEGY4BV1QZQNR6czbtlFLVpNwCC+WgkG0vfvn8pQGaEWPewfVHG9ncILJ
	ZaOKluSSoD3GSyACbBohsTK6Y3EfEgHnfWIg9R97HMOoJeVwuwBNm56R9MfdPGADO+Ox5q/fFpj
	XreSZNx7uHPYlhcfOX+4F1sAhbLgdft1rt43dDj/U8NFgiT7qcinwhF7CSgKnDjsrkAwtQ7Jk0a
	XReI5igS90glrmfcnqRGCt9LZIsFHVXFCKU7iHUE8vl2/dYfBad3h/u9GVlJ8AxY/9OCEesYLxa
	fHfqeE8iCAKYHvzDQyWVxhsQwCtdV2UbeLv+6JcSdLhcGw4gkMNAbSEXWT3SJTy2CpnHxVJAhCy
	k7OEazlDIK6BEeCom3NmyjoQY=
X-Received: by 2002:a05:600c:3115:b0:495:6936:120e with SMTP id 5b1f17b1804b1-495693612a7mr2560195e9.39.1784628177415;
        Tue, 21 Jul 2026 03:02:57 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7c69sm39976860f8f.17.2026.07.21.03.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:02:56 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2 RESEND] dt-bindings: arm: tegra: Add Motorola Artix 4G and Droid X2
Date: Tue, 21 Jul 2026 13:02:44 +0300
Message-ID: <20260721100245.444623-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721100245.444623-1-clamor95@gmail.com>
References: <20260721100245.444623-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Motorola Artix 4G and Droid X2.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 033a63f6c0687..ca311262ca323 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -46,6 +46,12 @@ properties:
       - items:
           - const: acer,picasso
           - const: nvidia,tegra20
+      - description: Motorola Mot based Device family
+        items:
+          - enum:
+              - motorola,daytona
+              - motorola,olympus
+          - const: nvidia,tegra20
       - items:
           - enum:
               - nvidia,beaver
-- 
2.53.0

