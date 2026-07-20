Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6D43E8346
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544683; cv=none; b=qH0vJ+H0lZJ99g/IInZVH9l1BLAvl+TiG/Zf4yEeSAEnNFE4BPkRgC5WZq0j9ERM06hoN+dorhzoWs8oQIxsId7/xRIThoPYbIGDj6MzGwRyl+2Pc/GUgBJFiyIC2yTFlCAAroeCxi/cKU7sIyCtIWw5yz+By8AqOFKiwkAaf3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544683; c=relaxed/simple;
	bh=8/FpCKjXpnBa78fkZAMzVCGiZKnCnFSw8zBEtlMuGnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jN3PWQP1QozAYSN5u1WmDH9Vn1hEv5yrUT41yATdfQEb1Chmu/QWoJG2+ykYjGIrpfB2y+D+ux5nfyc4On+1hpniKz4Vp/NR1UcHZyl4ApZ4FjiNgAhEu8oNxKgVjyObb5APV0UATo5HgxhVF/Gi6KohQcw0y14uKYs6aKu7gto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okyr16O7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyLo/dFU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okyr16O7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UyLo/dFU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vZ7w2139849
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYUmd6iz4TOryxUGtheeJBgCKVWvj2LRSWBQTL1u2gY=; b=okyr16O7Hyz4/bPO
	+sTZdjDZaod1lWDxs6kORAUUAq2Q/oKRttxmlQoMPLPKQk9yWu/HyckjITFId4M4
	6V4khkHqc+Bxww4tMauZi5R5weqtl0XdBsLEWtYQXNgqB8tiNqn89HSiBBu22RKK
	UE2YYn6ASahfpgRK/2fjC1/OEBEghf1KYLzoqPveRdK0OLBmw/Rahl5qxs6vAolx
	ZkP2DnE7KqQTScq74SStABkL7F/U++nXEhfdvW1Iy1SA1CLoehddv+N8Vp+eB/by
	BYzikcq3ILNjwXVsFNRnsqZavnlLMGD5jYBWb+exRs/WsdJ+Tjr9XitDu/XMO5eh
	obLhNw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c0xb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:51:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8487eb67173so15691607b3a.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544665; x=1785149465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYUmd6iz4TOryxUGtheeJBgCKVWvj2LRSWBQTL1u2gY=;
        b=UyLo/dFU2VEbhkw/nJXRHx6mf/TYZqcDa3NCWQN00Ofznez4D7yl+fuH/xSHG834hF
         GaxDPtxfV33IhtrDz3da0CQl2X2hqdh/5lcRHW0se0uc6yLtWB+rjawRa46rLLgjmOjE
         gdmIjB49hW8kFXWMylm5xkd/NDe9kXDRNI+w2tGXIggndHXGdDQo8ebFITYxr0Cv7MiY
         0X22hxMIGxxDlI2aKbcNF/z6Fy/EMvV8LLVQIME9BKKKIq7IGm5KO4g8ZGcCEmcSdDq+
         h8JrSSUrkFV8NYWG9gOVIwmVe1rBZSY0qwYI+NExD+Y/69nvcwU7H/UeiOAT6uIUHapG
         GkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544665; x=1785149465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYUmd6iz4TOryxUGtheeJBgCKVWvj2LRSWBQTL1u2gY=;
        b=oty2HfT0LRBIrbltmEFytXZmfEl+Mug1JqzcgL/luy0H1sYeNVsjvDvT8sPYj7kHxJ
         SIEpvX6fEWWMHKNYyNiIB6JlrYOmW+Zh/MU5nR8+G7oM1BmOi1haH32j/SJfLOC66bKh
         DZpTaRU/L40UEgvDD7V6DbW7JlroKDnxpYHEXY8Tq+lO26gT95tLXU3XvwdYDbsCNrqS
         vwhBFVQMRVcT23NJLzjrlJsBGlXDrD298Y/vvxKIrj7djipQKAOj8BsLLxY9wEFs6aln
         /RjIkiesNukGBG8XJEp/Camvf4Rylje3xC5SmeotXSGgETatH8GH/hHgKZonIm1N7EUu
         boVg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1GoUMCK3VJTqvn8QKtVDVj8PLMbhVHxCONQj7dCqpptvQUx+p6Ppjgdblm0VariP1gubO2PvD7u4Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzxOu5LJG8UaBhlZaW/dth+gZoIbx92lNm3eHUvGDfhKKs0uLWA
	42hVtOaA1antp96cHvdSogp1/ZyU0JqBA9Y+OtYfNC0ptIp1WoLJ7k163yPqdLgQGByWCHZi0PZ
	bP9F1u4v9FO/hrtelhWLEQ6WayP39TH/vw2WlAv9r7zBQefD88TLv2tojcxMJChcQ
X-Gm-Gg: AfdE7cm5jKVAnR9zlglf0s0SpmB3IFSKk5NZ3faS4WIMFxkz2kyjkA/sQcyfv+ovlBY
	8KBKD25+3P3/zWZkMHY7imjdp8HiIut/DpXCoigkb1dvh9ogL2Dm/KJcq20dAEA7lZ1wJP5gZQB
	ux13KzFCjaIJkLlPXDO70rxDufQ+i9PIh4vJVjLP71gQxbeI//8cpQb/VUGn+1EQiwZOkJQUuvV
	cg2e032d70vNe0864m6+9qhfcam+GyNwflLdNljskzhnlOwBorrcuf/YFgJKkFN1hJCQARv8TRD
	l3U0hGPkSeuqnA9AA5kaAEYvx+XKWII5i/39QoGfDTs6WdrTR4QtdhujZ39ZqSmGeAhCVV/CWfu
	PPnUA4K9jSiNjMqc=
X-Received: by 2002:a05:6a00:ac03:b0:842:708f:39be with SMTP id d2e1a72fcca58-84c292cf660mr13294390b3a.5.1784544664826;
        Mon, 20 Jul 2026 03:51:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac03:b0:842:708f:39be with SMTP id d2e1a72fcca58-84c292cf660mr13294369b3a.5.1784544664408;
        Mon, 20 Jul 2026 03:51:04 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:51:03 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:19:24 +0530
Subject: [PATCH v7 08/10] arm64: dts: qcom: shikra: add WiFi node support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-shikra-dt-m1-v7-8-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
In-Reply-To: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=1908;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=8/FpCKjXpnBa78fkZAMzVCGiZKnCnFSw8zBEtlMuGnI=;
 b=u6HWq0hutlW4qBTUE1IxFWoP+iiEQms5ZH06WNsfgg0KS8C6aI4eKMiFkCneCg/qGslYORhO9
 uQ/n6XwT8YICRS03o5aekJYImY3m+L4de0PXxPCAAdr6OEsB/8j8sa/
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5dfd99 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QXJAvSDBUSNnL2LUfNIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: mzwlBG1XUOEApI-5nOjtoRGqABmZS3qe
X-Proofpoint-ORIG-GUID: mzwlBG1XUOEApI-5nOjtoRGqABmZS3qe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX4FD6Nn+ZzRvW
 /KLQviIKS7uPElRmCabq9j88BkjqC/QRmkxx4ng8qy8qPxB+dLvjdb5HoE6yI/aXHrrQm5nWvPx
 2gjVs1I1Auma3Rwv6ipfxRb65PBKdnw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfXztH5RHNTYjml
 WxL7DK8myxvbG4vjkuVIR1KU0bn9UHRBE4lC1LJWvx5HiqqQ2v1ZLkTNZRlku3+ClQauqOGpuL7
 s8qnysBUN4xAqC/0sbIlSwrUzMbPd25epxtxpsx4/UAV/XwYsbVxxExhpQj2b6yfXb30qVjyIXu
 QdhIza1esCBPh37O5zHSqJvUY0l5401oasJbB5mOBmgY/JcFLmBKrhg5Th5uts0mRzCrVtw+KxY
 v2P+0khVUYQe1NfKx/IkAwxj9ImXeSTM/4nkjnLD91eM4xalNz23vydY+JC8Mi8hIKWIRNSyCQT
 GAPbVaH3X8ETrBuac9j3aHvxYHXXKONMcSZiw+GtbxhEEF5Z6P9zUaHhdbUBgPUcGWy25idUVg0
 rqo+YFlp7JAfC/zP9vp2M56P+IbeT2fVF2OgPu5bCowMj82JIL4DZpAmV9YRXNAGt+Til6EOwGJ
 AGUrY1AU7bfmxHPQhiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200120

Introduce the WiFi hardware description in shikra.dtsi, including
register space, interrupts, IOMMU configuration and reserved memory.
The node is kept disabled by default and is intended to be enabled
by board-specific device trees.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 3abd0a686d0e..205814c4b349 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2079,6 +2079,29 @@ apps_smmu: iommu@c600000 {
 				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		wifi: wifi@c800000 {
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0x0 0x0c800000 0x0 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_mem>;
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&apps_smmu 0x1a0 0x1>;
+			qcom,msa-fixed-perm;
+
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@f200000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0xf200000 0x0 0x10000>,

-- 
2.34.1

