Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE2C2E06E4;
	Tue, 25 Aug 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664827; cv=none; b=PYu71pvZfBXGbB55cMcCOSROQwBNvTs3VRLaI59uOXkblGOiNRjP66h098qcncRAIMDunw1dXg0svwPWZdqbbgW3KXYh3I4l1ebuWxgESqEYsPSVKX9l6bJ1AeHjTVWcWPuddLobdVfIB7BGPHHiLtImcY4N3pjl5rupSGeDBTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664827; c=relaxed/simple;
	bh=cSfME+UB7duyDCoS8YJcqvds/wiyQXknB/6ASDuDDkw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JAJKASssIEOWraH6dDItJXQFxSQm0mz+Y+2D0aVe5bAWY6bo+94+4fhp8G4YleSNc6U+S9PPTfmXbZ6+0g4tR/L9kYBQpVW1csImuedmL9huSPNSU3UBVkSoQUZb0KLx+5EGW+ZhKmkkQOsO/xYKkq2Hxj+F/wJwmEBrRI3E0wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gb9D38kC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gb9D38kC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAvAT72090801;
	Tue, 25 Aug 2026 13:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=etesFSPWENobR5eB6+HPh7
	Ra3HnGoar+Qu3Q6P4tT6I=; b=Gb9D38kCqnA29TE8TrkE5eVWXPHQ49JdDMfCXm
	eTOqXG2KNrgIOn8dturkX04L0KqzdNjZtbdjNSU6hl+iftSfnxn/Ul75UtmGfxIP
	1cFhfN2GIowUBPpkofVnCHlvToIMwOEz5nyZ09P5Ad+wsIiTuDRF7eHvP8VU2tH6
	qgXPEWdgUGvy1NrCdME1IucdN2T5U5TnlgfBLQTmlVHLz7X5X/8GSfWLce27TvBt
	ISLU+Y30rsCq92Bm1XxNCkW290ng00XhOH0hzFS14jZZxfpjk6U+eVq6tvH2wCoq
	wmiUE9OBIHDNJzk4hHcywGEfColi1YHYRnohaVD6/YTOdjAQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvt5pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 13:33:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67PDXcu7031329;
	Tue, 25 Aug 2026 13:33:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g74ujrypk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 13:33:38 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67PDXc2O031323;
	Tue, 25 Aug 2026 13:33:38 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67PDXbeO031322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 13:33:38 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id D3590638; Tue, 25 Aug 2026 19:03:36 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 0/2] CMA-memory-to-offload-FNN-PLUS-module-to-eNPU
Date: Tue, 25 Aug 2026 19:03:31 +0530
Message-Id: <20260825133333.376591-1-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExNSBTYWx0ZWRfX/3k+3SPSwsnP
 QakQkUQra/MQJVwinQ2sc0/YcPL+1Acw8g++B65/C8btsCgsoCcDyddmK+8ztMecyGZouZjbLGs
 8CELs2LRzTi6a+W11OahF2TxKSM8uYRSJjUQmAyz6aq8Uc+i8qib7QiWR8Vb9C+MBokdVjnHUiK
 BZCdIptvpeg2LaroTu4GNrqtVBowx4fg99IecsCMRA1crlIWA0hrBhlDRkOJ6Y6OAhoZm5Qi+Q6
 zdAAVcjEDgNJav6wmgWmjb0/Tos0cdvIKGVrZtL+rLMXM83EOmRnlR65Wrsz4eW6AGYd4tAqqYG
 fG5a9nXbc2Vljtx48O0+yugCfRVD5SVA37d+5rW24F9O3qbCTO1+R0Oel//PbR4RsasXt8+2zY3
 qYtWxsZBAE8OydaijsMXivaFNTCGCMOVu5IsCLMzqllAklnjHdJHOH0yizgJtuIXjydZmHRnZgO
 O9haGbmx+Bwq23/1dBA==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d99b6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0t2w34_WqSWHtLCw6q0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExNSBTYWx0ZWRfX2WKOw0a5pqMe
 ppyKGQliV7Rg5XKiiudcfuIzTKbD8emE5voK/22I5SzpJX8uuxyIijac1GTsPRzVHZkrtqAD5IA
 dS7BmHpSGdS14dmhDsGAqvZU1PdKznc=
X-Proofpoint-ORIG-GUID: TXb_pohQf3plYsHXvCZ2BVgZ_Of43K67
X-Proofpoint-GUID: TXb_pohQf3plYsHXvCZ2BVgZ_Of43K67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250115

This series contains patches for allocating CMA memory to offload
FNN PLUS module to eNPU.

Karthik S (2):
  arm64: dts: qcom: qcs6490-rb3gen2: add audio CMA memory region for
    AudioReach
  arm64: dts: qcom: kodiak-el2: add LPASS AML IOMMU SIDs for eNPU audio
    offload

 arch/arm64/boot/dts/qcom/kodiak-el2.dtso         | 5 ++++-
 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi | 1 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts     | 8 ++++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

This patch depends on: 
 arm64: dts: qcom: kodiak: EL2 overlay for qcm6490-idp / qcs6490-rb3gen2
 
 Link: https://lore.kernel.org/all/20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com/
 
 The prerequisite patch introduces kodiak el2 overlay.

-- 
2.34.1

