Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54201372B45
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 04:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781930419; cv=none; b=k+U3+V5tI1j25Xh/Tt3YUH/o7trhaD/HIIqRgCJfg3H7wgvn7z5Zgdha8+tvkPt776dWCUmOck5Zc6m808vbJDigUHt/m/FniLMb7sUQSz11A3bIm+SMLhVfksSMA7+UjN3cXQkiY9rDn7W2ssDx3Vl4v0OprQjc+oNRERR4/mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781930419; c=relaxed/simple;
	bh=JBNIqf2eTrRXZ9/TbvTv1ucjbReEIe0UVXxGsCJYL8A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxVE51iy4VO6k45xn7TZ5XT/TztYF0uqkAfH7hXh37XhoQJ2KtzQkHomXieIyS1oAY1uCcJTsmBGKdQnGRPadMx2E0Zi82+1NcIj8CQIhEkpVq7pdar7dQ+22LLb0t8Kj0T6NAyo6eJwRTRYRpH2/yMt4k/F/OzTYvYt/kj753I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+c+VP6p; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+c+VP6p"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4896ae35be9so721286b6e.0
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 21:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781930417; x=1782535217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p903FzlWhZFqXdoaSbD95bQ1EP9oEVzNqhz/9QS+ytE=;
        b=D+c+VP6pkba9ufzIIcBqbloqJmRyDd+lxhRLa24pcWze362yc+rqddxtQY79q8kWKV
         MHVfd3qfjR2vej9WLCErApEu5WI7VRCKx9t3bJTOiIG2AOzJ9E741sxDpFoc0Yr6Jp5f
         ylxE/uho95dvRi+TbJ59GcIHWcc8KI920iZDhEmexAwkIFzeGvy3dsFSLxsJpvhsNIOn
         lf556cxZz6IOeU6KBFuY4+drRtGI+eWtxGjP5RyVgEIJ547wMtje/It2qDii4/KbSfRM
         Ss0QC4lPcBDQhh7xEOYd8KZLvPMm7xHtd5ol9mMdrMRc+5nVleOGKNlX1MDD052sgnT8
         JqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781930417; x=1782535217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p903FzlWhZFqXdoaSbD95bQ1EP9oEVzNqhz/9QS+ytE=;
        b=jN6IXAifnETeY75n89IJi2UVBK/lIXKaBWNtDkQFkxwb7IEHTiwO25hBGJi/r7yVGh
         E8COQyW7eXd4JrIUasW8fhtirihOTvtjMjHovOPP6Ew86BYO05bdRZjb2nEIwHvskll8
         WNTCEXd+7s5vjkU5DEP5+KSQpbPczhpN5H/WEkek49sCM2Qx0hmuxNBWU7A65u/PlWAb
         UCcdf49Y2rgebvsyt6HcEf7V1EhA27ITmoFC14E/jjcoUCIV/hV2nSDPijDrstI3dhey
         dZnfxtbARga3K3plx8o/v4z8Z2j3HXFSZzTTw/jDRYgPKUDHg1Mv6meMwKdKB4hpWix3
         r0Ow==
X-Forwarded-Encrypted: i=1; AFNElJ/OwZyuPuFTH5+Zngv838cSkHA0GMwcyuiBCQzyx5lyhhcmjs2oLtnNoYlVV4V4JNUNPUerAGcHw/pE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg1+GxEvP5E8z3whsMDZrSYKkSc3wElzw0BE2SODYBiYvbvd7J
	NmhUA5ftzvj7mN1a32ca+ct65ib19/Q1Oa9uDGXRjtC2u1KeSD/1xVc4
X-Gm-Gg: AfdE7ckVptj4HXrL71VSm46a91I+ErG9INcR0MAH0JiOONuQmaTP56/UR7uWo5x06jq
	du3fcai2rDNmnC0xKE97bQOf0ASWsperjBzGG4cCJTMQxWrl/zxp15jsu3z+F1WcEZ7xRft9Lef
	IKsjLyUDA/qgeNSU7eTpQsB5TAXrVdFTy8aYlcLtHnlZzv3NavF1Z/n1uBuCWk6JRAwUYq/FDva
	fIpmcCvnN+nlyXUHNa6f090te7mWV/YqJvwCpX4Ob9ag4aOz1qMvIuyCROKEDcNjmDprxrPswrD
	hD+wbpRH/9OINJ851qxZr2XQtsc5uSdsiCExNxNpIaql/2DrqtHQ+ZeKK9yQPNafvAMy09ZLXu3
	HVwDa6QvVsPriX3LBxoBSknQhtRp0yObEmuWUt9oL8PWMMYSEdKqQV9MQhXqNnuzMD4WPYwcEsU
	w4BQzH74bnKzm6e3+W2ThMpXhYyEd68YEHlTftumzv3Ntohlk=
X-Received: by 2002:a05:6808:4f08:b0:489:5dc7:dc55 with SMTP id 5614622812f47-4896ac76486mr4978993b6e.40.1781930417349;
        Fri, 19 Jun 2026 21:40:17 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aec0ddd7bsm679754b6e.7.2026.06.19.21.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 21:40:16 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] MAINTAINERS: Add entry for Sensirion STS30 driver
Date: Fri, 19 Jun 2026 23:40:07 -0500
Message-ID: <20260620044010.1082621-4-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620044010.1082621-1-m32285159@gmail.com>
References: <20260620044010.1082621-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the entry for the STS30 temperature sensor driver in MAINTAINERS.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d95d3ef77773..6bb361ac213f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24487,6 +24487,12 @@ F:	drivers/iio/chemical/sps30.c
 F:	drivers/iio/chemical/sps30_i2c.c
 F:	drivers/iio/chemical/sps30_serial.c
 
+SENSIRION STS30 TEMPERATURE SENSOR DRIVER
+M:	Maxwell Doose <m32285159@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml
+F:	drivers/iio/temperature/sts30.c
+
 SERIAL DEVICE BUS
 M:	Rob Herring <robh@kernel.org>
 L:	linux-serial@vger.kernel.org
-- 
2.54.0

