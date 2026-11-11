Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368897;
	b=QIqda9y59HqRHHx67nbrjgSCN+3+XgLib9/AGq5WhA2cJ4ZeFGa3jh7CyymZGrmIPU7a
	 9n2HRgQEQe0MRaDqE5hXrZ0GOYGvOSx2oCRhpIioRkewFpyTguPYv7TK2iZgnNtSvfFPd
	 hiakE5bN+SQiGJRivAN/VcmjrqV/ZeW2gk62AY7YtGWgCSkg8hnrLsJj9abDu9XyAgnuh
	 sS3o0JbXeAzZaiRH3el9lieXOxnKCB5JwLm9j7MmS/mEoJZES5TlZxvwOQZsI3mYMJPhO
	 yZT+N87hAzDCJTshrEIkBynw2Ggv+kJupZDOVGLNVpLYPzualVwdQX8BUzbH9VtyInA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y+gDBNf49rkgosutsknPz5W/PScX4B9MIdqzXnISpRk=;
	b=iXuLv0kNVSlmCbpE4cuFvC0ejm6hfeBmBVMlk0/0pV4z2nqrQ1gvzDF7k9NroIiLx+ZL
	 knzNOxiEdUyc7xZtJCWI7e42L/QSm7yrMVmDAPIQhOxI9+j91azlg2T0gRM9vO20KTnTx
	 68gJSBFpaQFEDMDvT1SbKdNnkqze7xnUr+S9e85KhJxuyIuluE9tgz6jNbmZ0nxw0mQsE
	 ZnRG7E+aAPJsW9Bv7nEu0zreQS2Xfb8QC1ITwJd2Li4TlIjEnzpe4KzAn/Xi+jqB1vmv8
	 js0RAexdz7p8u5KGWwj+UU2HOWfTP/7OiSSeLECIJfwbWp5rmmsvZmzhnQTsQnTZgSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z6/HxJB8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RpXO46+A;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1AA606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z6/HxJB8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RpXO46+A
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1t2TU4167570
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y+gDBNf49rkgosutsknPz5W/PScX4B9MIdq
	zXnISpRk=; b=Z6/HxJB8CeO3hDq5RjUpJw3BHW73HQ+mvupRxnMpI0ECfEzaKf3
	6tnWmRJeQay2o+pZ9yYCP/ERRebUzVT8fE+uWTtpW/fcQtNu/OjKNDN9Aycgeylv
	eX8WT+izI2q/mVtiNE4+ykK/VveDiUbf7RXIAeF81kkqCKSOyRIcdfdF/AeGBfQz
	jgAvHwxhEk6bBmJTHjKS0wlWihBCWYG1IPuHchBdYQ4HiO548Dj4izOCUynm2qB4
	E3SzfGRzLO2rgJ0wUBii7IGCsfBr3pXxwgW5/fdW2FeJxT6erm/8TRObFQ6sHwZD
	+nxTgAG9rMaj2IEotuC/YDxif382UeyOjAQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4c5vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:48:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso3499387eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794368895; x=1794973695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+gDBNf49rkgosutsknPz5W/PScX4B9MIdqzXnISpRk=;
        b=RpXO46+AKeaq3sOFob1lc2ggdMtty/nTnv1gtCShI9Hd1MozF1Svj5wj1xKyObXeQK
         1V2pa0qH5J2KiXJ+yqmPy8EsIdwcdThxehsgZCPQuDiAtRYJ84OksXq29Y/f1I6UfD2t
         vVIuSaLHFRe7S6zJZLtZJ3OybSQZYpfieMSeOTVxbpQpVRNopVy9rtJinpHutkugbkZK
         dlvaBckHrqm4Za2ScwL7Zw3fsJJAJVK3EydF9Lp9X+bEKQTP8+nmgz49obQoXk24yI0T
         O7GysHJoSa1ICwcEE+Sa48Q8L6yTCQQ3SlZYTM8+nFN5BzFr0x2Tfn7phToXlP67VWwM
         LtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368895; x=1794973695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+gDBNf49rkgosutsknPz5W/PScX4B9MIdqzXnISpRk=;
        b=uU2WgBsSmA3UvdunXczGG6o7NwN2Y2h2tdmzdt9NcIZJL8vclA0U1aT3t1pQCM1Qmm
         JXn+Vi6z7dQwNO9O1fwsVzgR6B0vSV3vecLFdlIAItaLCPCf0AMq0repYlAm1p6vytN9
         G+RaBTgxGnmp+ndfzrmIPJj4EFoK4odpzZRuGMwD0OEgjMLOjJ8htLzOlqo6S5Ha/iUv
         111PhxD6ZJejZmJU/QrhqtuPglhw9Dw7oBoLOGtNdHKI41c2q66QhjkKxJEyfmW4aQ0M
         xAZnwtoF4athmiGBBF++SFRENaUpzu5yhNJ/GFWUuSxBS+Qk1/ODONeSMFRlgkIHYSKQ
         dxXw==
X-Forwarded-Encrypted: i=1; AL+hErE2fs55pZEYCQeW5PUVoLpLQNtAg6+oyfA+ublRAywvWYqHrIF7vG23KDQMGU2M2XaXXhg2cW1Hwsc6@vger.kernel.org
X-Gm-Message-State: APuU4Z/6diBdSbQ03nH7Dz55LSde0kWgk+xx/G+8/KzcgbVRdgjeoojj
	pzDY0Y7yE7izihM2vYJnvm6wu0vieLqi5I9xKjOLVB2VoWS7DFx5IdxXthSp4YtuRSJyuBjHtQ4
	qGFX+glE2pSdoEe695DZdf5PQPgn6Gx9QFv93ziDWot2QhQ/RkyZJHCEH51MA9/1e
X-Gm-Gg: AYBFou0hBjEi0CuGBgb9/U/L+kNY2iek2X77BpHYfGP1YONxh1VRISJE1XAWpYqQQ7C
	fnT3EwjbnlPH12msSiP5j1efuX0VoaUGp9wS9VE+sIvLVGZ7Sdd+5SZHCFRL0ah4tvMUgs6aED4
	03LITKFn1rH9lOM7B8mWsCnz3/NE3KgAz1rlwtFCw+UeIVX/aahAm/NaDzF4BQ6jc3Vb5qh3BgW
	9YuNCTulnDU/aXLVdSPJMM718hjpE6SbknSNOHjWNUgIZZiS1IttfogvM5aKHz7y9LsfnDd83ml
	Dqp1i6E2aDeWnbf3zCmucfMv7gkZUxKIlX6ZzGbW8OeWK+vbzhkXKQU7slXpth8BKdMSsB6nnyo
	BZD+CKluTiTgW3EwqMA1OwB5mKEmLxmbWXBIhEbnXkOTOM11Uvja6t6U+1X43krouh9kyFxbxlW
	h6ndOyK27KEEnPWMPk99WdSWAjJ1ZsOkHP
X-Received: by 2002:a05:693c:87cf:20b0:376:77e6:a66 with SMTP id 5a478bee46e88-37685d7371bmr1915853eec.16.1794368894761;
        Tue, 10 Nov 2026 19:48:14 -0800 (PST)
X-Received: by 2002:a05:693c:87cf:20b0:376:77e6:a66 with SMTP id 5a478bee46e88-37685d7371bmr1915822eec.16.1794368894068;
        Tue, 10 Nov 2026 19:48:14 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751d9f135asm11286054eec.2.2026.11.10.19.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:48:13 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Sort adreno_smmu_0 node by unit address
Date: Wed, 11 Nov 2026 11:47:56 +0800
Message-ID: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNCBTYWx0ZWRfX/Oz3/sGomw0r
 Xs2VAyikyZZ0pQYWrS1yW9U8p5iOL7pzcG0fEQVscEBSdmJCuS/Daf/RxKURt1eFQ04ZOAGKBcE
 OCCag/ityS/fHPbEu7c1vm79HP45ag+tGZQJHEedYq9NOzWZnu0gnFLB7qeVUFd0q5K6oXAnNu0
 Ez59Vn9w+dpCeB+kHdcnvw2qh/kPiZpRMdHD+P/quMws8DwSJWUiRAZviiZOdMMlounqiRwsc/9
 5ZsQBh89vQ0wTHPgvJCNrOQY++GTZjmV9WiNxO4ayVlcGdcuWwFBGX/42bV14Cb5v72ff5hJaSP
 DxOzI0DEte0wFEb5kCfj2kpkQ5KAIs+av2tOCo1JhrsnPLCk1AXl/1kMyZdThwq3Ogt+EN5puIU
 Gupqy02JI/Gif3RjMRFzstVy5RRZv2UFtAA/G/PhRt0VCG/QixD9i9YFvZATni5fHC7e40KNpqZ
 CZ0HuBw9quR+ECgdSaw==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af3e57f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=iDbv_3reLaKZJHcXULIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNCBTYWx0ZWRfX55Iv6pzkWJBK
 /f56JoYR4Bah0Td+c/2bz3vVZooAosoq2KrFkIn6c1SV6MvAChQpi0iKKIiTc6xo5wDS25U2S+7
 Iyxdgv0xXhMznoZ2XPk7xNmSxmCHdSM=
X-Proofpoint-GUID: sXG9K-tH0ydnBngbTk8skityQyqedbJL
X-Proofpoint-ORIG-GUID: sXG9K-tH0ydnBngbTk8skityQyqedbJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110014

The adreno_smmu_0 node at 0x3da0000 was placed after ipcc0 at 0x9007000,
breaking the unit address ordering of nodes under /soc.

Move it between syscon@1f60000 and remoteproc@4c00000.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 74 +++++++++++++++---------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4..4f422f9e39c7 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1712,6 +1712,43 @@ tcsr: syscon@1f60000 {
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
 		remoteproc_adsp: remoteproc@4c00000 {
 			compatible = "qcom,nord-adsp-pas";
 			reg = <0x0 0x04c00000 0x0 0x10000>;
@@ -1812,43 +1849,6 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
-		adreno_smmu_0: iommu@3da0000 {
-			compatible = "qcom,nord-smmu-500",
-				     "qcom,adreno-smmu",
-				     "qcom,smmu-500",
-				     "arm,mmu-500";
-			reg = <0x0 0x03da0000 0x0 0x40000>;
-			#iommu-cells = <2>;
-			#global-interrupts = <1>;
-			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
-			dma-coherent;
-		};
-
 		adreno_smmu_1: iommu@98a0000 {
 			compatible = "qcom,nord-smmu-500",
 				     "qcom,adreno-smmu",
-- 
2.43.0

