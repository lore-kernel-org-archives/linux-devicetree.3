Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720532;
	b=tR6eFNEKSG6M64tPG+G6myOkF0pc5SjEqzPsHDUiNxjaCYgCQa+d/Kh0YnwnJ7oAX3bo
	 7LYK+C/1BQp2jYORqPRRknmdHLgDtckUaKB1ghDO9ax8WwuYIMLYMQ9uSU6ycZzc1Hfvc
	 6O5SlzR6kllfcoeN0NI9uAtk+JkN0ZzhAFL3OrVFh5mHT4ZX5gr3QRAGVWbhPnEeRU4dC
	 16v2HmqeSMLVB5aABP9Ygqc/C/aS03kMh7FtSLfYsMgB53bVfkkGxMDzdVPuRvp1FCP7V
	 kSftK+BBtpikJncpu7sP4EntMU0Yf8wGTPdRnGyNWNU6Eg+UIQ5X2ba9dH7xREqKJAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UgvlepBTtqahIecmqXkfBWfFggm2vHFuwenFN5tlyTc=;
	b=i5W8ia6D0rJRSzwtrgIChAooArm9nJ1vqZtNLw7eQzgTZaLJmGUAT3S7p3j0L7Jfl7xA
	 c2xyNNnYSUPsC480LdFV86Ua1HjfuvHwuhyxARFwN4XwuD95QnsjlubUCz0u5RCLvYJ87
	 17yP4TTWl8QoHYQAa4DPGsRip3iI4pVuKBOhkMzdARSAHSnuqaZYIgdtMQtxmGmTDtlzv
	 fWxd6aCNKtdeciYx2Qx4ktGI0ql2ciglFw6wf1e5r1rplovaozwd9TSB9NjcF7Q6QFmvb
	 mzUfboJg8F/4bE/sEFxaViLQU73k4v1D8zWVHX+xS61ClccwILN+xMzPeZTndFPRINQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOzQOjyz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fk1eHgeg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C521D606EEA6
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C521D606EEA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOzQOjyz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fk1eHgeg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EAKPl3658536
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 15:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgvlepBTtqahIecmqXkfBWfFggm2vHFuwenFN5tlyTc=; b=eOzQOjyzmFOvER5w
	S7xyaFTOnV3KgvzOFlxfPc57Q0dlwConvqGG8B5wucCleoY5T4jBh/hik/Kqxquu
	RRq+Or6+MU9zpXvfoo0I5HmhTPfeOz933D63bwZRPCv0KEftU7IkYDQeeRsBE3GV
	3B/b1hwftvVz+hsqKjlHOSTMPO+Vn2GjsIxqXmYx27qx3gMU7W2EtGc/8JHUdcyC
	/PDjHhyJjtji+O0p6qTIkC4xXVp64HPKUFFy/DBshI+1onfe+znUSk6hGInjHhuG
	PCTI0NjMxWdrL/irKv2eD7dr80Uqs58u8s1DN0oQsI6GlEenRb6B/HA3iU7l5gA6
	Ao0+pw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94ctft9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 15:42:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so2259467eec.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720530; x=1794325330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgvlepBTtqahIecmqXkfBWfFggm2vHFuwenFN5tlyTc=;
        b=fk1eHgegjunLWILXetQ0mEo3Ce3ZdJ9VEXUsMYrffXgUMOJWFHVQvb8WSLeSoKE9nA
         nJxkXa1vkOYF6gYOfu+JJvizPLJKhLBC/iM4rEX0fln0NyQ/ZCn8j5RxNpjX2i4mmiDy
         DyFH5f8tYbAQaeEKoGe5cgJqAKzklT1yh2BVxeP995Iq1GwLxKDxRA8LjzOs31F0ALig
         mLYqeJZQeW/iwlAerXR2wV94kQwkwuECPU89UX07gD3IgVlFpGorQZQR34g4tZgpDc6R
         kIN+ZcOkjvuBSk2+u0Dz7dEeI1+etlstXtqUbksyIDc+WtLu41YRM82pRMBWzWfJmr+H
         yobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720530; x=1794325330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgvlepBTtqahIecmqXkfBWfFggm2vHFuwenFN5tlyTc=;
        b=e5I8LgNUsBT7XZ70frev11ZCBfpunrKpxkcX0OUWHVwoPDPPgCT7/ESb5xxXWkZtk9
         LuKKvkdvzwrY3eLEGFYnIVtjQRj8l1CiTJz+8KDnqJmupvN20ZubH/yvZ7dOuZD5mmZg
         jrJQsXv9jygSuX8sowevpS3JoM3znOfPosTQjqNXOR3v64tPF5lQJKMfqPz3L5xX/BOh
         Axt4xvXLxhI2MHOHXOfQTtR9MVeC9VH3YpgWv+q5q8IcCeucIknC8W2cOvWVQ94VCZ9l
         ULTB7D5sjMyMrXdoI2FOeVVX4+KjmAvML6gFgsaB6d5zjxgy+BPY+/qW1V8ZcPxHm+4b
         pu4A==
X-Forwarded-Encrypted: i=1; AKwUvBy+nUB14baVlodk0Oi/0xR16u977qLHWYGSypzSYspalW0JUQD4s3bqUt1DrTacaksjXNgUKL4KDvMm@vger.kernel.org
X-Gm-Message-State: APuU4Z/RRBWBE66TgvOu6lT1R4/g8oZQ+yKNrYxTGpYBWzHkLmWHgK+Z
	/3LBMpbjBCn09RkNXzjFXtLtr+g5ZlSrj50j1j2wP6ZxKZywRcI0g6Q+NzrzHxxejpiDQfajO/1
	auVWhFhr5HFvJ2caIKPwxfJBagYx2sdkyE2i8UeBH9Elk4A8TCoNKuU2HnLxX6pli
X-Gm-Gg: AYBFou3b5MYC/NynOmDlNJWvJOvan6MgakWZJckgpW9Zxo7etAO7Wq57GCQSdZtopFH
	4m4NIuugHM+mNr+zMuuPUoJRzBNOVDz8L50T0FoIGo9HMWT5cPZKIbQegBOqZqJNp+AUrf0M18m
	amlWMLas1/rb22HDUfpfqRvjNi21Cj4M0DnYrQwXCjV1an0S3eWJ1osqv2FQd8UFp7Km9lV7IGO
	Y+vjd52DJH0NItfRlnlKshNv0xOdGEkELwpQZmn+iafq1mvg6sgIVtPJLzgsovj/bqaRDN47KQ+
	8FZ24jphB0CMtyYR0RhPYNYiXldFK2tKIZvqrhwfy9OiIewi20SSoelXftqN9A/O7jXS/1HDm6c
	kxa6sSMTa6F64Clf5MPIa7IiJVU1ujZGL0KwHeo1wn+LLrmYbLNHGYBgXezTkMfmiYGlM2vn8s2
	pUvLa9KNRQ
X-Received: by 2002:a05:7022:170c:b0:145:287:ce91 with SMTP id a92af1059eb24-1ac59dd30ebmr20898978c88.14.1793720529577;
        Tue, 03 Nov 2026 07:42:09 -0800 (PST)
X-Received: by 2002:a05:7022:170c:b0:145:287:ce91 with SMTP id a92af1059eb24-1ac59dd30ebmr20898938c88.14.1793720528939;
        Tue, 03 Nov 2026 07:42:08 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:42:08 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:40 +0530
Subject: [PATCH v6 09/12] arm64: dts: qcom: lemans: Add Iris context bank
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-9-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=3345;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=seTzzjBbxl6K7I6LTMi0xCm3utQnLIA01q2r+w8rNNw=;
 b=6v1yhSdSLAqTMKH66cf1VFBwEqe+g9iteE2gGH5KAwtDmNG2wEMO7NjLFd3yDNaAhpssoFJzT
 VdMgiRzLlcgA2jmT3c/qH9ZoeTIVqxsbsmHZ36rNQOT8EjNrApHobrV
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6aea00d2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: rFQamEaWg8d5qosKtDM6RpMxrv9MpMIc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX1Op7kIJHjk0d
 KjyUAZF/y1Hrvm7hr1V+9bNBiTv0TuC+MonV3pjnvbARDZPGJ5F3nTeYoFQH4t6BmYSY1KSCy/E
 d4PwyVXCs6hBEw2IjepiAto1SpMXDVU5iNXYRXO5hpPEWQRXRSz9plxR6UPqCbWyc2B/YeAENL+
 gKadoJ6UO4kniNV/jSY2V8KJ/ER59232suZt5d/kxg5/ZGDjILP0L6v70ZYH/qasWBku34rHaLT
 6sPCiuANsUWOcUr0HoMpc6w+ygES12HNj3kayitpDLoBXR/0pH+oW1jaYagBSP3IJNwd/bJFT9l
 LB5pziBNMRhEcx+/tMWAx43t8vZ1GJPQRPRpif+fufN1VkWTpatZhxaHxrl3VXa9H/fSQV9Ouv1
 DC3wvfdxHQLxMBMWZbrcpYA0KQi+w9POeJ9aJ2tSqHFL+L2R/fMNCOEIsZJOUymS0EcAkac7HBY
 L5U8RR3MfE9PL14qIwA==
X-Proofpoint-GUID: rFQamEaWg8d5qosKtDM6RpMxrv9MpMIc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX2WKhtSKUUxiJ
 4YLTwamikpGg861oRGLbGQaH4Eoj7lOyVIKFAIQME9IJEEBwENldwarnWak0IzbE5+rqBY9hmOn
 3yAQRqfYas1pjk3pSQRCK7/NLyAon/Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030062

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
 arch/arm64/boot/dts/qcom/lemans.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518446ba2ea582e8362e86bba75c379..a7016a64950935192c4de803072a261f9f141961 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4960,12 +4960,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

