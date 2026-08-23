Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D923B3C05
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514508; cv=none; b=YGP4Ld+XZPI1eU7EL6SvsosdgamSaTfQ9iUTLKROqUozd+2ulj7+IDBlVdnOFADRHuWrM5vV7Qka+2r5HdKanqtCgF9gDnqeBKkxBj2GOp41ldQsjVDkcZUl5hcCSbQAQuP4GtWTgJv4cYQ6ixwJQWYrBPmmbcEyLG0Vuj7FJj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514508; c=relaxed/simple;
	bh=sSu1rmCbKklvuYL8pG9B62fBY+5STvRKxD0ZbLLROYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjH0OevpL1LbbR9Qh225nyedYTUU6wX79sYEDJ+nSbEl1mhgAupbxwi1xLltV21sOVEhN0TpBcv4FenSTVNtLX+7s4/atIYOv+IZhMOOV+E8gFDrhz4b3LKeFWhMHOTDKH/x6kRQl+hqWE/9wQE3GhPzouiwojIIB44VsEXg6Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e04guieL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVUIeKwG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e04guieL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVUIeKwG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67NG72UX292266
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGCfN3Etp4rNqYD8yfNNQic/5RsW0siFclTSIyKyGb8=; b=e04guieLGXwXmUqH
	X9WHo+oZfM4/1n1iLsPw8MFqIVhoJSQom83V0WKOS4hEEGilZ+T4MnlnQ1xFo8FR
	2n2zt00MLW5GZG0p8+uLRa2PDmY870NCx5m/ZjQLSvDZiUzWxA2PupB8VPaAic8o
	C3p5WLX3olBLXMbJmeuO/PWcABv7eZvq2mgiJirDcxd1Gqx9aNJI1nzYbAsdyR7M
	Ecd2/HZGIPM4N8dTTrgvp2FFQSt5v6KC+InV41XXDZT5gDfeoGnhup/qGwea64s5
	lZfDqSmF3bP9NDFE33sai3jM7apk3bRddY5A1qSctSVHM+rA0gUN/JMPUmPg4sFp
	bN/M4g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qvdh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:48:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so35648625ad.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 12:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787514502; x=1788119302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGCfN3Etp4rNqYD8yfNNQic/5RsW0siFclTSIyKyGb8=;
        b=bVUIeKwG/wNMHCNq4g18tr77As0fv/yJszRRUNBIyQFt4kJaCLriiBzJUaTOLVnHYq
         A+pz9RbFAekQVX6YV2AyTMwfqK62O6OK2yUauL46NyCFyc7pPgh1KEGAXxptQ2HcF2sr
         0O6vttVPM+zJEG+j4rWJPiQEywHDnk9nxuILN3+JNJ9L2cHMThQoMUYF3kxjiAxWnDtB
         zgLnJtI/UfOvNN/MAk7Y7Z9NsVLC8pN/hZidguckw+xGUJUziI9rp+R9TbGOk9WWvkih
         Wys93OKUvubfrUtTR5mlFq8FaQbBuuNWS8PKWMTqh2OEM+LIYJMEA9cB1LwSptXFjc1U
         kDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787514502; x=1788119302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGCfN3Etp4rNqYD8yfNNQic/5RsW0siFclTSIyKyGb8=;
        b=diHRusIDNwdn7P7XIrg1goLKtpi/ch0YxmMe/HyPQoncsfdMTUhrmTm4hlPms09ALC
         on+Lkxd881SxErkx2jEhETjMtxF4W0lTmdPhM6hHN5rohwxggW+bFnuCYC4ImDIxe16O
         WIcrlEGx5jk7Mzx1APV14LEZ9niR522GJN3NFPi2FtddLylKFFmKQkg5NW/xQGtbBqeW
         l2h7cvjDtpBBVYxqanMYlmQSpg4CDQdF4+PkP3sf6ASL+IGp2Y1mQ6z3MBXbmABSHHhZ
         9qraMgw3MVCAjHaBfyt9wWaim0B0h0UyOpM5e/MbaBBfNQLlHQ2X1YaiO3lXs3FYv0js
         zT9A==
X-Forwarded-Encrypted: i=1; AHgh+RpcwotR/kGIjVLmNbU+mq649NGiBJz3MSc1PopIkN6pEkIqoOsDgXmP2fTfKQPU74IQs5CHrGDza62m@vger.kernel.org
X-Gm-Message-State: AFuF++nzeEr6NfrIBVFWOTbvlQUnl7iHnEJmhAIwyR7aBFOmo/raEutK
	3C5eD0/rhSF+ZKOqPtThyKE839S2QnfqX/2ieTI0bOsrlEtAw46FEZ6OcC/F36fkiPK0mtbb/vB
	AWPyb+wFNCw15eLwiOCPpiTYwbK4qdFVFaybw+fQN+C6JLuKcAMt+K1xyHcZkzmbL
X-Gm-Gg: AR+sD10Rquyv4zLwRjIQn8i1MtFAhg98H8SDAFIOcwLJAqTIHz+E2TguB/O7IfUCL2H
	7WlzvzzFfU3WSLepXvkBuMwNnNOywZKj4VQkpxzmMpgif4hWiwUdk3lyv4vZjoj2gFU/1RH9KW9
	HOx70hWPcVbQN4gTSEb8rcWIqf5pjHl5WqqLa3FRit6aSDyUqbS0mtGHLbJedY/o9STlYRrr1y/
	H1iW30bbI/yo5n4lWfBZVWiqotXXZ6mXEo982+cX+EQe0zqEP3ccLN7+UQW5g7cQvlq6G+JLhPv
	DL/49WIzW5GnglNmGWNOF8mjR1ishVubtS/WHYHn7F38Lw+H2zd7g1E66LGBzcdfeBUPb7YKt0z
	6MWHDaTOKX325vCyc1Ti2kGSoNWbe4kgH0Gao/Q==
X-Received: by 2002:a17:903:fa6:b0:2d6:5beb:8692 with SMTP id d9443c01a7336-2d670bb5042mr259791925ad.6.1787514502440;
        Sun, 23 Aug 2026 12:48:22 -0700 (PDT)
X-Received: by 2002:a17:903:fa6:b0:2d6:5beb:8692 with SMTP id d9443c01a7336-2d670bb5042mr259791475ad.6.1787514502043;
        Sun, 23 Aug 2026 12:48:22 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f925190fsm32321623eec.31.2026.08.23.12.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:48:21 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 01:17:43 +0530
Subject: [PATCH v12 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-enable-ice-clock-scaling-v12-6-09271f583dc6@oss.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfXw34Im/HBJzzw
 BfJPFccPzcnh65stnSnxXSl3T2cUe2A/QEAF/PrCKp43s014dky7yNraWWq2HbZYB7S+sfTN2Bj
 GjGkNgJ0Qnqq5R/V1sEW7txby/vB3pcTxypXp8sXVWlzCD9mifO7vG1657y3FdNkSQGGy1KLhJZ
 O9yoIowtGa/N2IQ3EOgytQNHemWrSHhReySngw/75bVmlCeI1gptoTWD8t/QV4ueAzHzwcwBvJ/
 rqzorYP7VKfKEXTiLs1dBK8WAXk+EOPYFF/qjYpcvg42MsDDzhq6Mh279GM3X8jTI5mVqn5/6bH
 uAh4NV3ftI13lT6YBVM3xCduQsxQsXWu0WXIBAmE5fwdxSdDt0KNdgLC/FdiMT0l2kL/XaudUDV
 eank2DxwQeMREpUG636FlTScU34z2eIJWA1T5ybINHccrFNppbKvtRwRSpAcAooz6Ux8lr8q3lP
 8+YyiPWNCmagtG2xUOA==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8b4e87 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ASeq7m8wwX9lxpDCPrQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 1hLSv6qQWgDx2mCiSJv0kdbugvQqHwt5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfXzn8Y+2vg+ij7
 orTdhfmvY+ZL/OspvpwBgxvaMKqwFs0cjPDtmsconVmT7F++ZbRzsFSd6MhOG+PwiFI/B+/9b6D
 BcRoyL8SBVumzLG77qNp2gEl7k7izoY=
X-Proofpoint-GUID: 1hLSv6qQWgDx2mCiSJv0kdbugvQqHwt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-23_06,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608230181

Qualcomm Inline Crypto Engine (ICE) platform driver now supports
an optional OPP-table.

Add OPP-table for ICE UFS device nodes for LeMans platform.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index a10322c5bc35754042640d56ecb556a5ed5cf281..40d13ba5f785bc712b511870b94cfa9c6518c19f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3109,6 +3109,32 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1

