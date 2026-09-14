Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C955486403
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398047; cv=none; b=o8Zc90ezBhNuCRC8hAj72c37tN3FdHbLMQF4YwDDJcw17/wAmYOSm10Dwgx7xRqVBSV0BIcd5HfqjPcskx53ORQSRC/4zPPmjY5pfUJD1oBEaAmXYlJ/rFU+Q6nKYz8uwZLZYFzPdpjZq9fqzUKnLFEgf6nCKfe10Mkkt7Ny60g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398047; c=relaxed/simple;
	bh=qOFvn7wgKOMIlixvdMXPEO8Y8u2ONv9k+Pz20i023QE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+Jk6/5rw9y/EZllqnbHF7Hm68vEybyishhNS/b8q7sMBeeJFZ/XJE9dgfqdGBRQYFNgFzYJlwn1L0y038+/5MCe29KWJTlq//DO9jcDePC962cIxGWv9kkwHvv01/18Rx4ExDCqy0lh3rYaKdyO2HhMcww0YdpUSAdLuhEEN80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOk7EHTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+Aqso1i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOk7EHTb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+Aqso1i"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0YG2830679
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=; b=jOk7EHTbuz8pS8cH
	2Gb+jU3y1nBmkLekUDDyGZ/92x7TIofuECsKyDafT5bYNu0czoCcznXOSW5+1Z/a
	X/h5ePTTxWNH7ljipeU9G5D9PLnYNgZAIBLgJyzYH/L6MiBAzyq98oYxEqG1xMO7
	lmjkiwVkz+jKPjPmXBgm0rzsIlectJST8omgNd26cVJoCb5UXY8gCoASQ1k2Oljd
	rRoE8fCgiF4fAAG7LpaQQc5sXk3cGtoNDOkfHSHPf4rjw925n5Vb8VLtaRUnn7OL
	aAmZ/ZSzhgtmEtx9hKoSpg5SI6kMt7EpbBWRAS5T5AfINeBGcJTPRnXXEOvAkUtU
	TcLQcw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsu07h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:00:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso1141769a91.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398042; x=1790002842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=;
        b=c+Aqso1izP7fwADll/xbRJ7zj/DbkO0b79eYj1x1aYWmsUxjhz746lF2UfO69wb/Qg
         f7D2jDgtvk3XrC8wBOpjt/AmhXuFZmjwHrZC1X+DmU2H8f/o5FeW0nES68kGqrAf7Y03
         3VsvjSojcw0LUtO1+YitweajO5f7w6Lwqokw/ZC0hUcOQcDOuVo3JSF9r090cEXSa6f/
         CegAQ8CysPn18rKcG+45Eze2lLFVcDa50ZN5684Oggkgn2/tYeh9g3rodGtvL0RVndem
         gf739l89TyyoWTzKNghOlV/QVW/VnKDg8bsHotxB/QEE9ZN/L9JxpUiskzn7kcwzNMys
         9MYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398042; x=1790002842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=;
        b=fhB990b6kN0m8KZlKvhKt/gVJMPzQBCPkHlcOP2NsmMWjW9O/Mb2kSodqEn1JliPWq
         V/xoc2GHvcuOuZMaDTji/5FOgoo8bFTqYXmGR1GwoeYvUClWE7xwg9UvwVOHRD1yQt9X
         jkZdB6C6LDsMD72uoessOnPNt+zcdKER+HPJNCQ/eIHEJA1Kej8dHdQbiaKmkN6XMEZa
         fYtVh1oaMyxIw70mHz2msWweb4iXCauLSgJunNRrlyoZk+YDmFhqjnb/HngUM5tFasG8
         V4wFcIb7HHpHsNBDhPAJLfh97L4Uncog8sRJ6ZhKL5nFVV3s9ZONCTWb6JjokzAfrE5F
         veQA==
X-Forwarded-Encrypted: i=1; AKwUvByIq1zMU5mPpAAOD5f6dBSgu11q20zfoq3VkxMcmDklWB4A8mWlsDsWR1qN2GwXW8ldu13EaMLiZ8i6@vger.kernel.org
X-Gm-Message-State: AFuF++n5mlGWh6HT4Dg3xSTKYJ6FP37owX1GJhWXDRcG3tjIh6Db/iMP
	XtdXX2SIn239IoRmktI2JsAbH8nyeRQ6MF5QXL2NAPwyHuyQIq62gPhYuBlz5OwMUHgem2ipw+q
	lM+KKXuuG7/UFYW3PpE24qhzqlvEGvgfj7QxT58m+Wij7zsCHtBEM4McJGZm6MphI
X-Gm-Gg: AYBFou23VYW94JBlXbNRKddANvL95o9juojZtsHLhGA/RuxlYeYd8LKKKj70VftZOyx
	uOZw53UMVWzHDef08RT0El1s1VL4PVCv2H4DLYemgCv+lRM3CG3z/TFoZQz8m3qRVigTNIAS53Z
	27UONWtriMPFxRrgL7BbHYsYPJcH7DLwRGPN3DGTqJgZ2+sNZGj8KtDwxmW3Pws0YfB74zFrwZ0
	srRUJxPxMUQi0MiwE7QoNpx5Ldc0YV7sQ4KGkQ3ZpWwY3SPrKM2nPVJt6nFQqOpyiIAWw1bblID
	+6R0M/czPZbgPjsbfKeg87C6vU+wjSp8DQ3YdyG+D9dmAsEfkfcGQbwvbZ/tAUxM9i1QSlDEZhM
	ylF3Gwc/680SDJ3JLNJ+2ms5JoIVBBMiksHUk
X-Received: by 2002:a17:902:c40d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd6c6fc4f3mr55282175ad.17.1789398040494;
        Mon, 14 Sep 2026 08:00:40 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd6c6fc4f3mr55278505ad.17.1789398038902;
        Mon, 14 Sep 2026 08:00:38 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:37 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:11 +0530
Subject: [PATCH v25 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-7-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=qOFvn7wgKOMIlixvdMXPEO8Y8u2ONv9k+Pz20i023QE=;
 b=txsEWykMpTLSUOW6FXQVTJLBQQ1Nc4sqO3I+bYIXwGfuhPQ6gT4S9k1E4GUbqfnAs8R/0URP4
 /HrN6czalP9ApLSw6uR4PpjIRu9AyPfqqX0KmqYStyBUvqXmpeSjBoz
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX07Kqe9HfcP3Z
 dglLjlKCWqx7ZLPjVVgV+jav0XazcFrCvJdLPy3evW/LK9UtzIGM+HU829vFj6oWy1JbjqXt//M
 UPicxo4suxHG0U1mn6ouUzsJVVv4+4fpFqFdaMaxSURo2/5Ek9exKAEIHU5Brvi0N152tfRT/6Z
 NthaKYBuH0D//B8W9UaFCealY3EGv7Veb+3wefkml8hMTmUYKiXXEa4CcZQIAn71B3NbsKZN/2y
 hxPv+4pb/frrZNxPloXzdXo8Pm4wbxF1HpjUjeKNHEQ2l8UmZRxwGpZm/pYAi5im99KWIwBAX/J
 1VD9Fq+D8Z4s1wJN3hWdPHjXiwqT7Pz+4nw23RqY15hfO4tiODZXccBaQwmPBJHOvE21vw6fYRD
 D5llu7Pflyiob7BJCL47T/s8fU13C+Ylqia+/8WOmRXFXatu1zbwfmhgqt+cxxYC3/3rgTewL71
 kdqQFkNNf3XmyzgEf+g==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa80c1a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 8KWpBA47TpyPrcApWxbDrQduOkbCGGCH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX/LBbzpLw/jke
 GwMPUYCP3dJ0l2qC1x7MHGq5+SC2EBLOpDDKszB/vPqzNesK4Wnpl+40jaSPxWLp9Fm00tshpjI
 zycrP/BqHQ5d3NjGh8dZN2UBLZWMzfc=
X-Proofpoint-ORIG-GUID: 8KWpBA47TpyPrcApWxbDrQduOkbCGGCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..307fc45af37a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -867,7 +867,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 58cce89a0c1c..c9c1b0c48550 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 3bb5fca8e2b1..a107abee10c3 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1097,6 +1097,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1

