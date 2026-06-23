Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96B425B088
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 19:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244704; cv=none; b=S3r0yQoD2mIWjn3yhV6LfNp72DcJ4EMUMToGOUMtWR6SFlsBNEVQDAbCl4GUcOAhDvwvVOXq9IhfANI3ZLOeHaQmsw9gjugXV/OxErwje83OwpMV4Lv/UkiBftOwZzSHAz5BSmJlvYj47DQrKDqTzyZYkaRu04CmDk7knfd6I74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244704; c=relaxed/simple;
	bh=ZGT4hMYA82egX/5ALI+dH43OKNUJYumRHOgi+O7GMWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHvVirXRbp6LaNB6hSB03/sZxzYxucniogKCer+PJGoYiBQ+jsnLeaHEa/q8XHvvyWSSbDDSI4xw3OYqgyhPQ/BpAjwDYoCdqGxLLGUtT5pAFR2LvSgWckLTfx+o9Qh5KmRbiH5DWIjBIWTtOIe5pMfJNy16T2G8UrqsB5wGBBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aG+bKsoK; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG+bKsoK"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-139aff562e1so367042c88.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244702; x=1782849502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwWnRfNKOCzBCV525CaMblQsIuzpWTFabgqtV6LDX6A=;
        b=aG+bKsoKkdmblKi04bURboFemeqbljKxi963WWXZSGO/LogngCnboBSuNWU89kC80T
         lO1qIJ6xilVQOMJR1fEI4+ZgZIpdwMrERmnVeNreMLFcmM6itnu8l45plGCBwf5MCpdN
         /mB2SrAwil3OfpxqJB2Gd/XCbNekuAwv3k11a36yBU0z7ElGWda04NpZd7MFNAPTpW9i
         w8bCAg7BRqC14YnnyB7aHupJpl237c4wcrFc1dB9SR9Nm6kzc0xY+GtlM83Kde+zMbuF
         YZnMUO//uVMCTzUluI7V5wxafRB5ZmMk6G9ylhSIZtVbntiblOfW8RK5k7Opcu+gM5VS
         NTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244702; x=1782849502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VwWnRfNKOCzBCV525CaMblQsIuzpWTFabgqtV6LDX6A=;
        b=cVRHumJ2D2uY8rPAOuE7gE/OQQwGyyPRlGcZo9WzlWCalieS5aLDPQik4XFfwS2GYk
         kEqT1h4/W1XHAcWs6xGizo12VtXSye5mkVkSJrwn+ZXCRDVRq8Kv1xEUCOWro2vHDwOq
         am9jtU0BpAhzlrBEojN9C4Uh6Br6Xt3XuIytY3uZngnqVHcdelb52Z0wRKaZsDAEPrbW
         ZUv+OgRcfE9I8UyzZKEE2H+fJYFIodGK6sZJn7qwkjfCX7zcAwGxJGhLkcAivRJAJdRo
         IjKU9IjnVniHMzqQhf1nWW/xULknn6UitqRKtWOj+sWJ+ek67p4SfnJUJwgTP8GaaeLE
         VQ+A==
X-Forwarded-Encrypted: i=1; AFNElJ8m2JpShX0hQajsymBJUUecIx/kXzzxhu7O2tv48JW3xSf9HwnOq1LGEcgpMKQD1TYVBcYOOz9XQhOt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7RbN73EfTzqJjGtADnf0MTKl/Bi6gweoxcsJjCEMmCBVJcdgH
	ACYcNeasKCa2B3t54KDbjUe2O3pAJZmgkYA4NWEyRCr4JWE3ECLKEDFY
X-Gm-Gg: AfdE7cn/sJroFhegKXs4fXwjPyNPg1fUbVk9IDDbSupZbXGjYqbzD/OEi4gjZVLunVx
	UpHdOzfXSgOJEicY9YIx0BpEPPcoQGrDwJl1PwqYc7MvoERhfJWQAbdbOzHrMm26y7bSBOmEXxd
	QK+DIr8xzD0ravPmXDC+jPTsmcpJNyvqjmYIEIEUsVcy7YIt80ipfSVAj46yNrt8i/ux+emLFV2
	0GBEA44C1me4flw1pTI/8Kj181ICIUe9TNz4cIXOJUpGmFwLgGf/J5wwW57BvzSpJZGChaYZVKu
	fKFpxXcTKq/fjcDc2SkbHgNPexd3Q34lt1qdRuOPYaXESGKQah3qKHAekyaFuhMzNfkKnAP2e7o
	Mehf64mqBeo/ZFq9fZVKt5ok1vbHTo5KAI6dOK1AqLGFjp9RLGqdqqWVN6atOmGy8FH+NhydBnL
	DeVNGKTfmImGwxr5g+qNrfDqpcHo/Rfe/zn/lPAjwYMKxBeis7zT6bAlcu+U6xvemL2K88EE1EZ
	Xis3O9ZAkZkcSxVfWUxiohxiN9sVD57edeGR2DqOQc=
X-Received: by 2002:a05:7022:410:b0:11a:342e:8a98 with SMTP id a92af1059eb24-139d0b58d17mr176972c88.0.1782244701970;
        Tue, 23 Jun 2026 12:58:21 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add85c40sm15730896c88.15.2026.06.23.12.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:58:21 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: leonardo.costa@toradex.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Opto Logic
Date: Tue, 23 Jun 2026 16:57:37 -0300
Message-ID: <20260623195741.495734-2-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

Add vendor prefix for Opto Logic, a Swiss display solutions provider and
printing systems manufacturer.

Link: https://optologic.ch/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index dd94c50e97f9c..ce0607afc1f4b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1247,6 +1247,8 @@ patternProperties:
     description: OpenWrt
   "^option,.*":
     description: Option NV
+  "^optologic,.*":
+    description: Opto Logic S.A.
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
   "^ORCL,.*":
