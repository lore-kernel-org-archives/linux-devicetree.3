Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2036A34D
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239329; cv=none; b=EZ2mNvIj3hrrl/iYymtjbWTLlYuGeXtrr9/tCP3gItK/r7tc2jGllfF522DnVgE9B0jrm95kPFYmEadslZcH6YCqiMQZ7Q9not+pvCNbPeXQ8kVeozvTMbbvdao8fWSueyKlEp79Sw9A+CpOB0dMo5Kp39g3QKSx8yR2itTJCog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239329; c=relaxed/simple;
	bh=VxVfs90+RVyIFj8A0qDzTyazRfecJmozpZRL0X2Homw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y61ZwqzCFjeJcXsjrEXQ6t3G4/sFx78ubKQx97TB7+tE6ftooevUVaYNYgJ+Jpk8vzxoGZQhmE5E8TbLEBnpdbqMXGBL0pVPhDkwMsJZH+WeUZwZsRX0PGiJZ3kYrhsLWbver3oCGnLKs0mgps7gQL5CB5WCg5qj0g0urRb8maA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hw6Uej52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8ghNPQ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hw6Uej52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8ghNPQ+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6651j5fM392296
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=; b=Hw6Uej522PtLL0i7
	AAjOq6lllFv7kxd6XU77DgLv0U/97Vkz4XF6yNeEzalbgTu1BPmgeYEeTpi1yloQ
	CBNAj58vinX1TxVcisvmbVu9dccnNB0z5ElUpQXwK+r9XRRv9/2iHoyQKSYEWvXA
	eWCKJGepkjhAIp7/RKAVbKS4IKtYxciDkj5YrtrrU7tMI25IvYfPbFitM/xUYqJV
	bO0NBVcCOpXJZuWXQGIjkSJkpf9jzFqyUQixI6IJsWPWH1+TfjTfmcbD1iHP8KYT
	A5wBo0jYfeU/OfUEGoONWXF1bAq30ioHB+KzlWwHdSr2I7MLQXRkR+4VnUKanfpo
	SCQnCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgtnj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:15:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso33801265ad.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239327; x=1783844127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=;
        b=M8ghNPQ+7B27FI9JZ+L7H9F6cbZpnu0TxSimAOwX6Wy20PWQjJ7YciQzaxBft7tOZ2
         1DGgAQZVvRYTQcdLVtAxgDK8xkUApbRrY/z8AMyxJiAXUvzIP6m4zw4D0BL8w+Sxylu+
         OZ9m+JktMVDdRGh7zkB8G9SN4G32zWshQoZqAP3AYHhZEWW2DzZ1E5aQyJqdugaacf6O
         y7qcaKGQeSwKSHlQ3sfxAIDPUbj4y0nldzpaudLHhXqlF8UVoyDWH+wJm63hpAeoT+4b
         hLv6PqIGqYSw1PJpr+URMx45j9lY7wVr4cf//BF0DkTIQLtOWRhz84IfXGhrc+HBk/NL
         WBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239327; x=1783844127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=;
        b=jWMdtZOzXEC7NgI2Ya3OipBjwT/KuFV2AbFhWdFic5cSuCpRb0jvhnZejiYmAJJtsL
         0O2sdOBmX4cPmZi7IYz+xbmvbuaZxeIF2OBuYbGHBufa0TNGjIDrVMfPDlVJtTl3VN19
         FXqmFDNW1+KwTy/izVY7KtJAmgrG+L/1/zHWgNaxMYorvp1PyXXtqrdojFp13fUmUl39
         CcLV/wWhlbm4duwmnW5aLINHq/6HeOJenVyGrBnRiNKcQZp7aZ/IYWtKAmwJH4gXmtIE
         RoSnDJeC/oRBMwpVG/pGSPTXFTTqOahoFTDxJU6paan2RuIIUimj7pZfNFp9gVYnz3oV
         xX6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqKOdbnjccRoyFEhsKnJ9qfKy5vfWNr5ZG9r0I5q2ot2qQj4i0Gj0XH74k4BFJ8PJfCqRhDpXRRNbUd@vger.kernel.org
X-Gm-Message-State: AOJu0YxL5TOtUfveP+NxWqAqKmEOqEobqrQQy4lvHLNV8RBnAXbWX7Jy
	HOCpR2zcXkyJhmM9sanbpLs1k7SXX9ZQJjbZ9tfwES3A3b073+bbuQlKIDkOU07xg5zubPWB/G5
	rgYiGabgf0LXZgfbZn3iCGvhwj7VFG08ORG2ppXkYKJ1QHcp30BIaXF+qUOPQYVEM
X-Gm-Gg: AfdE7clUz/jXXOxB6oXgzFnxdZ/UOpnhqmaEytyrsZLE+PMksXJthL7sOXtzuhPeZFs
	nbONEmNDmW0Iv6ON2C+sRm8tYgjlkwrRmMQjmFhm+qF09hRJOku24eFMEkTn95NWDwDVyMssYFy
	dzbRTZ/So6Ai3U1Wo88Weo9aSJ8cQPSpxAGGz12cBxksUlRIQDv9nWqB3Hzma8OHprSAeZAJTBW
	F2RajpdRukh/Et2VenNv+xspLJ4PTXH0SU4h3EW3eDDiZMixH156+M3wQngWgqoGIoUTY9SVy05
	KYzBHGdETmvoC6pl39oqjdAGR8x5S7e9JIUwNtXWRmwergXYJ/5fbfJHVUsRqC69PaV5zKAeykn
	afEkw4KMgiA21I0/AIEr/sum7xl4wDrZMIlI=
X-Received: by 2002:a17:903:22ce:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2cbb750dfeemr62830175ad.15.1783239326725;
        Sun, 05 Jul 2026 01:15:26 -0700 (PDT)
X-Received: by 2002:a17:903:22ce:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2cbb750dfeemr62829785ad.15.1783239326208;
        Sun, 05 Jul 2026 01:15:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:21 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=2286;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=q+INaEIUNj0EXeDmcw5Jx9wg9/Og5BIcLTww5DoAVnA=;
 b=MohOZP5BSd7gGPu51pY6rKeL5RRxBoIVIbOgZlIdE/wHpMOl/l34w/UKkxBV+hgg0MnC/fet9
 g1adGQtY8KCBh/oGiWWKyTQqqhJ1+0LNhTQDsT9Ph0U7ePkTzbEp3qg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4a129f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IlPRAfYEAefbqxDJwzkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Q_oWARc1i2Y-58GpvwIPXda-7HJXo1Jq
X-Proofpoint-GUID: Q_oWARc1i2Y-58GpvwIPXda-7HJXo1Jq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX5Zn3mRxd/niI
 pGLFbouwidD/AqCmcwLD9KY++dF4Mr6UylqAhfLvSko7H95MfjBYOwUkvvhKUFLg0vWbZXXmnyo
 MDrkM6xIPcXQpiYwD+FIavfau26TJsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfXyIeFoJn/g1Ro
 j/D2YYOWVz8eq1XoMVx2aawqIpk3VYMhNyMh5LJHl0NKLlHJAnVS2csCQEpDNEF2qgk2PgHnyN9
 wJmOqI49HQgdSGwk1qt/hEwak0VEittICYyU8BBcS/BUbAStufhqEicUN/2iZLh9F2a4+3qEQLs
 VPK3/mi98zJTShWwDdAIqrXEcn77C4yV/ZKdqHPxhV0CYNjSasIjtCwJWvJyoxt1JairbskgaB8
 hQ5tAfkWIeGR/EHSHlDFiIhwDibIm3ft9DjdsSHSrOjsb14Xp4ZP4C0knie0gSyUWaZ8TuRYIZD
 gQ8FoCASTq/fUgDQN7on6X0VTttE6OFtbn4d3GFqduADMCl6Svdf8sTB9xnvykFCyCxIMwMatpN
 5G2rEbu9WS4A05ig7wVddlLuP6KH1A0nWxJRA6R659hF1FAR9HlNEcOGyc6UeHgeNi7t3xGmBbI
 oJqrxoPy2yund6cW9QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082

From: Abel Vesa <abel.vesa@oss.qualcomm.com>

Add the nodes to describe the GPU SMMU.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index c5635f22e2a7..e5b8377e6c3a 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,eliza-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.54.0

