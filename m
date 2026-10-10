Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938DC40B11E
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791617322; cv=none; b=X2rBe8K6UCxqtz+b46lFFCd7oG18XayICvJI58ycMF+FwMqZ3FO70FagVGMJhXPFWuauAmx98RpLWoCQyz0hUqrrDkfZP8+Hw6uN8IGtW/W4Sf6dGz6k/uB+z9QN5QJPTzdojuwsDcPrHrNS4jGmpm0vnoEOnmmQGsCoGthVn2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791617322; c=relaxed/simple;
	bh=2PycBXGVgY3RND2Le7tllKHiCDXfQ6uF7dvtV7xvn3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BzuQR5NZlMuA7ZiMLad1+loEdEdEMmW0zCaStq++sTNXdkKNaoS6tndMP/L8cdiv9AS3tQ201USbv5AKSsgbT9SyttgsXZ0JS/rpFcROOEgHfBTYw7Hl+b37fiH3fINsqII4vKjJHPvlwLYH6R0jjZ1qfozW4V9zDegpEZxT9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eulm5Ywj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpcLmp2S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eulm5Ywj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpcLmp2S"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2ejks3282529
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 07:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=smQofM0ibfRg3eH0rWIrcGsuuljAa6Fkfhn
	c4jYgCRU=; b=Eulm5Ywj/qYoRQPXprkEDtzzVbkJZODnFA6lvz1M60E+Di+Y8Yp
	BgRYhxX+ak1g1yd9gzyWfiufV0hWOLmOX0SQtWJi0Ipuf8noNDIAat5ANY8/NTvb
	dzhTjcfzerXiBedObCbZI/05elQc7hngwQYOK+d2UVpjQvjEq/llD3aALKIIc1zH
	E86SFAOWWa6nZ+5ZPlE7mz8OHTMbf2X6TGq9FAGAztlnATZhA1zV4DWyV0op3Yhi
	Lb58Vc886U1dUjLs43x2f+tQC5keHFHnPI5FPwYr0o5tdfKSOsQp7e4TMbVoyA2T
	RLp9CExa3RMXmE9ZeFpxx026hMNW8wFGUAQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cpggjgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 07:28:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1225826eec.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791617319; x=1792222119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=smQofM0ibfRg3eH0rWIrcGsuuljAa6Fkfhnc4jYgCRU=;
        b=IpcLmp2Sk2jUefXXRFLnANojS76FTuekJfLiTfmMyCYOkzxrxOK3W/qTh0Ig9RXwa2
         7VDPi6LiaVU8QuPIKXXyYvY1hgmt0xtYp50vijY9AtITViQzUdadoPQ/Cpy8rMvJU62Y
         /w5fbi6y9W2R3feS1kC/a+G2e+Hj98/nKe7QfmneGzB8bpjeF1nbi6OtnO6dBG8CNh/z
         4x2NFwiv0meM5uMz3KYtXmqUq4IIKHfMs/N2WvWVirMZp9NUzLCTCn7Mg3TBF1Kue8OK
         Qa71vYgxXDokyfhsHT6B0stLnVlKP5CzeTwIDr98UxZKtD0UxLY0jIhhlS/bg+YeAl6d
         OTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791617319; x=1792222119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smQofM0ibfRg3eH0rWIrcGsuuljAa6Fkfhnc4jYgCRU=;
        b=UXYeicZtDOrc/YjWFIQge+/AZTM7l4SGuFFvDMy3XSezMWzM7wK+xd0YR7bn7IWXBW
         dMFtQpU432X3dlQFWz0uVkwRuMGWV5hyg8inHPop+s9oKRg127XM9W2yZunVa9eAEPns
         R4DXTdsWYOJ43fMgSo2xLC/cKDO7BIQpYgA8roIDKtdFFJsQHlb8PDonYW9M/D3WPZcy
         8vQPs1nhAxC8/MI5X9NTs/BYXvgiPoTlXPsivkapHwcZg/1I/dXM4MaUGot75iv1uIUR
         mk+HUC9kOnSee8u1ZAxh3BWmn8AaaAB33oUaz8AQ5qE/nWFQuGlSvno/otgVEkx4YjyD
         wnIA==
X-Forwarded-Encrypted: i=1; AKwUvBwomWyBL5FLzakfYbBFWlrYmBMLutkiRBxzwspVr+zJ70PfMytdN4OpupiQE3Ut4C7HY1+Y2OEBjb3l@vger.kernel.org
X-Gm-Message-State: AFq9FYIzMwEtaKbR9RHY07HjAXnJCTrwj76ZN38ZaifXZn0UOu1eevDi
	OXv1CmcR1sqk8gaV6oOzu0hoLcgU9ICKYhzb5jbljUDTo1w5vvR9bV5pTue019/ckNSjkk9Tn7t
	kDvBWrT9pUuo0t6r8yTnyDFhrbGkLKwOXh7EgWbfrCQDomfw3D7hVJ9QBUvAlRe/I
X-Gm-Gg: AYBFou0ngsckE+ekK0tj82W/Smu5sPRywuD8BKch0BlfsuB2utKEiuU5JzluJ1NJJo5
	tAu88GDiqPzGpRouroN4Xwu7SiLnaG3tsx/7HLElvl701vmv/ZN5odaaoWcVs9WhaKEWzUK3hs8
	esQJQSCJrvc654kkKV4CRiEhIZor42/2DDlTFnnCZ+9P0KxjnWByIFR8Q5XUlLUkRLmsCVgtc2A
	fDpLKX2AJp/OFU8owxu9CAUExXppe7m4WsAUoixXGcnfXUPKTEgV8DfWEcpkm65enab+sMfgubU
	h2+kOKbkqGK+KL3c4WbHEWzMlYJFRhoSaJU7MjO6ZivOofbuVLAB8Qrar/WZGgc4yhZELcQ85Pc
	69qU2KkbhbzmGqJRcWyrTogxZ/fdwcWdxxT6INly+H4hRYid0PZpcUtbpMwk=
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr4950744c88.18.1791617318775;
        Sat, 10 Oct 2026 00:28:38 -0700 (PDT)
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr4950681c88.18.1791617317343;
        Sat, 10 Oct 2026 00:28:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm10712985c88.10.2026.10.10.00.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:28:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: nord: Add adreno SMMU nodes
Date: Sat, 10 Oct 2026 15:28:22 +0800
Message-ID: <20261010072823.3952417-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyOSBTYWx0ZWRfXw+ngaqLVVQoO
 56ls/7gldNlcG6aHShU7xg1a8SZJypJHFM7dS01FCbuxoL/SLUR9k6vkd/kPQMkJjzD4i9pf184
 GE9YVy6D8+qyUImvrBV40lhVM5N6zws=
X-Authority-Analysis: v=2.4 cv=StoFe/O0 c=1 sm=1 tr=0 ts=6ac9e928 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PBtlRvXRUDiLbXfjrAwA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: MxO-Lw6p__GNL_9MamBvFrigF-j0b28G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyOSBTYWx0ZWRfXzgKMNm1ZXXPx
 egbQ2hDHl09a0bqKBzoCFtu4hJ8KBbzt4spBnJ1MPOxDKNqkfBliGIyqEcS08IX2Yi8YiInzUn9
 Mdbd0tebUGEv4RMdEEqzLKFHodHsilgCQGJXAjRm4+sIh7uKhUptlsBhzduMbGI3GLiLNAJAPDP
 wdHAgkqyrucQvu4BjZY52AYP4dx6tPFtFeffnj+8zEcMqgBgPgLohTkETC2MlxskC5h+AJqhmlH
 riHlxCYbqVhG1yvFdS/hqY4cge0v6uaIi16pJ22/MnbnFk76gY4/2r/QjC3I5z78gW491iGAZXS
 mmYjS7lYylhAlEw4C7mUVtjqL+tYJS5BmbWzUVIq/7ydL1sys76tW05ExIPhpuejO0nLTohIgqN
 3dBqTwmgAJn5bm4R9h5gfJMX5qbXt8g0kuKETNRDs6V/ximZORSmgMT5Ayonn4QOoolovI8YihU
 HCNVrcggf+qZi+d/4mA==
X-Proofpoint-GUID: MxO-Lw6p__GNL_9MamBvFrigF-j0b28G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100029

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.

Wire up the gpucc clock and power domain on both adreno SMMU nodes in
nord-embedded.dtsi for embedded Nord variants where gpucc is available.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v3:
- Wire up clocks and power-domains in nord-embedded.dtsi
- Rebase on next-20261009 where binding dependency is cleared
- Link to v2: https://lore.kernel.org/all/20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Fix adreno_smmu_0 interrupts, 673 -> 674 (Thanks Konrad!)
- Link to v1: https://lore.kernel.org/all/20260922111354.533902-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 13 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 74 +++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..867037e1a2b9 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,nord-dispcc.h>
 #include <dt-bindings/clock/qcom,nord-gcc.h>
 #include <dt-bindings/clock/qcom,nord-gpucc.h>
+#include <dt-bindings/clock/qcom,nord-gpu2cc.h>
 #include <dt-bindings/clock/qcom,nord-negcc.h>
 #include <dt-bindings/clock/qcom,nord-nwgcc.h>
 #include <dt-bindings/clock/qcom,nord-segcc.h>
@@ -34,6 +35,18 @@ mc_virt: interconnect-mc-virt {
 	};
 };
 
+&adreno_smmu_0 {
+	clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+	clock-names = "hlos";
+	power-domains = <&gpucc GPU_CC_CX_GDSC>;
+};
+
+&adreno_smmu_1 {
+	clocks = <&gpu2cc GPU_2_CC_GPU_SMMU_VOTE_CLK>;
+	clock-names = "hlos";
+	power-domains = <&gpu2cc GPU_2_CC_CX_GDSC>;
+};
+
 &crypto {
 	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
 			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index fdbe290350dd..147d8e595a3a 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1523,6 +1523,80 @@ tcsr: syscon@1f60000 {
 			reg = <0x0 0x01f60000 0x0 0xa0000>;
 		};
 
+		adreno_smmu_0: iommu@3da0000 {
+			compatible = "qcom,nord-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
+		};
+
+		adreno_smmu_1: iommu@98a0000 {
+			compatible = "qcom,nord-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x098a0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 932 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 936 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 937 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 938 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 939 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 940 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 941 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 942 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 924 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 925 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 926 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 927 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 928 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 858 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

