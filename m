Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FFD37F00B
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 19:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775677295; cv=none; b=fXQdzODDXP9aPa4ra7K8Jl8o2BoEcWNSCkc0jly2Yom67qT6qOILoJNGmkQNQwTOGGy1n3VsB7zGnNcrue3wFnj8Rk/9MVMnfNGHxWunsR2tVmFd3RdHLAuabfYvTu5i9KyNWScrmNVWlJLkokatxzWX2QY4Ad/uICRu85BL49Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775677295; c=relaxed/simple;
	bh=m2f0MgviSe4n7FamZwL8P5PBCKEndEE+/KV0B5nZuDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BodsbNX6MDbRhKHKmEF1dX5bTZVMANt7UvdyLa6JAQJsMc8DiOIkvHHGidmwOBkcgh7VnceCPma8ZIspUMPc9nnzuhOrr+YLDWmdMA7wIFRiOkZmkuP+Xr212zog6RobkSxeZPCDwpgz43SBSCUDdgYGr18AHNZ0Jd5e7vKg7rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRRC/tK7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRRC/tK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775677294; x=1807213294;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m2f0MgviSe4n7FamZwL8P5PBCKEndEE+/KV0B5nZuDg=;
  b=JRRC/tK7z6+vdTdHs4+x4pQP1xdjunLhNDJMAo2cZO4mmSw0EJod35rZ
   7Saues1c1eh8BD08CcCeXLzLDAL8MaiM/5UolCA6CcyeFGxXk+LZXWqaw
   YtbXpvopjrQnzNiSDxzODk6OD74MW8kgCC15fSxUuVksd8Xqy+tegg7EP
   2sanCiencX1dMXOI5yMryMWGl0Uiv3KKyOuiYV0zRp+ly+PooIvIVW7Ev
   J/zlqOQcvbW5PhaJBnteYEz/Z4rzi8mIW/OkTCLRL3CI8luFLD686K6LK
   jOn9bArIudbm5FwsPhU3RFqFyfPx63WVJDe8s6hS++/H7lJfsWFW5ONAr
   Q==;
X-CSE-ConnectionGUID: rOiaYSHcQXOyALGenOvaxQ==
X-CSE-MsgGUID: aA2BJS5rTv2b6y36ITtnxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88056879"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="88056879"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:41:34 -0700
X-CSE-ConnectionGUID: XAD6QAc2SwKwIrhvqhfXHg==
X-CSE-MsgGUID: 8wH8aIgPT6WijufKP3yuHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="222053320"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:41:30 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Dawid Glazik <dawid.glazik@linux.intel.com>,
	Maciej Lawniczak <maciej.lawniczak@intel.com>
Subject: [PATCH v3 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and bindings
Date: Wed,  8 Apr 2026 22:34:32 +0200
Message-ID: <cover.1775679285.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

This series reworks and resubmits AST2600 I3C DTS updates that were
originally posted in 2024, but stalled without further upstream
progress.[1] The series was rebased onto the current tree and merge
conflicts were resolved.

The patches first move i2c nodes under the APB simple-bus for layout
consistency, then add AST2600 I3C controller nodes in aspeed-g6.dtsi
and finally add the missing dt-binding for AST2600 I3C global
registers. Jeremy agreed in a separate email thread that I can continue
this series under my authorship.

Link: https://lore.kernel.org/all/9d8c03d742fa9767f30e23d75ddf0baf4296c88e.1714647917.git.jk@codeconstruct.com.au/

Dawid Glazik (3):
  ARM: dts: aspeed-g6: move i2c controllers directly into apb node
  ARM: dts: aspeed-g6: Add nodes for i3c controllers
  dt-bindings: i3c: Add AST2600 I3C global registers

 .../i3c/aspeed,ast2600-i3c-global.yaml        |  55 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       | 549 ++++++++++--------
 2 files changed, 377 insertions(+), 227 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0

