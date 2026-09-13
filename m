Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41A73F9265
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325460; cv=none; b=fY/BFwBxWNjqvV731cRvISjbjBvgTK1sYJBUutkz+7jxckVfcqK/ZErp78Pq4XZN2vH/Cw25poZOzytEOako9HpbL2N3/q5vMOKfaN7raR48o57FGpV5a8byXY00QcEQpNAT+00s53eBWS7Rh3RQmMbPQO5aaeSQL3wxBa6L0TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325460; c=relaxed/simple;
	bh=aMjd9aYFnA7xUvSYKyRihpubAtnTpKk18gq2dPNLq2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlMC7lKIXlM3dmOx8xFRCg3oEQRAx9I42uDmolEeJOa7kGOpZ+VxmdxQnjS0N90R4RnUJoa+2H84yXNHVS33qpePDHaFCV7JAThpxGz0FOCNv+CrGK1LJHzp/Nnn3htt/vtMdSNWRwnZQosLiL6ZOEOuQzKMoCvSGA0sACdMVPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJNAYki3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYL9KUWe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJNAYki3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYL9KUWe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2Yeb2450550
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=; b=YJNAYki3njIkq+3+
	s+Hk5kP4GzGY9RxHHQ/vVFz7fa/f6eH+PMCeG7cme5Ys+4tOMXlRnbAzDyvtbH+P
	s1BExDqtq/ocY4wpnMYftO40rgVTVGq1PqQSJlB+rs0REo0vyfbe6GRpzc1bkeOn
	g8x7JoCyjEtdiCvlZUgidvyGPaHngQpBx4N1WTYiBIF1X7s4rEXulTduuXohy7z0
	Xx3TJ7UZMk4/kP2VnnZzFildFhqvZoMnu1LuRG1b5zFEScNzC5zDLA21h3oGXyZF
	ccX99/SMhWSQetrQHibf08e0PYQSwZA0NMT+TUNDDxNO1NJaV3/7SxrRBELt9LTe
	Mzwj4A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d3wk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:50:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc7337e2a7so30877045ad.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 11:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325457; x=1789930257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=;
        b=NYL9KUWedAE1XF35/wWOCl5GhPMYwq18kUw7UsxmyY68nPpIhEWv5yo1mJR2W099PS
         mKGiJYZi2vYXy/y0/vkpQ9BRuXS0WXlmrZ9DZoy24/L66xVWAbEUbrQxrqq7t7Nprbrm
         VBn+2gHQDeEfSkG441tsYtB2h/XrGoGL0TMvntEUaR3suyU8q74WTLfXwgKw1KQpNF2k
         R493jMNNAzxRARU7xkk7hiO+zGQcraboLQpOc7GmmJ/h4NAKQMM444x77Lb6BiST+NCs
         iuJC9ohK2i9kVKkl4yAoHf4ebwua+T1sA5rWVyTFqbR8UJIMFqWWARoNQyp4Ta5qPvDO
         hrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325457; x=1789930257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=;
        b=Zs5HwmUXNP6N2UEBsLtNIFINbUNBbzlO0Gw4BPBBHzVOiS4/A9+oBO63+Jhen59+y0
         GWH15zVgDqI/SKiN88OMGyii6OqW4aUql7kRSEsu4RZqcWs6G411pvFkeZKxL5I5vIc5
         gUySxJ2fJD+8JMLlxnfYodVlqDTCDYity4ScES52kw3wzSxNBzb2fN0HP/xcPEY+3iE+
         cKSnTKVGmTBH6avkfBv6VbJzissgbaK5n2p1wVh2fi1r1hROXEn2PP2u8wqvVcwPfJUr
         N3StS0U1mc5NBQ7i0QnTXd3doX/AHNTdt6LcOkM5V+bglZ+XjniiiWO9ifGr8K3RYXMP
         rdGA==
X-Forwarded-Encrypted: i=1; AKwUvByxdMz74TLBgQwj9PyPm497BnhFm9Jkk048NFH5WbLiBDtwPuEIEcadCesBOokvZtJAfCSM3XcIerum@vger.kernel.org
X-Gm-Message-State: AFuF++lzDdUWSgRVwEGzRt7JgHg52Rf5zoMBzwacO1kvu8Scu6S5KXj5
	r3mXHwGJn6Yf64Soa3FNtiuG9Qp0nxuyq/0kJoAL0F1YUQAj7vC8vf0s1EBFScvMbGRjnRvS+f5
	j7El1loImXhi43B20hA7PyzOEnkS6D43e7oqIFNyZKz02Mz7jYht0suKKhf7saAkWRXcu4XKX
X-Gm-Gg: AYBFou0IeID692l9RAt87mUuBi2o+rbPQr+VGVeFY40EkAg0FozDvloqjl2Ya/kv4Y4
	Y4N8fZLymU6FD5JLiRMRbHxJJ9FxzMsY1eF64THYGZSNWQWZU1d/82wSr0y3oIVsK0zzrymcN2P
	myE0BHojJxcdDt7+hPxOJNlt8Flrg1+Jqp3DIOtfW1pBDyE2z9oyuWFZz5DKKX15C2ngeH6k6Tj
	WfArHi/5NrFhxx+ySu+Gp65cjhgXi14zcvCVysF1+FlKp7Rl4+XvgmDgBJS4mDC5W+5UEEyh8pf
	lCmRve/KEvTa0UpS3oHr6tA1OMDFDDkCgaGij2dnLCQPY2gSFtsAAfXcBmm8Zve5ulk9sxuw3ku
	vryhNabO76GmyPO0pbUm4SnNiXT2SQR/Z3Kc=
X-Received: by 2002:a17:903:1b4f:b0:2dd:40cb:a054 with SMTP id d9443c01a7336-2dd40cba32bmr186298795ad.19.1789325457346;
        Sun, 13 Sep 2026 11:50:57 -0700 (PDT)
X-Received: by 2002:a17:903:1b4f:b0:2dd:40cb:a054 with SMTP id d9443c01a7336-2dd40cba32bmr186298245ad.19.1789325456919;
        Sun, 13 Sep 2026 11:50:56 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:56 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:26 +0530
Subject: [PATCH v4 09/13] arm64: dts: qcom: sm8550: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-9-9b9074a73c41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3295;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=aMjd9aYFnA7xUvSYKyRihpubAtnTpKk18gq2dPNLq2Q=;
 b=ZXgALxYrEDfJi1Rg2+EUjjxP35Zcnlz2ROOmWEgGpZSrc29xppYSwMvOKEmMNW7/uyfWNBC4y
 sVLprhTofZqCu2TryGSwv/LXcUAHmysw9hzNK/80x8Ok0LA9go2gFBV
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX0BfUxx1bopXT
 XX5Cr/Kl7BaRJ9vwsfLDKR0S/8AgR90wLkM5YOD6nRoj6KGSfDmi1Fdwo7aUqNrITDy6a2dYX20
 mFlsptxVLryAh3DBPuj3A8N1pS3R1tQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX73BsUxM37ObR
 X6Z0Y2k2yPcKG1+AemWcmbGOwdRnjgEFXzolKbLVkda3gYvoKcR6c7+B5aed1kvfrpzlKnjpBop
 r+LivqBG9H1/tk+X55+A+XMmlGLN62KbvkHmMGdIHA8FlVf2umf/oK3kgVPs1A0BoOkUj+buzMx
 dSIKSHfN4yfnpbWDGvg0QFaGsm0wdf6k4fVlZVKTPlvDJHvjdNWYFgzxFRp56lYWSavQloZkVoX
 bPRuuj1VxFGCWzaxU3jQNR9bFyUnswcXIhwGDzpLtwNvibxML0gE2EPBVZs1jwYusFVIh7grfHS
 UZoH566/35QfuffhapVpHNIEtx6eGmE/EjJqHR1RBxuJ92aGLLopRUezQsj1N/VK2IvzBjmy/lO
 m6iPCLtIPwXI9EicjMAutyhlVETBYsc0QWgiwpEId9uWgGnpRjNTWedKQgdwmYkODdwhxxQNFhF
 GcOlnLJ1PH5JS6MmpuQ==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa6f091 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: CRq0OIl3wSe3LERGXvx2EcLJrvRfVSAa
X-Proofpoint-GUID: CRq0OIl3wSe3LERGXvx2EcLJrvRfVSAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
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
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 23604436add303348867f890890f2f7af4f831af..60164b853ae0764cdd79c4680490e66a548b0613 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3690,8 +3690,6 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
 			/*
@@ -3701,6 +3699,19 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
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

