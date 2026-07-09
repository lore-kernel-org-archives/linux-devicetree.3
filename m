Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C203343B3EB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622602; cv=none; b=uymRk9KmKmr0Ot+UdSTIn2UydYspphIG7zfk4+eYEfNMZ0TntXt03wzzeVOvAQS2fG47xlXUgS4UAIghHyras9c+cNhPa4vJ4wK9VIYiZTKLg+IQp+VDx7lcMLWqIZZ0qPiK80VEoh6uDJ1GEOtaSI4ufCym41n72D8DyAlPTX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622602; c=relaxed/simple;
	bh=O9niL4UAC1BXVT/0hAy727laAjQWWk0ZIJq8uv4T2Po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOEq1CTEbO78HHt8zkKXAEHJtQyiM0sTSj4to3H62aNvH+RsmQxS/vXIL/WrHHKfRFNp+mK0M/tZtxW75YjbSM+mmvINM2u7bZOnczqnCdAjo9YynyGbregh7vjQnNDRmlHUv4eRqBpR67jS/hyo7ogf5FVWmHCdF92KsnEQjGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kttAp11+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILb7GIx4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kttAp11+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILb7GIx4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HX3h12295128
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 18:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZQa/mqvt93chY0RVU5zPGmb1at+p5NGdnFyV5RZOgI=; b=kttAp11+1wwuB+SO
	rITOqpWpy1QK9fpn+uMaZKyNalwD7bIGGLtFn5BeOZkpPVi/+zNYM+KkfvzDRdlL
	J3kAbwQhVdMMv4BPn6OIPeS+XTWxyKuz+l34yGxtPHIgNHjbFd7nrjHkeC7Jnkcb
	tDLPYYOdjPN7VbH++3Q33STz9tgjxtB8ptOCoaeNIpVOt/Y8+wpeHCWudekjg5Q9
	GIAfy1rL70lAHnOuviXTOLTLdjlupoibNXJ5f2gtBsntJ5Jnai9X7QKapndaPOk3
	VpVPC/mEFbUhgFNzGW6NNAyTxDPyW4x3YesjtJ8I7BskFT9hDf82Z/qilaa3KWiU
	fg/eEA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vkqj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 18:43:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8894570b58so77529a12.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622599; x=1784227399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZQa/mqvt93chY0RVU5zPGmb1at+p5NGdnFyV5RZOgI=;
        b=ILb7GIx4MPuhxtWqZe/L2ZQHpMiqcw0G5nygj1oiXPu28XvMKQgJASgXQtlBJF2Idt
         5/TXB9Ksf4ZGTEW5m1SDMwEb0+z0nSYpCrks95oA0M0BVXA7iKXoge2w89DNeqCLq7eL
         LtRizAeMOueeVw2CndSE+RtUDh+T5AdViOHq+F9N9BTIR4SeEbtsDCdxMf/BzxwnjWpY
         pH3bva1qtIzBjMRSaCckFUtRrvilGM8LTMYfKhNiBVggN5xOHjeAZahW/6D2pEdNphZ0
         wXeREfD9MN22iS1GsDmdFj27vQ19A/+TrIjeK+TZQwIhfoMLw1FJko4KqJDdEleQXte5
         so0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622599; x=1784227399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZQa/mqvt93chY0RVU5zPGmb1at+p5NGdnFyV5RZOgI=;
        b=IHiM4o0h2ndF2UeLt3p8k5wetE2HDXAcrZwzXV7EFc2RubPDxTftcM/S/EvRxsOI2K
         3wuEO/r5988YfJxCigO6pYvqW+1IjACOy6EFzV0/FdOw1HewEMZ2hrAU4xy095siYjNS
         fW4DguZKFC0bbnF+4V8x+a/IDXIuvBv1T0OcZWZP9M2r4wkOLC2oCdk8wCVpBLkejn6C
         VwAV0YzupL/grBKRVykuQ4vQj3U3TOh5HS8Ia+zvmGWXUKGBw2JP0epGEhGjggheZ3m8
         fK/atiwE4poIJ+MVFxkPjg/JS9XUjRAK8oD7s1nlhQs6Ql5u3ll8fcA9e0uCGyPsLi6Y
         OPXw==
X-Forwarded-Encrypted: i=1; AHgh+RqlhBTb9hzog76Ll2tOQ5G5z29jJ5sLwk0xZONlRtYT0aLoLDiMSBo2c701/DEPbWtefn6X39cph9rU@vger.kernel.org
X-Gm-Message-State: AOJu0YwhGH8r1XQ6K5xIrBz8RA+T7AlAZN9odKs1pIdeX4z67RHXsA4v
	3D9H9CYwPlyeHrCq4Dc1d/sNfYgKcE8SvOwPLyOPP5n1Aabckj79fQn3b3MAqcQ+K4535+vGQQx
	XiAFHBkeO0RmkoGo+fjTxAEcp/GbQZqWYh05uN74kEB9vwhzDHqdcsnU844P8ziHJ
X-Gm-Gg: AfdE7cl/vfcWlbIQDxya1Zx3G52zSfA2OwhYVLadZVK5wMDx0oiq9ZXDgc37jvLeRk1
	HUFPB9fCPrHmIOeouJ5cF7gRXi0V/19G56yY6lxLi5/6KO/YjdMmHTqWuAA7tEPqhdvCtuE6edb
	TIZfWNNszQUEWmiisC4mBNfc4WIzBWd+6rciD1W+/SVkqPHKIonE7rGF2JhtC+auj27fNxkCQr8
	HtPD+u3CrFCwNXNpcFIq1ipi3xh76+hHywTKjZmD028n418tbRyZfgaRNp2ri2MFUAWQqcS9yg0
	3wQgi3+PS6ZngWZLxJNp6hAgqMjPRAhuQLcchHw2FarSyWh9fRq48XEkxbPq38objej42jTLgoG
	skot+dtxRWUJK8X/40JT5AFjHOrMD/Bfoa90=
X-Received: by 2002:a17:90a:e7cc:b0:381:9ff6:3dd5 with SMTP id 98e67ed59e1d1-389415e9f47mr8816695a91.25.1783622599284;
        Thu, 09 Jul 2026 11:43:19 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cc:b0:381:9ff6:3dd5 with SMTP id 98e67ed59e1d1-389415e9f47mr8816665a91.25.1783622598836;
        Thu, 09 Jul 2026 11:43:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:05 +0530
Subject: [PATCH v6 6/7] arm64: dts: qcom: shikra: Add GPU cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260710-shikra-gpu-v6-6-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1606;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hyEGcjwM6KENpeiGPhvJEAD4XFMZNW+63d9GkBZxZpM=;
 b=NnPL1pTXwyODmjoz9V6QImzaxRVMlFXSMFKP0EI3HRuym5woRxSxuwPBcZ6F2RmFq4guFSEBF
 HlxdGGQu0CeB7RqV2YL9E3KoLSDrA8wK8H/NZ1rspf394vAZc1s+TfN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX2ODOYfOGk4DJ
 /FqkZYo+hEcCu84I1IK1GrjPHzjqX7GCeJuJDgoxelcjcD9TopmeHg3ciQEmm4LXNLCCk7LsoSG
 B3/bgrxwmfwNfYMcP203BQ/4wewrtds5ouhcxDszAK5r/w1zpJ21jupP3PhPkMMt/twiYH12Blm
 EwF7sGLb1EOqBybY3KKSbV98XWOqtgRFjhdLmPcQeSBX2CdecfYiBG73hAzGcRoO4DiRC7nwVKY
 EJ8iep0hNWspD+9DrUbs1c0Ldj+eY6aVLBqK2ML3D5Ppwa9b6i5tziRQEjyOHh5i6acp6VK3ZHx
 ZyA/t5QcTBAoq1rVR2XoIIkd/99oi4vCTGHgwEBHzfEzm/iQmbV9LXOCtjziwmxm8EvAapNh0Kf
 OGRF/Z8W5IxUy60E4mCj099hEwqep11SEFxHR46V0t5mUL02rXX5w06EJHeLkxDtprd+EMsoyiE
 djU8XIwIY3QnreOKQhg==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4febc7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tZdy-_Mj5ciOPZFqPb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX6iyUBGB7y2ZO
 Pj4nBsSVs+fb9X0sRTxNIx29npVSKs3RLY/RY4b/YLDrd2OttC8+dNsKViGHk+SOlyJrcJ8UVgE
 AEJ+YjMajrudr+p478kW9zUaGXrdic8=
X-Proofpoint-ORIG-GUID: yHHQoDbIOgHxfMUX3mKFmQLFyhFk2nO2
X-Proofpoint-GUID: yHHQoDbIOgHxfMUX3mKFmQLFyhFk2nO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185

From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures. Set up GPU cooling by throttling the GPU speed
when reaching 115°C.

Without passive_delay, the governor fires only on trip crossing
interrupts. Temperature stabilizing between two trips generates no
interrupt, so not all cooling levels are applied. Set passive_delay to
enable periodic polling to ensure all cooling levels are applied.

Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 34261221664b..eeeaa369d3a7 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2510,6 +2510,7 @@ cpuss0-critical {
 		};
 
 		gpuss-thermal {
+			polling-delay-passive = <10>;
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -2519,12 +2520,25 @@ trip-point0 {
 					type = "hot";
 				};
 
-				gpuss-critical {
+				gpuss_alert0: gpuss-alert0 {
 					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpuss-critical {
+					temperature = <120000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-thermal {

-- 
2.54.0

