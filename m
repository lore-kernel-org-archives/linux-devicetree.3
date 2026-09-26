Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7943638D3EB
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404495; cv=none; b=OQqGlFURYJLwDYXxJ+RXisBsrdJRvGfrHYwW9U6lz1c18CmRww4whm0qAKkkJ0VJEC6rKyEhdrnkE0k5TWeCwqSLq0yIZHPMWOm+Fzw0/crCuZXYxH3VJrUaXmjhWSbFa4r48bzPr2b0obWXaqURvo67RSY3o+Ns6hXvE82qbXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404495; c=relaxed/simple;
	bh=PnAbHBLCBhwxjoECu5HtUTAmt7Aan6lX4I7y/GynILA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dkc3gz4w3KBxsC1Vd4gjhfpjvNs0qacdaMKx/gzvQfV4gc7nvqneVP/FYMy3Ee5vGJCr/5jtS5hoNxMmgepz6tcI8WRUvoJkA15LrXM+X4HU754h0g7dLMsdhGnvFCxEXv53OkYBbJIwR0JIdB35DV4E8K/OqT0soYQyHAfkvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwUMitwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHPJSufI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwUMitwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHPJSufI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6P3qD2575298
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=; b=bwUMitwyngnNncol
	PZZSPrxUiX01yP3959sZB6HvN3D3nrHL+HBlh84ijINOTYNmz4FGCek9xQ0FkLJn
	mPpLFRQRm3gKIOLpEsdSqgA+oPtRDx5pWWnh4/ucu3ErtgquMedUSKTC91XbcDr0
	cTLrKPYaGmLN8d8kd5orWirEWmPPy3X9xH/D9fpnxWa90/ppNfXB/pqZRjy1YI/Q
	bUYlGhJpDoWXX2k4IRpShKxOBPXrAxel6Hyy9IHSnwsNpTvlU5JmKbGinHseelFq
	1jcvBzccMtwDRFDVKmnu0ADpE6jBmBcNF0UivrU3GW3WJFydOmdkX/KV49QNsUEu
	CcXdAQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9r54x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:34:52 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso1150571c88.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 23:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404492; x=1791009292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=dHPJSufIBIyLn1LU3t+pX0o6qe78WvEYf0NpXyimqaXysRNvZw6tVGV1eG+44KOx6A
         I92Xkpxwr7Y9K7AkOxvmuutwsUJGohhsbhcUA+yuDCHzYnRAIEmfosI8dcyU5QVdTdQn
         pG7QCv+TDT8kRZMy8+CGIbnEzcxWtTmZ6yLrOmmql6VD+CllOpq+7zVF4uNKONE8wTe6
         gmPJtAluQzt5ze8RKwHiRw/yOqt6mdm+iqbZBK/f30lG+YbKo2Os9TbTRHEbHOzpQpBz
         ah4uYot1rC+q5X3Rc1FkoWCexp0vzeTGRt2yXJCsPxQbYo0krWfJlMIR2I9H9kltNuuM
         D9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404492; x=1791009292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=e7piC0cFZiCi987HMAQvn1vOT7WQhF7b/wn7mxCTx/2OyWJUVk7ND/c61dw4lTpPoB
         HUe5IS9lOygjf+qL3vSsntwe4tIH5bWpWOwl1gBTVaebDGG/+77JmV1Pp6CTShf4/u1A
         AyIiE2O3WIDawNgOBd+iCuOr4bxUtXHdBIwsPZIs0mbx7W/orKQnalyrOMMlxBsPR15N
         UnuIWCCxIB0aykyNmV23E+QcFdl2ekI4LSThscDDoLcLrRqb9gAIulhxlvVMMNWw1d+d
         eN5/kAENBH5cjPoVifu5igLcwK/axDYbdNqJ0u5ymc+JwGQBqiOLhkYibzySAYQMFxee
         O2tg==
X-Forwarded-Encrypted: i=1; AKwUvBwkw4CLyPcqPK0KXnBqeb7TJaFtQYR/UVVLc5pGvNeRMYutKvCj4HanGHxBJhf+8j2x8ue41TE64cFS@vger.kernel.org
X-Gm-Message-State: AFuF++keCREgOmAaF2OVui+bSs+bsF9WlYbaz4wp4GtWshzh6dvfEIcR
	6yP9Hu52/znwVWP4xcJiCgiHj11KPJcFHsrC2CzmZWiy//wXBL25Vo08vxnADcbt6wA1cxAxus6
	q4Zl7LZwWPt7cL4PL+rICN/Eue5XWH5edRL+2Qf96ZbPuB5kR4rl2hdQhPslIyAGz
X-Gm-Gg: AYBFou0PDvpXrTJTGMBniJNO/hIYl9j/CZo0kLm3gezeKxQ6EkC9/yhoKzpML3CRotn
	egx6Z9GG5uqD/fx/iKsu9c2wS1rHSUYb6IEo4p/F8xQqdTtVfmIlbbN+t8xH/8yiV/WW/0HE7dW
	ntyHc/ZdLTZ+oR+rNU0vMWCRtO9GUc0TQBR0acD9wFTCKa/7IJ8afZSs37gBZTC7De53hIOCqZp
	ytTL2RUG+d8r8t8zHmcYXzO6ERAN3B2iY904gz1ny+67IpNEfVwukxggGWqdt49Z7P+OdS29+jt
	f3ri44zcuNk0EyuwqXc7xM6i8wgxUloHnlRX1a3N9AqT2nfRNEPUU1c11BW3W7CAssYstMtaQMe
	8fDXBCT+zxAN1euOvNe9wIham/GbtGCZYHg==
X-Received: by 2002:a05:701b:42cb:20b0:143:8188:fafe with SMTP id a92af1059eb24-146d077b0c7mr2169257c88.41.1790404491310;
        Fri, 25 Sep 2026 23:34:51 -0700 (PDT)
X-Received: by 2002:a05:701b:42cb:20b0:143:8188:fafe with SMTP id a92af1059eb24-146d077b0c7mr2169212c88.41.1790404490429;
        Fri, 25 Sep 2026 23:34:50 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:34:49 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:02 +0530
Subject: [PATCH v5 03/13] dt-bindings: media: qcom,sm8750-iris: Add context
 bank subnodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-3-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=3890;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=PnAbHBLCBhwxjoECu5HtUTAmt7Aan6lX4I7y/GynILA=;
 b=966U/Cf9rqiDOeyw2sHM5srfNuYx9ZLAtNA2e0HDMDSJ4mum8d5koMqmF8TD2r6GQWP7BIXzm
 AzgrNKWcB5UDlJxMaXwmtC2wx5yPgmWgCmeRJlzePWVN83NDV5ooRQc
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX5vT4bScNa5lp
 gQbPaIv/ToAqDx0AqOvBzH5ri5QHTurU1RvP+jLeuZZO5x/h5bJZHdUoyp2cGWJ8tHbziZp0b0q
 ymUQTXDX82uV9q9690pp6WqFtapQ1Js=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab7678c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: N6LCWkYOakBIARtAeWl9MS_UnC8r6P6g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX3KHbz0K9kniQ
 MDG/quQXsTBzeSsEFRB+YumTkdDDI3f93GIzuLCOSbGGcnr6A4z6OnGKKXDdkjpmpOkaKUv99Ke
 L800QWzO6yu7h6xJBIXBI0shhaT+Jpi1nz2vCduDGDVUe4sUZCSgOM3PJ9Qn3Q4XhEV4f2um/rO
 qgwoY3QQdY+dNyP/Uz+lieKV7iXjj/ugaUn5AlZlnb1jrc6ivRN6UFjPnLR01cxToa2xjQ67n3v
 QMLQ7UaarQVkDRrSZ4Fh6SxQiBosDjLIMKQKFe+08hjC/+y0XLntelG8/ve7DvVuaHnc8s8O9B5
 JfgJkdwLnpc/cbswjxhKJc5baQxA4KSPTopveIcdkhGLQ9dQTIBQhwBkq6JCijIJ+zVkKFj93NB
 LKA7tfyhiXw/OW+6sCuhXjT90dMEKJeI4PD/tEC1FS+huZwQeXds9uSoas6nE7SkjmPUhplRYps
 Ttwh+UcWrPdWSw0yGug==
X-Proofpoint-ORIG-GUID: N6LCWkYOakBIARtAeWl9MS_UnC8r6P6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

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

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8750-iris.yaml      | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
index c42d3470bdac796cc878090e65becf6b62bd80ca..b6d5ded1aae6a1a6836c2c24b1dae548cdc6f9d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -72,7 +72,6 @@ required:
   - dma-coherent
   - interconnects
   - interconnect-names
-  - iommus
   - power-domain-names
   - resets
   - reset-names
@@ -110,8 +109,6 @@ examples:
                       "vcodec0_core_freerun";
 
         dma-coherent;
-        iommus = <&apps_smmu 0x1940 0>,
-                 <&apps_smmu 0x1947 0>;
 
         interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
                          &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
@@ -144,6 +141,19 @@ examples:
                       "core",
                       "vcodec0_core";
 
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xe0000000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0>;
+            iommu-ranges = <0x25800000 0xba800000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1947 0x0>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1

