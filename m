Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A43A38F24D
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 17:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002047; cv=none; b=renhnj4dpzHikZbW/Kf+zgWAtdWtPWmnnvgafYKZHpsJyMq+gu/JKDNKrFBXBlUOntmW5tvvT5+Pjd8ZUNSOxuF9wqe44gv4mKxQTEF9srxzwzX0fMmjU9dMQL7Njk8avWAutQXw+2r+JxXLAiWSQ3SYoYXojV72Bm9kKiTl1S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002047; c=relaxed/simple;
	bh=bnvvqsRWp/bLKK/Yo50qBp98JuVsOPyd5em3lmpqY5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRjPS17oE2pJ7H5awu2SwjwqbrOJyqarK4FUg0VfZcZB0g2cDYSGi2wIQ6WgV3MO1W3Jz8KCPjZqjHu3XeGNm5VRzFyME4NN9qmv9g22BBoR+EBGttg/XrLl1vwux/d8lRjSEHXZTAgLpV+n1k0lDYlvweyNvBYpo7qQc3pwIps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLn5D1bg; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLn5D1bg"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84a32ff53fcso128344b3a.0
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 10:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002046; x=1785606846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4cXmnlu6jiskgBAJ4hnLEFeaRkSGLWSy66NeKTndVA=;
        b=oLn5D1bgfsHEV6v/QlGIHpptrbADlYut2kyNazFmHwlR+CgnOCILnptI+XgC1Tvhoi
         CTesxmaF/Twj6H3UooJTwlO6+5F2lHghPxxp4KKgmQXptsxQbMVeDItTKkYF1sU64JvF
         k4UOfk6t7VmzmMKPoZmkAXtCDRY/y1WKA0knwO5oadU7YssrO48jyDquzwUtAKG6ZhYi
         CkFaLpwBsjiFXIjUmR3kKaTG5cHTj/M80UsIRQ5UoaSdYHrgD9At0LraJoGZduZRLRn8
         IWlRL53fWlf0K0YQuSViFDN3BG/iHxKJNtPSr/Wqs2pOjwtN0oXjNAu09yMhCZDzX2cI
         HErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002046; x=1785606846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4cXmnlu6jiskgBAJ4hnLEFeaRkSGLWSy66NeKTndVA=;
        b=lakjO8ztC1wPGkZb/djOM5/q8kkAQz6wuklQBSWYCpaeDZHJr0twDQUfexBI5vM4QT
         I56Abge2rrpq7N/ggdbfM5rmQUztasNKUgN0xUDE09gBXzreyIhoP//rt+sKRVfpWvUq
         xShS3BTh7ZW9Ix05DvfrDfHlrFLxob/zjva/kvjbxobHsnCDZz6be3Sum4YzCeli4N1a
         avk2ANezmQBpFCYAwnw4w+h+DphvXmSEojmgxFpYd8iE4gB4teW8VlkYTDEvV69y47Xi
         DC/p0XfQSeR2JXnqjx8LG3NJ9ZU2z0EYgqsN/9VDOxD0PndUewTA4D/k+eVyUEpR/e++
         kTBw==
X-Forwarded-Encrypted: i=1; AHgh+RqziHV5mC9QOj9Gd/qpZYRf76rVFk0F18tIWHGs/EkBJufvmmxuDmsP1Ti1WoVJbVraWbiq0XRsJTef@vger.kernel.org
X-Gm-Message-State: AOJu0YzQg5OKDCtBL0CC0PLExNSsZTCFEuf7VA+9H28auXsVeJHHL1K2
	bXFBe7WO9p4gVCgm6C7+HRHstBt8pin+p7DJDjg1qTKiiuOj6UwlwLP8
X-Gm-Gg: AR+sD13iIfU2c+OeToDrF7onI8Bjg2EzWppANgyWQYUVMIKGR0H5OBqzgc4aw43eWGz
	ODOVjUalygWRpNV/e7lo6Qlqu9skrMRPr6siC51xT2euA/io8oaWwivpaHBDaqmI/TSDVII6BbX
	96ezVSQrj/fhl9SAjNdmaO4tYUo5y5qy8ICuMzacanNBTnjJOk36PTaeqkK1ww5tluqShmBuVx0
	0Lw0vMZuyAJ9vXIJ4DmTC/7batKElWz9XVgU5ainC8jFjdSQ/9pyNU62mnyHiF5Stvx4+zDnoTd
	gnpAxI0/F71KqqEfsh4S65An8TwFKXCUk+k2ZIh9KYgCXHmZIYC5K7AKZcFrQfWYfgs+qym/4n6
	yD7KoyqbxElDY2Zha+xNlUuqF2QN11Q6rJYOsmtKZmgMitXMxn0ZR8FMOQQtcc0T6cc6vyvJUNa
	RCItXETEqGUF3kXnmB7yhFIfWDnukwDIKl9mOZzFcH+O8ccmnflmEFIb4gdZUXAcqqqe9tfCTl7
	4elYPUXcw==
X-Received: by 2002:a17:90b:584f:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38f2963fcdcmr1858338a91.6.1785002045724;
        Sat, 25 Jul 2026 10:54:05 -0700 (PDT)
Received: from chenyou.hitronhub.home ([2407:4d00:cc10:114a:3b0:934a:d409:94fe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm3005276a91.0.2026.07.25.10.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:54:05 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
Date: Sun, 26 Jul 2026 01:53:43 +0800
Message-ID: <20260725175346.139173-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725175346.139173-1-chenyou910331@gmail.com>
References: <20260725175346.139173-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Milk-V Duo 256M board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 0b6fbab48b74..99194d8721ef 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -35,6 +35,10 @@ properties:
           - enum:
               - milkv,duo-s
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo256m
+          - const: sophgo,sg2002
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.43.0

