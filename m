Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1A838B7DB;
	Mon, 13 Apr 2026 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776105202; cv=none; b=VGtHpO3OlLhKciAioSaOCBZgjPv72RffBRK6kg2OuFrwzsQe6NcpiUao1z9lH7xYvMPW/N1rehU/OGCFhH9QaIlE7ScBU6WRiQ4qXddDlS9l+L6ulf8+Fz+KWe43oScEi6GhhKhfjX62N0jRLS4XqwJJqTmhDpIFfLJkxHTjGfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776105202; c=relaxed/simple;
	bh=0dwtmznx/Tx4oC0WNz6InXRKvPKh1G47sMbviSLPYQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doAePd1ZyhldIcP1wNEXKinuea36BTD+Pl8XYA6FpnG5IpA+5HgCvp1Gm60uh/oDsoJzUolXqYIZwl1zQp5IzsQDQGMgYJZ26qUA4oAKvd420P/xgtVFZszm8AdVBViRvo46pUg/UbPkEzkUKaEZOFnXgqYVD6P9xa6IHdqi15c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=g/SMXM4x; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="g/SMXM4x"
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DHWGxA3011659;
	Mon, 13 Apr 2026 18:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=qJZo3RoHubY3+
	427UYcQOwBABNHb9pYAZoQ3zZiCZOc=; b=g/SMXM4xT0Ql/FY+isIvGqi8seiva
	gfoa/P55vLoinzuOkzcbNatMnrq5tC057pXmC+vaA0KkV8iX9aVwCCEwTt8vt5RR
	aq9An1kek9bRjwIiipBkpsy6dSe1hI4G5jQFQWR1KX8aOP+nAc8zNzw+ixbnbHEQ
	pBAFcE95LpP4CYF0KdpmEv79In/fAz6lJIYu8eqsEhVnoSdKY1yRzm6O8TaYSen/
	aSc7+eBFg0zFydmOR59L5Qy42A5CTpuL+UlANYm6X9yJxvZtIf+T25lQ2iE6Iig6
	9R87UdDrmeJuw5uhz9SzAVDhIWVzhR27QmLagnRjqDLoPdPed0N/gIhSw==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4dgwmsed14-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 18:32:55 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 0F82980170D;
	Mon, 13 Apr 2026 18:32:55 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id A403C810493;
	Mon, 13 Apr 2026 18:32:54 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v6 1/4] dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
Date: Mon, 13 Apr 2026 18:32:44 +0000
Message-ID: <20260413183247.1381172-2-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413183247.1381172-1-nick.hawkins@hpe.com>
References: <20260413183247.1381172-1-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k69AzusR9CTYGSEEG_8ejV_lS5vsfHLF
X-Authority-Analysis: v=2.4 cv=FIMrAeos c=1 sm=1 tr=0 ts=69dd36d7 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=6_mrDcixewTG61oOsKN3:22 a=gEfo2CItAAAA:8 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=HR7gm4R6eJ7T60OizSAA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MiBTYWx0ZWRfX9EzCjgvrsPym
 CKsNv25UdVu/Nw9ueiU6aAoM3etGyaJrKkDD7qF7Q/tn7iaYUj0Nv01VFRcP/4I6Og5h8PaC9yY
 ZMsNb93TbgYzM4sd5zUF/iFyMU/3S1QjnJD1zhVtndbW48K5bP/G3aRSO7ZewKC81jSSzVlQdjP
 6OaGG15UXLwN/cas4X46qZ6t7i/k9IgYGiuXhqJ3MkRcNFBU/g3FHEX/WXLTaTo9IUFEqpiiy/0
 la9+coUECna/x6FrPEyy2BDA4HaCDV6zXTqVB1tDsiFG6WyJW+iCLG5vKDWARoRxJ3uTCruaWNZ
 sp5bLhmiuRvo9VHTCTj8U83vaG5cSqeiVOYB7ZfDrnO/7NR0UXathlfV5aKpcinJNZcobkr98Jg
 avqHFfSeMrrwLpjfwRQawzTepUU3oZMkRGIYcX5nwmQMPNX9viT5diftTn+gqwfAOrVqgymvZQC
 dDVRW3Muv5UT7BqNbfw==
X-Proofpoint-ORIG-GUID: k69AzusR9CTYGSEEG_8ejV_lS5vsfHLF
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130182

From: Nick Hawkins <nick.hawkins@hpe.com>

Add the HPE GSC ARM64 BMC SoC compatibles to the existing
hpe,gxp.yaml binding.

The initial board compatible is hpe,gsc-dl340gen12 for the DL340 Gen12
server platform.

Add the arm64 DTS path to the existing ARM/HPE GXP MAINTAINERS entry,
renamed to ARM/HPE GXP/GSC ARCHITECTURE.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/hpe,gxp.yaml | 7 ++++++-
 MAINTAINERS                                        | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/hpe,gxp.yaml b/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
index 224bbcb93f95..6f057cd58571 100644
--- a/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
+++ b/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/arm/hpe,gxp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: HPE BMC GXP platforms
+title: HPE BMC GXP and GSC platforms
 
 maintainers:
   - Nick Hawkins <nick.hawkins@hpe.com>
 @@ -15,6 +15,11 @@ properties:
     oneOf:
+      - description: GSC Based Boards
+        items:
+          - enum:
+              - hpe,gsc-dl340gen12
+          - const: hpe,gsc
       - description: GXP Based Boards
         items:
           - enum:
               - hpe,gxp-dl360gen10
           - const: hpe,gxp
 
 required:
   - compatible
diff --git a/MAINTAINERS b/MAINTAINERS
index 2265e2c9bfbe..80c66de5e342 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2859,7 +2859,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kristoffer/linux-hpc.git
 F:	arch/arm/mach-sa1100/include/mach/jornada720.h
 F:	arch/arm/mach-sa1100/jornada720.c
 
-ARM/HPE GXP ARCHITECTURE
+ARM/HPE GXP/GSC ARCHITECTURE
 M:	Jean-Marie Verdun <verdun@hpe.com>
 M:	Nick Hawkins <nick.hawkins@hpe.com>
 S:	Maintained
@@ -2870,6 +2870,7 @@ F:	Documentation/devicetree/bindings/spi/hpe,gxp-spifi.yaml
 F:	Documentation/devicetree/bindings/timer/hpe,gxp-timer.yaml
 F:	Documentation/hwmon/gxp-fan-ctrl.rst
 F:	arch/arm/boot/dts/hpe/
+F:	arch/arm64/boot/dts/hpe/
 F:	drivers/clocksource/timer-gxp.c
 F:	drivers/hwmon/gxp-fan-ctrl.c
 F:	drivers/i2c/busses/i2c-gxp.c
-- 
2.34.1
