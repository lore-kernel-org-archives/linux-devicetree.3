Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F304F347507
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429709; cv=none; b=a4yUKQZJnBDGt2vb+I83O8uCCO0bav8DZR7XdGcYgZBVnGIsmCtMZPmnbDs7QzWtTWTkl+p8CWRskt6frBskUz334IthiOLotTo9E6eT1uJU25w5T1lKmrkV4Rv2KOH3PFCQh25ClLahfYeF4uLouSjRxv/i0PVKNbR9DtHIJcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429709; c=relaxed/simple;
	bh=E+dbXB6xz43NwBCyouCYRd6qQtOa2PkfyCfJxIDZV0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=AxRXn61b1ATZqQeI9cDSIuF/aq1lNvAqo0V/h6dM81SMT5d02KPYBfxoVFyyJqIDM1QA/Jg+OwirSMkGK8eDV6rfOybfL69PP+0uS83rdI46R6iPxzBK6IDQ+x98Rf6rbEtee7CEHJOtnrO1fx7agJd7KBqDUAI7NlN9i8baqUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htH/9kEq; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htH/9kEq"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-829a27414a3so2993848b3a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429707; x=1775034507; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BpCh7fwsnHP9oYgpatK1nkKb8PCIU2zv9cH/KH380ZE=;
        b=htH/9kEq1SKvdGsL2TFi1cdP50jsdUeCSGZkRFFmE7v7NYVSGbRn5L5DRrUGHrWmRI
         1Ke0oUUfIMsY7gg9ATUrkvr6a2UMMpEyhtxmUXjmY5PRQm7TV4UkQEftyqpRRBxVyVbg
         2AqUmkofGaKgKSo4isuxYBw2yK2KGTp/tFd4m+ed7LiHQJEWrrRQXQNCCpkkRUnH64ny
         RPZfBA3wTv0xAHXS4HzUCVVp8vxdcFmUEVFYWzVfnTKs52OITRLKvwG4PNTPvELPWn3B
         XDmCvuIcn7sh9F1QtKi2CIot8Nugvv60QCERFSNMbdDznA1VHSTiAp2v0V9ENXbyys7l
         0GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429707; x=1775034507;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpCh7fwsnHP9oYgpatK1nkKb8PCIU2zv9cH/KH380ZE=;
        b=OjUhjwiLTIFw7jeJfirp0b6JzAuir2Qw/nqkruEgsMy1CpDYUK4j3uoZgT1KfzOZlB
         7o1wGNRtu4TwxNZoXUW55n97zdGc85QRo4ownetwcwDAfxYrOnLDZNsvmoOUfs2v8u4d
         hAUYYtGMsE2wtk8oISfX343zsSIuLYK+CI+fde3ANcLiaOW12mvQbmTNFq8hkoJ7QptC
         C0Jq0keBka3n+qXzVJqsflhPAGpKgkxdUFXfWJwQZ2I4d0hGVwvCLYK3fz40JjXgC63f
         Y/WVA67BJANutGealsSEqQZpY0hdK2kd5Kgd4bcD+OQJpq7T/0zX0HdiyhpuBXNGKHyz
         Z+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUtPbfGWEQD64AYgIlCBnSPOeTjJmqKlxnFsiRCBNl6qhVH09QdZ/C5Wj2HmyjYwlcU8iWCTAL2DfjF@vger.kernel.org
X-Gm-Message-State: AOJu0YydfdQs4OpiXXC8ZTO07ZbiUJBFesiOwQSAAOslVahRT8wyh/o4
	kRIFTacnDwYyf/Zuad4qkohxi8efvOt07mZsVM0+ek5S/ymPv6D+Tepr
X-Gm-Gg: ATEYQzzBd7/Sk2+ng8tuSIxbhdUiXLXFoHtHPmHgfidv8Sl6fqsCisCIM1uT/U2zSX+
	T33yOa8kEztStxwVtB+Cp591/sBeeMdlJPWEfJ50u787SgAoOJ0UZWLf/6Ye94YeAOo1reUoz1q
	Hjdwc3aRbuJ7PN6FPQ7cmj1d17bCCl62czB+ruCQAfGgk1JdpMXqxAu5DaB8HbiD5EXP6JVMAdD
	pxWjaDwVdp7Y0Q1UiCFUogeXKgM2pqRbP5Mf6d1oKMssx74VLDisgkKzPm8suiP7zJFmsIotW6O
	Hz8FzCiKCpRKNf4MF2swdPMWVYyPSHXpwvAIX8J0xgVnaQ/Szz7qrOBQmOHLp+mHWc1HHIHonxs
	gtNYO+KdhPFS60vCNwSw7QsX6DqaOfyPn+egam+cGJTX4oDkYxZdOB3eVehdGqWsL3mdX9vOR3T
	BoAa/acubiq2ci2O461R4IgJEgbU9CnxfMIURh3SI8D/Kci5seSfJZ
X-Received: by 2002:a05:6a00:3389:b0:81f:4a06:6f5 with SMTP id d2e1a72fcca58-82c6de85fc0mr2872060b3a.4.1774429707276;
        Wed, 25 Mar 2026 02:08:27 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6881sm17476982b3a.22.2026.03.25.02.08.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:08:26 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add GXCAS Technology
Date: Wed, 25 Mar 2026 17:08:07 +0800
Message-Id: <1774429690-129139-2-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
The prefix was confirmed from the manufacturer's website:
https://www.gxcas.com/en/index.html

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

