Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1ED3D525B
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061285; cv=none; b=QTfFD62iIXCugxsQSXg7F3VS3SAh6pNVsqQjfclEqRD8k1Us0kMz5F3wCmlFM8pCVww3VGc8etRn3OI10WtmmB8Au3c46Axn/TtHN7LcW9+EgRck514GTzeDCrh5MlonG94vbF+oDx5uP/f0KA+SFBgpbam+i7jRmU6agtLeJ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061285; c=relaxed/simple;
	bh=OWCEmsRz0qAl88C6oETHRWXimfKd+7tWIWARlti8lDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LMfzRzZQoyFb6a+q20+acByYZWVs5mK8ejToX84P873LCH4gVaf+K261Q0++AdLLYT/OcabQ1MdWq5uroPGFLBybAYKspfmMu9t4xgKepSy1qs6LcZSrPs2bxiEPcq97eVbPyYxHj8ew7YfgQm629x/n5BndQmK2iI48Nb10ge4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hI0WcMm3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hI0WcMm3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d75312379so1661038f8f.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 16:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061282; x=1779666082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=hI0WcMm3VjW1jmg44uisaiibupLnVxEQxbgJ+uGzr1X003BDjhu0uJgdDYY7RqP5xe
         UYlhDn0t82z1bbmjKdcM4vn+W5L7JtgglbFJEWwKCQ+5awavslceVDonXrihK1aIPknD
         CbPot6nVtfz+vnP3o2Hbs1eaoV/7LGmJK/6hw2a1lyKz3m88xHEVdrZs+e9KBVyF1nr2
         XPU4rmTedLRiT4SzavGrmiFl4JT5BiG3QZIttYccjt7iPFbyWCz/I3+srpnlxKtkMFuI
         Wxr4ABMqn+PEET49JtYpwZyBYcubXHQKpbGBBz/1SGqmAQ3fdIhFbcJD83DZU4ZKZbi0
         ZpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061282; x=1779666082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=ShKr+NYmmkXAcW3FFX0HuOavdRVfKOrdnRQPu7dJBa1W5WoNC03PGzbU+z8pfX1AWZ
         495pzPR+HRB7Xx8l0srtLCQG7rSW1uduDfhH/ApsKLH1N/+bf9myMVSYSQS98nH5UWOD
         BqL5UHSn35UCjukxxLEA23KC5mX/+o0IQfuAatOAkajD5uKAjyBmfQ3Fk5uW1nEcCeha
         Xa5dR0vn2JeWjX4v6PtzN/OqJUXGjXgjKW9gTQVqG6bPXiAfTLKKd39IZ+uqqHHFuYkk
         Tm4pyH0UCz5SWIi9nkql9hkBkX8ilHV7o1eAO+V1QJo8lUov45bOIigJxvXB0t9xglW6
         4dow==
X-Forwarded-Encrypted: i=1; AFNElJ+mz92+ubnU/LnYakIqoDK8/GuYZ7at+5/iik+o4FniwQNEMn/bXskpeG911txAAkHdvkS1Ni+jhU99@vger.kernel.org
X-Gm-Message-State: AOJu0YzbNjoGuXqmCUQm6MX8U5cWI2TBL0uxrpPU2Q7xVboGY4FT7xFD
	eUlPHuFFMb0/YQHh2Br3ue4Jb5gALLCvc4uUs2hdxI5HCJikpmO6GhFrT6dLYaAM
X-Gm-Gg: Acq92OGT44tFcBPOX+5Xi85znTdynfbg9N5Tvq25ONz8Dzw4WYiAgFHnNZYPBEzGdbf
	mhVTypm+/bX5JqTkSvDNn0Cg2if7svU5ZfkRKP2Nf1NTjx44Os4ac06XLkVsmcIbQVZG+bsi32Q
	MeHy5CE5pj0OYk2lrO4tT3zNplLUv8OYeg6ZA+b+T/uOb1Z0XBZo2EhG8yw2HNJciiTcklZ3Kjk
	N624qwWbfkwEMbVZG5ux4ceGFMdEgzUHDyF5+BK53s7F4dc+S8m/uSOnGwN7c3he9qXg2IgjtkU
	whaJG5+WKn30oasa14+PF3koeS+KOVKRA+QXK+89OCIk1sguHE98r0X0NaDWcSDvGY1QwAUeQSq
	yYFtbcYT9w2fX/J/VANvQE2XOaS7rByML8hFuDjeava0qnVwqmOa784ik5xnsX7DlS3v7wZR1hr
	hmzavAqap/pQktRTfqN3FvuUd9i5XMBd+4xmfFvcsgiGOJ/HOBTX8MBDyiysRoCezuRX2LNaSjO
	iy3lOKuZgFtfKHZeyq6aQ==
X-Received: by 2002:a5d:5f90:0:b0:441:2397:f40f with SMTP id ffacd0b85a97d-45d900ec71fmr25972014f8f.4.1779061282572;
        Sun, 17 May 2026 16:41:22 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:22 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Mon, 18 May 2026 01:41:27 +0200
Message-ID: <20260517234134.2737320-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..095cf654787f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.54.0

