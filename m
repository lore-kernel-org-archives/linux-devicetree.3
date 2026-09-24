Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9E633A03A
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239703; cv=none; b=ht/0SChLl/8h6MKdsZG3Bby94R0Ht5mH4rhUJpWyjln7tkURE18rmwyvNxU5RLept3UXw7g5scyuUUiuqNInvQJItCRLJj3+nmCdHcPOxS8ua5MFwdd+IpU/UhdJxsiZWYkq8PrL/IPYkk5HJAs/etbQQxZYljc6HxFqa754+cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239703; c=relaxed/simple;
	bh=qQTBA9T9acUcQeEQ5gZ0JrvsdsBqFS8qpGvRE4+lzoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqU/3yYm8QIlJhp7sbtzUH0KXrsZzwMHDwzjAlQWLc6JSKmUNmb6NvVhxsX0ASod7g1L8eY/aJ9AwrIQav87drBLODMlKUB+Z6oQod9KiqVYlMNNL8jKs4xJjIypUb9nfCuwBQW81rTkxowLmOWSeJLWL+4XZUigTeXcPO8TtTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCxVMpWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjPHTPRl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCxVMpWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjPHTPRl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eDwm2420949
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I6WecNsFULJ5CHmJg2m+E9mwTurGwtQ1TSS
	iTg/FTTc=; b=TCxVMpWxTtRm07egiUS7KY8d9e/54BYxDCWt5R/y+OgHlgIJMAc
	fxoJg1/8yRywWiXu5fs/kEW2tyxmFoo4V34X5CXAl28fDHBcuR2Tny4xzHOGPmoj
	8GXG1nz4mfMbSHnlp06xSyrsB3hGjL81QGR+9jh9Z2GQ2tH7hfRyaujdNzDfmH1d
	QIJgLCGqEO+BT7Sk2Rr4gF/LYF7ZmcHBJYanOxt+L9B/2cTBLbCxRKfhGNyzKyHL
	92bkd7IEvQ6oBeLLRuuW4J3FpcK1uoYZRqY4Nyd4a7Xn0mt7v4yCg7MXndmn8ZIt
	WDrSFGv9VLNtKCN866GDQWFy/qYAeyx634Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuhkhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:48:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1496058c88.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790239700; x=1790844500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6WecNsFULJ5CHmJg2m+E9mwTurGwtQ1TSSiTg/FTTc=;
        b=VjPHTPRljKXTpESmKmwcinVzCrhrmwF5wseppmOB6Jg17Ey+f0yQz1eEpifCzZ3F+0
         WSpVwhv6L3rBb+zUlVQ7G8mQN4HoR45MU58JDzyttYMudBb+1oIW3LDCuccT9GtlxegJ
         anI8I+X1ogPgfSK9dHBaw/9ghFtep0GIWvIe5lnQURe8UxR68ZyPAe0glNJj+jVai72/
         exfq+vwXlcggQOoS2NiFB6RvOvIfBzS0HVbRpNPWLl3wRIUOnEdOMWH1Fq2/EKQa9IRS
         ydEWlajLoS6GozCxL2bROD6Aq/KDviRQywxFecQz7EIwZVI+PV29b+Ex6D89ITrIQCsF
         1QHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239700; x=1790844500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6WecNsFULJ5CHmJg2m+E9mwTurGwtQ1TSSiTg/FTTc=;
        b=icyrWpAguMw/cmnp3FEJRmunf2VT1EnatkkS7arQt+SB2v8hvH2h4rab/3XtwlpOL2
         xr/CRULZI2ROTxnLFbDMrQfD7oo54WZodCOTn5Qp6s8MlP9tVTKpnPE/ax81zsGD7rdu
         CMqpaQMMR6nY4Ay13jHuOAQXqj5atCofxSc1Yw50Ycon0d+9/FYCMZ3QJcdU+MJbFdNP
         YYOeZjUt5Lh4Jmf6YhKmkzrfFGvSl3o4hG+efTSLqjl3w78yDyN3g47n3KCCMoTJVD2I
         eKJHzzsWmDZ+uNP5oBbwA+3V5AuVNuwG5oYNJScn8+vv+05VYrmc3IKi0k3g1e8jc5Sh
         WWrg==
X-Forwarded-Encrypted: i=1; AKwUvBxrtxpuNqgPTf/d1Neub1+Is/trowGJV3d1ZNShsXzZINLnawcm9S+lCXX1HSJoZQe0lnJJy/r48VCZ@vger.kernel.org
X-Gm-Message-State: AFuF++m+MUKpyj0VnkJCOc/z0rkAToactFmF/50ZZVhZKPWYaUAUKoTh
	Kd0YaRSmXl3rXgi23Y/yhP9kGNUObt7iQ1pFZp8RcY8+fr4+d48es4BDEDPCjNs8/PR5XELdtJG
	agVWfYdon5Py0YLjyyW+VHvUiwuSlEqjgUOTjBN2nT/7BAsMQd4xCF6RU/QvxKPYJ
X-Gm-Gg: AYBFou3s6KNqnupn+F/rMUgab9Y6BCmcOu9CZgwPZ2p9OkiV352na81yNGUlqVA+SUn
	vvHvcVZgnAx3rA+cedmftjCAoT6LTNPyUOp1CLfT8+y9kxBXQeEyyBYNRNMZV3MY73CiLU02By0
	eBt0usNht9FRhqZi4kP7BBFVywuFQhr+2lW7/aqfqjvy8i4Hen2r5rxNnCQDf21Ti/C7CTiaYBF
	OPT8X6yhsagfvi56/wWP9S1S2SgYacrcRxm4c3GDJOJMwMVoE5ijArvdb/XY0xcdnZHQH0/hsT9
	fVu10RGvSrsQkwHZko2l5pttmUYwkKq+kH13S5XKGL0buyuTI32pNGJtgoJd+TiGQ5hlCZZFVBh
	80hXarQXM9BBKZ874i5h5Zj8m6xgCqrqYOrhG7ISRjX4Dwo2htRu00AqCkK4=
X-Received: by 2002:a05:701b:2303:b0:145:7d6:6b4c with SMTP id a92af1059eb24-14507d67594mr461250c88.16.1790239700332;
        Thu, 24 Sep 2026 01:48:20 -0700 (PDT)
X-Received: by 2002:a05:701b:2303:b0:145:7d6:6b4c with SMTP id a92af1059eb24-14507d67594mr461231c88.16.1790239699621;
        Thu, 24 Sep 2026 01:48:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f949e51asm12512271c88.1.2026.09.24.01.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:48:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: nord: Add adreno SMMU nodes
Date: Thu, 24 Sep 2026 16:48:05 +0800
Message-ID: <20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX78+FdWfU+5V7
 /ER+QQbttEIm2A2j7lNTRmt7A1J7aUf1v/HChTI7ZXuxN9i9UMmyVmj1BQPgHxVi6po3dElu/tK
 0k5F/BMwQvk2weWXk+XEFa3VEeFPpSY=
X-Proofpoint-ORIG-GUID: jDfhWQT5nK8RXY40yKX8G_r3VcTSxVVt
X-Proofpoint-GUID: jDfhWQT5nK8RXY40yKX8G_r3VcTSxVVt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX2/s8ugKj62Hi
 jdj/7O0PBXwhXveqa/dDJ9MS2oGkA4e2qAtWLezGJHoEpgN8Zy1kNzCj9r8UX/Z+/opCamPgEY+
 ig5EKJv+y7enUH7xjvPn3MYDCzkRapH5mZUi8Ge7gbBHOQWC7oHYAFuS2WOamYuD4QUFMvsZdGQ
 fGWT622qcND9PHiFIE+VU9ZmlxVj7jc5BFz46+OXWTxI7HvZmWXvLVdy7dXA2/RTWODtxNZtFsK
 0XJIYndbdf3eO6Hx54syTetncwSXkalO2gN26SfM3bVhW0HfYBQd6AuW65UhPvvDgEOQZeNUNol
 640ohAXs9b7UDpYUluKNrfqwUzV9vV5Jhc5XzMiTLuOCd259aE/JYIuJ/evi3ZFSQM/2YNpkiS/
 G12dPHX3KRwZu2kAQH5LjIx9/ix8sx/eZ69AA//Rhw8tmDCi3OcAhiPN6XTGgcDH/zXK0NmtUNh
 0yNhD8Qa3kbexLJMeww==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4e3d5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=isRZrch4oIImFiWRdXcA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240036

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.

Wire up the gpucc clock and power domain on both adreno SMMU nodes in
nord-embedded.dtsi for embedded Nord variants where gpucc is available.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Dependencies:
- SMMU binding: https://lore.kernel.org/all/20260902013858.130887-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Fix adreno_smmu_0 interrupts, 673 -> 674 (Thanks Konrad!)
- Link to v1: https://lore.kernel.org/all/20260922111354.533902-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord.dtsi | 74 ++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c30..376ae1604175 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1518,6 +1518,80 @@ tcsr: syscon@1f60000 {
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

