Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D8F397923
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404538; cv=none; b=Mmah/xyRw75ynq4wmXzeanMnCUt4Iai/IKRku/k9rMRFvo3vTdgdsLLAws8DgCUaPd85reRerSDOPu2dwAhDHHlRn9mFZ9+Zy5/Vtnmn45L6WNjxwUkovtss/3C42sqi3u0aBQSH9gnJ+y7d9BiJ8ByHYqhmLTMz6rA+8KBx2KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404538; c=relaxed/simple;
	bh=JeatBeEgQBpNQ+47fHavyvUBUmtN55Pep8qBWx831Mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3TYvg8rZNY8jbGsV/JhMezBShryzi+LZNUKtWl/jdCKB/b0YQxlLFYwUripr6wcN61hZe3axpaAAA6P66YUz2xbPt4G8Td6A2ePICFLseSSOlEvm541hk3dSiGxxjKaqmAH2QMxNoaU9Swb5QJctg/G7TQ6pwtRWKdg9e2giWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2XRmC9v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j22uHIAn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2XRmC9v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j22uHIAn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6P2AC2574924
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4r2KBrsge8lNI/uWrq/Be2wfr2s4MkmN/KinCueTco0=; b=G2XRmC9vAp9Rp1LM
	fZUlXfAUV3v/5kBzIORosH4cXhy7xfGXCocPiPAJggWV8M+kZPA1n5j95jBijvgM
	PZR4Z8aTCh7jBHD5ycAvLgHKOaoqLaQZnNOIGd56SCun5GD+kgbwwi5kEtxgE/aq
	NSmZW27XLyDaqOp9Dfn9CX2P8nl7BEay4QKvqYqZOf2eNaeW6VxphTxt5bVa6xhF
	geqg9tc0DtDhqfeJsyMNlvGGbkQisFpJW6Bg3mtb3EzXLtyUnzcbzLR6vbSWMESh
	ph+cyUQ9nTeRP9eKVJy9R0mqgQogXQ4tOnZ8L1a1lrzxVeMO5ZvJYD3uYiOTxF8T
	ws0Oag==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9r56k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:31 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1431ba79941so849272c88.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 23:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404531; x=1791009331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4r2KBrsge8lNI/uWrq/Be2wfr2s4MkmN/KinCueTco0=;
        b=j22uHIAnqJUHC6DobUOJo9KLag6kFsTzTK7907IIc7i92/N/G/yTXWM5d/5xNpD4xo
         89D9AWmDUJDWkEs0wVQ7p2vNQoRvMJGsydx18dgp9GsCmT4PjzeASOnK4pT+BB7/Jkj+
         loydP5zqnJ6y4jsnD44rIciiV21RPbOOU1Cd1yl6h81PlUlpUMeXRLhe9PlMJ0fbZi8O
         FNVVh06taBnFhowZUXmiqHGrRde2jaUNh1M43yOJE/04DSM1Rpkf88qK4I8g2KJlf9bj
         loADusMw9W+P0xzEukjQ0Xk6dJkG1Zbhfus9YZLqDtR1Ngs9tBbPYjAKhVll1sKrjL5F
         Ztjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404531; x=1791009331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4r2KBrsge8lNI/uWrq/Be2wfr2s4MkmN/KinCueTco0=;
        b=P8A8qocrnZ+ugnVxGDQqMK46DURm5AIor/qLFzwKW3Npm6H5HwkVgx6aPe1BkR+YKB
         UXbzsM4fl7Hmb6Ls3NENK8S6nyUvYm5eFZqHmfLxSOkUql9poy2Rmz5fRxZUy+Kbs7P/
         YtocG6Is/fWQ8O9o73jxgdb9DkXTrgqnO56UUCjAbYa4T8KObj8UyTrQiU24K0MiD5Ym
         iPazwWNB4HkOCCmBas6v9Ve43oT9AkNPt7XaySvpxzn3iR88sv+5HHJxvhVMQmj8xtxW
         0nmdm8tEYeoMBlMzli3n2ok+sDsYLnL6aDfZMzLJStIpQnjKBpprDA6eW5sbZ9IsylkH
         3k5g==
X-Forwarded-Encrypted: i=1; AKwUvBwIWR58gfbrYcwF6PUuU9Zmt0lDVp69P9+MV3Hrh2fjnBQVqplfQIZIOrn2tUKyszbLxV0HWK3W2O5n@vger.kernel.org
X-Gm-Message-State: AFuF++lh2/JNFlQBSagF61UCY4hCZsLe9xyj57xFJfQ7QTmREWlu1HHj
	wsV2ek6pSnKmoMc6Xj0WZQdOCRnR/kHBiCGIPGUHDtZmSH5xaW63T28XYAYzgiW86URUT5BfGps
	9eggirzBZPDiYUNYa8BMEYR4zMMeQjy+Dc+8LnHc5xqYa8nDOwtfUOlHjCVMFZtEt
X-Gm-Gg: AYBFou3ZG2DqxCOO8KY2aUGWLUeOyVl1e1Bi9MfSqd1ra93a5kdp+O1u6VGwcRjIo9b
	do7YoFDAipZuj5Dm/A/ApYaGAnxFOtegVpzXPvq25+L4Srj1oI9RgDmVeTahjoPQ/yGCY88ENZA
	mHiOxL6Y3oblbC4gFNQlJvJfOE6ggYJn+uEC4v3fjJ+wu4LGFYMsg34fq7eQCCHQw8cr4fMg52H
	hmv1x1JKTjTcvcFYTWr0B6woz2T70e0MY3j6C4++W4HQhpvL0/4cDSRWRJoM5N6Mcajs7HBy0nL
	OV3ijhYxD3opN9IyoAvhURhPjodtoYbSDUEu/MRsRXgu9q6yE7pwc98Uk5OF/KWCWm+McuXisbT
	cztqbJRvRImxcTuyg3kY+5H4wR642A6pvNQ==
X-Received: by 2002:a05:701b:4314:b0:143:50a0:56d6 with SMTP id a92af1059eb24-146cdfbe26dmr1832528c88.7.1790404530915;
        Fri, 25 Sep 2026 23:35:30 -0700 (PDT)
X-Received: by 2002:a05:701b:4314:b0:143:50a0:56d6 with SMTP id a92af1059eb24-146cdfbe26dmr1832500c88.7.1790404530367;
        Fri, 25 Sep 2026 23:35:30 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:35:30 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:07 +0530
Subject: [PATCH v5 08/13] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-8-0322ca5dc10c@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=3399;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=JeatBeEgQBpNQ+47fHavyvUBUmtN55Pep8qBWx831Mg=;
 b=PlmiyIHr0Ap/yAmfx6s+hLQS+XVKalhA9uvS+87mKdVJqnpjdLdwykaEvy7zPDLzwG78mXQgP
 mtTXg5qtAg7BADltUwHr5TxuMI4yj/nR5LZjh61z89f8/yHMcoNx1rq
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX7Ne9vkfgjMaW
 yLyhzdubDAMHIEGYD7jc8503R3f2VDFWbIr7XXeW8Y4GI3bYlIEIyvU0mnRPLgT3sYEFIkri/1c
 VjSeTO94ffWEdf1o2K7wJHXVe/4MLoo=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab767b3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Uf2kLE6mUxdp0IpbQ9G2_1ffJnTAT8Nm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX1lCQap107eGs
 BYxMBedM4Fe+1gx6Xq+LWrJv9yMeMzaVUjuSSDhemdWCToH4GbWPZuAsm4pIoYhIN4kPCKsBt/E
 ABVhEad+25fqzDnVT7pjzDps6uHOd6U+vUMKGB+h7OLhOdr03/zLu5zf+Xmb1WOICnj6J8pBHrs
 /WzW8dhON+fmIhGmqiqsqAyBnq86MCQ5s6xdtj/PnbPDpqw2weh1tuS7bj+JJD4BzBBC49gJxl0
 gz4co/Oe4JiGeQwV3HOLqFOy5n7Uiec6zThxAybpSZ/PxZLeBMP2ozVxW+DMbPdhs1NGDLQAuFl
 jfrZbg1bNcvZZOuCixJnUh3xtA1BAd7G73NVdDJaoY6oBFsTvXBs0OBrUWgl8N58zPt+l/+ZVh6
 de5KUX+StaTL7CUZU0O4gKDuaQCZUSXRWkdH7r6z+48KKsGove4LdIfa6Lh/6HCf6Q2isxCaLxz
 jApxkhiGMpP0Cuo1cFg==
X-Proofpoint-ORIG-GUID: Uf2kLE6mUxdp0IpbQ9G2_1ffJnTAT8Nm
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

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4e35254cdd11a87eb5e4817abd09a603522309e2..9819a1f5686ce92c2249cc1dd65a491665fcfb94 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5468,10 +5468,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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
@@ -5479,6 +5481,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

