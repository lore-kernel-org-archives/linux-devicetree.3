Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65F37649B
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785097021; cv=none; b=uA38nPrACo13XXJS3NZHAN9UnX4rbbOLoXrJridJO3D9mM1w6bSG7tsA3llvI0shvq1srGZEDLjFs46ucBILc2JRMTsUmP/H3ppaX6AIjsGaFl/EUMIyJIAEzWIjim0pyPPfZ1bIU+euw6in0qRjVoVZ3paTushAAyif5xriXSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785097021; c=relaxed/simple;
	bh=2KJouo00OcymNmVXj4PDqY4BNM7eGTi4cPOPAuuvBQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKulLCpAtTZsb+427TjBi4iKAOdnTA5nI2zdk8GdbGEYbs4BNPIKwNd93qp3J0nVfWNisHJs1IL3tw6RNZWLtiYfYwxPTgDQd0bJ5yJTntr/enQcxuhAzKCdNIy+mASvtntTM9NXGZ3Zchw0wDixK5gH8rXNFatV6zEL9jsqN3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rhws1bK8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rhws1bK8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso1006720f8f.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 13:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097014; x=1785701814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=Rhws1bK8ML2oDjU6CzQepEE8PGq+++Mr6OEbS8pBfwo5/Fp6iVBvDHp5vHnjmwvd2I
         jZhqGSwardlffh/6IEtEdt+MUnljV6qsbiV5d3Hv9T0HUCcLzKM5jpvzSbfkNZnnED50
         u0E1GoeZJUi/jP2qdC+Tu8drTn78OrM1RJfOxaN0hOZSgvhqljIr41k7p9A2oC+gegV3
         d5e8cEcZ8Z7tREPt3mHUIy7thsm1eakrdhTN3kmKC5NaWbBoRfk+zijCX5Mcik4vtPeY
         /n7dnJP/DeKUDmr6xeuP+tt+rRLtyJblap5S6xUfPAP5fKD1QKORnG/rLRxHZSfRl3Mo
         sqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097014; x=1785701814;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=fZZfiH3lhQbm2rLQHlCBuYREpG8+zRWp4MaeB2aBdlGZAgWFJgQE76aAJPFi5Tb4z2
         mC3+RSsmWGncoGwqCJswe8aOFymrQoKaBTVGhSo86kvgYep+NEKIa4UDVxN/BC2J5G4a
         lnVwtQGj1kDnljorON0M444EKS3ODfpGRA7Z1/BfdwhtCkS5hn1QSlfwcp/CGgSSL6+j
         Ohnx5jJmqEFlUe82wCwPjX56JTCF/8xYlAuII7n9OshyI7eF8YRrGRf3HoA46mMCEg2u
         7c0mW9rx8Uy0e4//IOdsR/SF8jGjBXuMJz0PsSy+Cwriw9ER9P0Ib74NupPTB1Qk3Ov5
         fbBA==
X-Forwarded-Encrypted: i=1; AHgh+RqH7T4aTgBQwsIrvlZ1l9WmdQvL9SNaz9IkE1/ONVU8uFyJfvrd2isOYAllMmeZL691vESon6/GLUux@vger.kernel.org
X-Gm-Message-State: AOJu0YyHQsHvsVakeSrA26jG9K6mqy0/ZhG1C1QOQQSwkUyhSTIfwaMV
	mZldq0oElwMtySCAPGNmIsrBeK44GYJTEB+thPjMgyiZmD69ClwfPtNq
X-Gm-Gg: AR+sD10qAyze8WoJKxHjyfQlZdac6z/xAMCz83BNhx+cBV9aYhUGwHqqrYzKe0tdGtx
	31ikwlKPWAWHrhSnW/l56m5To/dGr8RuPhqkzNQwHx+P86CScuphJK+bliNOdjUqjoEfNhW6ot3
	8Ab3lT0RkMcl3zgxafEr0UwVeZc6ZNutjmp/XNlR1i6e1773zwrHFEdkQh2+FjXauVpCeJGtgSB
	z9P6w+HTyA3DUnz+Eq8zCvGLUwKK4s6cml2rP7Ie7DvPu2z/brpQqimt/zeKtdcLZyFrylm5zl8
	ocBtZF0SqEs0D9r73KkrBxCQTS6LzqArICkUQGzYB3JxNZkufkrLSIsWBTwVqP8bZNIq4eST7U4
	x8MRRMudW0hhbOjQ/B/0Ifnsms9cVO1t2v1S4M+RtgRkhJLrMlCOMFpoa5oqnPpHIlFA6QiCCSO
	H/MVlW/FhNGt/+6FXDweOwhJf73T4anjHTs7AmMg==
X-Received: by 2002:a05:6000:22c7:b0:47f:9022:8531 with SMTP id ffacd0b85a97d-47f9fc942afmr7506796f8f.22.1785097014274;
        Sun, 26 Jul 2026 13:16:54 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm43621117f8f.20.2026.07.26.13.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:16:53 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Sun, 26 Jul 2026 22:16:45 +0200
Message-ID: <20260726201647.264108-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726201647.264108-1-robazzalberto@gmail.com>
References: <20260726201647.264108-1-robazzalberto@gmail.com>
Reply-To: robazza.alberto@proton.me
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards. The prefix is needed by
an upcoming board compatible string ("orbbec,zora-p1") introduced by
this series.

Link: https://www.orbbec.com/
Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..a42899bd2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1251,6 +1251,8 @@ patternProperties:
     description: Option NV
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^ORCL,.*":
     description: Oracle Corporation
   "^orisetech,.*":
-- 
2.55.0

