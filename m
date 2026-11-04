Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801046;
	b=BypiZR6rHQzdylcvdOx0vPkPStmJeHOGLdfXisLE6+FvY0EcaHR6UyP6SXeNCmDlt8cI
	 XmuDZba7/61JeXKTXLlJsp82c/UKczREeOWMOPX41Hxd+4U4qyCrr/cOLH7XzCZee4Fal
	 wRcVqxq/yn1Ow6SU00TxG8KfrwJGa/N0bXsKg2P9Ua+MtzK8Yzpka2tmy4qCDSGalR5L4
	 zbz7Rx2USTXg9xhN7qr/0GafjjriIH1jzvs4Na8AJ2K0W0tHED0ivfVAh3BW5t1+RVoXR
	 vp7uBuRNGR4qpDlT7Cy6OteDMfLUroIINnQIQWDJ9+hbPNA3BRMo3OruqdsBrn39bGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n7bjoyrxZoYtQrZTxc8zsqxKbrtUXzCZG9Tyxf4ymGE=;
	b=ACFK+fTcOSz2PjjAMO8kerwfWU820d0Jr2XWUUiTl4QR19PRuTrRKBV8s8fD02B16P0Z
	 sntTByDM6eU+zmr3+oAxKkBToCKMqIFmpqkhq0csrx9/gG4EKlNbvc9msaemBHeAz0jlR
	 pz0Mh3vT+mNBLfWUSug5rDrJA1glFKpMmcRi/SBGZWRGSAwA4baoeIgrgoJcdpJ2gbBuT
	 6kXGS8FMdsQDwtzvQwrLIUkKF+st+ioPbzHC2lda0vzGwGwmSSo443bxsFP6Z/8Ama/Js
	 LI8rB+xkJ8N9Yg8A/mNtpuI6aE+ZR0J5FW4bMNLHa17qeasTgc8jdTYaIqCBe6Vy8ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fJDnJMKw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CyEzTuMG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3919E606A32F
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3919E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fJDnJMKw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CyEzTuMG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4C1R7E1764260
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7bjoyrxZoYtQrZTxc8zsqxKbrtUXzCZG9Tyxf4ymGE=; b=fJDnJMKwHqs7JmwK
	gv6Qc0q3t+WowQeXu1/FEXltFj00DY3/nS7CwajYbCyNotHw8V4kjjXIC9UQAbA4
	APZZM1ASPA7jIzd7DqCa9UHRMa1a4IUkTCjLOB6ZlMaMV3UHtwHvfgMLYK+vX7IY
	CXSNLydtMCy0mz27fzkUMS7ZFm70bIhmOb/2zffTh7xS4mtqofQgUlfV5nOMDgXE
	xIM7Eirrn5s/KaTedvDm3Wa2j7PJ3sSo3yI6lJOaw5WNr6Qps1JLHoOn1RayFxpN
	5Zn9on48tCiTbgVfXm0HV9k42svPKjg0Soz6yjgGMY5qrQIYZDImlSDt4uLUGvjp
	5CPg8w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn0f2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:04:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so1376991c88.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801044; x=1794405844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7bjoyrxZoYtQrZTxc8zsqxKbrtUXzCZG9Tyxf4ymGE=;
        b=CyEzTuMG5QIEQJ7CrMTk26qQF8A/wBuJCAXWeO1u8IqXkjO4u20lqZBGcYfed6CiNo
         bcY95YUCZpCoO7oRJDXy7GHpZUk5uK4oc1l3wCHEfo+QCr+NHYJTDn7Jj8NxClFazjeN
         Gn9p9X0mCcwxwFRmlPL4IaKLnD4vVJIp4gyF2yx3g3NRgyrsfFmrr/O99wu22uiKzNQa
         rKjZAAFLcQODP96O0fxjrpy2V2ZHaScooMHd4JgxQOT7vu+YBcvV182ZPaBS70F6wHlo
         s054dXn2ooOjCOzFc6tCTV+x/uxgp8RjW4+Yd+7cHA4kZvqnQmp1Te+3Di3hTh1VTnkW
         FVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801044; x=1794405844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7bjoyrxZoYtQrZTxc8zsqxKbrtUXzCZG9Tyxf4ymGE=;
        b=bY1teLcbpsvNUqbpTuhEhr9fkBxLeX3DSMZmUpKJ+gnSBSlpaHh4JzDFAEvZjRhQd9
         PXdXTpWag9LIYSe1j8Jwr4bmxqE3MroojfK4rXVUpzjdR5A4yaU2/3ig5iJw/k6//aRZ
         lelrfnMQzffvAhcukLcby465AOEwDHPL++skM4IZDoysx2xpoIrn+ApPzZeyAOmbo+Wy
         pimlWyfC09tCL+TmMI9VVFkm5G3C/OCawUkkm03sCM2sYVHM4YlB00N5Mo4azzfgKOqA
         N6h/5KwgIZY7wP5JJsGCfwOPIqyDJOiWNHTUWvgx0Mf2C6tkwAZwap+wIRZ5YdTeMNPf
         n2Tw==
X-Forwarded-Encrypted: i=1; AKwUvBzgZ/B4Ctfg0PbKe29EjP2iYSzPZlWMBML4Q/xuyLL+zMTMbN3h0NOesemRBQoqr/BnW8gZW+bQqF4j@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZTRkK2s/pEL4+LBdcJ7/2pZl0dlLe825zDOhoElESmciA2FFP
	WQZC5byzfq0aQ0JZgF2mzCJl/jHQ9CzgfuF+W4Jq8gbQxVBxVF4rU2iMf6VbrrRKUL+cuhHStjr
	a9NTLIJwJuFndALRFe0VEXW9SIatCuQs8s+lyHx/Jeg31zJuikLYUn1n7xuFUweqz
X-Gm-Gg: AYBFou1IQ4Dp3EJsFNExI+SE9GPhzP/51MiX8PLzuev/7QuNJQDFenZnAV0Z/qYI/5s
	D8bnp77poqwV4cE5sh0EujbTkMvK6whYYOLCM00jrXSZnx9T1v1hoC5ceEVLyxqV+R0eiQ2zG7s
	5atpGsCwOFIz7kHIg1KBeX3mbrfHcWq96mVzeqF2d8Vi28B5bMsK7suNY+wPyqrjezCO+piGFnp
	o7bTA5j9GiT8VBJnTcudcHGQdtmvC4Wbv7SoDpUlQm4p5vawawgJ2V3rsSdx1CAHohpx9BIVZin
	AW+ddMhkqsi5FT8elLg/Xohxiu6MxP0bcOECb8JpPwnTrWc2HjEG7K0leCIFKAcLOdFDBWG1JEX
	PAih1yMI96vr5Pmj986u414Dj4c8Zs5OH9cMM/9cYB32eHgJ3DQip0Wh8cG3ujUzK
X-Received: by 2002:a05:7022:7f0f:b0:1a7:d426:6dd2 with SMTP id a92af1059eb24-1ac5e31fb9dmr22418034c88.26.1793801043543;
        Wed, 04 Nov 2026 06:04:03 -0800 (PST)
X-Received: by 2002:a05:7022:7f0f:b0:1a7:d426:6dd2 with SMTP id a92af1059eb24-1ac5e31fb9dmr22417986c88.26.1793801042475;
        Wed, 04 Nov 2026 06:04:02 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm10195570c88.15.2026.11.04.06.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:03:59 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 19:33:32 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra: Add EL2 overlay for
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
Message-Id: <20261104-shikra-el2-v4-3-97e7019debff@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
In-Reply-To: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801016; l=2957;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=V+g7leQcmnlIV8Qt5zWXgn65YJDFlC3n3CeEUkL0o78=;
 b=M3F0GbXbdYaQHG9r5s3wKbedbhn4mEcw04cjPDtL9RiuhDdgQnilvbi/fCiJIfsd0NwLzsyZe
 0zxmfYkYXIvCxwYJvc9mKb/va0ISvZYS8NJlKacvJ9/8LO1SeBI9ACn
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX4T0Oc0f9KFZN
 R1QloSqpQeosof2SfBgA38BqK7yutZId01/FKOF3i/vU+DcBelMSONEIah726L+F7AEiDS3cO3v
 Au72eYfKDwnfGTFr/v8xZE26iQjFjjX1HnAmDiD2/8s2vfcbUX8TDpRVvx2DP+17SORYlEy3oMC
 FaDU5YVZ0cS6Y2Xx7TGTViMMNt0NYCW2o6f6YtFplocklv6t8A6KBtZOCEvbGPYe167kCYiLXtb
 WkAhekC/yuqnKmplYW3+ima/Cew5IX5jBBVwTgRXUjHOnvxXiP2gvRdTwQG86WbqeaUY32439XR
 nzfhv/XVQ+aWRwKROhqIlIw3NHkiVMThCWYYp96Zf+8q9qoc2Yb9L3yEeIIOg1HfmQVpYLALFBh
 mwhwlv10vQhncJmB0P636pH1muKrY4ZLUlLyRm0RAAWvAFsSIBxh5eGFPRGpX77OuEm7tggv9kO
 /no0OkLHBqlFkrpDyOw==
X-Proofpoint-GUID: wXmf6biwVyFV9UAOXh0d8chgdS27GjcJ
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb3b54 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ieEIU8YVhEgz5sbSP_EA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX/zNg/qVGK10K
 +pUTGh6YACqFsWxT79eOQMPpSIjO/HD1TehQbC3rjSK4TCFfaey1yzXM9Sz2wsskvZX54KpwqEa
 c47qr6QANyFweTuEavRyYrVd/SFfw+o=
X-Proofpoint-ORIG-GUID: wXmf6biwVyFV9UAOXh0d8chgdS27GjcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

Shikra boards currently boot Linux under a hypervisor, where the
remote processor firmware IOMMU streams are managed by the hypervisor.
When booting Linux directly at EL2 without the hypervisor, the IOMMU
is instead managed by the consumer of this DeviceTree, so the firmware
streams for each remote processor need to be described explicitly.

Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
devices to produce an -el2.dtb alongside the "normal" dtb.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 29 +++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..296c53b82687 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -373,9 +373,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+
+shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+
+shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
+shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
+
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
new file mode 100644
index 000000000000..a0f7c4a635ad
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shikra specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0200 0x0>;
+};
+
+&remoteproc_lpaicp {
+	iommus = <&apps_smmu 0x0360 0x0005>,
+		 <&apps_smmu 0x0366 0x0000>,
+		 <&apps_smmu 0x00e7 0x0000>;
+};
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x01a2 0x0001>;
+	};
+};

-- 
2.34.1

