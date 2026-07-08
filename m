Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0794C3B8BC4
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522156; cv=none; b=MMAHxvQYykwLXmjBD03U+2QB8h1HoH5dbSZ2ZbEZei9Yzg1qoQI5L4hZh4dK173DuJOqW//tYCQGZQi7PaiiEqqzLj3MLbiEOGfav5Nb+5llm/GjOXHdUfp3ZAr6vtx0EJXbOW5Zegrp8eJfFEgxJkiitSfjHqiluNeSelu0doY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522156; c=relaxed/simple;
	bh=RDZWQZuinWfD+cU4EhZ+Qa3Kim+iJSBL7wAOTiV77wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9PwUWIDI14MwPMe13gwXUwxYIdq+Mcxuy+xiZeCQkCnDNglHB60TbBsdorBAmW4IXsBN4SeSL2WnY4p2o6MfTwOjRXwz5Rp9VCCExKU+19Xe554WSjzkW6Y5EdUhy/KyOqwUsZllsazSljh3drPxP/7EjVJr0ZoozmiMFQCZhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=g2ze6OKl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="g2ze6OKl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso5200765e9.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522151; x=1784126951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5o9RlxsE2MKhjLVDUh9pAaiwDabzRmi61sj7zjZ8Dg=;
        b=g2ze6OKlRmnp1Y98cN3MOkS1eSvAOpqjk7KdREdQcaTURoga6uCLx8D/+cwH4O/JBQ
         BuUTNpOturf7rtRgzhuHlb+6yInPfb6Og16uV3dJmjUAxF3HG6vPkgsjOWfHRGgxNoWa
         EACzOrNdtQYmVZuPIi95A1qbZz4a7vB0NxfZeyDWp6B7NAnLjUCKOfPewkCV5cwo9uhZ
         Aw+CnJcdiFeyzz2+Blx33YzGfoGDj//DV/fQ6nUmfFm0eKKLURWGnnR06kYellrsGbMx
         6vAdespOq4xqgIQKAN/DWzaJ+T+M0Y/wusbM+UCuZrd+FERFFRMdONjjz8BSI7O/dgVo
         OAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522151; x=1784126951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5o9RlxsE2MKhjLVDUh9pAaiwDabzRmi61sj7zjZ8Dg=;
        b=ChEaashGJFGdMuezKocryP/Ql3lNyqkmD7AAyz9RFpBgVIW7sTlA+bTUUv+ESMmRWV
         hWXbwmTwwiIH3Q0eze2TW5fd9CCEpmPjrh3OMOVYsYrg4LnUGVyDncwv2OoX2Vg+t5S3
         WBoWtZyRNTLgNYNUux/bYCFjKqgJHFVpzcDGnYnoF/M6/inmeqQcm84chP0ZLDadyg/D
         oYG0jb6FGcHbsQVpMjuqKWR/apM9igo+IIRCDVNKnUrqNdvvPMF5KWRTc63FrUTS4QSd
         k8N32R4KpA0PEnfl6HhhED7Eg1/mUNy10a/gL2V+p6/HgFFFMfrSWkpE1otevvShyo2F
         N58w==
X-Forwarded-Encrypted: i=1; AHgh+RoeFmPz1oUR3is4nOce1Q407SYJ3ldPy4jFP5odfgVwBXMAd/74JTTQb1g6GuaJEKqeTh7Thqwl7IuA@vger.kernel.org
X-Gm-Message-State: AOJu0YwFNQ+NOpYIQ2JRshsR72tU2oTLWueEq4SdP3cdYohbJEn7sMC1
	inVSCNpsJbcd9vTnrjIWdcYPHni/4Y1ZWFkhaeapFMLzproHfOI/MjkS1rI1EXgjE8Y=
X-Gm-Gg: AfdE7cn/GnWE/6Q9U+P3MBwQLwBVsxayrMpnuN41KF7pWe3mupKVMEP2zvFw9M3avvj
	2pWZTi5wu3SHCXm8lcfWzOji1q8/VZoq70VvWe4pzA69CmuyDqGBo9k0z3yOpHX0lCYrpQrihe5
	AOknKcX7r2zN7r0fU2dns1hFtMOPY62n8esDcM4UqlwAefOJTNF+ypZ0/C4k40xvOViMPYeuJid
	mySOLMS+ayuK2Er8v68TylwL/xln/wKi8q8dQh0IO+sfllRcNC1jKE6Kt5ftx9LozLtV1rWN3GZ
	EYJ0SXtP4a8OhQgG8A5lvRCcGYlMXdcB8/vO5gGwjpJH0E8CxCjccmPfQH4REhcPwlHl1AQLYoc
	Yltnrh3rd4Yg6BTeLBn3K2kfJ6sSP4f2AIpjyb6PZGaFNGuj+5eU+I8dm6GjMwk9jyYoFBlQGtb
	JjtbvuVbaMCIm7rDJDKcgLhfLczHLdhuRIANxuDMkIWVujIKSL4mdGaHTYsJyzFGM4
X-Received: by 2002:a05:600c:3e0f:b0:493:9cb3:53fc with SMTP id 5b1f17b1804b1-493e7e84c21mr20262795e9.11.1783522150858;
        Wed, 08 Jul 2026 07:49:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:10 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:38 +0100
Subject: [PATCH v3 02/20] dt-bindings: media: imx355: Allow 2 CSI2 data
 lane output
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-2-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1

The sensor supports output over either 2 or 4 CSI2 data
lanes. The binding only permitted the 4 lane configuration.

Add the 2 lane configuration as an option.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
index 6050d7e7dcfe..d9cdfda699bf 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -50,8 +50,15 @@ properties:
 
         properties:
           data-lanes:
-            minItems: 4
-            maxItems: 4
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
 
         required:
           - link-frequencies

-- 
2.34.1

