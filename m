Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEF53939BC
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 17:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347505; cv=none; b=cPEdGYIE+y88pIDWFSpUJIoiOson1TPpUAFVzRY3dJz02W4+ffuuj2AUip4T6IGfdaCAalzThGnoPPyYcFQ63CDN8lj5dCqCDDYx+XjzevGHtIDwtdWJUVCmE+rjic7410T9L3QnE2Z67HV7DXPmBCqDHP9/dC6jqhte21iqNDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347505; c=relaxed/simple;
	bh=1hyV1lMjJjTBkBT2dpsmZO9rNL8NtfhT+sVURY1vWBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvKld6ICPQqtdEaxZ1deX8Do6BgEfJkXpO0DSBd554NKik0IcKa+TqR1N9sYZluKl+cB9HAURVzG+qVm01vs/Axv3okoGlq+FHhw9ebYY7QRGtquDRrogITlDuk3ltccU98LbPPVLu5tUvdGVlxX3k7fYNOlmZ2SsMnA3Csz29U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0wUl2ie; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0wUl2ie"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so816755e9.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347499; x=1785952299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BJj03g3u5exrEL72mDEOoiKQU9cZPZAFciC5CP0Ud5c=;
        b=B0wUl2ieYcIkKM8Doe1MR6z/V7WOORrZ7jV9pGoJNj5dcA/YXGD0n+DIxb19hExnLj
         Ff0tLTVi3ElfeR7zdSdAe0Nn5xPqgkE6iwxZtn3hzH/1yrV/ZU+exdl1M0TTQoYFOfY4
         mpdITedeRY9CzoNYi5s9knN293ghWzkN/UjvmVAA6tDUT9WC3xI0ut12kEMORtSNBrxq
         6N9XShTVp2DTs8C8WvjZO8guV57tzRL+9arT0701NOTEG3+Pbo350sE0qRy9wMGuPq+w
         Rs7btkjZxVloPSs2aS3brdCA9ll/lfEzNj5dOM7ouN5Hvs5klB7EP44O0PklMO+u11eM
         760Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347499; x=1785952299;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJj03g3u5exrEL72mDEOoiKQU9cZPZAFciC5CP0Ud5c=;
        b=DDY6kCkdKA+LljpDUF4/Z8HSqT57XXV4/lQnAjLQuHyPyQ8QoEvZHYTokNZGXeqsi9
         NaYFL/QjXwgHAoPSuAdffo1LtRKkc0JgPwd5M72/t81xHqmLEz9/ple+YCO4DNnyvSi3
         v1kelr7aiCPZYsotEFrBjik5W8SUVCvoIBdpnXk/3QrkGOgZiNXMy6GqNA4m9nAFA4QM
         Ng32Vf7xHhwPt62F4ZD9rBa7krPzk/hptF7SMvIFQXRo9wy3lxzreeKxIBoawtFPXwGB
         aGeHJOEtu05pgwjZXjXxgNPEsTWaKNEtD2jolgVAPTRBE3zDwedJcd9JKWe6ZfH1GF5j
         41wA==
X-Forwarded-Encrypted: i=1; AHgh+RqBCRu6THRis/SAH99WSKTpgmSJDN3LXS+uW8KMct2QnznThpDbedPG8E1X651LBSDwlgCrupNfNsrk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0jU1OT2HbSMT7dgUfVQVRPyy9VtHEJ664Az1K6Ded2DuQhk+D
	29hySgqz0PvAda1pWc/VkzPGy9+M/tcK2Zt/15CdB1aumkQYY0IsH8az
X-Gm-Gg: AR+sD12Kz2Jf8nykjB2kjD4pi2fYHCbozLIqLSVkNK6jtfvYB4RIx/dGsv4WnzzMedP
	DEgCKqEeGFdU8tASyDmiT1H6PKF0bLYsfS/5asJdi0HAI4B3syG2rK9igZ+yo4MlCxZqCacFLF9
	oN+QGkjK/WxowrU9/U/31qIPeUWyVLhVS/IWiiXjKve033X132xg4ap0Ay3ek+F9P1a40BgK3W1
	JFLHeACaEvj845px6JpRyPjW0Gz7D0BLd8+eAVMJBI/IzJVVSX25RtLENfZfAQisxHfIQtLXBZj
	eYPuLPWbv06gbKbU+Gq08/4ra3hi64vYJX5gWQAHvVKjW5/4di9TFuYo2klWvBFmfV1PZfDD5/P
	3shg7+1COehaOByjUI9NXWkBVGGbsb+dUfVzDMOy/CTpV+ngJc6O5mb/xwelU7q9aGVn2CUiAi/
	pXLibLZZa/xETgXjcBkVmZNLwCB8ZqsoaSjELKLJnnAsMwucUlyXtpnYCBpwMxVGJZCW0QVMY9Y
	1QHEbSjtXadvIEDzKXQ/g==
X-Received: by 2002:a05:600c:1e0a:b0:495:6193:c6c0 with SMTP id 5b1f17b1804b1-497fd31a32dmr37058265e9.18.1785347499384;
        Wed, 29 Jul 2026 10:51:39 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm75723775e9.15.2026.07.29.10.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:51:38 -0700 (PDT)
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
	Alberto Robazza <robazzalberto@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Wed, 29 Jul 2026 19:51:32 +0200
Message-ID: <20260729175134.92909-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729175134.92909-1-robazzalberto@gmail.com>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

