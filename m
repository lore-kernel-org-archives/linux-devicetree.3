Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A347011C
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522232; cv=none; b=CXh1F1JJi5i9Ty91vsMv5KE8stOtGfyOhOUBckJZoXEk1PYVrlmGGPA67HvWAWcJJKJopasNL00K/OgJ/T7uE2C4GoygLKUKGyQttubGEfOvauNTT5hWCLyf/1apHefyym7ogUmdrUErYeny3qeGoeUKZY5M2oafG0bDaPOHocc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522232; c=relaxed/simple;
	bh=Ylggv5ukM9cL+Qy7BuVA8yvNM4fwEAff5bDtks1Oxh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsEwjYlP2ZRi4A0Lkl5VLvK20vZKJG0nIVYroDP7mXw+yb7DzYX0RShQpBSBmbC+CnCR2ey8HIQBILaTBN/h2dOtPtXcih/GLGEJKFGDOrRurVWVaJxZ0qruKR25/LJ1mOJsXyWRe+dtc8x1Jnh3zW4MbOjRHUszPBykMlG3WWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KACdZtun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q9QTO2sb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KACdZtun";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q9QTO2sb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOiDe702241
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VzhVX5WD0XnAhIfnqoRt17YMyLSYbQFbZtW3hEYJn9o=; b=KACdZtunScbY3WjR
	ly0OgQTN/c8pVWn0akOLzuHG1kXPhhpvYlxWXu4vT2q7cYuxNsypdFteYk1XS/Rj
	KjHxPq9jIXHtEe+mFtBe4mr+wkPjXCbYEe8haKFZcB/z0V7ToOBBKCJjShGRw0US
	YuL/VwXQP0zawVayFL9+hN+uDnSbQnSJgheJxzHYN5dFXqVcOb3J1Ev4QApiWtnu
	bLBMC/GkONPlibOFmzg5JFUosVtzTQcX/Z4qwdARnBFr7C2N6D2ZHowrP6uvdzJZ
	Q1fBOwPKu+IlFzPXMl/9LJnv9An/845Ic4WCK4yZRdTbCAN3lJ4w/+ouaBoQ9e3F
	qJzqkg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u1ucv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:23:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1472646a12.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785522230; x=1786127030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzhVX5WD0XnAhIfnqoRt17YMyLSYbQFbZtW3hEYJn9o=;
        b=Q9QTO2sbMRmtqZSdbQyfG1ssoncIVsRpl88xjgocOLL4FjrgIxrd5ax//hRAqi8qh3
         UbR9PnZBKPFJsvKT23jQh4YYhwarpvJ3KQQ8NaF9VmHhBPba8/qw0QnTgdwmJTJRPEa2
         bYjTXVGrB32+V6xRWdFhvpaXoQ/wUCR82R0LAku0BgzuvcwKlZ2EVqtfQhBTdm/u7o9T
         EUug2XDeIa04RWoN+CxNKHIngjlqZV/oRo5EC+kOiNLzy3nmFnwZYH9Kf0GjhY72qzUg
         Da0pGRoHSmKW1olyk+QJKdmNQlvWGEaFtrGnZKwe+9z5xaoFyP4cHibPMSGmkkk0V1u6
         DSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522230; x=1786127030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzhVX5WD0XnAhIfnqoRt17YMyLSYbQFbZtW3hEYJn9o=;
        b=QHztkI8JUn4asiGrprlE7YopNyqR/HqkH9OphWbP5iZ+nNiweMiWGJRJA2bmBfHxpu
         3FFqsjyp7cXwuBz7cKD0I/99FvPFuDZVjFnCZ5A8AeUdJHo6KzyPK6Uv3tmSMTKdKA/5
         F+jOighb2GW3UJkgd9BCDmbajc9syVt+sTuCaKZsD9KFF4BCQ4Tv1RV5R0A7BX4RLs6u
         c61edLBYJDV+MWocSsMeob8jWLVgHQcapx/0qaMO5SzX47yCBOLfGboWtyt2Ohx5P5ir
         w9UhkZwTAj5fDjG3ytlrwfbwOAUQG7yQYjNBdar0xjo8k3YY4E2okWYvO3A7cnPWr9o6
         IEAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQava3T3aGO3PA7YYXlleZgg0G1brLUkxaVO6BpMoK+G0NIz9WulvRXaDkkTEYhqIEF1CDMh3tccic@vger.kernel.org
X-Gm-Message-State: AOJu0YxaALrs299gkoaqA6n/gK5I207vpnLiE2trLu3eeGuilEPOX5Xd
	ElI5x2e3uH7Ws7iMbPS2NvAfNUL0Lw94La7dAJDC1zkj8f4doOpR98gBX04putRRjXyxfNvIR30
	6Re3mcTRm1sR6I2w/ujJCjUzYN1RQEYyRbDpm9GAirtCnhiUtnuqiA8dGZYYFItiC
X-Gm-Gg: AR+sD134keam2TN2Mmd/NlrBTHEBFKp37Pinmo1ahdN5DaNe0nIgwHKu0alQ2wvJcdZ
	TDAY+scqpEuxDXGIq1B0X/lEw8p6bCxkNSI2q2WJN6NAitlD+OeTbXDirPtGWeBlj0d+SHZJu8M
	22WfCCio/WKXtn3zSw+4w0aDNpgUF3+0LbbTT2mQhAUduv2XHc9VEgtQfzAHOuWKcpuh89a3ATl
	N7LfUPmRE5we+uuSxYVoH437FM4MNyP7TCiSNhmghcaC18zDP7WnihCfdfidKgC+5z8oBD/Eiq4
	rj+6zipRJOGuH/bluSXpwhVWTGGSCj2jMLw3ZmRNd5bYGjhxS35frOJD1uFH5ptLAKI/3//WEw+
	yZ/QIslLIqCzbQhfxlZ0QlwqNWimn1OAR1aI=
X-Received: by 2002:a05:6a20:2591:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3c92a5d3558mr817727637.19.1785522229727;
        Fri, 31 Jul 2026 11:23:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:2591:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3c92a5d3558mr817708637.19.1785522229301;
        Fri, 31 Jul 2026 11:23:49 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm7203089eec.14.2026.07.31.11.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:23:48 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:52:27 +0530
Subject: [PATCH v2 12/12] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-vpu_iommu_iova_handling-v2-12-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522138; l=3736;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Ylggv5ukM9cL+Qy7BuVA8yvNM4fwEAff5bDtks1Oxh4=;
 b=J/81NlQ0HTG3zYB4u+otyNn1pTWp4eMXgVHr2h5/hboHaAJFIDc4FrrsBS5BFTm9bCTQv1E5A
 47MQ/1wRgikAMTj55617cAmwAxwm6EwsDa6ncplR1Rqu+jh6gFc0F+Z
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6ce836 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8
 a=v0Z7u7uCyoCEKL_A5NIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfXwGV16JeqaANY
 4uCMIveXnyIXAlgGsmm+yJjW7M/ohSg2O9OwCuan4RU3zQR9KvHMAOtxiSKym521i4VOvkPQ82A
 z3t86N0+un7YKHwSZ1SfpJdugpFzkRInv93KS3g50usbkaVjLyELlJumkafimiBSG1hN6rMSDa0
 iF9mPanCFLxBz6fiS4C+ng4zZMg8tS6ilRPU5iUCkXIjqvNO7ewlHmYIb2+UWdy/97/hGzXh44m
 iu9nPJ8TPQB7+wPOiHX4IFbMeZuFPGSq6qtqnTqK4jUTjzzWR0ruaV5HoWBfwLTz38RHrqBu/E9
 gl4NMDK3fct749v0gbl5g7dujWFhkxOeoECrA14H4zi3JyovL3Lj/20tLaQEeHG0EmVtivgVKgN
 epPg6sF8wikTvszdhYZayEOQOZSAdjRjFJ57nvW/YRd+zV4IDg5/fMYVqYc2hYFYEgEs4AEZ23H
 MfgzXHCTB8cuYDbWEMA==
X-Proofpoint-GUID: 3ACtf4Dh7iAnR6zxCUX4G8oBYZy_Vz-R
X-Proofpoint-ORIG-GUID: 3ACtf4Dh7iAnR6zxCUX4G8oBYZy_Vz-R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX21CXovnCqp1J
 wnN62NHHiomi1pF8HYTuPwuem91qgmreH9XvchuPuNeHF//hj5yG/NU9yWSUHdVFAuejPE0ydNS
 7YPOVZpvNZV98FI2VfdbthIWbIIEEFU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310141

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
is restricted to use 0-600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing keeps a
non-pixel buffer above 600 MB. Once an allocation lands below that
boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Describe the two streams as "non-pixel" and "pixel" subnodes so each gets
its own IOMMU domain, with stream 0x1940 becoming non-pixel and 0x1947
becoming pixel. Point the non-pixel subnode at a reserved-memory node
whose "iommu-addresses" covers [0, 0x25800000), which excludes the low
600 MB from that domain's IOVA allocator and keeps its allocations above
the boundary the stream can address. The reservation node carries no
"reg", so it is a pure IOVA carve-out rather than a memory mapping. The
pixel stream is left free to use the whole range.

The video-codec node also gains '#address-cells' and '#size-cells' of 2,
which set the cell widths used to parse the "iommu-addresses" entry that
refers to the non-pixel subnode, and an empty "dma-ranges" declaring the
1:1 DMA translation into the parent. Both are described in the common
schema change.

Fixes: 56cf5ad39a55 ("arm64: dts: qcom: sm8650: add iris DT node")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 9ecbc0010694faf8005eabdeb033efe630f95037..6fccd8a886ec0aaa42e20b7a20333a7b77c31b48 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1905,6 +1905,10 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0 0xff800000 0 0x600000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5275,11 +5279,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5287,6 +5292,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

