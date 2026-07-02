Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB1E384CDA
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 06:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972969; cv=none; b=MLKPmNlxJX66KEtWp76y3Or5ER8ONntGBU8V8sE/lo1DL0ojxGKSGuWZcgoUALrHCgozEKFhsEv0HOKYQbBO2FlzgThOulRvMAIMUN0l85+/NPz5RAXkJvvA4TlA7ax5qy7PCqYgSvY7cGqcZUs7tsoHDU0Oc8wYXNgZoJYZg5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972969; c=relaxed/simple;
	bh=tPzODcf1BwslfWndQavFqn5oqaGNxoe9hMu4eVzOQ2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmbvQTI2yF5FXeKICq3esY5ykSnEAs5ymD7Ls58B4PY6gwn43Cwj4kTYDltm4LFXQrGkRXhAAnyqJyL5c0B84daD+++t0vQBxB83DEXMaLYATui6HQScQVMEO4H7K7g8c7SOXXsDMvZ2M1u1NUSGyIj/7e4TEzW+4umEiUhJJGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COvCyahG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COvCyahG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c821a50615so10239815ad.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 23:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782972967; x=1783577767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqD7w5zDiKR2ICjS7cVkhir7NR6XfZKcMKDb3tO2AjI=;
        b=COvCyahGrIBA+KDCRB7RZbgaTinSoWBYrtGYwDh7OxjL2u9LJhMLUuyI7n1fp6EWeZ
         4bkSJAO+R1FTJ6jcD/d5duPOrjJVK8+tdXbc1g9nYJ/8LYv7O/B3NBrRlLayUSw5Y6vq
         5tBJ+dMSzGkKLggeEXxapXGDBPk/x2iuNzJQ3BLDPLUMBdM0r7s/p4+IqbbTZYzH1Ajx
         2aIZgac51T7q6lLJiamgOm4dz1bCxNEuaT50Izj4KetKUGpH3s4gVdgNNT8VZqscbvaQ
         GHmDXi2+s/T+z+LMUyrkUwK7ldEcW2kahp3g0WUZ+yONMhvWIomEsXwQpJ73hRwuSrnt
         iaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972967; x=1783577767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yqD7w5zDiKR2ICjS7cVkhir7NR6XfZKcMKDb3tO2AjI=;
        b=BAcCM2OZ6Eb/hRh5pdm31qVIhnPfDESetX/04LSj8F7/QWFFMkmjg2aJex5Nf5k70q
         CbhI5y9xmBqKHv2Oi0iQIg42LTMJHGqGmaG2/P7JxAt6t65La73Fm/Yo7HAT6lyPvfuX
         X2n+Gs7r8U2kPxsbXbD8L/+kr8ahGQGeczcOALNfGmlc0/9XTYrsM7U2I73iW1Zzzuje
         QTAvwRQgiQygBMbPYsBnEpfSGNEiLNU0u6DmTjfkbaAeXLOGC0MUiHrHF3xrntaRALNN
         LMvf8tZAB2/yTedFnRLFZ/RZZCPmLNoWMg3RofSmVs++SUT8LMg0KFjiAyxIHU6XYogn
         2a2A==
X-Gm-Message-State: AOJu0Yx9BXUcBBJ3rrg4uPcrjuvqfWqH8Se/5mDpzwYh2QCGqXMe4Rhx
	OcTbrQVwcrq3JJoUjqoNtcEhdi217/NZI2y8Ia/V+ds2vnquEc8YG/0QNrU6Ijwt15U=
X-Gm-Gg: AfdE7cnPgt5YBHFBfOFGBDRAEFkqHUi91gOv2yyqJBE9rhwfJSySDe3oQ1PMEGYpdSX
	ZI8ACd2bEI8n4NxV2bFpYndPJoy0STvZARbTjXqMduRmWKKR6JiTCjrym8hOwL08UkTW4febEeH
	xL6f2dacIMlg+hTnx4Yc1ahXbPWZaisgMGq6x4P0XMUnHSlyyQwH6o3jVVnm6G/EPII7ErfVW/u
	DGFW+F7d5hZ6zV9wj0s8+/xS3dRMFf5HtfRJmBnSE9slRpjZKBSj9knkAFlsVej0fW81N/2GrQX
	SEb4SQZaPfv+zgnAF9uP2Z0MdTXpoOZe10I9fISBuyJf5OK4+ytwshsviqzWONae6Vu17R1+aNy
	dju0JMf9BwPGo6mEXkDgC0ym8fjd6qCgtvZ+opzvJwU1GJk+W9NMbYHllfD/+Tt5iVukXZrgUuf
	Q9Gg==
X-Received: by 2002:a17:902:d4c8:b0:2c9:bd3b:34f with SMTP id d9443c01a7336-2ca911f344fmr40112295ad.35.1782972967138;
        Wed, 01 Jul 2026 23:16:07 -0700 (PDT)
Received: from ada ([223.119.20.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa052d5sm8316025ad.78.2026.07.01.23.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:16:06 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
Date: Thu,  2 Jul 2026 14:31:55 +0800
Message-ID: <20260702063156.35169-2-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702063156.35169-1-kaipeng94@gmail.com>
References: <20260702063156.35169-1-kaipeng94@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible values for the Acer Swift Go Pro AI (SFA14-11),
using "acer,sfa14-11".

The laptop is based on the Snapdragon X Elite (X1E78100) SoC.

Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..6b997d615bad 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1142,6 +1142,7 @@ properties:
 
       - items:
           - enum:
+              - acer,sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.53.0

