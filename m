Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330692;
	b=WhNhKLC+oGlXCAUj1Gbg5zFHs0pEWbwxFTIsBu3gsAdKCIahBliWmh1XvC0M6L22xURi
	 keJaTPwCs0JBywd3hwfZttHJbbI7BwE7zQUoThOK9XpZjgK0JdSbUOCdQ0KjppI6NrOXX
	 0ykRMkTMnPEnChkQGjBHvh2mRxqq3w0t0rU0uzwbHu8iPAy2j0kdirCB85Ub4snZ1Rynp
	 /0xrFjmV0CSdNDLxzUH+UD59qAO5OBDfYxegWYJxP8AmvZPW5cuaJbmOLXbtifOmbv+dW
	 17MDkZRq+ocB79OLuHRGt2yW3VDbysTz2MPosUqu5e2wmSnFUp67PXrmNk7jFWCL3HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w+PnSLxKsJCEKZh3Ds403ivdl+AA4FlpjzNhhNO09oY=;
	b=tiV1ARrqDCpANfJAXJQUiV3lmryBXuJTRW5xGKD7RXd49UkGsB29IcXwraXwQY7QpLq/
	 8Y9KwxYi5Qinyby1HlSfRNCGIzGtUjx1cABsYPEBrnGIaBZihpjo3NlzMdKM5BPe01Zht
	 8rF++G6B82IPdKd29pz1aqj6WtjPohNjhiVFhvknzApnoE4jRc9eG1B1VXHMRh7sKs1Ab
	 yzoGlZw3H9oqB0l0KlaTHhlkIrOw2cNEc+mt0KEXDVQj3Rqk72o+9XalPrsxJ+PNI1a6r
	 C3CccahqlL927lkCUSolJ/z6VKMGjp6u4hDDfnAtHD26j9A/QUsWtWOEXeeiaTmaRjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKY8UVpz;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFF9606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDFF9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKY8UVpz
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f0464dd6b6so11686365ad.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 22:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330691; x=1795935491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+PnSLxKsJCEKZh3Ds403ivdl+AA4FlpjzNhhNO09oY=;
        b=oKY8UVpzKhjVKafswLUERPYGhhuJRjrxLQQvx/ETBnU7BjQ2U1eW5Eec82p9yUZSQM
         69uRrRN49rT5ki6eGLZdjWpK0iFa9hFcu4wc9nXn/Bp8SqlS5ABwSjJmy/8SKLjMcNSN
         E45Kc9P9FXDD8FCZB3Mse459Ccr+1VPgxJPHu5mX2h+V5P9u7qGOFfTVZx8K/aAkuydZ
         g3ubIm4r9b91xF+Qu40r4Ubh2J3pqSOdr9cABqN+bT+F6GnzohxpwXn/mB+bDsF4hX18
         jSuFLH9ww06Mwg+e8v0l+jJ+6Vqdg5L2tEdLXp+P0a5oEa7Sq73XhcG8d2SVKjJI9B4u
         vPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330691; x=1795935491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w+PnSLxKsJCEKZh3Ds403ivdl+AA4FlpjzNhhNO09oY=;
        b=yOg1YtwYOnN5EpjP3/dj+NuLHpPk1u7IoE0DIQ2do+ydNBdSR4grNdtdvMhkga808x
         A0nSlawzbj4rD8hRTxnnI1ByuHO2qnqCLHcDfJ/781EHOQOiraXeMETa3ea5cpUk91FG
         fYwDfDCmfHrdJClAVSyeeoxGfUKkbjAF6zPrUy65gYKF3mBvuev+vN+r2AenRBt9GNJ9
         CePu8niDzgVKKonPVvUs2yJmtv66ARHL8Vfs/cS0zzonILBDLten5nLJ5aagfU99OhNW
         32bBBjxgiC9hpkCQ8jlqfvKiXCR5LxCfjLkBWU0PlV+fpLjyoAfDJ038VOrFZxxrtvk/
         fvUQ==
X-Forwarded-Encrypted: i=1; AL+hErEkYY/fh+o/NZJ3gOLyXdbmnTSST97KZqPQFYQBRvOdKOpvtyyo0UjmLREr/xR6jCHBv3AVU3XdJScn@vger.kernel.org
X-Gm-Message-State: APuU4Z/pCCd44ktZ7KOd0eWTSmajQiQ/7oLKsa2RfNK1iNL8A1mkWywB
	poBPomwSPLnx5q2X2pjw5358y3dYDC8ZMMcb4pQnT6bLmm2DYjsxLAok
X-Gm-Gg: AZFdTZdALa6iKkeubDNaLRV8zIUQe7qJYYs87r1EjlPZlATilfROMb4pOEAXgRDkws/
	/KM43Uu67rxPILsz953+Fv7F3elu4YkSC5IhAjotWMkuq5JxmXQjvlrax4ziAwTKlYixqqzo0cR
	7raJXvn6ylEMQzhJlZVqRKIvjR1sVdoi40+yqPmjLe9/rYgRneVlJNmlCPLK+0BpVbRcrm5vFDc
	OnNwwb90EQ4JyXMIg4zSHjXBrkBxDi2xto6Xu358qHW07vRjsiiw/xK1XO8b2ryxB6ltbFXAq9g
	gMTj2Pddmih/4mNaLMmB5DX4AcOkZwxAW0tJVXaPERxs8oCCb1c+RjjYG1jUqXccJOt+eB3LBRM
	oj2Up7qF69YdOMBhr3WK/+faLGsl/OxyDsb5HPh9Xfhb4Vg39r86b3n/pU1iZcyhLa1Kg08WvUv
	VyJkijhrZs5it8oXm9Vjjx3oONBmO1+4U6A/NG25ANZiPSGmV5wtrZgqmG1FiZOdKialc33zigf
	BeLZZj1FRLLBLbiqRLtv6gSXNmwYVhfWfk5MeBIkPh5CRExiawIHnsTGCp5fYCZvUwY5p26t8fk
	BuNEBYxgotVBjgCiUUuufWKC2KCtFkFjVAYVGKZkD0CmABtY8lvM
X-Received: by 2002:a17:903:240c:b0:2f0:3382:cf52 with SMTP id d9443c01a7336-2f03f156ddemr67246795ad.15.1795330690792;
        Sat, 21 Nov 2026 22:58:10 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:58:10 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] MAINTAINERS: Add HiSilicon STB drivers entry
Date: Sun, 22 Nov 2026 14:55:23 +0800
Message-ID: <20261122065549.3265519-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122065549.3265519-1-mmyangfl@gmail.com>
References: <20261122065549.3265519-1-mmyangfl@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the HiSilicon STB platform drivers, covering
the histb-wdt watchdog driver and the existing histb-rng hardware RNG
driver.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ac5128b756e..f248a04b925c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12187,6 +12187,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 F:	drivers/mfd/hi6421-spmi-pmic.c
 
+HISILICON STB DRIVERS
+M:	David Yang <mmyangfl@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
+F:	drivers/char/hw_random/histb-rng.c
+F:	drivers/watchdog/histb_wdt.c
+
 HISILICON TRUE RANDOM NUMBER GENERATOR V2 SUPPORT
 M:	Weili Qian <qianweili@huawei.com>
 S:	Maintained
-- 
2.53.0

