Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3933B71C5
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533002; cv=none; b=YSeT8cE+lNJe+RrKc8Y+24CbT1GiMOgS9DwwuUuAY0AFCG1IBtErksC//UyfUKv2/22v+k3b1LigWyO4+n+rBl8Gz3kuPPGCiaF3c9cSAxx8Qngx3RIUIhF1fM5sX5sIB2SxHsP1f1yRnOh+/TLHVoetH11/t/4KA+wDQn8NIj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533002; c=relaxed/simple;
	bh=If9Ci2Z4+VVhHu4ohujPOv6EhM9Xxc6Q0kFET/yLWWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhAyY4JZEvtORwo2rNT6zNpZLzouz6G/Inm72lInCVTiaPDZfa4ZQojtkWDp8ipg+for27aLeN9kDlaagvtQDqcL0Pjq000g8hXlEXl/OBi3NTvmIvs1cQ8alZXCqRYjBtd1SbtYxMYpWlbvOVOF+RrMDKr9ipnbM73ajTVzB1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNbVl+Z7; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNbVl+Z7"
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2cc7ef596c6so86903325ad.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533000; x=1785137800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=DNbVl+Z78P8lDhYi81HYGgBrdD42jt7VEoSfinhPrKWwrjjgyUZ1rolXxzi1qYClzg
         syJVSdjO5LkB6HpMweRH4FHcXiJ/8xRwF66KOU3KNI8oVLc5dwpcyYOLG+A6LrkvsXs2
         mGpna5xfNc/kNiKVKSWMOkhCGRt3vFsiVrgFkjrpgkOUy0tlZwhuZq1mZZOTM0AClkRU
         fnn1/hOqiQSR8aLvMcOwGvpY1NgfFITSQBG+t3ncyYZ7vu4CbP1H1HOyWz754SREVDxP
         +sBkLL6YGH57aV00Ks3rCW8XXjc1FTs5Tqcqazh63RN5teAydjjPanJcT2zTQFO4uM9M
         XPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533000; x=1785137800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=DUgWZIhzkjhhKCH4gnrPhutAfhJ6fWTXyPOja6mIKY68cEpQWkqPF+PnrPEDehDqt8
         HI0uorK8IictrYRMaHSgmrrdHZ32tfwsc5cmi11rIVNoD2g2XYMd71KNypQOhz/hhgqO
         PlF+QMl2RzYKT9bnhe1OIT0pvN4ujRUELOQ9TnfHVWzujY6ZcIlmJsPSS9s98GhSYmYH
         Dx7Qmxznalw45eA9ZVhV671QYkgt74pMJa+SWGiv/2CfRGO7JYF/iOPW1GTq1PnY1G5/
         OtkPe5u473oNwd96Eq/XPssb2SmVFcyENm4TSdEriGcwpuzwYvkuw6o5CS5rCd6qvxyF
         bTqw==
X-Forwarded-Encrypted: i=1; AHgh+RrD936xU+B3xpwt4MSl5PoPOmqP5kuqsATibaNNwhS7yXyfCi2rCwi+f2RH6MWQ0jztWOm/u0dwINeZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwxE7bQtQzpFaVnpgwjXyFY0N6mgB2H9wEhmNWZoyzZ2VfOjxcb
	0D0P/WsivfRAp0qQA//ZZKZ8J/lXPBqHCNe0VPpLC89xHESwOjFzbikP
X-Gm-Gg: AfdE7ckwCv+IhbEaNvklbOV6NllMYFDcX1dyt99E1FzSwB0NI+l9RVtEBeCKIeDZrdV
	FrgpbS8196wuicMyNb3ph4ARKtau18/hRvl2tXyVtBms9ZU7OZY3BlrJGKzVB0qQrrDhSYWvQJh
	5abwOkut1WIA9h/YYnJKZrTHKNdk3rf+2yAHA7gF1anVk78+SN5yMrbWE+8gzVBxi7GVc9NSpuB
	6pF093EX7/9bahGhCOzM/5OcV14XvtjqLLoYQI7waljlOvbJwpmNfx7IDRdz3HLAIsW2OONbItR
	MFlthXbqfifDbMzK9NkcOTUzhEyvSt/W63ul2AsXlEFP9kKMjtzZcF9T8h4GW+gdmDRs40Iphnn
	mzHMVn2gMCg3zHfWln0GxnvjbCkTFBkTCX2l8Xq44PSXGH6OlpcUVv48dLtQNySU31bR1RaiKoS
	7/ll0=
X-Received: by 2002:a05:6a00:278a:b0:848:2f84:f42e with SMTP id d2e1a72fcca58-84c294d4dd5mr11703273b3a.71.1784533000555;
        Mon, 20 Jul 2026 00:36:40 -0700 (PDT)
Received: from ubuntu24.. ([216.23.123.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcaa0bsm5210536b3a.20.2026.07.20.00.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:36:40 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jenswi@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add mbedtee
Date: Mon, 20 Jul 2026 15:35:55 +0800
Message-ID: <20260720073558.799755-2-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720073558.799755-1-xing.xl.loong@gmail.com>
References: <20260720073558.799755-1-xing.xl.loong@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the "mbedtee" vendor prefix for the MbedTEE Trusted
Execution Environment project (https://github.com/mbedtee).

Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d6..fd032a3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1011,6 +1011,8 @@ patternProperties:
     description: Maxtor Corporation
   "^mayqueen,.*":
     description: Mayqueen Technologies Ltd.
+  "^mbedtee,.*":
+    description: MbedTEE Trusted Execution Environment project
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":
-- 
2.43.0

