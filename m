Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2B0397E81
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 12:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789820994; cv=none; b=dDuqCKPYWgIsNfGw7dlSVQzuPoJksCKLjkeYBKlN1trY0CiIFbxjTlBbM742yoI1hlxXW9liAR+wLzIMp8/VUB4fairXJdYXFrFyYfUk2mvB6nOZ+QoqZrdXTVi27qhGMB5hvW+WRJQuUwP4VbzWAu18al+fwmS7QFy2View/SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789820994; c=relaxed/simple;
	bh=7UirNnKptkM23XV21O98MU/F3kZMMKqkqZFRUqz79+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFkVZV7joEf1YUocl8rkMe0TUZrsbN9OZ1ak1opr5zlunbYQXImZn31PfC79V/FCTP/LAMvbSLYDLZ24DbBtKepV9+tEsOq4j3yfDAZW5MFiONJqgSGheyCWj8zNdS8luazipmsm1sDdSt0RseN0iKjAsDA7HSGS3iqx+Xp1xzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGb6m0WW; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGb6m0WW"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2dd88a115ebso13672705ad.2
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 05:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789820991; x=1790425791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MmcjKlyf4A3stJwDXl+4IDRDF8eUG006ktFMDeykK4=;
        b=rGb6m0WWKVDyVASC5NYehxAm+a1YUhkO73/Zs5I+epmPDbx/0geKI+9DF8BpyLZjuf
         JDD4lrKfJBtMnRMNxQfc2Ihx6tEwrqAt/fRl9hJtNPu1LVcNGuIz7CQF1U2DZAIsl+Kx
         ICORzgojn0lF2JoniV/0zzNnhPHR6y+Bsx0/eddy8ZTQ/lGN3DAtjhFrcEEPv/YJxwPJ
         4jkvICBYNZg0WOCy+3pGVYhZd1Kh+O0V8EfhWLI4IYzbW3C4sGydYbHLRWZF6DN/Uosl
         T6L33oZEvEwyXRWMWI3AzVxBgsUIc0tc+ZGgSPSJlkBtGl3ZyU6ORRUoeHWnKTZGA7NU
         wjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789820991; x=1790425791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MmcjKlyf4A3stJwDXl+4IDRDF8eUG006ktFMDeykK4=;
        b=MI1GLnwmn6JOYTEqW+oVR3SCGTD+2orrJG3DpJt2bhXdmE/CAa1hQfwJb9EuM0vNnW
         i9dmfDyRUO285D/+dMhXzNdhwlvqIfbU3sRZHxMAQHNKSKSE0wuS8qz/Bb7QXchrNEnG
         AJ+8eFtVgPhILbeS/pssg0qFG6JfBL/gMJvcyFlP9RpQcmVlSFxrPV1C3E/fedMaMxqe
         FDX/7s8c4TSDvIQvPzdZBa+MAk5Uy8lyQVdodoknh0U4nXoN0U/a5HrsSqn8nCnbFcTT
         0nEK8XKj8mrFbZbMVw1NboB3DLVI3MVZ3LW074J/ICRH3ndif/NHCOD1iCMmKGdPgDWL
         IAsg==
X-Forwarded-Encrypted: i=1; AKwUvBz6SnUCdZ3Y2RgPyYCi7KEp1RxrqkQIPtQcsHGNHRTQvT3sBoJNdqftw48nB9QBI4kffsFT6DV1yTPz@vger.kernel.org
X-Gm-Message-State: AFuF++mfdCSBJkN71evt/RMD571n8kFto7+nVA1grJYYhiF2zPZaG7cA
	DR+KOdeD27AubQcxDitT3qYuXCnn9h8UZJmG3iNBOrPYUoPFhOsFRwcT
X-Gm-Gg: AYBFou3XYiNR517G9DcZsOEztytJJCYvQn9+fxd2+dbzatXP1uuvR26VNAFkSxVJdVU
	dnkr6glH9miOUUD1BMxcFikgYzYU5me/gEngE7JX3IlfSVtwrkffQ6MIe6ZcgHD7eSaAPObQDD8
	75cg7lUKIRbnkwFxAtbLqdYrbHL5XMTLqalJxayEe4VzQaRTeoPYqYCEFDzKC8imEueWBsjrlzH
	L6q1lgzlziulDann1D5g3QLSuyRtlbRIOUp18J73W0Lnyo0V/Gpd4wMtBU5nsOlvRMDcJ7U/Ri/
	pLRmM6DNcoavunIuWHOBkQvU9DJQiRBFYamcXN9ac6MR3ODZYgj+WzDPghQoY3HU4u2rN6CIGT8
	P914E2hS9Kg/+Rp2rlOp6Mv/LKTOWp7eW5Qx9fMf3hv/1/jONMgXa97jEHhJId1EbXAN4bcngjV
	OkThAOucnyz9o2ACTpHrkgKXeT1tPIed2z4A0FyFgX6rq4pVe/HMoRRuxkZNN2AK9/jZQS1LnNf
	X9rPLoXviA=
X-Received: by 2002:a17:902:d48e:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ddb1b9a0edmr96579045ad.23.1789820990640;
        Sat, 19 Sep 2026 05:29:50 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm9552155ad.66.2026.09.19.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:29:49 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v2 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Sat, 19 Sep 2026 20:29:28 +0800
Message-ID: <20260919122930.1418-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written; with any
of them left asserted the rails drop and then come back up.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk808.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..d59f6ba 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,24 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written; with any of them left asserted the rails
+      drop and then come back up. A line left asserted by another consumer
+      therefore defeats the sequence, so every line involved must be listed
+      here. Only meaningful together with system-power-controller, as the
+      lines are released as part of the PMIC's power-off path.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +131,9 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3

