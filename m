Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40CB37F744
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530074; cv=none; b=Lk2fwQsx+0sLxnmtfo6OYh5LtrGrwcp8i5iQ5bm3dltEDS9Sv92JRXqL+MKZbHEzf87+OAK8GpJCwbwvPAReOttEIZaLpXn58F7I0izzhV0VWfgsDnRqgXq/jzmkwS7Kdw59OErYFsAhOexi9rcZRRsZaDQ0nQzp4aQwSjDxbAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530074; c=relaxed/simple;
	bh=GnY9q+Xc2Y+VqHrDqGOayOA+eKomJ1efauJwSslPH28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmMzFmAw2MsTWYI8dSgMvnmpf+sD+wXsoZlAU8xUKRqnd1ebxdTAelOAHeAIx2NlWkM3lOZV8fsozCeEtTnhsAQ/xerGSUdFK5IT/T92kHrqZB0UxgOAXx6t5a4l3FiPw5ADix4JYj9c7S2cawuuT7UP1Co5F4C98kgYfJgyoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XySf+3Ya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFXz+cWx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XySf+3Ya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFXz+cWx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6T9W3443739
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=; b=XySf+3YahjCKLFxr
	WxPovLbCYzHHPuQBdLh9CQ8iJQhnWZQz1dnFRiR8orkodnsqszosr5ls9dgIQHUU
	tQ8bQZYNjRDcEzLcdnd8O/54hgLinoDBLeAHIm4i3nWYX2Dhoy7llRQQ1M2DjYOk
	XLqoIs9muLeyHNfm8x0+do7m2W8COnRKgVRlRQwjJrUNSSdkO+ZMPpM6Bm+U5aLv
	sJtoCLD2RFRMrGbnoGoL/DB4rHG2HfOM0lL3vxx+Yct+eOcCUnE3/JMQ5AGNlgCl
	v/vg/CISUQbkA6w+VWaqNkWartdTbqroMaGXbbFotZzq0WJ4PwweAi6znyKx7kh0
	HzWf+w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0g056-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662668b825so8124126a91.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778530072; x=1779134872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=dFXz+cWxVysL/sArUSYEy0In+6rlGcuZAy/vay5CoEKriWOUTZCn+KB1BbdcjrYub+
         a9sX9NfR/8qpFffxpgDIKKxuF0VOLOrzMP+dCRSuoVhKZbhCZkCSUDqa8UtvX+ve5njy
         ptCf9dwE6tf3eE3U5c9x9Y3Xk6VLMF0K5mTau5Ovj0Prgk39By9GW6vXCs/HmNa6238o
         htwN2DYGCQh1NnejPALZisdIA2jq8oRbAJrUU+saqNOV+SQAZKSz2gdI9HrjEwNwjhSP
         +nZ1jrHkWpYAtjKjlz5aISZeAhZld/LRSJo2ltX+0R9ElX7O4obPsrKDifXbSJyedPMX
         OZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530072; x=1779134872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=MyGVrx9dvXvdNFN/10ORs6xzrQp/ea9FOxAGfZ3AYW+vKSUxWXN3OT2mtQVJTsNlFg
         tKAJ9W+bPXHOEs+D4IqdbV/6KOCcDcjnA3PmhoUXW5tTTmxFRJx/qd1edGWRFF7eUHHW
         ANsuhas0svIJR2fMuUHEytLaY9XLmR6pkkvMhYmOo2/mFyzEdVhVeb8tiRUHxEDYRFN8
         +gbeHSZjL7LJNhwSKL5nL4mOHwaWodm3uJy2JLOYVlmSfXQClKuAAxFbkkoYKSS2YRgD
         KHnEceL+O+lSxK3HsKWH42HFjSD8sa/BJ2Zk5xV4jTyyyLjT9xK6k4Lkg7J0//U6O30v
         MQDw==
X-Forwarded-Encrypted: i=1; AFNElJ9hLVDK5OMY4dVQtFgSy02VHiagHsPA0t0b/5lp4sjBxbcnd8L+gSZk+xMvWsbSBFfD1vHGkBuCrgce@vger.kernel.org
X-Gm-Message-State: AOJu0YwGGBQXWvzAbCPMSuDwQvNNnKbz7wn7e47EHedZlRK9EGyeqX9h
	kSvNiOXhpG9u3p5+U3Yk6kr1ma+C52Bg57nG21bJW9/kCUD+zRu0LvFy/uFG2YeA7GAGQVQK0F6
	3lUuU+uAJwZty7Qzf4sIf5qadMy+z01UxXtlLvaR3uCY45b0uZdyVnzvHR+BCQ9GZ
X-Gm-Gg: Acq92OEdb0Vlvlma/0vtj2QHOECXOVPfpfM5vWk6as0Zi9xBBrv1XzR2zMFTNS2tj8l
	lpoCtZVfPQvdWrXBuyRfYGpCg3XX+HQLAyqiRqPBxQHbmcUeRImfeI15bAY4sQkl//WDJ65XqvG
	hyNhc3l0BQF4eJglK3DRHsc0IKFJ0a0yra4UtMGEWka6K/ABMlOie7qSmGEEt+OzUhiX3zORpsg
	WRKgbWrDe4fXL1Pu07ESPW7bPpRxPe/eIH6H8b7KL8j8+/Fy7l/1g2I4uryGwlNgwDIGwVLy35I
	Ks7QphV/7ix1txdAyLNSJ18OJHsukVahOvec8NjJwC4OiYHIJJOsvoCpNj6FFd6e2sBtPNKx2ov
	GIkahnM0RLY02gXvrObaoPgUOZ0pD4UBjNh0v41NHXjfB5g==
X-Received: by 2002:a17:90b:1c8b:b0:35b:e4f8:7b2b with SMTP id 98e67ed59e1d1-365abe8a3d0mr28761675a91.18.1778530072172;
        Mon, 11 May 2026 13:07:52 -0700 (PDT)
X-Received: by 2002:a17:90b:1c8b:b0:35b:e4f8:7b2b with SMTP id 98e67ed59e1d1-365abe8a3d0mr28761651a91.18.1778530071731;
        Mon, 11 May 2026 13:07:51 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b01ef884sm64911a91.5.2026.05.11.13.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:07:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 01:37:02 +0530
Subject: [PATCH v3 4/5] arm64: dts: qcom: glymur: Add GPU smmu node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-glymur-gpu-dt-v3-4-84232dc21c03@oss.qualcomm.com>
References: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
In-Reply-To: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778530037; l=2464;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qFdQhBrAHggcU0GWES+ohMA4WsH2wnpDPMNFqXrANzE=;
 b=guWcqvEXlOg18VWFlVGJK7GD0f3EEXvKBY0xuASDpGlUq1jirx5N9pH6IzljMaz1oh09424gp
 wFYY9XKopBUDi3NSX19zaHjYT9i7Lty+lq7HdZ6NbMQyV6T95NzCHaK
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a023718 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: jzvzuZFq1yKi47w-ZgZZJrANITEDKBql
X-Proofpoint-ORIG-GUID: jzvzuZFq1yKi47w-ZgZZJrANITEDKBql
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIxMyBTYWx0ZWRfX+T+DghMOBEYc
 oMR1G8e9qt0kKv/qpGrm8BM5avUE+0noIPf/isv4r7DT3J6tGQMUeEBRbimmNPDH4oZkt3XlWI/
 ITW5/Gh/NlPXumzDMPlddWI2kaCjFK60Kov3EtepANc877lL6ZH5yDaR0g7NtKTCUtJdQ2/qzyj
 anXPHkl0vZxlOZrnxxVFD4H1sbst0vOlkZ9xZdk6GlsxLO/SRevK+myjn+YS9Qrx9NWmYkzfuOt
 HCcSwiD18m0tGuYeyop3NjdpWHVHVZB/RooD7/HJvXethlzQ16I7e4OPOfO4KJ59E5CZZE0jt/b
 lwp8HyjIm6zb0B8j8aKh8Vx7MPEXaQqOb9Q0ROlNx9VZEgJZfyYQ0RCchUdzw+0qrFWDzmE+kaV
 pCQgO1/z32dXi3wBuXGMwW208E+qN08Y5oWveNhAnL3q4Sq/T3z+1K2nkLSJkmxhQjax11sKqIj
 gi6+q07/fygxV0mDafg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110213

From: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>

Add the nodes to describe the GPU SMMU node.

Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index ed9aac42fcbf..5e76a0d53f01 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3729,6 +3729,44 @@ gpucc: clock-controller@3d90000 {
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
+			dma-coherent;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;

-- 
2.51.0

