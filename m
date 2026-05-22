Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F664611CC
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466308; cv=none; b=EHWOXtKnFEgcU2Q8fJOVdJ5522q8xQQh0qlzkiF29Q7821zOrr9z2l/0EjSKwrfhdcpd21kbJSUmYSgE+j9U+LFhwGYtEB+F4+5wNt+OzSLoWIXsejfyqhzQm3IStDxeRRei3jmYK4p81WUB02PlGSxINjGA7BpJMaUTz4WAD90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466308; c=relaxed/simple;
	bh=xChP0+PeorC5u7ydzAD9QaUHKklzoy+4vL9/vem4XhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZI2EupSQZJ3Prj4NJ8NME/qzdavdfpWbh9TQkLPjB1zyh4rG5+lrKInjPgjbNRZO570+4MPKymRRVVl4+LgnlFQ11V+N8t1gNThATcCLLddWf13H6+pKU96tj4Ag2+yiTZvenXxpaxHyV9p216DZG6Kjt5OI/weKWlOi23HdywA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWyJjCAb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWyJjCAb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso47858505e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466305; x=1780071105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxhTRa0jJQh6ofFG9sXlZ7aauhKliKnMeyOlOjmQWhU=;
        b=EWyJjCAb6Q++gMCWPWCBb60QA5l6MB3P0aOJr0/9iY9cu2uuvcigdPp6SSxzfXKIf6
         0mTkbI8K1gR1+qUin03mLk5qoT5j6f6qrfzJ3lGa2b8LW0dNVIJ8lONBSV4RMRS7ax21
         om08LPYjCpBZAR3cV41c7EInGpcB2uoI0Z8qEDWmpzv9n11vW5DjOpIuv7ro18PHsBvf
         bKU459ZCe83fRK8kuwGeadqHRzEyFZSFfE2Wh2VmYIy+hYDPZqj/isYurRX5fyvTBdJZ
         94UEL1RFgxyZu3ZlYGSI5q9kq7oaqHJ1yqubXm0nPAZ27J8t3lrpKdu3rwrY4KJiWIH8
         Mp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466305; x=1780071105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MxhTRa0jJQh6ofFG9sXlZ7aauhKliKnMeyOlOjmQWhU=;
        b=bAOIvZX70lpmfyPezsq4XYuiPgQJ+6IOCWO4mBYoRobFE25CN7u5Bxi1E+QY2K4ibj
         rm2P54xdVPLs4PaPr83PrkLZ6Si4ooFukbnxNvXM/JkiVdCoWrm1UNc74Cz/shgzLWBA
         VPFyWoyRzAWJ3VzPUzeUPL8zjVC7IWm9Of7gMadiO1bEPRMunZWtrUBI9QUJs8pFInlL
         VF6maqHhE6cquOT4Oi/hF9J8owBXO6n1ilknm6YWKRHVRvxM9kUPpYCcsl3eTYwrkM17
         nXQfGUcgWbm4H41B34yhoawHskmMC5l+0iIquKI0h/cUj0e7KvfkR2KKoxoxHBH7lb5U
         twSg==
X-Forwarded-Encrypted: i=1; AFNElJ/yuJ68mia4n+06KBS0k27O/irkc1dwg9cY+JNSELL+hDgmhW/dfhCHKPOmtCrYiCxCmODixkBZZNdK@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcur82a98ncd82moX7/zMAJ/T+LuOben/aFjHCEpVY1khVxx1
	nCrRluQY8kMQABl2KEsSq9kNKENRUsF7S073yy4IBfRx5DbdUVa3zZ1s
X-Gm-Gg: Acq92OEwET4DYDL7xZfo7dC2+ur4AjpBC9bhrZvjNLGXn5Lzp2SdvptuyY0JZDFvB4O
	P7mTUmAE7oF5ULimhn/O93h7VPDdCKrKUsUGPIxufTmUrl6kKbAfeHsz5vMbcTmpIM6L4hDMfVg
	kcqRM5g5BSmfch6+exwUu+/cO0+T+uIfqCwDhqBADwU76wTZNWV8cEGRURR5SkeyjUNDCnCPO7I
	3Zl+lrZqef3l6govk/G/QkueaUw5qAqJrKJZzcEUYco3Sd6+BeBMt5d7iFzVRhbPmEPDILTk9Zh
	JQhDXVA+PoyJpgsxldNq7YhWNPpZVKAREYpLv2XusAq1e0APjpW4DRoLmwUoKeciECaUZplen+O
	nDpsJ1o8bup305oRwxkPgeisxbzB2FYe3YPZa9gGRutjAWE76kHF9uL87t5RIVjITjJiYgMTm0f
	iL1akV4g/9ZgCl47G3nc6YbK0ArvZa7hLmKZkk9BSYLjeRRVgghmoD
X-Received: by 2002:a05:600c:1c21:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-49044ebc2edmr57464185e9.24.1779466304832;
        Fri, 22 May 2026 09:11:44 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:44 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 03/11] dt-bindings: vendor-prefixes: Add Riverdi
Date: Fri, 22 May 2026 17:11:07 +0100
Message-ID: <20260522161105.277519-16-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add vendor prefix for Riverdi Sp. z o.o, a design and manufacturer
of TFT display solutions.

Link: https://riverdi.com
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..bac056d486e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1403,6 +1403,8 @@ patternProperties:
     description: Embest RIoT
   "^riscv,.*":
     description: RISC-V Foundation
+  "^riverdi,.*":
+    description: Riverdi Sp. z o.o
   "^rockchip,.*":
     description: Rockchip Electronics Co., Ltd.
   "^rocktech,.*":
-- 
2.54.0

