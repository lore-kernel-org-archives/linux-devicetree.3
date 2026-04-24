Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E4D36AB5B;
	Fri, 24 Apr 2026 19:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777058484; cv=none; b=DhdprnPj+QQfrudilKmSLQ6+R82DrR6fSDQpxgwqtB1KJEe08ZV88SneuTQlhwGIs26+kHgbbwBUU+KfHLcH3nKBE22tEcRS/BAdPwCHqnvJ/957Xe2j+7L9MCHqAzNeu6wTvxRoHiCMyJrd613H35aH2lE/bbZyKtZmuciM7aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777058484; c=relaxed/simple;
	bh=vtA3a8VJttJ/RUgugzEUJjXVC/tqXxTv7XGOrZdWfp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cu86z+x9jvzEn+jh8hG7BAkjLCqN2EXZdCUX2IWF+GLLzGzxftrDXP1QmKi9faRnSFUKFVGE9zPax70TvFRRx0n/VnK5ciS0tmUsIXOa4u07cjN+20rI445vHbZSRawQnEri8B0KmxAg6IECZevv4kJR90llJ3TMsZLpZIVLCm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPMZYDcQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPMZYDcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777058482; x=1808594482;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vtA3a8VJttJ/RUgugzEUJjXVC/tqXxTv7XGOrZdWfp8=;
  b=WPMZYDcQxyNZWUYf15ubRUazQ8XnfTpXH1jWT4iv1UrEcOUYaL0tnb6x
   lp9K0zX1bQ1JVhuweVqNZmGu6x18EMsANUdKxTLt5ZnQtP5B415VntiFH
   F4PnpDp9vEQuYzEa68xn8iQWqHcs2Uq5nFSzrDBHiH/kxfO1TACGbjjZA
   uTvI/IjKLOk6HN54746XLm9AeU0QY0giWih16lgpXrOLJkIV/X0GUQoFb
   dItNG+UdaS0ep3bC7NhXl1Lz7VaarRLjrP4DkS5qF62PTEK8hzAa0Hn47
   2U0wc19JIADUj2lS+AzWWLz7JNhSCvNrcHVE4jp+AoGHGDFbe+Ty32y2A
   Q==;
X-CSE-ConnectionGUID: Gfg4fQF8RjSlM5cKqKy8UA==
X-CSE-MsgGUID: AvkEuGBrQgqaItw38vFKvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77208264"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="77208264"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 12:21:21 -0700
X-CSE-ConnectionGUID: u9JzOGFZSP+X9N/OTCGh6Q==
X-CSE-MsgGUID: pms+UV2zQ9G5cpUtbEqmNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="232040479"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 12:21:18 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH v4 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and bindings
Date: Fri, 24 Apr 2026 22:20:58 +0200
Message-ID: <cover.1777058942.git.dawid.glazik@linux.intel.com>
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

The patches first move I2C controller nodes under the APB simple-bus
for layout consistency, then document aspeed,ast2600-i3c-global in
the syscon binding, and finally add AST2600 I3C controller nodes in
aspeed-g6.dtsi.

Jeremy agreed in a separate email thread that I can continue this
series under my authorship.

Link: https://lore.kernel.org/all/9d8c03d742fa9767f30e23d75ddf0baf4296c88e.1714647917.git.jk@codeconstruct.com.au/

Dawid Glazik (3):
  ARM: dts: aspeed-g6: move i2c controllers directly into apb node
  dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global compatible
  ARM: dts: aspeed-g6: Add nodes for i3c controllers

 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       | 543 ++++++++++--------
 2 files changed, 318 insertions(+), 227 deletions(-)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0

