Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9DD3C9EDE;
	Fri, 10 Apr 2026 17:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775841415; cv=none; b=gRmQSRVxKtr+U+ZNG79WeqYfZ9cZsSWqnA+yVPlfCT78IGNhg9SM4l4lSS6KsjDyQrXo6tG6mIRJIHCHV9j2KORNqWmIRqLgMd0tvK05gZ+3THpExJwepcX8MVW+ggOG4UmGsRTcAbhvjtbUO/BFgB8+Y10GSFRDEnyyyexdI0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775841415; c=relaxed/simple;
	bh=2T+HDpo/HyGDyyW8U1bYISA5xOeX8nV+ISY5tK5Q4dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixNVaw33Nfom+Mnr85g/BF+hrRKZm3clUN+74VIpQfHM1PRbG+gogByIpna60rzcvCJuveYTrN6Tulv163Iy2SANoFti2tMdofyeGhjjFdVSCKieZWUKp1zc70ERgyNQA1LyTpM4IHyy6OaG/kczXlcZSaozOEMXSAOGzB5ps20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=KpTr5mtk; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="KpTr5mtk"
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AGb9fC881175;
	Fri, 10 Apr 2026 17:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=vuUqFQvGRTPdk
	WC7g/Q7W4VqEsaDgZfbJ0ZChsHFd98=; b=KpTr5mtkPCm/2+ufvYYJjZurj10i8
	pWsxMXYW+UFhW9Ar1FXuVvlVo84oGE+H2xNN07TcJINoma2fikPjvV4njuJtI3r9
	VEjsz+cOmBDuLmlSapZz6KlkLOMDrVUXHV4lmtlCDpy/MBCJg1Od+0KcOOBqO0JT
	AGJK76HGHUtVaZzZT9N5XpYhwp/nbs8qFgAQzlzZLAphD8rx0JeHQ8E48Z0XX3lx
	bjibnU9dWTsDh06vKKKomGHqdWdjaYAtqMo6z9uu7tDWSVQdMqjdOpa7rjQaZ93f
	cGzWvuaaqNDhoZZnRgY8PhQOdyio5OGUtN440JHL4cLPgQaRQJiJg7Flw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4df4vp0eay-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 17:16:27 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 61A3AD1EE;
	Fri, 10 Apr 2026 17:16:26 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id EA36A8032B0;
	Fri, 10 Apr 2026 17:16:25 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v5 4/4] arm64: defconfig: Enable ARCH_HPE
Date: Fri, 10 Apr 2026 17:16:11 +0000
Message-ID: <20260410171611.2547255-5-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410171611.2547255-1-nick.hawkins@hpe.com>
References: <20260410171611.2547255-1-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE2MiBTYWx0ZWRfX/fVEDZyWt//T
 ZLFGqsTLhj8IC+xhEiX2i9KvH6x4FNhYSsAMd2901OQi/b+cjePraLY2mUVkWGHXwo5bi7ukxjf
 wF6WCuqu2NQZZEt5WXPzhLfMXIsOUjUrwNLUDM0Zv1vHi7YyyTfzVx2h+BkKVOkM611dqPmv7Lu
 RTAGEofFMtgbM+QVTc90RMERGzmy9XdDwu6Gb7QR3burkqGMkMBNLbg6wSPggUIJOFxKaZDUW3Q
 VMATwnJtHFqN+bDxtWcj7E6Btor3B6zgUexfVGpByMHpnzdzOgd7UUoPWBKN74g1r5CS03JPiJZ
 ynQOmwQCmimYYFtU9VLtoF+LlW+GVZ8S+sNOqqjjU9+zuqq3KGftU+vSNbGXi26YNwHmLz14ar8
 u8BYf6KF7eoBRgFlRxPy3mYz+sS2B61W++EcGPEnJZWiQ3/sK3ORrFs0FASDlO/mlgSTwl27Rzk
 QFEyuXblV9cKS/F97YA==
X-Proofpoint-ORIG-GUID: CQdVjpHyzbwXdvmTUOxj1gjX8w3R1XKD
X-Authority-Analysis: v=2.4 cv=dqHrzVg4 c=1 sm=1 tr=0 ts=69d9306b cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=g3u0LPWLDYfGfufhFw6-:22 a=MvuuwTCpAAAA:8 a=eJgTY4hZ_eZb3zzOyW4A:9
X-Proofpoint-GUID: CQdVjpHyzbwXdvmTUOxj1gjX8w3R1XKD
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100162

From: Nick Hawkins <nick.hawkins@hpe.com>

Enable ARCH_HPE in the arm64 defconfig to include HPE GSC BMC SoC
support in the default build.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index xxxxxxxxxxxxxxx..xxxxxxxxxxxxxxx 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -xx,6 +xx,7 @@
 CONFIG_ARCH_HISI=y
+CONFIG_ARCH_HPE=y
 CONFIG_ARCH_KEEMBAY=y
-- 
2.34.1
