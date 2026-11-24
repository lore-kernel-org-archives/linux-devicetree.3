Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517732;
	b=aS0FTUhMuWVkz6w//3gOft4cdfi5od/kYHEez3vDbjRpv3TLrQO/q3nFJI8QS7btZi87
	 MkBo+tbqOKeRnyTM+aJDApvbUUnMDRTG9Hr5mJmrXyUehA9DHCsc8RiY7lWITp2dK6EsT
	 iSk2RZkzOD87L9LSFSi4ttWIIlzrBHip4c8C/c9ZglIWZVO0+DYEX7PuVMAf58jN75oei
	 PXCszQkmgzLKo1Snln2XZZXDx0dcZfYksddxuu96OTfThcryjEFG3QQvToOav7dexTWlw
	 cBDuX3ZjUV373txTmAE0vUzewNJI/gtG09aF2ufhzNld9j8OZBnj0ESHydqevIaQCjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cvke0Nx2wDsEYA124V9fR+bTS0NLT5W0ngIDUzB8Mh8=;
	b=ZQKWX+cCBRay7XiBUViSR6YfxCIG0Sr5flhP8JJY+RCyRIltTzdCfMdoAQXsulkwcQ2o
	 IeUihEX7oivzmwAZiSyTI9mk4WDlJr2rODcON9nfICp1D0AIV54Op3uJO8r8cgNjXjd35
	 U/Odw2PhpGEw/XF8mFbt2b6lzfherP+5PkTKWLY9qoPKqvzKXSVH8+ADBEMBibPYk1gP2
	 tZrfQtVc6lXZSV+ShMsj7SXPcVeDXdT1vOz5A/kHyGdbj0x8/vChe4647FFhBlWGaM38n
	 EF2WqVt8Yoj56DCejrkvanTuEUD7/MnMBV5MQoWE12M5960w6IV8zM9s/Mxq1gzhUIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b96np+J/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drbTLfTX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96830606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96830606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b96np+J/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drbTLfTX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8bY3r4129097
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cvke0Nx2wDs
	EYA124V9fR+bTS0NLT5W0ngIDUzB8Mh8=; b=b96np+J/hIkN2VAqNmgD0bAV7Pk
	difEOO1seNJ0bHPPCITYL/G21y4zD2rn1YyJzno4GtHVA9y02V9JqSULKJ79Utw1
	tTJoDF0nBiVsDpeahHD9rMAy9EzOQmy5X5azuate3Bu2p7mNuxjdeC2yOsTMZPuS
	er4IuCwctWmS4ggBTyWC6AdyrzviYdbd7oQc8WyitxJV1TevEJWEIZFyd3zmHz/m
	2nLwIVuKqrtjRuijAdIwfzM2gQMvDz4TXVc4q0sTqLtd0kTBNYXiCk9ZmPaty/tZ
	a0Daqpv5TYfAPMxskr4oMj7rOgbxtvHlsG/pEy22qyQ50SX0uoF1fYL4gwg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2am7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:30 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b63b9665so3371280c88.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517730; x=1796122530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvke0Nx2wDsEYA124V9fR+bTS0NLT5W0ngIDUzB8Mh8=;
        b=drbTLfTXRJghJ59t3Vj9JcFlFiM8IvOe5awRNOA8ttSWuuMbcfhJWvVxsEOx64LpTI
         wjaK8B5qfOoyTiJloTalnY2Lq3E5p+OGkfHxqlD3jyVupxJJ9JLa/1h1hhaOuBB0QS40
         DnmJ7LAEG8IiBrYQGTcnwCVUcnVst7KzdFx6T6ZVj4p5hfiG6DzRKhigQ2mZ/j0Cu4m3
         WvipvBIv6bdX+FWVz1GNrCJv1bhi81j5VCbd8wAgEn++T9Q4KxVF6jIdK+zrTF+2fMfe
         INR7iZDfNfGzLdkemsBa85jVaG9d0Zx1VgAaIlp4Q0PmFlyME5oHpyR9wzEYDc7f+DkW
         IGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517730; x=1796122530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cvke0Nx2wDsEYA124V9fR+bTS0NLT5W0ngIDUzB8Mh8=;
        b=wtAlbA1+dELnNzXiTX4LOh43gobgiJqdSShHnQuUDY3Jf+09RfM8AJShYhVNjBeCEU
         bNLlMSHGEp1ro6YaHAqAvIe+lhNiWSBbOWZHDVaXZWKgGnhyxWqAVjxz1zL8MQlJpHVX
         i5vX+hpg1FsJkIeTGuW8r2D345S4VMtnGfSXux+1bf8rDiEb5kHLOVCsoxtve8RsP73L
         i/+tDnqUNZZE0WtSWLw+d00INsLoES9Q7n7GtVoLHdyLL43mdXUkJWjl7RpDcQC08LrV
         e/nfm2ZQoRnDfhsyxS3Zwtw0mD+fuwuP+9L+DVixOcofbUcgSzMgLyt7ShXqxA9HmtBi
         bGXQ==
X-Forwarded-Encrypted: i=1; AL+hErHWgLmwdjpp81/1aHSwozEg1KynWmgS5RV7RLlS3pnJ2IAcKjagB0dv7b0j7BWOFoe1bQtfO5tKsMBP@vger.kernel.org
X-Gm-Message-State: APuU4Z+oaJSW4aeCfBX/44WItfCyeLoR+WjbaHPuYKYYu5T0pbmTJxhQ
	Rd0zkI60pxvzt4HhVhxGMUw+/0iJ3lFBC4WfDUup1xnWIqjunW97XCkDWTMJXqR4ZAwOkhmQbqJ
	C35skyU16vHHyY8Z92yKuHxYkWZjEbHGieVZFJPiw4fPaTjmxuUqktAvCrMg9gXOtBcyhZx3F
X-Gm-Gg: AZFdTZeMj6OIMhl3OH7elf0vOM86BUSz1ZrzCbGba62c10vdi+oN6mc/L0hsdQ3hHSJ
	BVhSGHOScOScE0++Ei6OTbzYZgYcXDfTXZ6dngFJvH5UvAlZIxE7o/pEnOLGg3BrSjIHGtlHmQO
	AtWTzPud5B5zqEoWUY28xOxxB2cq8zC7/M/35tZ2RjRTs7YyNdMhENThCY95WGfACdxcJUO7LHR
	/dW40bpDcxsaqHgzzH4L2to68lCGDAfWe8D/o8R6pPHgsXHh0ZP+hyo/90ki2HbCRjyt3H5fxqz
	RTmKvHXO4mg1u+BN0SZTluXNNLfGWECSPX0Pgwgxp3LOdQEAa8CZG1+YbmDlwlkOoolJ+n+4n7Z
	30+p8vuY45DtMTcN/gM9XnJAbxw+9GwDGv+Zx6hLcd17W2QjQS4s1apsdU4fYJfBShvn4IHRKfL
	tjCEI/QfmRDVbc3y/QdUSGGyxFclMLENdFApOIHB/txgnrOK2npsKHApuj
X-Received: by 2002:a05:7022:1101:b0:1b3:755a:ec49 with SMTP id a92af1059eb24-1b55694533dmr12493246c88.40.1795517729018;
        Tue, 24 Nov 2026 02:55:29 -0800 (PST)
X-Received: by 2002:a05:7022:1101:b0:1b3:755a:ec49 with SMTP id a92af1059eb24-1b55694533dmr12493209c88.40.1795517727965;
        Tue, 24 Nov 2026 02:55:27 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm22616418c88.4.2026.11.24.02.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:55:27 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: Introduce Seca SoC
Date: Tue, 24 Nov 2026 16:25:10 +0530
Message-ID: <d92391a0b2ec19bd4d8ec0c4eb988cb0c8176b28.1795517711.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXziz9viNcnZPK
 f4agdKSZYGOVQKc+kLIdc6M8HPeC8/Ib7C7NTtaIhhHbH+gA2oBU9k9cgffcda0cQcOVsp6vuc+
 Klz/mQOHP6weMC+gNk0OEUzMJ/KzPK0=
X-Proofpoint-GUID: ks418QOykLkvD_6aOAT5XnT6ydKl2k8-
X-Proofpoint-ORIG-GUID: ks418QOykLkvD_6aOAT5XnT6ydKl2k8-
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b056d22 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1A3vuMFaVDmsclaFgTcA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX4qOhO8kVYUhm
 E6TpPvcE5M+j9qypgUGKgDw7zOvqcZXcVz9AT71EgUgGJP56BYwlAsrwKrF9UmD6Z28GUCcwZi2
 vCrM8zR18kfmNfT84txEt64r9xawVoQRZ1GIgBoBsGzfUSirT83xuZQA3sxPvRWCPmNd5/BidhI
 hmQUopzL7P3ihi95/cd1BbVz0wSQsT7MiNsWJHHpr2GlOG0vfeR/AHTHy5ggABTpvTNoNg1V78u
 TJShk5FI4qCPntyAOqP1PxdL5DjNEViNOaxKvEut4+gFZDckFmIQhJ9FJXujzScHoerdIKZEzdl
 5qPwmorafYTQqJebE5Gv2bdKppFsx4C4Tu+HhD5GSKhKaSbxsH85UM0wj5D+4pTHZRqqJLVQhTF
 67xQnwP/I1Cqlg53T3HJj+3WGB8MbaS+uyHbRH0F4XphzMwtxw5aYMAJuzWkcORj7zbzdYCDSvC
 SWzewXZjPIO+yH0WAGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add base device tree include (seca.dtsi) for the Qualcomm Seca
automotive SoC describing the core hardware components:

 - 12 Oryon (qcom,oryon-1-5) cores in two clusters, with PSCI-based
   power management and CPU/cluster idle states
 - ARM GICv3 interrupt controller with ITS, and PDC
 - TLMM GPIO/pinctrl controller
 - 6 TSENS thermal sensors with thermal zones
 - 3 APPS SMMU-500 instances and a PCIe SMMUv3
 - 4 QUPv3 GENI SE QUP blocks
 - IPCC and CPUCP mailboxes
 - PDP SCMI channel and mailbox for CPU performance scaling
 - UFS host controller
 - Watchdog, TRNG and TCSR mutex
 - Reserved memory, SMEM, CMD-DB and firmware SCM
 - PSCI, PMU and architected timers

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/seca.dtsi | 3339 ++++++++++++++++++++++++++++
 1 file changed, 3339 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/seca.dtsi

diff --git a/arch/arm64/boot/dts/qcom/seca.dtsi b/arch/arm64/boot/dts/qcom/seca.dtsi
new file mode 100644
index 000000000000..ae557be27e98
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/seca.dtsi
@@ -0,0 +1,3339 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd0>, <&cpu_perf 0>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd1>, <&cpu_perf 0>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd2>, <&cpu_perf 0>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd3>, <&cpu_perf 0>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x400>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd4>, <&cpu_perf 0>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x500>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd5>, <&cpu_perf 0>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu6: cpu@10000 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x10000>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd6>, <&cpu_perf 1>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
+
+			l2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+			};
+		};
+
+		cpu7: cpu@10100 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x10100>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd7>, <&cpu_perf 1>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
+		};
+
+		cpu8: cpu@10200 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x10200>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd8>, <&cpu_perf 1>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
+		};
+
+		cpu9: cpu@10300 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x10300>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd9>, <&cpu_perf 1>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
+		};
+
+		cpu10: cpu@10400 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x10400>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd10>, <&cpu_perf 1>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
+		};
+
+		cpu11: cpu@10500 {
+			device_type = "cpu";
+			compatible = "qcom,oryon-1-5";
+			reg = <0x0 0x10500>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd11>, <&cpu_perf 1>;
+			power-domain-names = "psci", "perf";
+			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+
+				core5 {
+					cpu = <&cpu5>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu6>;
+				};
+
+				core1 {
+					cpu = <&cpu7>;
+				};
+
+				core2 {
+					cpu = <&cpu8>;
+				};
+
+				core3 {
+					cpu = <&cpu9>;
+				};
+
+				core4 {
+					cpu = <&cpu10>;
+				};
+
+				core5 {
+					cpu = <&cpu11>;
+				};
+			};
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cluster_c4: cluster-c4 {
+				compatible = "arm,idle-state";
+				idle-state-name = "retention";
+				entry-latency-us = <93>;
+				exit-latency-us = <129>;
+				min-residency-us = <560>;
+				arm,psci-suspend-param = <0x00000003>;
+			};
+		};
+
+		domain-idle-states {
+			cluster_cl5: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x01000053>;
+				entry-latency-us = <2150>;
+				exit-latency-us = <1983>;
+				min-residency-us = <9144>;
+			};
+
+			domain_ss3: domain-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x0200c353>;
+				entry-latency-us = <2800>;
+				exit-latency-us = <4400>;
+				min-residency-us = <10150>;
+			};
+		};
+	};
+
+	firmware: firmware {
+		scm {
+			compatible = "qcom,scm-seca", "qcom,scm";
+		};
+
+		pdp_scmi: scmi {
+			compatible = "arm,scmi";
+			mboxes = <&pdp_mbox0 0>,
+				 <&pdp_mbox0 11>,
+				 <&pdp_mbox0 1>;
+			mbox-names = "tx",
+				     "tx_reply",
+				     "rx";
+			shmem = <&pdp0_a2p>,
+				<&pdp0_p2a>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cpu_perf: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd0>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd0>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd0>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd0>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cpu_pd4: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd0>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cpu_pd5: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd0>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cpu_pd6: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd1>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cpu_pd7: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd1>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cpu_pd8: power-domain-cpu8 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd1>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cpu_pd9: power-domain-cpu9 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd1>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cpu_pd10: power-domain-cpu10 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd1>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cpu_pd11: power-domain-cpu11 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd1>;
+			domain-idle-states = <&cluster_c4>;
+		};
+
+		cluster_pd0: power-domain-cluster0 {
+			#power-domain-cells = <0>;
+			power-domains = <&system_pd>;
+			domain-idle-states = <&cluster_cl5>;
+		};
+
+		cluster_pd1: power-domain-cluster1 {
+			#power-domain-cells = <0>;
+			power-domains = <&system_pd>;
+			domain-idle-states = <&cluster_cl5>;
+		};
+
+		system_pd: power-domain-system {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&domain_ss3>;
+		};
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cpucp-scandump-region@80000000 {
+			no-map;
+			reg = <0x0 0x80000000 0x0 0x800000>;
+		};
+
+		tme-sail-region@81ff0000 {
+			no-map;
+			reg = <0x0 0x81ff0000 0x0 0x10000>;
+		};
+
+		tz-sail-mailbox-region@82000000 {
+			no-map;
+			reg = <0x0 0x82000000 0x0 0x8000>;
+		};
+
+		hlos-sail-mailbox-region@82008000 {
+			no-map;
+			reg = <0x0 0x82008000 0x0 0x1f8000>;
+		};
+
+		sail-ota-region@82200000 {
+			no-map;
+			reg = <0x0 0x82200000 0x0 0x5ff000>;
+		};
+
+		sail-vdt-region@827ff000 {
+			no-map;
+			reg = <0x0 0x827ff000 0x0 0x1000>;
+		};
+
+		gunyah-hyp-region@82800000 {
+			no-map;
+			reg = <0x0 0x82800000 0x0 0x2400000>;
+		};
+
+		deepsleep-region@84c00000 {
+			no-map;
+			reg = <0x0 0x84c00000 0x0 0x800000>;
+		};
+
+		deepsleep-backup-region@86a00000 {
+			no-map;
+			reg = <0x0 0x86a00000 0x0 0x200000>;
+		};
+
+		soccp-fe-vm-0-region@86c00000 {
+			no-map;
+			reg = <0x0 0x86c00000 0x0 0xac000>;
+		};
+
+		soccp-fe-vm-1-region@86cac000 {
+			no-map;
+			reg = <0x0 0x86cac000 0x0 0x18d000>;
+		};
+
+		soccp-fe-vm-2-region@86e39000 {
+			no-map;
+			reg = <0x0 0x86e39000 0x0 0x1c7000>;
+		};
+
+		tme-crash-dump-region@87000000 {
+			no-map;
+			reg = <0x0 0x87000000 0x0 0xa0000>;
+		};
+
+		tme-log-region@87140000 {
+			no-map;
+			reg = <0x0 0x87140000 0x0 0x4000>;
+		};
+
+		aop-cmd-db-p-region@87148000 {
+			compatible = "qcom,cmd-db";
+			no-map;
+			reg = <0x0 0x87148000 0x0 0x20000>;
+		};
+
+		nsp-sync-buffer-region@871ff000 {
+			no-map;
+			reg = <0x0 0x871ff000 0x0 0x1000>;
+		};
+
+		ddr-training-checksum-data-region@87200000 {
+			no-map;
+			reg = <0x0 0x87200000 0x0 0x2000>;
+		};
+
+		xbl-dtlog-region@87202000 {
+			no-map;
+			reg = <0x0 0x87202000 0x0 0x60000>;
+		};
+
+		xbl-ramdump-region@87262000 {
+			no-map;
+			reg = <0x0 0x87262000 0x0 0x1c0000>;
+		};
+
+		uefi-log@87442000 {
+			reg = <0x0 0x87442000 0x0 0x10000>;
+			no-map;
+		};
+
+		secdata-apss-region@87452000 {
+			no-map;
+			reg = <0x0 0x87452000 0x0 0x1000>;
+		};
+
+		antireplay-emulation-region@87453000 {
+			no-map;
+			reg = <0x0 0x87453000 0x0 0x1000>;
+		};
+
+		soccp-sdi-region@87454000 {
+			no-map;
+			reg = <0x0 0x87454000 0x0 0x40000>;
+		};
+
+		hyp-mem-database-region@87494000 {
+			no-map;
+			reg = <0x0 0x87494000 0x0 0x60000>;
+		};
+
+		pmic-mini-dump-region@874f4000 {
+			no-map;
+			reg = <0x0 0x874f4000 0x0 0x80000>;
+		};
+
+		qup-fw-region@87574000 {
+			no-map;
+			reg = <0x0 0x87574000 0x0 0x20000>;
+		};
+
+		softsku-region@87594000 {
+			no-map;
+			reg = <0x0 0x87594000 0x0 0x9000>;
+		};
+
+		resource-scheduler-region@8759d000 {
+			no-map;
+			reg = <0x0 0x8759d000 0x0 0x20000>;
+		};
+
+		pdp-ns-mem-region@87600000 {
+			reg = <0x0 0x87600000 0x0 0x8000>,
+			      <0x0 0x87609000 0x0 0x1f7000>;
+			no-map;
+		};
+
+		pdp0_p2a: scmi-shmem@87608000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x87608000 0x0 0x80>;
+			no-map;
+		};
+
+		pdp0_a2p: scmi-shmem@87608180 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x87608180 0x0 0x80>;
+			no-map;
+		};
+
+		tz-stat-region@87a00000 {
+			no-map;
+			reg = <0x0 0x87a00000 0x0 0x100000>;
+		};
+
+		qdss-apps-region@87b00000 {
+			no-map;
+			reg = <0x0 0x87b00000 0x0 0x2000000>;
+		};
+
+		smem-region@89b00000 {
+			compatible = "qcom,smem";
+			no-map;
+			reg = <0x0 0x89b00000 0x0 0x400000>;
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		global-sync-region@89f00000 {
+			no-map;
+			reg = <0x0 0x89f00000 0x0 0x400000>;
+		};
+
+		tzffi-region@8a300000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x8a300000 0x0 0x1400000>;
+			no-map;
+		};
+
+		gunyah-md-region@8b700000 {
+			no-map;
+			reg = <0x0 0x8b700000 0x0 0x80000>;
+		};
+
+		flashless-qntm-tool-region@8b780000 {
+			no-map;
+			reg = <0x0 0x8b780000 0x0 0x182000>;
+		};
+
+		ipa-fw-region@8bb00000 {
+			no-map;
+			reg = <0x0 0x8bb00000 0x0 0x10000>;
+		};
+
+		ipa-gsi-region@8bb10000 {
+			no-map;
+			reg = <0x0 0x8bb10000 0x0 0xa000>;
+		};
+
+		gpu-microcode-region@8bb1a000 {
+			no-map;
+			reg = <0x0 0x8bb1a000 0x0 0x2000>;
+		};
+
+		gpu-microcode-2-region@8bb1c000 {
+			no-map;
+			reg = <0x0 0x8bb1c000 0x0 0x2000>;
+		};
+
+		soccp-region@8bc00000 {
+			no-map;
+			reg = <0x0 0x8bc00000 0x0 0x300000>;
+		};
+
+		cvp-region@8d100000 {
+			no-map;
+			reg = <0x0 0x8d100000 0x0 0x800000>;
+		};
+
+		cdsp0-region@8d900000 {
+			no-map;
+			reg = <0x0 0x8d900000 0x0 0x2300000>;
+		};
+
+		cdsp1-region@8fc00000 {
+			no-map;
+			reg = <0x0 0x8fc00000 0x0 0x2300000>;
+		};
+
+		hpass-dsp0-region@96500000 {
+			no-map;
+			reg = <0x0 0x96500000 0x0 0x2800000>;
+		};
+
+		hpass-dsp1-region@98d00000 {
+			no-map;
+			reg = <0x0 0x98d00000 0x0 0x2800000>;
+		};
+
+		q6-cdsp0-dtb-region@9dd00000 {
+			no-map;
+			reg = <0x0 0x9dd00000 0x0 0x80000>;
+		};
+
+		q6-cdsp1-dtb-region@9dd80000 {
+			no-map;
+			reg = <0x0 0x9dd80000 0x0 0x80000>;
+		};
+
+		hpass-dsp0-dtb-region@9df00000 {
+			no-map;
+			reg = <0x0 0x9df00000 0x0 0x80000>;
+		};
+
+		hpass-dsp1-dtb-region@9df80000 {
+			no-map;
+			reg = <0x0 0x9df80000 0x0 0x80000>;
+		};
+
+		camera-icp-1-region@9e100000 {
+			no-map;
+			reg = <0x0 0x9e100000 0x0 0x800000>;
+		};
+
+		camera-icp-2-region@9e900000 {
+			no-map;
+			reg = <0x0 0x9e900000 0x0 0x800000>;
+		};
+
+		camera-qup-1-region@9f100000 {
+			no-map;
+			reg = <0x0 0x9f100000 0x0 0x200000>;
+		};
+
+		camera-qup-2-region@9f300000 {
+			no-map;
+			reg = <0x0 0x9f300000 0x0 0x200000>;
+		};
+
+		video-region@9f500000 {
+			no-map;
+			reg = <0x0 0x9f500000 0x0 0xc00000>;
+		};
+
+		mdt-load-region@a0100000 {
+			no-map;
+			reg = <0x0 0xa0100000 0x0 0x100000>;
+		};
+
+		mm-dspq-region@ba200000 {
+			no-map;
+			reg = <0x0 0xba200000 0x0 0x200000>;
+		};
+
+		display-config-region@ba400000 {
+			no-map;
+			reg = <0x0 0xba400000 0x0 0xa00000>;
+		};
+
+		mm-calibration-data-region@bae00000 {
+			no-map;
+			reg = <0x0 0xbae00000 0x0 0x800000>;
+		};
+
+		audio-config-region@bb600000 {
+			no-map;
+			reg = <0x0 0xbb600000 0x0 0xa00000>;
+		};
+
+		dare-tz-region@bc000000 {
+			no-map;
+			reg = <0x0 0xbc000000 0x0 0xa300000>;
+		};
+
+		hpass-rpc-remote-heap-region@d4600000 {
+			no-map;
+			reg = <0x0 0xd4600000 0x0 0x800000>;
+		};
+
+		mdf-region@d4e00000 {
+			no-map;
+			reg = <0x0 0xd4e00000 0x0 0x2000000>;
+		};
+
+		gearvm-region@d6e00000 {
+			no-map;
+			reg = <0x0 0xd6e00000 0x0 0x800000>;
+		};
+
+		gearvm-shared-region@d7640000 {
+			no-map;
+			reg = <0x0 0xd7640000 0x0 0x190000>;
+		};
+
+		gearvm-logs-region@d77d0000 {
+			no-map;
+			reg = <0x0 0xd77d0000 0x0 0x20000>;
+		};
+
+		gearvm-quantum-test-region@d77f0000 {
+			no-map;
+			reg = <0x0 0xd77f0000 0x0 0x10000>;
+		};
+
+		sail-p-region@8c0000000 {
+			no-map;
+			reg = <0x8 0xc0000000 0x0 0x8000000>;
+		};
+
+		reserved-region@8c8000000 {
+			no-map;
+			reg = <0x8 0xc8000000 0x0 0x18000000>;
+		};
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+		ranges = <0 0 0 0 0x10 0>;
+
+		qupv3_2: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x008c0000 0x0 0x2000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			iommus = <&apps_smmu_0 0x12a3 0x0>;
+			ranges;
+			dma-coherent;
+
+			i2c14: i2c@880000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi14: spi@880000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart14: serial@880000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart15: serial@884000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x00884000 0x0 0x4000>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c16: i2c@888000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi16: spi@888000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart16: serial@888000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c17: i2c@88c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi17: spi@88c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart17: serial@88c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c18: i2c@890000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi18: spi@890000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart18: serial@890000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c19: i2c@894000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00894000 0x0 0x4000>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi19: spi@894000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00894000 0x0 0x4000>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart19: serial@894000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00894000 0x0 0x4000>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c20: i2c@898000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00898000 0x0 0x4000>;
+				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi20: spi@898000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00898000 0x0 0x4000>;
+				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart20: serial@898000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00898000 0x0 0x4000>;
+				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		qupv3_0: geniqup@9c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x009c0000 0x0 0x2000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			iommus = <&apps_smmu_0 0x1403 0x0>;
+			ranges;
+			dma-coherent;
+
+			i2c0: i2c@980000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00980000 0x0 0x4000>;
+				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi0: spi@980000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00980000 0x0 0x4000>;
+				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart0: serial@980000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00980000 0x0 0x4000>;
+				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@984000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00984000 0x0 0x4000>;
+				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi1: spi@984000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00984000 0x0 0x4000>;
+				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart1: serial@984000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00984000 0x0 0x4000>;
+				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@988000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00988000 0x0 0x4000>;
+				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi2: spi@988000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00988000 0x0 0x4000>;
+				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart2: serial@988000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00988000 0x0 0x4000>;
+				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@98c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x0098c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi3: spi@98c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x0098c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart3: serial@98c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x0098c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c4: i2c@990000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00990000 0x0 0x4000>;
+				interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi4: spi@990000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00990000 0x0 0x4000>;
+				interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart4: serial@990000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00990000 0x0 0x4000>;
+				interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c5: i2c@994000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00994000 0x0 0x4000>;
+				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi5: spi@994000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00994000 0x0 0x4000>;
+				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart5: serial@994000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00994000 0x0 0x4000>;
+				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		qupv3_1: geniqup@ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x00ac0000 0x0 0x2000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			iommus = <&apps_smmu_0 0x1443 0x0>;
+			ranges;
+			dma-coherent;
+
+			i2c7: i2c@a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi7: spi@a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart7: serial@a80000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c8: i2c@a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi8: spi@a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart8: serial@a84000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c9: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a88000 0x0 0x4000>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart9: serial@a88000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a88000 0x0 0x4000>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c10: i2c@a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a8c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart10: serial@a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a8c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c11: i2c@a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi11: spi@a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart11: serial@a90000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c12: i2c@a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi12: spi@a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart12: serial@a94000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c13: i2c@a98000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a98000 0x0 0x4000>;
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi13: spi@a98000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a98000 0x0 0x4000>;
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart13: serial@a98000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a98000 0x0 0x4000>;
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+		};
+
+		qupv3_3: geniqup@cc0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x00cc0000 0x0 0x2000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			iommus = <&apps_smmu_0 0x1463 0x0>;
+			ranges;
+			dma-coherent;
+
+			i2c21: i2c@c80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00c80000 0x0 0x4000>;
+				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi21: spi@c80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00c80000 0x0 0x4000>;
+				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart21: serial@c80000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00c80000 0x0 0x4000>;
+				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		rng@10c3000 {
+			compatible = "qcom,seca-trng", "qcom,trng";
+			reg = <0x0 0x010c3000 0x0 0x1000>;
+		};
+
+		ufs_mem_hc: ufshc@1d44000 {
+			compatible = "qcom,seca-ufshc",
+				     "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0x0 0x01d44000 0x0 0x3000>,
+			      <0x0 0x01d60000 0x0 0x15000>;
+			reg-names = "std",
+				    "mcq";
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			lanes-per-direction = <2>;
+			iommus = <&apps_smmu_0 0x14c0 0x0>;
+			dma-coherent;
+			msi-parent = <&gic_its 0x14c0>;
+
+			status = "disabled";
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		mailbox@9007000 {
+			compatible = "qcom,seca-ipcc", "qcom,ipcc";
+			reg = <0x0 0x09007000 0x0 0x1000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@90c5000 {
+			compatible = "qcom,seca-ipcc", "qcom,ipcc";
+			reg = <0x0 0x090c5000 0x0 0x1000>;
+			interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@9185000 {
+			compatible = "qcom,seca-ipcc", "qcom,ipcc";
+			reg = <0x0 0x09185000 0x0 0x1000>;
+			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#mbox-cells = <2>;
+		};
+
+		iommu@9980000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x0 0x09980000 0x0 0x20000>;
+			interrupts = <GIC_SPI 898 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 900 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 902 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq",
+					  "cmdq-sync",
+					  "gerror";
+			dma-coherent;
+			#iommu-cells = <1>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,seca-pdc",
+				     "qcom,pdc";
+			reg = <0x0 0x0b220000 0x0 0x30000>;
+			qcom,pdc-ranges = <0 745 43>,
+					  <67 543 31>,
+					  <98 609 32>,
+					  <130 717 12>,
+					  <142 251 5>,
+					  <147 796 16>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		tsens0: thermal-sensor@c22c000 {
+			compatible = "qcom,seca-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22c000 0x0 0x1000>,
+			      <0x0 0x0c222000 0x0 0x1000>;
+			interrupts = <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>;
+			#qcom,sensors = <16>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c22d000 {
+			compatible = "qcom,seca-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22d000 0x0 0x1000>,
+			      <0x0 0x0c223000 0x0 0x1000>;
+			interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>;
+			#qcom,sensors = <16>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens2: thermal-sensor@c22e000 {
+			compatible = "qcom,seca-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22e000 0x0 0x1000>,
+			      <0x0 0x0c224000 0x0 0x1000>;
+			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+			#qcom,sensors = <16>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens3: thermal-sensor@c22f000 {
+			compatible = "qcom,seca-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22f000 0x0 0x1000>,
+			      <0x0 0x0c225000 0x0 0x1000>;
+			interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
+			#qcom,sensors = <16>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens4: thermal-sensor@c230000 {
+			compatible = "qcom,seca-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c230000 0x0 0x1000>,
+			      <0x0 0x0c226000 0x0 0x1000>;
+			interrupts = <GIC_SPI 775 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+			#qcom,sensors = <16>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens5: thermal-sensor@c231000 {
+			compatible = "qcom,seca-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c231000 0x0 0x1000>,
+			      <0x0 0x0c227000 0x0 0x1000>;
+			interrupts = <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>;
+			#qcom,sensors = <16>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		sram@c30f000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0x0 0x0c30f000 0x0 0x400>;
+		};
+
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,seca-tlmm";
+			reg = <0x0 0x0f100000 0x0 0xc0000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 181>;
+			wakeup-parent = <&pdc>;
+		};
+
+		apps_smmu_0: iommu@15a00000 {
+			compatible = "qcom,seca-smmu-500",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x15a00000 0x0 0x100000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+			interrupts = <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 32 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 33 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 34 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 35 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 39 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 40 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 41 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 47 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 48 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 49 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 50 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 51 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 52 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 54 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 55 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 59 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 60 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 61 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 62 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 63 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 64 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 65 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 66 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 69 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 70 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 74 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 75 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 76 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 77 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 78 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 79 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 98 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 127 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		apps_smmu_1: iommu@15c00000 {
+			compatible = "qcom,seca-smmu-500",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x15c00000 0x0 0x100000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+			interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 135 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 139 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 149 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 150 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 151 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 153 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 154 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 155 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 156 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 157 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 158 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 159 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 160 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 161 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 162 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 163 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 164 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 165 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 166 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 167 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 168 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 169 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 171 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 172 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 173 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 174 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 175 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 177 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 178 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 179 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 182 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 183 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 185 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 186 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 187 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 188 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 189 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 190 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 193 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 194 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 195 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 199 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 214 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 215 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 221 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 222 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 223 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		apps_smmu_2: iommu@15e00000 {
+			compatible = "qcom,seca-smmu-500",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x15e00000 0x0 0x100000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+			interrupts = <GIC_SPI 877 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 224 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 225 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 226 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 227 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 228 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 229 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 230 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 231 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 232 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 233 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 234 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 235 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 236 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 237 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 239 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 241 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 242 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 243 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 244 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 245 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 246 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 247 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 248 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 249 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 250 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 251 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 252 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 253 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 257 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 258 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 259 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 262 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 263 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 264 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 269 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 270 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 271 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 272 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 276 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 278 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 285 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 286 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 287 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 288 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 291 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 298 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 299 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 300 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 301 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 319 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		intc: interrupt-controller@17000000 {
+			compatible = "arm,gic-v3";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			reg = <0x0 0x17000000 0x0 0x10000>,
+			      <0x0 0x17080000 0x0 0x480000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x40000>;
+			ranges;
+
+			gic_its: msi-controller@17040000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x0 0x17040000 0x0 0x40000>;
+				msi-controller;
+				#msi-cells = <1>;
+			};
+		};
+
+		pdp_mbox0: mailbox@17610000 {
+			compatible = "qcom,seca-cpucp-mbox",
+				     "qcom,nord-cpucp-mbox";
+			reg = <0x0 0x17610000 0x0 0x4c08>,
+			      <0x0 0x19980000 0x0 0x300>;
+			#mbox-cells = <1>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		mailbox@17620000 {
+			compatible = "qcom,seca-cpucp-mbox",
+				     "qcom,nord-cpucp-mbox";
+			reg = <0x0 0x17620000 0x0 0x4c08>,
+			      <0x0 0x18830000 0x0 0x300>;
+			#mbox-cells = <1>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		timer@17810000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x17810000 0x0 0x1000>;
+			ranges = <0x0 0x0 0x0 0x20000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@17811000 {
+				reg = <0x17811000 0x1000>,
+				      <0x17812000 0x1000>;
+				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <0>;
+			};
+
+			frame@17813000 {
+				reg = <0x17813000 0x1000>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <1>;
+				status = "disabled";
+			};
+
+			frame@17815000 {
+				reg = <0x17815000 0x1000>;
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <2>;
+				status = "disabled";
+			};
+
+			frame@17817000 {
+				reg = <0x17817000 0x1000>;
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <3>;
+				status = "disabled";
+			};
+
+			frame@17819000 {
+				reg = <0x17819000 0x1000>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <4>;
+				status = "disabled";
+			};
+
+			frame@1781b000 {
+				reg = <0x1781b000 0x1000>;
+				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <5>;
+				status = "disabled";
+			};
+
+			frame@1781d000 {
+				reg = <0x1781d000 0x1000>;
+				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <6>;
+				status = "disabled";
+			};
+		};
+
+		watchdog@17826000 {
+			compatible = "qcom,kpss-wdt";
+			reg = <0x0 0x17826000 0x0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_ESPI 848 IRQ_TYPE_EDGE_RISING>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	thermal-zones {
+		cpu-0-0-0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-0-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-1-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-0-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-2-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-0-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-3-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-0-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-4-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-0-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-5-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-0-0-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpullc-0-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-0-0-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpu-0-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-0-2-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpu-0-2-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-1-1-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpu-1-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-2-0-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpu-2-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-2-2-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpu-2-2-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpuss-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpuss-3-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-1-thermal {
+			thermal-sensors = <&tsens0 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				camera-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		amux-0-thermal {
+			thermal-sensors = <&tsens0 15>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				amux-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-1-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-0-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-1-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-1-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-1-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-2-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-1-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-3-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-1-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-4-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-1-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-0-5-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-0-1-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpullc-0-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-0-1-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpu-0-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-1-0-thermal {
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpu-1-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-1-2-thermal {
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpu-1-2-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-2-1-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpu-2-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			thermal-sensors = <&tsens1 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpuss-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			thermal-sensors = <&tsens1 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpuss-2-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-4-thermal {
+			thermal-sensors = <&tsens1 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				gpuss-4-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-2-thermal {
+			thermal-sensors = <&tsens1 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				camera-2-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		amux-1-thermal {
+			thermal-sensors = <&tsens1 15>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				amux-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0vxu-0-thermal {
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp0vxu-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0vxu-2-thermal {
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp0vxu-2-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0hlx-0-thermal {
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp0hlx-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0mxu-0-0-thermal {
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp0mxu-0-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0mxu-1-0-thermal {
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp0mxu-1-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1vxu-0-thermal {
+			thermal-sensors = <&tsens2 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp1vxu-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1vxu-2-thermal {
+			thermal-sensors = <&tsens2 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp1vxu-2-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1hlx-0-thermal {
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp1hlx-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1mxu-0-0-thermal {
+			thermal-sensors = <&tsens2 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp1mxu-0-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1mxu-1-0-thermal {
+			thermal-sensors = <&tsens2 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp1mxu-1-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		audhvx-0-0-thermal {
+			thermal-sensors = <&tsens2 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				audhvx-0-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		audhmx-0-0-thermal {
+			thermal-sensors = <&tsens2 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				audhmx-0-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		audhvx-1-0-thermal {
+			thermal-sensors = <&tsens2 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				audhvx-1-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		audhmx-1-0-thermal {
+			thermal-sensors = <&tsens2 15>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				audhmx-1-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0vxu-1-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp0vxu-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0vxu-3-thermal {
+			thermal-sensors = <&tsens3 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp0vxu-3-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0hlx-1-thermal {
+			thermal-sensors = <&tsens3 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp0hlx-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0mxu-0-1-thermal {
+			thermal-sensors = <&tsens3 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp0mxu-0-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0mxu-1-1-thermal {
+			thermal-sensors = <&tsens3 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp0mxu-1-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1vxu-1-thermal {
+			thermal-sensors = <&tsens3 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp1vxu-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1vxu-3-thermal {
+			thermal-sensors = <&tsens3 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp1vxu-3-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1hlx-1-thermal {
+			thermal-sensors = <&tsens3 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp1hlx-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1mxu-0-1-thermal {
+			thermal-sensors = <&tsens3 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp1mxu-0-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1mxu-1-1-thermal {
+			thermal-sensors = <&tsens3 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				nsp1mxu-1-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		audhvx-0-1-thermal {
+			thermal-sensors = <&tsens3 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				audhvx-0-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		audhmx-0-1-thermal {
+			thermal-sensors = <&tsens3 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				audhmx-0-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		audhvx-1-1-thermal {
+			thermal-sensors = <&tsens3 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				audhvx-1-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		audhmx-1-1-thermal {
+			thermal-sensors = <&tsens3 15>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				audhmx-1-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-0-thermal {
+			thermal-sensors = <&tsens4 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-0-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-0-thermal {
+			thermal-sensors = <&tsens4 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-1-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-2-0-thermal {
+			thermal-sensors = <&tsens4 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-2-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-3-0-thermal {
+			thermal-sensors = <&tsens4 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-3-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-4-0-thermal {
+			thermal-sensors = <&tsens4 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-4-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-5-0-thermal {
+			thermal-sensors = <&tsens4 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-5-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-0-thermal {
+			thermal-sensors = <&tsens4 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpullc-1-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-0-0-thermal {
+			thermal-sensors = <&tsens4 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				ddr-0-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-1-0-thermal {
+			thermal-sensors = <&tsens4 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				ddr-1-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cv-0-thermal {
+			thermal-sensors = <&tsens4 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cv-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pcie-0-thermal {
+			thermal-sensors = <&tsens4 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				pcie-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		amux-4-thermal {
+			thermal-sensors = <&tsens4 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				amux-4-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-0-thermal {
+			thermal-sensors = <&tsens4 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				video-0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-1-thermal {
+			thermal-sensors = <&tsens5 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-0-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-1-thermal {
+			thermal-sensors = <&tsens5 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-1-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-2-1-thermal {
+			thermal-sensors = <&tsens5 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-2-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-3-1-thermal {
+			thermal-sensors = <&tsens5 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-3-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-4-1-thermal {
+			thermal-sensors = <&tsens5 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-4-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-5-1-thermal {
+			thermal-sensors = <&tsens5 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu-1-5-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-1-thermal {
+			thermal-sensors = <&tsens5 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpullc-1-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-0-1-thermal {
+			thermal-sensors = <&tsens5 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				ddr-0-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-1-1-thermal {
+			thermal-sensors = <&tsens5 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				ddr-1-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cv-1-thermal {
+			thermal-sensors = <&tsens5 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cv-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pcie-1-thermal {
+			thermal-sensors = <&tsens5 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				pcie-1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		amux-5-thermal {
+			thermal-sensors = <&tsens5 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				amux-5-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+	};
+};
-- 
2.43.0

