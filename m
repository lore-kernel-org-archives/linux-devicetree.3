Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3537DE89
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072463; cv=none; b=AzoZvXQlFSEfILyq5mlEtDhP2IMQInMUZKKLHjwjoWEJJ8riM4gsb4Ol3/KoNUtQ/K4CnHp6CMI+Mc6nIRl4LpoSfM3IkHCCNZKgfMFBsp3NiGkzClMH74jodyWwmJ370AsB9JXqGcsyaRRRdUSB7qRnYDmvwY/hHK/Put7B0r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072463; c=relaxed/simple;
	bh=tyv11HaWPqYWgCaBGOxFUkX1745Dazgv1z01brprm2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bRUfjbO6Ez67u+qJBqmkpiJbQfTxsiLF9ymKUnytpdueFmouZ/tKHSZL7mL9NnKuMn+fQYANvmReaD8/qknxcXcBVRdEQgHHpA2xvBkAAecZCaqnFVTgtnLdZ2eeKvcSKAYEYWROAjXqX+pLCpCY/34kZDYe/WXHbA35COrqFSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIAPIPyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y23v6KvB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIAPIPyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y23v6KvB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rom13088112
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 09:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OR+59DzVOGNIldMXrB1Xe8D6n+R5h4ItttN0Av+hjsg=; b=XIAPIPyq9+j1J1er
	nFLXp9EP1OjR4fw+Vt6QrE4+JiSCjFJtKq4brYhce9EFf3RBqKh4T16B++D9bqqY
	MQP762Z/K6hp8tpDAYQxdEJMIR49FDfxuwJW4PMu6aSzHiKMBQyCrBqHzQnrVYj8
	pWJvEz29Hu19OQogjH0Kgeo13Y5efnQ14PBiusaAlCTTKaavqkcwwuCUp6BRN4fE
	vAS2ciP0fI8Uwact7PTbkl1+B9oG0KruCIJHN4+tX/T5c9hOcqRCSIzV/zHcoZ5G
	Ax6vbkumtdfON0maUDSn/Mk9PMjtjMrAcRilm7EIBQCzeJPN8qO/qL1hOt8ek5hv
	WJ0q/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s254ccs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 09:54:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c354050c34so5647535ad.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783072458; x=1783677258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OR+59DzVOGNIldMXrB1Xe8D6n+R5h4ItttN0Av+hjsg=;
        b=Y23v6KvBMtZ4OZZEne957/ivrDiiYY5sTfoy1HDLRq1RqZQME5t8mNOeAgT3GzeWSK
         p7M0lxdjQYWIRLVQhdg/0hlFOGjSriiJ6Lris93tyXcPTTRGGFQ217tenPvbLercl3Gx
         gcT0Gn/RFDFZf2bZ9bfJ1k7IApHQYKOyXXVloLK8ZBtHyO7SKn2HZigHnLziTCl86xFh
         uNno3aYvE4ooczg+0a6Lh7iiMtr0nh7JMKrj6v/qpJyuxODsNYlFwcMKH5wbz/X8C2Ho
         GKK06goFMulHyUqcatVZcD5Y6yAMJck8Tb/PZg0XasuHvGcvPazMsFcMbHZYoxLasUw7
         UHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072458; x=1783677258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OR+59DzVOGNIldMXrB1Xe8D6n+R5h4ItttN0Av+hjsg=;
        b=pdMmxPCYBKBZBXDaMAkQIhZ3YO3PERFPF325k9uqOUZnE+SQ7+7b6eQMnAoK7mCF5e
         AFTiOSjyHqlwHG+CsK+P6c4kynne1cnu5qmALV7WwE5l2/nzALTQ7KhTaEc2ADeYNUcS
         5bYljsO0lHCJXnx7tbCdxsAMDC5h30Qhpa/5T3HeH6BDYsq4m8E+gtFCe3gC0SBnUCUM
         dd0o0WNjJPXyQHJ4H4p39JYDV9Tv1KOqi60NwVKU4LbevEYi3cY1ZndbK9960SaNSlP+
         YGKDVStiK1FyEVaKXssnD15Io281M5iaj2qeWpWpA7SRX73dZ1dTCQ/x3RNKd8Ib80WB
         1+hg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+H6at5QPtzWRFbviHuVjZrsHm0780EQMhy5eeGr5gEN/T/Ojv8b+MrC22qkJlJZ88x+4V8zJpbspy@vger.kernel.org
X-Gm-Message-State: AOJu0YwBunf/2MChyfexvDpc3s8pSM4Ewsy4Snb8pdkAJfpm1xLvfu1p
	dohoT7+KAu5ZPB0+nrStPBTQqjnxS7qaKFu/B0ovqIxxPcRNYKhNYnsJwRKGk8fFE9LsOQv8SLv
	Xi0V2AYFxYojvYd9zxd25uLVLeN4sQtc5HNosKeTlW/Ls7z8S+f/qoh604bdT7yRJ
X-Gm-Gg: AfdE7cn8jaDiwYtiUUcoxN+wmdVdk9jkt+7ORUhSRhozFagPWnOONip5hwlSmm6lfVL
	6LTh4hmDXcZ+ZpdsAO0I0/6tGAp1LGXHIDw465fbmWxeQOjy1GWbXsypEqVGYHvgrX3SE7nG7G8
	NMfrAJYsSSXRAWmQSx7JGyxiYmcZ7zVqMmiKjxJyWIhaG2xOorljYIZVesteaa4Pcv54VQjs7sm
	BxHAwoLHk0zDtPd+K1GNvqpGpllJrc2hqPW6ZOIXCqFDJRHEf/GnwdKoOwv5IMX3AgLyVYU0LkZ
	MRa7WxudAeKa+cNtVE/gRsVckHLs7O2UMOdiu3QUdtwVj79ZTuGV7XSJx7pIs68upILtDbSApEc
	rxueEdsajCLr70MWc++0cuStyk+2oZ8O9VKNLEwK0oJ1nzEtvaKE183jAjvUVmgWbas5Vs9mARE
	DtdIqWhXsT33e1wXo0wH7gLr4=
X-Received: by 2002:a17:902:ccca:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2ca7e6f327dmr107322945ad.7.1783072457774;
        Fri, 03 Jul 2026 02:54:17 -0700 (PDT)
X-Received: by 2002:a17:902:ccca:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2ca7e6f327dmr107322615ad.7.1783072457323;
        Fri, 03 Jul 2026 02:54:17 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7146914sm7034515ad.35.2026.07.03.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:54:16 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:23:42 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-ec_support_for_purwa_evk-v2-2-c59aac5c6aac@oss.qualcomm.com>
References: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
In-Reply-To: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Yushan Li <yushan.li@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783072444; l=1443;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=tyv11HaWPqYWgCaBGOxFUkX1745Dazgv1z01brprm2o=;
 b=XCgF0m3VnFaux/thqoB5hOfJeh5R7+IhtX5IrsH0Nfws20J6r4ioiPVbg1ir+4FvUqGy1Xn4M
 d7h4TUe8QaxCdBUJyEVPZAdHwN5IZfFG6Q0yZHL+inI+yHqHwSvzP+s
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a4786ca cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: t7F3nH2vri3iS3SO1vOAUWF70XwgXgRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NSBTYWx0ZWRfX7j6HpEHGK7hu
 Yj+Qdp0GFmXZr3IlzdKA4abSZKpchkivqURg8qW1RB1IPQpQbIio99WahjsgMesOzVcuk1UZLSq
 CFgIzczBPVwBfXnUvFVrmBDjDCsRJy3eqVMooCkNxWqCSWNiLizzCnQvEbXiB2TpOW4RaSyyzcs
 RUmczQ+Tg8SyAxB6KJoZXu0hMH/0bzysszr3JjNNJSjJfTAd7xuuIVK5Pu8i9TysQHitsKEF9kK
 uylSzboFgC+fxZjqkUQXzHM98aidLCXTvKpYDMiZygbV6kQJTJpv6DjgfKnqCYcR4Qx5N7cJUbx
 GDX15IAWuAqSnR5j7kPEsVnSt72nw7LDXM+OpXrLyh/0dJbiN9zhDE5ZGsxX9eVrQlW29jTmntr
 Rq5IxGZfPyY7Ib8QUBGOCzqd+j8NSUthDxPAecdoB4Z+8GvTlDVpQ01bs9gVPCesOfT6fOhKHiD
 bLycsHtqIMibWYUFWLw==
X-Proofpoint-GUID: t7F3nH2vri3iS3SO1vOAUWF70XwgXgRz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NSBTYWx0ZWRfX84n2jZ3X43ki
 nEM0qPyxp4AM3yTVAkWHBylORrSbPAFKGV4eE5MYlu9CnUt3w1KDCa41YHEOetnJqt0+xMSzTGv
 c7GytxnvQQd9+XAMjIxO/1n2BrCV3t0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030095

Add embedded controller node for Purwa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Tested-by: Yushan Li <yushan.li@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..491ea7769cd7 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -837,6 +837,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,purwa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1326,6 +1336,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

