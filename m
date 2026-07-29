Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72D3BA23F
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315558; cv=none; b=WG+aD/GO+2nd6mjWitWEg37mXO4qKchbD3i4orEBz5nYzDP5Rmsaooitne/2WvdVwhI+5DsSuJu7nXA/r/PJkA1CozeUbW/G5POJ1WeI8rMO8KPOvEwJTqRBUtEfIP//QXIFgZVrVn3kcaJ5cbeWkiYWAIZ1DJ5dpkLCJUIwzW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315558; c=relaxed/simple;
	bh=ylMBZ105tEAKMGgwfBzM0TfR3TkOIZBgs0hr87LsoZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqE01tB4TXcZYWzKlajrxv6xfKqgV+Zx9YzgApMChDQTRrXKttukjOQW48F0oVd3qWBRlDtmhrht3eSko/9zIY9vOcOisoKfMpQ4EavsVfPjO34cc3UHSNqMa29+E42s3obsd/e5lyQYE2FOxcCPw+2GCqCd3WKNC/cg0sv0gJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kb3aQel+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kb3aQel+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ccf2360620so6797255ad.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785315557; x=1785920357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0mAGXLrJyheCU14v4jnS6X+vXD7nWsPLwYJFNKEwyU=;
        b=Kb3aQel+nKjnF53N5ZUfpFmCzuwRFQ5ssZVaKQgt0F7/UBG1GaTFqMH6lyZcwffu7u
         S+AGs1WeXUEgpyxHTrRZLVTQRt2alad39vdvlQmZGlYUxt+4zoN1ycbYLG/i/Pi4VyDf
         fdgyzVScquxdGa36cDU5ELQ7jj20iiDbwhwmMl9sQk+GEUYZirZfIDQK4q+MU265tyMB
         aAe59Fj6N56OhYxF5jZ005cBmzzLENL/w3G2qmRrZBsNHR0i4GTerzKfCUhxJXvZTnPx
         J5CabD91H3mZ5XNoomyT1SRg/INQriYqMhqyQWZGDH7Ucx7vnfSWJGyPAviijMTXqiAD
         cTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315557; x=1785920357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0mAGXLrJyheCU14v4jnS6X+vXD7nWsPLwYJFNKEwyU=;
        b=WC7x60haAcc8GDZmsit18+BmagaDmrRsfdv3tjOvLOXDqFsK8EOEt3arygIuEEfeR9
         Xbhc9Btxn9VfhJieRhzjWf2+S2Fg4kliqLANpqhhSvKCITaeHvoWxkUEDx+0YNFqEazt
         EQegxRzfUjw//3Wko8rmVagP1aCOBuHOWHqt6jzccVpls4bPmbh7WYRqSfhsNTTzA9Vv
         m7hoxuH26yI2oIOEdAAKYqMYrUYsiy4oXztWIndtZpyMJi42P//HBh5x2H/SBrCq6YS5
         b5t745Wchg1JYUVSkPH5bX9SWbRzT1Y/rghQRhUHUfKRvr2ITFCxm3oeS4ip5gTc8lt3
         mffA==
X-Forwarded-Encrypted: i=1; AHgh+RrNPPShOJExraz8P29nJHjCLTc5da+b15T7i11jjDjLVUbNMXG7d2IZLt1/vFZBbq9p8UI7I+4SyYpk@vger.kernel.org
X-Gm-Message-State: AOJu0YzM4mkQIpWIHqOt97DtXg1X+PAmJjgJKuhzTG39anQAFICVtxqo
	PyTMCIS4tQbt15krDpjNGVyZ4UsygjWKSRWYIdEMtWB9DUVM6KP20pb0
X-Gm-Gg: AR+sD11H471TFlvVQ3iXyG7DsE0VYzpdIrK9eSRiZrBkEhIQms63emb0MyQS8Z4+zC+
	5Ohy9p87QVWKzfeaoyZGgBBG/gQFN+WJTIkrErJA+9ULsFAEJh5gZZnBDxWIMEJq9SHa+qImX1C
	ne7Zosv2p1YHh2asKcezdgRMjoG27pHlRUhs4G14/kdo64I6juvXBePMFRo6tejxLip0N+HZARB
	ixs7Q0K4lH5BivjJlYt50hXt6J8fh8Pn8KbZCwBAVQwHsH6UHD5vAZNgBLNgbd7//E5KdKTLF4V
	oZ1wvDSBIh6dnoQqi0tZ3ojq5HJQDCqjFYiUpTejXl+XhYKrQulToSqPqI/FcvrZGQDaj/Lbld3
	xZHjb9RZ3/YMhkfFLlL1PhIIER6sc/68G0yERPxIVfbbduLd7xcj0ChsfM4S9tugzAJ3e4DV/lT
	/cyaFcxknrUMq1aSHrgIfpyIZT97PiNdZYDfRT4ZpyPX3fTmbO0zn4ARBlpkV0IAi57f5Uh9W3e
	+gGPw==
X-Received: by 2002:a17:903:3d07:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2d015cbb228mr64909415ad.32.1785315556870;
        Wed, 29 Jul 2026 01:59:16 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm8179352eec.14.2026.07.29.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:59:16 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: nvmem: rockchip-efuse: add optional vqps supply
Date: Wed, 29 Jul 2026 14:28:55 +0530
Message-ID: <20260729085856.226001-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729085856.226001-1-hrushirajg23@gmail.com>
References: <20260729085856.226001-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an optional vqps-supply property for the eFuse programming supply
voltage (VQPS).

Per RK3399 TRM section 21.6.1, table 21-3, VQPS must be 0V during reads
and 1.8V to 1.98V during A_PGM mode writes. The presence of this supply
declares that the board hardware supports software-initiated eFuse
programming and provides the requisite programming supply.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
index b80fd8d1ae5b..25f209fd881e 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
@@ -27,6 +27,11 @@ properties:
       # Deprecated: old compatible value for rk3066a, rk3188 and rk3288
       - rockchip,rockchip-efuse
 
+  vqps-supply:
+    description:
+      Supply for the eFuse programming voltage (VQPS), required only
+      on boards where software-initiated OTP programming is intended.
+
   reg:
     description:
       Registers location and eFuse size.
-- 
2.47.3

