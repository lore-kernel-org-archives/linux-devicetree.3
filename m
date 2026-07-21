Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525C377ECA
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640861; cv=none; b=IOMhk/FKVTTGZQVW6oCa3zGH9DAw/Qhwudx0lfoKqoKQVHgMYfNBDJXG21vM7tc07oceD8NprOGnDskmLQyEJ8OUv02BoGdZkaHzyiDkpp0XLGINqGrKOlTPe8bvC8U+MzaRB0ns9Tf5oB8t6OuuQVUjxCfuuDkVu2HfH3LgnLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640861; c=relaxed/simple;
	bh=/0Awwl09kOvL99ptRnSi1wBrrEF7mbXusRe7FrR+9j0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QdwMiSjzA02XS2exWZvlSFwuhYaDIfPmfT6dzXVnB2m/NtFPaPNREztY+90JhcZIRWRwtPTgCA1mbjhl3NmMy10vpB/+T0fzhZQ+5NSsmQIYIvbpvl+WYURB6VspHclRl0gkD8prbgjuUWk1JBEEpFAjrDYAwtwtvAlP38j0vj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C86KvNuo; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C86KvNuo"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-973b676e5f5so1706391241.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784640858; x=1785245658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcW6qgiAPvU9a2XpLnaGi3h4k0DnWRZ/LjtvgA0+3fI=;
        b=C86KvNuo1i3J4EfF+VipMIh8uUBF7RHv2lW+VbXvm4QpXc+V/fB4mgQy6nTgD8Ej4v
         IJUQjYBpz3HFvhFwe0cnTn4FthfMLiZhJHV/NUcI1KaIwcls8vGyu3QGCQlo8W6AYHA+
         +PD4/qFjpexmzCpCH0YgFPnhPF3Tnbzay5G+1XWPUTjJviprfz2//lqWBoTmoCz2mIqL
         FLM9kj+WxSEOH/1P++y3QOgQKQ4xyI98vfbmXwx6d7oHqdi6ivd5jLtRqwLHUjQLa4n2
         6hu/JvvY51jK4lC7X820yKSqzLLVcqzjfM8gsMoPvHk9XgfI/nBHZbJt1FnYEoeN7hTU
         C8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640858; x=1785245658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcW6qgiAPvU9a2XpLnaGi3h4k0DnWRZ/LjtvgA0+3fI=;
        b=nTgWyvHsuaIVc+hSCMHB0QRCGCLfv4tnO6yOpZCLmOsJR2MnwwfRqfNinBnwBOJPVW
         6wFz+TjAm4TVCsvnECLTOljxsFTBSW8i1xDIko9ZRgzpyCDLyi7hIrGN81eAIYI/sC4F
         BoJLnHOGYJgk/VS5Eg4QTH1ZDG8ATrKoOu06UIzCoT689gJOjioN/rq+6OonRJoOGZ1t
         U2lklBWA/QpInFRMfG8NReWG6HWp/db7NiEzNWDW8pBGuZKc5ic7vMmukAyVsxUYND9+
         I+/eY3OcJGLw7VJBBqDJBOA4+GdIbigduZtwNP0yUGvQblKcE/CmvPHgeG1MbG1VpbOm
         B9AA==
X-Forwarded-Encrypted: i=1; AHgh+RosVV9h+mml9wbjNb/BjPp9rjlx40IHFyTHy/EBlb0/14Orv+HoUeGJAlE1ztkrxqIuDXZ3KfMRg5QT@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWwueGc11RDTRmGc/p54dB6M3N4Us5/F1GXNekcAcjY0h1bYN
	V8I+LaSS+ZwSTVMp4cBwXooAdowtftkAWU/mbH1s7McxiSECoSCtrT+Y
X-Gm-Gg: AR+sD129oJlJT8oMR96OgA6Cq2DnkV6Jg/MPPBjEpHS39gCQ4blt6REbc4RqbIqxO77
	1vH7tjpF6pCFj0BwH4k7TQt3mfc/CpoBz3gXxXJYVluMRbDMN3G8XoxhFHYRN7VFL3RpU9qiOBx
	atEtVsX5K3fjBTfKxafqt7TQlOUD7xte2FPZT91DBaMiDzrYPKp56PtbLXciZ58ylZySWIpVQNE
	88WZLpCCnd4Zwk8g7XzDBclcQ5k2c8OT6fR4wtSrIsGhV5APwXMnncOg4GytEJ0B4Yi/xgfCNGo
	m2bmZtScGKlTMoxl/rFcS03VqqawHBluEIqvYvwTvO89AKlYknK0v3GYVEBei4Dbmb0sYFcgHPO
	87tOzEOZ9BOM1JYy9wgrIVDg92Cu7+KdaTPJ3v/IjLVkcuq6s2vCQbzKehRxNIPpneoYHc3bVfZ
	+X4vWaT6BoFWKJ8qko/GUlo0g2g7vtdBGllpcVhHrE3wPoKqoJ/Q==
X-Received: by 2002:a05:6102:4422:b0:726:cd42:d039 with SMTP id ada2fe7eead31-7475374f766mr6094327137.24.1784640858518;
        Tue, 21 Jul 2026 06:34:18 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:a24:fdfe:648c:2808:d17c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74757c8048csm11903908137.0.2026.07.21.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:18 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Remove invalid rk3566-bigtreetech-cb2 property
Date: Tue, 21 Jul 2026 10:34:08 -0300
Message-ID: <20260721133408.44240-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'ti,rt-thr' property because it is not used nor documented
anywhere.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
index b6cf03a7ba66..542269c338da 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
@@ -569,7 +569,6 @@ tft_tp: touchscreen@48 {
 		reg = <0x48>;
 		status = "okay";
 		ti,x-plate-ohms = <660>;
-		ti,rt-thr = <3000>;
 		ti,fuzzx = <32>;
 		ti,fuzzy = <16>;
 	};
-- 
2.43.0

