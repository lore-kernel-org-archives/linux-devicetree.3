Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58C83C5DC3
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063888; cv=none; b=SMUH+0M6+Acp6YYE4bMYKa3Wlemk0peDY3NTbww8f2qoc1Nq6kdm6wqx56FIGqMJLftTQhkgzPHjQdtkIM3/YlIre3lq9U0x2gZTugxZmMIqbzJL0tu8dNdn1TZ8lDkKcWIjpE6BziHkLn+wn8gwjWgErAOKW6SL5V3Tq2lCAYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063888; c=relaxed/simple;
	bh=QT1O7JWZuQeCOEkAN5pFlabn2CCUVlrdoZ+6wOk2a8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odtaiTfj4WHQ8o2MpDqUMc2DMrDAOGp9ZeJmU3kMPigObkcZtMaufh5OWpFog50xK8rPf4sJomPqw3C2C/wZGTZ1sag7IdyKF5jFD8D+izzP3Je/zaTgQx9ANP3zOW6YMVgujDme0u0exicfFjrQnaoqJ/9XLqXoOXxiYgkXGOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhgoA7VA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKbhPREy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhgoA7VA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKbhPREy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKYrR4119189
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=; b=KhgoA7VAs2Apz+wE
	79IHmtYPSmrqIfWJPhPQWZh3f/+2jfXLtU6VmaBOzeQnCSh+s1chx0ccaKAdyWEx
	sZ4VE15AI+r70ZTUUL2fR0LWLAh635Jv9RKhCqqRu+MLa7mvOVZ0K5hN1aYwkBAr
	u4d60cDM7ioBImJRS+yn0FkB85k67OhOaswLIh/sHLcZe4qYJCa2Q6ogK6ANpFJF
	xkZhIudCDiAiChIuTk1rZjKTNErCdvPyukTm1l6d7zkxdbvdcLKsnNhPhfSkk4bk
	PuyDrcVhuGn1AkgnDL2M9n+RkaxvF/ZZDF8S1NRzZxdCFCOf32W1sCrhO3MHXDYw
	TtRDwg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rcgvv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:11:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd6cc53fd6so145776255ad.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780063884; x=1780668684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=;
        b=WKbhPREygcg+j37IPSiY045QLp4mA3zS7jxVxoNjxTI8QcQQ+Miq2F/JKWYYWo5BCB
         5/pxGKPpnELr/udJ9ZxmqA0vWQ2wJwfjv6RhVtvubqEbvM0RS6XNfY+xlsnAmkyJNkqW
         KIcsjaGo0ck6RT5Lc/YGWw/zs5iMN37FbbjBgqtMI22u/7iGRmHY/5jAFtWcZDUcgd3l
         GbLhlJo3xhgKxr7dsgUnuNiJw8P6sAqI5zT/82nkxku1oN4J8lBbQ/uH5RCIuUdUyMKG
         Q2WOc4OPWhvQc9ueIupyt0LawS9IcYG4QqBhDDs9YQHjt3bB20MhSUZY+LCdM8qqZ44H
         FAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063884; x=1780668684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=;
        b=JKUxwrOcvoyCmvBNpG0ScFqKAiGJrnu7KMck/FTlig6q54SX1E+LRDxGnZ0AWvXiTJ
         b0vsbUupjM8tROMx1qvoeO4pdUITxMZxoqin9avxF0Upz6wQRKBC7GZ/XNYLTuBiGh6e
         dMjWbdjMqgpMeWIlzqWfnbEDrXkAOy4fxv9Cfy8H+M72UbmrqRaHxN6jA+3NoYHvAEoD
         bBYUVLjh9Jyw7WmhrIxN0gM0JXS9sbvzwddXwabsyAxuqN+lXnZYDvA8f4xUPXXgiu2k
         qIiEm4l46RG838BRkWXl/jsFvSi6FSxzVJX29XbBnkodBcN4uiKMYvmhFs4qhyuVYY7+
         2dWw==
X-Forwarded-Encrypted: i=1; AFNElJ+ds1efko4KlSGp203PkxzV5YmwrJgaLKFjdGPdEHE0xDqYaBGW1Wgqfz/7bxqxVDQ8xx6x3bJyZyYe@vger.kernel.org
X-Gm-Message-State: AOJu0YwVCP36xOxlkD17noR+ATrWjdi+3V5WzBcIpck4GM9tIF37ap/s
	ObxmH6Bdf5ZBtVMqZRKWTAdd/xBw6d1ruiMc5BTn1oB85IvENtwdhWhvkrHcMzkCuU43q6OJZhb
	t99laxmr5yZCqsNoNg/B3TKvBfDLLOEeZOGOYGeX9+QIKysjnehx2+sOQLkyGbqG4
X-Gm-Gg: Acq92OHG2VroJCoyVR7BIS7cfimwhGbx80tWupBGf5AB62fuNQ1eaK4DuLVb0AsHoxO
	lYbduf0O4FpKBuAbgNOmWSCPE0eMDzA27Qv7NZMwwk0Gt+rQp2wPLcNjuiJ2q5DMNqje5/KPY+G
	XaY9dzGj60Yodp61fCLp06OVzV37+6NKNbetD05hRMazOMiWvEFCMzZZnf9jT/w4ZkXqHRVlY8d
	Uzz115tLsxL9jAFZdzJZBTjOW/x1+nNU1aSIS1iMsh7GZo5z2eLTPmVCWDCTQtVUmhxUZrjkW+D
	iWX0jRxJVNAZxIKciMtTbZXp+D+XHSGLbHth4iEcQVF7HBU99ZEx/Unxt4jS5ZBbD52fl9bkE5I
	CqLaQ6yL0rYLzMB7D/2fOiljIH5/Gbkj3JZmsOCoCa2qiEQqZtVhquDEpW0BYYswvrcnS
X-Received: by 2002:a17:902:ce0c:b0:2bd:6327:b4f5 with SMTP id d9443c01a7336-2bf20cdbdd2mr36696275ad.40.1780063884044;
        Fri, 29 May 2026 07:11:24 -0700 (PDT)
X-Received: by 2002:a17:902:ce0c:b0:2bd:6327:b4f5 with SMTP id d9443c01a7336-2bf20cdbdd2mr36695735ad.40.1780063883532;
        Fri, 29 May 2026 07:11:23 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a00a53sm30775215ad.27.2026.05.29.07.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:11:23 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 29 May 2026 19:41:11 +0530
Subject: [PATCH 2/2] PENDING: arm64: dts: qcom: kaanapali: add reboot-mode
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-2-7c32161cf50b@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: 7xXT_w5ZRYukFkhXvUnhd7iDyAfggwUZ
X-Proofpoint-ORIG-GUID: 7xXT_w5ZRYukFkhXvUnhd7iDyAfggwUZ
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a199e8c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7AJH4AG-BTyQ-FR_P80A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0MiBTYWx0ZWRfX0Gl2USAAMPUR
 V2R1K8hjhXjMybtrqosxx2X0z4xO3XFusIxHBnQHW6l+OWPOmaKs/zHHgKNPrXlX3GvO9cy+BpR
 mxo9G4w5dbz2Bbo4JZBjl8VCoIfaAlvXDfLv0YckJvTeFQTED4gde2dlg9DxUJWQm3CHnoSnKT1
 VDxMj2feGcPx81mA4nYGJmt54TO878aumP5XTcoteU0X8Uf/XUJBlV6tv20MUJ5WU0ipbQTP99K
 3ftfpOavq8yD//l4cqufPbuv65QGgOPGkaO6j4q9pty8SMQzaPkoxA3c/lJtnV5Z86SfKVEcn9t
 szc8JecPgzHFEE9sRa2Tys+KLXA3cPddMDIdmD1dJvuz01tJSEIl5qbo7wqMQdrn1XpeafzcbCH
 eCPvsPuTmaSr6HPa6mL9PSoMtDpN5IvyN2iqLWmC1y3bBfSaQAd+o4PLJjqn9n4wac17F+6BK7u
 PV3pBvzoKDLhmiib7oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290142

From: Xin Liu <xin.liu@oss.qualcomm.com>

Add PSCI SYSTEM_RESET2 reboot-modes for kaanapali-mtp and kaanapali-qrd
for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 7bce5653ea74..6429d91eba62 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1356,3 +1356,10 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 95dce0812725..85007e53c456 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -851,3 +851,10 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 63c828c80920..d8203b2dbc8c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -274,7 +274,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.43.0

