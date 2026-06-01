Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8666B3BED69
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324257; cv=none; b=Xk4hCl6KyxMmdqtxbKooT7AAzIxP+PBxI39d69Jhcawz6lcQBOXwwhtKaZ6uOsEme99+3INoVbK+cUDoTxerN1hG3txjFb2smbCm4arfH3TwqOvR+dDt8B+HpXPhDPqFACFPPme0lZJlaOMxLV1iyrVH/aa0nczMfsSh1Mhf2OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324257; c=relaxed/simple;
	bh=AlIbcBhxQY5tdoRA+xhInIDubeZASOSXqAsfI1siQbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8rCvp7NZtmMW+VF3HFg8JXjczol7IgthxCU6B4DKkfXQrWGxCqDx1TN1rtkYGaP7utostvi3RAX333g41qYoi4B0+r1r8kfVFgis9L729W1ZjTWB7lY2iaPQtqeBN+9Y93DUcv3kZ9vC3xHgcI1I9P+pcTVVbNMyWcBVQvngxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPKF0WU4; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPKF0WU4"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-842307473b5so1282495b3a.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780324256; x=1780929056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=bPKF0WU4plch1zhI1Ja9unb6QnO/U/oIhWt6OONTQJJf1Yvy8k2rT2bYzAyMi9M2G6
         d8hq7x+YqRgZ3QIsqqeLWl30z9SXYtwgMm3LjSDqEvnlhWM2mpmJsedGIpBvcOt8dXTW
         j6x3fZRAdAA9GepZWS7WWQWlfKRg+0K/6Zk7pIfehmWK9TKEVWGN3eMSy4imffuP6AFh
         txMBSyFmle7Kzk6CEpdRfojOt9EvfoO2IU27bCcNk3GkQymycDF7W4ZqYx7ohwVGQOyY
         2wAPfBBKADSqEcdulRD5ny1l5vpxkzCETH7rlMCdsino7eyEc9AO6Z8SJUsjswrbXKwV
         HaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324256; x=1780929056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=Yd4Rp2j0Ivrgsc9qoWIOwXZ4k4rLaWjkzB2zatddL5IAwUp3yuM4IvKxN1CgVXqAFc
         XsuTTV5JdKeotOgM7wIkauuP4S+oOH3C1euxDBP8dM8kP2KHBPrQVC7lOZ/EbdZKdH4F
         HyrJVzZanbpiiE5p+nhVvNuhnv9o/FoetA6El6utH+zpousuACh4F4PKTMzbxIV9V5yK
         yI/d0DnmM12tmFkFAJSHwRew9MAcmRSui4rr45W95xRkOfZfepc2up17QoQZPO5Ph2qd
         N9JnM9zherXfQ3D5spmOjmxnD8hrkSzhfVXkkX2AmkTFfv4YygsJbQJ+56llZeZtOABG
         +tyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xg3hWMKVGF0sh5sNNbsoNGl+qzInPNA4Y+lfIK+g8UI2o0R5to51Q4DH3CdQPG4DZvrFT9OiLViJe@vger.kernel.org
X-Gm-Message-State: AOJu0YwEd7guEUPxpNfdL707CiEXjldSpvWpSq3S34iUV3hK73hr1eTO
	SRrwSsZwkOx1JJ6/+AIOiURYYJ8MMELj9KodTdAUsrnX07hpTGwO5vRu
X-Gm-Gg: Acq92OHqZYjtQtJBNLPJxLND2bx2aUXpdZe4kjoN0Wb3N9K3taKRyTNahp9WN3x4fSO
	p3deaZ0K8WmEarm6eK3ngUk/sr8i1DcKjMFISs6NEDji2qDiVgMGkwI77GFCz5vkfjf0YXeBopT
	PX4+PSCIbSecphQ8b07zrr3YGSjtHabjn31/iZfDCkfoWtsEPxSuWlhzxxvCw/k0VVITdFO3z1G
	pdzoh2x2Ztkl5nePy5jwxDVTMEZVbXBpg1Vgc7mX5evVp6xKBdYhKYMQ1N4b2GuDWQUA0OWIxWm
	vZvT50zBc7163tPrlGYv6pKT4aydhFRCfiradvJBcAAAppPDWZQ3uhxECF/gKSfq9KihvQJ55ex
	dWTEH1aNiFr7hb4zRTlv6jX//WWCTOe2wK6vcAf9TPv0A3N8PqxxhveKaBhupPYj22CQMn0p0Lr
	mtRfAQWSOCxwRsLYoXXmul1hx4FRkhDhde30dJ2UAm
X-Received: by 2002:a05:6a00:6f46:b0:842:2ddb:e303 with SMTP id d2e1a72fcca58-8422ddbe825mr8194339b3a.12.1780324255689;
        Mon, 01 Jun 2026 07:30:55 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842498819e3sm4910786b3a.34.2026.06.01.07.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:30:55 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add vicharak
Date: Mon,  1 Jun 2026 20:00:20 +0530
Message-ID: <20260601143022.153941-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601143022.153941-1-hrushirajg23@gmail.com>
References: <20260601143022.153941-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for Vicharak Computers Pvt. Ltd.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..504a691a33b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1791,6 +1791,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.47.3

