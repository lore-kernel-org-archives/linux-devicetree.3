Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF97E78C9C;
	Fri, 26 Jun 2026 03:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782445164; cv=none; b=Lsy927J1cDqVVpJ5kEuHe34UQiqAl7Lfwib8aQvN98y0MMzPble4DYLmX+NhRactVZQrb6qVdGHFra8JshfYJ71/gm6pysDsp0vYYFvudpMws6GTIxU1yR7EHrdz6Zy1Q7F7sWQ0QplZ6udcNlOVCGcnMl3GXlujhxFSlJYgA74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782445164; c=relaxed/simple;
	bh=INqzTXGoS1suzaI3ikUXTjtcZQRw9FxXZ0nqJDfxkiA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XzJKG/4Z9lhDyAwkmtiles04JlpFi34jnyulMScmYV7zo3m0q2DTfcKP41MfjqRt5Ps5hSmtc/U1JvoiRIRADnQ7mFsIT0LGhoujJtHDPTx4H/BCH5+nynR28wcpxXG8tCw4xmkzrr8OFxODPB73zmCNJTRGf+xUnCv3r1lqSQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=UIg7yIvm; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="UIg7yIvm"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1782445153;
	bh=8uBQv04hD0/zXxhZtFQAYvxzT7I0MeWYK2y2zGPUFBY=; l=544;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UIg7yIvmRFAWbaEmBPPYlw6V8vZ0FWptU3Yd9D1mfY3jfGp+CUHeIqZn0zmvQU/MN
	 MN6ACU3u59W7kkAE5ErxsdFvuOyNIBGWrySLGEv5OpxDTpaRG5pczyERG6EN5w3TDn
	 BAhQOskpCeAQ6QTVhO4ILDgXoDtJjeXGe4Zq9QMfLuRXDnfviy+PmvyB1EOGrdXNke
	 z9mU/dQrxrxjfFjZfAqzJKEyyzvkAruKs+5HfA80HOmAWcAz7y15G7lp8dw3GKT8yt
	 LdSzwAz80gpmwsKGIiZDJqK8bD1+KNHrbqsz/ObPhh149R0i5b/CpEgTqqYbp5djYF
	 XX9/lkyTq8OYw==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1155907:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 26 Jun 2026 11:38:58 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Fri, 26 Jun
 2026 11:38:57 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Fri, 26 Jun 2026 11:38:57 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>, "Yoon
 Dong Min" <dm.youn@telechips.com>, <edward_kim@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] rtq2208: Remove the unnecessary MTP_SEL property
Date: Fri, 26 Jun 2026 11:38:51 +0800
Message-ID: <cover.1782444299.git.cy_huang@richtek.com>
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

v2:
- Remove'richtek,mtp-sel-high' from yaml example block

ChiYuan Huang (2):
  regulator: dt-bindings: rtq2208: Label mtp-sel-high property as
    deprecated
  regualtor: rtq2208: Initiate the default MTP_SEL state by hardware
    register

 .../devicetree/bindings/regulator/richtek,rtq2208.yaml     | 4 +++-
 drivers/regulator/rtq2208-regulator.c                      | 7 ++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.43.0

