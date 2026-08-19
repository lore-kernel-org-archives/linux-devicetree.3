Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E96A3CAA2E;
	Wed, 19 Aug 2026 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118144; cv=none; b=cb4GlTsiZEDzwIivTuINmE2Uh6gYAdmQ+js61xyu9QwJSijP/DAUZZ3hmCQg41LwmDmeQvtnwXBOjy8e6IiGT2C0hmKdO+u9tIuukT6l6E1thNnfG6FWubVysVRBCwGSLwMicuW8wxoZoDvRf9NtfWctRVrYZtI9oiys1wyevro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118144; c=relaxed/simple;
	bh=q6lxaDVi8lBqke6cqeN/6mntAYjo0xzz8myKr0dyUDE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G612v7x3CenT90HlpqqgncQeaCwrgDcppUJ65Y5bvytJ3U990Ta4rPtq9gCetoqvLAR9EE03mOWqUzVfIJLp2C53pZw0XftO1k8Hni83ZGm72KlPTH+BqbcKxh89TWD0rjmxiSwkecvWIvfUZMfgdmYRM1POks+tlDtRYBPHHQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqOMn8bK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqOMn8bK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5IH8H2285467;
	Wed, 19 Aug 2026 05:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=n8xabBkUlOwI0vA2jg7elhEoD0+deYIu3Ok
	Ggny2nkA=; b=MqOMn8bKH3WSvN45bzWAPmogR+9JfL52H95uQx2+6w337dxwcJ8
	GN1S5T6+3D8Vv1/Y8HcCZLgdJVxw05P/LujGRG5xxpag9vnqXQPdGn1gkUpCe0EE
	WFJWtB5J3p+9y6OPeSBm9vWuM6FEtq98p9ucDRJTWMcZKXJVY6waAnwvMbnG+pT8
	kSFIKYI7jCcujgbxCqc9BSZdSMSV4/Aih+2ovhVqsfswgVqc+gFM+1x3uXHWzyee
	1lygN/Pp6LUsvD7rUnKnMOrq3HKKA9jAzNDG7I1yL1GRdA7Geb/+eAOjvF+lIkHs
	aEN4aiAQrNuG8f/zzxqNZygZcijHlQvZc2A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk9gw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 05:42:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67J5gHT7016093;
	Wed, 19 Aug 2026 05:42:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g2h6k4vwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 05:42:17 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67J5gGPA016067;
	Wed, 19 Aug 2026 05:42:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67J5gGN4016051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 05:42:16 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id E1B9063B; Wed, 19 Aug 2026 11:12:15 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 0/2] Add initial Maili SoC support
Date: Wed, 19 Aug 2026 11:12:01 +0530
Message-Id: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a85423c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=zE_EpRBV3E2v8J4XY04A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfX5HH/5w9C1yAM
 Fe6qy/2Tw9Cu2jjiRkBsnrKtQmkoEqEliBpAPJQ4Zk1v767i2vdTizptxoQqGK445sMgAdTieV3
 zikPAGf+8S/tAHgC3Jf4nZBgpfsyZBoNNzZ8V+bo7yDwbJ/96CJUf1336G/Lo0Sczyy381un7W3
 oKjEwisFFP//tJSw4w0SGuihhCuHbM7DWfceZDHJh4tHJLIhOpFl9gpb9BM4KokNhIfgalzRVzf
 ob+Okg3htQb9wOaj0QK/yxfUfVYU9nqlKO6xgbShLEHqLBzCXS2JF+7n+erqHTQwH8k3kwzPq5p
 LCukT861vVGTHECzjwPaAqMHrWmeFLWdVkv3OjAvYFmDnQ1oIH09FYIDssu+49By15HmZkH3z3H
 WhIBLyJeA4p9E8949XM+bbZGTD1KjA/ZdLaQfJmtyQOVI6stHr+h5CFgiK+evhH6CO99gUNuG4M
 j93P7wven5NPu3HS2kA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfX3E9Ui3ujGelr
 mm+Zs8AYBge0y98vf6NuQIfnm4np54En8q8XNi+B6LEMzB48DJT46+5FTlYCytom7Q9G7NYx1Ca
 05iDmm1DkgBPAc1gLAo4oclvVy5gUr0=
X-Proofpoint-GUID: buWRzDYUHhN5uEFNSLRBfKoR6CaAs4TR
X-Proofpoint-ORIG-GUID: buWRzDYUHhN5uEFNSLRBfKoR6CaAs4TR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190041

This series introduces the Maili SoC compatible string in the DT
bindings and adds the corresponding pd-mapper support required for the
platform.

Prasad Kumpatla (1):
  soc: qcom: pd-mapper: Add support for Maili SoC

Yijie Yang (1):
  dt-bindings: arm: qcom: Add Maili SoC compatible

 Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
 drivers/soc/qcom/qcom_pd_mapper.c               | 1 +
 2 files changed, 4 insertions(+)

-- 
2.34.1

