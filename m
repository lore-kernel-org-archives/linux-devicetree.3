Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645533D75D4
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448835; cv=none; b=COGEstR7s2q5THsbeg/pAmM1dycHgyRHBjgdmWsRFZ8Z1inSuiwVfbAbSZccPJv8MH62s9TbWAPG3s7+Zyk+2Znl6Rx6vlVJtuwpcnuRlLjcGN7SEETpmJ9aAUfJ9qHCkkyExc4Cjqz5sel68ZSYmhDGomFU9sZOB+nHUR6nx40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448835; c=relaxed/simple;
	bh=B23ResA4FCbRNDuiKc1eQnBqPU2ccGIETUQQXvU6O3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpXA2CU6QQQm/PdOUfix6CLXxmKNZokxcFE2GHssOZYgWWoMKiK02+QWTAe6QU8h7Bm7OEcWp9InKSO+R87/QioeFXkyyiKWrOMNFO6PNqC754USxWZMKIYGvLZ6LuHC1bGMjTciuy6OUUIPIXtcnncixlgy1Ls6rAcgDy3RX+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tpvylxgk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tpvylxgk"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48909558b3aso73147455e9.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448833; x=1780053633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LhbdDf4eyswQt9B5NrIPwnpBfgPQtJHaWKySe8smSU=;
        b=Tpvylxgk+lnULe55I5JCzKaYZiydpi1+xmnK2sywLTUOpb9v3E5FT9gXRrvpcrFHzu
         uUQGZHickQR6e+UYd3JSENkA7NCHQXbWFzzGgBetbPPE2lA44B7syWU4JIVu+ysjc7gP
         7ahxF4VxRLVsyANvlEKcCjqfCHk1jWAjTvedYeCCRLy5EcsHjhznJ/O/w+IDOoie5ufs
         DlQM1hGfGxn5xvtCMghOQpPOtOdPwiw++tu2PuIbx2pTpdKm7VogMfb/gqUFKo8qfzZi
         QCwUgcE4qCcu1b7nKQmdQkNeGHpQMg2JNY4Jwj+Q0bvSOpn5UnE01Ak8ioaTYutnnpsn
         QlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448833; x=1780053633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9LhbdDf4eyswQt9B5NrIPwnpBfgPQtJHaWKySe8smSU=;
        b=WZAdOcxEYJYry0yDVZ8lO/9T+Q5mQQ5p28jmfF7cy4mU/IN7SblRyY7j6rz41QC183
         VdlwmFWTrq6B+2GrXebXnd9FRP3xAKO7zE2coM1fTJ2PclBIJPPgMPcwj4W9qXuDI1ng
         v0fM47Q46k3NP/SzYz789ZE9BMA4mYeBilgPZJyzLx9YyKYj0kZ4m43x4D8loK6hxJ3h
         /Nrpc5deFxiWhLxogoYOQlxDyoqP6D7RgyYQfPp31+rHpZitvYujcjc5U/Tv2eFMTDyy
         Yxs08KwJJiy9VHVFhDBgJbntBcKue8p5v9Gd2Or9Oe7k4L76cjimNTQ3+0rHihGuLu4N
         5bFA==
X-Forwarded-Encrypted: i=1; AFNElJ9qsHShF6EFBfRN9+ShoA+JDBxC9/dgK/yuZhq8aSeby7hUhkVgR1ypoBmeLTbZu/XnYE2lLJn5nZAv@vger.kernel.org
X-Gm-Message-State: AOJu0YyNveg1tUjNFDAQia+b8zBrK/UGEJkr04mw0EFj6jtxDSbgcRG3
	BDFHD5QWtwsDnW2XR/CDmyOblBp8VIa6+7C22z5RGH6XbHVd24xVIUDJ
X-Gm-Gg: Acq92OFrrxa0M3OfhSYPD6nX4l3Hrdiab4VvNTWs/ZeLXaDn7FhmtLHPSvQJI1h+24u
	WnZtRYV3AVP9cfwOtItamuVLPW0UEOtiHfi+f0BsplF+WgKs9fHc0n7xI3AxHMEvnAFKI+DCd33
	sl8RhmX8xqKU6UMCOauFLrOlHy2RuWKZG2nGioVQ+W/V7iGFBWhhqTKB49aAF1Pmha7PVHZ7D0c
	CTuFjTUEbOkeocVfHCSFYEslFPU/Vt7FKbA+At2EIyVNSsMSp5zCYDxgNEpGQSuCr7xXCmHUSje
	IvKf+YXzH8742scmjMZ+H7bok8oH66FAn+T+E2dL8OIGgjd+CXxF1jTVqIsW63r8y5irMUoSFYT
	bbpzo3QWnBfI+EsG0KDgvFFPsnSqhkjHvCNYuHGnEOBVthp6UoLeHpWNIGSkHvTndcohcvaRUi6
	l+KzuWxlLSAhX3WWr6U5mw4pJIDd5M33HSBsUmDg3nEwnW4sSKtg==
X-Received: by 2002:a05:600c:a106:b0:48a:9562:7a30 with SMTP id 5b1f17b1804b1-490426dcb09mr29669825e9.24.1779448832493;
        Fri, 22 May 2026 04:20:32 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:32 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: remoteproc: imx_rproc: document optional "memory-region-names"
Date: Fri, 22 May 2026 04:18:45 -0700
Message-ID: <20260522111849.783-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Document the optional "memory-region-names" property.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..6679b10f9da5 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,14 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+    items:
+      oneOf:
+        - const: rsc-table
+        - pattern: '^vdev[0-9](buffer|vring[0-9])$'
+
   power-domains:
     minItems: 2
     maxItems: 8
-- 
2.43.0

