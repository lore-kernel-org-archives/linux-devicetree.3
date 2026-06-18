Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450A93B2FE4
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781786856; cv=none; b=pMZtFnZQVRh87qY9f/EO+kLI0lhLFPNtklKnUkLzQLeCw1ACKTaElYoBS1X2wbPKk9qGQmFNtWUJ1Jm2U4QwujuDQkjQqMnOYocBL0tS8jlYGmr7ru47830zFOr4C+qVxYdulQkb0+sqk8bVzJ9/za2kePxStUnqFm2Zvp+Ki7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781786856; c=relaxed/simple;
	bh=b8BaxAO/BUV+MYPhPmLa+NYAxok9/Rf/iAlalnCfvDg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=clDaKDIqxC4p9EW4qmVw5oaaqeiAuoc5oZ2IJ4J4EGxMOaVErcVW4X7MNNIusVkFVyEvGt3wfESjBISyzdorn1bHTPjL+AR/K0hVLSHn3XdBK5bbiBLrQj7kKAE8Ki/8yVmZEX86w4y2SIWB8O8PJNUITpAhh91LGgx9XeICqPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDSqr3E+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIW8Ru43; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDSqr3E+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIW8Ru43"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAraI81054825
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VzhJ06xNdpJfk0LLhzvuSVzJs/BlrKuZqQw
	/T+aTMgQ=; b=jDSqr3E+4tvrvryA5MulJenchZk9l9V4rPofJ7utqe/R8cEpQd1
	UJGQ8Swtk1vbBRjG9aIA187AMUJ7zOVD1hqPmBhRmFKIisaSXU4HxUXw5hBj9vj7
	jECywCey19v3hJ807Za7jQhVhOwlAQuwGsEp3aZyANFGSj4GMDcFnwBppVmRKx31
	b/N+11EDnsLtITGRM8dmS8aQajdNR/oqYG9XOPeyYNZRwsZPXQEE6vg/ZkM2TAD6
	CmlRFgcazrHEKnofxAH9PFAV22/VGztm7wexUeLPhZlcllpIAr+CydfqY+IfJE2o
	FbOtAPdio93NJZoBBw1lOiqBfS2GfSW7niA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cch4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:47:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso22073915ad.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781786854; x=1782391654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzhJ06xNdpJfk0LLhzvuSVzJs/BlrKuZqQw/T+aTMgQ=;
        b=IIW8Ru43qyvkJ27nBDDNuxq06+PKR2gic/RKrU01uHB1xmBbkk2QsPJVDnBRwLVaxV
         ZF3CRiP1ZmB2GYzugqTqxYDgFbRryI+15xfkUy1c/HQaNIZl/hnpnou3lY3HoJkI7e0/
         gH9lOeCwcNlvWwCW/vlcWSKgQmsDjqFIabmsVPkB9u1SXzICG5DXfK9ND44rBPzmx1zH
         rNO3ale0owNYSwOOg8pUwSlec+HhlGZV/Sv8GGF4B7/8RK7YJ6M+JEr4CgpotRyjsqwS
         laq+rLGy+d3UxAOZApDHlUeG9A4OVFcaB9hA5C2C/HpO261eKGrzSDEJ/8HYr77OCBrz
         7yKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781786854; x=1782391654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzhJ06xNdpJfk0LLhzvuSVzJs/BlrKuZqQw/T+aTMgQ=;
        b=Nw67RFLFUlyt9GekBADAegquHsOZgTlj1YmMtRDoZqhRQblnMAh6r4i+qARtY2shia
         4Tmc0ZFFQV3GCmkaLwvDdPRiW+4nk+Kww6HgOO0Vck3cpJX4Ocqw8BVurb7ijof638Ol
         ndPVPr+uybVa5a+upmqnRj+ThIFP2KkgTY+NdNedoCryt1dYYOw3ORk5K2PSxYfsQM9q
         E2g5NejtLV5+L7sK2navhlozLlX2+CJUH7iEjPgVidRMD27dMiA0divngrknqX/Wlcb9
         VMP9QRz7FmTYHZ4OtSJaUdJ9lGxoR/ldZ524pxahO3d08ifIqkePydmsUb67nH3q+Dxa
         HSXw==
X-Forwarded-Encrypted: i=1; AFNElJ9mKYQSS6VF4fRdWWl1+++DrtI1man+TRsJ+sIMORZm9XnIFHE9HqKNA860EZpknI3SzZSzSRTycrOV@vger.kernel.org
X-Gm-Message-State: AOJu0YzvCjNEUppsqQwJg9Hxf/GY5TG5HaA1iznKZeXtcluQA9r2GMbr
	OvEAxD5siVf3vhkN0hdS60WgW/JC7sOy4YATWuv7t+rhoRefMfhSy10qZFFQHSyN/Lt62zYP7qq
	NYzQktGBUFzazN9YjNvhbRAiJ7qCF+mNzizV2c8VoSmHwsi9jWI7wHrJfMhS47mQf
X-Gm-Gg: AfdE7clWIrdY82+bjkRLPlJ2Ez74xZIyD3u8+bAt/lAK+SPR0K5aTykXPKHCzW2sGjh
	nOBeLusFOS+KWoyCbtt9LA2owazzoSrkF8jtYdjiqlhoVS0lp2OMEg8UXiGGGmvdCUcoNw4RB0M
	maMnMUsx/CrGavR985q5+Xx6aVqM+Q0w8JPq8eCSUJLzSplq5QuGgZW0g1G3FZN4kTNJDyuG9JM
	HUOSVXk5iK2fLlv3sgL1C4eJcIrB1FijVeGrOPA9VW1WGIGpbB/jSeofEuLM6+YxUzpIerrvT/D
	nZfpeLufFsD08RTfgjEYeOvY1zEcx//1e5CY68va+SRvcj5bYPWaTIbhsq6ShamhZHOUCUhYP+Y
	DXPTWMjsavqLrsw243HMZOOTer9XFfrGtvRkOU3hRNIgC
X-Received: by 2002:a17:903:11d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c6bc250d2fmr88246625ad.30.1781786853852;
        Thu, 18 Jun 2026 05:47:33 -0700 (PDT)
X-Received: by 2002:a17:903:11d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c6bc250d2fmr88246265ad.30.1781786853256;
        Thu, 18 Jun 2026 05:47:33 -0700 (PDT)
Received: from hu-sarata-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5876sm201318115ad.8.2026.06.18.05.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:47:32 -0700 (PDT)
From: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavan.m@oss.qualcomm.com
Cc: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Date: Thu, 18 Jun 2026 18:17:00 +0530
Message-Id: <20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExOCBTYWx0ZWRfX480FKkyZXB9b
 SqKFSvwtJx1jkwQNxZSiu5nzC30D6GrVS0/xpBePzQshd+gQmZqXHR+K7EQFRouTOtBvJWIcKpb
 BbdFhQpFFrn/hebhBBZzmcjCgdz38CKGo1JWWbrMLltWSN2O6bXEgctiHZei+qogl9haY22Qcj6
 c9OSykbnQyzxj4bRBcNDnKKnHqn0JTGDSiASsB0DbyvzScF9DV17mE/0GentK83Y4Ujh0y5KQiU
 lg6mrGFzfW3xpXDu7WQmCwgwEiPc07s44w/htmQ+hlRftZ6jAbh6RPGmWgEclUW1+nqZSUA4q0R
 lEnluMj9mOGbj5+JEkgY0PKRfgkCFPWTiu4J3ZC6zmcDqjuOfitC6X2B5NUG28BuYq4u1+G28pM
 rahIuf973SVG4Fh8XcthLsUQJDN6RR5N83tRVOL+OjOt7QrfZh3MjPqi9PwUieGa0h3X/1wGmoN
 Fw++hW2789hp1n5XoUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExOCBTYWx0ZWRfX447nHgNSCwww
 cZma01Vp1GH/pBJdoNs1pjRGaxItn5PEdEYQXeWV3w8KZ0koafFJrAeiuv7sW4VRj3YGtiP9o09
 YetJuT2HYpLdjh9kmr2uezacfze0ezM=
X-Proofpoint-GUID: yA6Cgl3Szzat8aGZlu9AxUUCFRGmbR3s
X-Proofpoint-ORIG-GUID: yA6Cgl3Szzat8aGZlu9AxUUCFRGmbR3s
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33e8e6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Ekxs73CR7cDBt7d9oJ8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180118

Add IPA nodes for Qualcomm qcm6490 board.

Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..fd1aa26e20f1 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -619,6 +619,13 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
+	status = "okay";
+};
+
 &lpass_rx_macro {
 	status = "okay";
 };
