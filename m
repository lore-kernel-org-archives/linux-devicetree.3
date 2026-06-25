Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540A6368282;
	Thu, 25 Jun 2026 02:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782354083; cv=none; b=aoEnkAPqV8umhSXln1nWRLM16NGeDCJrxWDojORjvn8Y5Z4V7cyVkRLibnUMH35RVvuesWa97Wm8W39S0M+8lWarNGQlWSvpCvvMDVpI7vBdALogRZmbxKzFbwPv4KQ4INmhCfO68c7+02yU+N58DDUTluxfRVrpzOxDzbW2Y8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782354083; c=relaxed/simple;
	bh=FQPp29QYeK6SH/2eMU3elbE4b+N/apy/2bHYa4tYqCk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jKNBgl2ImlRz5H9AXVe32ieFNZudG7jfzMddtsTW0NKoJnmG0kvqFuM9W2BJYQofItFDUHxGPMFQJDLJJy3sl9rEUEOiwEvmUra4bkycYGtnKa4X4WlJmaZM2UsYEXFTrP1WQ7dG55D/D31eQiLWYXJx7uAAHnksCHT/Ub8jxUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=Rn9VVZht; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=mKRM2q3j; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="Rn9VVZht";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="mKRM2q3j"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1782354075;
	bh=TdkGUMn/SqX11xQxQeSmg1el+7f50A7Ug9aYI52XI5k=; l=479;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Rn9VVZhtB2Kzq1yqBgp265jC048GfAhYJEzW1UcyYi4ztXjlUkxOIShwslwRjoHuB
	 vRQcjEXQI67A26DIgEdHl2aZ7zeOHULis+RaFtTnzKzIFO+LPI0KAnUJqEgLhL6JZd
	 hC0FeYu202nWraasoCxS3+4TZG3qcgmQyOovwH+5qS5UrWjT+gy7LxYS0km71XsmIs
	 4E4OPo1ln3cH4daGWAqKdeJR39lfrpkchJILJndR9buXXm1+oEuksd2r9F6Ceso4aU
	 rtZr1utZXHr1p46powFAUU4kCGleDfxb4zGvx9HjDV2Ot+gDniHYeSHPSdB3poKXXS
	 3xeWeQVU7ZHHw==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128083:0:AUTH_RELAY)
	(envelope-from <prvs=163233BBEA=cy_huang@richtek.com>); Thu, 25 Jun 2026 10:21:15 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1782354074;
	bh=TdkGUMn/SqX11xQxQeSmg1el+7f50A7Ug9aYI52XI5k=; l=479;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mKRM2q3j4k18wr3ayEbHK3JXLDGh2omHaAUpFcSzwIwSRE3/OpWTii9Zk/lcHdP3i
	 L96GT0qckBiOPdJjxydGtsdYrsidwHcQoJBaHixnbWDMtBGYHRDJw6TQ31tCt60dHP
	 oi+a3XIwFjrHnqGZGKgvr1CV9nwdRhmB7TpKBbDu4ubBjT+1rwVo9S2DrG+HU5GJ00
	 dSzh/KylNDwk6lh8qxpiif7O/qYazsOw5v8AAb8Rb5plGi8UBMESB/T0XglQk+cvCR
	 FTQjMwFgL/6KkVxThTTi+TtkLbXtXiKBNw/4nE+bORKA7ZEQqxKyWwqWIrbIY6AouN
	 D44W1dvoUVNfA==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1155879:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Thu, 25 Jun 2026 10:18:36 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Thu, 25 Jun
 2026 10:18:35 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Thu, 25 Jun 2026 10:18:35 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>, "Yoon
 Dong Min" <dm.youn@telechips.com>, <edward_kim@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] rtq2208: Remove the unnecessary MTP_SEL property
Date: Thu, 25 Jun 2026 10:18:30 +0800
Message-ID: <cover.1782353659.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series remove the 'richtek,mtp-sel-high' property usage.

ChiYuan Huang (2):
  regulator: dt-bindings: rtq2208: Label mtp-sel-high property as
    deprecated
  regualtor: rtq2208: Initiate the default MTP_SEL state by hardware
    register

 .../devicetree/bindings/regulator/richtek,rtq2208.yaml     | 3 +++
 drivers/regulator/rtq2208-regulator.c                      | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.43.0

