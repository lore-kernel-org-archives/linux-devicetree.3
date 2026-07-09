Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0260C42EEDF
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600619; cv=none; b=pFHe6dZt2E2Wik1lVZPZZJWFGfurmNKnOoki8hYtaA5MW552MDOppA3OnYMH6kPrhqi1CwKx7Qanof8+V+CPxLm+Fxs5ekEfncrwmjSqYVpDQUuAi8F2Xd5s1JsAlBAU0B75Zk2nSL7yuGnQ6+wadrQe6a6gZQysz81b2oRTh+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600619; c=relaxed/simple;
	bh=QaHAkZJ8tmnxH7GZ/3qSGhcx2jd/aFQMRWFp8BcP4Ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwmL/L5FXJqO3JejdCWLOcyrgsnzEYndHC+hDYRS0cAqbt0B4y2TCiZ+4Z6qKomX2axA1MMNGPi/BheWJmMpyLTagIC89+md9CEaImV0vt65fZURkQkW6/irEPq9KKvpGB1Y0QzLtiqIybZHFd1j/GscFjkd1tH99Vr9nkcz+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YFfLM3Bs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrBpxbln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YFfLM3Bs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrBpxbln"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN7LO1537222
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JCWUdWHuFH5VAb9tntnMCJph6EXPxhoAx3Hh+A/qThE=; b=YFfLM3BsBUoDocDn
	cGGwP3Rzeb9wPuPalewcG4Z6R8KLeoiYoSFmS8HD6APCEiQ5J7spDz7d5O+TEiIU
	aq5xFyAiIHpkEMsGTrW7hYHjxnkTmXhlL72pP6G0mFrhVTJw/LUHaZuAqFl15JHA
	3AoMPmJbz4qVKpF+TmnPkTv7wXKJZbCrQZ3LhJIxQ1GQSQjcp+3ft1bosue4z9JM
	c/pQg7CBBdw57gPxM8R8H8Hf/h8JW6D3m7EWZi7Twx0iPat8i5nvqWL2XrJrWhaV
	vgwesKWIN6LYfvHKcJr+Fz1Rap2x4nI2mmSBdhuDYvyF2q2loOHVIAAHg4smlN1r
	vwkQ7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtpkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:36:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3881937456bso1710040a91.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600616; x=1784205416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCWUdWHuFH5VAb9tntnMCJph6EXPxhoAx3Hh+A/qThE=;
        b=SrBpxbln319lyaLLuEC/4ZYU2e13weIa077AkWys8TmQU68R+PrROnWGl7XhN1yML9
         KQ0RUOXqPwcTfDDW4/gSH4QQY822J1ZS3N5AzfNVYMlf28cLCCdrqLVOEnDvzWaZWanv
         w5tRjU8LcGHIDlu51R+FxzEuNE7juH5vEqQXzTQMF0o+OwO0kRWmHxo5W0wbR0y6YmsC
         W7D7/i5RjZb3jqfaCRKODk8G1UKIRSftNkPXvNWSmMWoFXq1hfdsISmnYAiux477asqI
         +D6yu/yX1ijoTP0SK075ZBKWoc/8Lp987lydG2fUAyQSbsHaPklVpmaXeSFCoKS5HXk5
         XLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600616; x=1784205416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCWUdWHuFH5VAb9tntnMCJph6EXPxhoAx3Hh+A/qThE=;
        b=dmiKxWKae78dHIH1M/VGyPW+TeOot4WDzPWxc3/zwi9ZOfK9SRPdFGOsmm/eIBdEK4
         CvPc7sXhtlrWaqKDgJMqNygkQfFDvBhcZFcQOdXh86FKju+1Csixp/ZWPADhJWu0oTY9
         46rzjr3THs1VQvU0xzk9Q0Ifz3FwDRG9q3RzmliKUuNUUC4sDOMh59H4Q/O0DWtTO5YM
         NSjBNfilSG7JopAC1NtQAOjPvQ/PThzTjLspBOQyuP8dW21gpbFL0TJOy9i7up7Lw2O0
         I4Lbrxf/MiyFWXDLnqe8/gqOYdGTkOkRHo4CbK2lxqCQV/3FJYcH4QyB/4gtWtF4hTd/
         K9QA==
X-Forwarded-Encrypted: i=1; AHgh+RoAxeoojVfDBpWfYdnN+6yQY+GbR4WaTBzE9o+Wpssjsha1kfWLqxh0H3SxTqwHovO2wDhWNEmmaeNP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0JSK5hqih9Lpvxgfj4oTGn4cTw1aMWKN4L3v1vV+D7W8lK8H+
	fIKYKW3yoVuqdkQtHridQX3NpzNMLm0K69pbrYCKADGpWUpflvaIyJLUIqf09oZUpFSliZyuyFu
	EsJQTSvPPbPv2FUTzAhA6U5rkfAklY2NPAF+70PL01AR2yPoPd6a+SxgU4S91rZqU
X-Gm-Gg: AfdE7cl5r3XSviOIvGXZdHuNVGyN4VBNxF11mkI72vlEdRz2aMo2vxhqU6IPXAdCfhz
	9fq3iHv+Ks8/lztOXQtEXhJZdLFnXC6C4E+utJenvYkt8EEfBbLB/uiveBk5+aXS9yVZdW1rKXZ
	APBqeikwpAa8kqsvu8JnCI4qh7I2SnnlbZ+zaxGebcpbSgQwCJTfQnLAfkZGsAMeq7EMdd0mVIR
	ABRz8bcCJVoEoUu+GiiSJnJzznYDqeQKobz684zUFVPsmRSQ7ncl/K77ReWI0HlQDcqTUm+KMU5
	0nXt5Mkn3KdN2rEvCO6nkwTkQ9zRL2rFk3/KSD7Kx+c/GNN8CzXdzKdlq6nRKuXBzJsgRk1M6dB
	Zp+MqVY5QDsyz6AZxIHu6GqOWbaWL1GKoEQpEfBKVP6pbmA==
X-Received: by 2002:a17:90b:264c:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-38b74e2cf78mr2864053a91.11.1783600616064;
        Thu, 09 Jul 2026 05:36:56 -0700 (PDT)
X-Received: by 2002:a17:90b:264c:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-38b74e2cf78mr2864011a91.11.1783600615598;
        Thu, 09 Jul 2026 05:36:55 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:55 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:54 +0530
Subject: [RFC PATCH 08/11] arm64: dts: qcom: sm8550: Move Iris IOMMUs to
 child nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-8-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2869;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=QaHAkZJ8tmnxH7GZ/3qSGhcx2jd/aFQMRWFp8BcP4Ug=;
 b=6H863EOyVbzxQd65/8KO8vnuy9kPCf0Q3yl3q6BWV6RaKEHlafNOPjaSsC2DAn9/7+DDqdHzq
 uoYsS9yuwPHCytXpuhCDeAKNx6JiGBEq2CBnG0Z5OW18tXK2Cds48cX
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXzugklY5qeqmV
 ZYa65b/OmzwIAktQxR7ojB+gwLngCmz0xF2uUTceC5jt2bkL5jOP8OU9Eu0av3PypX+3RLDS7Tp
 NfAK7qLLKg5GIt4gdm6ROBQeL5NVv2w=
X-Proofpoint-ORIG-GUID: cUmUfODWntQQ3SJgA8yiI5QPLzZy2p_L
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f95e9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=GcgE0A2xIZuYiG_mR3gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: cUmUfODWntQQ3SJgA8yiI5QPLzZy2p_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX7xophQkplxj8
 IaxJBmBpjOvo/hIEGDiAMJiHP9YGHXzLGZxyz38NiDSyu2V4tWM0auVivHpc9i0/KMCTTOLTMFQ
 IICmWRGkxcGDsKhaQrg+lWIunayNEx7uS/dP5aufBTNurDp6wjwAPyNGg17PlPEoXevpCRxBBSn
 47m1mPHKVm6mlNrvT3LBHVyF/xRS5Shfe678p65pRMu1/fhYRxDw2jvr0i9zPWXKEbfEtYp+1IX
 2lWy6r2TrLfIG+yZ43nLPmiOafuKgDOvZJA6ORJouRGavoaVnHLMk1tY9kQE7tusS7W+WHFi35g
 4fENvIj1Si+ep1aAkSSxnNyibETJ+lFENTK0fz164mTNRgG4v/goqibm4wGyX+rHd8adrMcLYQt
 gIO67dlJIO5MJPzB0+MX4FcqptCfD2/UNcFmqssjo1R86c9TSxaCrPZS7wZMPKSvf2u15jQDPv1
 vaL4RoqO0h4SFJCd8gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122

The Iris VPU has separate streams with different IOVA constraints. The
non-pixel stream must be limited to the 0-600 MB IOVA range, while the
pixel stream can use the full IOVA space.
Using a single set of IOMMU entries for the Iris node does not describe
these per-stream limits and can allow accesses outside the supported
range, which may lead to device crashes. One such issue was reported at:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Add non-pixel and pixel child nodes, move each stream ID to its
corresponding child node, and add a reserved IOVA range for the
non-pixel stream.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550.dtsi |  4 ++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi  | 18 ++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
index f0acdd0b1e9384e684a90f7f49cf63633cd70d53..db0f539bc3d0a2e83b58b3929a05f0e44d9d513f 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
@@ -158,5 +158,9 @@ mpss_dsm_mem: mpss-dsm-region@d4d00000 {
 			reg = <0x0 0xd4d00000 0x0 0x3300000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 83136efb7724c3d74f9f377b1c8291d7378ac4a8..347d4a03b1ba419a2856a7c8ae98d6b26e90ad6b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1087,6 +1087,10 @@ hyp_ext_reserved_mem: hyp-ext-reserved-region@ff700000 {
 			reg = <0 0xff700000 0 0x100000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -3690,10 +3694,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -3701,6 +3706,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

