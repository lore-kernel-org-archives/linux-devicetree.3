Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B0D318EF4
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897118; cv=none; b=oFfcxW67LPNMTywZfPHXAyomW0TBSEYfstbgoB162WJ2wKF1fFjpcfC7kLXqkfR6V9s9KvaEAnM8rlMdoBmpwnY5tRDyXE5R4aMgiHDKDNmLRAcGVECqMWJzBxXbULeUurrbq+Lyk9UCLOt4UkeXAPfAQZJO4UGjKpeaXcjYx4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897118; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGl8CIiKS9pLJ9UF/zF1I3YXNssNBkIOzrbmRiQXAMhKe8HRPoMReoBrmG8w+fmpt+N1vt8YMn73V42pG6RlKMBsHewPtZvKg05BnDLTM575Ju5TGpoWaDuf9+lxo80regsx/nGl0jEmekX21Zw0q7UQEYfCFteQ5KzB3847y8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdDyGu5L; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdDyGu5L"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d53197d8b5so18895695ad.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897116; x=1787501916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=IdDyGu5LrqX4Qjs8Q5CZQy4P438w9v6NWGmo8xleWI2u3LV4GF6wuIFxj+z601CRYc
         vJo2kFv3GxgyimiFXZ2G3a0tmGRhOhFKx+v1XjTasTHIYluZcMnC2Gb9+sNBwY+DyMyH
         o6Iggnp5KoWutVCZ3XhtF7tp7BcmA9IjnMzJkSnNI8Abd2StrgKLVClfyqt5SHoMCS5E
         9P8sZzhJDrgqAkzKKoujPKnl7M6Lw97eGBiodrcFx70C4SCwZtad5D/LxHEC0TkODnd3
         is9SQPUNx/oJhhJUPeTAQ1UyO1cFKYDbWa/WJQLkuifArkOFCCi+K6xXwAChlOTNPOu/
         Yw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897116; x=1787501916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=KTUCEP1EhcI0Jg6qA5fYkyfyYp8j3TmgyXhDupuiGP4+x0/BteWUG08i4hwKlm/+Lg
         jEdNPzvp+vB3UMueUzouw1reu/y1zYLyg/PQufyj0g6OFcxFc2gFhDN8Z5oRyitoYDh2
         yB3o5BreKOhL7UkrwsndlNwcbFlqJ5ytIrNPF+pk+TaN/U0ffGtUAX8gjH8mS0ULqzu7
         AZKiOsshQRfve8OqONIsIqa+JWjX051X9HjRinhGg0NtEIbDdLtG+sKBJs/0ic6ypF+z
         dDVTQSIYIrzc6P7U9+Wh+TF2hotufbixCBK/YPcj6zJ8ZgZib+rr4O6a7e4DHIiO2gAB
         wcqw==
X-Forwarded-Encrypted: i=1; AHgh+RqOCh+VfzA9lR9ES4/pRjxZNvPNP8v4yP14MP8nhna9smuG0iQA2WpuTmXwFgiOWuzpcP3Xoiq/gIct@vger.kernel.org
X-Gm-Message-State: AOJu0YwBS9flILyUyil7u6mBbbgNpAFnmUmyy78uVC2cLshvvMQhVPfI
	d12Z5dUPCG0fKNvQxE7YxMxaiZ4hH3uK/k0zpErBk4v2U+cHM7paQCWJ
X-Gm-Gg: AR+sD12YHqIhzeNVuHlcYokH8i//lm1HB4sjSab6/IFCUmBUO2+I1HfGFcAgByJXczt
	bSRiOV5hQd19PpCFBwXE/1H+jrSjE7dOLAxbstjriEeEeo4JOyxri+J1QvBWZWaVMSk7qClUGxJ
	g2cbZgI3jmpaisO+lQi5hY1hsTAdxzPqzU6SDvJbAiiCkCRrhC5hJ+eaw4XAR9b8Z3fUg+Ysjpy
	AEDX7wkCUdf1umjX7XJ6kV9Uxs0EPc5lGE2rPRibGIye59ZMUCP1GpnrSEHabL4uLaoVXjvXNbY
	YBV37u+I8/ZGr9UmyR/UupHLGCmlT9+ReI699GLFIfAcRcgFJQElB9RBepm/qvERM1rGjdw5tRc
	ie+X2GEs5L6zhnA82h8EFAnANN7vcFxokGwfBUzgoWWRdCTiWExGUD4sdrBXCduu2A7II+CQnJ5
	mbPjm5pbN2QHnI/8WCqsTx/JvChj28KsZtAbLcbAmGgitnvPfnRZH3tZudkDT55OXAKIHEFTPkl
	bSTgDWhTcWr
X-Received: by 2002:a05:6a21:150c:b0:3c3:791e:5e18 with SMTP id adf61e73a8af0-3cc71ac3791mr21187630637.7.1786897116158;
        Sun, 16 Aug 2026 09:18:36 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm28969988eec.3.2026.08.16.09.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:18:35 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 2/5] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Sun, 16 Aug 2026 16:18:05 +0000
Message-ID: <20260816161808.12419-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816161808.12419-1-sreeshankar0910@gmail.com>
References: <20260816161808.12419-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

