Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D77374178
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064294; cv=none; b=WlHuG9OcPRXy3/tEViUxLKCK1VUoq+9ZEW95x8zYRJa8dbmAzOxTwuu97yM8QuJ4E5xbChA1FzO33J5MQQZ7d11nKdeHLB6uLa1raa0lIlokeTjeasyOJp57T28zn6mJUMtUOSvWZkFd/GFS+ML9Yh8bgeCY9rXa9DGDTwwNGLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064294; c=relaxed/simple;
	bh=PeLoecEMNqK7zIvwwlDzuch5rZGxnLpUW85/SOQukPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CUWeD2U6MgngcfXU/pioP2HfbfLOgaDW7F5+aDu+UrvtohMnhjWIerEHhGAwngoFH/two9aP2hNUSuiavVVVdozUl793D+K4sUfCjMECejeNMoma3KDubIjANvsXIwc/TL6TAyI0Di2yWbKdsN3iFhhwc960EM4z7bnoMAy2jyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewLtA9X2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDuGQC4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewLtA9X2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDuGQC4n"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6skKQ2166099
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kU+GdEKLmHHCfxHeNsAT7RviNL8HR1DdeIN
	TDQLhP4o=; b=ewLtA9X25LfOLgUypOZcfAsV52kQr05SgpMXDKr7r+/b+bt2gql
	c5aobAdsvL5iZv2bP3EwOlto0T03Jd1Vd77LizRQ80GmNhU3SsmI6269pxHwbakc
	McC7Z+ght1FC9ARsrC4APCbVm9aD2YZ53JescCSY7x43w5N62zOpwZQyfPXsaQU8
	w86lPg1U3WR0pixb1AlhP0jeWFgWKBFye3qIfJE2nMkhL172u3rEFv/Decxq1B1q
	bvMDd8HFcr3JloTVxRxYFBtjYx+Ewq49CXM1+Uk8mmt/jRxV9IBH/Oe/oUgtMZaa
	/wbntiaSJZ9/oTrYMprB6AR2phTC8w8nQhw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetxmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:04:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f80c76e6so72586215ad.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790064280; x=1790669080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kU+GdEKLmHHCfxHeNsAT7RviNL8HR1DdeINTDQLhP4o=;
        b=EDuGQC4n/zJ0iaStlesF+l9eJBVxkksRkqJtyoTDyBHTI0mxTIcZvOaSRYGCkPYiQ7
         scvJRE1+uELRoTiUBgumwq3qsUpOdj9ICZv64dPy3BBt+06HBmIfedvkAfrt9pcnXjt5
         eSnpqfS6VTAv/QgLJXhUKalwJnWlvGpIdEIErID2iEuNyg4ugMm9UVAmrsXVVB76xooy
         eQhyo01hvlMXC3XSwxa5tfJlMExnqaDBLFqa8eqdzWDcIHipbKhXnHlAq3QbO368rGPc
         Xfy3vv7ZZ7S08RpA7kcG8LbmM6dz7iKHZn9G4yWCNuf0SGt5DZ6O6ol0UpotJ0SAeApw
         ofhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064280; x=1790669080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kU+GdEKLmHHCfxHeNsAT7RviNL8HR1DdeINTDQLhP4o=;
        b=g8PFF+Et4gs8NAxRnJo8y1ou4gxbGf7ydXD+MbUMTVRB7Mf4zjpmsOC1zlG9A5Eyuk
         tydTsOLEcl0Xum+nOzyZDFVaJdcKNwof9TNG0mVFQA4RMMBEmOgEp/5Q4emu8s0aVS6w
         Ei2O8ZNV8yOIks8Ny6vZEgmJibwCLgjL1CDK3OU4IrIOt3XokC8/z6vH06G80psyfg7B
         6p5UkWxmTsmqQ2SJE6+/Eq6gHzjI9IJhud+XKYO4zAlZxiA5/dYmrFxBO01nc2wJcdZ+
         /oMWjm5ck60m2uPKD3V84CaBd1UKOdPRr9Vt3jPeqjrLdp6xGL1L/egPmZAAWdfmUbC2
         kjzA==
X-Forwarded-Encrypted: i=1; AKwUvBwA+Dr1P3bpUcDpoYHxpoqlCadJDdBJBUgRRSM7lgRxrsyeiwW773xtpR7ah6al4qffoDlcejcvKBsj@vger.kernel.org
X-Gm-Message-State: AFuF++k6G4FVognvIJLxOoZSmgAUULg16pbd3PE71QBMyz8met7b2bBe
	e0l7hYggtj1R3PmnmQJe6PY4NP2s2+aWXjyeqq/s+T7LYlPK4/XyJ7+APoTsto/PRO7p4fGfqZf
	79SBClps4TbsGXNaWZ2pA6iYTdybWZk6GNrnoci1IldxkS54YXnZycPiXJUNEBd9G
X-Gm-Gg: AYBFou1LlmcXQwWPR1mQIInGBRPXvgAxJ/zN3nCCTeH2UqjUsPPPWt8ilhbyeuntzq0
	OPbgY4PTFmXO25Mr61kiX5gMS718KTfmYpAeBwVL2bxhjvrfbpATpXS7yl6p8YuolfFHWfU3bnr
	3TbA2YtTnsg+ykj3zNqxkXc24Q4qK7CbPtZq34Eb6rG5pDLSoIVw2+gulmFjaUAaF61Z2Hra4Ob
	9geK0rxi/DlscGIzRRvUzsgCpEGzEGnsVwvP7evyGnDSaOXM6+WC1p3hsO3iYWSsYD7SE4sou4R
	teQssKgh0RUoW71y+WinjQ+gV2yfFBGhmMCkeAd5erj+gmoRTyNaY4osplLOZ3azqIO5kyU87ID
	HFdCbySf3V8qjSkx/fMp+ig0n++ndEGr5EwoiIjxHkR8MQLojkjlUjeCSfKo=
X-Received: by 2002:a17:903:46ce:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2df609d77cdmr4097475ad.24.1790064280284;
        Tue, 22 Sep 2026 01:04:40 -0700 (PDT)
X-Received: by 2002:a17:903:46ce:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2df609d77cdmr4097055ad.24.1790064279801;
        Tue, 22 Sep 2026 01:04:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129b3a9sm3528214eec.13.2026.09.22.01.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:04:39 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pushpendra Singh <pussin@qti.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Add bwmon node for Nord
Date: Tue, 22 Sep 2026 16:04:16 +0800
Message-ID: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nIZmKql5ZQQvepbJSnrUAzynte3p3e0G
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab23699 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=q7pI7CVp5Wuu0xCWJPQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: nIZmKql5ZQQvepbJSnrUAzynte3p3e0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExNSBTYWx0ZWRfX5pbFWAEI/0Ti
 +DNVGKJgt8RChFIjZX2sq7SNXbuRFH26Qa7uOOVKAmpg+xbKS6i8Y42HO9U8McpyRDGXgWgrK9b
 ZMh8GXowe1xauO7iFxPLC0D29QmgkQxmAFbxJsEA1gbjuPvM0hRJB04m5fkttu8PiVB7DKRF9nM
 Njno0jG0I6ycS+WFW6fevMIwZ/ttsga+ED1kSm4ZRfK8PCoPBip02FFUUboLqacAkGxJ226Hs8R
 W9u4KZ8bSYJ6JUTjhyiDhXmoqdQNgit5vSJaCAaoaX7wp8rwYruszea+h+QVVIjjfhvYTi5b90A
 7rFA490xR4QnHLJ+y+Pw5PfbwRiAsKDLaZB64eY3xRP4SWx71k3m4QwwDa2+ptc38wr46GN54ko
 bR87yhpzlsJUsWJnphq9yO7+3dq5zfFSp0RQrwXMUncDipcUBE/WRH0upsMb9aS9O5LjoNBdOp1
 +uqatYfHjbyDmaJrAKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExNSBTYWx0ZWRfX1Ap9ZzuhjieN
 B4+Kj3ezZlmvcvU5rWDVM4ChHduJtDT2K+mi7CxfPO48FKZcJtJKzIdLm2yxvEZFD1sVZZIYYFb
 2UWS1WxrHQLDV04rxbR6o7Z/vkpsBGY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220115

From: Pushpendra Singh <pussin@qti.qualcomm.com>

Add BWMON nodes and associated OPP tables to enable dynamic DDR/LLCC
frequency scaling.

The compatible is added in nord-embedded.dtsi rather than nord.dtsi,
because Embedded variant specific 'interconnects' is required by
the compatible.

Co-developed-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Signed-off-by: Pushpendra Singh <pussin@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Dependencies:
- BWMON binding: https://lore.kernel.org/all/20260831090134.585588-1-zhangfei.gao@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 21 +++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 67 +++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 568fe68cd185..c27d01a82214 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -30,6 +30,27 @@ mc_virt: interconnect-mc-virt {
 	};
 };
 
+&bwmon_cluster0 {
+	compatible = "qcom,nord-cpu-bwmon",
+		     "qcom,sdm845-bwmon";
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+};
+
+&bwmon_cluster1 {
+	compatible = "qcom,nord-cpu-bwmon",
+		     "qcom,sdm845-bwmon";
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+};
+
+&bwmon_cluster2 {
+	compatible = "qcom,nord-cpu-bwmon",
+		     "qcom,sdm845-bwmon";
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+};
+
 &crypto {
 	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
 			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c30..9925e770dfa4 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1460,6 +1460,73 @@ uart13: serial@a98000 {
 			};
 		};
 
+		bwmon_cluster2: pmu@1014400 {
+			reg = <0x0 0x01014400 0x0 0x600>;
+			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;
+			operating-points-v2 = <&bwmon_cluster_opp_table>;
+		};
+
+		bwmon_cluster1: pmu@1015400 {
+			reg = <0x0 0x01015400 0x0 0x600>;
+			interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
+			operating-points-v2 = <&bwmon_cluster_opp_table>;
+		};
+
+		bwmon_cluster0: pmu@1016400 {
+			reg = <0x0 0x01016400 0x0 0x600>;
+			interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
+
+			operating-points-v2 = <&bwmon_cluster_opp_table>;
+
+			bwmon_cluster_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <800000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188800>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <5414400>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <6220800>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6835200>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7603200>;
+				};
+
+				opp-6 {
+					opp-peak-kBps = <8371200>;
+				};
+
+				opp-7 {
+					opp-peak-kBps = <9657600>;
+				};
+
+				opp-8 {
+					opp-peak-kBps = <10944000>;
+				};
+
+				opp-9 {
+					opp-peak-kBps = <12748800>;
+				};
+
+				opp-10 {
+					opp-peak-kBps = <14745600>;
+				};
+			};
+		};
+
 		rng: rng@10c3000 {
 			compatible = "qcom,nord-trng",
 				     "qcom,trng";
-- 
2.43.0

