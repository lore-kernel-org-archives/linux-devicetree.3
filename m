Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088664;
	b=xtgfZtNS3wcdqWZ/N9B+Ria9Ur01mVuIfDypqF01VvZvQXsvsSFrud3TxO49ZfO6bP5n
	 iPc4udFzYZGe9f2q5GqZxmvz5y5Vxf0hwGAgCny0QV0Spp3JV1HLlspwEQDAJhIyIzSy0
	 bkIhv52dOpV3+xN213xz4psubcEswlmpEPjAt6P7yO3BpdkrxhvsJ+4DIL6TXtBrB0+Bl
	 CRv/iHZyhpo2b63KFj+Tl/Ghaw8CFNcmb8PjmghDlKc9f99Q16xo1Ak1MRgbp/3gv14ve
	 Z3VIhWEK8ecrYdGfbYAg8TVoqjdzLbkQeiPbmlqfBwuWpkHWJpJtG/SfbO3tV4qyFhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IfFdAMhjQtLnFWprbbUSqJpRJtwKttnG9dXYD0iFDfA=;
	b=4+MSEFguMqEzQpLYFr8ckJoaqOXGJUnqm3HijkGp4LTicgq/SyPHTjlezS/3tqOlloJb
	 MuPFYR2qzkW/5mkJkUVW3CQk+e5utFiTmq2ccen5lqEEf26l+TRpwfN1vzeQ/v3SAlyuV
	 btc2uBI+2WMGCASHw7wjN6djS954EXIwjg6PAEwDJBKmBj+IpqAl9sjcbOtTXsDMlpIme
	 1ktvNMgikcE8ryPQQQDLXogscUEB+JAoCfxQuGkN/ic/rA03LD+J5B6HoZQomg32cFvU4
	 ZEBSh+FI1CQRw/+U9kbZiXb6ocOztEv0c+CtKiyKYDcRh1i2gI8Vzw2GqRzo3PeiYWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aMoDgYO/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ceiKnBT2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65BE606A32F
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65BE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMoDgYO/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ceiKnBT2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuKTC3475549
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IfFdAMhjQtLnFWprbbUSqJpRJtwKttnG9dXYD0iFDfA=; b=aMoDgYO/l1598XdP
	6f7MJRcspIucjKkINstmWxBQ8QTTV9Wnro73aAOYvvEYR2f+H0YE7qkcrO4azlSU
	eed7+0CAwsC/zVVyVi6As5Cx4CMikNua0Afc6/xvwTmf56byzKQqsI/+tjWG+3cV
	RAJLBzm3BWspwSW5fvpVxkkcZIO+0y6ytihjeLfc5T+Mixg0OuGdVWp8fdHsYU1t
	CrOeYVmBvUOsdVv/ILoRr8oaXO9A9OlN8LFujaqgoDM4H2lbzsaLxzvDYR15EpgY
	nLy3HASoHzJkoxTX289AYsBqT+Xc9qZoBonBobV5/P+i+BcIHH124kmedZnT21m0
	toxcwA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymgcg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:44:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so1539273a12.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 03:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088663; x=1795693463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IfFdAMhjQtLnFWprbbUSqJpRJtwKttnG9dXYD0iFDfA=;
        b=ceiKnBT2M/zkyJQNOPB2npoyfM8FjCnSZoj3hg4adBMzr+v5zByg1aUThCq7vCmaP3
         vJe+89TJml0bu4yjjTqwr8QUeu+g52mPrj7zbp+965pAI7nRyVZGd7qOJcmCX9/MTmmV
         jICJKDF9st7fZC4+YIIRP32IBx4GHjDlHbKD09T2G8PbS+LXEjZUd1boipGLvPwt9dhb
         1f0tU+JLB5wofsX2jHJRN9WK2nG2bj1giOmyFleuVw+Wm1eIhii/KPMLCeSiqLi1hQZn
         DVLn8aiaRj9EV3CVGULr44a5PiQYOh9BSvOAUrvg4Qe8SP0Ci/VG9qPdora2pzPSr9o3
         8ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088663; x=1795693463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IfFdAMhjQtLnFWprbbUSqJpRJtwKttnG9dXYD0iFDfA=;
        b=2402/dpyzu33NyMufTv2/0lyd90JOF6406/UsYxGtJNKbbUuTclTHt0Wcx/vf3VBR2
         ncPSnyXBHqNQmKYWBJ0HR4l30DaXjfYOjmaHGIGbuwT7ykhHkuAgH29BqMf+6hDQtrQ6
         sP73t4yb/74vsRKtZMJQmLma1bBVwFOi57VCqgO7ZW3hrtcyeh9hiMMBz0ynJgOF12If
         8tVp5Gu1B3FzUNMlAcbdGJ6oxzNOEOSTaj/tksgtg8hp0KIh0BuqsLaZD34RHebX+T5Y
         dvVmy7TqxL+0wa/m2WkTJ7LWc4/xqF6evLqVSQA+/DeXjLERybBx5FtRZuwgUNozKaRa
         6xVA==
X-Forwarded-Encrypted: i=1; AL+hErFPQEyZPvcuRW4okPLZ8hT4+mRVEHyl6PKw/JfDgIIxdIwsTOQYkofgoWK+06q61xgbAspF1EjvfzaY@vger.kernel.org
X-Gm-Message-State: APuU4Z8geM8vNe4DLIPbKnOavZ1v73D5xOgdf/3GzZlaxtYkPB6iPrj7
	QWGU6H9KD5NbPEcmAa59Gfq/1dnJFcAI1KuFsHOJ1Ms091buLdx16LNODh8mekApl/qnYx2M2yq
	QkmB5JJ/HpdnnAtnSFUHbatz7dR8nnaza3QOAV8VWso47HMKL3BTvz57EeDGG1ojm
X-Gm-Gg: AYBFou0+ZUB9C0YbcoV7ocVt1tt9h2Y5CzVXTbHVDTwvvxdZphSbKwVj8s/UfeUcKzC
	xVTgz2dN+MWz18FaCiPLJbJHAkD/dy6vw355O1fsrTn5eNmAMf75KUG0g86jzZj8H1DOKSTcOLp
	kTYTuE+X13LrDocIGQ5SlNlvIoC0wBeH1rhcKbM4Ci904WMHMH5HgUuTcBtbdXj2kaw0z7FlQoe
	zd1gdUboerNM/V0r95cMtlUqgiXSlvsqrFQhdILESYLleo1CCKM//vjwRLyo4jmiqRbOh1EaXw7
	bP7bwbXw7M+bwn6m/0KPwC/axZ+H/aAZuajWJ8YkZlenk4DLtczvSAMHvLPhWQ4Fk/D3LoeBN8H
	G3bejnmMQcE4ZCtlZB3YND32Zzfd4V//kzOBrXiqdWkBry97v2DNx2iD9b47uWpzo
X-Received: by 2002:a05:6a20:1730:b0:400:9acd:e3eb with SMTP id adf61e73a8af0-4009acdf7bamr908471637.37.1795088662654;
        Thu, 19 Nov 2026 03:44:22 -0800 (PST)
X-Received: by 2002:a05:6a20:1730:b0:400:9acd:e3eb with SMTP id adf61e73a8af0-4009acdf7bamr908440637.37.1795088662158;
        Thu, 19 Nov 2026 03:44:22 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:44:21 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:48 +0530
Subject: [PATCH v6 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for
 remoteproc SMMU mappings
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-shikra-el2-v6-5-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=2086;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=JrdnVqD6CnT0x/3ft5oP3Dv2O1gST+oALTVm7nsli3w=;
 b=emGhpBfESpxzmoZn1AAoBVv3/LJ6QEpQwOWAFgh9QkoJHeL+ELLlwq+M+t/cJfZgBjuSYwOgP
 aVOnn99gj5/AT/ussmF9dTs3V7WqhocW0fog3/Y4DB4KTVWozbaZmVz
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX7lAg09aK+MS3
 ES9AoQGKqG8Tj2V+q6KCdu76/QTa+tmZnQfUY4pTw1MzyKQ+6il7odMF8JEIfJM2hREkBgWbGuU
 bbSViYuL2kmsQI9U3w4nRbjHwKcTwyQ=
X-Proofpoint-GUID: zrGzQeayidesOiRzcpOBoe6GiaheBq47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX4udIpKwqhBUz
 d80n7FtRUaCT2cpNlBqq9AAsi0kzGHVtTW2jbYCh6IonWRKJNLWgb2p9DJIFShMnaeNvLKWVnT2
 uu0sKpGXTG9x1sf2Lj896GDtdSaDg6oj/oFrNZhkd8E/PN7nXMHaTCb8bMjKk5Hm8r45Lhc/M0L
 zEZnL4uoViotSQonszKW/S+EhEJoVZz0mc+Hzv0asUShGBP8quSXVEMppyFrUqGPSUr57AXxDBz
 mYkuwP6KJXMOVTb09ZCQ+tzdKU16cIoyuNvvlhGBDLSt/VW7R1Bs1CmU6Ntqul/fXm0/pyTH0Zf
 PFuTe/TcEaxVIzGsI6XYdcHpdtsFUP6Zg3toArvhAKLAjOLRi67DtqZg8fRBXgb5Fwa4PQRewl0
 wcGbJtgfPO8xArIvX2BOPoLZUSMfJBwG7SrdHOBFUtjYu2ZBxo9rYt7ay9/1QVIbo475Z5z21aJ
 031EZJCAKHOxpmp8QKg==
X-Proofpoint-ORIG-GUID: zrGzQeayidesOiRzcpOBoe6GiaheBq47
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6afee117 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r1478T_rJjGiy3RGUEAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

SM8750 board boot Linux under the Gunyah hypervisor, with Linux running
at EL1. Linux can also be booted directly at EL2 on these devices.

For EL2 boot, describe the IOMMU streams used by the remote processor
firmware in the DeviceTree consumed by Linux.

Add an EL2-specific DT overlay and apply it to the Shikra IoT variants
to produce -el2.dtb artifacts alongside the standard DTBs.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  4 ++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso | 30 ++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5c8d179f2792..60f627a469e9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -511,6 +511,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
+
+sm8750-mtp-el2-dtbs	:= sm8750-mtp.dtb sm8750-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750-el2.dtso b/arch/arm64/boot/dts/qcom/sm8750-el2.dtso
new file mode 100644
index 000000000000..3e50c50e82dc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8750-el2.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+ * Pakala specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&iris {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1000 0x0>,
+		 <&apps_smmu 0x10a0 0x0>,
+		 <&apps_smmu 0x00a5 0x0>,
+		 <&apps_smmu 0x0425 0x0>,
+		 <&apps_smmu 0x0525 0x0>,
+		 <&apps_smmu 0x0125 0x0>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0c00 0x0>;
+};

-- 
2.34.1

