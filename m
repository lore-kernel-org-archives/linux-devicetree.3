Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112821;
	b=1kbuw2kcgpyPSVjfCpKyDBTQ27/QPvwASInApp+3XOKaQzaBU6+iEKnn7pyBY8/3/hu/
	 7dPZFiw6du6OxvkFL9xN+RrTOWwHHX3c9QzMcYFM2XK+zne+b2CKPcpDYdzxL2cH+2XPH
	 DtZuILOze3jCx3WNLeH6WO87W4Kn6yESdaxkHzuFaR+WjA5bDlXE58U8f9zBlLCtBUURN
	 pgkXNFcrzWGmGkV95TbZ66vaWT8YDciJPny9c6LLgMjm39Q/0AzVQGvXVGpIJPfN7ulV6
	 VLXFtddvJGl9L9Qn8j7CdOGZxQwDfx7FdVzQlUV9MTl0oB9M/UeP2PO0y/adsRf3MlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112821;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=NIPo6JsHwPi3PMuDnG/ItHqGkr2IVR0/o1OghE79lDo=;
	b=Fo7mo2ZEEqbcc4On+TDM+XDC2VjLVa/a3T5qh7l58UaC1JeSqsIVS1qHOWjq6ey8Kp2m
	 LeZ6lTeM92XokWvyy81gUBeAZ8viqzj0ttj+b/PtbQ1yF2loe+YnMjP07PgVkYlLYeirS
	 hJhsyxXUgEZzDoXIXD3RsnWmjwWAjuls00emTsvyN/8YpHYUAdDANR4wtmns7LXve2roC
	 xezXhWM34benOtt+dgtGMY7uhuMLQ8zKn5FHNbG58TF5+Cvd0qtsuSsTfwrhXdUUtz3XW
	 KzvnCe+nkP0uhr8zzfbYFFo/yl/dDK/xUigc5Se9W9XzQZnJwqaBPT1Z1j95WdbFe3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dx3wuhdl;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB2B606A32F;
	Thu, 19 Nov 2026 18:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB2B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dx3wuhdl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795112821; x=1826648821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xDL2Dk0Ehk9c53PjJYhK7J4/wUrTV1V6DVnMm+9gFOw=;
  b=dx3wuhdlhFhFUzav5NMk59OG82IMW3F5U6AmiIYQuI12BP67exo4C9BV
   SZVgUGp0Lprv/SO1xC714wAPmmJuMW+80wfl52cZnBUZjH5sXAgv6l8C3
   xRQCyoHu35MupOnpZnQ1THjtkFnXvyOckVtdwFsQ/AfQZhwJcen1fDJO2
   vJNfIB6Hw1a96LBcHfvEoEf4zT8BaKxRM8X6fl9txgvWLQzMXnVoHZqAx
   rIke1eCIdNjuPGZlqaazTJZiju3E6GyuVTf0I8W7KEEz/v/u6ek/+RMuA
   XfHFZ8KI4O02JHbTORuBFcdsZz0nTv0+ejTkSHML0uh3RPXb/9mo7qZg8
   A==;
X-CSE-ConnectionGUID: LsYs+WlrR3+FFaV/2kkc+Q==
X-CSE-MsgGUID: xvVtVvZ0RMG8GJdBXTBDqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3861788"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3861788"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:27:01 -0800
X-CSE-ConnectionGUID: k8tXrjp6Tp6R82gItRzlZQ==
X-CSE-MsgGUID: e4O2IkxGSp6RXbLfzI07Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12479484"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:26:58 -0800
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
	Dawid Glazik <dawid.glazik@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
Date: Thu, 19 Nov 2026 20:19:38 +0100
Message-ID: <76493a8263cfaee7f700d497f6af475a44e2e85e.1795114204.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795114204.git.dawid.glazik@linux.intel.com>
References: <cover.1795114204.git.dawid.glazik@linux.intel.com>
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

Add compatible strings for the Intel AVCRP and JNCRP BMC boards.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v6:
 - Rebased onto the current aspeed/arm/dt, no other changes
v5:
 - Rebased onto the current aspeed/arm/dt, no other changes
v4:
 - Rebased onto aspeed/arm/dt of bmc/linux.git, no other changes
v2:
 - Squash the separate AVCRP and JNCRP commits from v1 into a single
   commit, since the changes are small and closely related
 - Fix compatible string ordering so the new entries stay in
   alphabetical order within the enum
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ac4a7a8ede0..41a0a4af9e76 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -112,6 +112,8 @@ properties:
               - ibm,sbp1-bmc
               - ibm,system1-bmc
               - ibm,tacoma-bmc
+              - intel,avcrp-bmc
+              - intel,jncrp-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
-- 
2.43.0

