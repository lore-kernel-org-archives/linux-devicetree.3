Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF053FBEBE;
	Fri, 27 Mar 2026 17:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633513; cv=none; b=RIxjE2F1MVnDioGsgJDOFc9OCfHxOTNHQEvHm/oeuuLSSWxd3XcShrkFh+xnZS3BpqlTVHBtkzKHj62XbYkXKukB9j4xB2v2V7T8DjnKHMyIBv00cFMEhUwg7UWhLroc+4a3Xiwx38gkU7G/VoTY72sAxyl97hmraFmiraDnCew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633513; c=relaxed/simple;
	bh=T1kpXndD8r2d1MNjnJG3EqVKfpfvpRYH5vh0QiL2qAY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=he38+izcK3SfecEAubdyReYTW0joGhyoM/7mC0kw9b4gW5qJKsYnqlW4S1g1ckecjGSzsuptUYg5VNLSGOy1Gr3MNhN2WjDR87qPR0n6HZJgWZpKocjHBFDFhx+fhb5X6SKD8ztvbR2cxPYn4QgCRJjbgxm1wZOJpPeuWKHPOAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=hf1MwA0e; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="hf1MwA0e"
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RG5uuK199946;
	Fri, 27 Mar 2026 17:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pps0720; bh=LhLmWBDumfqN5d8iw1ZWmxQBWAs/qsQPKjiuq
	cOx5ss=; b=hf1MwA0eQfuy2jYrHK1Ks6ubKmWx2zruO+ruEbUvi9hrtb2vBZmLG
	sqOwgEHOKf6H/u5MljZitFC0igQlRw0fPgYeu7V2Hvs7ERst8gRJFwK3wdTjbkQB
	nn7AwVW/7JWC3OU+uQpzIkZirnDs3cKIxf8E88HXS+dF50Fi2WwWfYQl3/cH9JEU
	k4WPjmqaoZk1OqRKsWMOi+thLaNFC0iJ6A+pWoiVYIf23OZFcba6X9iU634Oa1zA
	6WypGExfj2I9CBJoLuidl7Zi7zZKIk2mpRixu1K6d1dFrSHBLIDvItS5WHjNSsxS
	QBZN5BbdMAcH33+gLtyaCRcDlzZsZBSxA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d5qvcn6fx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 17:44:50 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 3D869310FB;
	Fri, 27 Mar 2026 17:44:50 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 450A5810AD5;
	Fri, 27 Mar 2026 17:44:49 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nick.hawkins@hpe.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: Add HPE GSC platform support
Date: Fri, 27 Mar 2026 12:44:42 -0500
Message-Id: <20260327174445.3275835-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mKdXloMvImZRItuJ7ju0cAXUU_qV6pkN
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=69c6c212 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=3haJ9R1Aw3gUfsUHDaCR:22 a=MvuuwTCpAAAA:8 a=YYSzPG55KGHO12cqy3UA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyMyBTYWx0ZWRfXwSLvB6RRoi6J
 zlx8GyjzjBeNH54/x4brN/3qoEvTkjje+RYQfy9la6L2XbiuYxY7OSHEzdGX0BC/itOujUhChNo
 IodW435I2l+Q20DqEgzXLdCqbDMY++biMjoqITluhOhTw1WiPGsX2JDjXUSAm9RrAYT+W/S/vQ+
 1Bx5b4EKIO2tjnY8xs/xemjnGq1u5IgljN2nYpTiJ4goFYQa7tpLz0H7UmiYI5uC2/T8pLeA0MV
 imZ8Ik5vD5rJIvNsWBYf4UOiDMqpUUbZtm1+gs0Xcc7gbmSjYjABcYsRKbGzbRT/+JHJjiZq4fP
 /Ftbpxk+2gRpnqFBQ0hDiJ9sZdhiTUAskqv95Pr2Qx1odFzRFj9ELGU4Yk0rJkgLiD0okRI9yqL
 UJMeesBFKqWtgivkoUd76z0EL5WpCfNCa2o/HiFgYOtCyx8PCC1oFdt6wr8bDH05vEfDsWDc8Pq
 7c9JRrEtLd9vNg0uX2A==
X-Proofpoint-GUID: mKdXloMvImZRItuJ7ju0cAXUU_qV6pkN
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270123

From: Nick Hawkins <nick.hawkins@hpe.com>

Add initial platform support for the HPE GSC ARM64 BMC SoC.

Changes since v2:
- Patch 1: Removed separate ARM64/HPE GSC MAINTAINERS entry; instead
  renamed existing ARM/HPE GXP to ARM/HPE GXP/GSC and added arm64 DTS
  path there (Conor Dooley)
- Patch 2: Replaced menuconfig ARCH_HPE + nested ARCH_HPE_GSC with a
  single config ARCH_HPE; removed extra blank line (Krzysztof Kozlowski)
- Patch 3: Dropped clocks wrapper node, renamed fixed clock to
  clock-33333333; renamed ahb bus node to soc; reordered UART nodes by
  address for DTS coding style; replaced raw interrupt triplets with
  GIC_SPI/IRQ_TYPE_LEVEL_HIGH defines (Krzysztof Kozlowski)

Nick Hawkins (3):
  dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
  arm64: Kconfig: Add ARCH_HPE platform
  arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12 board DTS

 .../devicetree/bindings/arm/hpe,gxp.yaml      |   7 +-
 MAINTAINERS                                   |   3 +-
 arch/arm64/Kconfig.platforms                  |  11 ++
 arch/arm64/boot/dts/hpe/Makefile              |   2 +
 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts    |  18 +++
 arch/arm64/boot/dts/hpe/gsc.dtsi              | 104 ++++++++++++++++++
 6 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/hpe/Makefile
 create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
 create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi

-- 
2.34.1

