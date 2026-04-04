Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED25346A1F
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336644; cv=none; b=FoTEwxpyLuhmbnAbNQ1+LNOfBqFSF9jm3qhjKvAzvpHmipGbKtTJzVsSMi0WqXWfXpD1xMM7pAv8ZVF/ttCr/ta/7l0enGdrlQaW7OUCfEmYF/iFW6ScF/2+ysc+tikJAzgh+GrTq3SD1gazmfpnzJhHePmAv0W57xNtpGvSf5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336644; c=relaxed/simple;
	bh=h72hOaaV3Wz2qGo/UxOAQA5Gn/+HYB0fHn+6ChQC/6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWlGn8soWg2QJccdilJMyvo3Ht6Odx32/vWFzrfhViBy66pu8lCCp1bk594cFC6upRY7wqCEKNnE+t+crC+EYft28W5/5IUoYgU8M58iB38YUuBNmFez74D3KqtGp9s2+9nlJGgrVVcZi2gO6mA3lrGcMaIFdWR9T84XN5q5SIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lp4PGznD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xj2I3XDj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lp4PGznD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xj2I3XDj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343jZoF2867082
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmtZth3SXSD5zX4iUT5/KNuaDt5932j/HMFP1H0CNWc=; b=Lp4PGznDUzIZPYY6
	AfQDGUfXyOPolYYKX82N4dZAsg5spNO5JBxQr38jyHNLkH3SU3Z7f9aWgWsjlvcx
	2mNsKQfNRKNICxDXQn8uUs9RJcIRWFUcqCCM3DNTsVKoAe+s0vN4nhWFa9twFk7C
	PLmFU29Hsocr67Ex9f16e/7V2SqOn9FH+IJnNCY7QR3NQ3lhLxWIxzAgqyyjphXP
	mVRqF1bPylGfgD4J0vYA9KxouT0xDqaOX1ZZNF+oslxwehl9xpBwp9Br6fiSkBt5
	LD9n9RJ1MmYpslLlH457B7QYB7oWfWbBinO4q/w+UA9P75CM+EpOYJtb8E/bMoAt
	vMijkA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14sfht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:03:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35c1107da15so2794624a91.2
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336638; x=1775941438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmtZth3SXSD5zX4iUT5/KNuaDt5932j/HMFP1H0CNWc=;
        b=Xj2I3XDjLBxtv6xoaqslog1uXM5dAcFQqwj/bmixKETN8fx7oUyPqCMueZ0zkzQLDW
         c7goF6vI1zM4yRdkrHX5zh3UT91Ji66XEcJx3Wfw2D3Wsayd7LkeuTXPwiYDe5oUeUwk
         1MEMoT/p4UKj2vJXiVlVum0rMsmJRfnpaCfHm24s3wUEXdrfuu5oBOWIzf78vLrVl+zf
         Dwe3V0QlcOqGC3MPzH8UdJ+iKNLs9MK+sW15TT5E4VGKp2Odl6JMIxzrX7BrIqhrDHlr
         +QvRezaSLYhjNuop7+YNsYPYXBGz4Qaaw0ffEbgnVYrW8smYz53hVvljdwO9sj/vmxLn
         BBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336638; x=1775941438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nmtZth3SXSD5zX4iUT5/KNuaDt5932j/HMFP1H0CNWc=;
        b=Yj37cHl7Kzdkb73UgtlRXVpf/k6D0N9zcCsv50PlNBwC+emfzwKVFXMKtnJesRY3X4
         fCwk3p+I4Vh+pUKA2joX7mLcFmqtC9yKCiFLIDxNsW7BF2qVr2WCsg91++8j5LiAPYzU
         oszzA/rR20LYUN/1MkGHU4nHEcmUF568HvbiG6rpbkv6EiH6qi20D19/ar95HwjLLP2l
         95jo2+SbpekVuzOntjMheK6pcbSZ6ODtF+fc2PWKEnVHb834Q4LGVNHOpTUETqljaX/h
         bTdT9V9q70Lx4fda1f2f9s7EcFNEoK/TFSeEr3RpY1ekPAX0VPxyrlFoclG8U/mWYh5t
         HWiA==
X-Forwarded-Encrypted: i=1; AJvYcCXYH21WyIeCQdhXfAJWxAUUosa4gfVqiXpGanAKK04GTpJOTYAVYR+t2r+gSQSkCVtrkcDMjamqFnyb@vger.kernel.org
X-Gm-Message-State: AOJu0YyznUD2koTDKfXm9nOnEyx5IRgxQ5y91+ksoB8reurMedOIv0fX
	heq383Mhj1cvycRMDc8noOqMzSsqAE0ZoApjiudIoXYMg5kxnMFrCD39oHWYZ8mRiZpqSp07Pqa
	sZvxoiyjKSTogPnYmbXJzh4aFv/pFW+EeXEZZLPXxK/kwjtgHB5J+GbHWsSSjM/6SM3d/OPaA
X-Gm-Gg: AeBDietCcL/appmNQmKB8oahM+X4DdH4bAkweEHwpj/PguvdGA01eF13Re3ydMJLcWr
	D3XilMVbCuDYs8zasNjOTS8BeIvyvoA6nS70U4ix0OAKIxUXvz4EUtibI3HMCZ+zutRmj+5VFTV
	2LIwt6ZuzWXKsXURqAryR7js6/cj6mKlTPThLIuvLh6/eTuBwF/d4CPvT83aEJMoN8E6naCY5vX
	YHnPRT+SMxpMnz/1zjtWMcgJYwMnRw6NJ1sY6e3SPlOcdhWxBFHdGLFvKZmZBx5R4hNSdkr28uC
	J6Nl0GAOKSC//2n2nGpIEJhrYzjsFdLy1sEGubouhhp1P7s6dr3wCjlwJBmMrSDpAxn0cyLemHE
	10z603Hl38wr2a55HG6ve2BC3bEZyU5sPXXe/9scDrH804Q==
X-Received: by 2002:a17:90b:2ccc:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-35de67dc7d4mr6566663a91.7.1775336638395;
        Sat, 04 Apr 2026 14:03:58 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccc:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-35de67dc7d4mr6566629a91.7.1775336637929;
        Sat, 04 Apr 2026 14:03:57 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de677e2dbsm2675545a91.4.2026.04.04.14.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:03:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 02:33:15 +0530
Subject: [PATCH RFC 2/4] arm64: dts: qcom: glymur: Add GPU smmu node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-glymur-gpu-dt-v1-2-2135eb11c562@oss.qualcomm.com>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
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
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775336618; l=2452;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JT5lwnVUisFrhJnFAuWZExNJ4rN4NkpGTeCu4OU5CF0=;
 b=EntZR4nO3H9acZ51Ka46YVBtGA2N7T569x46whj309a/ZNx2ueznbQ04jh9qhZhj54yrQNRUf
 /OsMJuZfi8ZCV5umqob40FeXJ73JFVkSN6c2VyNmHZfAPHfRkzu8dQH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX6cbf9u252xho
 8auMaK6Twb5fxPfSsvmkQ9e2evWZ83OuqwVdwpzymU8qb6yBLkThil7cWnXXMan1K7lQjza03WD
 AkkiMkSC0MMtMOxMa2aY9nkumYibH4pDaZFWqHyklf/pjTDoN42OIstQS9V3/cvaXP9lPEYFk8e
 uwraSbPXVVscLkmqLYvjs/+6eV9HIG5STSyodxP0tE4oAJ1yMy+p5hPQWeY7CJtCb8hU7ACSv+D
 5Zcw0maSbAWVk7zQr//RJ0DE5n1goNaPm6Y1mL3Ge9xseP3cSjlspMD9FpKhXt9NZJiF8Bskj0r
 fPPPqP1MYiDJnIgXfapiGASn9+ROhOmwg3KnCQ+/gDv602HsaCg4YhwqfvPgR5f6Ei+3hXc7W9e
 jjo6lSGcc96zzt4ogSPfoM2VL8wa0UoNH3PMePVBgwl2vgL5JSpAn2+rNYUekwQ5LfqIpHyT3uk
 tcEK40pQciKF0l+EH/w==
X-Proofpoint-ORIG-GUID: 53_9TTHmnj2hgrZzCrwYSgh7-keYMf-n
X-Proofpoint-GUID: 53_9TTHmnj2hgrZzCrwYSgh7-keYMf-n
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d17cbf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add the nodes to describe the GPU SMMU node.

Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e65e40857b3e..a3fe2b12aee0 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3724,6 +3724,46 @@ gpucc: clock-controller@3d90000 {
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

