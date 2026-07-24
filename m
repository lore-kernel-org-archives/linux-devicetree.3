Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A2F40BCB0
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888208; cv=none; b=ItG5tKvLRBK2Fx9mnpveNIT3VKxxwJuxEnUpaP9Nj/XHHLehzM7yrtrExmqaljMuYPu9oxK+lClUtnc00HEDJQz4jPCcksnyY0AoicMUP6ebqOH1heTdWg+iW45n6QfYuBiZDQ6KWVmLeKbdLYoTReczUqgreBtDG9yDEIBjBwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888208; c=relaxed/simple;
	bh=sxOC8xu4+m1gOg7xJPQ7uKnbuitLxFxJAsNfgIHFSKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JnqalyZy92DMIiO2qhqceGETZlvkWB7rz891XDqyNZ3+6uvpH74HT9+FpWou4QVvIJADt/dqs0QWBH09G7wC3QJyHfXToIdbQuL7NLtFWNEb4I1203F025XCXhbGjcx+CH/r6V1UqS2Y/C7jgJi4ElvJpiTLtaAx0v6Un+JMv8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn2ANeXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUSU+3J7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn2ANeXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUSU+3J7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAEQjB2853491
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WolrlPqd9kvmQiEssFeO4Ma7OHOVLQ26gMY9vH5kuMA=; b=bn2ANeXhwQ3Gk1Cm
	+UEVMCHKjNgzfkgzMxOijFnIgV0uAWKyc+6AYEkhde0q0eycLoApgFTxa13vcKl8
	vXTOmfu//oW9aJMEcyGIBLLjECW+CLOziTNeMgSzZwhQ3ZS7oMmorfaQMaw0qQeM
	atlPVcurO+qgGjc8B3r/22NuGvTNLEfBx8jaTE6qi1P8tXUDXPIksd7tBgyq9QFo
	dQDrACKD/ov1/YyDP9646uqZAwbF+rq0rA4n/70CZxRz2NQSE8FBpSeyGO1SHrMV
	RRaYYaRgu0Nw4Cs+JLeXVJvkjRMFiKxoaL5XkWjo+lEg/oGZGspPyneBoTi+FJzO
	BDYppQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahtfx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:16:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso366081a91.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888205; x=1785493005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WolrlPqd9kvmQiEssFeO4Ma7OHOVLQ26gMY9vH5kuMA=;
        b=aUSU+3J7JOwzGRYCaVCJe9AkD3AO1ghQc1ZJcdSXOuMzVxpKBN+TFpg3yYsMh1SUNm
         J1aIT5CQMhlSY7M3YW2aDD8S/gi7HySW+gDyAhv1MxsY1iG4PxAogguKwvzqBG8iB32a
         bMJJrdfjYREDX9FDO1VmuJ+7olsbfmSkEq+hqGZz1m9yYeDpQOKaM7EBA65cBQgELnFM
         gQKa9BHvup8LPOSJ9g5uaXmcq3BVipYR4w3iMjVNtCPVjaaQu4oE09cvNGpcaP4RY9Yz
         qSr/8QGxNtFWVFlEkfjxR3Vupth5o0w1J4svMLHCXbj0ZiXlAlXQxKWLf1tSbX93Jz3s
         1WYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888205; x=1785493005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WolrlPqd9kvmQiEssFeO4Ma7OHOVLQ26gMY9vH5kuMA=;
        b=RFs/qHGbIn2DAgXQwbh+zpQccDOAbU9EOYWTogERqldMS5e0rHwhyb7kX6DSGFLFOI
         SDvsWObz73Oxyi4cKSGQ3l0JKIE3ufQrz2WeaP7ZQ0aB0WKGpr1gcV4jCbBC7IfeWbWp
         YcYv1DfrrNtvYD0k8IDXen/GFrPfj7ofwn3rO+X6ZorJYMbi0Ql+iOF7v0azIkqgU6N5
         L/vekRbmCrybzEuKisbXZ0C8dddPNjcmmseKA4OZh/mCyP/wY5s10/zwk02sR5FOxYJJ
         /UzeoEYGifZ+wX4M50ykKN6HFgHITDOoNwegNMW1FYoRAp5/wYAc4kO+MgdUE5ORXWxP
         vM1w==
X-Forwarded-Encrypted: i=1; AHgh+Rrj3e2nPe+OSdq2ZDOWCr5pGk481giqnaSnxfVSVSm1/nvmjSbYZJ7aZuuL6GbZcs02F2U4KqRyvwcl@vger.kernel.org
X-Gm-Message-State: AOJu0YxIcos8I7V82LbyBa8t/VeY0NEhRhDMZ87nghrldJCsi61+XM4x
	nBpHC/2cYHuNvwjTzn0jUfhNjtu1NF/hCr+S2FYBAya9QpUQ4XYNySjxs4EVwFCQcoTdaDVGTtG
	eZY26e0iP0k8xWff78Q6wiUzncE6a6n9gyvhLgmolO6iIschi1YKRhQTn9Rhbb2zk
X-Gm-Gg: AR+sD121Q4QlbcqkF6QCCz8y4G10n8x7tLFZe6GxtndMSE9LuAqHheOnRT7yRQXW9pA
	0vNsz7QYrYq4t+L7M/tryQROI5NidM/COclpjCjvz5o1SlHGF+ku/3qmxtxtsiDkkYYtknWPN7j
	Rq1oRUNYgr2PjEl8eg7WcfVS7FJFJRB6SKJ5FuqO8BYO8OjcUIdypsfWszRw6IJtfyH2ZrQmLGp
	gEhg+o8vPz0S4gfl0ZGEHh3dHQteLxMfFB3tXfQ9ks06L1WbB/Jbh+p6hH+z/FUc2jq+JwylvcI
	tdyIF/ua2rHZ26bQZSCi2eBHGhK9+eQJgf2ep/SywKQ/ncoURVENvljMkeT32mn26nNkU4goJVE
	w+iqmHL7hUAO3FXDCZpwqJne+t8Rla6ljCQhNgg0sf+8LMp11P7w8v4+pnFY2QnU=
X-Received: by 2002:a17:90b:50:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38ec64958fcmr7225493a91.7.1784888204996;
        Fri, 24 Jul 2026 03:16:44 -0700 (PDT)
X-Received: by 2002:a17:90b:50:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38ec64958fcmr7225457a91.7.1784888204563;
        Fri, 24 Jul 2026 03:16:44 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041b8be9sm1222644a91.14.2026.07.24.03.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:16:44 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 18:16:11 +0800
Subject: [PATCH v6 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-add-coresight-nodes-for-shikra-v6-1-8b0d7300be41@oss.qualcomm.com>
References: <20260724-add-coresight-nodes-for-shikra-v6-0-8b0d7300be41@oss.qualcomm.com>
In-Reply-To: <20260724-add-coresight-nodes-for-shikra-v6-0-8b0d7300be41@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784888190; l=1029;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=sxOC8xu4+m1gOg7xJPQ7uKnbuitLxFxJAsNfgIHFSKs=;
 b=BYz9ywskpOAB/O9fwTJzkLchmrShVsip0YeJ6w5YWNgAwJkz+4UoY9wyiQMutKruxYFKxp8er
 kyCYMg/Y5uFCKyrpe1WVLEuM/ZrnsNR8da+yvCDg2dZXcD/H5P8Mh5D
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX/aOXAlSruYve
 mLKdNJB/Vki/WYk7vW6r4A/2e5AG8qp6RGaYaNH33+Nh+AkibOLWNRqObVZh3kwTntTX3UZ4sBp
 Lv45oSSJKy/o5ZfNmWWZxrtykTnfiLU=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a633b8e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ILLKxz7CyoOsuA973zsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: F2kV0MkelX5ywTfIbTOyG3z5y0ekkdJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX2lJtUHpcoVj6
 QkIcBZcszbckBFYXCCbHT6RyrfUz62kZZzycduIqdsHGmKdA8guce+LFxLdKmDaKospjqx9Z0b9
 FjUBa6H3/fQ4VBAWgS2IWU43Zj4wkIXf+Yuh2lxKCCCxDvezvytJPhPvdC07YEElPlISGtbiOHp
 dbgaXxyl+XamKuZPV9NYc1SpeZvMOn7rn4epJ50ToRWwCsCqjBHS6Wod6hTX4Qx1198CAQCQFTE
 bEFAl9rfvyx7R+RpM0Wty9cN9ouonWRxb+QP+6fYJOH/ecuAibxBeYIfowkPbKLoaFESYOhPiE/
 D6cpifHBwhmTM9hNUhBkek34MenlvM4gD/F19KbH4A7gqUhNK5ympUB0azOiplehjnE3B22DZG7
 vbEs0S2b1/EqksZmGw/h4MjJuRAamnvmyGNVf4sj3UOkKNV+P0Wafd2VGu+PZnU6t5jcZsk4oFA
 MQSnOFSaBV8QJDnBPEw==
X-Proofpoint-ORIG-GUID: F2kV0MkelX5ywTfIbTOyG3z5y0ekkdJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240093

The CTCU device for the Shikra shares the same configurations as
SA8775p. Add a fallback to enable the CTCU for the Shikra to utilize
the compatible of the SA8775p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1

