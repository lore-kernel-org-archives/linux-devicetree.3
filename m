Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4351D42B339
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329319; cv=none; b=LVgcchrAto9pjtqe4rJ43+6k5eIl4aOLLUeCTzgoL2hj0n2DIGAHo6//3ZJwcdczz5jMhLsCcRw4apqyl9dnGr1oHntIWN5ZUNIfwlbAaDnmuq46hRN77V6cHvZCwb65TpT6kiaFFaGw2zWz1psh9t52LL+lEWQ+FT7J79mPlKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329319; c=relaxed/simple;
	bh=mcE6Yk5jQAt+Yt1V2EfWURtYiAgr7yrD8IJBZ/7gloY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a2oQS4H2B56smg/aC0akHquD7r6NuO/SRSzxOYd0k+6BLWGjSgr4DXgAZY1M0p7NijLALlFzdugIsgXKztcVImlxRqEvxqB2b5/sDFCHynx4ZPOmqUCPd+ysDZsm5Ny4aAIkdHajclxRnEMIKCwMhniPpybT4zEym5THXSwQQgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cu62lin2; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cu62lin2"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-842338c18e0so2237431b3a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783329308; x=1783934108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLyPjG5C5L4PyonbjPrLAmmPBiN4HQfMBWtrcgyX/W0=;
        b=cu62lin2ZcyXdTSARUSExgcZENDTk1zYI1TFUtd2dp0k9cGIN/0Sdk3yYQv9Fa8w+D
         y8w+otQevC+5b8l3RXiRJeOJNkCgvCeXQkiDKqhZn/iIT4NpDl45xX5VuxY4Kg0XwnxB
         CsbomJK3RmWxxkKkooXrNaNyrlvkidr16cVTw+PtThvIJqlOU1pzKNSixfIuALWlw2av
         HuPgPhKZuibL77sgQSFXFBZQXjaOqDnTgGh5eXq8YD6WMJQT0Ws+ohF/hDFafVyrZFTg
         GrmWBGyO6hPMAexRJMWdDrk+jlr9Q6LT9lv058pXiWyNu8/AEPCD4tGozItCiPwawKmn
         F+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329308; x=1783934108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLyPjG5C5L4PyonbjPrLAmmPBiN4HQfMBWtrcgyX/W0=;
        b=olqAJxRlfyqdmiw7uyXEg0dGoASEQCf2Irs3sO6nDMsxS1XGLhaBjJ33Epb0yI2NAG
         Ty8Q07aL9Dg3gqO7D+5TcfWOX++gAt3NI5AHF8kOjrjxbXMWJJ35WdrJcIR1dFXXiUxX
         1igKgYarinOWTe78w6CLMU/dupwxk3Xu/rlLOU7/mSEhTwg7czhNoovF4DT/tfztUfAT
         hwxiZCX4jB72hVYa7vJ1tVn0N6SixDNXor+hpyRq/PBu7VQfU/lJlE89gk8sv/5HzsX+
         BTumhIK4W6YdUHmaEKmRuNDJc89Me6GWCW6bs+7MMwH1+0wvD5Jonm8/2lXS8bNFHuHm
         jIxg==
X-Gm-Message-State: AOJu0YzNaq8Q4d5rzx6TJZ0iA/AEx+/SQ875DZru5Fy9tN0PXt7J5sUc
	fXJMOcr1Ymq/u1a1WjT+s73Fg+drBJQheLKJeCemnlQy/ABvOnWK6NfJ
X-Gm-Gg: AfdE7clPy8lIt4w+Px2u8VC42NKFt+VulV+zKax9v8ZTFWjnHmejQ6QWIWNIi8iux23
	DA+eq3WRxcfnOh6ucl1A86uabQAaMgoCwnMAilCXvtdqkze/jVJfNWj36Vo5EjokS3oFD5rzNOu
	Al82KXsFxGBdwR1xhu1ViiXBLm1s1zEABw0z3vb+pQxn2bZ0a0rEdgOuhgrmFIcy+0CqG0F3qQi
	pSs2aUkDD3/waoL6CVZSF6bBn3+jB8390hVf7sAvXmNbTcQwp919UWNX5jjNZuBon/4bpougUT2
	nbBIOcmfO3M6mDFoVyR7A9dShgjalHFfVo9+O58faUMtC7WYOcIZP8dCfGWUNfOJiMdc6mkkxUk
	e82MLWJjU2TD/piw/BONb3/hcMtHhwiW67dtcUEWtCUSlKefnV8/pHg3YSviSdIeN/kLkB6ZHR8
	s/B4R7g+YWT3ygNLQp16PaH0Eg
X-Received: by 2002:a05:6a00:928d:b0:846:c7f4:74d with SMTP id d2e1a72fcca58-847f6f4dc63mr9274624b3a.41.1783329304103;
        Mon, 06 Jul 2026 02:15:04 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm3445963b3a.53.2026.07.06.02.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:15:03 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Mon, 06 Jul 2026 17:14:41 +0800
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: add alientek
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-rv1126-alientek-dlrv1126-v2-1-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783329286; l=883;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=mcE6Yk5jQAt+Yt1V2EfWURtYiAgr7yrD8IJBZ/7gloY=;
 b=BxvGMeEMOJIcDK1cuZcQyswYfSolbuWRu2T2E+i4BOAKIXIhu8SvtnBgIthxgHZ8eezTIYref
 jRshprlBawRB4rPkB+L3GtuaunnK7RYifBztV8pZ/pbn8jfugmoNo2I
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=

Add a vendor prefix for Alientek, a board and module vendor used by the
ATK-DLRV1126 board.

Link: https://en.alientek.com
Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..914d5a8fd628 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -88,6 +88,8 @@ patternProperties:
     description: ALFA Network Inc.
   "^algoltek,.*":
     description: AlgolTek, Inc.
+  "^alientek,.*":
+    description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
   "^allegro,.*":
     description: Allegro DVT
   "^allegromicro,.*":

-- 
2.54.0

