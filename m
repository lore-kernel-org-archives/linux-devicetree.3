Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7C3C552F
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364869; cv=none; b=pSwVelAASM7myX0fg7GxvpJuOkcsdC574j/IG4xzois333XoqCJ3IJJZ2dqTDG4z0H5yzIIewsVeFhU57kmP+2z5rfuRkPQGSN3KzCaLZzmxyVXyvXELJD+bJW9JWNZ8I37yhx/DEoK+iFvVnA7GUlsK2ExbuNyTDVLyn2jXrec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364869; c=relaxed/simple;
	bh=b5GVsqiFRvyRNXuaoJrVvQ++KB3PSjMRJdFjuy/X++Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lAjaOJ33OpWoKiS3ctb3cmjUlMR8jqFZ2jekejZs5sjUtYD51XTRmg+meYwJ+iIUZD3rhOE49AtxdmcIgfnlC5Dh14eQ3onj6xjDvOpvBm79DsSBuH26aI9cC/RdlCe/CSFVwCaCGsjyrPN5C7YntJF1B2kAi1uOdLef6Oy+I2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfPFOT3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccYXFI19; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfPFOT3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccYXFI19"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAXuAK818843
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zuiIFZmi278YoDP8dW7O5YBXYG/k2Hucyz8
	pSyqs9ZY=; b=HfPFOT3IMnhcPAAoOD5eaSF7Yz+Euf+T/uav/QrtMc6pJNNZVWF
	CBNIEgAE+BBRcL1lGau5CqXdLiC9RdXc1+qX352HUa3SceSekmHXnC8sFd/T9qKC
	e2ksJrJ9Pn9dXslLrIuzulmH4skY3VdB0LufVqL8JhmSNLk0eXI4h8yaT6J+Zi1k
	rmFPrXLBfRuW0j/0rfGBWrVVGPYYdNijJlB8CnZqDZRMkyNSPoCnmRH9Pf8LgDar
	nn6/81XiUtwGGiKwAfNgW+ymUl8i0uBcpgNw/sgXSvl1TXgZRilfyuhmxifx9rfj
	GyuoMEymezwRDmW6U5xUCBYmrHK4DcLbPPQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkg9kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:01:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828b1b7fddso3428320a12.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779364867; x=1779969667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuiIFZmi278YoDP8dW7O5YBXYG/k2Hucyz8pSyqs9ZY=;
        b=ccYXFI19iJ8cRwM/STPfulotK6M9+SwlnMuUklgzCRb17Q/wdFL/LL1gg2lQoOVrAN
         NvIvA+mTTMNEqdPXs0UushApcGO+tVNTWXOdBwK3VRoKI3D2WgFIIlz5quxd2yYHhE9d
         +DwZLsmvCYLxYRlrTgjhlRoIumRw+H+nN+EMzwytTO3mNpquPYcxbAhXB7oyKg8ceAvx
         HL4UPReoOHSqnD5knt8I4sNPgyIgvr4VHeo8NMLovalNpnaQZnW+1sMyIZC5dFkpMpEY
         ELrO6Gy96DyIppdLS1uWoQ2jNNUNPrr76lV1f2vIEWJmVRRDrEZhy43WaPeqzRflr96Y
         caoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364867; x=1779969667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuiIFZmi278YoDP8dW7O5YBXYG/k2Hucyz8pSyqs9ZY=;
        b=cQJiUf9jEPV32SwLp7v/PBGcf0sIGrbwT7KKGYMJQ0bXf/YivkHLNJwiwDRve8aTeQ
         n30Z6MXDKZ6NOFeiV87hOraAYWFUFxEbPkkliWNDFwp/6BZsSdzBmDVGYgI41TjLSWLg
         rrCtiqLPw1gMSi5YnqO45uBXSyD5662/hbml+zYijL9ffJ6GBTuUryJOt/1ibG0xOkwS
         Rh/YGZFwCacvn2BKbpG2oPa6ApIRrfG/20zZLQvrE2/ZJgsP864IifQca+7eKxXe7OrZ
         zUYBqz25VHpaeqYYuNRslMuXXlIDZLG/gz19xLZnqqdl+aVU3e9Rk211vZj+VVE1Aml2
         7atA==
X-Forwarded-Encrypted: i=1; AFNElJ/XRVkw6K9smKeBvPJeav3oq8rvBaQbegRF4s9lH0OKpTa+aWNJNTiKcWoEypUzJDs85oCM+CxHN0lI@vger.kernel.org
X-Gm-Message-State: AOJu0YwaDj2ohIJDs0ew1rFpUuj2u8aVHVfOvKZw2pJR7Wuf7S0RDI1K
	om9nATrrtf0llj2COVAcx2ZPARCmQd1NcwUeyoEiFCkgZGAruAdmGXhGvZqntFqcyFSK0kwoCWr
	qigr2pVFjosQ8cxBsAqoIt4kzgZI6VjHkSNfC4kRIcU9bOPtySuXyku8lUKGMYZFs
X-Gm-Gg: Acq92OGFGwGltSJdurCpKweezZyVIDIyZrbaf/EzzUJKsjvYnifz61FUs9OIdmQ3Xr4
	seqDqb3r0JgRMTi4Xk8liPBnVPrnyWxmlOi1V6TNXmHXNhWJuFA2XlE8GRumadJeaPrKyxvKitD
	MeJaJSTtjhxdookiZOBGwe+aFNA+avHdqhWhd7kBejmZdiwbeJb1jsy/7pZQmd10Ojw4q23q83n
	CvCTwmSXNsidHEvNPDL/k2z16wTGtAG45n+m7MOUP07f9OIXiEAB8B5R0kItoFBzGJZLDZAoG+c
	BkRSoBWMAnQh9eCfLd3INX68ZsepSDU6d53dwq8EApBPN+Dj85GuMw1qB4qWbabnVOLi4Q7J6oz
	4EzJJtbMPPhm5fbybaeJLNW1gR2UwO38vC1yD4s+twFWT8wtuGRLcX/9XkQynHUM=
X-Received: by 2002:a05:6a20:12d0:b0:398:7357:bb91 with SMTP id adf61e73a8af0-3b30878f308mr3215384637.33.1779364865245;
        Thu, 21 May 2026 05:01:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d0:b0:398:7357:bb91 with SMTP id adf61e73a8af0-3b30878f308mr3215287637.33.1779364864642;
        Thu, 21 May 2026 05:01:04 -0700 (PDT)
Received: from hu-sauana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85198f4f98sm169544a12.15.2026.05.21.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:01:04 -0700 (PDT)
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_mkuntuma@quicinc.com,
        mahadevan.p@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: glymur: Configure DP endpoints for 2-lane operation
Date: Thu, 21 May 2026 17:30:58 +0530
Message-Id: <20260521120058.2966709-1-saurabh.anand@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExOSBTYWx0ZWRfX32Mrp/cE2n0n
 n2sof+aRb7E7KYICM6uM9RILuMQWP2JjEu3MeoF+EVBWDxx8bEoKoh0cJoGx7XQpUeyN+cOxjvg
 sZtFK5bja7MaKl38gjDGs9oCHfARyeWjDeAVOMmdo/IO/VtmUzPjFv6oPWT11wlmReFKe4v1e3s
 oLPWbNqwrHrVu+WiA73CbgFAAvTLr7bOAtQFudPZKGCeQL1FJ3NBYzdywHMU40Hl58lYwCPhflJ
 k+dY+H/A+FIo6krdRnDSGZRHepvL3fKYZ5gbU0hipgDFYZJG38cthjNv7DDmGPy5eF7tTHgWstt
 jIczOi+EVyC6X9U6TmwJGpJIjn1emWwEDUrMopqFzRR3URsVa1VS9qyseE2/3gZKkRZhW9Y3jnf
 59V3rG2mufKpqcbU99LiqLGB7JmvcIE1XMEnGqScFYO1R3pmfz8YJ8qqQFqohvv4b2fuxum2yGf
 Jx1lmFxwM0avADnc8/g==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0ef403 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=whlQpUbcimcIkjChax8A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: j5GJwrWMPg-a5UxbX5FyO7N3c9tuAImN
X-Proofpoint-ORIG-GUID: j5GJwrWMPg-a5UxbX5FyO7N3c9tuAImN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210119

Add explicit data-lanes to the MDSS DP output endpoints to enable
display port in 2 lanes configuration and disable the mode-switch
property from the USB QMP PHY node.

Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 72c7dc6e4f09..d6b3c5bfebd5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2445,7 +2445,6 @@ usb_0_qmpphy: phy@fd5000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
-			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
@@ -2517,7 +2516,6 @@ usb_1_qmpphy: phy@fde000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
-			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
@@ -4550,6 +4548,7 @@ port@1 {
 						reg = <1>;
 
 						mdss_dp0_out: endpoint {
+							data-lanes = <0 1>;
 							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 						};
 					};
@@ -4641,6 +4640,7 @@ port@1 {
 						reg = <1>;
 
 						mdss_dp1_out: endpoint {
+							data-lanes = <0 1>;
 							remote-endpoint = <&usb_1_qmpphy_dp_in>;
 						};
 					};
-- 
2.34.1

