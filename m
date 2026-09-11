Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D68341062
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139288; cv=none; b=a5mtyBOdBoJwZIWOCyKdi8Mmc5klTIbJWg1WQq9yUtHwn6N1JQ7nlRTHjCpYeSvDc2h2uEfKwb5CjQJP5gYu6EEUBMlmJ5FF0pp/WJHuLqC/T7+xDspXhPacMXhiiepeVUqExXkgLEgJf0LEAuED2h0PaR17e5yse4jhEkIgUGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139288; c=relaxed/simple;
	bh=6Lz1w8I4jTEAaYTzPTwMJF/7TY7BvjA3HgkopZ1NJOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5OZ+yc9AETse0YQMRO7Ammjsz3YiQjrLEjARbNuvHWvn+8IqY807pNSdvqI89iG6Qj/40H3mD0mV0vC6BFskskNRJ7NXzhJWU+hId23CdLUPyVzkZiGryxt1xZW+X2FowtG+41oWCjTlSl23PNNmT3x0DiKGWlvBzbCQlAC7nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=RyV5Cpao; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="RyV5Cpao"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so8768615e9.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789139285; x=1789744085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9it+H2KzAMUWqwq/e89Zc+T4Ptx2OqaJ7EErcD6+fQ=;
        b=RyV5Cpaoiw/IvztEBWQTxDjF14vseaYJ59YJug4FNgxQHqptFDLdyBlpq/iHtCRmeK
         ujf6Blo07QR35PoPGr3AWnnSsPkDcZizwfL3N+WL07AsC/768n1RDiJNlq0CJssE5DwY
         YHPoeHcAjD2oCsVZ3E4RGNVJ8727xpYDyIrV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139285; x=1789744085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9it+H2KzAMUWqwq/e89Zc+T4Ptx2OqaJ7EErcD6+fQ=;
        b=sukL5X5Ky2EKV4fazjLQ9DzXjp6QZiic563iDRDsKkUpT9OVkX3JxmNefNGHSelLyC
         OQn5463ajmqMvHY3gAwwJQkBjQoPREA5RxJC/GSZN1umbzL5DI4YRRRo7aSr7hFt4cP2
         R5LPa7Yn0eM/sLNtezK6UOv1BOXj8fTsvuJotrfI68w/4geKVU84VhSF5Wh87vVLnHVD
         3iHZ8C0r6EMJHOUhdEd6i/oy6xAkBXABJX+2euw/C3ouSYi/inmJlfBJEl7PmWeUhkPN
         5ihQRz5zKKbaZp06GTOOyzleNfw1YXBmtPMvynEg3fOPdHh6Ywr6a6togcuPhjrNLWVP
         j9LQ==
X-Gm-Message-State: AFuF++kfO8HqPxD7g1UDN69mAb46Lp4dAjpsS+6zqasZeU+zg2n0jV2s
	jUCvbSpF4a1C5vAHILjwdTFMpzFC0Vr7X1B+mBpGxJ9Mt34trudX6BWFhuoBjP6/lAE=
X-Gm-Gg: AYBFou29qozC0yFJCh54Mm0+Zz4xbLYAYiJPb7QbYp6kJGUUxaU0vygM7OTnXGbv1of
	Ig1qIJOIRFT4aHYQB0jYdT6zMViAHDdrUrA3404+wQXkVE3jA66CNHzfK1Lc0f0bROvC/bQr1VO
	+AxlnA1H7l+ZOmu28Z6XywhG37v8lSBv5K2NyLw0NtHzBcQdkNC8ZjV6k4L7RBw5bCOueESONkk
	YZIuI3pveJhCOe+l2UEqyXFLgzs7YAiEpto6PAjnSjqYdzZChSZjNk3Y1aCQ9wf/ygqPM0F5g/e
	vYjG1eXTkD4z7HVGglaDNLdhr8niKoMfFJfjhWlzHTPU+gzgqFeVuLUkUR3QlEZfiOKGUFWdMb2
	Er6Dejdli5FR99ZCEvFO7owlmKoWm77fMaNbqyTLaBoSjvhjLztEVxXVuEvNOgyCm/XozGL/eRs
	ySeNc3RCU4YoGIV1R1zk8Ssv0BB3q1rRVZBg5ifujPgsVA18sb2PUV+QPta7OPZ9qG9IDH6Tc4H
	weQubfLBdUjNNFq
X-Received: by 2002:a05:600c:83ce:b0:49c:fc6c:bdfc with SMTP id 5b1f17b1804b1-49e619e0e02mr53442745e9.19.1789139285211;
        Fri, 11 Sep 2026 08:08:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm108933095e9.4.2026.09.11.08.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:08:04 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Fri, 11 Sep 2026 18:07:52 +0300
Message-ID: <20260911150755.2803736-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911150755.2803736-1-petko.manolov@konsulko.com>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..276d62b848d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -467,6 +467,8 @@ patternProperties:
     description: DPTechnics
   "^dptel,.*":
     description: Guangdong Dapu Telecom Co., Ltd.
+  "^draeger,.*":
+    description: Draegerwerk AG & Co. KGaA
   "^dragino,.*":
     description: Dragino Technology Co., Limited
   "^dream,.*":
-- 
2.47.3

