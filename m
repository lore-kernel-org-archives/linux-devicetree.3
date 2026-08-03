Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BEA3016E7
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 02:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785724901; cv=none; b=uSDX0rVhvuSCmcvWOK/KfgONpPmg0WJc8DzcK4n1v9uQch9/CTc3YdjX6Av/qwdTsFuSNlKH4nxHA1f7XWVh1nX9n9VK/EhtReWEIl/YAj05OkG9gx2aWr8az0AbFp/D42obavb0kK0Rf4U8Xf7WiglTGtQI/DSj0cjL0mLrwwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785724901; c=relaxed/simple;
	bh=zIrrFuB7x4ex4Jv1JNXALjQ07Vk9xYw7VV0Zi32eI1w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WX9WJOIoNzp84UU3yVtvc1lg8NzIsjEoVlOwnYDiOLU7SUuUzWgGsaZSayD4DwaXWto2UCh/O8PEf3GIucGZWUTt+5RqrUY5r0tFmktNn8Axst//VLQNMVZpwAvGmjsyidaKfpDA0em1f5LcDwVvkzOrjfqsgF8Ejob5LuYNCpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nB/yvzXI; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nB/yvzXI"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d02b4c3601so31693855ad.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 19:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785724899; x=1786329699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCHwCKyWw8sq72dejSTrSVAee4EJg7rmMPvIvja2B2Q=;
        b=nB/yvzXImkLOEDvp/LPr1tKtecByc7rNZCwR/8djEJj3Yl8HeKlf4jSAnZOG8XKPGK
         0njTIN1C5Van4bjliTdWzdghj7CPx9ZGv817T7uSN3vSMBsAca0HocV36u+dsIibfQab
         nf1aGDlRpscOyN+dAtnHHrZVMHqj+c1iejwsKQqvtuJ7mdq9howysJXb1SwBnCd1GP3w
         DgCcexBkTk7xnOrtTZPRUoobHvPIqdgXUJQyDGQl8IJ5TbMgJfbmCpq3jCuawPsd3+Rl
         wqvBZJSN/6YtezoZmeGwv1RYf8j/nMHYKY2u4hdYr0VFkJlrf8xVM8/Uja0W11hambDw
         hEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785724899; x=1786329699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCHwCKyWw8sq72dejSTrSVAee4EJg7rmMPvIvja2B2Q=;
        b=DuMLC5VRqomdervktXNa4sOgJi8XBapqutyE+G1sQTk7ka5QjWasNjrvzGw4RrYI1R
         a2BPxZyyV+jYo06scwss6zl8pentmAT+VVxhzDpyNz+FRzTJwWDcxa4wMJ8dJVTR8QbI
         CWNebz8Ft3YdFPBjwKLpQRiYIs82XLru6aOHP120gpOyIyF8eWXRZIQ3xIQ5qYDo+dlQ
         4B/ha/d+z7lDMgNFL6Y+Lv1qyMLNZhpBUv0MTwrJkbxsn7p8jJbV4SEyVZlcr8ZjIoPP
         aktrSOtzfRBfd8GOaXceVePUc2oKeipZi5ecvZJ4gElzrMXfr/1MgCC2HCTX+e56fnqb
         A3eg==
X-Forwarded-Encrypted: i=1; AHgh+RrGPzsahUilPyaZtrYHey2JnodpBHOS5DDATXj+dZ+Mli1b24FKnLozgpSU7Nn1U3UNajLZ0WZe6zr6@vger.kernel.org
X-Gm-Message-State: AOJu0YzRJf9BHHxomB25tVPGGq2cy0QL5r46MtcmK9ChYa+OxP/ZLfdb
	mb3NZDXvg+lw3FXJ8Gg4FkLzjul5biFbmZVnZzUqzxu2IQXtg2NEsB/u
X-Gm-Gg: AR+sD12gocZPQeU/6RdiF/WezDWxGUmQMszPMkvGIyM4JOR4XLEyHefecgXggjcOIW+
	tjBMNX0QNV0OMr9lOANcjmsZmdYMUJyNanJ3aoVZVGTVg6rXLd8QbhXh4PP3run4iP2LC5BCy9V
	s9b4Fb70glmNYeoGGmrU/Dxaw1yy1On/EDTDzkvgxeFCVQ0NA0+czus3UUSlveIF47vvKWKQtvZ
	/HXmo3sqLEJuhys3qWBtvWps92yxGJpkb/Ue7Qd/kre49XBv2gHc8SchKTzYbnvgiHB4RqTyAOM
	TDoVDrh28qS51tXEoa144vIbmtzEhgMO3nDGln2ZjBCWU9FNcoF6zPaz2x0kKOmzE6ppoupcllT
	pC/vTfe/WHSZ/frLV1ZdidOo2D1X5m6qhwjILWC+U1epeS9LwgbCpDDBpGUQHpruyITxn75lwBz
	zA9aUht6Js7nSWOs7HERl0S0/KJ6LhesFq2PHMWbGo4+5yePQ5o9Kg82C22Vr4WRgEiQhdovB9P
	gsamhY34tAQErFRunNjFN7y1qA3KmQkuBJS5wIh3Izu8gOneHY=
X-Received: by 2002:a17:903:252:b0:2cf:b6b5:9cce with SMTP id d9443c01a7336-2d0524cd574mr99284765ad.46.1785724899298;
        Sun, 02 Aug 2026 19:41:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5abaesm30827645ad.27.2026.08.02.19.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 19:41:38 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH] dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip selects
Date: Mon,  3 Aug 2026 10:40:48 +0800
Message-Id: <20260803024048.1641756-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

The generic SPI controller binding allows GPIO-based chip selects, but
the MA35D1 QSPI driver currently supports only the controller's native
chip selects.

Disallow the cs-gpios property so that the binding matches the
functionality provided by the driver.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
index 377ccf4fb224..40965ec5163b 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -33,6 +33,8 @@ properties:
     maximum: 2
     default: 2
 
+  cs-gpios: false
+
 required:
   - compatible
   - reg
-- 
2.25.1

