Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED5A476052
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807343; cv=none; b=ffaCR3JQos0uqjWjWUV/u9aBpnSAzIaiVP7Cybj73FhwnaqcEwfGAgFjgyCbW40kT6dR0B6TNrccAv+doNEft+63hLAhpx1hRyRPPwPqNAMz6kXGRWRTERs8nk0W1fcQWy5g2Pbt70JT5dXsKYrri0FZynWf1tdf8gL876iCDIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807343; c=relaxed/simple;
	bh=rR+bMV4O1HWRyUfn0PS2V1qLpBC0AbtGXYziuLCkD88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HtkgnyrLI4eP9kvpG9JGN+KGl6+ogULsFbRu6675HJOFwYfGsiKwgW31DUSq9S1J4KEzlHhN2qaDl9gFnqGFvv7W2qnbukjEIF0V68V8nnvy152OkEZV5VB+aTFUZRsa5bakx2rIjTqKXV/1Vak/cfLU+qIkTCcReGGMOCDIgrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ToNwI7Md; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GW+h2xd0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ToNwI7Md";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GW+h2xd0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9DkMf3567633
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=05RNfZx2rT4e5dyY4zlHQ/MiVh2TM+NTqYq
	4D7xgIgc=; b=ToNwI7MdmnSTE76X7sPyuXHG25rb6kPmJCV4xrMNxNEIurudhll
	YNps4fxs+uKOVGS+ZJMtc9L3Vkt2Ytx8/C3Dn4PasRJE4tv7FWl8Yc03z+V7Cuu+
	pmol2gcBcmaTo2G+g2yuDO35/IIYoBczskkZiaSwPITEncN4srTzT3Rk8u1HiaCg
	h+J/fIMjBI9FEYcScS8q6YXI9tRMFAhl5mvxSpdsVfPCtnpdan4lzJcCBX+O5Sy+
	LWAw9MLqNPBLLzZzjPFHUCoOd5pld4L6j/Kas2QPKCGnPUeoZ/DnDtlZJZ0qEPF6
	2jgUrHtNIcz88kbjAMkOdccQASUPrY6K73g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg520jrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:48:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so11529321cf.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784807327; x=1785412127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=05RNfZx2rT4e5dyY4zlHQ/MiVh2TM+NTqYq4D7xgIgc=;
        b=GW+h2xd0PFwwroLProaIPpV7QD7dbx4uwm0q8tUTC1ety9/dRj17e6VSh+6cAW9HAW
         kcOZIJ7AjrQFc0tmhz7CoET+/5ZbXWqwS3PcqtGm6SsF2HxEYdtGJJXnvZ4MXf/onRH3
         MxnakwUSpp4qhp2KESVCyOl5m1p5lMpH3d1oQYKoIN01knnDQP4fS8kKMBHlRaPAmP4U
         np4ZGgB9ALGpxdlU7slqgcuEtTIAhrZoMNLUz8UcnEymRlff9qHKm7FCVov8J0BgbULs
         A8GXhNJiCS+hcmMnFOyvem2uB7a7K2zWUxKhrR7Pgx/gX8upi0URamMHeEnT2phDd71W
         15yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784807327; x=1785412127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05RNfZx2rT4e5dyY4zlHQ/MiVh2TM+NTqYq4D7xgIgc=;
        b=fpsD6dD/Kd1SSWVW/vZOfsh51mAqPXh45BOSX/P9Vdw5ZlbOTX6rLRSMDjBcDF10Ul
         RWHWU4XtM/I37BK8o1OdV/0TwqJaj5kpLVH9bei5N7Ha9S39YSvgKeTy8QxLfAoqCfO2
         eOwdiwhDaJ1sKfuF2QGSvR41ZhkJPnGGX5aexl6S+T49+nDKkAXlb3jBUrul9rz7xjW0
         BoywIDaOSJGk/iVIGHuQod3SrxTzfqNodLpIgbmV7oIIWBiyZUDXVgU183kSj9HlyV4H
         sVP/QbwelEr6/Ty6Nl2zWjFdiRDvu0TvHbS29pGUgrR2f3NAEgKnGv6CCo5hNVzWMq+4
         4BIw==
X-Forwarded-Encrypted: i=1; AHgh+RosUpqhJnKK3W1O8J/nTmaXn/7psJKvWG5usaQbsW7+ubDFC/A0ykr9Tz35bhmp1XAO9993W9MvNESx@vger.kernel.org
X-Gm-Message-State: AOJu0YzksVKlI6c0yLk1Dk6URMpMs+IOx80xvkvy4RnNITeyBh+LPQnL
	6U+7VLqWYo6sBEAVqHYteH+1aqbpeF7TIpupZm44VrE7qekMPkZTZcrZoznJbKLlNikctthGQbD
	zgmIAOFyMJLykQKpkPfjCOP8RiZ+ZkWoB8Pduw29nf+cLcoVPf3vjCyGQavtp3Gev
X-Gm-Gg: AR+sD13wn1nt26TWUMCeV7DWD7CXsAPb373nAb93/3J9KzHgNRX6tsXiDCPQGWHKZ1D
	M7XGxrDcGAAGxXtMfeAb2ZZuCLco+fesA4Cg2XkQfQSEmcx1bMmgjGkc4V679jrAFneYMTJHgpp
	a6cOg0RVc2z0AXNHPMgoO/600pNAUxo21GmAupPon5pfbRlRwwBGzc2JOHYQDcqkzvJ5bGXVGqP
	EKYdLcdOW/LbsfiCDf6AmNzPGgTDBqSx3aCG0Ru/uqvYqr5hmLMKYJZ1tHsckDakwWZp+32a74l
	ZELQ7tYkKedsfqx2L/i+uSpWFyhrFfaDSJ+U8BY7NYlTn/4Brrf/ZDzPegTYTHd5NxpIWMM7pk5
	tsFQu7waTwgCZSThT4qLKU4iTUvs/as+kzKKCCBsATKh+dbCYVmNZIG0AIJfQ3kKXuQUERBXow4
	g095lias+C4YYDXgw=
X-Received: by 2002:ac8:5751:0:b0:51c:7b11:41b9 with SMTP id d75a77b69052e-5283dfcf944mr23732241cf.85.1784807327037;
        Thu, 23 Jul 2026 04:48:47 -0700 (PDT)
X-Received: by 2002:ac8:5751:0:b0:51c:7b11:41b9 with SMTP id d75a77b69052e-5283dfcf944mr23731981cf.85.1784807326440;
        Thu, 23 Jul 2026 04:48:46 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c4196ed98sm166302566b.30.2026.07.23.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:48:45 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: monaco: Fix CSI I2C controllers default bus frequency
Date: Thu, 23 Jul 2026 13:48:44 +0200
Message-ID: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a61ff9f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=4Wih4rDtSPqUeWgalQMA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExNiBTYWx0ZWRfXyyT8a6GBkSMt
 Tn9HI2ZF2PGQ6xmUsgUYQmY6aV5daPZ0aoxkHU9vBX3Mft4J4rAsz3A9a9zIe0+3FvS5v3vULuR
 bpDFju2ZN9ODnNA+p1tJyLLazcHpTCQ=
X-Proofpoint-GUID: Uq2oStmHHYpwZsCF0wBcuqW5sCiPugpc
X-Proofpoint-ORIG-GUID: Uq2oStmHHYpwZsCF0wBcuqW5sCiPugpc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExNiBTYWx0ZWRfX0JBn6aLqVvaJ
 1TKot+Z19YKsWC7P73TwwACrSdOz1bV/MyXn4ZYuG2u6sFag+f50MvGeRUijFlVtE+BIl2bUYVU
 RUfqqxSzH2yaFtrJJ8/klcHTIIglWxqLJfET46AqL2BpramGr/JGTUnI1U3fEGs1U98OsD8B7y7
 HT1Jt7gMSti7VhD/PGRZAVr9U8TwYz/r6xewtA1JKmwwvvJNkhJ9LQqcFkx3y/p9l7M8l3kYCA1
 64OX/I/jthxI/2uHIx8QnHGLnMiBB2nOrE7+RWkd26hj+oFDvHLlkzuYDN8q4dBe7qYAMdhluk/
 FInYSzvlIHvesn0VNUWPYX+fUu6xwlfgIv5VF2XRubSFIGwQOSkNEgCaPmESQmFAAxnUKnt6lSd
 vt4U/etEXMDbXSfdNrYUWXmkmJXK9pfQK5CYHFIy+E30QtO8Aj5X5EgMXp6X6bsfc1Lo/71YBS2
 4QD3xmcuL3tQMhCjdjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230116

1 MHz is quite fast for an I2C bus and not necessarly reliable, change this
to 400 KHz which is a more reasonable default.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index a22be507ed9c..d3b59b9e84e6 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5472,14 +5472,14 @@ cci0: cci@ac13000 {
 
 			cci0_i2c0: i2c-bus@0 {
 				reg = <0>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
 
 			cci0_i2c1: i2c-bus@1 {
 				reg = <1>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
@@ -5509,14 +5509,14 @@ cci1: cci@ac14000 {
 
 			cci1_i2c0: i2c-bus@0 {
 				reg = <0>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
 
 			cci1_i2c1: i2c-bus@1 {
 				reg = <1>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
@@ -5546,14 +5546,14 @@ cci2: cci@ac15000 {
 
 			cci2_i2c0: i2c-bus@0 {
 				reg = <0>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
 
 			cci2_i2c1: i2c-bus@1 {
 				reg = <1>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
-- 
2.55.0

