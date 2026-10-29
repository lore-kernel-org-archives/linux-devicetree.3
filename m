Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290222;
	b=pOkzYFwURJYOjZxLWJczYbRFX2qTLV83Os8DwyRDs8Z7DY7bgOusxe5IKB3YPHZZzves
	 zBLzUNOH+T9gIRQa+Q7o8ERHFIC5ZkqHY7rUFEaPiS3cHsmafeSE28Rr/zCIG6Cms+OPl
	 yllnsf5mIDXZEcuXdSDcB9dl1dvAzLIh99V3DHBYfXHFtoyWhHldqxFkL+r5vDOZ0RGF9
	 0MJ0pCX4OOsKSuktxJXpV8lialPShqgicJn8VYswfp2aLowVzmFws3mnfHM1HTdjsEbCp
	 K43EvCBoS8OZNlJtucCyZ+0QvW9ZQ/cv77V9lT+p8BA59ftI6024sM2x+GF5FJGsUkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
	b=4twzV6glmFya6LykyH6+6CheIEFyA372H7Dk658St2JOuTEBuKC7nYcNK73NjcgId82u
	 aDO2e7RASQDiFu+k10xbfvB7f0YzawlBJwCRktwXioTiVdSjQ7AUcS2pnAV5g9RMMWeyg
	 /r71KAkqWTwa/VGdntjYVPWABuyEsBdm0eb8rai/J11GDHhmN+Vvqsnvdt5K6XRdVU0b8
	 BHhWC9HtO9AuK1duMRyGIyfZzP2LiD3KYT2ThVFyMSzVWRqv9Cwo4ipMJAi5cJCaIv0vy
	 +DvBRuhpu7EzO8MWNb+F/M/JqPAiLE2tRjHpGw54htL7BfZ3o3/6EXW4VVVJNTta7fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pO43cown;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A09D60A5BD5
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 16:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A09D60A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pO43cown
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso24024285e9.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793290221; x=1793895021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
        b=pO43cownntH3QZT4yq+8B7fuN9WUIoVpaHrfgUOUnFeeU+cClsLyXbA1zrywkT8CEt
         rjUjkaFmx44/Gdj/B/fSNj+3rSZWD6EWGdOzI3eKOT4jF+bCcupcxxceyeg16j80Uwqm
         Sxrh9+AyyLzz7wF6Q3Q09VWDBKeq9zYhwJa0owWclg56XiF5pRXQohJ0IpuuFHXuf8K6
         Tv5HWGN1ITkOd2CC0LcRy5r+lBfylHJZ5x6SlNv1eUfrkeYhImBa00diUHDcAGU8Q6Kn
         qGIjC8FyzkFrBYPd1LW+op6KM4KhEBzghKFVvT3qHFrQFhkJWL7R0EcwQxqbm/7aB9+l
         +gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290221; x=1793895021;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
        b=H8NmZ6JtKQnbrkoBpmBpfMuGoIDi/tU3m6Ei39Pj33slB2r7fsmdzEdjwu8/qhVmvW
         tsIiOGpat6uDQxaqZc8/Il4QdMhyKuKG8LlDSnYYoeKmV5Ll3Z6HRlEkD2oIo6vQxmre
         yaRLD1FHlIhMoLInsevR2MjESGyTB/WiV5hHkzRMWTeEJWwbJPTUoOHVw30ZXGNr2oKQ
         j5KBEWb1/+38VruGtN/70dKKMlPB4NqvqY8T7/2hgLgcw4kLdichlvvHVGTeZ+7RVEtk
         q2iQnFrT7bUzitGxFesG/b6wPbH0nqaQkCm9mOrM1q4X/SiCJeSAyZx/46ovJcgtW/es
         z3Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzNopTLi9mmhc3IEl3Og462o8nVPiSfIBp6i7Gj40JCWPZftra5agizLi6FGOBq0m63aIqp6a09MeFD@vger.kernel.org
X-Gm-Message-State: AFq9FYLrbPR0NvxBr8x5eHqY8VZcCkibpdwdJZf1tkG0a+SYKH05ryF5
	40+/QtU7eUsWW0/1NIWvRhXpFk8NMwkwgpqHwtc2ssaT/qkOAw9m9Dm4
X-Gm-Gg: AYBFou31iS4EWE70mM73YVsBWmEdyQkAVAxQHoFLWa88NMh/kDo825AxVE/XXjWcoX6
	NvfpDGhxNZm/jsh1un2tL8vY/cRVTnkFoR4sC2c7DMmyV9r2f80sCyUfhw9cRkU3yDVHDi8C/7L
	bB+3fk+RxmPS5C7lHq+W4ZYr6oM/CR43px6uc7BlIlSx63ZGQjnqQO2NCEcu+LhHZyoh5SAhY0I
	qTx8ZI7OF/Udi3ko4fEe592Zja6UnEEqDiAtLQO1pe0QLn2F+QzkD5SNsmYWhLNvTLfbZ3WB4QJ
	Tw3G/BNUvmhIh6tpjy3BatO5Qasn/nV7k7uWadz+54ZXzkkTIs2JoxLeWCQ03uYrDKx+CkgiWBd
	fiZLGU1EvWEloAwe7W9n/y6GLSxsqyRrN4vdq8WM7uK1B6ejG0Ndbq9xtv3eJvU5SlS5DaFRxH8
	/ZCToz1bQ6Pa0ySJildIKLbfEzaKhUgSeyIRqGVPuwTF4eL7PosdKeq4VH6l0liHIqiHh97xyEH
	urhekzLeOs6Q3fUAUA1eMhOiryrsIkKzM0GzphGc6dce9KB4segimqoD4eArMe/dVC5EeK2XSMV
	V1qVVxJ4n6X2QD2C6YWMlqcUz6EOrBhVxQODyJkiPiw4qkMZTysogBCB/VDHD64i8Q2nDVbh1O3
	wiZzXAZZgGILsRTNKFrS/xb2QQ2vQ/TscpdIf0uknoZC7qSMKZltmgWx5V50kskloZyHJA0Jhlj
	6W7W3yQSUFHTFLnP0=
X-Received: by 2002:a05:600c:83ca:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a9672030admr147844975e9.23.1793290220695;
        Thu, 29 Oct 2026 09:10:20 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df1dfa5sm146254f8f.2.2026.10.29.09.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:10:19 -0700 (PDT)
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
To: krzk@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	sashiko-bot@kernel.org,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH v8 1/2] dt-bindings: vendor-prefixes: Add WatchGuard Technologies, Inc.
Date: Thu, 29 Oct 2026 12:10:08 -0400
Message-ID: <20261029161013.52866-1-lefteris.koutrakis@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the vendor prefix for WatchGuard Technologies, Inc.

Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..898bb9396454 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1891,6 +1891,8 @@ patternProperties:
     description: Wanchanglong Electronics Technology（SHENZHEN）Co.，Ltd.
   "^wand,.*":
     description: Wandbord (Technexion)
+  "^watchguard,.*":
+    description: WatchGuard Technologies, Inc.
   "^waveshare,.*":
     description: Waveshare Electronics
   "^wd,.*":
-- 
2.53.0

