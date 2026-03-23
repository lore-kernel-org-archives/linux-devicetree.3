Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1626B35B631;
	Mon, 23 Mar 2026 19:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294967; cv=none; b=l+LyuWA3v6nmIYIKdGhYM8ZKaknbmxlhzYVoqbgOHuOdLPKQGGlJhHHIdiDiG6kql6ncZd7fu+T68UJvjr/0AjZYVTFkAUyM1Um40B79S+jNdEX//Mh/KD8M2lxzJM2AJb7p87/eLAP6OHOaDFgjpAdYhWQyranNEjtQ3mE07sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294967; c=relaxed/simple;
	bh=z2Htdlel5aNpUbkOty3RjRlhV+r9aLAPA9hau4LXzNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NHLu6SE4f2OiN7LmNrlGwFlRUslggYyRB8KuORhTK9j1sInXFEb/csq7PE0iA1SQeOv/Ko/uSZOR/d3FKAovP0F+oFw5mJ2HG46HbtIolEkfw/zEpwv2sIgmkI4eOjF8lxMiAiu4tyIgZLeqLCwiqUSicvhsnVz2YoWfk52nDzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=TcnHzo93; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="TcnHzo93"
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NH9it82143527;
	Mon, 23 Mar 2026 19:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pps0720; bh=pFb1z8ApkWo0l8jCpuiU3l/hLFv+9oERF7ouM
	datP8E=; b=TcnHzo93bkf6XZUAl2BzboPpKaEagWRHtDoL+fnxAsOVs/6Fjqaj3
	O2b/jB4yujL9dwAMclMYc/LDOD++Tpov6sepNJQNNEFycdnR6ROsedZw02Nnx3BM
	cQIlOBcNSrNnVK7O95O1swSskUa2jhlZggKR4iPEPhV4t8h/QOQ+hNSvomWa/LDK
	0OfqMKTeg8rIhUTw/6b9k62kXz9tnDcUajOC0sisCtcTGLJB2Oy/1iKyTC56Txd8
	qCK+PmQgB52v8Na2tP9Oq1g5kvlTn904Lsl9tsQIAv4jDyVpDtr5gUYyn5xXzvZP
	cwzPe0Ie4tCgyMij6HUIhhrjGl252UtKg==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d33x2xbqa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 19:42:29 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 4C71280163D;
	Mon, 23 Mar 2026 19:42:29 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.39])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 6900C806B5F;
	Mon, 23 Mar 2026 19:42:28 +0000 (UTC)
From: nick.hawkins@hpe.com
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean-Marie Verdun <verdun@hpe.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v2 0/3] arm64: Add HPE GSC platform support
Date: Mon, 23 Mar 2026 14:42:20 -0500
Message-Id: <20260323194223.683487-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0NSBTYWx0ZWRfX7A3Xk6GEaj8a
 L93ySiphLkKEAc5xxK33ZMJnbEXwxlnyuQQWEGeJ4M4Kc/yLE1W3hgFvcRTFc48YPDjI19srs1v
 +vKnMIbtKY78eDBlzmorzycHK9bnPP42CVPZ69fb/aEXYjW+HQYatfqpVTGkVlt3g7qPiaEktjD
 V3M0xFGhbzdGQcp1az2sQBCor/mY83a/y9lwU0xxRoGix3sXWn5G3diYATeTs8NcnKSzdzmCXM1
 FxX34IUFq5wf4KUwFA6XeuExDSOUHujJZXrhm+N6bRmb3QqNW2Q61WH0yPdgx3aIV2ObREbJiSN
 4/nlNWWZDWzmnDDWH8GSDK60/ul9nkHW08SudPUiysm8qXsE+oUbxpnYn2b8CtKudr9iakbOfSX
 BsmgMfpxuUhqOJU3NcvGgqa1+Tej0mXCvYgi/u/deyteouFkt7geKZ7kPsYTMdP3UDQ6KPj/VDR
 YYyDSwBk9sbLi+CqfKg==
X-Proofpoint-GUID: sJUsmpsXHie4aD27ZLUFcu8ylPAVmqsi
X-Proofpoint-ORIG-GUID: sJUsmpsXHie4aD27ZLUFcu8ylPAVmqsi
X-Authority-Analysis: v=2.4 cv=X/Vf6WTe c=1 sm=1 tr=0 ts=69c197a5 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=g3u0LPWLDYfGfufhFw6-:22 a=MvuuwTCpAAAA:8 a=MGLm-9nv1a_vww38N8wA:9
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230145

From: Nick Hawkins <nick.hawkins@hpe.com>

This series adds base platform support for the HPE GSC ARM64
BMC SoC used on HPE servers.

Patch 1 extends the existing hpe,gxp.yaml DT binding to cover GSC-based
boards (per DT maintainer guidance: one binding file per vendor).

Patch 2 adds the ARCH_HPE_GSC Kconfig entry to arm64/Kconfig.platforms.

Patch 3 adds the minimal SoC DTSI and DL340 Gen12 board DTS.  The
full peripheral set (i3c, ethernet, etc.) will follow in a later
series after the relevant subsystem drivers are accepted upstream.

v1 was submitted as a single patch containing only the DT binding.
Based on review feedback from Krzysztof Kozlowski, this v2 expands to
a proper series covering the full base platform introduction.

Changes in v2:
  - Drop hpe,gsc.yaml; extend existing hpe,gxp.yaml instead
    (per Krzysztof Kozlowski review: one binding per vendor)
  - Split into three patches: binding, Kconfig, and DTS
  - Add gsc.dtsi + gsc-dl340gen12.dts
  - Add ARCH_HPE_GSC to arm64/Kconfig.platforms

Nick Hawkins (3):
  dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
  arm64: Kconfig: Add ARCH_HPE_GSC platform
  arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12 board DTS

 .../devicetree/bindings/arm/hpe,gxp.yaml      | 11 ++-
 MAINTAINERS                                   |  5 ++
 arch/arm64/Kconfig.platforms                  | 18 +++++
 arch/arm64/boot/dts/hpe/Makefile              |  2 +
 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts    | 18 +++++
 arch/arm64/boot/dts/hpe/gsc.dtsi              | 73 +++++++++++++++++++
 6 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/hpe/Makefile
 create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
 create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi


base-commit: 3f4a08e64442340f4807de63e30aef22cc308830
-- 
2.34.1

