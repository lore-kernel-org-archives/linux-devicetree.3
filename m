Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA33642189B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675698; cv=none; b=cSUGVb6xn7pMIwGf5sN/eT4zi4z5F3CSs40JmbVwFd5e3jTXzpayYsUNx9LkbelBCXB+ULLPR/TPyl+v4CnwsFxnU7mLzbWqX/800Bw/JWKcigR3ithGe0j+1UJ96zsA6F/SkYpGsz/847SiaMvewt6Gw1DUQbOYJ+QFSKpcQos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675698; c=relaxed/simple;
	bh=rhMmplJZHjgETELIHxU/vsgM7ogB40pqy4Io3V4J9OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bT1ZkDrdBI1jbYyOKc0r6N5Kdgipj3Me3oBCz7LzT6wytrIv9bPYIvQsv8S5ImYpCEckPHo1GOyi+q7DpEx0DSvkolcAgm5LxBKxzYPjhve6wGQCFSlrKGiQ11IRyllpS2sS7oRUPudbtDINXZDt4FJoqr0Zd5iH9C6HHVhXWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBernZUi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3X4CZJc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBernZUi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3X4CZJc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rFqg4082487
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vg2olHTvJC2jVplGWI7geGXgqDGD1iMXEsGdv1h+2cY=; b=ZBernZUiQXwaA959
	y4LLxUq5GRM6LekP2yCHsnv4Z+YgDwc+QRaY/vyUPK+mzSwE2bWMQyoCib6MjoIU
	nUrFpaPPmkGVdBDa4qS3Q0Ax1UVXscqwdNE2eJPeTnzpxuF1uZJcFNCDXs4pYUZR
	YkRbGY+XfvTPwXv61l5J3OUHD4P7Lamjc6KHcDBaEpyyP1Vfrt4m3S/C7SjlehX5
	+YHrpgNN3Dn9scmCbK3PLR0OkcovL50Rirq7GeULzqrK/dDZSC6Kwf0TC4FctoDZ
	qjrOK3kYGKki+HSQ2YUZ7MEGn2Bin75PuiN+lSdVHKuxm+9aq1nskLgb7zgjsqs5
	rKg0Fg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e0s76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ff0bef198so136151031cf.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675693; x=1779280493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vg2olHTvJC2jVplGWI7geGXgqDGD1iMXEsGdv1h+2cY=;
        b=P3X4CZJcF/eEz5GnyuB8sE9Ipn6Sg9eIz/dz5oaCWoqkrTLLLnzNyJyh7Y4iqcTu1J
         QLWa1Se1RgI3DzNylIw2I0j244hqkixik2Lc6gEUo7x5JXoU8lpwfrvkiwXvkPI2LzXo
         fo73+qRY2sfOf5KUMAFFkjAmgfYp1/8waJ9gGnLypwo/3CwU6G1kYpYM9IZXRm6lOYaZ
         owVqPxbN+dXavo4FTMad4sw/Gocf30mf7xe23z1lkDDpRNqUyRJ8eVw8JVmemadFYupb
         IFg8fpP8Md+7wNyqoa4kJ2SVGhWWq0ukuZ/XW7lN1l8pS9hnsL42PSAO8t2p2UbWlJ03
         zjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675693; x=1779280493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vg2olHTvJC2jVplGWI7geGXgqDGD1iMXEsGdv1h+2cY=;
        b=pV64bIXDJlyXDvbYscNh1f5MQE1w02bQ8kx2UA/tWcc4r57eGhwBksS/ORcIuOFizz
         5ozMboUjaZ7X7CgpL0eWr30zIoFPV062BpmdGobPDHFN65FsfEXuePNlnBOe4L8amyV+
         yf95lE8H4wDfODx+mmihHI+0HWApeej+19MTckIsAb/F+QYveCBkfZsJgbiGY5aPc62v
         0F0Pl1p8L0jwt35LOzZid8Z8/wFpq+RLs1SSDFsZglz9onbLHxhEGhfIGS0lfo55M6LT
         Ni+u0HREFIbdLe6vmB3GEcTAoiWElpGg8u0OJs1I1OYsz45OgRksWkGmuaLzZzedt79L
         sZAA==
X-Forwarded-Encrypted: i=1; AFNElJ9NJ4WZCc9nd8GhtbjDuBZYMbHiaUDHjfQbtS+F7zHytBXWmxLbPX8UoXtEt99mnBTQbGtAp6NuY0A3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1jF9DTQwZGcH+YQ5U1MUR4h616QI/A320w6i1m3xAyH1Rcn1J
	DEcg2OwtYfpHwE6r5ThzDkz8OYh7i9zD1s9A/VF/iuNPtAFpkYij+Bt52DjjSubzX7k3IYF5itO
	O431+NK9KORgE0MAss3jfiEtGkuUTg8PfkcvzAb50/jJS9EVwrinpIyriTNwe5HAZ
X-Gm-Gg: Acq92OFms7z4GGHhOfvE+cPuYjOLHL4rqZOY/+k1VeOdsoZeLhaUN0/uqFSeqHq8fbK
	QkprCieUzIaiCdvAG3NBQ+wFsg2/F2j6xJvR4/j6GclpmchID1nAJr49GLkwn87T5Fm/wHp2Kss
	oQogzwnK5d7cFX22tH8zsh7XFL1F8nd7ETccg6eznE/AjL2lBG9cYCDOSBk1fngZFAQOR2huQWg
	oLpma/DWmHXVKT79VRLK9slOFbB+FaSaVjjFm0i0pXqlTmFTAduUzPoaVmHBgSwK6fQS6GPrGv0
	8ZYvetFKdveuDP85EYerhIH8/vcPStYnI/uGRaXI5YITDv8QsWhp8ll/syPU7doZ1M2tD53VNQ6
	E1ZM3SHgnLv3tFFW5A0SDvyYlt3heItyNRL8vu0bkeR+2Qk5Q2eRMYMl9GDDP9f2acpSnDuqv4V
	zB6EXbPvuXdJcUgi+nZYnKz+ej9wtq/mUbuVU=
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr38051631cf.48.1778675693279;
        Wed, 13 May 2026 05:34:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr38050931cf.48.1778675692371;
        Wed, 13 May 2026 05:34:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:45 +0300
Subject: [PATCH v6 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-3-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gBq7lynhN9JvmvojL1BqehFO5JLgP9wZqWKF6N8gCwU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/lla63QjlAipiccO8+0MWldtsTwZNH6YvRb
 H2T74nC4miJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5QAKCRCLPIo+Aiko
 1TA6B/4ln99sRe0thHKm+qtJpm+NsUZzDU2r2TufjRmqSxbUB1nafm8Svsix5tYb8WvYKT2uK9j
 v2WzuOBcto0MgZVXyWFdBAB88yTbi1GhuWvVI2gLO8QjYyT6OE+aJSPsOh3l/7vhSmhFFfthedk
 zsqaCIwoX1RA9bvP7p3jGg/oB6/31zM5P9pksbXVBz8YO4MtJQqxv+cE5pgtkDuLAEUyN09fKZm
 nP7IS/rdM/F6tLks9f4q1Ewa/oePjtOr8sznymqzrdrycjS/VPXz99YUZzPx44Nvu7nacfJBzYN
 aYLSY6G7xKQ6sgBGSuucOwitpFRqurIMOCe9V/fuRGydoISU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: zvbhTa6zlK_XuexFlB-uyOLdqjAamcx-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX8IvhGRL3Y+g/
 BrVYME3C8P+TFDvFgdHe0/6GM+SXhsdEtbHLhaug3c/rdTuvqZ8Q+E/MbCfwF6Ke6q6+q/Bdp9/
 Te13SwWkC9VEzENnyZgoIy/3qsQ6y7E/w8zk4bVptzZmlVDmp2mbN0KuoOsFGyJWCFH3t3wN++V
 CL3tm7gXTyvTSX1hTcQT6uW6InuQw4SRMNmcebKCUm6MA79w0LX4Jj1lmsUcGuSx07mf+mxQKnP
 CNmuzU6qUBklmj6AtUlxJl0Na/s9AqYX5zWylzNozNUOevw1goFjLs0T2hdPIsKDgeLfbbOqVw1
 +xxl51rlqyRkwc1fBhoBPWMmtmD8Gznyg4iVcRGuev+EtwaIgDKRLioi/0X2qxDf+iCPz2CoNny
 58f1C5641FiG2OqBB+K0b6eWdMIWALYPyptwz/XCes1Gm+eBmq4O7JDC8Wu9094SgR28UKehvfH
 f2EKo4A8xyS6XKFB2dQ==
X-Proofpoint-GUID: zvbhTa6zlK_XuexFlB-uyOLdqjAamcx-
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a046fee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Z5etVbCIt5GNeBr577cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131

From: Konrad Dybcio <konradybcio@kernel.org>

Add the required nodes to enable Iris core on SC8280XP.

[ bod: added interconnect tags ]

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[ johan: use sm8350 videocc defines ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped video encoder/decoder declarations ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[ db: dropped llcc icc, switched to sc8280xp compat, corrected OPP table ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 99 ++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index b09bc6f3b518..4f540f2a0fc8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -11,13 +11,16 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -692,6 +695,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
+		pil_video_mem: pil_video_region@86700000 {
+			reg = <0 0x86700000 0 0x500000>;
+			no-map;
+		};
+
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -4182,6 +4190,97 @@ usb_1_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sc8280xp-iris", "qcom,sm8250-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC8280XP_MX>,
+					<&rpmhpd SC8280XP_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus", "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&iris_opp_table>;
+			iommus = <&apps_smmu 0x2a00 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sc8280xp-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac4a000 0 0x1000>;

-- 
2.47.3

