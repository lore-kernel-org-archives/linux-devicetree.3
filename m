Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173143;
	b=VkVmef9etT8b5ychpJ90ERvjm+J+HcMMrLsP5K7eflO+Abbe2VaXSmP3toO9OXh+WXvH
	 EOYUaHkRXdiRMJlesDGDM/6dQVZFrD8dv43gLyL+6cmOyf0EbuMufB3GOG52L0p8A06eU
	 8qvkv9PpY1w1ozODZvs4qQrDHE8NKlaPrkVVxkxKKwFD/BmSfYyv6YoMQ/c7Vg+YERpF+
	 JrEUwXzyklcf+gkZo/NUdyxkDjpbqh9AYoKSd0T2JkZ9N9eFCwf4aMx1vxO9Uz/ZOXSdj
	 GtTf+/eT5LbfxTIHe4FrNAubjJvKONpfo1gE3+kc3fFcTyjn4qHy+C0vYEhk0Sn3szg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BnsiO6tEe+0XlaUCsjKFf3winZ7KzDFKo5E5uQsFUXU=;
	b=eS0DmqT2Jgas66TU533Vgm2u2FGJJk9DIwvW2OCD/eMlrQWOBc55WweioiqkoAGZSoU7
	 hJZlivsUjbRUuJfNiN8o3ehQHcKg7A/SqPtaZXF8qxd9APm7dosbHJPYvHvQrQ1lIHmnd
	 kiJYTDZ3TbrV0oLgQyCvkAKb4cI5EzBrT0Wqs/THoEKzJlGAE3gRUaSJmGYGzoH6du6/r
	 8pIOwtF8WJgv/XAvDV04z4D0XS/HTKc2TVGWov25piFe8yqDOWPnVQkVpWpyQcZnXNF1v
	 D0NhS7KXU4UDjCFHtDr3d2nKdeC3rQWPeejl2kMWK7tOGcrB/RTm5SCURWhWd8KcmqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0xSYNwU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N7GHM96v;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E460A3821
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1E460A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0xSYNwU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N7GHM96v
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkL2h1170033
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BnsiO6tEe+0XlaUCsjKFf3winZ7KzDFKo5E5uQsFUXU=; b=E0xSYNwUJnytfnuK
	Ntw0AxdK6igLlduQxBCEqx33Ur517omNMchi9CtJzfIpU29RIafB9/WASDHk2m0A
	CRUyMPX+NtvQbP6voLeY/Bm6KCmzinFtoOoBIdMryN5IvH1jYNCm8d8TrOX9c/Cs
	3n5P8XUwobdQcD4RE9xyrVdr4mfNtRCtYA08BDEQmh+NaSzg+EBn8z9/chnnbJCc
	Eu6DUbTp4LUh5yp5OcWzpvsdjoa8cQaCSlDCex0PxNNBSsXyTMAxlO36OXcuMlTY
	p1z4x1+rN8o2or7LY3InuSNTb8cYk+cvOUzV8x1oIQaOR5Dr1Zv4Lud2gpzjrtgd
	dLNMIQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5udj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1807436c88.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173141; x=1795777941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnsiO6tEe+0XlaUCsjKFf3winZ7KzDFKo5E5uQsFUXU=;
        b=N7GHM96vtBgarlGJ+2WRMTS+dfCW0z+aSFnJicSuEe1uv/cmtHgyJgj4ohvdtFOYgQ
         25WwSv5p71Q0oFrH/GrLinPZwQhm4L5sdKs0ucYB3a4wUP6qaQdfSARBGZwNswI2nITb
         NzHNLBw3q0c2lsg50TS7WKEVLisqjszHIWU0FLtuhfDOeWdezkw/soaSs1fUPi/+pltf
         34F1JVMZu8d1QOS8WUKmcSuip76tyGW2AWrqFzw0Gv/6+Z/NP7w1tOokG4hEIinbAyTc
         M+/lRtgxHBYoZBTP9hrmlyZHMdeh7y7JBMS0sJ9UP4sWnUx7fSoWJhcQ2TERpiuB9sVE
         RP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173141; x=1795777941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BnsiO6tEe+0XlaUCsjKFf3winZ7KzDFKo5E5uQsFUXU=;
        b=Rn756yIYBDD2Ifvs+tDgUR4TJLzFbm7jtz4xAi6sf84FfA3ibrl0I+1BOx9fBRDdaf
         o2yv9VuWBqEnCYCaxbZZs2DlKTqnKC26KSULWewnJt2Nsih9RtBx2wymkwDWiAeZcPDC
         uL6VyE/AOfrionrUDq9PYCnftsK0K7biLYnDwvr2h+f6mT26Y7W7d6V4SpfLM/u3yL+r
         /PbOpqcfx69ncZ+gRj/s3bhUNpjrq94zBexk0iEskIoIMbEA67fiJ/JmdUBN7BH9jT5O
         kwXBVMqvLzR9s9wkYxWU98ALOrDt6D/tVeloKWxBXSeqtToKvadqgYh91t3hi01BW6h3
         yGxA==
X-Forwarded-Encrypted: i=1; AL+hErEsTmh9W9ubcdIH9qZlPonl8PLZxO+bPtxVFC4RE5b1lCKw7J5Ot0vrcyHsQkPfue5x1/P5gz9Gcl+h@vger.kernel.org
X-Gm-Message-State: APuU4Z9uRnQtd5TCGKYrorF9PZ/QJ6Ygt+9/4IvU8viUNpPR9P8ltByq
	ybHhEOnDI6w9oPUW103VzXXvQtzCXvOAPe46yFG+GmOkufZXYxok8DqeE3HFTMNQw1qTu2JL4r3
	KYX0NCuYVtegdDCu5s0aN2Vdov620acSLSbv8gYOXdW2i5oRir3T5HRBu9aqNJpDe
X-Gm-Gg: AYBFou2/JAsSq8l7P5HeSI60+ilqe2ivxHSM0Oad5Rn8KemZfS3b58uR8oKsVNN67h5
	ao9Pr1vj/eZHpwc1uKAnrBBydxWeBRoamyvr3D6IFNuma+FDxJ/XUV+meWrpAZClfSc+PmuLLfQ
	gd8c4140oVAAmmYoyD78QVbPqA5yn9Dss6NS6FD55/581QU7KotDg8PDnU5YDZJ+Nz3KpyXefam
	3JR2xylFK2I6uWKHJjbxWK91g15/XSO9B0wbpJus7hhrHHDlDFrIR9NOsvwjOj7u45HwLUJXrmd
	T9E/MYGfMtF4wC+vziD+tcvtLSYK721Zytx8rO575WMWMltpuP8hqWq0Plx9Yh/DSu/G5hdUKVo
	cJvuPZoKeCLcHDCPM2wgSrpe3wfmCZsTn95L8zWbQem4Tk1Fzy+hbXzRF+vsWidNVCmnyKnVPhh
	OfJHewvWhc
X-Received: by 2002:a05:701b:4555:20b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1b556894b6emr2869505c88.14.1795173140720;
        Fri, 20 Nov 2026 03:12:20 -0800 (PST)
X-Received: by 2002:a05:701b:4555:20b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1b556894b6emr2869453c88.14.1795173140097;
        Fri, 20 Nov 2026 03:12:20 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:12:19 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:41:02 +0530
Subject: [PATCH v7 12/12] arm64: dts: qcom: sm8750: Add Iris context bank
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-12-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3734;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=ZoBLsJP8OPK/r9jjMG1REh93QNtuhLMYdKPTdxvLHKM=;
 b=rKO7tJpRoKWUyb8ejx6Z1Z2EdFFmTJWvFboYPtrLehEiIEkWzhDKWawjgRHQ4QaVzZIk0mg2w
 evoP6rhcd0YCCDpcqtOvk/MDFZoWfkMY1aIcS1pILm+LzrKvZB9o0TZ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1Pr1GLaoulxU
 zivy68ekYjr6t6kpKaqtf4UEVrOBUW+HmLk5to7p1xBMoQDSYZYSlhLD1X4goQ4W9qO/fjrCvnn
 H7zVp28sPOtuBjWOjSAwfX5tRn4PzXk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX35gTZhoo4vkj
 eiyBTHiYTszwPOuM4E+aJ9jdlrWs0bAPjPNyz40lOMEzIxNOiGOAE5ioBFTu79df6/RLGE8euEM
 vHL0f+QAbYO5BFtPcBPy6RGSJwCe73ld3ii7I9JUM7s7khE+2c1se4RZbDNuHgy/hP8bPbErQda
 55T5zM8r3BS5vLRaxap8hOPPBxAOQb8t+/ZkQbTqdAPI/eoo0UApsa/Xs3liHVsn/p5DcxELT4w
 sdDqvCASTT+HX3ns0Fjqo9XMvxb+N3L7bevqD3gW1ZUDMYtvE5dzhE7e+eAj92MpPfpEceM72s8
 Xg7e5PLVpsvZXmgSh43ci2wYlkk6+KnsPwi1NkNUijr1WKD/5NHUn2nzWaem5Dl0XAqaIwSXbhD
 U75Gr7Iu/o7CYMtye7ZfcxC3P3kphXj56sjBker3CaVdT0eIfXyhrYor6ZERUDpLKsBtcLd2trX
 7Kxy/uLuGOUw1GxvSSQ==
X-Proofpoint-GUID: x0bw8qH-8aOQ7zasl5hnbfvhEkXvpXN1
X-Proofpoint-ORIG-GUID: x0bw8qH-8aOQ7zasl5hnbfvhEkXvpXN1
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b002b15 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
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
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb15fb1d0023fb8b5a5a59a9ed763b..fc9485161233eaf74fbeca2dd9b7c8cd719657a7 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3247,8 +3247,6 @@ iris: video-codec@aa00000 {
 				      "vcodec0_core_freerun";
 
 			dma-coherent;
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
@@ -3281,6 +3279,10 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "core",
 				      "vcodec0_core";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable in boards where the proper signed firmware
@@ -3288,6 +3290,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

