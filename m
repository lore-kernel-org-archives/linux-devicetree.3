Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509273D669B
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925870; cv=none; b=KmNa0ByQeNSch3jwuGR9lHVDyCh4HCYeYfi+6dVAu89UHL+RwKktLLYliKciVJSXmv/5m+I+C47pzv2YGuL2NASInrMDn1S1HOdxc7CJ7HD8f21xFT8PGoTvBNHyQSmLJFjBDUe+pnTLMuwoLx70sE1xVA2GaEjsvV16CxldyPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925870; c=relaxed/simple;
	bh=MvRgZKUxXRsDf4Mbc8Ovyhw3jpFTzaoTJuv23rjTqQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rsEffZKXl9VUushAw8nTjeGPwZPh9qj0L1jvq6x7Kof6prb04n+zKybiy4SzbcS9/h5VjVJ1/YFdeQI9w4sIDhn1WfKWYcyNA1myNOIC2C1Dsq8sNAKGeB+dO7HVCEgrlrKN0oHrjBkydGUjq1tOr8wJnApWS4AfiIzPyonWv/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5nYUKBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSjV0+mc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5nYUKBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSjV0+mc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dQos2129214
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 10:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P/2KY7RrGDKdg29EKD0DrKa2Lw0F2Jc2kOKg3e7hHa0=; b=o5nYUKBLDJJaE8+G
	9z29mQnE0rf9PX5jk7lj5DVt8ZtgsIVEd9m/UUws4Km7F8qaAL8Z7xQYpjAWLSuz
	D3ly3bpGmB5+ZTbO77jhH3VaG90u322J0bKmoBD8X+0TpgQiUWsXuiExV9BIj6aL
	iuShyQF4qispfWamHR15UlORJlaTgiyBzQKplM8uIA30nbOmvJdghUW8LaHbf9k8
	NudVFhwXn9gSz/9ilE/J64BXxVmXbhnSLl7nYUBOIDmpQWKQWt/EPzHnHH/5Os89
	3EAGh2Z8fL3r7tKtdXoFTg1DoQwed+EXtFDYIgJO8bZQ+phqCs4hLVvl0+sAzz9g
	M+2G1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv1qg8gq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 10:31:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a9764f0so8103411cf.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 03:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785925867; x=1786530667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P/2KY7RrGDKdg29EKD0DrKa2Lw0F2Jc2kOKg3e7hHa0=;
        b=GSjV0+mcXe3do29STKeyUgSFrdFy6rqDhCYjb98ACO2Jbk0FGM5YFcONq0OUmQq1ka
         OKaPk+HyMjyrJdYQniApHG34G1vJ4C+nE6NoyswACII25dRi7WfWTCE6Yw9NI7l+ftZ0
         GLWMwcA6OWE2fV671ifmebjLRwJ2nZb103SSEqKMh/OjU4KAPeTFF7aIhPU7ZP6HZkJW
         6PoSZLfwuiSQzli6HuutJBaq7h69lSC/LBkavS1n35jR1jlp2EV2sDR5VvbYgrPmo45p
         uXNIjbRpt95drP3/NL3zvYAtohc8SgH6gpNdGqWEiEuTZ25vn2zQjpaH9GIH8v69+fpH
         5b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785925867; x=1786530667;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/2KY7RrGDKdg29EKD0DrKa2Lw0F2Jc2kOKg3e7hHa0=;
        b=QO/UURfuMZPEAOxRxRAzNPx6Uq4OkZY7Q1oaR9iqnBotiWP97Zvq28Mi4YtwADOiGu
         M0EtPIlaBLGGXZVFeKV87cpP/zRLFCOLWZ29oRwtV0lxpCw0cuGOgXgH4WYUwrxyPxYQ
         FH9e39yDAU9X5j9+AEW4IfwctcOopJt4DRf+Ju9+2xOtp7jnlXeuQB+6p2n9aBIWo+Dq
         WDfqk6Un45ttrjq6QjsyCbaPtHqFXvFgQVHrEXAyUUqLH+E8r8jevw4TBzA4k4jiOq9x
         lrGowxNrtKYQ4KULPSGSXv3WjaUroqK2oyRKPbvr5f0YknHPhUvYTsDjAdpzmim8XMKE
         LXfg==
X-Forwarded-Encrypted: i=1; AHgh+RoGzASF2ak6JsNaiVu5j5PQDCUI11eYCa4ULLBTHoF/nci5IOoT17Wfl2C4U8mADqhmMgvpvxbnBuBo@vger.kernel.org
X-Gm-Message-State: AOJu0YxbX+FJZhaWGQy/OkQqr8oKS9Zikh+3xHRdjpjSOwzIZXiwzZAu
	GKW+fL60r7glFQrStLzeBp2kbaEj8P15/JGgLMgWXU9eLvzUfvi1Pb2NmwTtsVmhmpUGKsbjZRz
	Ij7l2sEGdqyJW2eR2Lpy4QjeU3TORBUvA4RGPxaL81CFeP3EmUdRi09RQ63ub+lXM
X-Gm-Gg: AR+sD12VbtrG5STB3ufLqgmqLg12lsX+tGe0ZraFXr5TpNnzrWiwO+G5qcL3mgC3CBn
	hbeJZT5YQxPNHHS0NYblez3PnMUR6eCsAGDcPLT2wl6qiwoSpKfFBd4ORe0yROO3NkLBripIAL6
	RRodvLqfFKouiZ0sKyjULpCkfPD0hfXZXLYq30ZVjPDu7Ix0bYjmbVh7S1SklSR+J/ysyOD7K4k
	ge7I5g9D04cJflldPkwz82N7zBIqejDgAIZ5CY+qU9ModbqLHprlbeeFJEO5TEOVZ8Cg5OOQABd
	lzrZJfM4G/bpYB18ATXmB8aputczGt6O2ESvZcBrhHSn8dVsG1TSbrO6ZXoXkOV5GIT4SlkI0Ll
	NZZUYOSKL8Cmc7QORpUH01zgFE8NCpz/I8qWlHdOXhl+Oo/Sr+5/TLSvycxw=
X-Received: by 2002:a05:622a:994:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52ce61015cemr53753791cf.20.1785925867560;
        Wed, 05 Aug 2026 03:31:07 -0700 (PDT)
X-Received: by 2002:a05:622a:994:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52ce61015cemr53752681cf.20.1785925866644;
        Wed, 05 Aug 2026 03:31:06 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d814sm22259706d6.10.2026.08.05.03.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:31:05 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH v3 2/4] arm64: dts: qcom: fix PURWA/HAMOA IOT SOM compatibles
Date: Wed,  5 Aug 2026 18:30:01 +0800
Message-ID: <20260805-hamoa-come-v3-v3-2-20463c43eae1@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I+hVgtgg c=1 sm=1 tr=0 ts=6a7310ec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CGs7eBeCNeLIcw_ASWkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: UmmLJa4PDHcv8GZOqA-y1CrIfxZHf3SV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfX4+Uk4scy+seU
 Udp0H0buQF+TrCLTAXjo2KPHJBd6aNelYDsiAezFRmCWfKaMWQkBXK1LO1hjV9ahzWTgJGXv46K
 8vTA+gPJiF0AD2mY/qr7HNBD0uaubr8Ob8vtjojiGDy/bzCfNxUREdXMawi8krod6ggnXp5FwvZ
 PNLK9JSV4JdQxIYCri98UjJLmb9gny0C7Ktppw2cCaMorTuu29gAfUizvrxBSKv532kk0BapxnT
 HN6vaxwyKGQPPiIcX3tSVdAvpRA0f78SNITevI/cAKrDbHGN0tbEF1ilMwRkYlfF+MJADGMtzai
 wbRvKohLpBq2OJcPDaiP3wsBGO89bOWuhB1YrQsmn69QJjshZsvSLE66y7nQLajDbJNfgx14T9m
 KRTFEoqx24X9yzjxdrXZ1Vy80STr/YUfNfM4hqexRlUSYAXIhmeniIMMGgWrwsE2zM1BU5jRy7j
 Pin0Zd9b4fzGGb17FNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfX0FrV3HUZbGgQ
 cUBumSenzl+HFhgjHc55tVQDL/g3KDML7x7QNx/8AAGH15/krPMdm/cd3pAhL3OMtITz6RRNoVR
 N50n2u/K9+EXU5gQzAT7iWl2Xmoybd4=
X-Proofpoint-GUID: UmmLJa4PDHcv8GZOqA-y1CrIfxZHf3SV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050083

The compatible strings used for the Hamoa and Purwa IoT SOMs do not
match the naming used in the corresponding hardware documentation.

The SOMs are documented using their IQ product names and there are no
products identified as hamoa-iot-som or purwa-iot-som. Update the SOM
compatible strings to use the documented hardware names instead.

This keeps the DTS compatible strings aligned with the official
Qualcomm hardware documentation.

Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
Fixes: 9ed20e877239 ("arm64: dts: qcom: Add base PURWA-IOT-EVK board")
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts                            | 4 ++--
 .../arm64/boot/dts/qcom/{purwa-iot-som.dtsi => iq-x5121-evk-som.dtsi} | 0
 .../arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => iq-x7181-evk-som.dtsi} | 0
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts                            | 4 ++--
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..b807079a5ee2 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -6,12 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
-#include "hamoa-iot-som.dtsi"
+#include "iq-x7181-evk-som.dtsi"
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
-	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
+	compatible = "qcom,hamoa-iot-evk", "qcom,iq-x7181-evk-som", "qcom,x1e80100";
 	chassis-type = "embedded";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/iq-x5121-evk-som.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
rename to arch/arm64/boot/dts/qcom/iq-x5121-evk-som.dtsi
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/iq-x7181-evk-som.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
rename to arch/arm64/boot/dts/qcom/iq-x7181-evk-som.dtsi
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..d2963af1d762 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -6,12 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
-#include "purwa-iot-som.dtsi"
+#include "iq-x5121-evk-som.dtsi"
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Purwa IoT EVK";
-	compatible = "qcom,purwa-iot-evk", "qcom,purwa-iot-som", "qcom,x1p42100";
+	compatible = "qcom,purwa-iot-evk", "qcom,iq-x5121-evk-som", "qcom,x1p42100";
 	chassis-type = "embedded";
 
 	aliases {

-- 
2.43.0
