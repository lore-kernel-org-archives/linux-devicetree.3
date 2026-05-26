Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6144028F6
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806554; cv=none; b=GPkSPUfjEHUyj24XGv55VIDX2w6B/A9BCXqrL1kNnpJzTb/KUlcDn9ucU483hU2CCBQmr30nqMUxiXnmUmyoF4iY+bBYGsmcL6jX+waAzWsaqiedYG3FkeWuwtutYx09cF8qOB0xH0Bntkvd64zS5+BWiIX7s6WP+AYSR9f0TQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806554; c=relaxed/simple;
	bh=7CPjDV3gT347BVwRIdRiO+KfIxW2/766GVcN3yxQ6iA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eoypoStvDi5pfSMP1It0kok77HQrPHz+bp0XQLWDPAQ4J20KUkV/xnsBGEsbu9aQu6yLcCkqHPjZgFA2cHr93npXdMNlj9js4ai1GAQI7ZG6tT6mdcAIOmxynRQzZBWiw487sIk0aqvpOg0KtFNhe4rBzdX2uNaSAYmEOyh2kLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3DrVQ8k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUT+wx49; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3DrVQ8k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUT+wx49"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QDFiJi2437640
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dYBJoUSY2tXC4JkVJCKKmh/DGRM73qQJsyU7sSPqj0k=; b=d3DrVQ8kibecECdq
	5e8AI8zdo2z49Yhp3ixD41bW5GK89MCHb7kbrptCsrcIp+1YpGJ0Gs0+7DvYhrEw
	Hl7KSKUlnqf1HnMNcmHEpOnowuvc335bffuhItaxn117uNjFupmtrNeuvLiUcB+M
	wk/TETWCa0Mg/mkZEpM0qaD4yhukAdCx59cfIRSsRpeVE//c42S2ZhzWN6Jv98AO
	gJRd7VkcbJcmJtsqwo2fLaR1awMJODS8CXXyRQKqJ4pHxLsqPPU57GwvOYSXWl+O
	HC74Pl69Zil8WBBaRFLYiIDTzV0XqJ7+hf3IlZi4Rjc3C4ggxG80mL9Nz6EFtIG8
	9VNiGw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs59an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso6315383b3a.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806550; x=1780411350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYBJoUSY2tXC4JkVJCKKmh/DGRM73qQJsyU7sSPqj0k=;
        b=cUT+wx49i0C2x61P0i6ICZwWyM+2mpzDWQevXjpGvFegF5SzrF2mxwgVBZMUb9ybPc
         vKWnAy50oWMlWN9+6DzLu7Lm8dlvFdkF+0PjR/q0bxwTS+pvuexD/fdomGhNx9ybPN03
         6XvnfbhzFLPLPwHAuFMgM49Z/DWwnWuyehLRnBKNhJcaYGZBD4C3QGsmvTfujXT1MKZx
         gE/5Ai4wYitFfI/T3WClx3yUObmoG9+sn9C5NqEHqolCuUfgjBYBHssPTfeNNO2qRGIZ
         oYUkJUmjzSjpMOp4tHy935swt98SeL5ghsl40BkJr7ZiSvuW6uO4PF4ghBVXvnBLhbbt
         EQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806550; x=1780411350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dYBJoUSY2tXC4JkVJCKKmh/DGRM73qQJsyU7sSPqj0k=;
        b=OB9KcTsu+RwCLbVqAQStb4AnmrPHyGeCpbCMaL2hIAJWk94lehHoyH3GbCz0U5aJxD
         qSxtvV6VpsShufEK8GtIeZ/xFe0iOLvtY3MvfvetJoFLXldk0xEA/emHr7pQC0xMr8Oo
         T00DddCx4ocIfnR/uEiSnCIMsLT0rLNAbZoP8XfpZj3gnYzwfRXJK5hiF7bUE8D2LtcY
         81wTaWFtOaKb893NBMVevTnDQadMEhxCb5pRGKUGth+8RrIkG6leBlpUdshqEXK3jW5r
         7GjLmcgUKqLMr16x06ZR3XwO2ry2rAVofmE7l2H9w+zYSuvtwyyFAkgnTQ2QeWUtjXZ2
         XRpg==
X-Forwarded-Encrypted: i=1; AFNElJ8gbRLIYo+eZIJjkwdy92KcUJ6poqETz+H26H8sBI4DMwqRi8vLsPU9/3Z7R73YINPVaia6C22Y8e+7@vger.kernel.org
X-Gm-Message-State: AOJu0YzHiC6C8pH0Jsasz5Y3na9tiwA0GAivHI9S37spW77UYHLSzcR5
	ZCRzWenrAS0v9qQPoS/SrmSYW2Em8+eXEBE+05+Fm32ucL2W71qiduN2n77LUCZ4HKCJ/iZLrxU
	jodqVG6f2e54rt40gJ42DHI4WbBSsQ7n0DGio7oYQl6GDP5DVY9trAh0edokF3iqj/spc4+J3
X-Gm-Gg: Acq92OE0UueTfGWRQA8Y6yXoC+HH22pAoaxDLSCusT74YuDCh6i1S01sTV51FsBF5Z0
	1RnYpvArEqF01+YRw4cs1L4XfSrcVyx1YWeCy3wBmferrp+ooj7tlgk4c0CgZ9Lmf+hQzbWlkq6
	9CE+pBQ5fGrbDvFeGyLuDT8bYj8W/TjIOmjUp08tZ3y93MtGq4CbYmQaM0ylCMN1TJf3GQ2dp0c
	Sck94DwGmLz1SGTBUSBMlLKov7nArEBX8IO/tATTRqwPR6rlhaB5ZSZcA8vo2DWhN72VrvEjp9Y
	dP0p4d1ZxIy6s9srY4neQHsytFFCSww51amapZAYmRUQt3AZ1VEzZZ1nsSDZ8J4Yggi4bU7y/MP
	53SauNjQxORTg6EQobUGteNzx8qAVTDw5H+d7+wfRlmGKRIsXF63R
X-Received: by 2002:a05:6a00:b486:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-8415f158b74mr16699458b3a.15.1779806549975;
        Tue, 26 May 2026 07:42:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:b486:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-8415f158b74mr16699430b3a.15.1779806549485;
        Tue, 26 May 2026 07:42:29 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:29 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:05 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: lemans: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-4-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1122;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=7CPjDV3gT347BVwRIdRiO+KfIxW2/766GVcN3yxQ6iA=;
 b=A/MmI4Ssrmi7OC54VaSN6M7oYxKCp7bADQdsPSx5UgsPBDQc5G12sWOGN7601WKlO+UYo08og
 Ad8Nd/5nmSyDIpYtetjAHcaFmeiSUGJK2WBXQkcB8NlOSmxjTTSqPgT
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a15b156 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: yZpclQFoiZtyRWgfnaQMqkLEMKa650wM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX7MFZ2CNOPWqn
 EA565intLZixtWg8hEPyE+X4vASAC3LdLinSfLL5xyA9QDAngy4SiFKSPZ3Fb4N9hLzR6xFfGGf
 CljhD+oy0vnXDY6vwcntO0HnZJypVAPSSDaja0CZUxqCuOpMQWX+eXp1Oaj2fdmn1nTFQ+76oIw
 JuizGVE8vZMR9RJqQs9k8pKAhVO0e5La8ZsC9p9pH4VccxQj6mdzV/9lOKggW7+BUtyQPuQrS6W
 T7Hv6EiZXBV4+JiSrmXdWC+YnnMlFIGG38q1/BGgcg8EZMnAjRw8JmSgLL3rVhrUTyIAgEGhC4r
 cUXAnHKDn4BMLxrHpwLAebmTWPwAXQTCbWEjBTM7/p3tDL2w715GxB33QkqbGBaiHKTLNxy88ao
 8LLqwDUhPHag9UpnNiKehsX+YfuwnnSMIbXlqU5yTJVfdA7Ng+3HDDdxh+SsAF8/ekiLjxIgX9l
 DEBJtmGOICIRW6YRCkw==
X-Proofpoint-ORIG-GUID: yZpclQFoiZtyRWgfnaQMqkLEMKa650wM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 522ba43836a2425a8612506f5f7113f291f34706..ac9f529d2719105609d997874a6319c7d04e1655 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4796,6 +4796,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		serdes0: phy@8901000 {

-- 
2.34.1

