Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580388;
	b=ygIJXLrejwzqKzEvT7qWkHyUT/6VfSdCk8lpkpt+E0rQHL4mPaekAqag1Nngd9o1NNS0
	 Wm9S2SErqY1ls55hn94YguRfZTuCL6LmzVS7C/a1aFduqgfR0j+Gkk5Ad73uJPXpulL9a
	 JQupZHk9+Wf6AiWogXY8QSm5UVfvH+601HcEHy73RQlxAeZO9rjuuiMMESw5mrQygckIM
	 sKp/XjWYimJZd8ZqFinT11ne0wivUeUFUAfpgypOZzic0kMLIP1OfE9H+9sxkmssAKPq1
	 JQCFr4hi08yj6p1wQO4irrzPGJGE/zexwzVcblDbI6hdQcQlOAdtgjwoMRbelf0asnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580388;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yTKlyMWylFwCg8NzrI0soGaWAGOcjqJY/0Bz4BhAJbA=;
	b=HcioSmkTszsl9mORTMjNNDVTGv8sxkY1CVBoTRMyIuObCkjc/pQO6NdSXaMOvPuxG9NX
	 4Sqy48cJ6OWE7J+W7MyrZlRSHHhkCXCpW453Be8gkrGzVPLxbH4YL48RMm51pPpuIJ7TW
	 hxFCKP4gzRsUTf5LH2XPnds4H+YHaw5JRr0dAuGYOIwnJsJ6CupA+W0wVzSw1rjqFss3A
	 pfld8DPEVPgVrgizHmTgViGvMEK5ipvGcNYDXC7VUV+9xtvN50fVJWR29p27nxylfUv1g
	 m8BcaAS48hQ+mEGwNQnjHOmDmJLkOmOHO8yuFhr1aUQmlwyLTlCaqrkMrno7xPp2XZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o48W0E7Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jFBb6gJ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C417660A2616
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C417660A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o48W0E7Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jFBb6gJ6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJr2m516669
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yTKlyMWylFwCg8NzrI0soGaWAGOcjqJY/0Bz4BhAJbA=; b=o48W0E7Z0qD9H/nD
	AyqvMrFhUfuC9qMTf3aMFc8GmR00GOoT3TZ/xaMG8GxcUHAmQryPyehOk0jp/V+A
	EDTlIaaAvSEI7Cuc3NKeLrs4XBQtUOThOA5fzxFg/9LSgwP2d42MjiTOyZcIdhPw
	tzVBwm1fg+YPXSvexR5bKpEI/KzeJW790ospJjGXx1iESxiEypmIBzsTzu5aqKVg
	z48G856el+PmC/f6MHnV0fcZHihZ38L+KV/IGqu9yJzCZx9uTxtZB9h/1+Fj0VSr
	Fe5Hj8o54S22jupMb7Mjf72f+9eQcSlZYbMpcxt0xHbs7AEnzLh5sRVnNDFGfgFg
	r3EGnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdkjhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:33:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495876f8beso66554285a.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580386; x=1795185186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTKlyMWylFwCg8NzrI0soGaWAGOcjqJY/0Bz4BhAJbA=;
        b=jFBb6gJ6GmPzQF8J2JOo+bAO3SJ/vozQ8NKj8t4HZrBcOIyJpBlHTc/2geP6pQYXHs
         Wbv3MG4P/7PFjv9IaRN/8F+2gIqySvQzLFjGAEFPs61TTlEfyoyrVHn2a3wNZw1K254W
         aADnd79oBCWhNUeaEKAsBakGUV5x2lYFZx5s5mIanKmA4J0SKadtZvEpS2rCOEm+eY0D
         CTTYFXdreZyF6YNlFU8D+AD/GYL4ueJhZEIvE677hKWZK7v3mPXvxp8+SxA6U1qWZJcB
         Cz8QFWo3k8r+VBzqBA+8yTe+98fvizsunZBXfOVjSCvCcAeJmAAvU8KJpz+6EjZwGPAL
         JhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580386; x=1795185186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTKlyMWylFwCg8NzrI0soGaWAGOcjqJY/0Bz4BhAJbA=;
        b=irWb6j+xAyBuX27UkiKdWYSaiXyau5ambqUydKqfIpJJZH+ydmG2v8SOrQE8jvnI0x
         Nn0nCJxAK3v3z4YppnHefhHwiaHxuYDUhdilssEg8TSv+GsP5+acMEV0vVq4PfQUjuMP
         KnFv2kcKtZHzmbchsfitqtGFHGk9teUJFoyq3XTn8xwVEkIPW4OKrAXl3A2CCDvqnKRv
         jlGLgiV9pzhgaqsVyVnb9YAfa+OlVW3ibkT6NwicUOddLQDLTYzDAEkaclT+S5D1PCxZ
         RWMqWmk39s+/gOuIBiNk9GALZ1uzu3vB58MwFaXGfpbpai1XAryOVZAoE1kyxYWPRft3
         yofA==
X-Forwarded-Encrypted: i=1; AL+hErFO/g7r9+L8A9+5qL+bZGBA9Jenow2q+oYetSdwiAgPEqrRb6DcT+l+mO7YEIYS9UUHOzgRA8hNdk4X@vger.kernel.org
X-Gm-Message-State: APuU4Z8uJVfj1gU8YTdT0VYWWgTkX1M6BLraP6M5PKRGkGNKPdHWd4Zd
	onHPssfLXcX3r5dbF3CoNG+seCYF1GxHjdQbXrTTnjPf+SY3aHbW/uZzy7/l5r+vkRNlfLc9ShB
	FcRw01BM4UEQGl4+syQSbZDuLlrh8WWH0+nieifI3S8ff5foa3EDlc0KJIL/Ab2ZI
X-Gm-Gg: AYBFou0Eiw57uFP1a1qeCRrWGz9cykdWa32rkewh96Yw1a3lzbui55mgFBaJBmLx0/z
	wMfcmkA+96+FZnr3akE42Xovpp+YxT/ntzmMbN6LQOH0GAW+ckkIJ9p/aIJfscPM3Guva7i+ZmT
	b97HxjOhpkC1LHv6evDmUT0QKIskAMxMOkWUwSshnJKI6kSYjJODgXOtgsjAUUjyRi+Mqg4swg8
	gi5iYKsqsOb8Ex9wdFhiULO6O4qXeiGYTF0W7RhzOTKECbEx92ZDqkHw6w9+JC6NvS+ic8nGW2I
	XOWUVtj9rDjYEQ9Ufz4fClDm1MJmjRRtU3WG07K9pY9HWPNejBtI2KnuGTRB3wHSA1jONBWUEg5
	UjWn8NyV9kOLaOub9JZTXqlitnFupctRqqoYPc0xuF2vBAYhrPoASp9m+ivzg5pA=
X-Received: by 2002:a05:620a:2890:b0:93b:c537:fdb8 with SMTP id af79cd13be357-9494ba4b5ccmr426956585a.6.1794580386083;
        Fri, 13 Nov 2026 06:33:06 -0800 (PST)
X-Received: by 2002:a05:620a:2890:b0:93b:c537:fdb8 with SMTP id af79cd13be357-9494ba4b5ccmr426948085a.6.1794580385496;
        Fri, 13 Nov 2026 06:33:05 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm71948685a.6.2026.11.13.06.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:33:05 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:02:22 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: shikra: Add EL2 overlay for
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
Message-Id: <20261113-shikra-el2-v5-3-8aca743de97f@oss.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
In-Reply-To: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794580360; l=2957;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=k6LpGnNLjekW/Qz72cxW7OhecKaAEstguRMDpJQxZrQ=;
 b=5lp31v9yeEnk6wZLN1sjWg+elBrW+g0a5jKx/MvBkHhjhs9FHuACgeQtrZUAEuwYfm5wsYPmE
 uUAwwwFxntGDtPPsa5lQc2PuRYT280Lqm5S08IVYuIwVVbp045gL5du
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX7mWmIRj/GsV6
 oF4PNF/qT8Fa2h3jUNLkB+Zca9DPwgBlGNyNDLStvkjmPkVYBYcDc0GlQgq5UIVJtLeu+aMiEqo
 rJ+H2lBNBA+hE5YNcXZ3qiFaENijiuc=
X-Proofpoint-ORIG-GUID: WlMZlhOD8dD0SwWBuGLtNxm9HuefYzrO
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af71fa3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ieEIU8YVhEgz5sbSP_EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX1fh3INzpEYWB
 P6L1Pz/UVCygi6AkRUiZx3YD/F6l93qGuoc6QdvI5OpmE/zeMmcPO07C2+2puFof7pJkYUVrf/d
 Xv+DDv2Gw/MCooT6cPcatIgUeJBl4xPLKq7GPPy/kYpKdS/EC4nS3HKAKCQqqSamP/EpMyiooeW
 oQ0ctZrPU22GaS3hnCqKbto0TSUiSJ/+rGnkI1cy3sqG8uLmABqsQeFIYFRyxIPM20wobAP58+k
 1naLuQyHDuByPPocwJ1Wctl2APIOOgA0btIPpkx8sIfnvdb2zyYYl7Ycq10xvKKbifuQ9X40Y3Z
 bWVZv/xHuKBMh1rotPdQVTJhF+TxSKaR63qK2IvpUxpgl21/P8HOBSHquBvH7K2UjqTIKQETkdp
 5sQakrhFiehjAhfESFhHnphT4SADmcd6Ld03FS+m60oeRTXMqrzojQDIxyIi3TfBb6tggCCdVT0
 jnLrGcdUufMarZtxbEw==
X-Proofpoint-GUID: WlMZlhOD8dD0SwWBuGLtNxm9HuefYzrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130057

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
index 8329c06b60a3..77097f440d00 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -404,9 +404,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
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

