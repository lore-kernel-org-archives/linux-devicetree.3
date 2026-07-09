Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B4642E01F
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600613; cv=none; b=LPPvh37B2yUnCUm/1XxCsN3uDD/2FY5indeJM/ied0JArAVTvIJrbqXMNZmnDYAF/EIeKeo5zhS6LnQuDvdl3+0uu8ixiTVAX4AMcuncoAV2xThd1/CfeXobbjymu5zS88z5v9ZDlDchH4pQXJ/1MrL1TP7lJ6UcC+cHKZ4R1DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600613; c=relaxed/simple;
	bh=7pNcyWR/bvOSOJi/ZBGCeMAemrYecspLbz+ZjerCPE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hx6Bl/vt1iVsYsYlL8ey8ltrD6goxjALjPEcFwdYSvYF6Dn9Ga+ciTsH9yHFbrJOLS7FtTzy82UUW3FknEV7F2Gpu/OHDXXCAG3y5BXAS3A360VYvMOPo/vC+85qxS7ip7HW0rB6R7dAAA4WP2aHhcppS6LLaErMCgGoKZdTmZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fA8VosZM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/NSNFX8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fA8VosZM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/NSNFX8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNBrA1715982
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsqNMYfLEjMtluhTiHwVMmHH0XPzEU87rEf5NqEYUhQ=; b=fA8VosZMg1R5w4bG
	+CFCUtqfvSvLGlB3dP4pxrtemGeHxh9jyzX1knsz+mmph0parnDYKh7RN7KEx5cu
	1lH+iDlefK5eHXnKdhwJ7cPvckoBTjgZnBReQtC+llBbexELqyCDs6pyPS1JfVOk
	2LJxDMNR+IewPTP/yyq1/T0q5M+pOytdNw+78NKDqh612grn2MmWtC3uou3gQof2
	t5bH20ChDUZKUKpznGpV+WbHQLfoHqOlBAHYC40JOsO0ylEn7QgNLGO2swJCby4h
	eT38a9GnFgcImHgyrylBGqkM/JoOVKb+Aojj5dJS00dq06M2kCChJc9pEpeUUF8S
	9lYY6A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vuucs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:36:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84854c2f888so2004133b3a.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600611; x=1784205411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wsqNMYfLEjMtluhTiHwVMmHH0XPzEU87rEf5NqEYUhQ=;
        b=e/NSNFX8qEEaWob7HKnSt1F0E3yens3CyDFwJjT+w2ppdE3FGYcC9x3woTqY6oAaaD
         iH4NFCe6fxSITj8v8qecuvZTW1VQt0Oa3n/wesl9yTjAfNeY8T+jIO9NrBmXWtuWAxdG
         3qw8V1QGY8YerO/MkfA7eKFd8USpoTjxDMuHXfUN8QirLV0gRI9SRsAsdbw5x0HY4rtx
         aIKxmPf8+7LEBwW3bqglRiKHa9fJfkPgms9KnU0b9SBq+5uOtTJitARCR2xE4jrGhncC
         +3M29XSiccuOaeqScra2byVjYGu4xhdm7zRmcAtUK7WIIrurjam5eZKblK7hMYgLDOc0
         /iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600611; x=1784205411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsqNMYfLEjMtluhTiHwVMmHH0XPzEU87rEf5NqEYUhQ=;
        b=UeYCH9DzTCmBMEtwfvX37aqJu0kDSWQCX8oXA7mouXmma2y11+2Vm4gjpVOaashQNl
         2Bcv5CFFUv1nwDSpIfFtCXtMsmYT0R4Zy2x0oHNm7qmBn05HAcz+nuWJdbPBtxNNf4e/
         GF1+xv53E1+bFmWGMsuHTjCsiMPVo4RYJw4C4hBh3A9Dgb3zK3xD+pGSW3Zy5re1+T60
         UMJ+1/dmGXtEOd/d8amTU5OnNr15KSYykv4LQD8hfWh3O49M3IxyaXsvHFRio5JBhI6r
         t2F4nIkI5a2sm1/8FwqmnwlymmQQphDcmTdzGR1szNMPCZi5BZ1UqPDLpDwwc48KW3Mh
         AjyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4BXWJRqmorN9DC8tXprxzoHaO+3rd9VYH+jR5DvinN1dTK4ljFN74PROJchrS4sYvRIjJEZKxJBU0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx65bvNFL3A63+5eEiBA+XxWHSYxdz6jdE4bBf3Su8YIZ/mg/Vo
	CZfk3d1G3+EQj1xDhNg4zHagYdhA7IsF2JHJqLZxgtaE8vYwFFmvZciO2b45xwVw6cksHyG/YL4
	4oSu27LXet+W2/X9hRfMFLMWtM9K/YXTEGLxPokNd2WPTcsgALMWrV51q4jJ64OEldzWLiY/Q
X-Gm-Gg: AfdE7ck8O8R21qrzV592CqKmn4tMKlxyGTvkypDtxPcn3tMKr1jWmk3pkSMHvi9Vd+f
	y6z5hYO+OMx5STVfJoyVpZanYUXkKfENZMO6LbD3RtHGKrkGxzIxOooCQCRMM2tRRHEJI/cfhr0
	b+PxoxIxn5klFSESmndP7EJwQ05kTHOxhVnt7rwNf3dZbnCGS5OvJHZrGl4AZz746Cc9MHh1YDa
	rLEJQUXBzlaYDr+bzFeuIDqV2scya2onby2Bh1Drgxv9dYe0i5C5v22iQQL9Ja3rbN0Eb+Zn5+5
	8YaXsaxn+EV8tYM9IpW4gu5Wu56qqVPyGk/s3uv3+9LHeB8L+ZXHY/pdXAGWYdN2/2MjSGJprVj
	03jGgB81yczo597EsfZDPwxX4KeGlNP7RDfcO8X5AcEDB/g==
X-Received: by 2002:a05:6a20:9595:b0:3c0:9c19:65ac with SMTP id adf61e73a8af0-3c0bd3799cbmr8729142637.68.1783600611072;
        Thu, 09 Jul 2026 05:36:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:9595:b0:3c0:9c19:65ac with SMTP id adf61e73a8af0-3c0bd3799cbmr8729076637.68.1783600610261;
        Thu, 09 Jul 2026 05:36:50 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:49 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:53 +0530
Subject: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to sub
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2280;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=7pNcyWR/bvOSOJi/ZBGCeMAemrYecspLbz+ZjerCPE8=;
 b=76iVlwQXeP1yvL87CiM+rjtIXpO5ic+HGNqgYH6l7ne0sclcsV3i+3Ip3/3R1y/fYawpCFUkZ
 egXUzRIpx4nADaUe0k+OQIis6iP6fe9/LSWNQ6SZqAL2eg4A9oTYTGq
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: q47w_lFOxHTMY92WixSqaOTo-dZ7ORPc
X-Proofpoint-ORIG-GUID: q47w_lFOxHTMY92WixSqaOTo-dZ7ORPc
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f95e3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX7uOyGL/WBrbl
 IOxplhcyZMwCIYtdYMQwFcmtegEZMPSaxPpt9oAy3IXuBb+YbzEEjsBfF2TxdYPEXpCN/KlMZlG
 fVahM2TCY5//0wsr+aL9Xa0QogG+lgN2GjHnH7ZJJ2lRcxSek1My8BqvW2iuHmvD4VL13UC6fX8
 xrap1vW2UBW5K1NuuN/JtG0EdHbIMq2Yvi/8v7KTUZAX4rZqLxXzfGrW1K8leM9gUb0ntAGASJl
 natZIH4krUNTWytq05WtiLGEYPqbUERj8U9uk0igdnOyBs0m53hULmUZJ4g+Ak1t9ZevrnWmoqp
 NeiCs3RiX6hA2lCnCev7NjsjZ/LCCljdUuUwgDYWQ4xP4BBTJ9ZywIoOl32DT+w1xs62HICIVcY
 jxt87GBaBoq/UXKptsQwV95czW/xGW1mROOj1sekvcF47vgGtyR/hBnwnCkgq2HKdzy3+1v/lcC
 I4kWH33odSyGzyvhU4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXz7rVIf5PCgsL
 k01nPZtDLA45n7ElROcgAJsjqP4tPVQMZNwhqj7b9fGZLBRXWIOl1mSaECChq9I/gFQnvm9zo1g
 u1eUZqZKcXp+m/BHXRHHGamAdFYqfmY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
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
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 60f485a4892e062980d01f0b930af4b02f36513c..a2baa2c9f46dc19c3db11dc784358223a035475f 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	qup_opp_table_100mhz: opp-table-qup100mhz {
@@ -5435,10 +5439,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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
@@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

