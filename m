Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A1B3C8197
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444778; cv=none; b=ZwGHVXVir7ls3e6NGdVMldG2mM3elAooA/RMBXclQClzYoiPlg0Arkvqb2lRl3Wnd2WQB6s5DXOajIcngRaye/163HQRjgOj5WA9LoM+W2vGdYwYrUq1W1nkzlSL8mx5jNTum1g0FCqt1WOo1CceU9u1mGwC4qEknJJuaQ+v0fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444778; c=relaxed/simple;
	bh=GnY9q+Xc2Y+VqHrDqGOayOA+eKomJ1efauJwSslPH28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYmcnBNAxoMN+0r7JHyv5aRc18lQwLXPLSm4afCkKfRWSpUrFPyOdY6Ms5MXvS+wPXyncX6irx6jtt3LKa6jOHYFjRLp4rwhPrcXmTfLKkK+IuePmCpUDkCWs3uN7nOQUMk7/KqEvY2VqcHfXXgQQ6rI/w2CrSdy3Kh47fMWuTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZMJ1SOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9lTXUJP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZMJ1SOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9lTXUJP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA48Ol3947382
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=; b=SZMJ1SOidQow36VO
	OmfNAX/lI/DPOfz4E1kbWdZb+QV76/Qqi9IBNmAhbtB7Hk7BRGIN+kyAeN9T0sec
	Qft7KZdza78Kf+glrSj0oRC9UOCWmhIujnxfnimp550FN4Rj+iOSKFZGNRkpw54L
	Xu8A+eACHkIogqYmc9aeJ2nF/Qtlochx8Dcn/KL935vFcx1VJCdaiu6IJJKpD7vY
	FJDPItryyTHcNER2akP46kPAkRgOfWZPnWslxEQBwQAJBxJkuYnSJWUfpcawHvR1
	v/ZiWePBSyL9JvR8OYXUStgoZPJPW/Tca/RKDGv4EuMuXDJHKYohFwkwUNoqsoAw
	PzEcPQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ng14k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c81086bf930so5083401a12.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444775; x=1780049575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=T9lTXUJPBl/kuz8eVu3cLziI7pW2j8iLfefPhzR/hCpHqi/2yK+E+Vlnt/d05fEoPR
         A+eqMMbyT+ZkTirXQx3hXKf3yWgQu+MueTuRlLCMNSHjfHU3fl+ZyYPK3ZZdU/m8gK7r
         kYj5OMzMKkN7zwD3wGh2NuORx/ve7au8NiApQpBkpxNJSVnrlZKYrQZvNsydOm2GEbjK
         pG+L6Go+tFg8gdzwIoQ2qDznDGdMCwMJUP3j76/Mi1zpbNbk0u15Wt0Hu4XSG+dxTnR5
         RdDu1qtVx94BHotvqc9b6yOnbL3kdyQY9/Y6D58xVtkb7AA8K9bHWCAW4tDEz/zi25Y1
         hM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444775; x=1780049575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=XD7Wx0a0aNY99KXb/Lpk5ue63sLBuHC4N86/1qbgx7lBPzztRM/ByGuP2Y7mwzKkbm
         Cbomjf9P7WrEFP79Nsa91/O9TPSMzCXcwj0TQh9w9hCCYHLF1iLVI0dAPynuiFf2RmNn
         k71ZCK/pS2ObWRgsZa+LqbJQ7ew/mghiUB02BCk5WHZcL7XWZ64EwdLjTCRlBlDezKTl
         XJ8WOspyOHks7JaE17ydtjdiP19XCzMH6M3AIw9UUk5945M8aB0XMnf16kRUL8AhzteT
         eiPyah5eLj82rW3d1dDkDAlkO7gy9VpdbFaN+wBmyjNoWEm47zIZi13gCnaeatrda5m5
         XL0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9yswvMk2bGR32Qnqf7zujy2u300xqJyAAhieUhNCoACBsEnKtHcOYjiwtNilx/yt8ZyvCZekTJSaXF@vger.kernel.org
X-Gm-Message-State: AOJu0YxM/oA0mEIEApegxrE7ieknnyL+AxRLK9Kd4PDvjOuKM14n1G/+
	U/bIMSRh0TUdbnysakarxuXDITq6iVRwVtQzcGj5HXiggJrNsErG451OQYzeFdPerVAjhmbHGcF
	+YzlP/eo1p7MOgNrWOieMqvv+CAg5O2LIRxm3G61RnhPoiB9zHUHd5+y3MlRPQS7AE68Od+Ws
X-Gm-Gg: Acq92OHDIAMdpQAHMYrW10H7EnBaC/Yzh0fbZIrrn3VMpXmCM8C4OGwOLZTVS7jwlYQ
	qpk+afISDq3Rpoks1tOfS/WP3htBpKs7c3ISYGFGjLlwPrBPpCNk/nTOr2MYygOgyYdocPTgSq9
	XyhPlBt6pEhbJFanS18uXSBZRw8ADCIxBRYUqiEN6I/2hj8eerAjHtESciOoVSte1/fXGINYp/r
	X+Iwu7gspwLp9Xv4F++QGucPuU65xsLgsF5S66i782JEELQiEU5L6HfT4yenO+dgkcc1rhWal7+
	qKg+J9/cQvOWnhpvOcx7p1HRr0GAQDbQ9BUR+aIo5IjExn4Gv9XX/IBZeu5e070Wyt/TshGqAjq
	ZQcVOonD/MAs57KPOGLk1cmr2E6JCLTzrHMLuKRoJ9phY2A==
X-Received: by 2002:a05:6a20:7283:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3b307bc9d78mr6490718637.3.1779444774615;
        Fri, 22 May 2026 03:12:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:7283:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3b307bc9d78mr6490689637.3.1779444774118;
        Fri, 22 May 2026 03:12:54 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:12:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:41:59 +0530
Subject: [PATCH v5 3/5] arm64: dts: qcom: glymur: Add GPU smmu node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-3-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
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
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=2464;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qFdQhBrAHggcU0GWES+ohMA4WsH2wnpDPMNFqXrANzE=;
 b=yNzqUhOCMXQvxrRtd7kxvs7YMFtzu8GiAVVxvYNsil7K96Pk0pY01/RxIvWewjoljNJUYvNeS
 3lRjHziweCfBb69K8ZhCLsCORtTB/RODIjYmlA7lEj942QbUt4Oh06+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a102c27 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: cO0m0944Vhd_WdvawgMc_VsaJ9V4lgfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfX8dQtHAdqx9Ic
 rzW2kLuARSmadc7zJFYck75Tf8w6mrkVHB9hOwWNkPdNP4+dgwiekTDPp2UzJf9Bb2UQBuVAwF9
 pJxqzbp3K5xXeap1gwJFFArFO1H6+1IMoTv+UrWhxJ6gHwymrf1DgGQRVEj2djkn81tBLlKpnuV
 2BUvsm11HtXDFQu6ZH9MDC9e6GNx7YNj/Q39Q9AzOI6c5cE5ITIDI65NpwOFQXBdNO9zXU+dIy/
 y5OJjYKWKkRzMr0ehhP4L7ECRTOXx3E306GAggHziJGMufPLryRzyKBx4iMcF2/s17vPwYGeC+F
 m7LmhAFEIKBJOT3I+sYVmZ7cAN79s+rmgYyuaM4eiFJWUDuYgU4J9XmkArh2x94AIM383tMsBi7
 pRhYJPSh33UunA+ZwANrkPgITV77eFork87gqnYt4J/B/fYXU9Uh6Z9/QUEqQyC2Tb7z3U0ep4K
 Ix1CeCj2moP0ouI55pw==
X-Proofpoint-ORIG-GUID: cO0m0944Vhd_WdvawgMc_VsaJ9V4lgfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220101

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

