Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD283F65F7
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325453; cv=none; b=DitVqueO7Hs7AZlx1P2Dw5C8NbtywyFXMqOqC9C0Qf8PmfJ+9ufqQJuIBJuac57DwF9YCP/7U0b4iry6cBF5rvxpVWoIeuEzb49UYQRxh36ISYRMFlOzfqXJ7xe6YnGGNzC2ax+tW9jH+2Nx4ExyOCkM45sB6lZrdjA6dwyk+c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325453; c=relaxed/simple;
	bh=vE3R0Cr/6kZkP3egk0sXz+1Lyiu0KUq9YNJevNH+FoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T7csk5zaw5L+89zbbfDzxFymLCrVmnQvranINuQyeQdYRYrtf7/xihvAWVfGzhRreapZtRbXdxkRf3FyGVs5Wll4SmaVHS2DhYhV+E0ghYf11mGii+kfE4rX5U5mc+gkbmMTXpNvTwxTb0VCsj3WPkFjPo+OxZf3ZxeTKrQIeoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMta6o9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmpidQ9F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMta6o9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmpidQ9F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI42dN1696060
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZATYvq14VYqRSPBW+mTQl6wrULakSEle1sP/Bc+xrw=; b=PMta6o9bBtAdvw0c
	bS8vDSzpZ3cisKd+drPRprVMRJhw+V9jAT8U2ibrGNwLIOoySkQaiOeTzaYW7K2l
	bDJKIbafogaJXUenttOC9808X57j9IBsVSmkpq1TNXpYI7tlS2/B5zX+AYGJJUXv
	iirsWRWLA8d1Dqr9cPqEaQA4OBs3YVejzqLzvRSvwL/YHh2azecq4W0GusuVtn87
	UiXOquf9rfDG4AgNEid3GWoFN33HvNrlLwNk3Nwj6OIMs3V2Uq9g5E/knp2cs/am
	Infy+8SpwQducfd+70kqGch7ZP9zHWXlR3YpWreQnuI5cb9BMmJ1cLy34DLYQ70R
	fO5Udw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018kt3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:50:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso3863203a91.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 11:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325449; x=1789930249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZATYvq14VYqRSPBW+mTQl6wrULakSEle1sP/Bc+xrw=;
        b=VmpidQ9FdqTBY1EoHSE8is6X5AvWwySOo2/CeKilP5eAE86Z3Rcx7OyyeJ4QRZRcXt
         teKa5gOtdN+wowGc6VfuLbKzkh4vCGtymW+l4k8nimfH4KyqGC6FEKrReODZnrSCLgQx
         4YxORZ24xUt6hHSkMU+asMj8tXuSkKNmWcOO30Wf2xo+OAXCNVeDNT0VKUoAhUZwVjLP
         zIO87KCp+5yzPm3piq4PGX16Iqt7rjy3Qf+QYLuQ5ar585O2hJMPS1p2CHW4w/1HEr/d
         uXJQ6Zop/MSEnrGvcd04dGL5SsLrR5qvBo0J/KJuDzfokpzLfgMShxMTlIKc/d1FjGs1
         7ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325449; x=1789930249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZATYvq14VYqRSPBW+mTQl6wrULakSEle1sP/Bc+xrw=;
        b=tHReDqehHGnXTkYplwFK3cilaUwYgbTjz3aBuTO9f9QReZnNPM66ecGSPGYJmS2Xri
         yswFvIqx/chwf7XF39BsjSanUDta6W8PP4cCWjQaSGoVefZd9KeYNnQHccK8myBSQONH
         jA/k0NY0nfEWw6HkRduTG6YU1UDzI8WKcu5MsHFaLC2AzbX9y152o/tYrgLA/5qNz6ph
         uGCUPnZSci5uI0zgU7PR39+d4dTGT2tZxvNlLISWUmQvECsJvmGiAuZHbNcSSdyUvkXA
         cJR0TL0UM13R43X39DInpWUS8f+YI2KNZFd+a95rmjmOpoVn6pYmiSj1t1Pmqe+pi6sc
         CUQw==
X-Forwarded-Encrypted: i=1; AKwUvBwb+xwI62RZI3gpn2hrg4+K9itgQZq4LwvJh9coqB/Fg+9t9UkE1wzQZXj+ShtgTb22WpFm/K1u10+Y@vger.kernel.org
X-Gm-Message-State: AFuF++mZxTOtW2F/4mc2HDCUNavgpZhWKne/fP4e49HBql8xk18JZceA
	E7yUH73wXBnGnKFZK3pEj+pA5gLu1IZROX4K2GJaEm2kskcUVz1lsN2oiOjEpsCO5fCTPWUtwvf
	7eqZUdPJdMsfD9QQa0K8CyrnH4j5i36pmxmsiJm43ojrZMahBXHQtt+KeBYfCc9un1P2soWP4
X-Gm-Gg: AYBFou0KmKCCh+dl0bzwFB9rxcZxJL+dVUDZcpkqfS0gy6M1BZ02J12qC0DJD/67U7B
	VToz9BVca7JWUHHr9FV3h1bD5nVZC67nfC6uBFSUlEThz2wa6+D3lzLchWhGrt/0N3n0XLGBs1t
	77hSL8vZ69mz4OEAWvmCpQFirl1iMAEVUe2RkssdVTzKdsidK36urN++9y+QHU8MkHkygUNaCjD
	8Q7sF6bXG+bQq+z8j6MyrB2EPyrvdTOF3K1NFUoPovZh8ij1/yf7pn+XZpTOHSW7OxFA0d80vHs
	8eeuehSbOdSSgUn9Bz7cpB/kd6V0ynXBC7hTCyPu+A3oBXtClG1L0s9ShQZabvnLr3AjiGj9wJ5
	OvrVn5Snnf0b7nUeU00HXYJyglNIWGiJ6Yt8=
X-Received: by 2002:a17:90b:4c4a:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39dd566515bmr4232278a91.20.1789325449417;
        Sun, 13 Sep 2026 11:50:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4a:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39dd566515bmr4232230a91.20.1789325448973;
        Sun, 13 Sep 2026 11:50:48 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:48 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:25 +0530
Subject: [PATCH v4 08/13] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-8-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
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
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3399;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=vE3R0Cr/6kZkP3egk0sXz+1Lyiu0KUq9YNJevNH+FoI=;
 b=R2AxcUirXGZwTaa18cY/UgbIsxNLrNL4Y8IGkK9XB3MmqPpPv66B4RtRCxuwA6i7iZvks77M7
 kcMebpuFQsnDs/QtQvMjst+j1QtNIQOvq5uSKlLRUOvuRA4VEoU0Zh0
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa6f08a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX4MHa15ZU75ln
 AV4Ft/C0sAn/HyFdBHzycLbAoaOCT00eG1R2pbwETccE2IYhoYn1UUUZwR1ZXoX+X4/yDvHAdpC
 UamGi3atIgs84Ex2ozWieMmiAn0HKRQ=
X-Proofpoint-GUID: Ijj3I2MnepBmQT81EqyJgsuaf0zxKbMp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXyQjEGjVks4zW
 TQ8mARVdQFKYi/Bf7uFSZqeZ/TQbx6LYaAenoE2JjyEe7Lhhw4cjfDUr7vuozhNmULoVORWLRTV
 vj5gb0mkPdCmROi7hO1Q085+E7d9kWbXDQsgpFZEiB/oV48Hzjm59U2QapetouPvv8PBKEZWCE3
 ueUf39UTAkVH79FRh655miWsDtmXInfEvVOTf2jSw0TVgEm9XWNOhTOnoXdUT7eq0Z+bVxoE/7b
 EW+caeZZxmeNkV6vVvTzCjNU+1u/5OoicuKi/2ioqraWwTm9iQONSabAk6oI+CUdTqD5lxaPvv1
 gY+lixEJnrkLaj/ehR3WlPCrrpEDNcZylaM89+JonOKVtol65U3kTMiFNxdnQEgHoqDVMgakDIZ
 2eSLSzKoPgXvSInkhy1S906OwggBKXSri3gG+GqHoZpU9CncDT+owOCv8bAdjwZMtHLXsD6Okyo
 FRbsO1wQna+99oI0Lkw==
X-Proofpoint-ORIG-GUID: Ijj3I2MnepBmQT81EqyJgsuaf0zxKbMp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130267

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index fcd88e5f5d7ee1b15e4329d45131ab969e1c9970..63e9ad58097f79b62102c79ff0cffddf12d00f48 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5462,10 +5462,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5473,6 +5475,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

