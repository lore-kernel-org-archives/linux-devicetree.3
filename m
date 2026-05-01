Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B658E3EB808
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655477; cv=none; b=BfLlDQkJ6PSG3nR05uEUzUE9LgHhkgvqzC3EjqMRHklF7WOtEbzLki3leIx7xHgu/5StpU7Rz1ihjRhRfel0TFetG3h611EhPGrnbLOrI/8GU07zY3Yt0fwdIZdaq2EmysNblddpGcHU7kCg9yvLwzIV7XefoK6qiKVRZh8qGII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655477; c=relaxed/simple;
	bh=THFb5Nk4uEbZc9mT/NKNytrNI1hHkez8UfIyNlJTGmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNDvArVlsjuIH5Gtyjt7f0A5ZW27tWejciMF2p9t4ldPI7xYoFdE3nZPuvFWsw/XJ9B+hurQMz6kaZg6du34AAk4kyfWrkbuT8rxzV4x/mVUNUIhh1+BFJRJOTWwbB5UGaDguHA/ALSMYPugvxFNVqWBf+e90B7u6z/5Wppyhdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a8NI18EE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChddZXpg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8NI18EE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChddZXpg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLWO31345396
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2zubOAZ/8a7yYkuEZ+V2cJH7d90bVGw6nym4GQ0WP6c=; b=a8NI18EEpnJ894ee
	shfHP/ToapzWfmjrVI5QEfPZ1EqgBDx1bszRS6Q14I5r1UIVslVm2U+yfFCUQ9C2
	mMFJ5a+2cvb/9P9GNsXgD7zAEfqPCYwEQf21TRQOcbutXYgp/CEZt1aF3gA1gE/P
	W1yLTEhoQRk7FcZrkSTzl7fKudiHuWoz9Ylw1qnkJ19tFVhlzAVJ4V60Upc+qJJT
	5D6fJjeM+zFj2cysc1Hq1/twbCIeLftKnf17hzTwGQa6Iwc4Ubo8VOvKP2OkKzwz
	ztY4jGIndfl5zKXuf7Kw2A85AvfZBhcVP2wNg0q6mdK/0M1PPMUyQ4LJ/Po93ia4
	ifaXUw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvwd5rncn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:11:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c79744a2d99so944536a12.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655475; x=1778260275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zubOAZ/8a7yYkuEZ+V2cJH7d90bVGw6nym4GQ0WP6c=;
        b=ChddZXpg/qddDIE/a22H04tULnP2iRDDMzsQM7xAJHcF3xHjxP4JErz9SsYXwngxXv
         I1rMmCEQGbZHf3T7Hj96XffPlAXunVDcDRVa4inoogrA4cGNkNXWlJQ/uLWy8HEqLh/1
         dY1ieLamgNQnnWYMU7lc/Rqg5KF5bM1NzQxKDJIQLO7ISTry5+bLqCFKdmma9BUv3ijq
         vlYwxD1LmcIyw5J1H4unHDssgGkAz5Z3aIj3HWuwA7dRfQE5G/Blh2RsLwIzSZiWZy6h
         LIzGv6szlnzZWnLQraZN9Nuu7N1OjKOzEAEfli1RPPU1GIo7nfCEyDSaZFrISbi9gXVZ
         KB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655475; x=1778260275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2zubOAZ/8a7yYkuEZ+V2cJH7d90bVGw6nym4GQ0WP6c=;
        b=qOgH+NCclhaf/oFdLiCbdWvSCgb2VMZ9BlElE/SX98GkFkB1/tLvT0rlzEL/lvCRYL
         L9Pp55PiRe95Df1xDykbUfs5nT+PhMBP6Hz5IgKynZ0hDCqHWx7v84sF8/5U0rJo0Yir
         4HjdrnBygpE7ypy2w4NwwTj7GubAKQXKVtLwPR2xfw2MaU82opjcPIltZc7lmNPPEhOl
         p5cRPSCHdTEFr8XI1/bzIKr3b4yMJmummrmj81ogr+XfpRvUsgCjpq52G+/qT5QcBznW
         YgOrGLyGiXLaB6T9d196BJUhJgAU7/TkIBRAwlG97qr8N4ICyz06BuGEq19S9YEicymW
         qetQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SZ97sH4NSl7zz75a4Pqrtj59asfEa7lVZincYo1+xoBbqEcEoPBqfpXVXmTI9QK3yPVu+Ji5M0be7@vger.kernel.org
X-Gm-Message-State: AOJu0YxMm3G6X8Ybn/B5bfRT2/CUNc4g9WfjN1Ssm/7sUZvkjDf3uTGW
	jwLDE/AkHBy2ekAPlFnsZyt5WkRl9TyfnSc/VbmTAbVIfkfq+uVuUEwJbeu6/yUVcqjCiuILahi
	p5Z2nvGOsr8MCKdFqWPiw1dlL/UIy8UAxt4WtvIodFV+1N/AKPeZhT7dZas6RKiKM
X-Gm-Gg: AeBDieucSgpTOVJJ8h9rYBvntr/X0/GDI+TyN6fvxilx+a8MGE/dDPqLNQ71P3lYjtN
	L2DBspyz3/RTJ3xs3DSiyOK/9AmTvqh87mOUzh7T0JPZTKgV+0zE1GFxdgGdJ4goz5UaGoY7V9c
	fmIGV+faI/1nPE1i9cUdJ59RCHSxDPI/hJ6X6oJKy+3DbopzdceNEzhiCz+3M+VSiuk7mJF0u01
	yHQAyqxqlzO97vlw79/ajOz9JAvUA2alfSbV+fAxRvtBgCxyYCx7qDGV1+9ywzrTWf/I1ZGoqsU
	pw3wkk76KqqIi4xv9oKaIzusCi7c1uhBgxCLQovthJ+A+5GVmSRsS3bL8H6qEm+r++69MTpkIBs
	BczryyoPy2GGJ74kwptwikyBDuE4m3KB2jdlD98aSnKpHuejTDb3mfSV+
X-Received: by 2002:a05:6a00:ab89:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-8352d02559amr100719b3a.7.1777655475262;
        Fri, 01 May 2026 10:11:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab89:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-8352d02559amr100674b3a.7.1777655474748;
        Fri, 01 May 2026 10:11:14 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351587db67sm3099323b3a.13.2026.05.01.10.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:11:14 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 01 May 2026 22:40:39 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: glymur: Add GPU smmu node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-glymur-gpu-dt-v2-3-2f128b5596bb@oss.qualcomm.com>
References: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
In-Reply-To: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777655447; l=2636;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=QkffR+QOr2z/kbtj5GbV5Aa+e4MwVgVJAmCOoCw+1uU=;
 b=0ae7cQ5RUVZpl8ozfmKx1kS9wwVDMWR3kxd5O+U/8V2HPOd8vSqHCtFqv6UYcFaWA+7lc4Zw0
 jUpmOWwcfLJCFm5ZE+zJeIndSp652eK4q5Qqcno/JxAHbp/E71ncT5A
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OSBTYWx0ZWRfXxVOkflehCVJE
 n+WLAjH1gI4qMyzppwkYk5bBWld1eGBGpcmMocmUxIaij4MYbksFqLnNxsgmrAPtbhrva7P9mme
 0mzoRrImvhhLp0Ia4jIFdzqS4vxJRBdpn/XqCiw1pX7vsBTIcGDAPsX3+EynEWM1C3Stg6p9pWN
 gN8aMXWUX0QYo0uZBfZ8Y86RBjWn/Ho89wGRzq/R1Y5zPAuZHATpPBms14XJA8F05s+jl4T4PME
 OWJs3bz8HR2I8hkE8AAaAeeaETowQFmcQ/6mnmc+W2AdAIq90DJIZIPOQ/XDU1vMPMUDg87Pll1
 9SOwTnUyGPiA6hkR6R3lkFObKuLnhH5GaJS8OKA7sD240MD99yNd90TYqEIigWayE1bsnthmKoM
 fiGe0inTYxxeCLaPcWKlqNSoyWsV7o73+PGH0U4A0Af558YdV2nOSp88VUUbQxQA6b2/PVOIfjl
 PY4zrAC/Lh7MpZFuRFA==
X-Authority-Analysis: v=2.4 cv=OdWoyBTY c=1 sm=1 tr=0 ts=69f4deb4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: QVr1OdtsX9ARy7ls2QjwRwXCywGcEKwx
X-Proofpoint-GUID: QVr1OdtsX9ARy7ls2QjwRwXCywGcEKwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010169

From: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>

Add the nodes to describe the GPU SMMU node.

Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index ed9aac42fcbf3684773ae449ecbea4ca679691a5..93afc81698cb64232ac6b61754fc6f4c923e30c8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3729,6 +3729,46 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,glymur-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			interconnects = <&hsc_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			dma-coherent;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;

-- 
2.51.0

