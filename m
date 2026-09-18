Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40003C1F4B
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698027; cv=none; b=nDTu9oFSHZWaZvSm2y8QQATMGQFNEfDbR8edr5afWqn12m6EGCr+3ux9gloN2kNV7s8cKfJg4uMtfqoInB7kJEkJjtBafxOoxPY4qIzKCTlTWtCywxarUF3RcuxT/6s6j1Mr5+NumMak2n6cqXrAgRTUUcngQZ3vl8Cpl4LsSOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698027; c=relaxed/simple;
	bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGILusE50mMjJlidgAX0vfwzFwluTjPBxeCP8GrAH4ujUKM/JFllMhfv5LPztUN02LWMXzS+bD2jjZqH4GpAqHvP3L4ATNJU1HdbonTZRU2tY3JrUfHETk3/QI0ZHV63W7gcT6EuSpFH4kQvqoL38RV+44uFUSWN8ecmI+Oh5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmZgAq0h; arc=none smtp.client-ip=74.125.231.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmZgAq0h"
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-4a49b13b745so123500b6e.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 19:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789698015; x=1790302815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=hmZgAq0hFCl4Fd5zm2GTghfOilvCvZLL6bR2TV5c2JXjjNHkbUgoPSULN17tzwf5dn
         7TuoJ7pmq4pnxGrlYx30/rXjRy086CypdtLnbqEYfp+bbWwqWrM1oTDCXOLeMftUOBDX
         bEKwHtHhkFgP1ohfu4FSHk88cM29yZBELBFMwtrXu2sATt+BdksQpiSLzcOQuSWJsupT
         V3aAl+nncjOXbNWVHX4tQ2GtG7tB1IyNZH4Nh7x+0JI9usZdaR/LKJSMtH7uu5opuk46
         7bN1yvzNCbr063i1RX4SEmfSyEUF7tQFeBAx+GQcjFRTalshZD62slsvILKk7T1lFaz2
         GsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698015; x=1790302815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=DAAgcetR1bFfQXtv098DvoHrq5EHgYpWFH6oD/6u12e2NHDm/n94Id6iYWdvdfDJ9h
         hRZvhLczpXzxCCmQ686BwEHwsAK9LKRlzmlu0GzkZdWL2coeITAe4J21KeSvcxTpMn75
         J8MLeYaUPNKgZ5G4UXhcqYf7ngUYr33HB8s1NET7qFBqSRCnjbM5VWkHkNCDz+jRgk1V
         SF015AiHH/iGjK7GcGdx1E2F8xPhEZhWEj0TcUxwIZ+/d182SZ4nvwt2iF79rqrqROj3
         A+dlBiy3U5LLrd+ScN4EdGfg9Y0x+4zgHSNUGItVCPszHQSYUJUF3+FPfhUJmbyb7jK1
         a/uw==
X-Forwarded-Encrypted: i=1; AKwUvBzkGReqHkWOK4wPNQsLLTyZ/v7jk/4Ev+PvdtbG5GEv3ue+L+oyfLMrttL7izZmym61GumcH9AVkS9R@vger.kernel.org
X-Gm-Message-State: AFuF++lQRnHOMoe3x4Jz/1FNAcGlkO7/JkGx3s5Ag1y+3PNhWqoOA8L2
	sPqkl2bi2KWZZSWLqqm3VngQPLiQDvPjDODItSJjxeySWAXtch9aZJq0
X-Gm-Gg: AYBFou1JS5Bkk2EQwNLg0cNGulKU1ebeJf1bCZff/VxJ7wwWJ9JJ18RVCgi6fbhM63i
	Kq17WprmbqFMjEcewjThs4gpsA04EwbaE0gXbBfYukkMEOMSyuLTBGmZWnLi+xgenqKQO3Vdmug
	v/HLCIFQEI29juhBre/NR8zJzkHESwC/ibIQnG9tT887JnlsXO7+zn8Tgfh8RTwPbBvF/e3OXy9
	Gut+bbC5x4IUDDD2Z2tWpmlWJc8x09MO2BpgUl982lPqSrPPnSufV3eepfkp9OfGn3whfGtin3P
	yZq7I+ULYp+Zlt4jzHK0vRP9CQ2pDYeVb7pSBQ+W5ZI7POvaCt9HuUvHblw/98Nw7VAHi5Hc5Rc
	teSuo4AWEwPBYhPNxcDXT13jM1St23t3huKpEyQ5oHotoQrV/PUHOpzLlURJnMoQoRKVIN916TC
	80+fsSYWCYEMa/pf59Ezr5xiqJNLmnhye+FJFmqF6c+uSl7ynd3Bry5A9PQWUjhOu+cg==
X-Received: by 2002:a05:6808:bc2:b0:4cb:f21b:6f98 with SMTP id 5614622812f47-4ccf9b8f79bmr1640523b6e.43.1789698015057;
        Thu, 17 Sep 2026 19:20:15 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5226786csm295476a34.22.2026.09.17.19.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:20:14 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 21:19:52 -0500
Subject: [PATCH v2 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-3-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789698008; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=5AvlTzf3l8b4LLef4GkI1AU4KWt0gDt38qriJ2bzdYxbLUme++T/DOctXG9bxd6ylcEF2KKoj
 2xObESmwo23CDAaFIvEw6+yWIBFc38l1dxVsxUSc08ka11Xc1GqGfja
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0

