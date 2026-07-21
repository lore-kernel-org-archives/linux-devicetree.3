Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0458D44604A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676916; cv=none; b=XPPny0frxZWOV0u2hnancvTr5SX7i+bFOl+Ndvvo+HY5h9RguWviwIDwVHSt/+tnsi0mNGFENyNl0nJELmPYeQbBfVZmsbnIlE8js5uFa5oS3cxQycd5X5D69OOwTpHW39XVbhoxHO+Q/9TNsogoZlN7iTJx6zegC9LER06aahw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676916; c=relaxed/simple;
	bh=bnvvqsRWp/bLKK/Yo50qBp98JuVsOPyd5em3lmpqY5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clkz1ZMTxNZhzE72rokFPUGag1ZbstQV6oa3P5x9suA1/QfejtyJ5FFPz+OCFzvdll8KxuLY7abGJn45DLlfaoAWLshkSTwrGmCNfRGChrmDB15Z8EoMJXjBfCbsMW0s37edgvc6rGUMiQUiGTB1CQxg9f0swzCBnmfWG3YwYi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci03onyF; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci03onyF"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca132e9c54aso828500a12.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784676913; x=1785281713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4cXmnlu6jiskgBAJ4hnLEFeaRkSGLWSy66NeKTndVA=;
        b=ci03onyFU+A6GdVCg6NgoEltosjtOOsLQTXB7ofG6s9pFKymL5/0gkLaWypZLgt4vh
         /2+6tlZE373uXG7J7K6HDwN0AI4Bk9vc9dDu2uYMGtckyra32Yf4bF9MejSxrOSdKODz
         Mev+xIGt4dDkqIjufslm521uHknmY5UaG1jlbm7hPF7ZUxgKIFyAiZcUcCGhw+ekdxJF
         EqUKQZy+I27/cnvFFeUi8givgXeSQ9U1XSMEGaiQGHN6AoMLzydlgf9zQfUNLtkHf6Zw
         9t0qEx8wTb4uGgxlmLT8PCM1q5XQLKhynbMGeCTw1pF7beBd9tGSE3NisPguU/cNdFWv
         1tpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676913; x=1785281713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4cXmnlu6jiskgBAJ4hnLEFeaRkSGLWSy66NeKTndVA=;
        b=fkBWxrphzzF2zGSKIEK6qJ/7QE3pGFc9kr3R1zX5Bex6Cg7JBfbn3KwnXD7ipTRoVf
         /lGpkojHEVC/ZQp9wTyv4ljCuw9vCGQLI2DJw97wQrHTnAQYwZcDyqLGiwQWV/lUPARx
         w3U+Vbn923SItN0WVIutt/WEnuK3fbcPqv4rDSMruzeimcvlrCpL+AiWoYI1GRkoAjvV
         XCK9GAwsojibmmxIgpVRaQiZnIa/tqzmhRnIbNBQtrqpzBuIv+G97yF3yqLNHv/nF7IW
         Bt9G1DAUkAPHWMLEl+t0ykpKvtrdyY1JvFXhdX011OAG7JW6+3CRXRB/taq+UFPaMPJ2
         v/uQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjrJP5K/OViTCimrE6DR/GP/QjO0ukOg1zbBSy6hkynfsHvRDdh62e+TifEYFwOXKcKuVmkZ5HoKtP@vger.kernel.org
X-Gm-Message-State: AOJu0YwcPHRUVFqaQzYx1YsqVxBZ+QclbNeQqR95KMIgXioxdb8IvdAc
	t56ZBafdyXkiqhPy0pafSIciy7vvnoCsAOMCwhYd+4QuS9ywfBOJFsll
X-Gm-Gg: AR+sD12z7uMnbIDCVhPM+NsT0CQ8bJx1XrxrYR0AQKyZVvT5JhewQD6DloBJn6z3DiV
	cabC5fRkpnl7FMuyZ5+ODKSqcOKHfJOXmp7mhSaY5/WR7llae1ysmlhkcBRhFnCaplBVtJvN00D
	u2boGy4+2OBncfQa0wvvjWaAiNpEJibccaPgzh+k0OJ8cnyx3WCN3IvWudtNOkaJkZ28Mya+5Q/
	hluVZzhH3PfPo1dLYfw5v58ZV7cuZYDFeVMMKXKBjzyayHgjfCf0rKsX+t5WVy+URitjzj3Djbb
	BvFeX16CfIjth4jduXTZfRSDaucQT5/EuHzI/9DuMQniIrEiFkLddKXqnJY0+nbIKFb4trLyGhp
	yrq3tU8FNwRyblc6TPqWgoDK+rq82qyhpDWlUqXaCVd0FrKI0oLvg3yAnIv6eH99brYGHBiX9/x
	/XH/q++XG1sdBKWB1dmNrGk95xoszRqKLV9JNHNkbsKNAhUaQ42sWAJoCzij9mLiM+/TxAPoYnB
	qgmFT8YP0nbzG1D+fMVAQAqwBg8oUhTvR/aeQ1CL8xUxaL2kow=
X-Received: by 2002:a05:6a20:2588:b0:3bf:b625:5bbb with SMTP id adf61e73a8af0-3c40fa49621mr4335934637.6.1784676912974;
        Tue, 21 Jul 2026 16:35:12 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebfcesm245353a12.11.2026.07.21.16.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:35:11 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Han Gao <rabenda.cn@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/3] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
Date: Wed, 22 Jul 2026 07:34:42 +0800
Message-ID: <20260721233452.112204-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721233452.112204-1-chenyou910331@gmail.com>
References: <20260721233452.112204-1-chenyou910331@gmail.com>
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

