Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25C747F2D4
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844300; cv=none; b=S5auopLpqWNIRiuoGj1bBoWr3f9HDX74bVhhun2HsexWcla6B7a7ys/ma0+M3n2VUfLHvWCQwSRoUKM0j+3nrtbXK9h4Ypq8Faisd1z2+qNHMI/d/aHUQUUfvDPj9g2+hlUBoTbWKwzVGKPW8p2T9dxiYjhPGq7fwOvIPRc/e70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844300; c=relaxed/simple;
	bh=mB3ax+sGyD+thy/S+owtTT++uI8XjdDtWOIrFE8Yvn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DoS62EW5dNK3KvtHNCiudO0vINPXZHDOM38wi3EyFeRMJK3+mMniA5wrZ47Tt9TCVLr3IDarLniClpElr/+VVMLSfU1k4+yNs4JpRV2tCJavtCq7EiQ0EEnmLCgC8/2KIQpjX35N9LqYRihthZF3Hz9/tjSwH6qhlmqSQrHqN9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ugvn8ITM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5BPHWbU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ugvn8ITM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5BPHWbU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F50kRe3795625
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hICxZj15kBmkUDSg2CSx6+F75VQu4k37C8p6b0IsqL4=; b=Ugvn8ITM5bq/Ebp+
	XyzKfxVb7RJj5ZGNRQMPY+/xmjZhho/aQvgBf9fa+Ce8LN/47s0yUOIRGBR5FFBZ
	K5qNAnzd2lvSfSyGvbhBCcm/Hr4N4llpW3E/EtO0WbcpoeCRutAwfzNdEgJDmdmi
	oH31Sc0f1izXsL1INrtgQuYV95larZq9itsg6aAGWfF8ovCZScBGw6bYdtpw2qae
	LI23anlW7IzyHP9c6+lR6VWFbx5WF3z85KWj4un6bzCbTb8RpGUNQJ7rYCcpfaiG
	ERNd+zb8haXs71W7yo+K2MoV+YgdzUdyvOHl+O5eqeO0+wj9YBZg2sUBKkwwdXm4
	D0rD5w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1styhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:24:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so2755572a91.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844297; x=1779449097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hICxZj15kBmkUDSg2CSx6+F75VQu4k37C8p6b0IsqL4=;
        b=i5BPHWbUpcEA9PydLmSYOwUOHloCpBeNpbxhGZCFKBOcv3JEp3ZlUauDynuG5QPxPB
         44c9tqnYPGp9SDg3KJSWlcfxzhGm4MrGoOZsiq71+Jh/WJCG2nqnOd9eKmlk+cvRYnZv
         MKLE1nnZpjbdU+TzzkoNBNH9GhkaRJwGA79TqyOLbDdYyYU/0eu5mzRHggqfq9cRhz/9
         P9JCgXCsCw8DJTZMn1xyUKNEL3Kiv089ohi+n6ljdayIYByv5m9aQ6/A2LM9weX+foju
         aeaBOtnL/cmy1v2jOXwKLdJVeMWu0SPC43tZujPb/fHxz21en36qyI/VWdvKoScx9phO
         sa/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844297; x=1779449097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hICxZj15kBmkUDSg2CSx6+F75VQu4k37C8p6b0IsqL4=;
        b=b4hnuidQIKHqSKKwDQk1vxWdv3vLZXv5IeO4ljdjQPkipTglDMIa6zaQAILCrULmeh
         3aTnPZx0O197a0KMeU2X8S/+JnjRKnpx1itkwGACZVc/oG3FhaFFZOW8UGmOwhTa4dLv
         L3FI6RmDjDqywIM1TFR0UQTQioeml6A3ck93bIO+3P8T/s0Gd5lg03T9FG3sB/CITZht
         9c5Zz9GijYuC3YXouDbJs48BDC/Ud3NjQinExlOX8w5HBZ6SZxCvS8Io2Z0waqqM/VqQ
         bSHmmswHyf0I5E/UErRkh/C/85ruj21RUtAL6+9jUufOK4PM3IGaL1emRtbP4szVCyyx
         YrOA==
X-Forwarded-Encrypted: i=1; AFNElJ8NkeTH25QZZJD4iUluMsNQHvh9hMFvVEaBfqJPf6rfGopBFU+1PhA5jbSwhqtsEfmVK/VXF3aDqGNC@vger.kernel.org
X-Gm-Message-State: AOJu0YzUQo4bSETPbYtnvQsXbLbZTkgLQ6XR+Yz4SWifzatBRHg7qbMJ
	pXzBneikXN1Y+HAE/GYESJgP+eN+3pl+a9PujPW5dfrVLOIwIJCGsWVQ4JqWgUjI5LILRHsQHET
	8xV9+ZMvN3uLULIUumzQ211iS9XLftC2UpHJqAvPW9V6NJg9zARdWupQTNCtFAMgF
X-Gm-Gg: Acq92OHmRjQaSNMKGllcQcorqTHwSKkAfvZneAf2a+ZJsMcI1e8yzlHN7tJhFwsfee2
	1mzba1wNiFFSbWjm6wpTgkwGG7LxjeXQozXSSxV0bwt0ync03Lbuw4qQ7iAWY75wbvexlTopqM2
	Y22GQIfdsOHdXDJFHW9qdV9ND4e9AEpnjqm1vEwS4B50kwMy8+C/ZTjRHkU1zcSR/HqCAhncJcr
	cKcgCsLHKuf7Fe8i0iFWTfaYEztnupKPgJqrMAVlQr+n34/omzBRSlWlTd4wJTaOLTVNd4rh0Zk
	BD3TIQobb2sAb1ecS+AaEJ9P1zoEqx3ONnDU/lBPdNmLtPIWT36KNDy2WESWUT92HmrhxSLTqh8
	NQk5b903F4QYdrp42svdyoqzqOQJR3+l7UNkkxQSOpJU29zpd/U0gHV4=
X-Received: by 2002:a17:90b:58c4:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-36951895b63mr3507726a91.2.1778844297052;
        Fri, 15 May 2026 04:24:57 -0700 (PDT)
X-Received: by 2002:a17:90b:58c4:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-36951895b63mr3507692a91.2.1778844296564;
        Fri, 15 May 2026 04:24:56 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:24:56 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:29 +0530
Subject: [PATCH v6 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-14-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=828;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=mB3ax+sGyD+thy/S+owtTT++uI8XjdDtWOIrFE8Yvn8=;
 b=PkZtwhvTexrUnZWWAE21Y2y7ROg0444tAsb/bRuCRc76y02WUWY7ps7jFUEMVmPTgL1iUL9my
 GGaPgGvD3bDApcsPuObmhs21d4H9/RAnJwDeZHTK1P7mtZ4A2GqU0Mm
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX2pfz8TY6OeXm
 ZbaN5L5Uer+8Zfgw9qijjhiXEJ67SJ2mBUHfDeahXT58Y2EdliVq5bIH0ZUi9Yf/mZo0M0KsuWv
 7/FkG6BI2NxBLzR0FxmPnlh/doQuETsxU1GcUEVaVTdF0xlZmxQljgjVZp1u+u656QftkOcsQob
 q68O73vnqIypyZrovP8b9Qvxm6mnU6M6Q4CUBaGls3XuWneRnkyyV0uPIME2tWHcWDHdTmZVwYf
 DSvdpt5JNHiRc+iIrPW3yigouVPi0/Px7v9lWnO6THqaURyRmlo1a+a9t3eNtTG8245dXT1Ri0O
 icmQW0pjRm2S5XDMlWCbPUgU0zrJvfIDTN6p1eLqYQ0haXOjj4QTT70pPHvBKcKtVoxJ+gTnx5+
 ngcV7j6HOJLMqBYjQ0q58F3+QaIBkj6bIJlFh3kUk3s+FPn2i4toUG+LOLyj4NWUL6vuxmIWx7F
 OcGdb5MNbiC4vvqu5GQ==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a07028a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: O-aiuW_7BQ_a39YcHPsKnGlFe8I2-mS4
X-Proofpoint-ORIG-GUID: O-aiuW_7BQ_a39YcHPsKnGlFe8I2-mS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..8d6ea857634b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1

