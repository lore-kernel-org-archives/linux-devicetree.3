Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7975627281D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781493003; cv=none; b=rNh4iVZo+dtw5hTRGuXqBqHWs09aO8xCaUXsfRGY8WpicXZ2zGP36+GXZevqRIj3XNF3H8KSxDoF3W8bBStCnUvTpTb0ceiCsqxyIxpd6XQrLiWcmkIl67+seJlUpncmm0Vy6ZM0+oYNbTLdam6Zfu7Y7SZU8dmWlRWaEkT7A40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781493003; c=relaxed/simple;
	bh=ljj+axbM+pJuwMhZDIuTvY80JYwL64DThqWuBH7p+gY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cD6qIj88bcX16KofSaBsLoIVPlRu1TC2g5TzaEhl5X2HZfKz7r6jmlRAW/ynSoh4LtbKiTYpuZp8Fxjn9db2U2UNgPFwffaYmRIOQxOnf2Mpn0dlA53KHnZ8IUli+mspPkx76jltLbdBnScoicN3LSP/DHzh5k+LZhtlXG7lBuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8nIAIbk; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8nIAIbk"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0a5354da1so22296075ad.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 20:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781493002; x=1782097802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J36qwc0X2qiNqmkJvA8c5QaVK5MbkzBle392XoOcBTU=;
        b=D8nIAIbk1V4tQfX2JMU5PW8CGtga8PEsn4ZN6FVt3L+h+usQcNX/DcdyMDJTZNYlwU
         4NSCE2FkifVUcrRKEztmXyEsMCMaMERA96R4sTgeCEfqvDZ7h+DCs2yG5H1iYXSlpptp
         DqB5NFDIt0BjQ5g6OkXLJ64XaGNG1xazOrtrQs7kDv5Uvtl9jXeri1g8GQYoQ3ALGL6X
         DKanKvceXWIPN+SysmVHtAO8HviLHo/vZlHKTYELhQKj6iIs63dBtXZxOQGlZ7W9LqA/
         j64o/WuUDtcnKLiSZQ8mLPiXqALm1vYmXsbzm2moZdI/30NjxXMTZv8NIPO83sNCToDl
         lajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781493002; x=1782097802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J36qwc0X2qiNqmkJvA8c5QaVK5MbkzBle392XoOcBTU=;
        b=OGIO7Vra32prBSl1j0T8WvYCFqX1m/GUkhdWN75Aps16eupcEzqMJg1/f5bBIMNdIU
         GE+Aj931YVFWe1ROaKzwG6/eFkzgWmse1KdExfboEE2roAuRFdHhqPloogOOBtTjwMyb
         YiosMktrjT/xORKFaY1H2Dz5ZNoQOz2uyoAoZ2K5Mdzo379aUSYVx0fVaE3zHFLDTBM4
         YWra4ZOEkYC/rzflSVfIzy8ExYiMidM3IDQ15d/JHBbJIb8UwBILAvQNwzwd0N/KIXYa
         wAB3AanO80AeM95jYjQPhgb8iEC8uAgEQ4UODKED3FG0gXqXvCXdyqP/IqES/dVxCQWJ
         1v3w==
X-Forwarded-Encrypted: i=1; AFNElJ+AJOjpob1IDX4OBghyl6qbtCPdL1SmKdCg1j2axqPS8qj3dUgSh+9nF03SzNtm6DVV3k//1QbpP1OK@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7jokV1AE503P6rOGUCF6R7uTSDEDCPB/j+VutRXGfmDnxSVh
	KXcf9VtPn8BsKkOxAt8hTGOTszqX99WmOWqG1CTfwAKoDWcf9c91WXyU
X-Gm-Gg: Acq92OF1fgpGHA6JEyWmaQRRdcSYZ5o3lKNvRVU+JpVY9iI/o18h3Hrqu8jRqGjp5U+
	QRBErxhecat9SktX9fzB4YAw+fEFbW7TlNT74Ep0UyANt4ftxkN9lFrnINGhS6QpKczTb/XfkA9
	8mIz4DeqL2cs6d0CWX2WUgaU83WoziFjTE0YbWVrmU1NsonHpbDiRI8bANv+pmkEQZ0mA1gCYal
	bFWBOQfjsXAXmu+mvR6UVApzFd4Yf8OFz+d/Gk3FOslh4yu/oKVBJGKl+SvfCG9AcmEl0IH+3HJ
	StXULDBAJEujAgtHhfq57taMfo5domiDhKUX39TnC1ohtcNI51ZOW4ttJw/jf13d1yfiVBchJgL
	xPR7UO5cxtnFysm5AGsvyY+/37fwicaezcBi1lnVCs7oiYVh94Pj3o5JmG0I5Sgc1FPPCWeUJKW
	VAGbzh3iKbFwkDG3fWkfJA1/jiMWStZTFcxpbX5CN6Wyh4ShKDNQDE6FsupSXkU/k+XITGnVz1R
	8B0
X-Received: by 2002:a17:903:124b:b0:2c1:6ed:513b with SMTP id d9443c01a7336-2c42ed16cbemr98346685ad.16.1781493001796;
        Sun, 14 Jun 2026 20:10:01 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433460a60sm99211095ad.76.2026.06.14.20.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 20:10:01 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 15 Jun 2026 11:07:13 +0800
Subject: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-lm25066-cl-config-v2-1-59be46e67d5a@gmail.com>
References: <20260615-lm25066-cl-config-v2-0-59be46e67d5a@gmail.com>
In-Reply-To: <20260615-lm25066-cl-config-v2-0-59be46e67d5a@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781492996; l=1420;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=ljj+axbM+pJuwMhZDIuTvY80JYwL64DThqWuBH7p+gY=;
 b=thuqyjgcTfh+c5VjPdx6zLslfu4bUG5Lc0niV/9FsT5rMFL7QRU34dNYoUEdPI6TGOb2TSNsA
 ThsVnPy7nHwCBng3e1b29ifcdFZlsRoyhRV2HUihtKgK/O1CG28Z+eE
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Add a 'ti,current-limit' string property to configure the device's Current
Limit (CL) behavior to "high" or "low".

LM25056 does not support setting the current limit via software, so
disallow this property for it.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
index a20f140dc79a..53ee98e871ff 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
@@ -46,12 +46,30 @@ properties:
 
     additionalProperties: false
 
+  ti,current-limit:
+    description: |
+      Configure the current limit setting. When present, this property
+      overrides the hardware setting of the physical CL pin by configuring
+      the register.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - low
+      - high
+
 required:
   - compatible
   - reg
 
 allOf:
   - $ref: /schemas/hwmon/hwmon-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lm25056
+    then:
+      properties:
+        ti,current-limit: false
 
 unevaluatedProperties: false
 

-- 
2.52.0

