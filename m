Received: from out198-7.us.a.mail.aliyun.com (out198-7.us.a.mail.aliyun.com [47.90.198.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5F934EF07;
	Fri, 24 Apr 2026 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021568; cv=none; b=TcelVwedcjDlnPcgyr/e6D+NLsN/jkwoZEhe2STpBGaibbudrT8K2glaIGMatos+cmg5Kz6GBstx5LOLStaFihqNQ9lOdHUrMRqKyT3mynslXSTSUBbf5MdMDBOKN02bX9vc8R0el8BMDhJW5GFFn/vDaNAvMadyWvx/1uX+UFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021568; c=relaxed/simple;
	bh=6aCZtPg87Y1M2DdguRjqyAFTX8sp4JNEkrDHBgMBx8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jlfNRJcZd48Njs5HBNW6b6VKguBaqMDiQbgsFHCnRQmU9tf1eC0F3UKz/TvHEsIad8qokLMdTbC+OX0oKOtQUDrGIPz74IVpeU96XRleImM1G23e+8uNTZ1mSMVqCBCdmMAxwAgU/m9cigw8B6FydrWkyicfz97nFPGFG6KO63Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=FuE9gt8b; arc=none smtp.client-ip=47.90.198.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="FuE9gt8b"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1777021548; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ecfHlwbhziqCnj0RyxvgFELOclmn9GpLOgHDwwYNFXo=;
	b=FuE9gt8bqRe8VqnA9HICyefLx5j1QrSXKANeo5feuaDfV97+s1nhfFDEjzHtuFyjSVDBxHqnM3LKWJHMaTOSt8qNT9zH93msVNJsVGKwIAkilMVV6MaKsFhe4hXCTQYX+49aDBWaEEILof/9Y7sNSUk4JDOXtwwe6DCCaUmn7B4JKlz6niEf2gM1wQOub8Q7/Q5wbc4r6MIUbnlDsE1uWJliNGqb+C89rM3RoSRXqGliX1d+LPFoNvzkVDn90lCmq4jpZ4So9aUpxrQdn1h3AxAZB6nlRB0rJaQPWG4ngMTTyRyKUtJJ763rb07bqH/RBDwNQp7jsbt1K9KR4MRPbw==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1011229|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0257291-0.00697652-0.967294;FP=310979370624404713|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037071049;MF=syyang@lontium.com;NM=1;PH=DS;RN=20;RT=20;SR=0;TI=SMTPD_---.hJOs6zM_1777020609;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hJOs6zM_1777020609 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 24 Apr 2026 16:50:10 +0800
From: Sunyun Yang <syyang@lontium.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	maarten.lankhorst@linux.intel.com,
	rfoss@kernel.org,
	mripard@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	tzimmermann@suse.de,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	yangsunyun1993@gmail.com,
	xmzhu@lontium.corp-partner.google.com,
	xmzhu@lontium.com,
	Sunyun Yang <syyang@lontium.com>
Subject: [PATCH] drm/bridge: Fix the interrupt clearing error in LT9611
Date: Fri, 24 Apr 2026 16:50:07 +0800
Message-Id: <20260424085007.3239969-1-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Incorrect clearing of the LT9611 interrupt register causes subsequent
interrupts to not be recognized.

Signed-off-by: Sunyun Yang <syyang@lontium.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 4517aee83332..f30a2875000f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -398,6 +398,7 @@ static irqreturn_t lt9611_irq_thread_handler(int irq, void *dev_id)
 		dev_info(lt9611->dev, "hdmi cable disconnected\n");
 
 		regmap_write(lt9611->regmap, 0x8207, 0xbf);
+		regmap_write(lt9611->regmap, 0x8207, 0xff);
 		regmap_write(lt9611->regmap, 0x8207, 0x3f);
 	}
 
@@ -406,6 +407,7 @@ static irqreturn_t lt9611_irq_thread_handler(int irq, void *dev_id)
 		dev_info(lt9611->dev, "hdmi cable connected\n");
 
 		regmap_write(lt9611->regmap, 0x8207, 0x7f);
+		regmap_write(lt9611->regmap, 0x8207, 0xff);
 		regmap_write(lt9611->regmap, 0x8207, 0x3f);
 	}
 
-- 
2.34.1

