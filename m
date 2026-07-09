Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7CD7083C
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 00:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558209; cv=none; b=OnWAdYlU2iKxMIt7JynpLQcz23sHXDV4uPxYrVRzX1ZYStYc2MedZ1BL8eh8U15dYYdsyCQqcCckzE2eFuCxIMghY4IVJ/OLUsyNSbbPgnZeaoZVTw7gUc1nsjY/EuyuKQhP8jAcraPmJ+H0px11jEfCLWwJZVbr8md1dhua+SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558209; c=relaxed/simple;
	bh=mBunoBrAsW9c7R7kOlseZ4Ubhxx4LUetsqOUO0Y2L4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUB2HfardgBTgSl0wJS8TkrsWV1eGlJYAyrv7FfZ7CH4DzJHizlyEr8gW9eq1KudwHjemD4I2E3Rj4/TGLUU/Cy34Z079fTHyaFTGvg2bPwG9OvT6WPvAeZppWA5Wggu+DN1qfU5IOKsj7JHQDFq5e5XY9LYja+mMeh8ytBOQlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfqWtO5W; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfqWtO5W"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso423553a91.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 17:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783558208; x=1784163008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ONeYv8N9dUBr81lM9h8pInyopfZQ3N966Qn7edWjcyU=;
        b=KfqWtO5Wl5fp+4L0rZp4pIaJdPn5jBF8B/3SGhTJChYLiKWwBwY5kpQDy3DT+cbwPY
         5IdmUldoSpuXMIlC+xC5p0TQ3DswM36wJBXLPaDhVYUWTrP3wQgpeN4JPXxohaPkLecd
         AaT3Jth5Tu9Ss9c6nNKuVwPCIsggnyPMY+r3njkOdZlolIO8wBkVWqBi4oPj+XmX4hxH
         Rx4hEdq2vMBsAYfmq7ZRieHwyz6sP2ClKZC+BeGbjWJp9mQZr36MKwjae4AayDS8y6oc
         iAyHWRxp0OdcsJVFmAiob0AGYTwPfLK+3dCOsNikxo6zdQWKvoY2cY+HH6GPGiaKigpR
         ZLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783558208; x=1784163008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONeYv8N9dUBr81lM9h8pInyopfZQ3N966Qn7edWjcyU=;
        b=tOOn4wNGYkE0acPxxsM0BLw9f4ihFtptTkOyBSMLWlooSz/4A1xwnQp8REeFs+9HtZ
         qq00ZUiHU/oeIaKQUEBJ0l3HJC5pE2voK41ws7Thdy5OD/nbCC3i562aTrTolVOJi4Kq
         ruPfAvcFl3C345Fi7HjRxQqQRT+gxlL8GhAq7cyposGaKpcj0isRvZY5+A0GXZC+oyTl
         uZbTwIegKTJvEGJY48DuTXxot5Ye5fKmvq6UzEqlNXxnxcgw4WvEZgJA6UAiWgJjJhGf
         BVquvLpNANekiGYs86mP9HCl++xiNFFr/RbNCAcI/gskzbEHJlmwq1bH4US2w8YUeVmd
         l6xw==
X-Gm-Message-State: AOJu0YxkYIC4BzwjRJWWYpTSC8wWInPQhx/AO4ztuGFbXi/rCEDRYGmP
	rRvaw8fRBJ6EqhECZuwmBXXZrtnc7O4/plu3twc+lNV9fqoy7ZenudDVlAYfOw==
X-Gm-Gg: AfdE7ckctIGkbAJiR9AmpKpO4NKhUCE2bcRH8vPQYvMlw4WRf6Z4JPvK7Yw59Z6ujEz
	Ep1Y49LTPC6yt0TD8KEbvIfksNAqF99S8ZIED8aob4bW9fPHr4beyhzuG2U9jroe0ldLVXGJZqs
	KIIak92adCqnCmwRnaFAKvtOJA5hie5pzJEakbYPESiUZ3e6NNYab9MtwdVo9IpAn2aq6t/U1zj
	1O+DdumMOjcri6SBD7wg/g4YPX9AJw1fN8pPuVmVPK2EyNjk0TFK4t7TnKS/erAt8lhIJ71fYIF
	JbPNV1US+RU//UMEjtw5gIIddNIBLpz5t9tdKjCL+9XC4jrYxGfJB5FK2BBJFojs75Y+EokKi3W
	eVaw0k0FMkLeng/I6nz7yLric+ETZh9tJ6leSKntgFWpGl834sogiX26r4iYrQlV/M25lS4TZPy
	tvHmtvbBdBzaHLdZnrFRjrMFFJSFELQsJr3igSzCUW5IjRLrX4Um/XVEzVGVz/LoKheOWzzktkV
	OA5vh46v8hJ/+a8VHYD4DoH9bYUSjISWfE5OJgnrbUKAaCZ210C1RizIU1t9XgWuZlSll7hwwL7
X-Received: by 2002:a17:90b:3f0f:b0:37f:d262:1e0a with SMTP id 98e67ed59e1d1-3893fd5f5acmr4857883a91.12.1783558207834;
        Wed, 08 Jul 2026 17:50:07 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm35604605ad.76.2026.07.08.17.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 17:50:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 0/3] ARM: dts: helios4: add regulator supplies
Date: Wed,  8 Jul 2026 17:50:02 -0700
Message-ID: <20260709005005.1587852-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds missing vcc-supply properties to the EEPROM and GPIO
expander on the Helios4, adds SATA regulator supplies.

v2: remove thermal patch

Rosen Penev (3):
  ARM: dts: helios4: add vcc-supply to EEPROM
  ARM: dts: helios4: add vcc-supply to GPIO expander
  ARM: dts: helios4: add SATA regulator supplies

 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.55.0

