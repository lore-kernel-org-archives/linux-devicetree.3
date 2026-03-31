Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657443A873A
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953471; cv=none; b=K6HxtYnO2KZMTGohkHheLtprjPM9DN3VAy3/IaB5wHlKZXC6ik/I7J7cWon6nNTA/sbvCMkvdxCKHWg+vIEnunfrSzGwO0arIuYFRpVALQLPr1flFnyqtfYAom+J3wK45CvqL/dqG7GtOzSvByHeRzF5DoEmsOYVDtz2rKmZiho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953471; c=relaxed/simple;
	bh=TOz18HuOiYTdbkwiqi47xLNSWbqEz3wgbVv25aPFQ8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eUhZKfdAKyxP+amA9/Lan8JNGlybQRI1ttnYui5ho6FNE8EK1snPHHGOpjosX8vQ+h8aV1ZxNi5PbfVBe6GE8P3zSGYt00WnkwSuQA4fAUiUyQWwJ3r2wZuAf2UbPj2BYPXGvAM4KtmeF6KvDotFTcosW44OH0O5AMXQg7KURDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ejm/OzVR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMZ0BuB4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ejm/OzVR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMZ0BuB4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6xslF2164249
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LgjGn5weUXzpcnzjcYy2HWxw2GmxBOH1LHNFi6gbkHk=; b=Ejm/OzVRTVsXQ8vj
	2b36s3LwZWr7d0kmLclA7K0+t4wZQoB4cZPvdx1qywbBhDH8BNaplsQB/d0zFFR3
	MQtE8j+jH8oQVRyXn8wQd4rpyZgVj3CUXfxoh9KAhCwXpHDSPcgj4YGVUNbHZLIx
	LRHzgwBpQRtcaKahPeX1gttkFKI98j8R+7MxqWDay4wgDVF9W7DYyfPGijNTG1iP
	LPJZSiBWymKnvmShz/Lj5j1ydlntY0EzQcotFX5ufPhyDY1AiWowo6nzrFbjycE+
	0UH/eWlrpBBTMgA6+l2TVPubLoSBP7EyntTg9BSBp9A/QEjpYb+ia+GimBhtcfIi
	kDCYsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga0x7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so285058181cf.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953469; x=1775558269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgjGn5weUXzpcnzjcYy2HWxw2GmxBOH1LHNFi6gbkHk=;
        b=RMZ0BuB48XD8vYFUO1ORSUEo4AJ33qA/0Kizumk8aPEQI+/8scgXLKYir07JFUMKzy
         kg6eqg4gK0bKdFSycOIoXUNzfH4akjonNt61GEKITTVQsHV+Je5h/0FCWDeBc0tCb/LI
         4L/qZZ8HNsEjfduPSBZIHhIJ4Pe4Ls6scj4620eFC88NvfWam4EkWst6FZe4KdycYPBw
         EFOW+hSXqn7EtydDxH/3enKaxRx9OlGwJ3LOSZY+XUjrZf2dz2yjwV6FI1SlOuQ5Useq
         WGpvV+SZPCCKdVSn2zxTeVt3ftq8Zu5Wm6mM9VeSMGtnqnTA3LpjiLxTWQ6eKnfPA11H
         4x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953469; x=1775558269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LgjGn5weUXzpcnzjcYy2HWxw2GmxBOH1LHNFi6gbkHk=;
        b=bXGczwtIrc4AXBTUkin4iQmJh3nDV5nCj7agySVLxbV/y3Dy+kD5ZjDo2I/L2XwCVw
         kPbL7xx1a3iE+8NA+aVr3dKFSL/swAo2kBKCwcyY8CgF59dSdtvtnddgvdJScbhrRH63
         bEerrNRdtbFjE+cY40pNjoTawwsrxS0lJ8+8yrAfBC/UzqIFy8gtshHDOW1xaDCgA348
         zyLN48TrtW2hgUeX4Y+L3CCMItwSyQ7/c+a66Jiibn8ltkFs48PYDvVNQXzefQ34kTGM
         37+g645m+ShvVbTV7JgLPlrEdASp1l0MmLAaGzKDCS6p1MieAlCcBb4KUStwPof0b/f+
         u6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM7PWUYFt5adlt0jvqKViE7bY86iM4KRrIKaQjjDJJtt97qx84vFRPRa/A8hDtpwZQ8MwKgQhKowzn@vger.kernel.org
X-Gm-Message-State: AOJu0YxsV1/Gmr1tf+f/0wghI99BhKpyVfpWdTjHKNHhlBBnSJCTGdzy
	fiOvUQ42PilMOgcginW9ZiwyDlUR4dOu6vNseAtQFepy7p3F5zLZpJbpRO62uM7F+DhA8iyn2Sl
	VQulOJG0bWfFTiUp95liqv7Dhi6Ag6EInR7SuHtC9N2qz6KvkH98u9SWsndOd6+tu
X-Gm-Gg: ATEYQzzaJeoNBtXZrRhe2XX9rAzOut4+4PTi6EE3huDLFkxLDHdOFpX4Tm/hgDsldCn
	4SaW1Bd3fvnBNGN8RRdiV+GRR+DmCwAbzfGoE9DjEcMJ2CpmlSCTEFURRFjhenbT+WKyHjXV4g4
	lU1vq5pm8KvccGAYWvH2WLIyC4pd4m1A42ro9uac1WdOF0nbDy18wCrE33D5RNqIQuYVf96P3Tv
	FopXwlvql9a0dyl4dqldb+hllafMSUcq25Lu4Dznsejlm4WdWPqT6hoHjDc5jvoTWz2Gnt+KcFC
	AGOkkmcz+nDLx1mvdJKghzhdYEUiqkOo7Nfo6rwm4MAYOtbtYOEhd3RXATgDUJnbEKPkrJ+tJP9
	V9CL2LSSqdWZozlztp6MjGNdMZMfU/A==
X-Received: by 2002:a05:622a:4ace:b0:509:4410:4492 with SMTP id d75a77b69052e-50ba3800669mr211126831cf.22.1774953468659;
        Tue, 31 Mar 2026 03:37:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4ace:b0:509:4410:4492 with SMTP id d75a77b69052e-50ba3800669mr211126591cf.22.1774953468041;
        Tue, 31 Mar 2026 03:37:48 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm34178175e9.15.2026.03.31.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:37:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:37:23 +0300
Subject: [PATCH 2/3] arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-eliza-adsp-usb-v1-2-d8a251be20c3@oss.qualcomm.com>
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
In-Reply-To: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2358;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TOz18HuOiYTdbkwiqi47xLNSWbqEz3wgbVv25aPFQ8E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpy6P0xjAPtYH1dEXzcKusHAxJBdYT/eFfTy87L
 ibRzz3VAXSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacuj9AAKCRAbX0TJAJUV
 VghDD/9KoMF7oeLm6amTy1SN6LgNRoRrjDFh15S1tm8eGKqIRsMr0w8ElLJCIW2mRXp5xcGgLuU
 h5hfmyxTj44Po2MCxVsM13aXMScMs5fAsdRihHnMgbw6+3XoIlpE686ct1ynR7JwzWsJscGmy1K
 JJa01yRzv5duww8rmtZX2Czga1OJMpnx4pUbQHdThq1VuVwxvhf7vWios6zZykXz5/bKuv9nEAv
 gdneV0wBtgt+YPyiWiMyZ07aH3q6GtAk45NKYRi9bUuzQyzptxvu9yhIYyyXmXnRmrhnnBVgIFK
 gU9e/x59jiH8N9355dUdxFMGVGn8LzbGJ0Fbi3K9OFk9K8syxSILhiPGnvWpXWTfhUw118y2G1F
 R6mCbqCCCW0YkkJmAHWET8ruD9X1BotPkyDdgusR9LnbFDtJ3sRTFbmVOFLVTXJYfOHOZqBNwRk
 MMU44Ur346B+WXLUgxKjhnpUiEwQG8bB3iyr91l7VdtoZ58k1zmnph0sAjGsIxAWViakj2oyCUb
 2QrzjvajPNBo21/Qo0W8lGzRcHVck+dNNdSNi/Fqo8PfOah28XumlUkvqC+lyrOWIP4pA9q8Q1R
 p8lYhm6ruPVowjTECSZaH8vNN/9YrQ+iBoKxRHhGCbkGfLM91h+kNXrttbnZb/tW1by7NUfyEDm
 OV0It5/MXH3DWPQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cba3fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4U6AihNozsKCruDMU2kA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: q_B4NiyYytaVH6BQdPCr_UxdNVde53v4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMiBTYWx0ZWRfX1EPHm7nz9gUN
 k7ECUeid24c0sr6ZW/SDOJ5RXgGRpHscWkipzqrwWrYKgqiEZ8myBO77RXCj5O51g6EcsxdWeSv
 UlIoCkPlXJvxuKVWaCTIDiRAvpdogp1K80UpzV++2uDIUi2QH1cvHFCMwX8E+kOogV48/QQpB5l
 P91X+fBsJKQY+adM+jx5uOVcsbNEWGKyW7KZrWOr+GD70qzX2iJmARGgj3rrvPYTKLqbCZEbfiG
 5zjCKwda7RdkltXaq0UJGk9U7HMs3JBkJ1U8PgVMf5yQsbhGCwPQk5N8qtPc99tkubGfAeO/DUZ
 ZRCnP6QhojvmbdoMzYUaoVsBuHJfsIRtNZfFSpR3z2IwNE3xMGRKzxY0lviDNyjia1JdGI9WPVs
 EFv1PAr9AMWu0moyKIjAoyvj8NXR3wtrKv7zCq3j+mYeFDGhWuCU+kloVHHV0xohIdj74DD391p
 55W32FhhtulFBTakagA==
X-Proofpoint-ORIG-GUID: q_B4NiyYytaVH6BQdPCr_UxdNVde53v4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310102

On Eliza, the SPMI arbiter supports multiple bus masters, requiring
explicit selection of the master for each PMIC.

The existing PM7750BA dtsi does not provide a way to describe this,
so introduce an Eliza-specific variant with the appropriate bus
configuration.

This duplication is required due to hardware differences in how the
SPMI bus is exposed on this platform.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
new file mode 100644
index 000000000000..2c386f16eca4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm7550ba-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm7550ba_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm7550ba: pmic@7 {
+		compatible = "qcom,pm7550ba", "qcom,spmi-pmic";
+		reg = <7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7550ba_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7550ba_gpios: gpio@8800 {
+			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm7550ba_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm7550ba_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pm7550ba-eusb2-repeater", "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.48.1

