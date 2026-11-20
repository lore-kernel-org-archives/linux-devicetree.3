Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173137;
	b=BjVsJv6vGOVC87Rxa4CJ5Ac1C+QsOpXPCb6U9g+/O5lUYa/QTgxELiDR8fNBG+kg1AWF
	 b4tqj068SwPbUr2uQb8w1aSITVInywEbd7etOU1mausH33egNmQQRoMV/RWLcIFIBJM8J
	 0il6eUipjtcHoS/DXiHCb53Ilm1zA6+ucyMiGvsyQR0LvYyZvupk3D/G8jixdyXqZLCLi
	 XlF8O4r/r074jIZsHuRUS5FuAwVcDQbFtA8Nl6QokwWOtlwh0EEbrygMO6ksb5OcFgMIF
	 9QeSqJmnWm3lUTNR+xErOdZLdDBZjWVs11p0rE14sL4wSSr9RsFa1PrtVK2ujIPDciw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
	b=5VCbMAgV3wJEHz4IOTNLKWAAoHsRwMmATsrKJOmESXXgrQ+XIn5peOFeLDIkRZSzlNwI
	 ZUr/M7bZJy+EkXxP5Vn1SRtSJj8fa6rETr0QORk+S4v8NkId6+OSOD8WQU+Bcz4qdTxSl
	 ICD56mEfwPrIwFEV+QNOaYIPEy8v85E6d/cCdXGIHVNyhXtu8eEmM4PjukTIOD0sqXSkN
	 rr2kDGMd0c6BvFNc+QSmFfLhfQYZnycYXYULFlwnzPQl1ApA+LTswRqA236SrdFE9OXaZ
	 fjgzEC3Qv1CZQZv6g+C6o2edRVvPeeCav+PlR62kMa2vHhEgkFRx4tH7sh9dfkg1RiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yyql6JnG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZRxj8aR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999DF60A3809
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 999DF60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yyql6JnG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZRxj8aR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk0VQ2155246
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=; b=Yyql6JnGQHI6xssC
	DQLHvNyMp+GG0Oh9uCAvImC0qdy90u8OMXsuPSnyuIHMZlxzZKAQSyYcZH/yRbXi
	9ycxC2tXBWwK1Y2jc7elF978CJ/4hkbGnbbeuyFFoedggkEgb4NZlcLgGspnzawo
	dHT60EoDjYugKXOxypk55UqVZjiad7JaW253kF/AAvAT+KvmGBL3VxCT82uc+uhf
	fuEw4DS9XD8QE0Y/eZiwNz8JGlFBdL5twza3wR0koH1DkSHr0aIyn4FAvDaeLW8Y
	C0UlkKG2UnFtCw0YiOAHNwORG2gZBu4fJhy8dYHJcT3vkRTQDsqk2SF53114k9Cd
	JEjb0Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhkq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386177b0516so1039272eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173134; x=1795777934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
        b=VZRxj8aRtobpUr0TYO4LWCit7jNM9t3RnRmfea+Wo+gRM8TFe5LbAGj1gWeyWIY1gR
         jNsnZ9efK0l8zPBdwrUhXMrvnIKjxd3rcCwwmzbiNf5/6e82SvhK6ItzmG/SpT6M2Moa
         IaAWgGOUQWZ5M/6w8xzSM6EHJ5WTYSiwqSFf162TB8IhmIRTDJVfvRyTl4QM1Mlcascq
         JHRuhb5GCOXZqxQ+x2T2vt4hXIyPagmg/ZMalpQTQlvjjsVoNua21Y7M62YmC+a5y5Qi
         dg7A/C8UnRdent/iLDooY3knwf8A1lwLi0Ar5dXPh4lD9yvn0Wsbl0OeG0gxPYi0OLMR
         VLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173134; x=1795777934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
        b=L4QqSXt1hQRISQ4aY1fOe7C1uD2D+DcIPbbOLzxHKJrqdnlKRW4r07upHlaxYLGTcP
         JEf8tBdSYD2eujaL2lgyJRgP2iUdNSpg4+CP1FsZXK1HZkvlUS2PI1jzrKCG0f6dAjzf
         j9lmF5kkGEfRuLefHcENB86v6GASDN6HmC4ggJZFZrWRgweeejM21OXd4mmt0QHkYf4Z
         g1AbqS1kklLUB717h+uXDi92loDzrPS2a0KkaOVBPYdfZK0qfU51wCw3v0t2HqKlyR9r
         e4Ssx2VyNGNOBIw/RgoccDYX5vuvkzl7UAGwczjsjkS3745TvZkccXrOA6e1OdTKNDuN
         8NGw==
X-Forwarded-Encrypted: i=1; AL+hErGNvQ2G6zLQg1mRjDST7ZMIziSR1u9yy1Bf5SjRyCbIYilYrM31BUpzk6UH/0gi67qYKQIWDEjXd4/Z@vger.kernel.org
X-Gm-Message-State: APuU4Z+TciWQNgpANgNcAfPMSfgM4wXo8nGHOaV5LROFpbgS78G41Ava
	tieSObuEgCSaLnH5+d1xm6jjPWnPodrZ/Ryp7mmJBR1987BgOrR2YB7noujGuTDh1akYGCttQTG
	GcMk0RUnggCkVJq3DADxTMrcM9ayOe1iOCvEAjIPEHD4PWLV/CYUSPIGJP4pwpvRY
X-Gm-Gg: AYBFou2q8POLCtBEOQCxqv2L1PvfPtLKbNKKhi7QATHkU1e6veXJ7uTE+pDW+rOy3qS
	kgY7wWvbj8w/qXr98jPHsTfmYH6J2Re/G5EIS93fQSYIanOauZUCXmRtXJYbjRYSAL9RANKxELK
	VfHBtXl5n6oBtt1mJ1ODodqRGzBUUROacgCS8qL2b/A/BhyXjk6LKRYaF1O3f8KvJ9DC2Fnq6f+
	WTMTOkhl9wGRawbq1glUxNyOsy/vDZMvYRvs20oalQ/rN5Ir7T/jrw5rCZYsyakqA0ASIe7uc/o
	Z8OL97tiv317/uckaGCqY36U9lFQWRUVzKgYJ5G+zwqnTxwwtMRpQfZQzYof79HxcDQe//wn7QH
	b8kFwvwpCr8oGnVNySaCNV4pGbHrknKNH2qrLDTBy5NxmaEg1/bvf7nAyYzEOg8NP6jwFKRS3AM
	4R2/eVWfEO
X-Received: by 2002:a05:7022:e80e:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b556924b07mr2781709c88.40.1795173134483;
        Fri, 20 Nov 2026 03:12:14 -0800 (PST)
X-Received: by 2002:a05:7022:e80e:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b556924b07mr2781681c88.40.1795173134004;
        Fri, 20 Nov 2026 03:12:14 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:12:13 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:41:01 +0530
Subject: [PATCH v7 11/12] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-vpu_iommu_iova_handling-v7-11-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3502;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=W4XxK+uUtwa6RFdkeL/rZGVqVGU3B0sS4/gBlQHEJ5U=;
 b=1IS2OiI2FOtb91uQ+P4MxcszNruZNbEsaRR0QoCPwgjV4gyrVV2HChI/RK7aUl93QvtO3A0Si
 f4Wwp6drd5NDjOC3dQg0CTgjmSp1x4eU1waA4Q1fTKaQRwx3OMh7sfH
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b002b0f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX6+QIhQdHHF/m
 vED0KseXre8FtbjoOn/dVG1qDxwA6odNvIjd3bpuRNlhjErFsa2GVcX/kbpYoIX1E7+ZKmEVJWh
 qX+kLGmAMPnUSjNaEZIXq66ri13I8MMQuDMOzapet5QdMUZrX9KRnwGYVcjwWdSvZLuoXI7GfmV
 alMDujXTPEGNF0R6fD7FOBhvZ2geGwyi/ioDlKfizNpf4hxCfI5BtiYZQymaN4Y+QlPTvCHDR/D
 7FUOXLONII1iQoLj6PKOLvklbQAigcqTCDyShg1AHdhJJ5IiC+KI43FyWKdUwJDoUPhzlh3mQ59
 yIMNLTVTaSSPRZrAmP2d4PSEyqIx5BljQ03yKJrz5ykCaAyTNtZBxlC4ax+gUyA/xp+KAtTzYNp
 CWcTp0Vr3mVjvLCBuE5mq1RCm7b90saGpjx35VNIcR3kDw2DfVYXHgza6X1RKSLvJzRTWVi/B06
 QnTwbKAWf0Et+t57FBg==
X-Proofpoint-GUID: B1uHY3rlNb6IaV-Y5Rhegd_PzSnMR_nd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX9MPGnFBiXZUc
 12wi2A3UGMRy74+vBPDFzwdvpTvBpKAzC8L41Dd1Ffy/gNIKgvFDP7LIdZJ0CAqft4Pgt/Pxmgm
 hZn1fF8lnDHU8KlDf9CTTK5YK6Tou7A=
X-Proofpoint-ORIG-GUID: B1uHY3rlNb6IaV-Y5Rhegd_PzSnMR_nd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c878675f82138ba99ab5889eeb0854..b68859c6a893aa452af2d7d273c7f3d97811a737 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5275,11 +5275,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5287,6 +5288,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

