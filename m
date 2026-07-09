Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11ED42980C
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600634; cv=none; b=dsyzyrKcPRq4oF6+IlxcF93uEL/egj7oJ9LM3ui2LzuQYdknTB9HsgVU4qYiRQfNj4rxZgFYx6gzYqHMOMZ73bel/gVKGnDQ/lC4Jltkr3v4jglx22S3hoAkx7COnTRyR65N3468wieN1tqa1MKkrSsNXMCk0UmpJmMF8sPL+H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600634; c=relaxed/simple;
	bh=rhePzQT7hlcIh03rDOoCur4a5l6fqH231Apw1Cmf6GI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHwmeKxiCPm8Ac5jbc33QOBQw3mVpqL4b2StP6lGG08RWgS+YQkG+kdI1o4LKvS55TktaGCE27uX0Cplkw0WoRGoLxcoPJ6q46sBFQq/wgggzg9M666uUmtQmeQQiCPEw9HAoS1liJs2uJxGeCeQONkHuYCmIMyq/ZEJGlXsF6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ4Ox+TX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+cxejsH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJ4Ox+TX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+cxejsH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNIhC1716686
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeAWq6sdQzFZ2rcuIUpEUIcqFJLm6eUd8hNgdnx3uoY=; b=IJ4Ox+TXCYYlsylZ
	RYP7HG4J8n9p+FIPjYFpRR6Sjta/4UOZcH3ZOWXhgmxUGSKtRsKsxjXqc+d8WJD2
	BU/0Q1S2LqXurz1N+3TckhHSs217GI/2AoJX+V5wgpfKTJN4OuaYO1TNB7akZV2c
	hQv4jxqC+Er65SSH7mBhmxIDwCl9AZDpfPzAFN0LQWRe3uurNkiL8WVr5Pf2ihpx
	hT3GpQWpOtDxzI68JgT54tWUNrGf+ADsoEeP3po73og2hfzlEpYb//8CnzypRad8
	PY5Opgw1mixqhfo9PPANUokycqOF0j24RPpSWl1CFEHpHonuipCU3GTU77aSb0Ah
	HTZ1NA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vuuee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:37:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso18764365ad.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600631; x=1784205431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QeAWq6sdQzFZ2rcuIUpEUIcqFJLm6eUd8hNgdnx3uoY=;
        b=i+cxejsHnASTvxY2sNMnvosES2uX5iYS5P45FCuQtVS2jhTlNrDmJ8Cu+BkuiEfCpt
         NecWVJ8ldLLum/YthiFKCLxiv0+8c+Az4WuGOSZYRmTOa8Ex05pcrUF00/nLc3SvGRMr
         XFPa9Fd5Zr1pWEsGWdIeQzMCHF3/ZNK6nKBr2a95GkuioQeHAI6lpbpfKrY1UNeXKX+d
         CaWE0drqA08wezJi0ZyEfx3RuxUe/XzbrXKhFydEsETu768Tw0/t7CkklN7/es2R0KMu
         BBzNJiKcIwSJViCs5OGkeGT/x1XnQmAmXVFq2FOaABxw3XccNC3poIGOEGiL3r9t7pQI
         aG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600631; x=1784205431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeAWq6sdQzFZ2rcuIUpEUIcqFJLm6eUd8hNgdnx3uoY=;
        b=hH5NZUuHShcQb2EmhfUpXDWNqMZ6fpsa/7+5ugM0y7ygdr2OH9sFb+BwAqacqJID4j
         0J3HSWVwu6vMJBtizljJWFQJtdUuxAxa9yzEAlcxYJAg5Z3e5MBq9L3vgJCgaKpP3eNm
         C6wofhWn5wGZCdy9kDmFIB7pV3bV0/wySUsn/iISaUztNmnyX4EY9amS6HvDRU2eC6xD
         cVmpneUgsjJMCaCPqblRjF54g9wqfvNUDzZfWmrW/D0LUU4Sv6NV3x069zASWDpA3Pvj
         FVOODkFijrX4l81KiG0aAEjs0o0nOiCWcrftnPpH/Zwp4xNRtSwz3n5JwS0RzgwVOd7V
         8kNA==
X-Forwarded-Encrypted: i=1; AHgh+RrRsCIuJ2QzCe14dJMDeJXg2jiT4smS1LjRB+ksgZhOvSd+grBSioCzxzYaRfpImxVB4AoMKpKJxKaV@vger.kernel.org
X-Gm-Message-State: AOJu0Yza4PjfjRD3aP/GQ0+IyNGlhnE7kC9JrSIakuFpWfeqnk0qpm0F
	PS331Nh6UAeJMbtBN+J1TEpvXku2ia+qfI8FfwNhDiMn2hycBGXZ0XO8+nbq7j74Uh0yyqueuHD
	VsgsQK8QeghFux8IERpj6UKCHxpWe3DdGt4W4E6t72wnSfxdTb8QefSkqIu/1MwOu
X-Gm-Gg: AfdE7cl3diNQ3QfKdP64ss+y2tjZdgC18H2ijXZuWHLD8MtMmUx4FqMhSgTNxWGGH7V
	NRCUVG3H2ehZGqFy9Acmv8Qgrnjubn7szy+xfLCQP60c/Pho6BqYlGKj7stpa6pI9Pyxe0S6s/P
	6R45cLdmvrc7KW5gaGeyUKpPiw1i0tVWkvdsu3M9CSl+e3qX3RBohzhyXl5CBracXmO8BvXl7Ra
	OIxJ5bSkzUqm4X5xh+qREaazzhX1jb6t+xmJ7fpj6EFUqCi8bKfI7NgLU4Hd3WN6IhcUSAB41Gb
	VbtqGndUocD9E6OUyiYlM71lNgeR4Ljtbls4WsCohncwgyVg26zt+73SaUzinCdfpX/Tqudn2C9
	ImkR1rD4poatdHBboDEz+QLB9r7ko22l2ao+ve91RUqF0hQ==
X-Received: by 2002:a05:6a21:485:b0:3bf:aa1a:d2f4 with SMTP id adf61e73a8af0-3c0bd0fa17dmr8579100637.49.1783600631416;
        Thu, 09 Jul 2026 05:37:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:485:b0:3bf:aa1a:d2f4 with SMTP id adf61e73a8af0-3c0bd0fa17dmr8579061637.49.1783600630967;
        Thu, 09 Jul 2026 05:37:10 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:37:10 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:57 +0530
Subject: [RFC PATCH 11/11] arm64: dts: qcom: sm8650: Move Iris IOMMUs to
 child nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-11-72bb62cb2dfd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2240;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=rhePzQT7hlcIh03rDOoCur4a5l6fqH231Apw1Cmf6GI=;
 b=PSofLlEVPZP0yPnLVxKIhOWiOv4MpHl/hM9jyNuxc3BfUMVEEFt1Bt7aDOAv3AK5okRAIHNAw
 GQMnR5AipOpDjLQZX+Nmpn96vezw46HRbG12+RzOnBkfo1Pys9jWEiH
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: c1o3IuJaUFSOXMFT8kGBpjA6tyl3rDik
X-Proofpoint-ORIG-GUID: c1o3IuJaUFSOXMFT8kGBpjA6tyl3rDik
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f95f8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=Q09pOjM2IGVQiUKsHggA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX06TjKXfaZDUj
 F6aixnIS0wPe7KDOHGf9wJEbRFDBXuyz2ieiBT+nguaOxcCBVQ2i78RSr7i9zAQ2qc56ysDmd/t
 pCf/NMyujcCV2BZ2WPQkTRAx0H4ttd19XXxlp3XhKsOu47nLHYDNQg6o2V/j0Zd+v2/BvSeyFMm
 5arASls5/zUtslZlOIM2MnKGFaGv/RIlRpWr2pu0LeolTWDQL15wLdE9aKz1JtBfckqAeyfI9v7
 kYQkBOeXkKJXmTj+n24Zg6FTML1RzosEBk9n3eKFFnVdzW+JTm4KsKdfgHqnRErASL9rTpbbV6v
 SUQQMyv/H7p66fKLHsg9EO1HCk0JNpL0cCfaemSLa+heXGSVaxCDC3RuBMexPASxX+hP2Yt3xOX
 mUHPRnS/d80AwsIPHupZisO8PdPlgJmYdIQI2v/D0ey93Oc9hdouVgHRBizUPyf8ZhA7TQAZLxM
 dgEXnVVEeGfyejN0QZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX1i1bgQPEjX6L
 fke3V1GtTiZChBYgOLgrZbdXOiVmGzQlSslt6GwCZPa6fxmdBiR/+bS9z1bfkfl5JzQJYy2ZD1+
 QOoEn7xqrc03m/hKuO3WwFpbWx/HqgA=
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
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 447b788fcbb96efc8b26a52a0606bc53dd29adfb..f9c03de1317f1c6a8e52bd897997ef7bd826926b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1849,6 +1849,10 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0 0xff800000 0 0x600000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5219,11 +5223,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5231,6 +5235,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

