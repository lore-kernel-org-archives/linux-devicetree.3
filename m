Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0C03CEB8A
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580454; cv=none; b=dIILG0bKUK0aWchjnfYsf2Gwncc+Aon6bVQGDlNifge1E+H/wemqQZQXWGhsmfD/DRJDAp/imKsKjFIY+sbAmsbOGGapubWCkTtYlqebd+aqQHXlYLxpjcX1WhrLmtBPDGqKTaluJmgNfTgB5F/ekpcarGrwr38HCAjpb0K+pDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580454; c=relaxed/simple;
	bh=rfJ2iIyE/bxbI1/JX5cl5HqgwlWuCfnnxGGdy33KbF0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ef4RXh3t8VXAnjLtx9Aq8gsOv6L2Ww5nElVBJlH84hBJX4yeuwQpG9oEjtdik3WyolXCJAfuPUWirmgy2n5rQjxQ3zul2PDdPZhDbZXlsPllLFNIkvYaA+lVuJ+MbKUiW3dAZT3JQpoxZiUWAeEodKqFrbZV2P5tQcspBPn/Fl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qoVNYkNR; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qoVNYkNR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775580448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z0ZpcCNUfATxa8RoeGtb5MGjaJovcJ7CrKKRB3IybKQ=;
	b=qoVNYkNRZD1A8EUvMewptB+ynQGtD1L13p0LrX+UuvP8IfWwlytS2sr/erBcz7VQzR1UJl
	o3bYIhNk7InVCnmWHbz1ef6Jkff+Mxmdm/f9ibHCFhJg+V62t0CZfA61mRK2PRNON0YYlS
	stzQzNvUCMhUhF6BCUu1j0WLir/yi3I=
From: Sean Anderson <sean.anderson@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] Update my email address
Date: Tue,  7 Apr 2026 12:47:21 -0400
Message-Id: <20260407164722.211610-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Soon I will no longer be working at SECO. Update the mailmap to redirect
to my linux.dev address which I still have access to.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 .mailmap                                                    | 1 +
 Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml | 2 +-
 MAINTAINERS                                                 | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index 2d04aeba68b40..b9b5b1cd81608 100644
--- a/.mailmap
+++ b/.mailmap
@@ -738,6 +738,7 @@ Sathishkumar Muruganandam <quic_murugana@quicinc.com> <murugana@codeaurora.org>
 Satya Priya <quic_skakitap@quicinc.com> <quic_c_skakit@quicinc.com> <skakit@codeaurora.org>
 S.Çağlar Onur <caglar@pardus.org.tr>
 Sayali Lokhande <quic_sayalil@quicinc.com> <sayalil@codeaurora.org>
+Sean Anderson <sean.anderson@linux.dev> <sean.anderson@seco.com>
 Sean Christopherson <seanjc@google.com> <sean.j.christopherson@intel.com>
 Sean Nyekjaer <sean@geanix.com> <sean.nyekjaer@prevas.dk>
 Sean Tranchetti <quic_stranche@quicinc.com> <stranche@codeaurora.org>
diff --git a/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml b/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml
index b1597db042635..3538eafff6b13 100644
--- a/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx LogiCORE IP AXI Timer
 
 maintainers:
-  - Sean Anderson <sean.anderson@seco.com>
+  - Sean Anderson <sean.anderson@linux.dev>
 
 properties:
   compatible:
diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc4..bc4b38eab832c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10248,7 +10248,7 @@ F:	drivers/net/ethernet/freescale/dpaa
 
 FREESCALE QORIQ DPAA FMAN DRIVER
 M:	Madalin Bucur <madalin.bucur@nxp.com>
-R:	Sean Anderson <sean.anderson@seco.com>
+R:	Sean Anderson <sean.anderson@linux.dev>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/fsl,fman*.yaml
@@ -28907,7 +28907,7 @@ S:	Orphan
 F:	drivers/net/ethernet/xilinx/ll_temac*
 
 XILINX PWM DRIVER
-M:	Sean Anderson <sean.anderson@seco.com>
+M:	Sean Anderson <sean.anderson@linux.dev>
 S:	Maintained
 F:	drivers/pwm/pwm-xilinx.c
 F:	include/clocksource/timer-xilinx.h
-- 
2.35.1.1320.gc452695387.dirty

base-commit: bfe62a454542cfad3379f6ef5680b125f41e20f4
branch: email
