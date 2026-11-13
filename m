Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548067;
	b=nnv2Z/cVToqJaWBs7M12U5+RdrxsajLNyDC0pdm2yDzrWCDMqBBMoHkMoDjqSbITd4fj
	 Ef2FEMfEX/gtH57CejZkVxmS3I2sBWHCDzcPyrj+pBs2ZD5Ehx6h1aCaav70+Bws+whWN
	 iFlKJ5xSwyScSb1rWZnr4y4rLwFQZ9iD02MIo9L+ybn8Kkot8HlHYbkhesxhp+/cr4+rm
	 LwIA/s0G2kr2BbKsMOloo6nqYELST6FmA8m8ac/yrji3gjJ2wpSmiD+N6myi1Oa0jr/Go
	 rFiwOmDAgjJYJ7D+xRFU/oMYH9SJgptbYDkRr9AYKP4wmeBcMtsqKbt8A7hKs20oT2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=;
	b=iyqfvFNJFFh79+VtALZxLqcMn+lFU19O2h/+qXXcARk1zj1XvwT5M05sMt/iS/B2fVk3
	 f5iMR0AsHP6440SBeosZKpCv1hUU+ZgjRDWTWlClUV9hwN91RXRV/+8bMtWX3EmfMdmy1
	 0pkp+MhWjEOmkqe+S3Qbv9KCXiEtC85NOBFjGGtKEnYdeNR3PGNnFADrsdBJu76P4liQT
	 32cYy6PyBVjAecK9EYGVUptQFnjGMATWiGPNXPg6jJJbbZuU34iXKxAhLHEXvD1t5RldV
	 G9hOaFUdDqAN/pLHq/vva7yq9DaAluhoN+CS3wE+3gAD5a4Fz64PT26aubO8e+yocsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kuqi/G3N";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VkCpS6+g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B469606A89F
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B469606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuqi/G3N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VkCpS6+g
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57TfN074347
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=; b=kuqi/G3Nvv+JxC2i
	TQcv752qreQ5+hjhHq5NAl4upMPDCb4T0eCLk2SI0rN2UKi2yFM3mNe4OcUi7Cv1
	hAyj0/ttaQxurAvaii+8e3VL+0SwR01Ayxw+07inhuV81HFJlS3/5nKgkHxQIHjG
	Y9clAcvk+pl3Q/e2HdUIPtEwpcqwe8nESL2ceuDmHFbhKzO5NdgtEB0UrUN3hhjJ
	I4k4rIP5GbMevVb/YIfiAm/yG0eurQZrYpKEViIiM2JdHXNKRGtZXvWqogc4cb8s
	216v6UHZz2CeKzGnkoJv7gR3wGnjhrZ1BWEVT5x1V1D8ALApbgFV85hiSub4INPj
	bRf1lw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs03mgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:25 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4574f1cac98so927065fac.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548065; x=1795152865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=;
        b=VkCpS6+gzBeLqKdhE5eyx/ObjVQojLMpZ/0uUIWC9VjnPmmhi/MLQMCneZ7SqmaMFu
         F6atVK7nXyQHPLX2lOPHFzwsiSiQxNVePkwxQDZqbs63xpG6d3GJ5vp5i+as7RZMaOu/
         ccFvX1qSXWYCwC12ao+j63XWPZCp3HB4FiHiNzNWqYoQkJHkSSHpMM6e/CgdOrgiVtFy
         Mvz8N/NBDL1qp/0Knm00AdzvzHk+Zh2ShlgkTXsHvu8G0mEMFfhGTMpRA0AkJsZsshRA
         cFHMP8HIqLDwWwVbC4JbxALWM4D+2yv7Qxy8ko3wvm+2i3dmJLMrsWESlNbDCsgZGhGf
         0+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548065; x=1795152865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=;
        b=s26T+G2Az/8gjP7ME2231B0tC/BRJcGkhDSls1VJrvNWc7X+DGUWSSFeOYVIpL04hS
         umarbJrZ2rPsVYXJk5Q8BESUy6lBvY6Jt8sg2s5ynj3HgPOOhtRli2i1EZYd92qFVQ2z
         rQ34/aqf02FOprAYMYvTXCOtiud1/N6Wh+CfV0KJ8yhpkCgd/6sODr4hbS8izMeBW0l8
         qUbCSG8JvTUUQHd9nFM2qjVqEMiGc6I8o5mVWGHxVNt2/fIeKUT0K8sWCT1q6Sl3rZSb
         1Fw39ix2kwn5ZwHJ6z6j0LyqAwQOHeEGneyuFeHfw9E3LtDokfik2kMpG7Xzb9K35myd
         k70A==
X-Forwarded-Encrypted: i=1; AL+hErHDwUzoaNcnRNEqJGPGayiqT1G0lQSsS9LnxK44JwTSnjuZpq9Aa8seMyN9O2s6Y4GTCAQpTIGGHUct@vger.kernel.org
X-Gm-Message-State: APuU4Z8A6jTEL+jHni0w97CcKaghJzrbkexWaiiQ/a2m2TnWic60p22Z
	EmXtvB7G8hHa2v92GKDQxMdQwLieJQDwidk271HHpiF41Ntni+NoDxDwVG21kl/ZOKr+SYuCuD8
	49wJqtmbpBZv1qP3OqQFv9mFcQKtrk0/o6ElXh+Luj+/xo++8RDavhuCdWKahzfSR
X-Gm-Gg: AYBFou3zFcXh1nS/nYaE/bBlidOBpWvRfQk4nhH9c6HbpCCeFeSx9PcdfVeB0rhxNZ9
	hcFDcjq0e+1awKCrlJyhRf+F+Fs3G7E2SnlSAo7wJh9PE6vOTgeWbQzotl5otYr0dKm4zeB0xKb
	AHu3Jt6jL8Mf1mcY/HqgOKS9NGEuweU9EDS5V45RTODB7GE8VbMBsl0ZbaUm4TbPX3yxe3QPQO8
	KMHHdI1c0ixEXBaLwyhxl+3cb7XU3DbWWYNuaes5cqtejkF8rT5psV7Thlw/MWaTN3Of2FELKQi
	UCNlAPfUfTHpzgUrtWqlDjcZ95WMd6l6poRiZiZFLZvgBnQxL29b8CFbxd9ZmWDWjHzO4bnXV67
	u8QATjmNBlx17q1kAqiT9cHqwzso83yEXKRVcPzjRED/p0++761h7ARm5IaEdVMWBco0Ky+Da8F
	YWZwo7JZjeLEblQ98UyO+GyapZTLS9mG6ys1BclVM4H439KMzmfFTFLFuaiHG/
X-Received: by 2002:a05:6871:c914:b0:490:f2cf:2977 with SMTP id 586e51a60fabf-4afdf77c4ffmr1844588fac.45.1794548065121;
        Thu, 12 Nov 2026 21:34:25 -0800 (PST)
X-Received: by 2002:a05:6871:c914:b0:490:f2cf:2977 with SMTP id 586e51a60fabf-4afdf77c4ffmr1844561fac.45.1794548064639;
        Thu, 12 Nov 2026 21:34:24 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:24 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:47 -0800
Subject: [PATCH v25 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
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
Message-Id: <20261112-kaanapali-camss-v25-15-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX4GYsQfDmbB4x
 S+AdbKy8JLplAZ77gTjxRvnYlthi/VLxBEdd8CwmsVHmLvljPaElmd4Umc3jtjBZWNQbCmStI6N
 VSO4S+Xu3nVqN1HcF54otPCJAqZcX65N21+qU/rhBdL+sNHD6g0xlOcFWnGaO+jKJtP3EfVRvIY
 mFO/fs4JJlS1toGyj8cZTrK9DApWmZpZR83EEZTJD+EbvVheuHUcf7GcwwTBfC7z6VayQE/tpTb
 q1AoYLBYzfrMi3+YgVkw4XtKMDsT8NFU+0B3qTAEt9FAbBohpvw/Y28+8Gk0exQW0Kc5DuDiYwk
 3V5RWj69LfNPtosp+YczrsuUKDMn2hD9tIE9fzOAw4yTieUDn9MaNPopR9a2q3eUpEHTVgnK6v5
 46JCHjNZyyJWSiTGDU4WS8FklvszepqyDx+y/ZRvU68AAhaGqUEld9cDiUzCEAWnhmC5FGKODC2
 HMrShVCPK3cN0xef2Vg==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6a161 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=azXR8Rw6a_W_3m1MFLIA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX43eiUIvyW3Ok
 Y7jPEEGK/pHXv5Y25fq7fKK13QHqElcr0znchUrtMYeZJPI0+nhJWqauWyNtEUMB/zpONhHu7V1
 90k+n6XTL9wJx4YjIIbaXWwTtdEa68E=
X-Proofpoint-GUID: 6gTaaJTJWcsaBp7ZJ0x6KcwFZowvVZwC
X-Proofpoint-ORIG-GUID: 6gTaaJTJWcsaBp7ZJ0x6KcwFZowvVZwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  7 ++
 3 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..2e1a4cfa2505 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -57,6 +57,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtbo
+
+kaanapali-mtp-camera-s5kjn5-dtbs	:= kaanapali-mtp.dtb kaanapali-mtp-camera-s5kjn5.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
new file mode 100644
index 000000000000..d0e39855e0e6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_in_port {
+	camss_csiphy2_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy2_out_ep>;
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vdda-supply = <&vreg_l4m_2p2>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+		afvdd-supply = <&vreg_l7m_2p8>;
+
+		port {
+			s5kjn5_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <1248000000>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l3d_0p8>;
+	vdda-1p2-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_port {
+	csiphy2_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn5_out_ep>;
+	};
+};
+
+&csiphy2_out_port {
+	csiphy2_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy2_inep>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..c70cd39bcb75 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1243,6 +1243,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	cam_reset2_default: cam-reset2-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.34.1

