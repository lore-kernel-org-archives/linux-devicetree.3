Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377CE2E738B
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251805; cv=none; b=AMyMNgohaiFxb8NZMy40OPEwgWuHYUroGZ4tm5q3nugJYCshATcGXVJBHdkglVijHK7Ai7V+zfiYM4Y+GzgGlzUPTuwKo1X+Wlyvb05N4Uv2BLtGS8x/r2rXYrRXHLVSkePwlEtwx2TWtfRp+snDjctF6cBvihUH0gT4FCSIw/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251805; c=relaxed/simple;
	bh=2KJouo00OcymNmVXj4PDqY4BNM7eGTi4cPOPAuuvBQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgCBN6UyYFUfemowjrga/W4oYE2+QtVoLRzkf106n4XjFO7X8gfsvCEj5eEs5ZrlO7o4ST/Z+i+pNLxCSUS8ox4+oqgaaHRxMMBnGtxYqFByVbW/l5ifwLksVKnzU3q9Zxs2jRMOf130WN1d0i8I/h6j7l6G/T1R8VuGtu4FtDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oWOj6Pnc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWOj6Pnc"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so2164890f8f.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251802; x=1785856602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=oWOj6PncjQ+VUKNQbOxcOmp19pKLzqkoQZDm/M8cN4rvGHx1RaOOuzPM6Bl0BrhJUH
         emoBsfNstglqSHsre/JpIuHWxpr5Uq6GBEDmC9BjMZib2zwuTTMhJ2b3/MSsLGnFV0hA
         fDemDUgjph36GrTr5PRUK4bkHG5c5NLrAyRrO+qyUEUK0nKWytLIgtRx5ohwqWVr1nox
         gcVpFECc1Z9CZM1ajFsgQXehcgd7DE57azNk2Qu+IIb5WW/0VDdKBok657bDmlDByROz
         EF40814zX5YxMN71nx5ECg6UPrz29XzbhVHyJqEeK867v4D4XLCMSmLsxbMMJHm0y8YL
         NQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251802; x=1785856602;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=OwG7nLFq1QyQ9OjGCsTxJo0J+0c2ZHYcJmRTyEB14u8uaXgk9k6RCfgZQGDNZq2/Qr
         K1HRHcbVMI1kUQttUZkBU8A1iMVUiwHZ0hynr4prRRnEwNAC9hM5fa0ZeCfCLTSNauaD
         /EJtEb8Cbrgqzo6lc+9fYzlj8A9XqS1dbwLn2YqiNwWaAt6lGixfFmbwGjdYIkMOXmv9
         pk1ubL9DsHfK/t4Yg05+uMDOMs0nPXydi1OE7rRl5wHy0BsWZv/atES76Da/V+7Ovqld
         S0yWZXXy2crmWPI6OAYyPfm+7boEO0QNkCTxnUoOXM2gqE1FsAiDnZm2UMLnFWtgnYd9
         gtMw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8h1I36FDFkZO5cgHK+BTTiRftPPqBlXRya6JB69VtcnAx4QifdVMKmRowgHn51K0QTOc2VoJPiqRl@vger.kernel.org
X-Gm-Message-State: AOJu0YyQlTGXAXsVn1GfwiSzDG7dZ+BeCH3a2TguF8j3Ul5mLDk6KyCV
	EzPrKVlUx8gO9V35JMpkppAd5OwRUC9Yf3pCjJs25I7ZfoWuo8nxQn8B
X-Gm-Gg: AR+sD12zBE4f2BtAWl+DJyaLyuQuvW7sbG2R8tjX8v2gGj+DOC55tGZOGGGXjYoZw4b
	Acwh25E6WrmMkfTG7v0nee5IBGhdibVhtjeMAm+kPjwy0t19swUwzmKo+9DXzP5kcN4JBFUPzsS
	H3f40cmV4R5zltVg1s/tXuOI55YxzsH1tSGvaiGcx5djl+BOc+bTLArvxTNJHIgH08vXpN4xQtl
	WQoFc16NnPu3cp/8SbQ3KXl98MXuKRZUw/blyz3V+/9Liwx9xMvluoaF2FA+CrDRCltxeLJqSfr
	5kaNlAyyDglZOCkMzdEtgxIvpXFed8jj7u5DHdRutfQoz0l7VIrJUxvS5GA527prioNo/k2t+wa
	VMpgHTeemFQpBxz3ZJ7PAbkrovImYQ5s6QFS8EP//o/kgXDQFgqMOz1fuhe/trPvaQPOq+YSbZ5
	pQE8cTptv3CCSMGpvntULv3Xa7fYMRmErUUDI=
X-Received: by 2002:a05:6000:40cb:b0:47f:7261:3a5c with SMTP id ffacd0b85a97d-47fb1f30e92mr3467694f8f.56.1785251802293;
        Tue, 28 Jul 2026 08:16:42 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:41 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Tue, 28 Jul 2026 17:16:34 +0200
Message-ID: <20260728151636.236393-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728151636.236393-1-robazzalberto@gmail.com>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards. The prefix is needed by
an upcoming board compatible string ("orbbec,zora-p1") introduced by
this series.

Link: https://www.orbbec.com/
Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..a42899bd2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1251,6 +1251,8 @@ patternProperties:
     description: Option NV
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^ORCL,.*":
     description: Oracle Corporation
   "^orisetech,.*":
-- 
2.55.0

