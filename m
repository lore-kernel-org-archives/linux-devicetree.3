Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0799431A51
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172828; cv=none; b=XJ9TwGo6LvG5uIMQulAFRf5CTg3hZzEKwXiEs1aP98FOQbs+RoGttjfzXCPXDQyxtH4VTCJvIuHdEFKkWEzgb5I3BPxRrQyipA0mf7xAcZ6jdmb4hR3LxKLz31+irTKV5zY9uQBVvIQfFe9W811NOtk6D54arue3XCSVO3nzloM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172828; c=relaxed/simple;
	bh=TbcQBoHIIopm6NEANpP1lL8MEQ3txMX4ouKbTVTXRNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DL1ogvJIyeBB+q6N2TcVf+uIAFqbVbrQdppRZt/MV5NIb2N8YbqR0hZrSvQZR5pPva4UXe/g8rkixHcFuc+Hi+bTPyF6lLRlFBl9YjP30NrSyGEIwssPd2f6eJRmmA8mK9F9x+TdDXrimOKQ93Zdp9xj6h28V+kJxR+827TogTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Huk3bM3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eA2FBFhN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Huk3bM3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eA2FBFhN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlfr0033188
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gF3BCm/zpGv9IdwwbOQ3vpF4ndVuL+2PmvXLUR+eEK8=; b=Huk3bM3lF4Bs34YB
	zOLr7uqSjwZPoaLwGSfoe1bb19XPVuJlbd6SlgbJZThkebSFxqE9OmusFbkTwdZx
	Y8v6AleUKAL+Pzo2i9T7Gp7IYI7XR5uz/f4icJjN7KPodRQHpu4DQH1/mOeyELqL
	VRq8y+TdU1GE8s8Sd5B9mLdVvbaYQdTY/kAS/lTpZlaHLAqHmwPOptE3UMOBPygc
	O9C6u4A3iXUYg4U9JiUUQ/mm+ZzYYN2JG1Xx+h/C/ZmtwlaXJ9rh+7Cks/PFmDZg
	7B8DdQhS1Y/LH1l7jwK6aAdBoHeUB/4JUN4amvHF7NvqWsbQ5/mD6BFSV1iCqE53
	dxbTzA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c62474-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so4763219a12.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785172820; x=1785777620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gF3BCm/zpGv9IdwwbOQ3vpF4ndVuL+2PmvXLUR+eEK8=;
        b=eA2FBFhNs+FVuzIS1ZVuCreGj6lBB0qHeCNI21gOK4ldH17BJ33OLl0zBMr/sCyIYJ
         z80KT1qJrE8j4/zooAjasKOxXg7jrVLPjAMfTGI5DnKioM5kk6Y1CNN0PEZMO97nQOLP
         WHPRDr5a9vDS3iT2PrvXSDgQo77g5ab/2wadoz4lhnN/JdY2M6hrp710U7soQW0R5raq
         poxOFYHbKNKrqW2zXNJOrpp4UN6b1o8866eQm84d0q8KiulWPWDnVowku65+AQ7Hkgs9
         lKG9VHjZCiJTbuE6NfQY0KhACAge8dVYTZbRrKGbFMeSuK4GIBtdn7w+pqkANNa9aSci
         XFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172820; x=1785777620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gF3BCm/zpGv9IdwwbOQ3vpF4ndVuL+2PmvXLUR+eEK8=;
        b=KruCVPg6JIC/rIG6qf2jXFcOOSHwZ01IOQ8K/3ffQgsUzI9PbHhxXM3OCnr6UlcRHG
         xqMhUeJuzgeMSQWnAa9NcLmF9aCgwQG6nzreAeq8miR46AKA5uIIlKfCbatmsHEG6qEM
         9VpDZ8Gdynkt9giZ7mcgfe6lWH/KdzquPJZpyI4gkbtPp/xO0Ar8zFop8/rgnrvDfKM0
         ryZh4W4acfmlSG4TIHx1V72cZAi+/zX+4DDMZSTclDsRcUIkOWneANxVoBLAs2+EGmPO
         JHfrnBFmMz4P1JXZdrgH2Kg79R2NfWBGMLlVt0PtBZPreWx6NSwyaSnFnnJQwb/8vGPk
         81AQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRedtk7f+xXJB8yDTiiaK7O0KUADRIrcpYr0IEf2YsW0Y2xylURu0Mu81Y5JOG45BldB0nYB/lIjeP@vger.kernel.org
X-Gm-Message-State: AOJu0YyApAPfJwFwCjFs27BxgTJuKwxCr8bSO3pgWqbehSfzjpnX7igh
	7k3gLxag4Zey5ir6yOjxuyXWCLGz4sSIZtpvzxg+8VqWybozVw7L7xw3tz7sZVGx/v8tZXjJL9i
	gVslKIuqRHrCUtr2Sn9zOk2vZt3oUEMFu4KXXCXJPlIXfaB0TRgYBcHxautUAeaNH
X-Gm-Gg: AR+sD130oxTJhIV/jeShO9apD2Cb3tYMyXurcZvJ64yj0Sg/TxzOdW5jKByg+9zgTFH
	5mcumM7XMQRzExQU78wsn/3S315Saoecd8nbRAMocMGN69IgdzTT6EHC4T90WbLAC6uIx4vbinq
	iTMKHh5pwsvW7W8mTp//cP787yCMjNHdSlWLnJe8H/MB8XyerXhKMQPV/1UuDZPmRHVp2JtZw61
	lDOgTtxGwZnic9iZyaM+bCc0165vQb8ZCysFOpOLirVWplU72HPGq4Cr1vYFW5lxuHkBx68hsSf
	tSInu83HSLmuOWsBNyzOOK5H+nNlEMYOGlXcWzXq1r4bnsqKwiv9ZvWg995FlOJ0QnXxq9Z+Zi/
	Bgq6J66ZV3aYNDKEO+dY=
X-Received: by 2002:a05:6a21:310e:b0:3c0:9c19:65a7 with SMTP id adf61e73a8af0-3c67e14d9f1mr8571904637.63.1785172820514;
        Mon, 27 Jul 2026 10:20:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:310e:b0:3c0:9c19:65a7 with SMTP id adf61e73a8af0-3c67e14d9f1mr8571880637.63.1785172820013;
        Mon, 27 Jul 2026 10:20:20 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm55892988eec.13.2026.07.27.10.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:20:19 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 22:49:11 +0530
Subject: [PATCH v3 1/4] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adc5_gen3_dt-v3-1-bc00223648f3@oss.qualcomm.com>
References: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
In-Reply-To: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785172810; l=4998;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=TbcQBoHIIopm6NEANpP1lL8MEQ3txMX4ouKbTVTXRNY=;
 b=bjnCo5+9cMFkv3jBPVwNk6oMqVerMSFq//tMFl5XuuzuEScsGjQm8gDSH1la8leNJHCXBa8mN
 RZZsSGGI7J+CHA80KvEpSMWIrKbee3Hkw5j2LkUrbQ6lFWPRoLi74Ad
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a679355 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uKufQnq3ocnfyFJwv7kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfX0/uoUw2RoOQo
 itkvT2s3HSS0NAWLC4wS/uQdyaCtmM5cBYQg22V/Mr61Rek9tfDE2t6/p7G7fDvugYHmvWvtag+
 Pf6R290EbMLk1ccl+JON4jSzotuesIc=
X-Proofpoint-ORIG-GUID: JS26KwjG44Pp9p5n1XjFOuEu4R80vlsN
X-Proofpoint-GUID: JS26KwjG44Pp9p5n1XjFOuEu4R80vlsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfX6B58dP+sJkVk
 DdO1Ix+msCSDtmFIWwBPD9ZFB1Y72uFdtobHUeQdGXY0Qu4TNyeicPHhBI1n6YIOptnfByNlS8s
 iac/MpoCRkG7Eb578tM5E+9aL+AYnBaTDqIlAFkkeiQZyB1QGveEBNILsFHczhj4cs78GK5mIt/
 THFcBFzN1DFmbItGOWesx8/69v12lqHpBCJbwsE1hxa+ZeGGixJUIE0xVIiU2W7YyT+OXJt+fE9
 5yqRIG3vp5hq1sIhn3Tri6lEX/HW47lsJ8/q0zxMMhrDsbmlG9j2P9nSiB499fG+iHEdjwVKE3o
 6pxNn9O1pTa1Ko/uAd7CsL5RN8dGzDOWvPG3eDjJr1NOoFHoH5PHRlwMy8W3l698BYSVrRp5dEe
 s2RE1eX63dCmwepuyMYF+efk7GWol2XU/KyqhWX9S2qV95ZxxwhpSTQTmkyVWLIJB8PfTFyMW5C
 qTO80xbfUUhCMw7mr/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270160

Add macro definitions for virtual channels (combination of ADC channel
number and PMIC SID number), to be used in devicetree by clients of ADC5
GEN3 device and in the "reg" property of ADC channels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h | 88 +++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
new file mode 100644
index 000000000000..aa8e54d7e786
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_ARM64_QCOM_ADC5_GEN3_H__
+#define __DTS_ARM64_QCOM_ADC5_GEN3_H__
+
+/* ADC channels for PMIC5 Gen3 */
+
+#define VIRT_CHAN(sid, chan)			((sid) << 8 | (chan))
+
+#define ADC5_GEN3_REF_GND(sid)			VIRT_CHAN(sid, 0x00)
+#define ADC5_GEN3_1P25VREF(sid)			VIRT_CHAN(sid, 0x01)
+#define ADC5_GEN3_VREF_VADC(sid)		VIRT_CHAN(sid, 0x02)
+#define ADC5_GEN3_DIE_TEMP(sid)			VIRT_CHAN(sid, 0x03)
+
+#define ADC5_GEN3_AMUX1_THM(sid)		VIRT_CHAN(sid, 0x04)
+#define ADC5_GEN3_AMUX2_THM(sid)		VIRT_CHAN(sid, 0x05)
+#define ADC5_GEN3_AMUX3_THM(sid)		VIRT_CHAN(sid, 0x06)
+#define ADC5_GEN3_AMUX4_THM(sid)		VIRT_CHAN(sid, 0x07)
+#define ADC5_GEN3_AMUX5_THM(sid)		VIRT_CHAN(sid, 0x08)
+#define ADC5_GEN3_AMUX6_THM(sid)		VIRT_CHAN(sid, 0x09)
+#define ADC5_GEN3_AMUX1_GPIO(sid)		VIRT_CHAN(sid, 0x0a)
+#define ADC5_GEN3_AMUX2_GPIO(sid)		VIRT_CHAN(sid, 0x0b)
+#define ADC5_GEN3_AMUX3_GPIO(sid)		VIRT_CHAN(sid, 0x0c)
+#define ADC5_GEN3_AMUX4_GPIO(sid)		VIRT_CHAN(sid, 0x0d)
+
+#define ADC5_GEN3_CHG_TEMP(sid)			VIRT_CHAN(sid, 0x10)
+#define ADC5_GEN3_USB_SNS_V_16(sid)		VIRT_CHAN(sid, 0x11)
+#define ADC5_GEN3_VIN_DIV16_MUX(sid)		VIRT_CHAN(sid, 0x12)
+#define ADC5_GEN3_VREF_BAT_THERM(sid)		VIRT_CHAN(sid, 0x15)
+#define ADC5_GEN3_IIN_FB(sid)			VIRT_CHAN(sid, 0x17)
+#define ADC5_GEN3_TEMP_ALARM_LITE(sid)		VIRT_CHAN(sid, 0x18)
+#define ADC5_GEN3_IIN_SMB(sid)			VIRT_CHAN(sid, 0x19)
+#define ADC5_GEN3_ICHG_SMB(sid)			VIRT_CHAN(sid, 0x1b)
+#define ADC5_GEN3_ICHG_FB(sid)			VIRT_CHAN(sid, 0xa1)
+
+/* 30k pull-up */
+#define ADC5_GEN3_AMUX1_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x24)
+#define ADC5_GEN3_AMUX2_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x25)
+#define ADC5_GEN3_AMUX3_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x26)
+#define ADC5_GEN3_AMUX4_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x27)
+#define ADC5_GEN3_AMUX5_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x28)
+#define ADC5_GEN3_AMUX6_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x29)
+#define ADC5_GEN3_AMUX1_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2a)
+#define ADC5_GEN3_AMUX2_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2b)
+#define ADC5_GEN3_AMUX3_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2c)
+#define ADC5_GEN3_AMUX4_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2d)
+
+/* 100k pull-up */
+#define ADC5_GEN3_AMUX1_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x44)
+#define ADC5_GEN3_AMUX2_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x45)
+#define ADC5_GEN3_AMUX3_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x46)
+#define ADC5_GEN3_AMUX4_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x47)
+#define ADC5_GEN3_AMUX5_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x48)
+#define ADC5_GEN3_AMUX6_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x49)
+#define ADC5_GEN3_AMUX1_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4a)
+#define ADC5_GEN3_AMUX2_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4b)
+#define ADC5_GEN3_AMUX3_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4c)
+#define ADC5_GEN3_AMUX4_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4d)
+
+/* 400k pull-up */
+#define ADC5_GEN3_AMUX1_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x64)
+#define ADC5_GEN3_AMUX2_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x65)
+#define ADC5_GEN3_AMUX3_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x66)
+#define ADC5_GEN3_AMUX4_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x67)
+#define ADC5_GEN3_AMUX5_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x68)
+#define ADC5_GEN3_AMUX6_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x69)
+#define ADC5_GEN3_AMUX1_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6a)
+#define ADC5_GEN3_AMUX2_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6b)
+#define ADC5_GEN3_AMUX3_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6c)
+#define ADC5_GEN3_AMUX4_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6d)
+
+/* 1/3 Divider */
+#define ADC5_GEN3_AMUX1_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8a)
+#define ADC5_GEN3_AMUX2_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8b)
+#define ADC5_GEN3_AMUX3_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8c)
+#define ADC5_GEN3_AMUX4_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8d)
+
+#define ADC5_GEN3_VPH_PWR(sid)			VIRT_CHAN(sid, 0x8e)
+#define ADC5_GEN3_VBAT_SNS_QBG(sid)		VIRT_CHAN(sid, 0x8f)
+
+#define ADC5_GEN3_VBAT_SNS_CHGR(sid)		VIRT_CHAN(sid, 0x94)
+#define ADC5_GEN3_VBAT_2S_MID_QBG(sid)		VIRT_CHAN(sid, 0x96)
+#define ADC5_GEN3_VBAT_2S_MID_CHGR(sid)		VIRT_CHAN(sid, 0x9d)
+
+#endif /* __DTS_ARM64_QCOM_ADC5_GEN3_H__ */

-- 
2.43.0

