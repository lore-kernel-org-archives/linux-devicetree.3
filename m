Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FCD3D0927
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 20:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604455; cv=none; b=qwxBXPOg87nZ8bQQDT3LColJ4zklqAMBDPB39bytQhoJA6s8Eribuo4Y+qwRXgjilEELd4pxKXhnNfNAlaZxMaH4rNoeesci7j5bRL6bSoyV1dZJrVklEyhnD0N9xamq31+MfJ2yXhFLeeRsVOxhS5/JkSOWISfAtpqqOfTnPBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604455; c=relaxed/simple;
	bh=bJg1j12BiCf3eHwsVqrznTlgnvYenenolEfmXM/PbCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peVgAlhuhZpZpTl3tZW1/WmvNX7fn2h+Mgjjk2ans1MMO65Q09ouQD/qkEJ+XNTO/24ZYclgDy6jT5xqwQmIpS0YAmhTxI+m6VXfD744fPVv6N5x5urRVPEJJnUc/Dn0086zncApJHAjQXbld0hXECceOrscnKJJrpvXFKzvjLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtyVrpCS; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtyVrpCS"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e709dd1ab2so140649a34.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 13:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780604453; x=1781209253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zk/LpczpOIZ/m2gamu5MAo/As7/Zfj4HDcgLAztLbtw=;
        b=HtyVrpCSszqQkc91xbkRn4ixy+SaVcuAwp7zTOEP3q0Ngn22qdaMx29/9WOAxODkJh
         AdVBkRFTXza8mcOb5gm+yyZDC0gwi4o8Qspia5AH9fUcTMA2iM/3sQy8vKmZBdGc21lc
         yGUwT4SvuY72MXmVeCJpZRFyxhfRrgYXG4ZTPOiCnuU2JkShKA3qsPTzVosPkHgd0kS2
         OGrV5zwag3PEGz6s3dQtXICMZCx+nWGDrWL23W68KzPAylsZWgxiFalUPTnl1cmZGw1E
         I1fHirJO76CkAsmt63dpYPukctopoSjkhDFnBWbWDQPFwfsYf/uMolW2sFcjgVJmGNjx
         KD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604453; x=1781209253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zk/LpczpOIZ/m2gamu5MAo/As7/Zfj4HDcgLAztLbtw=;
        b=HVpKCXpW8na3DjWaOJM8+6QTL9UmLUfd+9rSAQAGH+1No+skDNYaI32sb4/UCs0IMF
         Z6G7Zsh2PnEixl3rr2fPbBdnCsTi6lMLxwFofMSEmoSnCIqb+c+OpQyh2A74DRM/wz+2
         v4dgbOQPLy2CJMIXiewUty/P7Sr+hE0zPF53emG4wXXrrSrnbrLbcPtc4uvzJxtg9sz7
         n77e99/GsriTBWCogE+QcOH2azYgui57swAAlndzYLCYOe0Cmdye5S/2ulqNQaE3K3wH
         0K4IXlgO6GccEt4iIuOKq1AAfBSR7J5zcDH7TbiR+vHoYnH21EGC5roK9JpO24PX52eP
         P9aQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DcvF5PW6UkVn8YAW99jC9HBm5Hw17AO9xAj8ts2EaXVcUHOQVw4aECPkyT3hFqo7JYXCrs9R7LHpo@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWhI233I/rJKkV8vRFaNkPlmyCR9bMHxs/cdnDjLwMwS/9aiW
	VLjuoaUctApRe8pUUN4Z4629YdiwweNDBGDFBHR8TGlCJyaA0EnjYLdE
X-Gm-Gg: Acq92OFQR91tLxHXFGOCOM7vXMXuRfZxQY7Y4G7sP44BttD8eCEmrSEi8t4mDDOlUuv
	v0tvl2BUKhGY/3qqpyfa23hIOB18LkPHiSXDBXQgZ/xUMS0l6BW4Crccg4J4Leh+n76jbzDZWCe
	voPzc86Vb1CSew77T1xPCcpnhMbY3F891u+v6M/fJ4ZnIB7JPBI24SwlbFZZRuulmV+exU2/unj
	WYqDlcWy3jJM3pyW3N1fGpKKVAWr8tIslbvbaWnGid86Ytexm3O4B0drItOs6VS8BKsLKJe/9qL
	RZ7hqPwXy05ZzvJKIY9mqjwi10jDoJdY2b92YApdurEOUpEipAPLTj2qvZ0MPW9Whh8XH0t+6qr
	9mMl/SNgpHROZUB0MlCZgZ+TNMDo2qMO4QrTAmzeEfhQx28+mETpSYtPQFRZirh/MQ6EC396xct
	l1E6a2w8KImchtVXadR9ps+6aSm5Jc8dTvZ+wV+KfL6g==
X-Received: by 2002:a05:6830:6d41:b0:7df:5fc:3fd8 with SMTP id 46e09a7af769-7e70c65b243mr147908a34.1.1780604453056;
        Thu, 04 Jun 2026 13:20:53 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e796c675sm4541800a34.24.2026.06.04.13.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:20:52 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V10 1/9] dt-bindings: iio: imu: icm42600: Add mount-matrix to icm42600
Date: Thu,  4 Jun 2026 15:18:23 -0500
Message-ID: <20260604201832.60656-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604201832.60656-1-macroalpha82@gmail.com>
References: <20260604201832.60656-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add mount-matrix attribute to schema. This attribute has been supported
since the first revision of this driver, but was not documented.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 119e28a833fd3..9b2af104f186d 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -53,6 +53,8 @@ properties:
   drive-open-drain:
     type: boolean
 
+  mount-matrix: true
+
   vdd-supply:
     description: Regulator that provides power to the sensor
 
-- 
2.43.0

