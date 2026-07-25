Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28307313550
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949472; cv=none; b=Zt0XJMnMnWvA2BnEtwNCnZeszQ19HwzBDhY2HgYk8XEalr/wKN1G5WNnK1hM1gIsp7ta97C1Jbl3hMyeMYeK6Qi5OIJ3fbvoRUfFC5M+nlasgXgK7VPFmMbEtBBcTHaMbRRO0hTegMe+a/GXPyReeDdfowONTKxPK6+i5XDsTvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949472; c=relaxed/simple;
	bh=To2Wz4JMP1yzDvV2UFHvJJLkK8aaYjCf2yPZVKorUr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OK3+Drb3nHyI3USX9RCtwkTjIUTV64moltOZ1xCP38aGkkymwePNQeNL28IUwd/66nRtJTJ58jotn5C6tuoy90I0TJpx+T+/g3HjOCs/Cf/RNx7fsQgRMqnW5b0qatmVeUH+eIo2gr6RB+KKuTlsmM4I2IP5/506OX6bBX+sjz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUjZbs3h; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUjZbs3h"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cab1b0bb489so1045775a12.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 20:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949464; x=1785554264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+s3XIzGgmCw98QusnVJUh5PtZQnQQOXqs7KUawjh9Mc=;
        b=JUjZbs3h8x3aPwsV1Dh1UVFpzTIuAKgk/a6yZegHPCcWkEeyr/hLLy9ZuacwnjblmT
         dN8hS3VPLeYzB6pTxHCQqFfeCgVV2Ix17rdQeRe7u5V2Pe0IDvm47RVng2o1GfcrVNvm
         L3wTmPsQtuMTYJPXlkEFQkyz8WQL4ssqYVk40R3TQiL+L0W9bpFjdB3X4n5HiloW0pUf
         wOTVeKBpOZJRrzvHX4qjwGOAI3N5aHmfL1XiOYkaZo6D23nC7JNcL5Ha/SLrhwd7JZH6
         x0EqYutFgWBB20KP1y/oH1Ow77sELeRE95R+1VnhHXjZMLW5wSBYfvhWI3FxgJoEtVjb
         rYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949464; x=1785554264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+s3XIzGgmCw98QusnVJUh5PtZQnQQOXqs7KUawjh9Mc=;
        b=imVrNSwrCjIIxWbs+Y96gFZ+oW8PWS92QvBxSP8C74QrybPKncqhOhALTJdoKUVXDQ
         cYS0Ceegtzrdh+RMPzYBbPT8tsTdLgQ7V/5Bkc2//1AhwC3cs9Yz6E2Cl+Hov8AtL8BP
         1hWoDtvKGvm0/zJJFhev6TNgYS4dn8VcM0oMI6myi3bS0q5VZT/9/idQnDIJhaOr7Fhw
         avWiv5BrRGlSgKozTrpZs/9WVhJ6aMAhwBoA7KHWmbnBwg5mzMr7088qZPRX4i9pPqwL
         dvXuLl5QZfmg8gdh1iUchpiAcUQJpfIac/NDTXA5ZJEE3gF7KiNtzmSO4M8XBjwbr6jT
         tGfw==
X-Forwarded-Encrypted: i=1; AHgh+RoRnabj+UeCBGu3qptKf9s6bdJlGgH2alIEtRUwXdCVK32sxEfzniMyrwS5zZpQqSKgdgE9C2JRW0wP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc0CLfiAc0eaLlVR7Ymz3JzjkefBAPwVPeE7q1VEjQfwVr/bkc
	/F90En477KUyHnopVDuUWLyuWUtB/WxoRbrH9z3eqFPlBJ/JPfXXq7+4
X-Gm-Gg: AR+sD11rIT2aAMrp5iJhz4tLNzQ0AVFFjZU5FgxX8whPmkqOmG8xqsG/yUyo4ZhYq9n
	I6Mb1oWz9chXxPELM+XDOOf57vKyS3sHdEfOCheOjbzrJBrkmtF/fD2BlKokO1pbp2uITn4S6RE
	pQz86xGxLkuALNANOW98K+ShsqeFEb3wY3b/tJ1IddxDHDyMDmKgce0k1Y+6Ulw7ODIsu+0+oHm
	RBa5q4y8WQ2ehpLFHmOf4Dmrn7LCoVs5a5E6WJ8dq8o7fsrN2zPPxWghwPjNhKYhsO4fuPKJ1DY
	saiCj/KNeRYzBZBkpkDd9pTls/qQw0BzGrGv02cfqpDbGOXcRR7FDvi8gWi0vsm5fWUaBgtmCjL
	7v/hU9/aJX17VR33/QfASu5bMr9Hegm97iQnmn8SO7MmgJbtIKLgFjtA=
X-Received: by 2002:a05:6a00:9288:b0:848:2f77:e2da with SMTP id d2e1a72fcca58-84e595d33e9mr653832b3a.67.1784949464300;
        Fri, 24 Jul 2026 20:17:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:43 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:36 -0400
Subject: [PATCH 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY PLL
 pixel clocks on K3 APMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-4-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

The APMU's eDP pixel-clock muxes select the DP PHY PLLs as parents, so the
K3 syscon takes two clock inputs the other variants do not have.

Gate them behind the K3 compatible instead of widening the shared clock
list, so a non-K3 syscon cannot silently accept clocks it has no mux for.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index d3a7c93c3c54..b8fc6632a392 100644
--- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -31,14 +31,18 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: osc
       - const: vctcxo_1m
       - const: vctcxo_3m
       - const: vctcxo_24m
+      - const: edp0_pll_pxclk
+      - const: edp1_pll_pxclk
 
   "#clock-cells":
     const: 1
@@ -95,6 +99,30 @@ allOf:
         - clocks
         - clock-names
         - "#clock-cells"
+  # Only the K3 APMU exposes the two eDP/DP PHY PLL pixel clocks as extra
+  # inputs (parents of its eDP pixel-clock muxes); every other variant has
+  # the four base oscillator inputs only.
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k3-syscon-apmu
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 6
+        clock-names:
+          minItems: 4
+          maxItems: 6
+    else:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          minItems: 4
+          maxItems: 4
 
 additionalProperties: false
 

-- 
2.43.0

