Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168653AB28F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371944; cv=none; b=FJrbWa76ILBTz71cvZRyMoi4Yjce2DxXXBX2jmwNKN1b9cMjCo0HaeGLe1wSWRdPa5wJ2Pjq3wtWhbV6SvqYzxoegQblT3J1Bpn75eNkgN4dRRwgjpcPVAJwZxaf30j2QItq35JGI0c5nsSyHg7rrs1Nx7OUQHxyXXcL57f9TXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371944; c=relaxed/simple;
	bh=yGsij9VKWI7rB/vT0J8nK7LauF77nPjz0MJTy7VKUkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jL5XV9YFlGlVqqHcGwfqJp62zAtHSRvhCwG9NFiYp3PGHGPzjBmHYqFPFBDlpRMm99u0VDBzQ2mVRGZmKuv3ZjbUlhgVDxWJAR+QQoDiyLCqpYzuq/66ttYZ3XPup8c0yLZtP5mmjXJIa3NxqKElllV0BZvGDQzFPjcSmWUaEeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9Jj8TM6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SV//GwkM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9Jj8TM6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SV//GwkM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEJMo1639917
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=P9Jj8TM6cAcq3H7r
	wjqj6sSGBm4x3syZlkv6YdPpN+WR7zgnw8sn8rttUqC8w+Ux5lTJdlrWiOwLZX60
	soJUYBVsW1d5qsqErak8xliv9nP4I8vAD1rIpJIuNhCyPGc9Brsy8UORhWme5eFt
	cjV2JXrvgTo+VOMZUQkf6VWG0ZWG2W6ZLDWGCx5C8pUYiYY2qsTASxr0pqN53xxh
	EAsijqCklh8y9tobAaph0fesmhXZeKYNeRpUybL8eGSWyxeD9Yl/VTnFccc3ZmvD
	jm3ONgl0G53kRZR9UK5x7XfLhyHivpPsOyBPqM8pmanF7CZFYvyqTpQIVK3jpED7
	wGIoUA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2u45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:05:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2547681a12.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371941; x=1783976741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=SV//GwkMfaSXoqFZ07IVFq4Ni3/qZckRCdeo5z1gOMhmUogn//a3JTClU6ItMAZhiG
         4DHQ0tQeBYZEo+bkcNHV776NmONbmnqurCFF5JVZ3WLkaNYKO7BKwLh0YuKxxzx+Ok+E
         1lLHqnssMgAgMwESaPnXWDNchOdEM+wVMey0R6lm54RwFnyKvOqhhCTKIGcKAeJpjeXc
         b/4THJgT2Xg3jknCTAVKxiw4wcixpobQSBgSeVj80aNUzVHT4KeFzYjtrULNiVmDxwa/
         OfPDzo9tWs77e/0Lk1VwqyDKlzA6xA7IrpHT32JVXgexoxV4Zt3uq4uJiRSBks8s2WLv
         M3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371941; x=1783976741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=kfwCEoz8CU5GvfLqJoZGTOw81G76gmAOdkg6SmA+QJGhoiGwqTrf8znju4xy1A78k6
         S+qXH5pUR5UmZk9f0+sfHMjC+t+5q01lp1nAAahiQC/4hTwrI4bR1j0Yh/ve9IjKRh8H
         1tNjGjRLtO10t4uccAZrmi/wfNMQ7jH41jkL8VVsNZW2XJwgNa7fn2GqF+klAz2K4oCR
         9OXBLd6FOA0Pq3B1nowE2QQnG73PU+iT382TeX8PTVF0dIdI0IeFGS8Wf9BdNmFMwX2e
         A9tvTr/yvm97VxeBVp5H1IvPyIFSuSIA0XQOo9v3caaYBuFmwk+8oIXMly6Nl2gUyalh
         z0oA==
X-Forwarded-Encrypted: i=1; AHgh+Rpmr5DzzOyO/oSBTzFwZYE4uuohX3oiOxuoX5FEnltminQIsYXcoBP0HJ7JYxgzxVijD+xbXINREhZY@vger.kernel.org
X-Gm-Message-State: AOJu0YxXf4ieJTKvnXbY5UyAT+hd8ifVDQ9YS9LkvIuRpdrRA0HpFGBe
	kmTvH+EPWzdU1HPps+VKrnKe92qQj3shxPt+FQM24fWMzLJhkbE/wT/vzbaLagDXYhF61tZr/QP
	wKiMcyCWbURLtzoyMTtwpZgMLD8mCLwsWw94pD0cu/9nai7PIPYaFqYgSQvEMAfLg
X-Gm-Gg: AfdE7cmentcZNsfupFVM6NmruJPJVnuRqr2KEWiCWgB6QVGg0DUdwA6SKSNWConfCCM
	ikgkct5X5M2bvdXAOcTPJjH0cufOj3gik8oqJEezDObA/pNYA/aSIfRKhGfniwV4qBEGsmmMtqY
	47zOijGTrunWCCD4vNBnaX4v7aH92HwDrrnGtxnCSnBkz/c+7vdGZZMg7qTD0kKxUInShxb2ffC
	pNTUYhoEoafSFWLfymde0SuzSBx3F57jC2N3oo1T8Bdi2xp9G+NOk5GwflWPToekPP36+i+2peC
	+dRWpVoTzMNuqRGN4Q151hoZJfmcVcu6DWTEzCCguXUCHWN3yptL8FZW7vPyaS5I3aeNu2UzD2Y
	ctAdFj47wliZ8CSfGOjtzN6phW0ihkc3PqaY=
X-Received: by 2002:a05:6a20:6a07:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c08ed5762amr2779508637.15.1783371940765;
        Mon, 06 Jul 2026 14:05:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a07:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c08ed5762amr2779159637.15.1783371935725;
        Mon, 06 Jul 2026 14:05:35 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:35 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:36 +0530
Subject: [PATCH v5 4/7] arm64: dts: qcom: shikra: Add Adreno SMMU node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-4-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=1898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EYNcq3OFs2Ql/wREKtEM5ji0GMxwTnKnJ9RpGAjMe6E=;
 b=DsMZ8weeC1FJ28PI4GwkWbJKDNIUqDgYuPQPbdoJatJcqoYjN0mvkvVRCXgkFLpEvRW9GGIIr
 imbpv+kai9SDEKXMg7NTAHIPZgWtHd9Y91kx+N0s6PgP2ncPgsQzm6p
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX+93qwEza6Lb1
 mmn3GHx0KEfTtU234Wi06+I5zEdzijAkHk7ieAvovvednEbgX2a7AJ3Cfbe01vI15lESm1C1/Ex
 alv/FZa+qtZZ/Zr+04DPUheJdq2nrisiUv5SW64QD73u7hiZAv/LaVK7uu4KAvbJQcbJHmURFtK
 Q+yRzLDPiFN0bv2rbbDQXeQnRo7hCKzM05RRM2OnCPYxLf0MivyMBJFAWLToUMaxtCTObXu9EH/
 uerVemmnLevT5ZRkb0gnH92u9SqN1j4Y1MmgSUocDHC0XtQ0a/9H0RkhFE1H15YVqNE8rFxVY9O
 HovMQKRZ9EYZsoS/2hUuQp89G8m5Plf1S0sgv/OY6enGX4V8WA1bru4z9J/tTcwgyG395TRZSZh
 2sGNWmfYTLXCW+fpWeCajn/8X1zvzHYm7MRfJVv/Sj6ro7lqj3Ug3KGD/DvAvjqinbmZ+FXMJEW
 Ek9yhB4fJfWA1Pc/mkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX2OWwhHZuJnre
 aym9f78WyGL5zNJEaMHSBSU+PBQ4BVFIetguyugR5FrqkVVjsq5F63odtkw06+S3w8ukldT7ztD
 LzbJvlNArj2jbBJXFKHBub1rzg24e9M=
X-Proofpoint-GUID: BECnMDSjqm1yZw0gkqTtarjsxsb6e65n
X-Proofpoint-ORIG-GUID: BECnMDSjqm1yZw0gkqTtarjsxsb6e65n
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c18a5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index be443b362576..bb11e832d9a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2005,6 +2005,35 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@59a0000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x059a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>;
+			clock-names = "hlos",
+				      "bus",
+				      "iface",
+				      "ahb";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.54.0

