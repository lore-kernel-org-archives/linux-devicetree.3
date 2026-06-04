Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7697023BD1D
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 01:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536808; cv=none; b=CJIR0p2XKPDipE+3cAb/+h8W4PCAG/aHwD0GIqAOE5vu84uLP8ExhCXaRkjs0wTQ1bmWx3R6lh4fM/WOnyhXvTZLFVxkcnTFOubjKI1pjXTWlFJUH2OTcODKYJBYLyuxPiFyzAlMUpc8xlVE40Ns/OWhRRKeF6VtRBGZwNOm7/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536808; c=relaxed/simple;
	bh=6HzWQm13sZymkwJ60yMD4i13qBHluKrBXZyYiKMTzmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OQHWwmh7otQ/lyNKscai5ddDeXXwofKOsIHDIAcjzs/MjKjIL3iaRIFet3s2VgKVCVaClc34kRFWsErizai7cxyx/7bwxlOK3+g77FsJfocbx0MRriF3cHoCRqlSNe9O4APad1cjQUuLYdtyeuYIiRFvHl139vHYp8RhahJciJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlHZX6AP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avXon6yz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlHZX6AP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avXon6yz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540ntek313660
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 01:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=; b=jlHZX6APGVIZkiZ2
	byW6d4aSVzXS7wZdn/u0ag/wZUdaqSJ2X/alNRw90aAYMu1DkuJdX0T9sdLf5HGN
	jHNgN7UfJUqwlRfAZwd/YojTt6YzbbZgTZ6uZDM6qQiW9hiYVAk2BtngzkofmE6x
	igbqq7mmuSXU2akJalRl+EDdrkBttTPQOQNvsTqv8vuehXLK/eGwQIx8MeYVH43+
	YsKtuuTtcjHF8F/KA+aqc3GwNZ6Xc95jaLpFtfA7863ZBgmfoeEpfROPMKmTGHd2
	UQp3nbCc11j9Yx9E8y9Qg7fX/pZMM46SGEL9yZCWjaoa8C1ObktXnVzFuqtcVJ5C
	eqxWpg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v03uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:33:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304e7fc90b1so88776eec.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536805; x=1781141605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=;
        b=avXon6yzzVH9v7tlkmJyhLVc37jUOi2wBvWHiTW1hVIWgStGrRPiM20oDsQpei3FQf
         2jG07Cn2GrBM9vNXnAhIBj+1Gg7dP8Y+bk5BMsw2Gq6g8r430qGbI0AIN7wXKG2CK50y
         wokPyWcJjuzMl+3ljuB6K4/PoW97x4l1dfhxPTZCxJ5xENsMmOIhUICpeoTybmVE9MpQ
         PWKXcZYMDqnGsjkKru13AZzdyI0QVjThuPN6fF+xfUUu6YavN7cDbW6DL7Y5HYmXrCia
         PobSjhG+gGZxEZtWaTP1VOLxOeSUn9yHe8qAyP/moUF6eY5Zp7FWXrEPvrUeNImZ8L1K
         /c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536805; x=1781141605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=;
        b=ZH8kUkBoi7A4YIu1Q8X61tZle7QuYcE2IBDngpDT6zZMqs7KIKgK+unXOHxamibSPE
         VfzIhjGfF5bfgLViEMMRWHRubL/npiGxsBX0zUkmszJzTk34rsOV+czHbydWGhdIlux2
         2j8JFDFGb+gTHEAdvHjp3zMB+wb9bnPrQzVpqHinwegu+MuWRavF2sxJfh3YVMPCTEcv
         BSKqzEVRA0sEhzjavr3RuJS88kKbHbF1irskcvQ3g2k2rRWs1CPRBxRXLxaW8Zrc9U9z
         4d6ckK6ZyXcbZyXvJpgLJHTkrQ8ROnCrDg/3KGgq98XCTi0MqWB6ZK1rGmU7NI4zOMdN
         lMkA==
X-Forwarded-Encrypted: i=1; AFNElJ8rkwd4cyf0yBuzT6LYRD4TbeTb88DUN+lDXxiHGMs6inUd6a8i1X0tsNHUNBQdb4euBY0ea7t1Q4Xh@vger.kernel.org
X-Gm-Message-State: AOJu0YytPXoPs/hA9zMky335Zvro8nGMnM0vghmu96L59G5y9avfrApr
	+LIpbPuuZG64Cucl75m4pAkz8Wi3pvIzeJkIIZqzyh6yZCTz2Y06aKOWpWLG1xm7TcpyKLs5RU4
	tK7/0odboLkWPjicvtjHztyZByVU+dj2qcwVQEAO+GK6AkyI8xKdMuytMxuxJ8+28
X-Gm-Gg: Acq92OENl3Cq4AIZujL5H2DHQgq5JUd9lFYDbCi4aeDmISKGnsWafEFrMVFr6xyJnU+
	nMLyaxreXZYyQ+Q75AFNvqfpJ0KOWfiPo/uWDBPoSe1cD7ohUm1zUBdXNHDOr+EuvkRjQAd2+b/
	FNUkFsxdsDXgFWV9Z47Q+gMQcIaMVm1PLNmeNmIAxp9JeVeMFR9lnIhXwo3zWPd4UGSm4GX4YT6
	yor36GZsRzBc8XJZ1Nyr0N16Fm7ufRW2lLjRD/1wg4ON4yHw/tCLfLDgZ0LQmjSAgMVO48O/A3c
	O63XULXBJ1bEJw+Qgy5W/CQsvyS2PZC8HjK9fLXNAffv6BTHKQXV5oTevddUUXd/REMx/qk7Fgp
	oCwv/d9JJGYBjDavqsmRKc4Zd5Rrx/AMvESyKNgSAA+/j78IHg43K7hJQZybxcZBQmUpm2Q==
X-Received: by 2002:a05:701b:4250:20b0:136:9ebf:3be7 with SMTP id a92af1059eb24-137f6bf3f03mr1707920c88.26.1780536805557;
        Wed, 03 Jun 2026 18:33:25 -0700 (PDT)
X-Received: by 2002:a05:701b:4250:20b0:136:9ebf:3be7 with SMTP id a92af1059eb24-137f6bf3f03mr1707913c88.26.1780536805012;
        Wed, 03 Jun 2026 18:33:25 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:23 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:32:55 +0000
Subject: [PATCH v2 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Hawi compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-1-be908d3560db@oss.qualcomm.com>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
In-Reply-To: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=1854;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=6HzWQm13sZymkwJ60yMD4i13qBHluKrBXZyYiKMTzmE=;
 b=fJcfCbPxirPTf5QaSo6sHsbagcLFq37fKcd+C/Qbvt8EKyrKbKkj6cfd0/OabdC9BYJV7LPV8
 nnKwSZPqT40BcKp6qh8aZwqCqaIrYmgVnSPvhyJn/Lwty5iL8wjB6Cl
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX5IYPsCV8iEnE
 0sQ+/RyB465RWTSEY5qGfL9x9GJbe7FIq6iF5kxHOg7yEAA9p4VLR5+GYwm3rJfWXIw9EAM45Cz
 KMibVmq+jir/Q2qGFucnfhnBubS7gD19RTeSK3W1zoi8LHOe08lLLA+fspDeHtr4/aMfiiYYhRk
 O19ibxNldpjHme+TlvTJS4/fuaK2IUsYtcRJ7kh9OMx+PGgN2m70yGD21PkiEcF+1vWlWFz/+v0
 UPbRN5bOj9nHsNKbigcbO+GQ1DZ8d8dTxSrvb0EJ0mY9YwlOJcbc3dT25n0xUscVOaysa3Is1FH
 f0jxpE4a9aZcbsLISgtLSvLY1CmdpKc5/BB0Ai3gRUFuhHEZ/LWfqHWqKGAx7fa17SEoKb5t+Ic
 9lZrXaIsywmTQ5Dwme3MbgIViZdchm0co8+7GeuseTfN4ZbL1R4IaUSnF0668oCEiTAR/DJmCoz
 hM0mrbVes66dprF79qg==
X-Proofpoint-ORIG-GUID: 30cP6CjHdW2oOxCB0VeYHbglNyWUmSM7
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a20d5e6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZPVUbJor9CvCRQEu2k8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 30cP6CjHdW2oOxCB0VeYHbglNyWUmSM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012

Document the compatibles for the Gen3 x2 and Gen4 x1 QMP PCIe PHYs found
on the Hawi platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..9e9e34a63bef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,6 +18,8 @@ properties:
     enum:
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,hawi-qmp-gen3x2-pcie-phy
+      - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -183,6 +185,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -208,6 +212,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy

-- 
2.34.1

