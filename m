Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E9540BCC0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021852; cv=none; b=EzFCwwaLUSOjiTaXHMN6Mxft5d4o5uBjiTnRAA/XcmCei79zP3fT0RHSyMn0PGq0PKRza1E9ecKkdqnzO0HCiBtF5hPP0tmwxx57oyiIWTm26WG2UrXNgTpHGRBdlvQDtjdKcyDgF34HG1g5L8wsAq3aMfedN1J9I4lsz28u7zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021852; c=relaxed/simple;
	bh=UE9YrE2v+vWOrb9zJC/jPk8oe5sMJhvINlq5ICoXTjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BxBOk9hQnZ7xXKnekW/SW23WgWWPLZlue3+7nMrjd7i84TP+MSaP+1uoe2VhnRyjOiH2TXvpt/Vrb2BFttEd4rHGCkir5j50IZgJQHs6VEs2sRsrkb6jDiUKDtEv04+vJ7yhxoEODcy5lemvadjmwJUl98Hpl8VfHaPWJAnUDpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T88FraFu; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T88FraFu"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-43d16405b54so2569467fac.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781021850; x=1781626650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jmbg0V7VWVis+O/gLXuP54Yt+uK8k6/dFNi9df9HTAo=;
        b=T88FraFuK8wFkJ2SyJ+tFCMyFFZlYVbcHoGd7C5dL57ddjIwIFuw+guzxhQJqqf6t6
         189Dc/UEvdfeLtPcveMxrpuj0c3V35iMxpFSUjXor/KMCMvgBZKaK6TNz0A14SIlpvZz
         ZPp2RC8XNgJIiVuyEzhRfxU3HVIuoaI1iPWk7OU8mnaRtCdcOMjRroj8kIJK5rMXdkwX
         F6bFzGJAPZWPliAO1aErsLbdOjgmmujz9ut/ieRRhWwM+wUahIawxoB4mVG+NuuEhquo
         XIsa3kYQy9pyUYVx5vgTmktArXEkcsASmFwKCc+VSsuZ/C0ZoeQmCUnfsOFyMnQt1tzV
         er9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021850; x=1781626650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jmbg0V7VWVis+O/gLXuP54Yt+uK8k6/dFNi9df9HTAo=;
        b=XVdEaJNQi7dn+jYFZ+B24jXzaW85lzNytzTeSAQq5PSlo0XdRVqEZAxRJjvALwwJ1h
         C9NOsmw9oFXEZgDyCAXqRZ82OSzrLWMqNkfzImnoGS+FU9VcMeY8b8uyemls1VzaXQK3
         QgdLzJasnMNl2vyyEg8mwfJBcAMnG35OWdPLGkz5UK8hglr+h+biJa+twwk1zSEvCTr7
         FwnaQY8vIqFQW3rmkaoklL0KdJKFMiL1fOqvBlkhpjLb/hQ/N3Pk/jmPqUN9wHbA7ivO
         7Sp7ZbNWnwwixXu2r4B7SOrQsXe6nbA+yDsqXYMBs8BrhlsU3HeefkBi95oMfMRSUb6M
         RXGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ROP8VEGhpWPymOpJtgGzmLJIdY2oNCFXoDcSIslkp7AMWMrlOlBXfyKfhxde+rRPPUpgBmQZkb5RN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0AeOsYH1+jUaBtmmnw2L3WZZfM5t/8LhWS/eniVHk1ii/6cRj
	19wwHLTGrUBxpIG2b0c71NVwjQL/wAAbfXirWxilv8IbBVaImPToCK6J
X-Gm-Gg: Acq92OFuTPHeYt+WVgVsBN+QI7A6kwGU1eTC511UOiixE9XcEd7uckjm10ppv4N9qIK
	f3l/L/EWKE5aCWtoV5uX/4o960oU5QSr5WAxiKb0DBFYUh3p2o6RKoxovx+WQSUVg5+ALFcB/Lw
	c2PryPg1CoAxmnCf3+gtgGZ6eHapNZXJuErNBz+kRPvujSn0a26NNEPMGJxH5QpvRuEWBzVrC4G
	q14ESRy2HqFFdziBPfgcVMzjZ0up2+lrruTCWsEFupxWPiclkgswLG/wegj8iJP+HKPpDDVk9Hq
	+76qibN70tvmlvhpa3ZpsAaWErrT6QiAGPQ00o4TUPeTGWnjTi0hy9U7cST5P6rlLqJALaxRVHj
	Dx7ujTEBUQgjEXJHj3Ks4vt5JZjDP1qMTTZkXI5RLkJQ66yPusyLKyZqtx56PSbMI7fA66dfks4
	LnQ5Ck8wi/f6yuHdL9iGfgzPIWC4uon2Cqa4wgeHmU2Su4JNuwsX1v55OEPzxbH0EuMB4k3YWhn
	04AghA=
X-Received: by 2002:a05:6871:729:b0:43b:a0fc:f6bb with SMTP id 586e51a60fabf-4413d634d3emr11999885fac.8.1781021850351;
        Tue, 09 Jun 2026 09:17:30 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d8448e3csm18797906fac.13.2026.06.09.09.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:17:29 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomasz Duzsynski <tduszyns@gmail.com>
Subject: [PATCH 1/2] dt-bindings: iio: sensirion,sps30: Add myself as maintainer
Date: Tue,  9 Jun 2026 11:17:00 -0500
Message-ID: <20260609161701.52513-3-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609161701.52513-2-m32285159@gmail.com>
References: <20260609161701.52513-2-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tomasz's entry is no longer valid, as he is not active anymore. Add
myself as maintainer for the SPS30 to replace his entry.

Link: https://lore.kernel.org/linux-iio/20260609140712.2e5d1640@jic23-huawei/
Cc: Tomasz Duzsynski <tduszyns@gmail.com>
Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 .../devicetree/bindings/iio/chemical/sensirion,sps30.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml b/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml
index 967500b7e773..a31a68caa5d3 100644
--- a/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml
+++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Sensirion SPS30 particulate matter sensor
 
 maintainers:
-  - Tomasz Duszynski <tduszyns@gmail.com>
+  - Maxwell Doose <m32285159@gmail.com>
 
 description: |
   Air pollution sensor capable of measuring mass concentration of dust
-- 
2.54.0

