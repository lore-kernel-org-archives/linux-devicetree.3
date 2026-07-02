Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F65838CFE8
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 19:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020953; cv=none; b=t17JlVzV+0e8H5Ti36A3jO+j0OG+LHlTkQbpCtgDN/y4/JArt02oRFjVnv4/Q8Ss1ZYzXMZD8Itiy3CQz7C/rAwDjyzQ1B/xzWLeig0iRs7W3VoeaVq/LXmIvV4rcKYLBTge8kJy2gQlaCl7NgmYGezbcpEDq0pzM0tPBDqMMrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020953; c=relaxed/simple;
	bh=sQHELRsc1NbOmaM6rVh4L7StNjPdVuwaTDS+H0e9BCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RdMudIQnTh5iC4mbr7EqRXBSAqwqPv6sZxlSm7OY/sr8gs+hbKQP5sTVXgixVPReEs2ic8w5s3vUwoA8ylkACJMEt7R80uuxTQXhFPm9fpIPkb6FDJPixLfb7tY4ffy224poI1cXGf/lkmYk4WQsWROxRM6h8wm39Zt/7pP03fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fr9/VJNW; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fr9/VJNW"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c888c2cff98so920149a12.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020952; x=1783625752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=fr9/VJNWnc4IFcl6z/AQt2zTZJzFhDTY1/u4NfGajNpqDr+EmQO3zEcYdsIp2KkSsC
         dln4Stmcw4wgsIjDqVkexrcdVzXc37SwIDSXwGAKUzntp+4C21jQrjJLleZm7xguxuNY
         X5V23IXxGCTi5NmzR6vEbGcmtY+u2EXowBfzc0B0X50IZlarVh+maWNFeuqURuHlZ2T2
         Ny0pmX+DHXRDN/2RWAeh5vgx3VyX83UfzaMlzBZeQNr+o6O0wmWtFJvaA3h2an8eTzKM
         XYvAgqcOOuQ9yz8u4qbZ/hNsIyESE8BXdRBT0/s5WHENHAO+Q3hMgvA4gwDYb3+bksLS
         ShPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020952; x=1783625752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=Yw/4dlyuRVkMPsdr+GnrsJ0cD/Anwm8caRSvIcYbGJR9LFQvhwD5HBxGqP8pERdyJd
         4kFZa2CdGINBjFW5BFtHMaKa8GUJfoQNUHleVVQH3till3ybY83l7ptN9uapmXm0yGJd
         kpJa4JZkg7Tb6eJr+dXM3axPDnAW34hDACJx9cmXN3+PI2yyWWv50Q+WDf5k1E+0xk9k
         fIvnDeXmQissmYJXx4Fw+8OUYLqMpCmmB/Xah5B/nhHUmd7pOuzvSpch6EkrG+czmhyT
         G3sQn3MMl+E/iXCLio/bXsD2qW9a1ccPqfHg6Of9klep3EX6KKSuuviqwrHHhO/mUdLA
         S3xw==
X-Gm-Message-State: AOJu0Yy8Rk4g0dW5+uhprTvnNhS9AY9hfvMH8uJEE8my/R5ItaKs6h8a
	kzYSCY2CeuAdzX3gvhQuQ55NYg5mW78DvfHkKX1QOQwGkyccRXxshpZ/
X-Gm-Gg: AfdE7cm1T+bB23C15/Jv/IuK0uoWjo/4+q//dI9Z+8qOKi/Im3ooJH5lzvHkHbe3E/z
	maaLae418Sk+qPC0QwOT9YLQWIHBILz+nic0BN5QvQMxbHhn8TfWssV2CdlHVvU1iAkvOBlEGit
	QXozTV+iEvDHXK1+Rnk8BiYzXwru9g7eaGtj/uMErES4xfgP1mY/UgJkhAdfwRJ1tg6CXLY9DIM
	yE71JJ1DgZqkExzdoBnjird7WXm5FYmsYQQzmp0qJ2r4mvfURYKCgZ8bg4Cf0jc6Mq9SVfQjnc/
	mzRlAHk2hXTGt3xsTuQpAx2PCzr7t3j2EuWy+YeOAvCwAckudIDcj9Uc45M9b/V490zAv/Q7Ax5
	JSyKndaTPTO6X0N3L82/h+SglFJN3DRwUzFhEZlnYSZxKO4rftL4SEzN7/0dWrGP+qI0BzcWEKS
	FUCFjAXt60viQ=
X-Received: by 2002:a05:6a00:4f95:b0:847:9745:2f91 with SMTP id d2e1a72fcca58-847c5105275mr6728052b3a.28.1783020951613;
        Thu, 02 Jul 2026 12:35:51 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc188sm1844249b3a.4.2026.07.02.12.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 12:35:51 -0700 (PDT)
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
	Coia Prant <coiaprant@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add graperain
Date: Fri,  3 Jul 2026 03:35:36 +0800
Message-ID: <20260702193538.2195973-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702193538.2195973-1-coiaprant@gmail.com>
References: <20260702193538.2195973-1-coiaprant@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7c..641a37c0debc9 100644
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

