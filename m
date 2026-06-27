Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576AC38D
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 22:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782601104; cv=none; b=JZdSQvTedDLUrzjsIjip7osckXhn1y1NeJHQSF0vZOM4qoYbwlI5eQGXnWzT/MNaxMRVOx7ucZrLcK4Mo6NT4QFBXwHeB/U/rT0YIUZ6++F39Gem5puRqT3g5O8Lwy7SdQJ2KUbUaKG/fPZD2dbRFmyS9MQIWRH6PRrshaZIrC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782601104; c=relaxed/simple;
	bh=rG6u8GYgN3SBueoaIg3y7mki6MRJW0We/joinBEC7xI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=df7yDRYLI8zG2X7o0ymy3NP7WtKRZZdsMKQUTFvoE9l/a06AczXPmQzBy6eGkFjN+HpHwi8Kx9hz/jnDUCdG7PrbCq77HRfovpy2YYOZ9ImsaIOdXpzh///nzAolkOINIgybLkLAR9gAritb0Kzvv44NjjSXsYai3PSCiLKz1A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPnvTXnb; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPnvTXnb"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-37f7a5a217fso655032a91.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 15:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782601102; x=1783205902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjb/FajtBjMgnlv1ralDNgBE434bxvgdfvleOUHgX58=;
        b=pPnvTXnbWkWImU4dy1+r2ykVJdzzVtjZmUKAWVwDcbG2x9G8A3/+tmGAoeVwQr5YNI
         5jNspTDimDOI4BQUXZZd7/EN2unlkDp22XpqyO0I3WlDg7bg05guEMqm3UgI0j0eFeH9
         +3u2Xh2bXnLnkPrVE9F8xNN+82DuLLCNCkOUyZOtvlTR6Tl7klph9cLjFdQ+y920GYg3
         CoFVArwoy4BH4FljSrg+drfhqhh0zwVAi2VEqb5wT74iAA/dKVVc2hwbpN9X8FBW8pMG
         MnFBhxdigXdGlx/9Nnp5xd0CJGWJc8CW+VjbaKv/7ATX6rdVaM7OF7RuBRjl6CBbQqow
         s/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782601102; x=1783205902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjb/FajtBjMgnlv1ralDNgBE434bxvgdfvleOUHgX58=;
        b=bLVbGwIzfH4R50i3FqtrULFRpzMyzpIXlTbjiuw/pTGiwnCCw+o8BOj653OvpLY0DG
         FYTO4gL77nFy6aSwTUAuWyIZSsd+uK6GidI0aROCIJEqLGOsAtG3pf7LURIjn9kJ/Ue+
         PJSABkhMeCWxX8TKIIVFOuTpSwjq3fwDIlAsaH5sX/q0nSXWF6LTqNEx7yzwVRefHa2f
         QdNeDAYiXrYlB2xkdIiWjvaJTQ7lGFsXdsZYBt5hWokMmW4/W94eeElO+n6HXfygB++Z
         e4INVcXgcuV+I5G3DHh2sLkZcxmqS+tGPj5BhoZ1jmmBXP4B146gCZqx6cqSQg3zubg/
         VuwQ==
X-Gm-Message-State: AOJu0YyIxaAdMTsIZGkio9nTrMDXiEFDeHtQ9ePYGQzFpd+rehJejE+L
	mOZTr1U7NJc3U/1n4j4tTyqpeL+17KoyPXZgDhNilvJJ5xdK+nftU7Wk
X-Gm-Gg: AfdE7ckdihWW2QN240ExMmOjJV/d9lE3Pnoe8TTvWnxrUff9SFCtbBpBfFoc2yE0E+/
	gMGdmvgmji082q0i/Ec94sunEs+wwPITNPsxh72kCPO0AMGQ9cvgRizPQQM+eGxz0hh2jnwdO0J
	HggR1EhkSgggsbBbKQRryQKoxKx2f9uMwjl0yKNxtf1R9j1MXzB99cuplnlFTPbuqQIBrWTpndM
	DlBCksG3/BczKoOLGrRT2Kt4CGHVzK6MVZgv7/95fmwSvn/vryiFXNWUnLnoIHmHIyzcfkcyqgQ
	sfuuFyCn659tdKxnoI43lDeKgva+aBhCcGYTe1DhUTU6d/xkQTKvTwR/bBRCD+bmmH4ravBJcL5
	iAQ4xSQY3TRuHOl+QPbtdrZ+o9ISgVNcKDYMSHm4SW2h3LUG9gn0HWPcNNSaVHnTQF2qXfzk7HO
	l5/QdHfT2ZHuo=
X-Received: by 2002:a17:90b:4acd:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-37dfa25a0d4mr12186003a91.18.1782601101601;
        Sat, 27 Jun 2026 15:58:21 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3b0ee6esm6313693a91.6.2026.06.27.15.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 15:58:21 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add graperain
Date: Sun, 28 Jun 2026 06:57:54 +0800
Message-ID: <20260627225755.1710837-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add graperain to the vendor prefixes.

Link: https://www.graperain.cn/ (China)
Link: https://www.graperain.com/ (Global)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..641a37c0d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -682,6 +682,8 @@ patternProperties:
     description: Goramo Gorecki
   "^gplus,.*":
     description: GPLUS
+  "^graperain,.*":
+    description: Shenzhen Graperain Technology Co., Ltd.
   "^grinn,.*":
     description: Grinn
   "^grmn,.*":
-- 
2.47.3

