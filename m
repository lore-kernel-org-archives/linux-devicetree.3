Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B5041DED2
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886908; cv=none; b=FHDM02wK5wHcOBwZTLd38Zr82jTVl4Fxx3fSUv/eHi4mm5OqLPaj+6u16wxcfPLUMY2fEsY4WoRwE8y5BcrzV67G/7p3zUcp9UHEG/rd2xwAgGHIiVOcR7S7rEZyZLhalG4/pHoXBUNphVpRC+ShBParbxjzgD0rRoCckQbru34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886908; c=relaxed/simple;
	bh=A2YLyH7JcJgoRXIQ3ZAsTHakvd0VJnhjFDGiS2WuYJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6NH6727aEFjY6ebXKcJwyYrJEB49Xex7644E6u/pT3/+vZqScXP+gDtNTlNq3aklSGhuec202sfmh3Y+21OwZn5+8Ca1eb+lB4n0RtIN+HaOcSWLtl7mOQW084drOPdpK6o6RHtAoO61UrbDfSCSOfK5viUkQfXRM+ygjhE50U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSs48/XO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTbCII32; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSs48/XO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTbCII32"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lJKs2276380
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RK2KUPhk9iEKyipUm2ztkbbRY+972Yp7NvKxoamx8iY=; b=KSs48/XOup/fnNjR
	FHwa6CpQf0PA3kxm8me/1qA+dVitU+2bI9OwI1QG9ZA9HHQXwl5tcyCJy7p9lsMw
	ZGPb2SlLLFI2kniDhSgQT2kIV9fCSKA3Y4lDhR1QSkvUWGja2VLyQ0cTwgj9vNRx
	5mdkvoE4H4TNFsVoUktVFbruFGV1XbdSKXNFH3iQSNdJTl7kcLyYVNN4VE/FWGZu
	ZZdIazQApgRvdv1MVm1oMjMIIw3THfHHghq00fFb3Cx6XfMaj8M9WqNMAEwy2kxV
	avAjyBVgGTqO6HaTD+B241ynY73hfRPABnv9s0y8s0TAvi/mIbIB/aKsQC9lDoq1
	sTuA8g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0b681-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:55:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso313779a12.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 02:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784886901; x=1785491701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RK2KUPhk9iEKyipUm2ztkbbRY+972Yp7NvKxoamx8iY=;
        b=bTbCII32SBijEQ30EALLO3WTeIU+inkRWTwjZ+3zWHxYMk59PZt2oa1TBUoFpFo7Hy
         f2sDCbnmeGiUr+w/f/gkZId/Cc0/Dh8OmWoper/6G6jPRLGgT9IJQFDXku+EvJtcIeYp
         C14K080yqCsCg9UjbrngGYxOD1MdK1k5dgKDC8VY9v/ebNakVb1Lhs3dO/61h6bthqE8
         J4PFntkjWHS/9t1pV0nwKdrhmicOcab94xzoBKWCmW36RY0QI+ked2p91R+HbRNUGqN0
         nkmpVxR+9Vg0p1t3E5UVLfFWTZQF5syDPMte26YsFJLfSnB1C1kFJ1i2tFqDO5vCwP/E
         5eNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886901; x=1785491701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RK2KUPhk9iEKyipUm2ztkbbRY+972Yp7NvKxoamx8iY=;
        b=fGyV0Lt5DCn+rak6Mu/AplAgD+vlN9kYRp7D9BIDS4Vj2pamsU5hZzIlMBqtQGB0Nl
         5XefW699dNM7vAFhsrhVKgmgiYhXyMZjT2wg17A0R8x5wLaj8K36QQPoZyrJULnpvk/c
         8rFFYaOcxU6ijqy46jhKZ27y0oXrMlVlgjaSySS9h9IQ83eEhY5ieL1zKv/SUNhk1smV
         Y77v+YGJpaXU5a3wfM1c/sjCtcX1/IPfj6eP6mZcxEy0if+//RKj20ICgaxKMDeaI9xs
         /M+AuME5MEJo67PLZcOdO+7fWSypZP9YUc9doYZf0FT+5seOaW8D6kTVGrxSPLiFdwuG
         nvTQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyOSHZ7wJUaIy5N7OWtVaPwrWA3wzZweMWTWQFpjSJMf9u2vJQ9Aa9qLMS75jKY2tYt9mItL1JVCYB@vger.kernel.org
X-Gm-Message-State: AOJu0YyNAFbZX3Kf/MUcXEu1WbMfTcYG1gN+dIWADkm5iz7KOh/VMhRT
	b2dZqh2JK/mRkiImkfNjiNZblNNeH41oMZvg0w5dC/q0dCfxb5m+w7uad/iB2QplBzDWp50+WVu
	yjmCTeFXzJ+GdMWbejJ6zv8Jp+D60l7E03KfcJOd8BAUcDSrZxtMOnRdXL7TxYoVSQ0RwEWD5
X-Gm-Gg: AR+sD10HOgr3+5tMqu4dzWCJqtXm1enCCb6S99gTq/CukdVMbuZoS4m3GmsxDxzTk4r
	xirJuz5ge3Zbj+ZI/CRNi1HUFMeUd+cNU4l2Ww4ryKf4spRniurr3wO+Y1hJbOIoAraAWSha/ZI
	22KRrw5O1Fy8sYEjkeP3iqIpXE++dTEcd8J9ro6IzSu/4BukeAhIh4x3nVMUonHNBK7S7rnJa5i
	b2OfyOPY8j5/6wiik9g5QJApVvrGQw57DLSfLkLbM7WFM6rygrAF99NZ1YsmSjMIh5DGOnOGbnf
	Y7L/xT4QU2YI8/fGQcBEZTKQuLXjlWqS4STUJaISLWHq1WRt4JhM36UHUMb7sM2zPbVUQdgPiPe
	7QjDMYV034E2LlQaaCNJHjjpCxH7uR+qvVLByutz3vkKv73kiqZylBesZjEFPijzuD1eQU1Bc8O
	IsdEwJr5xgTe0g90BUqpnViJrxVa06YQ==
X-Received: by 2002:a05:6a21:a89:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c44b04cc2dmr8005817637.31.1784886901233;
        Fri, 24 Jul 2026 02:55:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:a89:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c44b04cc2dmr8005793637.31.1784886900824;
        Fri, 24 Jul 2026 02:55:00 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm28975093eec.28.2026.07.24.02.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:55:00 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:24:46 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: ipq5210: Introduce RDP504 variant
 specific DT file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-08-dts-v4-3-65e61a1061f0@oss.qualcomm.com>
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
In-Reply-To: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: U_drvZCzUnOb10WoKr3X9a6a5o-RkD6Q
X-Proofpoint-GUID: U_drvZCzUnOb10WoKr3X9a6a5o-RkD6Q
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a633676 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OPStAwdTocQlwmF8_qcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MCBTYWx0ZWRfXzrpzN1ZSjIB4
 w2D8NoZtfyoaPzSDnlKwYiPC8JNVbWJD8/mq0+Oqsc48DcSRiSKAfBaYnSNFCTpP1nGgMxAP0Ot
 hgexW3N6k3XOsjruHYWkkAWRki74iAcQxAvPrAfysYYZOn+RcOKLIAX1rJhCPzlih9RtDA4EIie
 QlabqVqFF4i/sgCRqnAglaJqt6LWXdbUSgz9OD4tg0ZdLq9rVq9NMVYDHY9YkBh1VZgx3G3KmKr
 y2uAcEoFWNWTRDruqRhKyS3G3ttJygMBcIooF6i49mS5Kg3T6tQMT+/Pi72PpaefoY0D0Oja70n
 7LYwiXSZ9Gq6hke5G/SYUJvxNHb2SydX5ANftiuS7/2C2OQEsD0AD2vwqh19GXJn8QaO7kcj0gy
 vT9Sr/lhbQODPZcHXdbI/3V0gYdqLBIx+92RWqjM1RS6FhomO3vkRg0z7Cp+nlBT4rG0icPhT0A
 Dmt53gXO0Jj1H5riw8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MCBTYWx0ZWRfX9ti0w8LgcAkr
 ZOBGaS5kREIEkoon+BTgPEvJFOXdfiVPDrg4HaqjpojNb/6mwf45N+xEwQU7hSgiaWYNwCaUj1m
 eG+7TyAQkxRb9ACO1AtG0YU+2b1VigQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240090

Add two DT files, one for the default eMMC variant and one for the NAND
variant.

Add ipq5210-rdp504.dtb and ipq5210-rdp504-nand.dtb to Makefile

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts      | 17 +++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88c898d8ac3b..6d1773761496 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -25,6 +25,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..1145fcf0a302
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&qpic_nand {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
new file mode 100644
index 000000000000..e5f2f9217f3b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (eMMC)";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&sdhc {
+	status = "okay";
+};

-- 
2.34.1

