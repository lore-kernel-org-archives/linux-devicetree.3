Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001A838B7C4;
	Tue, 24 Mar 2026 07:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774336197; cv=none; b=dtCY171ehiv5yMnLAUY+su2mojwrMLGFEVp7UZilf3vFQKYOC9adRP3ImmaOzBhTWJhg70FIL7wz5tbJ/qCxucYI94lqOEgxiviuzOl4OiVed8Jl2KPh00Yk87EDc04kRwYWENVwgmvtm6cuB7+C+S82T2SD+sFBLadfKY31600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774336197; c=relaxed/simple;
	bh=bLQt8fxJUw06nS+6jBdAfNbnHH4t0Q8Ek3Fdb97n5Mg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AmetvklwWj5blImkbObO3EtV3Bm/QiMtuphY3vTbq5m+7dfPBKrvwk3Y2W97ttXqn9354YHcp45qQccaQbNq8fYdhLSt1o6hG3MPcwySUeHDVhSWhDrh7cQfarSGptbtch6tms80ewPlje0sXUwfr9L08NX1Msm3bZFhKDTfJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=iqTJ+Q8q; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="iqTJ+Q8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1774336188; x=1805872188;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bLQt8fxJUw06nS+6jBdAfNbnHH4t0Q8Ek3Fdb97n5Mg=;
  b=iqTJ+Q8qcoXN6s3ramkNBNPhDE2FGpOhZb6f6cIzTksUSSNwSyFx06PE
   kk1cGfyPrnTC3rTHTIgJbdVXfq/e5C2+OBxzZAsAvveQDLwEEivcqTUVM
   M0wGz8ZZqy5FlMHVpHr5CB1L/F1n016/dtIcouH82EfFTu0WFGaUa6Ms5
   dSbJ+Jjgie+3UulOeaRa3e0x+1bQMNvyKHSQEvvbmMX/EIJQi7CGhS2+I
   iW+hHkB6a4mSRceACPyjDCK/tjFmx7yP1CABH0jwlSXbtDpZBzrSiIVVy
   hRa5BrB6c5fPb1j1cRd/yBC+NvPws4CTJwsxVanjSz2lAW7wJhzDB3A0F
   w==;
X-CSE-ConnectionGUID: X0VdBwDUQ7W4LQldQe+uSA==
X-CSE-MsgGUID: AMxJHc3JRHGY00R6eXHVPg==
X-IronPort-AV: E=Sophos;i="6.23,138,1770620400"; 
   d="scan'208";a="62806825"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 00:09:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 24 Mar 2026 00:09:38 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 24 Mar 2026 00:09:36 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 0/1] Add Cortex-A7 PMU node for SAMA7D65 MPU
Date: Tue, 24 Mar 2026 09:09:26 +0200
Message-ID: <20260324070927.1496-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch adds the Performance Monitoring Unit (PMU) node for SAMA7D65 MPU.

Changelog:

v1 -> v2:
- Remove the interrupt-affinity property

Mihai Sain (1):
  ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 5 +++++
 1 file changed, 5 insertions(+)


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.53.0

