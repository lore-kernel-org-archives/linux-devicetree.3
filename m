Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180916;
	b=vct5jsT1GUwDibIdwPd+TRbUHVjgst0uWBwjhwufaumRACK2F8cVbaJHo+9t7kP+1aOH
	 T/BQtZWpb/MPBsGePvMDdQWhiFkH6oV2cVF6nt721jVOm1zhq5k8df3ymAoefRe85cZPm
	 HDVaAjRuOSPXeNXA37wvD1oM9LRhOxzHqrnMDZTOf2pITgTzQLb36lUYV/2XeOs0c95iO
	 HvHMMgN9PyOnkBTw4YxlffZg7Ui1OYRHkGdVz+DAOecgugFcz30FflLjBIfEEYVPonwxA
	 7ybsCvwjchZkeAYdRSxRgNo1aCJiFgwLU0qnkALIVlizy8DQNGZfOSJ328uwR0IQXRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=;
	b=GWJr5eAWZlsx//D+5+ktUDjQsDhotLR9GE1k+FHePxH19ItEfbUmE6tpViXDujA7fJUB
	 3Kv0F8+6/v9L0ytU1yFmVp2o7UozHEzznxXBEOAolHqC1GT31iYhqFuVlmi/wLHothVwm
	 6hDMYEA5Lx+NHypQ1ZrWo/nY+QZgpPPim6eVXnImY8rheoGAIKg26M9fV7Z9w5TdNCxRt
	 NP90ob2w5ECRvwCHMwmQBIVv31EbO3jqmd56xj7xx0TLRhzYQYw89IBgyZlTlgZt0sjBD
	 /f/JmVO9LQPmTDSqIK/I6Eu1XIkJ4+g+ST6Ep0IQSH4P3L48pAmjaRJ0gPYKPvK/J6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OK3l3bOr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e5nNF9W6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857C4606A333
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857C4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OK3l3bOr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e5nNF9W6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6vf3987212
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=; b=OK3l3bOrsZu4/llM
	d7vJJWbFoDBJQK0wfpkEKMLb5MUEJYmDEnXXa5Gk+Tu9tOT4PKIBrOxtz717P1fP
	lKCem2UvhQKu+9GBGSPeXLCXHuya8WEjMgAP/W1DD0kHVmTJelNLIrtsDURPeyED
	UzePuZ3InEO/Tuf8KPyUv6Y0VjesZ9IgCanRAA7QM3B+nzMLJqFg3o9qZABvhqvE
	kAfr7767VyLXx6X10bDTZEpHD7Nx0hcjry981XojDl5dU0IbE8MfCqUfzMJ3RBKe
	6nnpeRAectqv9Ggmjcfu1c5KSRHOsFpfEY0ZozH2BPjgyZkNl/XoYmkArjzbNgp2
	OvFLrA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81mr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:21:55 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3afcaadeeso130208c88.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180915; x=1795785715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=;
        b=e5nNF9W6Cqvx6kpuZhhnFslIQlwunQZ3lMSm6IoxGzd6C73Yc2/df9EkAiHLifbZrs
         cALXr8kEvMMn5Ce6fWSH4gNcVkOlL+97ih9KWQcq2lAZH9bz+8YgopVOJazcPDUlC4rW
         SgGpFpYHL6DAYI+DfVX/jWwunxTlfHBho/e2l6w3kytzTtnwkJ5K0RrSQzctTLeJhGt+
         9HaEgTo3GbVnYtd2SHP/5b3xEIF6xFcclLuzsZxqH3XxuFFpGy9QfAakTRG3DqUG2g9+
         5B6d8cmUwyLnq6qcOFB7XAGxMXdinhx4F8Al1io//BB90+BWd2DG/OKr9oaNtLBtpP69
         dnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180915; x=1795785715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=;
        b=XlG3qYpUSCV/39tL5moiAclLZfn6WqbCIHdqbObG67CQNig+4bpk8dsaDSAthex7P3
         9h0Ngd+6ghm12Lt/K4pEcAue+W2bLv/RI4Btt5j2l7dxUxTaGvKRbQBL2gvWf4teiAQL
         rsNUwV90EufM4XFWrwHYWTOA5Txle/4rmDWvq8yWNAP7qQ9xkXiX3+aYcDyVTlUIZzvY
         SPDdDYtrZw1csaJ9VFaxmAEhhiEJnrIpTZTrHWMPB4+wUvLzynLonAZxk8RurC1ojjiI
         4dXcJUDGv/govRFUgdLfMtWz/eAFzK6+JPFuWWCAFNl0x6ncgLUzYeODYDxyISF7Oi2m
         m68A==
X-Forwarded-Encrypted: i=1; AL+hErFyAKy14tynYGaoQEujMGbxvJ05zGtBVfyAp9hgTiXQJBDRz95Fc4P/KQpn9bpJRvzaJ59vbfwKetoO@vger.kernel.org
X-Gm-Message-State: APuU4Z9Mf1PwK4Ny2tSfXuzIRo/f7fIC8MJZJVpGYCp4j63RE+2hG3p3
	M1mVF1JW1A0Ori2rTXwKlV8MyprZLKgQo0sCJcAp6S8y23M703SiaCXUg1lIO2GQhjre5eBrZrt
	Y5EPNG7flYtPNNMEJNe/fvBjilyxg81EM8GqoOVIYX2UkVPTKenv+Uqb/O3GlJeVu
X-Gm-Gg: AYBFou1uGgId+gUxac/7F3eXGXLYkEdKraoRXXAAUhI48uwfWsyLRx3i6TO6jUc8/kp
	0VJWGIJ3L9AssfQip9B4RkOj0ejcRd2YzEAXWu6cH6r34qDcBZgU0Oe3WCJ8oKRadKVyxHP7QLy
	jwwISJFW4uiDcg7cVWnNR9IHBs3PDdZ4O7TDW52RtacOWmbVRw+zAYgudn5SCAfbtS+Iul58MRv
	UedfblWF98MYCbY58RHX1QBqDVDymh7O3n3EN88Kx6e/dLJqIhszM0unU87xkiZurQrcFCnUP2N
	kw3617BBezW0VaavMqPstUyS2ei+nZN4A4d2kAzv3MBsNO6MX3BgZvr21OJlimu9Sv5QDiJZOVk
	XWlMzC7XZOcI3t8S3DHs2GFSXcawnswXpl8LELa212VwwSLQxXGjmgXGrwu0bE/T5
X-Received: by 2002:a05:701b:4503:10b0:1b5:1a15:5d18 with SMTP id a92af1059eb24-1b5524d74aamr3859398c88.14.1795180914866;
        Fri, 20 Nov 2026 05:21:54 -0800 (PST)
X-Received: by 2002:a05:701b:4503:10b0:1b5:1a15:5d18 with SMTP id a92af1059eb24-1b5524d74aamr3859374c88.14.1795180914394;
        Fri, 20 Nov 2026 05:21:54 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:54 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:53 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
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
Message-Id: <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=2129;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=q2ude2+7TI0KnKHb6cUpVCoHT8Tjv9x10iiUca9DXas=;
 b=nFGz7/BM08LGEuOAefFpYEpJ2dwJn6Jc1mICAYfqjuG+aLJnoStZeC6Atiw4YHJwS3z8hGIfv
 lC/lmIkg/uICXLyW3zIuWgTrI8s3EkqnDhfR3DmeRsMFbL/4WY8BCQe
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX71swuedgHTjD
 qnc9PXtMvLyFOt3Di7Kv7YXRBxCKvigwhBPeS6U+0Udc0YAbkqzQIDxwz89EqFXfAW5pJx3Jr3R
 o2MwQSk55ahfLqYxxZouV3iQtsN6O7X+LqdHSmL7EgofunvOZTWknUI8LPrK35NCz9NjjNVdAHD
 LN1U/T87wyM543BGDax1pCDinlw2yjEJHA2JsjQjteuXZOX9cK5hU8xfcPn6LmC58dYDTwDY6CV
 j7HD+fy4S7Vic/9RMwC0jmnHyKApH9hMTkvAkjsol1rKTx1uCdVU1jyJwzys3ORO/VfA6pnlR+N
 PNruwx5aMt1K2aNz9BXMXfEspnIWI3R/DLvflLAiDH8V43cAbHFeQfC1ESkwflmJm5Z5KfNuCn2
 vZVF0Ut3TNuULjkdBld3LNcQ+nph4rbBxkzX/GV+A4W5J51FaxUNgStEHtGaxrbv2fYlP81xjq8
 J+9ZVWt+MpS19KrzHCg==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004973 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r1478T_rJjGiy3RGUEAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: o87ifK7vuD2-4a8rjt3RrQVHsd6zzqex
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfXwyxy7WLepSdN
 iRgcMa9t3pHongXj/3QKpVDQF2bhiyWcWcU4pkswfnylCTOhgO3Ipm29D/9M4DhvMQA9JID/R7D
 8q0oaBOHTQBXEOddCBOjbyGajkA6PkA=
X-Proofpoint-GUID: o87ifK7vuD2-4a8rjt3RrQVHsd6zzqex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

SM8750 boards boot Linux under the Gunyah hypervisor, with Linux
running at EL1. Linux can also be booted directly at EL2 on these
devices.

For EL2 boot, describe the IOMMU streams used by the remote processor
firmware in the DeviceTree consumed by Linux. Also disable GPU zap
shader and Iris video codec.

Add an EL2-specific DT overlay and apply it to the SM8750 MTP to
produce sm8750-mtp-el2.dtb alongside the standard DTB.

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

