Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ECE3C2761
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439093; cv=none; b=uJYGmcLkJzR8jHm7liNsYdEQO98Bg7uAuDJBzPrNolMyCO1VJ8PC0AZ6TTYLSNk3Vskj2dLSmhxM4xPmsGEJLxmgsJpeOOAJnQ66/TSHMzNsjJd9Wlnzn0LJqslo+AnsMueMeolCLWr17BC3hEXybU2hpDFX0JKiMQ4RhY371r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439093; c=relaxed/simple;
	bh=X0xXkFgpEGLjkiFblpwO+BnhWlu/bE8cwlCDJSPOaDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+xjkxW3lZpJpH+IOis0DKjW5YEuCVY2RX3ou4OMDit5mi9RFJm3JZGqqRRIQx4ZB+ZYk8MZA9OPs4wt2FcfDn87hQEw605T8isOLeP5qpO6EQapW5IbhUJUt4X1JGA8YIhW3pzstyPHyYH7DjMH9t6K1ArvKL4mmA/hGYbd9yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/M4QeiD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPdXe1sv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/M4QeiD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPdXe1sv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652EB8Pb1638469
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 22:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=; b=Y/M4QeiD3c4bC0ff
	kVey7lRX3r7GUHXdS+2EGnLye6NdMt8vHy6O80X2h5zbdHYMzNXRYpnJy8iUogNp
	fmBGgVXO1ltEyk31mdGnVhKl4hbleKsHVySVsn58sKiGaUcnoUylhuOA3xNSs3ub
	UpiZX2VqTzOGW5fCjbMcIrNOZ4mqV1ThgBt7tJlUH/Oa78uRyMWcPsLcSmMXydSV
	xAz4Uo0ONVzDKfb50M/wrNBch0HgUDPGH9Ujao2Vb5/WwhgXPCd7aOiOUOLmJChH
	mTRGVbmrPi9O/WeWeNHPIcHtp/E9CbGsWYDFZLc+mnyMoFWHzfPioeeqvgvQX08A
	mhwOOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu1ckhyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 22:24:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso52791305ad.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780439090; x=1781043890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=;
        b=kPdXe1svqYYwc37MLnn08sgAb1uLOiOA9wPLJXkNDWmclUgW31629lVda+Vhfht0ud
         ulOIfeEEKTJTT7Zy+yJWkUxBeptbDoUhBxz+AjhlR6QSU3TWGD/2XidjvsLrk0/n1dxZ
         7EXjKDJ1/DLjBnJZPGR+3sGlMI6yZsYHmeFhucOqCUuKNcPZXA5G6eAb0X2muzcJP9WC
         xVxfOehf1xE2iVJHsCQg6YrQFQLpym0FoO+ivm6ZonfRLrVsJ5ygfuv19tyxcuPAwsaF
         nKqh+DEEONB0hB9/2zwqNjD4AO4AtiDjB6CHgKPtXGtBYfnyp8qVhQGN86wUmYXvYzCQ
         mrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439090; x=1781043890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=;
        b=iR+ufl0GGGExMS8/FzWF86za6RtRXZDD4Y4rvun7XkcrabGu+g6lahttc+mEWmwbvT
         ywNdD2hf4eKEVOteLLipi2sAvnfel7u/fQwb8+LrCnO6tqai3fQezsIr/06chMNO1gSN
         tA9C10gkQgJpgph/0vTyVz9vEZlnV1W42yoMFDxTRNwtHYUl/15onHm9dQk5Zztkn/gS
         7FcDeOOMKh2U0/sXVQ+BpPf6I7L57GKvmn5qAUqcArfqo1MDOgsqj/E4Hi80HYAuDguL
         QXAfGOBQWjoipJ324tnjrd6OQ1Ssb8CDE5O8taApjoEevdXvdjGPkb5GiVsugMepnPNc
         /NHA==
X-Forwarded-Encrypted: i=1; AFNElJ8XTjxHQruEXFFnycnGvRyHqKPHFdHzStBJCTyQl5WjwPRZ7+jQt33y/pTmI8tMaK0CzYAQ7hWc4lSI@vger.kernel.org
X-Gm-Message-State: AOJu0YyLs6+qzfCgWkucv40nFaiQle3xJHri8gBtb+xIzCutMQ1RlXcc
	jqu7sWai3onntieSb/phuv2JBcOCmIg3h7X3biQ+jQLL7LwvQGfhrHf9OOHapCNW74T+EK8YbZ2
	QEK3o6Qwx1LaAQCwSZIgy9pjfBbalc84xn3DIt3enK4sTOEQL0mfpjtCfUxxgrA2L
X-Gm-Gg: Acq92OH/dT6LFxfzZ/wq+WICqRx3gIz0nuxk23WrxKKp7xp289rHMnFDK1fqFeFOymM
	sESLVFMckVWBTPwDhW5LfVn2XNGIciAWgfT+yWhhMctOmHnqB+hmURldL3WynxtrICbG2xxtovg
	0iIkLQ8mylFvk3LqW51ZkxMuO2vfOs492gYdjjWMTSyUMTKFZG46EZlUUDarB//UIb4rQaZxL06
	8e3XT+R1GhVElGSjNcc3UD7WUCmFyHumHe9YDZhqL3k0PtgCKLBnr6I7F4xN6QQ6yIhtRpM0koq
	+N6tsSFF0obB/nsicNKcNBNVsQE1zecguZthuUuzgF8A6vK6ZpRn4SpilTVsaJQYr+AXOfND+tw
	uQ2jEGpeNzFmTLJN23m5S6VaHSJMP9i6lX18pimxYQ9ea4PtrftpGfTVdGysHmbUJMpGd3w==
X-Received: by 2002:a17:902:f547:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2c163a2ac1emr5553235ad.9.1780439089924;
        Tue, 02 Jun 2026 15:24:49 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2c163a2ac1emr5552975ad.9.1780439089464;
        Tue, 02 Jun 2026 15:24:49 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm2698035ad.45.2026.06.02.15.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:24:49 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 03:53:56 +0530
Subject: [PATCH v10 4/5] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-enable-ice-clock-scaling-v10-4-b0b728435356@oss.qualcomm.com>
References: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
In-Reply-To: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: KZNLe6XMkWRZxr_ovIzyeFHUv-3L3YKm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIxNyBTYWx0ZWRfX7UCPhs6QOGbd
 5IxnuVrunif377TXDjkPhVbWrO969OILPdJukY1eil/r/kI50BIo7JcL2iNILtm5DFmhfXH7ysO
 pe5FKWSZ6wp3LZJedoKrZyejtBC/9Gvp+i5kdfV9OF3k07q/h/fkldF8RLefAOmHTKEHABC8/S4
 iDZZRYkyxQtcMLAJmfCyRM7GNSvqo4IrGUBE2ICU6Xxn3GE+qTilsoGJrMsmkFkDC2Jx9kxe2Cw
 NxtaMJFQiTg+gfyfsDBZrV3cvGBGyBgJQDmv4yBxKcpRwqSuxgTJCmOS77a7tS8mWSPOw49G4ND
 6l6sR+ss3OeEVDgacB48eXPlvcjd51OYJre8AA0wyxEHDP1pnixl5id9lN/ac1Q+49s6/MhC3h8
 7+W8wU5tqnZnQBVhU1Xs0Tmk5NwtUPmH8YPVFJxViET72JhlGFkHRq98nqSte+vMDdIlrwPQQa0
 6bLXvxAQZ92Ls6v31zw==
X-Proofpoint-GUID: KZNLe6XMkWRZxr_ovIzyeFHUv-3L3YKm
X-Authority-Analysis: v=2.4 cv=O6IJeh9W c=1 sm=1 tr=0 ts=6a1f5832 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020217

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index ecf4790f3415c46781c8e790d7892a41300ee7a0..cd76da7e49d8c664df6a60b5c18418c4e97a3ba4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd SC7280_CX>;
+
+			operating-points-v2 = <&ice_mmc_opp_table>;
+
+			ice_mmc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
 		};
 
 		gpi_dma0: dma-controller@900000 {
@@ -2597,6 +2618,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1

