Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4959B3624CC
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776801; cv=none; b=iHWeZ0NVz6UVmq90mfn9P4Eqm7r3x3z/tkxGCy/Kne4kPL2CwCQ1V1CJZGuwwLWWGy7AaS333J66cxXO3vsXC6Q4D2NbXwVZC+GgFn2yVtnMjYz4RHXbnAvcyAIW/ZMXMXK4u5a4KrLF6Q7lNaNqVgMKPro7B0mdmY1BUg5yMXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776801; c=relaxed/simple;
	bh=7hLPGvySNdkYHchBXO/iRfhwHDLyA7Ot2MizQ13r8lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B94OB+/xm3dAgDkLXBUgk2vX3ll8xLzqWQoMGQPq7f8MI4yga5ql9/1sUoDeltadIvyy5ru9+5p0SWQ9xmFEVvd/7RydwwlwrU5RUYY27OJY9tLq59UMuygBc3vvDBYTgxHrz1PrRl98uVAzxi2jz2bNcDZcd1dM3u56rlDc/uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Penh1sZ8; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Penh1sZ8"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso221569a91.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784776794; x=1785381594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfoN89nIUf/cQZW3GdB/s+JZP3BlCX2T5A2tIBLDC3M=;
        b=Penh1sZ8g9EstD6uMvXuMrTFpdqhixpDTTscxCqnno+nqFFNjrdgiHO2x3uCeX6DH5
         ETgRp+vyuBqw8gbT3CCtbSIqVct51bIPbt/uSfIO3l90YFtf1U4Z2+hGN61OIAxubyhQ
         /ZbSlZFa65CYlEjr34EgUWCSuXtq2L3dUEC0WYuMQiqyonWbYrPpErAAPdYLO/MjOsT7
         wRc5dM+8P5DAOUWwMWxBu5cyxOcou+bigbPfccpxltPHeODJcoQvN1Y8Gi8GJk+zyoJU
         H1krsMRfqgblNXhCby/0l+nNJ/PHdhA44LH6+OXpeMfjDWSzSxDYzE6eci3lfMA/cI7d
         o1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784776794; x=1785381594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfoN89nIUf/cQZW3GdB/s+JZP3BlCX2T5A2tIBLDC3M=;
        b=lcYRmnYyn4RloGaBU43MGcdIfMtSj9asXEjXsa5JUWc0RUU6wkQ8FFOibArjagWrQq
         yXgkHu3FQ+OdW2T7VrhOKBkRGfJG8zGyrdCG7CcOJTtfy4HJH4GLY0PXK6x7x1lGD40Z
         joMSnJ7X7fhOPiQGHs5u7nvRXJkx7YxW6p+VIeCrIkkRdf412xYeK+aHcuamc3q8Hfu1
         GjM2+5tKLBPLd0LFhx8bl0EvL3dYjgYGiKg8HR4wc5yD/3YKMpXNwFi1k7fIf2kgzacd
         R/BoB2Bbh/H5dFdNDzZhvODyPgIldLYioXJdUHLd7IxZu8bnivL92xVhs9MvhUQFeyv4
         WfjA==
X-Gm-Message-State: AOJu0YyemFmH42b2VS2LNQ5JpHFVenXMDVXGLDSrLI1DzyNEkE11tQF8
	nvg839SfBRCKSCiPqWunFCN4JtNDfcKc6LH5g8kgcFBXW1AdPKWkfbXMduCPUvhVCI3BZUWHPnO
	n123VQ4Q=
X-Gm-Gg: AR+sD10lLrc9+WdoL8cQ7s87EFT9mfYS4NvWQ4ZHSEnjqiCBCTxWKBUfhj8gQGNGXas
	W6rc9d+G+H3adBpYyjn0+ydlASKGtttJC1eYFW+V7WVSWLRcv7oK7Y8FEKj2oWpaETaoKIfmc0O
	4y/050A1yVM0QQsSH92Ev5ZUUwWcrMgx5JFfrh/pvxEE/iBwwE8CqFtYHnb1DQdLGnHQKOdrrdr
	MBwKA3FzzkMgelSi9NzX0DmXrPtGd6tKSqYC4JOVdtILT5Qyu+ISXcXH8n+t5xkc6GX8aFNY7vv
	B3E/y9oH6syzpNNMSG3B0Dm5y3TEAe/rvXRk88q4g9ZFPeU0hVyQDgsK6vXd7jiqYItqi5ooK/V
	1Yvgd6+zJ3BLwJpcwfTsIzEnEbWpvACU2Z8eVLEjTUjilFScHSj1x9jdp510bD8JEsbVDyUpZle
	Tj7N0O
X-Received: by 2002:a05:6300:95:b0:3c4:1708:9cd8 with SMTP id adf61e73a8af0-3c44b2848cdmr1324182637.76.1784776793750;
        Wed, 22 Jul 2026 20:19:53 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm13826080eec.26.2026.07.22.20.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:19:53 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 20:19:47 -0700
Subject: [PATCH v5 6/9] of/overlay: don't create "//" paths for fragments
 targeting the root
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-nh-of-alias-overlay-v5-6-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784776787; l=1186;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=7hLPGvySNdkYHchBXO/iRfhwHDLyA7Ot2MizQ13r8lI=;
 b=O1vzPq1Zk8CW30n6MTqPJMAIqb7Q8PJ3+bpSau8MJSsXkYusku5/ZDR+xeUd74z3KaBLq+9uo
 BbFlLYUrm9qApVK/bj/UiNw7tBdVoMs6EgmSzezPhLy67hUj6d64B2j
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

dup_and_fixup_symbol_prop() rewrites a symbol value by replacing its
"/fragment/__overlay__" prefix with the fragment's target path. When
the fragment targets the root node the target path is "/" and the
result starts with "//", which __of_find_node_by_full_path() cannot
resolve: symbols pointing into such fragments silently stop
resolving.

Drop the target path when it is the root.

Fixes: d1651b03c2df ("of: overlay: add overlay symbols to live device tree")
Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index f1aa8574069a..c6962e9948cc 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -256,6 +256,9 @@ static struct property *dup_and_fixup_symbol_prop(
 	if (!target_path)
 		return NULL;
 	target_path_len = strlen(target_path);
+	/* a root target renders as "/"; drop it to avoid "//" results */
+	if (target_path_len == 1 && target_path[0] == '/')
+		target_path_len = 0;
 
 	new_prop = kzalloc_obj(*new_prop);
 	if (!new_prop)

-- 
2.54.0

