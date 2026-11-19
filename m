Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112818;
	b=rFSGTFOouVbIQg0bFPcyuC8l/srC8MQHMAw5JvhnK4vn958KDW1+iJQCuil4G3x/UnOx
	 VdaylknR5C27rZGN0XZoPTzTY09epUeY14HuhTljFpMwle+olUxZouIwVRtBZZY+cZmuO
	 9N/g7GNC5zJRqT9BMa+etJLLKgwV/r7NGhH9yGuvL/hPYUbNEwvRgXIMPf9pjC+qHyWX8
	 dBBJNIFhsFcQ5OnrDgAYXTM03vysMeBRp50zVzhxnA4l7MOEKOSGT2EnvxYiDg0LSF8it
	 MMIyChd15VZIWzvZH37CzUqBqJODalGuNp4kNH2F8JOTI76jDGji654+i/oU2sLhMnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112818;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=7XKVf74bZ49xNeFhqK3BBEa0pEr/hyXteIE2thclohg=;
	b=4T9zjFEV0gPDk7gK4kOhwJnvgef+g3iaxCuS/Vfr58Jo5cNe/PwrGyR3RRhNb/+I2jCD
	 xyJpeEquMv1DFrwRk/agaS3tzhUh8ZkPwGRYNn650X53dp7Ay5YEdVBy0NRB6DipJXmUu
	 xPsu2LeiLmzcFcsl9feLA9+5e7ZY9pA5ADtOQKSw/xPXLHlE9J8OinK5xXB5Npw1ZQZ5d
	 ASmL4W92ov9Cy6wsAz6sHB5ekqcxLgPyd5lBHoqbuZJrte2dfUZbQP+dnyLGnUxkdcCai
	 xGdhOcCztlq5rnkZDZc/vIUdhbYCWtGvKRh7wC8hERK2eRhuEUer9wbJ3ppnY9VN3ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e0vI48bJ;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11012606A32A;
	Thu, 19 Nov 2026 18:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11012606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e0vI48bJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795112817; x=1826648817;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P/lRIKn7mbqvagK6b21mgg/jRRmvu5vkSsvQSOSueYg=;
  b=e0vI48bJKwtfW3ivnLldglFZV1E1SMB66RI2wVGgnrCmyouFguF1FVls
   Phe5rtKTaDelQdU4nzQvBMCweBB+9FZ+MjiC4UtwiZCOUEl8t+DdS/lvR
   x/4+lLyuu/lrltTqici6lo8lD2HEzgh1/AN5hc3S3o3Ct5i45rhmrlvbE
   LKB3AdSep30oRFVOuRcSVmtxksj32XM7u6SRV4z/oCZveAZ3PF1WA/etr
   JDv+ofqJO6JUZGlSWEt7+mcKxEetc5qkVQWNEWzMMsCrRjoyHy4nNoxgC
   cbpfACZ502plawpDfItMD7g9uhTefpjuBQ9QxNVtt2V5nkJW92RjMppPQ
   A==;
X-CSE-ConnectionGUID: sTpmo0q9Ri2KJ5dZS+lw1w==
X-CSE-MsgGUID: JuPlX35zSTqAIK1UyN86lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3861776"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3861776"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:26:57 -0800
X-CSE-ConnectionGUID: qZ31+rbWRtC6ZN00VYB0Bg==
X-CSE-MsgGUID: 8nuPVo1CS/uM6HumXT1TQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12479467"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:26:54 -0800
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	maciej.lawniczak@intel.com,
	Dawid Glazik <dawid.glazik@linux.intel.com>
Subject: [PATCH v6 0/3] ARM: dts: aspeed: Add Intel AVCRP and JNCRP BMC platforms
Date: Thu, 19 Nov 2026 20:19:37 +0100
Message-ID: <cover.1795114204.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

This series adds initial upstream support for the Intel AVCRP and JNCRP
BMC platforms. Both are x86 server platforms with Intel host processors,
managed by an ASPEED AST2600 BMC.

The first patch adds the board compatibles to the ASPEED binding. The
remaining two patches add the board DTS files and register them in the
ASPEED DTB build list.

Changes in v6:
  - Removed the default pinctrl from &uart3 and &uart4, which are only
    used through &uart_routing, so their pins stay available as GPIOs
  - Added &uart3, &uart4 and &uart_routing to JNCRP
  - Reworded the platform descriptions in the commit messages
  - Rebased onto the current aspeed/arm/dt

v5: https://lore.kernel.org/r/cover.1794242015.git.dawid.glazik@linux.intel.com

Dawid Glazik (3):
  dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
  ARM: dts: aspeed: Add Intel AVCRP BMC
  ARM: dts: aspeed: Add Intel JNCRP BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   2 +
 arch/arm/boot/dts/aspeed/Makefile             |   2 +
 .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 326 ++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 293 ++++++++++++++++
 4 files changed, 623 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts


base-commit: 3251db5e8a31b456ff9b841d73412a22735a7416
-- 
2.43.0

