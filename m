Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BB53FFAA0
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539550; cv=none; b=LecrAKgHx1cP+Ov3PXR5Fb1Rl1Q/DOoZx0d6uy57uPFWp+qmhZCxkcjRzguHLXQcDLIAed/H9i6kQ97QxZXdBd/OdbhDx6RoG3H+VfgV4LXCT4T+Z+vQa0wP47GsdXNGAd2cvyqW90AK9j9V4r9zjTFjxPHSbKt5dGRfe9adYgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539550; c=relaxed/simple;
	bh=WIsZ63sCQ64dVMlhv7s4p6idYOqkQ1ABcVo8fUUo5wU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AxBc5bBJAW0mz9g+aTvlGmTBG3Q3GLKxjDKP0MbXvDGzjde4+Jp08X65SlCQ26T+HnSygO5skBAjvENBoOrrWEP180l1Okbf9leCEGJTJrGrCE5lFFw3q2Lgc1gs+1SqENI5UseFqe6P2fT1pFq2XPY0A6nrwjBNjW8dzNAELrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQFxpq9h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J12A6otc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQFxpq9h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J12A6otc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U5sGWQ3992790
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=; b=kQFxpq9hKjnC4RXU
	xRBMvX3Wr12/kMtQRVG8kaaQtnYAVJhedcXnLWSsfbHN5dsoTSV6EQ2ndJSHnnV8
	5YB3r/OcbmSeOAxUnd85SgyEkjWVOUStgAmv6MtrL2eHvFpYT1XX46cTJScxjBq0
	jawQB7Y6eoi14rUarHEt+K+HOppK/zozFAxfDaA/xHf4RCRydlCXXc5svLCZLojN
	EjlBNU88R4KHOS4msTdhVIdz9WWVztQGn9zu1SsMK3iuhhcVe5BdgZSEu5bP+2ep
	eXlWX4hrr52I+BBR36JFysNwGtcWGcVKXVIBsxlpX7qCwuicq92c1iD7uTpZ1Fig
	t4k14g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx942ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so807633a91.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777539545; x=1778144345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=;
        b=J12A6otcU3OJ6bCve0Nk28kjw9oklr7VD2iIeg3opSlzpwWhuU/F5DTW1F5WJeZPoS
         w6uqa2nN2mg5MwaJME6koDt/+B1uxsISomALi8UIi6qyKNsuvHKTMV0bhNSj+D1VAnLn
         /CB1pYyTIwoNBC2ef5+IlWu15Ffsj+xarCk8177VVx/Vw2LbBSHTlOqu4PvTcqSMjC8+
         H8AGgZTlMzg0xSQBxUN9AwDbxBaJWWKtALSJZdTnd9tAJTbOOUGlxUw3BBrshjfIy3Cr
         rapoS/W1PbojQrM3UquaV95tfZpxMyjVIIqSnA/i6XudmAWdRc5IIK0TsVTraZTDsGvE
         k0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539545; x=1778144345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=;
        b=bDxGX0bN4CbuSeL4KamGsxhb1RX/Q3aDYmqDC4AMJQo09+rD9SwluhPew2ty1dOfmO
         DKBp35xykxcgJSKCo/ezDFb9vhabmoIxizNWcVtCB3WqHc6f4CBPuQ4Y7qo/GHZG97/Q
         AcxeowH6/ii9xIVzAoRemgOPlia69865GaoJ44s+rHVMSnzPWIXlp8gg8NOoDSaVk1kP
         ON9SagnB64raNEKJT3+LHoU6TX6E0gRleMPlSmduk6BHs83WVlwtCDnFzGwxc01WGx4g
         dDheIkTI7akEjtog2gyEowPS8eTgka8q3u81gI0ZPo5FKx1GCNkpf/g9tfEw3sueJvyi
         yP5w==
X-Forwarded-Encrypted: i=1; AFNElJ8KDtngF6xU/Au5tkhTLS47Rb5d5uWhLEoiwWiHFx4AtfjFP+BO/X3qiuLetK/xa292Qsuf+155hguU@vger.kernel.org
X-Gm-Message-State: AOJu0YxYTvxIJChOj8RyosH/4p06bgXuwtXXpURYG/1XDluYODLdDoSx
	W68Sd2dfG+OYQ4tm90e1H7xsUoEiyael+WK0XOp6CKiMRFwIiAi8pUh6YKKkm6cAsQ8o9EzRJLh
	ZQp7u3IvSp6+e56/iCKFCdtfBJgcHRmCJRlaUBhMAWmACw3t7F7e6IxPUqDRGdK6jdosHygbw
X-Gm-Gg: AeBDiesEG6mYjh9R45grKG3PaxBfU47lkneTfCG95YQPdDulQfuGbLnppWdmKFlaKxg
	tV9nL12dr1re1FB1W3bzNh/4HtfgReKonv1ll/r58JzJt8q4upEq3P/zo4weczdWXB+O14lXoVw
	Y0sb49Cmb1VVLWI/k217Od4PmZeFUhRzfUsr9Sw0TX7wsRgftwKOiknfN21/kbMVSu94cS0Oa2t
	IighwZ5tuZbytXGxUr6oi4ZXhcPqMkVQjg3E3oqIzuaKhjglBYsgyM6LJ14HClsLaDqqK9Ay8Yy
	f2VwksbYKr2dA5ceIUAEuWkOkNN4QqA11ZfFtAArdftmkbUl7iuINtWlxrZ6vrJrGq74axPoGzJ
	AdfYa8Hqez5zeW7zsbJ/2hggEd6XpRV56KA2c1vSUxkz3+JDEvsw=
X-Received: by 2002:a17:90b:3e4f:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-364c30d1566mr1898819a91.21.1777539545479;
        Thu, 30 Apr 2026 01:59:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4f:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-364c30d1566mr1898801a91.21.1777539545049;
        Thu, 30 Apr 2026 01:59:05 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd5249c9sm1267312a91.1.2026.04.30.01.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:59:04 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:28:56 +0530
Subject: [PATCH 1/3] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-adc5_gen3_dt-v1-1-ab2bb40fd490@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
In-Reply-To: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777539537; l=4937;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=WIsZ63sCQ64dVMlhv7s4p6idYOqkQ1ABcVo8fUUo5wU=;
 b=QOC9EeFFaX6PTF3JbdlJ2kBDpnzrGCC7HCvHt0VHIHW6z+vtT5e+JwEcxoYdA7hzS8ISwNlHW
 NIyZseYh6sTAjPxgaKWmawYWHJoMpp3P2KN+Ql8gqAgP7eEdceF1Ajn
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA4OCBTYWx0ZWRfX8KPJPWYGEI5o
 7C3Gxm9hs/PaK0P8TeFEA2GDKKZvxnjS8xt/3O5YIy8ZWJ7x5D7MheVxn495lzU/2wU7lWaATCZ
 bRxcrd24s5mEKyP1MNPe9FH1lPVL6UBmyeMJKDIcp5DTQeqKAgmDcPSrYVJh2RjXVhrQKRvPs4g
 20eAW2DIEmTdwRneHNHKapQz9zZH54rN4TJ1vlDTjL8drRjmXtVhJnfqGTLL12t99iPrz78h3e8
 6G9kreUPVWjOu0/JpFcmTzgufP8DFW2fg2rbGOfdtHT6t4rE/r7uSYonh/PqRtNQXIYn/74W8uL
 6Lq6RKJCjKaAb9b50XzamoxIm2WKlPvwQFIV44N9YGD2rHOx2560o0NTLDLa+RJQ9eBiexIhZDe
 2r3I9pOUlvBDZrhQ29cJW0tczrHIF7lIKLtHgthmIUB2qwKc6f+xyXT7Nf8J0tV/Yk17+/gLFJv
 bu27DNYfboHWoaVuhGA==
X-Proofpoint-ORIG-GUID: r8_fPjRmyYvZsHwRXekYPNB8MHbUmjiV
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f319da cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uKufQnq3ocnfyFJwv7kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: r8_fPjRmyYvZsHwRXekYPNB8MHbUmjiV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300088

Add macro definitions for virtual channels (combination of ADC channel
number and PMIC SID number), to be used in devicetree by clients of ADC5
GEN3 device and in the "reg" property of ADC channels.

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

