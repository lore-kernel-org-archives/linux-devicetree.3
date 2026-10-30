Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364641;
	b=WvY8Cwe1w393sCjC4xpg7ykVv4rGTNqo7mbPbRNqJ36RvxqlLXCrP1ANyL2g58vAkgDt
	 Nctfra4gP8y91+j7wIXk4d0xoErMdamPjxMvunCmgxaq9DrhomK5PCDfByjQvHk72zHx+
	 TY28/OyCH8Cf6y+2OK0npPRhP2uegjNk3D5abG4vLOHFfw/fnfRtzO/FvVqqU6YqSYoAJ
	 46+YsUCfzxpx+uGk1LFb/SXjNm1Rk6zdGxPlEwLwo8A7+EbzcQ1XppXVT4mrXhByFxXTg
	 iHQ2dLnT7npNBq4qgldvdXZpo+2jnQkkNeQ2Fkk3JPuYqBEpDjqyRPHe6IOS5rv/AAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
	b=Og4nbWRa753QO5oqZJgKv5PTfOWo1Mey9w1APPVYROAcVYmivge32KsAHXruJkNBjtsQ
	 +SHmArI1O7a3/u6yH9w1Z3sfBvPf0SxggqA4RIzWSIT0TbZNIMmgH9wGxLNJvjJSNrw5W
	 ygKDmBNmloYUe7zB/GVxUUImgStUizPiayPGmkcKSkJY26ZUXXcCCjFhKCnzjjD7ClZbr
	 zXPqRnilnxbA1/sEI8emJYCebswfekqqhHaKsh3mYUtZ0Pm/fmPUm93K05yy7VXHX3/rM
	 QzIz+/1jFi4PH9FMVWF1HR3ZOVkb8bhEEcmwH0nw+Myf7y6hcMyY0trpbLuB3ISUFpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyxfvUBZ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3764960A381E
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3764960A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyxfvUBZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso5789525e9.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793364640; x=1793969440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
        b=KyxfvUBZR/SWaeaVg1526LVJlvn0bFpKNqn9Y8myiDwNEY0JoawgwcKkCQizSuM9h9
         EjI6ggQimnhzOv0MwhdujWqcucj0s0KKItbfo09LT7ip2inPR5XXTDv7C2qS8tIE+B0p
         yUyfplcSyfMl2N0JixNjHC5NYfR4Y4tvTf5b4gJ4QmURUSNWPCbRK4xxrzdiNSuNq3XR
         +ZSS7f5+fSCk2g0PzKOJ5lCyeXH0MU0+pqVbFw4QRKeU0nC575RUJexjDoAul9ij/2eE
         MAMZu0cEhCS+R5u+B/zkkJD9Pz0wNT2Sqp43OlWX2IuAvd/Zoh1QYIsuhCQuP58zPXpU
         46Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364640; x=1793969440;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mQqyYE4c1qwaf/1U8bOHUwTa3uH7ZLUdP/AlkoHge5g=;
        b=njl+JtDUlVwgZnBPl+f95UpyGptxJ/k57ebgXdSMoWjpp4s8C2uNRjtQY5VWarXBaP
         7ltVGLEp2rex2Y64St2Ujr75uYVXpxyvH6lag/Wct12QrJeowe6GytkIfrnGlDtUbZ4O
         2ACvBqxVNnyEbN2Kgh4fuDowyj7+tjLEa3W/C9lIrclFimf8p9xGVNZc7FodRgFCAW+I
         4aj0VHJYdzr4ZWCzU7Lf8L29iJs/JzjseIOoNDbCwKI1mNyaL1Yux+SSlXvZoa4hlmcR
         oCvpFgH+O7QXRnE+XjBSmetaLCMr0C9IuMUDgTx9GxQVA07o6Jw3uHCdoOe2dNXBd4G8
         AHeA==
X-Forwarded-Encrypted: i=1; AKwUvBxQTnrfQ19d7Nng3UYT3twWtEzXRSwIpBz2m30v8DXdNJuw4dltxZBOWIDbt9pMhYDG7W/26jk6apZv@vger.kernel.org
X-Gm-Message-State: AFq9FYL56ACOyMD6GZHP84IFDurRa8plAomLLTPOl/mqsqIWAlqj0XGU
	5c9F3nLfoBrscfnDL+SxCKOHMwpajdfT45i++yxvUJdxDoZNNGFGN1P5
X-Gm-Gg: AYBFou1GjsnduztgYR/HdV97j72wAlTaAIUkmoKNxg8dUGE4lbmfXiy/unx6rEpZizI
	Zd9MBurS+dFfUKTbCmgvPj94D+6FSefGlUczzexNf5RdxTjH57PW/wfqqJ1Ma0oK3qxunjuVPvb
	XTuR6C3pbt910pc3bpCnpITWVERT90V658V70o1aJhG+0GWMd0+0MM7gUmykG9KfObQ1DJOvOWG
	5ovwHGF/UoZmTjhpFLJGxbJcHVZ8IfgpgNwNNW2+R+bjKMaYDeKzVlGo2JMmHU4WCsCwmlzkviv
	yDTukhBbhdslNbylgSFljQWI0uUYDvCpnQ4vKQcUKSLygBIdM2o3uZ26l39+Cw/iNZfKxlFVthX
	ETHMuDNxna+vUYpQqNidfelDMaetcWShrZM71uiDk+074sEZ47u4eqJ79mvp53mwtHxzmkobO+B
	/anV/HtsHyRiOvcR5DfTarXWM3+tXXWYMlwcu0p5agVfm0QNuUQ0OzIy9rI+/N27ewW4jt20FVT
	uLxIN+WBjS/brCbP2DpGHw3zbsv8BBmja3cHSoQz8pViXrqALMwO8HFySaU3PMS4Dc3FaePbeAx
	bbWkiCeuHPpl/GcyywYKdkNIOYojeoSkb2KAzQ02HfJCTpHmLV3qFbbMv4tslG8sACDU0YOizDG
	zykyZjiWkJOYsLNQcXu50zdbFmKXNwZ4PyBvM70aDG+eaEJm8thtUZG+wJ4wZli8astW0tsbc1t
	8nB+V05eNT7VAw8mM=
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr49842075e9.4.1793364639460;
        Fri, 30 Oct 2026 05:50:39 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm93079855e9.3.2026.10.30.05.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:50:38 -0700 (PDT)
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk@kernel.org,
	conor+dt@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	maddy@linux.ibm.com,
	sashiko-bot@kernel.org,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH v9 1/2] dt-bindings: vendor-prefixes: Add WatchGuard Technologies, Inc.
Date: Fri, 30 Oct 2026 08:50:20 -0400
Message-ID: <20261030125024.612396-1-lefteris.koutrakis@gmail.com>
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

