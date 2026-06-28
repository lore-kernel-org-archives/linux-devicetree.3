Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AB6304BDF
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671100; cv=none; b=hnaBSI5qMQzRXtjOLDca/2TocuaQvB+Pt3DUU225cYkv/Kdk5xNFIRYNqlRiSQMiOT2gO01Q8jl5tIDK753BcC93/d4XPnq1nHDBdfu43YpMX5uBr5a/1wcYbbEdCAwwstYWhJ0lxjBVnK83+yVy5sVt94Ur8ivSYfGD8PSwWNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671100; c=relaxed/simple;
	bh=1o26QioJ+NgDK7fmYrSsNAyclYExqimllpZCk7ntDfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEoEFtM9zjpDxebsQGDgLK9HEJxm+BBHmgHHAQqH4DfReUeOgEcDZeg02IhRE9CWBJ4Um2W0l785Yhmy7UCSuNykM1PKQzxP2L1RTD2lMP6BABSc3yFht0G+G40hRxfV3xS3VvCyBQcBdAL7HOPdH1apHRnAjwretQRx+a9+934=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zg8G6Q8u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBdPIMz8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zg8G6Q8u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBdPIMz8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHjjKK450915
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbMc4RrsOe+03o+lMwLAkg8XuHYRC2BTwKASC1wJIhk=; b=Zg8G6Q8uUhjfLb0o
	vSZ9rn1P2sClR3oBYHSJinWJLHh2+8T/RztbOSNnC2SP9lPyxeLZ4MNt4qxvvEjL
	EP7+gwI5auQ8Pb9RIebe5+pxKFrIfaN7s1PR62XM4DW5MPuBQy/MGkCvRtHEHbpv
	4WBY0SXRDlgDMzdIHUctpX2Cophcr/VSKzTihjpfb7/OFZ/RtXTEK6/0BKnEPWGb
	FKi4xsVDVy0pVXtlgrgMHKhh1EQ12Gp7XH3In3b+6X51t5k5pIxpCRd3TvUK4U0B
	p2qeg+y6Frqsevq7Voxl2i6UQVUsHU5+jjbbTxSItKbCJdN8g/yOr7R4pZPRzQOT
	BZbSjg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8kext-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:24:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1394c3ee7f2so10331485c88.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 11:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671097; x=1783275897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbMc4RrsOe+03o+lMwLAkg8XuHYRC2BTwKASC1wJIhk=;
        b=dBdPIMz8cSFHuDUa9oGG0PPbmkWLB6P25ieCjc9ha+7QvVLwcsTZK8/8OnYiUUzzDa
         AL7NV/qeR3T8USgRCuTOw/Vj+myHZeeSXjkyAScofwLMOVZicDleAowYkmlc1wbg/xrk
         D5K948WTsdif3yjf8rs6OoRTyYGayntlVrWVavsvSJ3Xo2oxMyS4khMPny3VWL6WOG09
         BRdqasEfH1YKqnMpaymatJhAumKwX7j5CY3ZPKsZrvDClr2/DZsXHDTag6fYXZBrFSBS
         ofedgFFowxZhdn9+/v9gctRLefA4hnOU3YDomgAM92XXdREAua+ZEmUG9Dd1OQ78/Shm
         SoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671097; x=1783275897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IbMc4RrsOe+03o+lMwLAkg8XuHYRC2BTwKASC1wJIhk=;
        b=nH52sdNEISwfBuJbepIQg7+FxydkER066cpV3O8YdPi7Oghg0aqZ9mH+UpHfUVv3M2
         9JUT9YLxAUf9hzUWTdRPmu62MslRe4HhCYmUQyKIBMzYGkm8lj5lXOYWHNnA+/YlA//K
         4llemVGTOI+Sb7BmN3tOSEiR9X2jTM7lPQhMM6DKGdgnUBixGYogg5g1fXaJwNPt7VQn
         KImtlWKwSgeMKKwzgFY7kBmKr2f3zwTXOhbHfKFcnWJncCZ2/wldBHTRyEolsoIPEKz3
         zJjN3LpXJZxi5MbDbnWjSo9KDgCRtembHs5YprONIx/LEHdtJ7PhEAs3P3flA3wYnMBw
         WNEw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3V4Kng1Ga1gnwgHEPbK2KDcTnR1ZTnSMBsoL260gnI6Q0tOZhrqWhqkBkJPg+shd16r/S1nhE/B10@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/fuHQLlLnSwnyG+J1M3s0ddarkEzPiqKEVzigdqMwnZuj5db
	IMOaItz7bnIJtllBCvnGnqX5sK/rJpKpUYeVd+DpWV6gvXax5+i/70Pi4lE7jKgRmHv9ut1KXjw
	HNjV6hCnFcNZRbWRy+K5EYEQ9B0xvNbfxs0Meg7Ua+P9mkBIq/LziFzTKguoIlovU
X-Gm-Gg: AfdE7cmHzewQzBXLLumPoOaGn000pg8SL8hP4Yp6UxzzCPJeOAGfoc6Sqb58wfqv25/
	8WcobU7jRUmULhrISZ77LsYcQitto6ByuAsdb5s4lAVY6Jx5LPVkjPQV7UKwwbxHP6aoEeR9UVt
	n77g+56AcNUsjLm4qAWU9Ihy916WugJwtBZp75Bxs56zLbFXUog0K6A+TwCP1zNh4ZnIQIlteLU
	FNGtKT5Ghfsufm9Sipl/2gPgJwNrsLQxqpAHen3J9wc1Y3okyintGZOoS2ZvgpvmC4t/1UkIltJ
	zYdTEjNmPRNtnGDXL5AkDFvWEI7dt2ioXsoaE6A1O7s09iO8EcTxe6hiR0CSO00nW3Zou67DpkB
	6HnhifDlZ4O/3OThMXIJVZrgBahLwLC+eQcs=
X-Received: by 2002:a05:7300:5bac:b0:30c:1b22:646b with SMTP id 5a478bee46e88-30c84dad33fmr14207339eec.19.1782671097426;
        Sun, 28 Jun 2026 11:24:57 -0700 (PDT)
X-Received: by 2002:a05:7300:5bac:b0:30c:1b22:646b with SMTP id 5a478bee46e88-30c84dad33fmr14207304eec.19.1782671096877;
        Sun, 28 Jun 2026 11:24:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:57 +0530
Subject: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add Adreno SMMU node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=1886;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G5KnzOKbF9FC9XZVD3H/X6wimGnOXvf0oUqbBl4LZbE=;
 b=tUNf9WGYMJjAdYic1WiMT87XqmIviOCldRCxeamUi7NGV4ape07i3r+B/0zrufi/pAMBdRgfw
 9nDbsKCIYIfCh5m3IYARovqRiiL0W/Bm4G8HRkLexLCQvUv65gCf+n/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXw8dM/vhsNlEV
 mrNxQ0JhiUHC3k7avAnn2d4XzgInsMAmA9BtghZXIAutUjVlhzwktPMPGGyHN0b+BsICq/SBerV
 3NjDi0Nob3j+j7e6oUiOsoIVT2RLhkI=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a4166fa cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: BDZmBgd8DqHxINNJScK7BducDSDbdoUm
X-Proofpoint-ORIG-GUID: BDZmBgd8DqHxINNJScK7BducDSDbdoUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXwdDbTd7OgNle
 r8UJhL0un6mhobp3uoO+ZnWVdyJNuAG6t2mbYfczmuWa9OMQDPDbcXd6PAI+xtXbQJ9XrdnaMs5
 tza8bcOC5mZ/3sFgw5Z2I5cevzIAVDF7ND9FTJlieB9bLgp1XDHqLFNdORNzCe0sQoLZkTf90NW
 prvTiTXMCofJoZjUz8oPZk6eVeSEQHRWKKH5MYOgezB/KwFugFUFTD6CsuRQxPRe6SgPDyvqLkq
 LTjwE3H8is29R4ypYAK1SdcVXDUzja/pi6Fj83E+nENuLsFWoX5r7bQATM8VXD9xGDqPZwQRoYo
 jNWEGUba+VIVPFGrxPfciySFVLhFf1I74smUvlQ+1HIr0JMb38x9k8EdD3ZBOdGFjrX+1PmYqjv
 g9DLmClY9jrqytYgcsrCMG2vBQMQTX8akq53/qwqpSNmv64bqUnAGMCbsVIfZO9bEkvJYmKexwu
 jT/kLay9HO8V5mRwODA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 1ccb0f1419aa..398cb1a4dc86 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -655,6 +655,35 @@ gpucc: clock-controller@5990000 {
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
2.51.0

