Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA96395D93
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293822; cv=none; b=YvJfO2/qvFz7WPkIG5IqrGAoP6oajWogWdExSZbjJuVkaFEVo1J7M4m1+IKWRPTzzzpb3Iq+3opl8IB2876KBStqPhaCn6+7Vm4dKrgh69EtlpJ4mEHzRA5wR0biO39Hg0iIfNIEMw+MD0RB+ItR/x1jGho4Ya0gV/levZ7kO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293822; c=relaxed/simple;
	bh=Uu3oOZCFpOkoRkWDCmeRJuWQmbRRzDt+qO6HK9jjmUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CoDaCvPbtfdVW0pHB4xbFmNRHk2THTBnyHSGHuhRMU4YnmBp5MN9sSYAA+y210KFNvDTc9KHrfVVNnXU71D1DWoLemO00u5kCFIQU5kJpWV0PdgN2nl7N4oJ7n0EPYCltb/fdpt0WIS7aXPxAfmMAqe/cXLIbiAJ90MwWFzCrvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyn0JPZN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCWqPu4I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyn0JPZN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCWqPu4I"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqYKm3170682
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J81P5PpnsAK9w1ViBj5JlBbWqS27TtH4xIiDSltbgSw=; b=iyn0JPZNp3cNpVja
	uSQSs+gZnZxljgPTRHLr/307NWc25oHg0ByYMCJsP5gY4oSdHFCooqvDS/Iy2eaL
	bxUFa614FhhDPdbHmhrsF0AdTYaCa+R3Xe6YMM75Eis8sgnfcnG9c57cwF2H3Eg7
	zuCsPUswRmQAuxLl1gT/XCvLIqdI/OvXiXtei58LON1LGmPxpv8TKe3aEG0++ZBa
	y4pq8GDYCLT+OfamwltS9rFFZlAZf9a8mXaEB0V2klAaTFr/k+30JfkhPW4Y3gUE
	5ykGT/wZb3n3RNTj2LLnEkg9c5/Ww6wDyhZFREGS8NWEYnffSMAHKsB5+pEo8S02
	SMM8SQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r21e8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094ba09affso26144921cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293820; x=1774898620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J81P5PpnsAK9w1ViBj5JlBbWqS27TtH4xIiDSltbgSw=;
        b=jCWqPu4IE1BuJZXtiL9Kdof/YghgQ6tnxfZr9trbFIQEnOy9bf2soJAwIJazybAWXY
         MgMjuRyCqRxcrHglx6DrHCxOsTQtPukJ4J0cSMQ5dhxqBJr0VNGIEi8RPKtb0oB3Yf/I
         ++q/IZFA/qJL4VfSxPV1VhLF6ZOeTAKVNIlxyZTaNHjO9UqSxjLGe20Hs9be4M7wirkr
         yWeQcUawF/6+Ix8LFJE/Tc0XggGU9+TNpASKeu2h8K4kNwq3UQ2cS4Cyv5yoMtV5MM+S
         tMkhi7Fkja5MI7GLkB7IlOK3nHhbExZG7HN1yf8+nJEVgZ1KtF4/t0F2G5fmCl/ZXCL3
         fmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293820; x=1774898620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J81P5PpnsAK9w1ViBj5JlBbWqS27TtH4xIiDSltbgSw=;
        b=l+I2BOS4Cnta4Vy4xZQ/XSJkR1bXfDa12MquJxpBe+meeWb3ky4l2zi3R9mw9Y1425
         IU26nV9ewv55sV2DNgXGoSb3ZQccNkbXksYPSjZsZUSLJlwseCyEv3tG+Uiu0rc1V1a/
         TJPDHk00YiIEnjelOI0qdvYkVTRnBfrdlW64NvTqEwzVCptu5O9903O/j+qyQbcu7L3G
         IGJscw46K2ghxjce7iIkLiR4G7BU91mG3NJyBOwWk5Gs/Vij4SCxqilfCU/Y8G5RzokV
         cTnaop4cB0I/UQrwb64J9aJIetZWVvmZWRULNPubPo1h+eOqI2ZO3mLSY7m02Jt8fk3e
         Ceyg==
X-Forwarded-Encrypted: i=1; AJvYcCWb/zMW2m1pIbfAZ4ajLa6j6vjJSMksWVIpRLx8+t067AtLjQDBhKYq8e6ZdvYEMnnBT1fU30hb1ofz@vger.kernel.org
X-Gm-Message-State: AOJu0YytNuSw1no4nQAu7uLJwgTrJtmo62as1kI9gNCyfcHTGboJCg+O
	Wc+suhVOD2iUDXWIsq1wjFKi4N1DPcYeIlIwy44lArjdsNwQzzVFjE1sKHlZa6gsLNNLaLMrj/Q
	PPVD9PmO+25If93YHCs8g4qN7gnlp4IPY8KFZjE+Tf/CFej/n+3GzmZN6/TvoDwkA
X-Gm-Gg: ATEYQzxt7pXn3DpVLj7726h/z+vHXz2a94TRPqGPuP7PjnXQBgEc9QExr+Xcbqb682K
	3y9akEQ364i3ZYM3GsEHfN5PeG7gftlyW5xanDcsuU7CO+ZYQh8lu4VmUMWTsYTkdAFpGsEiX8c
	xPhIXEGzcic1hk5g97Mj6R8in7K/zBEzQDrDAHlqtt/AEGpBZ4SNsp/J+wcIV+w2fsUrdTXIaIs
	lIxDB4FyTuoBEexu8+vgcr1V897ADXIlYDzH6IxUcRoB5byJDuR3C6grba0tMBwaOzy9Bil2xNk
	rsghnqOcLl0zvmF2k2AqS7SX/u4d5G7PS5X8reD3FzFbYgofYfCG6iwoKTqbPkGOUvnip7TGtK1
	q9D7tPDYqjWsK/6J4DDswbbG/P18=
X-Received: by 2002:ac8:5dd4:0:b0:50b:3e14:47f9 with SMTP id d75a77b69052e-50b3e1449e7mr183022461cf.18.1774293819398;
        Mon, 23 Mar 2026 12:23:39 -0700 (PDT)
X-Received: by 2002:ac8:5dd4:0:b0:50b:3e14:47f9 with SMTP id d75a77b69052e-50b3e1449e7mr183021921cf.18.1774293818788;
        Mon, 23 Mar 2026 12:23:38 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644acb52sm33388113f8f.7.2026.03.23.12.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:23:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:23:26 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add missing msi-parent for
 UFS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-eliza-base-dt-fixes-v2-3-59af0627b7c2@oss.qualcomm.com>
References: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
In-Reply-To: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=929;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uu3oOZCFpOkoRkWDCmeRJuWQmbRRzDt+qO6HK9jjmUw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwZMxFPh1rwtE6LafTqJsnxSuXD1WMoUGnbv3b
 Bi5WbgbRp+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacGTMQAKCRAbX0TJAJUV
 VjzOEAC1VEm6Sg7d+2z278NDj+sFlA4JFNH8Lym1N0kgoERcqvPnH2SGJoRSSVPjDZXZjqPxMRw
 HBbB3wP5oM/n7YdWAn44+TAFchEHXpUTjPOZGmOZQjOjmem4FivnC8vyzezWhRSLNbMlDI1RzOe
 vIo14Z6dNQreOsn1QACev3Hf5ZOA6/skLPrZJf9HzVaXYi2Ot1aLigkvygqAho9lLWNkUGKsai6
 KrqpqWHuKyJqhy55EKKrESS2blrT5NoUMUxP7P8p8STslvH0WB0E3tHMZmdC156k0wUvgK5By/V
 B1soCznOBhhZWljcPm5j7/Wa4mn38oZJnHCMCVDtqqK5JHvJnaSpRc2iscFbxHeaIhkvqkT7ha6
 wsn+OTol+G931kZKdszkCZjuGtcNvlq4UQovYy3YNNtc1hiHH8GIPnAMBjiRE31drexe/J9dE/F
 3V8ZPkuCE7YJqPUtDrOq+s9s+jevgq3+BSLutTtmm/q0GsTehSbR591fa7T7Q9MTKUP2SNTDEkT
 JybhGwvk/Yo7Jr7otx+DTC6VTrw8LY27/Z5SuoeDL6PQ97GHyjZEyD8hunf1+6K7bPuRR7cFj1f
 QL1f9nidjE+vimW1LCjv006dXLHyUoypjbfr43ZRAjsuIM0KzcVl+YN7BmThW+NwUeFrhE9GcXL
 Y4at8QllT/x666A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1933c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tos59dM9S382luaoVoIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: oKLGCb3pvXZhKe7TTIbVYlMlztjeKLt9
X-Proofpoint-ORIG-GUID: oKLGCb3pvXZhKe7TTIbVYlMlztjeKLt9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MyBTYWx0ZWRfX+1z5OmyuunP5
 lHSdGdyoKHQ0ih7cbS9B7tbHPus/BjowXeiX7dvnKqmD8AAacMterAlgVTg/LYGZCkv6thJeiAb
 lYnvprrAH2T+9Httgvh8E4Vlkdy/tJXof6j3yKXNPHrp6LPBni6ZiZpXhlJgek1ucovQvSfa9tw
 9N7raEsLFcO4XUIq/WsB9/4/iwF9Mbdm26yCJuZT5/D6v4OFtUSt7ZMwf1+7M4eZGAGZri114qs
 GIcbuQ8S0YIt84rvEA7ZUdKqEOQbTqG5WRylsm1SzgKuHeCzJn3Kdkhq1x6tinUSo0HaD4NNHsG
 ylUK+7G7tfiREpUlqCm0zQrVU2BBGrfvyoX3FY0fl51UQX3e1RdxFEEmNQ73NP8nfZDH15N8MRk
 HXaajknKWtb7eM+8IE2yBH6PAYdzNRXtz1ifIHLn+wGj9dLwv9O+ZnVeIZutxGxnUsBVa53SHcY
 AyUrQVaVsLlY4Vdogxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230143

Wire up the UFS controller to the GIC ITS by specifying the
msi-parent property. The UFS host uses MSI and requires a valid
ITS mapping in order to allocate and receive interrupts.

Add the ITS reference along with the device ID to match the SMMU
stream ID.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index fab603cd8e42..62fccb43a7e8 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -785,6 +785,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			iommus = <&apps_smmu 0x60 0x0>;
 			dma-coherent;
 
+			msi-parent = <&gic_its 0x60>;
+
 			lanes-per-direction = <2>;
 			qcom,ice = <&ice>;
 

-- 
2.48.1

