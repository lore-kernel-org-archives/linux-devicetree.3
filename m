Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1256E30C617
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775463222; cv=none; b=SWNPQIP7h1Gm/jqzCRkK7yDnHIOsw+5uz+XYNfihRBd7j8sK0zawrEmQvzaJQydPyiXpO+5KxuDBv7d6U2WN75NHRJVN9CSdHoe41A9gMoxlownWMrlhodP7txJfdvw3UTFhdWtkw66SlVNMB3dQx+2yRfQyT9QtqT57GHWkQ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775463222; c=relaxed/simple;
	bh=er0ubEXqc5SkXg9dCN53ES8cWYd71tCmkqSVLbDGaBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFvvG1X2iC4L5VxE7lDUKoIsdm+nC6W5BMMYIPvcfUd4/GkWdT4nt22uw1IilHHNRBPZOCyz+U3q/FbffOR1vwkjblGZrVBkZ3fRXbyBorGFM+wYhjxIV6tzV6FBbyw4rhw/9maUtbJ7dyjZawFFdNRaAQ5uot7OCCjYebK/fHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1aOGBzc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1aOGBzc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so3659635e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775463219; x=1776068019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iew4XenhKOLgBtnmmbivz3Klyz0GTJLb8N3yaWb7V4k=;
        b=J1aOGBzcomMsCm0wnmDI+4DsR2CFetO5JspbsyuQPCyhB67KM3ce/RqcjEM2DjoHvG
         VgogXH4wq21Fkxxgh1yRVKll3RyNEkYvJo/SFulgrzkRSWMO9l9ZlGnaNkwLJ56CxCGH
         ufvfk3sE851MsITniQ5x5ICNNiDcNlx2qS+lYKpLhvgP5AgAU6I0rRhKSOYhij/fCSA4
         zU0pBjM7MoEqjjTVHO5ZYHC6XdA/c+j/T+bSCBW+jRpMm4bCPdK+g85sZuMxmEv8YTnX
         72mKQkAyxtFK2L/FCmArLEEnqDb2e6nQ+ImSdrkV0MPDH88uBAq63pVbppFnTGo8k/dE
         nF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775463219; x=1776068019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iew4XenhKOLgBtnmmbivz3Klyz0GTJLb8N3yaWb7V4k=;
        b=VkIj4lGN9vrDI6jK6djmz9OJ1r+9Ma0sYY8aYgQ1JlMV3bIP987xVB6Ul3KPoQSu+F
         o+QGPJbQ7fH8y166qP9KsN3qj9H8P8ReJgcorF5/vwTj7IAFSeXQfE7BnPG7dw9LlMsd
         O0MSMW4VqpjZbAKCvkJEX+XVtPXp/omYEz5P6pudxt+PtzceiGt1GMBTPEWuKGb0nfgI
         iFbwM8RSv6S/KbJZBXIXlauir92S0AuF0JJbwcTnbk3xlVfyd+7bNc9ry2vFh8MqvqOG
         l+0zN+o1SOvA6kINGwQFnb5rnPnb0E4tj2RUDj9Qln+as2oNAJ/KWL9zQwh6+FYAh7YW
         g5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7Sg9rWRz1pXpTrO3kJ6T8ZsFoO4mjFA3ayOgzyTa1Rf/Un80kyx6mRWxf5r94TQT+9QufOINyYK8W@vger.kernel.org
X-Gm-Message-State: AOJu0YwOPxu1jou5nJ+tIDvvAmSyu6a8zmgvs22jTbLm/5ddcy4EljD1
	aOcUpDnHeFBR4UDaqYRm88Cxcx++T8o65B0A5DJTdjlrtql705CKbzia
X-Gm-Gg: AeBDiety5cxz3vUPbazrd92Os4nUsnpW3BqjgSjER/A9GSinAJfP3yEEIYkfAHdfHaI
	/cVa3Xx/6J0tX5X7eQNlNrA5Npp5FJ8zllTFon5kuWtr9/PyWWJOLV3ktD3NugInY+6+cMvfa/X
	0Az+nqrb/ocqVlbQT8ZuRwMTe6GgpUwb7ntVhAimscv/qQaDN7S6SqTBRwxELa0XCqCRn83AnGP
	HzDdScqwyHqgda04+6kIBoXPX4uxotAzcUmDbYL4b4vkQh6cRsvNEEcqTw9/BIIn6xjRp1qdO6H
	LhQteeXxcwfapO1aicDM6yrhIcjD3app112o+9IIjy/txtHtsUzYqPKkoHEboi0YfKJYJycWhyN
	6vegwWhg1+l/KBnrUceuA3gh41Nnw7sYN+NSh3fAT7eUxofu62/i70E8QLoGvOm2kmiT7FmCU2z
	lAggQSiLgElDTE
X-Received: by 2002:a05:600c:4886:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-488a797f2d4mr49829105e9.28.1775463219396;
        Mon, 06 Apr 2026 01:13:39 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm39408519f8f.4.2026.04.06.01.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:13:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] dt-bindings: media: mt9m114: document common video device properties
Date: Mon,  6 Apr 2026 11:13:30 +0300
Message-ID: <20260406081330.30362-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406081330.30362-1-clamor95@gmail.com>
References: <20260406081330.30362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document common video interface device properties, such as rotation and
orientation.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index e896f4db2421..2b39614f5cbf 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -15,6 +15,9 @@ description: |-
   an I2C interface and outputs image data over a 8-bit parallel or 1-lane MIPI
   CSI-2 connection.
 
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     enum:
@@ -90,7 +93,7 @@ required:
   - vaa-supply
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.51.0

