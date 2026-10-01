Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C3435A395
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 02:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821483; cv=none; b=Hbe8LwaIag2ESgmPx58aTCGNAFLiaQjgMNJ8ucSTpuq+etE9CcsElQhNterp64lBWq6moKxKMfbb3oen/59X1bd06zdWP51gcyOqvC8laYYehCDJj4DOzRd7HggBSZ3pT8JIS9QxeuODiyn2+WDuJ6CHnOg3roHtzXNLNrAIXwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821483; c=relaxed/simple;
	bh=qnoog98K51vnfZCiv1es1iBsnXh8XTJszGX/9tFR+MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CykUaP2vAKAhWqYjpBEk9GlDQO/eWUSlkTSdSPapS5q18DcSqXeLt2qsLarnjqqpUrCieCqdV6Gy+8ch+BchZsFT8eppyF99LHoFZf0Gn9X9zNN6yoLtpkecVqFJfhOPQxi1kP0dUsXjgRmgZJEXAyflTHqk8OW5PIQSWmc9Yig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgyNjqlw; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgyNjqlw"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so2093202a91.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 19:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821482; x=1791426282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=qgyNjqlwMfriyfG/pXA1yyu4aRLIbYz8YN6PgjmI4+eCNXk0hd3JnMwISvTpp8zrBs
         1ujDQWGXvOzv34wJfa+toML/DJTNHMDQw9/SdW/wYLau+eGvIQxUF8fAGUwQcxQy0SYM
         XJZc25wse2pUF0Yrfbr+k6f0RNS/JWs53+VXXxil7UixRBag2KJwj3Y0T3eAaKKY391K
         2oc5HFiv+ypLpSn/W6ezsPseSDdH1/4u1r3MWFfjCYdD6kmq3QPERUZS3Jlw0wpn58RC
         wMw6H6QbWBCQTWmRBJTzfIrBShWHr+8Lm0sOXIxj3CJo7MaL32CSGuX/fZTlBRH2YbQX
         CBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821482; x=1791426282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=cekhDi9rJScA7lNISqmMq8L22d+1Ix6hj9YGs+Wq2AZQNTjPPnszTxdaiWbrcnH+u7
         mOUyr+0NelHcSVnh8V0VISJ6SETzYeS69N7frUI2i/EdoSVo6A6aY8D4/PdLjY5QL9dB
         wtCJdVR1zlepyxzuYSp8M0p4v9jI5Bmc5+StCBavDz5akup3dUitqZIMsFDKUBlo/fAB
         i8gb5MD4T7eRqQiNHQlZIFdsJNKLgXp3yrdoZNi9L90D1BYzzjeXOiLnDL21Mpj4poiO
         gZQoXM2r7nsxGwZ4M64ucduozMxLh8HjOUTsfxvrJQvJV1dfcGFvcVtM0SCHDlAHzHXB
         HLHg==
X-Gm-Message-State: AFq9FYJ8EWspE3BuWmJnJD23UR5eR60kZaLLld296jpSo7vNXtpmxgtX
	h+KAt86FrXu8cxeJ9bgU2ihGqOBdays4h2kH0nlnPTIQpbLK8vXl+idQ
X-Gm-Gg: AYBFou3Ans6/ROEwpYXdunqM32IOqQb9rzOf25ICzyefKh5o/nkRR1zIVCvpS3+cMJE
	UNJ44Maql/EOfddo/Hl8iVAiEA3SqMMp7ffkrcnS1yAzqM7DQBin14faFbPESJNR/GJqTkoxkbX
	sEFllwF9PNV4T6YO7PqFPxVwj4UMeuprWNh+Tw8gcJeCCRB7YJFvgD7kxOs8ZBxVtR5sqROns/0
	AifmWvBwA+JUFgMHgo7kT4uSqWbN3NtcRm1sfB63unNEHjIjXcSBLVY4Q4mMD4Jgur5q8xw27Az
	lLSg0OlYwdFoyRngudUv7dOvY3sM9TE4kJq7XAYZmIFNs6an0SA6MjVeUyEsaQNtoJV+XOyIVMN
	p7djzk8/zjOA5dzlsk3soJlefjTBpziptj7J4nSz0DA3hdXlzSJ5+2F9CfWBZwzvjUGHSn7U7VN
	IgFIzn/iYPIjf6nTxWqrDYKnfGnVrsBbyByGToqCKULbmPdnoJs3p+PhqsPbEYWg==
X-Received: by 2002:a17:90a:ec8f:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a4d0f03a1amr1882204a91.2.1790821482200;
        Wed, 30 Sep 2026 19:24:42 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:41 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 2/4] dt-bindings: arm: sunxi: Add Teclast P85T tablet
Date: Thu,  1 Oct 2026 10:24:13 +0800
Message-ID: <20261001022415.913959-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the Teclast P85T tablet, which is based on
the Allwinner A523 SoC.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..b9c2268fe 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -933,6 +933,11 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Teclast P85T
+        items:
+          - const: teclast,p85t
+          - const: allwinner,sun55i-a523
+
       - description: Topwise A721 Tablet
         items:
           - const: topwise,a721
-- 
2.55.0

