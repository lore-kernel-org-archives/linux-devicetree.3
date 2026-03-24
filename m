Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA2E3F7876
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354897; cv=none; b=kbSrKSRInZeeuq2qgI731tRt+dNGaOcdzZ0QnKGfqwAU2WjIKZK8itqoMJ5hPyKXGi1D1GQEyvGBYivp1qzRDoa0YH1y7/2FWyDJb4JCpWZJW27I3pFFiq4rc+G+M6nYVuDUpz5aClG7zKyZYs4zYB9Yo3qq0m1LHxQ7htEhpp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354897; c=relaxed/simple;
	bh=E+dbXB6xz43NwBCyouCYRd6qQtOa2PkfyCfJxIDZV0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=H347R//tgY3o/VcighJqgm6y46oEZmtgItMNdywpUaBH9hKqieM/SpaXwZhaKoLpffJFnr9CfGF2MliwpKO6dc/O2Vxe2dq2r3BzQJj7n3JOWBlGl9Xw4A0zpQRdp/6uItWjoLn3cxCxjGyBP1zG7AzmXbwpVpiI20WIVLV6Rfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sqjbpfa5; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sqjbpfa5"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82bae83318bso2002437b3a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354896; x=1774959696; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BpCh7fwsnHP9oYgpatK1nkKb8PCIU2zv9cH/KH380ZE=;
        b=Sqjbpfa5MRtK6ZY+LNz5dC1gPin7yLlMmsK47cBI3HVXhrrVkU3A9yWZWkaijdnXtA
         snN5BR5dB2GZV9R4pgzBCC9LBsPLG1Bmr1HHMMFOyIiAzEOr3wwuEsqW5OcSWEYrrC95
         p4VPYz3co72MDRJyxLTJGOF8XtEfbBrBy8BCabJHSAzlcNrD5OybSf0kKHcwclfWadVg
         EiXNSFuqbcFvg9EDz6p5C14/YVfpVQSeHBAvgc1/cJ50QMiCOI2fJ2XZ9frfR0DLhP4R
         lstyRWwPT1HftxvgP3WG45lUgdiTtkeP6HJA0F6L+VeWjVQ7px6c8UdewC0fAmsxXK84
         VuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354896; x=1774959696;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpCh7fwsnHP9oYgpatK1nkKb8PCIU2zv9cH/KH380ZE=;
        b=ZcXCxGLPcMC3ULzPGYMboB+MdrXYqOK1d5yvDBaugZSAbHrHPoD9pWDGohHmnw9nI1
         agqWq5CLqiREFozvcMS+bbhJTBInLpTt25xfHYODaBeqifmItIZT7vqZojU3TfTBMynP
         vtB30ViiqT76e06ybblF5w/a0zMwWb8XqyeQDOK8x1B+iRJxVjRxibH6ngFze4dJJVT0
         mUegsq9VQ5G9a2T8hnC7wKwp4zbc0kouUq/FdAonR1pfgZxFID4Z2e5lx5fiE6OPiQW4
         ZxrFA4iBtBrJJX6UUfHgvZ8AjcGBRwRYpo34081QC0r4ScmQRMk2x1RXLsaNKtWe/+Jv
         Ii4g==
X-Forwarded-Encrypted: i=1; AJvYcCUNAu3n1+rcFzWZWAqWO7rGubuuRJ0TtegO4Rvt7m9kNEigv4YpejRgENYvg87lH1DJTkeuQ/SkVmvM@vger.kernel.org
X-Gm-Message-State: AOJu0Yza+J0ak6lB/29dWb5h+lwnG6rfnuqPGPt+4lVpJvcJHuvQVrEX
	WQbyQH7qcn+Fbi1d7mIwIWc/MPIcCLpshykQpKFMxr65wg1t7CRyllOf
X-Gm-Gg: ATEYQzzQPsFODuxbz+eCXB0hjy1dnO3nrV+SIVAPdbF2IcdcpFdYhJfOxdcT4dfbNlI
	40jcUYffh1kb0qoIoc6OFnmNkkCc9uPDeeVTFcqltdnzcq+Cs10SlYE7Vldb2iZS60WGR9/54mS
	Z25gOr0jng/Ldb6hHlkUg0OFbmiPh00gBYpVo/7UCTYrwCU7C1OP/KPW1DAI+4kqDvZ1MuBTz4e
	PaEmMgi92jeKQjhLTNnkTNETW/n/FC+DP7zc4fBi4X+P9tquJ2f/QMfb5ZNQwoSBrzhm10nZzqL
	rtbGTlhldWqTasxAiwVhIUexaJncz+pwueillnxZXIU0D6mosL4jSCJb1SINPZzCHDxZu2XB439
	mk03+FwlFtEOxN4dy2WKFCBa0AlBKqFVCbbViWHLiNas+YGWOkTw2IrNCSjYkDppFe5HQOmstXj
	pI1rW5KbKhIb+1RbXig3Kv9hJ0ZMHSXJO3PB67GlVPlql0M+TkuRew
X-Received: by 2002:a05:6300:8b0f:b0:398:a440:e3bc with SMTP id adf61e73a8af0-39bcec340afmr13199275637.66.1774354895804;
        Tue, 24 Mar 2026 05:21:35 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443ccbe4sm9904920a12.22.2026.03.24.05.21.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:21:35 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add GXCAS Technology
Date: Tue, 24 Mar 2026 20:21:06 +0800
Message-Id: <1774354869-119736-2-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
The prefix was confirmed from the manufacturer's website:
https://www.gxcas.com/en/index.html

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..354836eb8e72 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -676,6 +676,8 @@ patternProperties:
     description: Gateworks Corporation
                  use "gateworks" vendor prefix
     deprecated: true
+  "^gxcas,.*":
+    description: Beijing Galaxy-CAS Technology Co., Ltd.
   "^hannstar,.*":
     description: HannStar Display Corporation
   "^haochuangyi,.*":
-- 
2.34.1

